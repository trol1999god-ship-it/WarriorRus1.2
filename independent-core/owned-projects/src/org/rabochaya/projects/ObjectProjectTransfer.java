package org.rabochaya.projects;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.w3c.dom.*;

/** Builds a local transfer from the selected objects and their document dependencies. */
final class ObjectProjectTransfer {
 private static final Pattern HTML_LINK = Pattern.compile(
   "(?i)\\b(?:href|src)\\s*=\\s*(?:\"([^\"]*)\"|'([^']*)'|([^\\s>]+))");
 private static final String XML = "http://www.w3.org/XML/1998/namespace";

 private final KmlProject source, destination;
 private final String sourceDirectory, destinationDirectory;
 private final Map<String, Integer> sourceIds = new HashMap<>();
 private final Map<String, Element> originals = new HashMap<>();
 private final Set<String> included = new HashSet<>(), references = new LinkedHashSet<>();
 private final Map<String, byte[]> files = new LinkedHashMap<>();

 private ObjectProjectTransfer(KmlProject source, KmlProject destination) throws IOException {
  this.source = source;
  this.destination = destination;
  sourceDirectory = directory(source.entry);
  destinationDirectory = directory(destination.entry);
 }

 static void append(KmlProject source, KmlProject destination, List<String> keys,
                    String sourceToken, String targetKey) throws IOException {
  new ObjectProjectTransfer(source, destination).append(keys, sourceToken, targetKey);
 }

 private void append(List<String> keys, String token, String targetKey) throws IOException {
  Element sourceRoot = source.root(), destinationRoot = destination.root();
  Element target = ObjectTree.resolve(destinationRoot, targetKey);
  if (!ObjectTree.container(target)) throw new IllegalArgumentException("Выберите папку назначения");
  verifyBase(target);
  Element originalRoot = sourceRoot.getOwnerDocument().getDocumentElement();
  ObjectTree.countIds(originalRoot, sourceIds, 0);
  NodeList nodes = originalRoot.getElementsByTagName("*");
  index(originalRoot);
  for (int i = 0; i < nodes.getLength(); i++) index((Element) nodes.item(i));

  List<Element> items = new ArrayList<>(), styles = new ArrayList<>();
  for (String key : ObjectTree.selection(sourceRoot, keys, token)) {
   Element item = ObjectTree.resolve(sourceRoot, key);
   verifyBase(item);
   items.add(item);
   scan(item, 0);
  }
  Set<String> checked = new HashSet<>();
  while (checked.size() < references.size()) {
   for (String id : new ArrayList<>(references)) {
    if (!checked.add(id) || included.contains(id)) continue;
    Element dependency = originals.get(id);
    if (!Integer.valueOf(1).equals(sourceIds.get(id)) || dependency == null ||
        !(ObjectTree.is(dependency, "Style") || ObjectTree.is(dependency, "StyleMap") ||
          ObjectTree.is(dependency, "Schema"))) {
     throw new IOException("В выбранных объектах есть неподдерживаемая ссылка #" + id);
    }
    verifyBase(dependency);
    styles.add(dependency);
    scan(dependency, 0);
   }
  }

  Map<String, Integer> destinationIds = new HashMap<>();
  ObjectTree.countIds(destinationRoot.getOwnerDocument().getDocumentElement(), destinationIds, 0);
  Set<String> used = new HashSet<>(destinationIds.keySet());
  used.addAll(sourceIds.keySet());
  Map<String, String> rewritten = new HashMap<>();
  List<Element> copies = cloneInto(target, items, used, rewritten);
  List<Element> definitions = cloneInto(target, styles, used, rewritten);
  Element document = target;
  while (!ObjectTree.is(document, "Document") && document != destinationRoot) {
   document = (Element) document.getParentNode();
  }
  Node before = firstFeature(document);
  for (Element definition : definitions) {
   ObjectTree.rewrite(definition, rewritten, 0);
   // Definitions belong to the enclosing Document, not a Folder.
   document.insertBefore(definition, before);
  }
  for (Element copy : copies) {
   ObjectTree.rewrite(copy, rewritten, 0);
   target.appendChild(copy);
  }
  ObjectTree.rows(destinationRoot);
  destination.assets.putAll(files);
 }

 private List<Element> cloneInto(Element target, List<Element> originals, Set<String> used,
                                 Map<String, String> rewritten) {
  List<Element> copies = new ArrayList<>();
  for (Element node : originals) {
   Element copy = (Element) target.getOwnerDocument().importNode(node, true);
   ObjectTree.newIds(copy, sourceIds, used, rewritten, 0);
   copies.add(copy);
  }
  return copies;
 }

 private static Node firstFeature(Element document) {
  List<ObjectTree.Row> rows = ObjectTree.rows(document);
  return rows.isEmpty() ? null : rows.get(0).element;
 }

 private void index(Element element) {
  String id = element.getAttribute("id");
  if (!id.isEmpty()) originals.put(id, element);
 }

 private static void verifyBase(Element element) throws IOException {
  for (Node node = element; node instanceof Element; node = node.getParentNode()) {
   if (((Element) node).hasAttributeNS(XML, "base")) {
    throw new IOException("Перенос KML с изменённой базой ссылок не поддерживается");
   }
  }
 }

 private void scan(Element element, int depth) throws IOException {
  if (depth > 128 || element.hasAttributeNS(XML, "base")) {
   throw new IOException("Недопустимая вложенность или база ссылок в KML");
  }
  String id = element.getAttribute("id");
  if (!id.isEmpty()) included.add(id);
  if (ObjectTree.is(element, "styleUrl") || ObjectTree.is(element, "href")) {
   reference(element.getTextContent());
  }
  if (element.hasAttribute("schemaUrl")) reference(element.getAttribute("schemaUrl"));
  if (element.hasAttribute("targetId")) references.add(element.getAttribute("targetId"));
  if (element.hasAttribute("href")) reference(element.getAttribute("href"));
  if (ObjectTree.is(element, "value") && element.getParentNode() instanceof Element &&
      ((Element) element.getParentNode()).getAttribute("name").startsWith("rk-media-")) {
   reference(element.getTextContent());
  }
  if (ObjectTree.is(element, "description")) {
   Matcher matcher = HTML_LINK.matcher(element.getTextContent());
   while (matcher.find()) {
    String path = matcher.group(1) != null ? matcher.group(1) :
      matcher.group(2) != null ? matcher.group(2) : matcher.group(3);
    if (!path.startsWith("#")) reference(path.replace("&amp;", "&"));
   }
  }
  for (Node node = element.getFirstChild(); node != null; node = node.getNextSibling()) {
   if (node instanceof Element) scan((Element) node, depth + 1);
  }
 }

 private void reference(String raw) throws IOException {
  String value = raw.trim();
  if (value.isEmpty()) return;
  if (value.startsWith("#")) {
   references.add(value.substring(1));
   return;
  }
  if (value.startsWith("//") || value.matches("(?is)[a-z][a-z0-9+.-]*:.*")) {
   // Absolute addresses are preserved as text. Transfers never access them.
   return;
  }
  String path;
  try {
   path = KmlProject.safePath(URLDecoder.decode(value.split("[?#]", 2)[0].replace("+", "%2B"), "UTF-8"));
  } catch (IllegalArgumentException invalid) {
   throw new IOException("Недопустимая ссылка на файл в проекте", invalid);
  }
  byte[] data = source.assets.get(sourceDirectory + path);
  if (data == null) throw new IOException("В исходном проекте отсутствует файл «" + path + "»");
  String lower = path.toLowerCase(Locale.ROOT);
  if (lower.endsWith(".kml") || lower.endsWith(".kmz") || lower.endsWith(".dae")) {
   throw new IOException("Файл «" + path + "» содержит собственные ссылки. Перенесите его через KMZ");
  }
  String key = KmlProject.safePath(destinationDirectory + path);
  byte[] previous = destination.assets.get(key);
  if (key.equals(destination.entry) || (previous != null && !Arrays.equals(previous, data))) {
   throw new IOException("В проекте назначения уже есть другой файл «" + path + "»");
  }
  if (previous == null) files.put(key, data);
 }

 private static String directory(String entry) throws IOException {
  String path = KmlProject.safePath(entry);
  return path.substring(0, path.lastIndexOf('/') + 1);
 }
}
