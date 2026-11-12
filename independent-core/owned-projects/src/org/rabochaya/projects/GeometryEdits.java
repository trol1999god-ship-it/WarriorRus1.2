package org.rabochaya.projects;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.util.*;
import org.w3c.dom.*;

/** Changes one addressed KML coordinate element without reconstructing a feature.
 * Style, ids, media, holes, altitude modes and unsupported geometries stay in place.
 */
public final class GeometryEdits {
    private static final Charset UTF8 = Charset.forName("UTF-8");
    private GeometryEdits() {}

    public static final class Part {
        public final String key, name, type, text, token;
        public final boolean hole, polygon;
        private Part(Target target, String token) {
            key = target.key;
            name = target.name;
            type = target.type;
            text = editorText(target.coordinates.getTextContent(), type);
            this.token = token;
            hole = target.hole;
            polygon = target.polygon != null;
        }
    }
    private static final class Target {
        String key, name, type;
        Element coordinates, polygon, boundary;
        boolean hole;
        Target(String key, String name, String type, Element c, Element polygon,
               Element boundary, boolean hole) {
            this.key=key; this.name=name; this.type=type; coordinates=c;
            this.polygon=polygon; this.boundary=boundary; this.hole=hole;
        }
    }

    public static List<Part> parts(Element feature) {
        List<Target> targets = targets(feature);
        String token = token(feature);
        List<Part> result = new ArrayList<>();
        for (Target target : targets) result.add(new Part(target, token));
        return Collections.unmodifiableList(result);
    }

    public static void replace(Element feature, String key, String expected, String input) {
        Target target = checked(feature, key, expected);
        List<double[]> points = GeometryCoordinates.parse(input, target.type);
        // No DOM mutation occurs until the complete input has passed validation.
        target.coordinates.setTextContent(GeometryCoordinates.kml(points));
    }

    public static void addHole(Element feature, String key, String expected, String input) {
        Target target = checked(feature, key, expected);
        if (target.polygon == null || target.hole)
            throw new IllegalArgumentException("Выберите внешний контур области");
        List<double[]> points = GeometryCoordinates.parse(input, "Polygon");
        Element boundary = element(target.polygon, "innerBoundaryIs");
        Element ring = element(target.polygon, "LinearRing");
        Element coordinates = element(target.polygon, "coordinates");
        coordinates.setTextContent(GeometryCoordinates.kml(points));
        ring.appendChild(coordinates);
        boundary.appendChild(ring);
        target.polygon.appendChild(boundary);
    }

    public static void removeHole(Element feature, String key, String expected) {
        Target target = checked(feature, key, expected);
        if (!target.hole || target.boundary == null)
            throw new IllegalArgumentException("Можно удалить только внутренний контур");
        target.polygon.removeChild(target.boundary);
    }

    private static Target checked(Element feature, String key, String expected) {
        if (expected == null || !expected.equals(token(feature)))
            throw new IllegalStateException("Геометрия изменилась. Закройте редактор и откройте актуальный объект; ввод сохранён в черновике");
        for (Target target : targets(feature)) if (target.key.equals(key)) return target;
        throw new IllegalStateException("Выбранный контур больше не существует");
    }

    private static List<Target> targets(Element feature) {
        if (!is(feature, "Placemark")) throw new IllegalArgumentException("Нужна отдельная метка KML");
        List<Target> result = new ArrayList<>();
        walk(feature, "", 0, result);
        Set<String> keys=new HashSet<>();for(Target target:result)if(!keys.add(target.key))throw new IllegalArgumentException("Повторяющийся внешний контур нельзя безопасно адресовать");
        return result;
    }

    private static void walk(Element parent, String path, int depth, List<Target> result) {
        if (depth > 32) throw new IllegalArgumentException("Слишком глубоко вложена геометрия");
        int index=0;
        for (Element geometry : children(parent)) {
            String tag = local(geometry);
            if (!kml(geometry) || !Arrays.asList("Point","LineString","Polygon","MultiGeometry","LinearRing","Model").contains(tag)) continue;
            String key = path.isEmpty() ? Integer.toString(index++) : path+"."+(index++);
            if (tag.equals("MultiGeometry")) { walk(geometry,key,depth+1,result); continue; }
            if (tag.equals("Polygon")) {
                int inner=0;
                for (Element boundary : children(geometry)) {
                    boolean hole = is(boundary,"innerBoundaryIs");
                    if (!hole && !is(boundary,"outerBoundaryIs")) continue;
                    Element ring = child(boundary,"LinearRing");
                    Element c = ring==null?null:child(ring,"coordinates");
                    if (c!=null) result.add(new Target(key+(hole?"/inner/"+(inner++):"/outer"),
                        "Геометрия "+key+" · "+(hole?"внутренний контур "+inner:"внешний контур"),
                        "Polygon",c,geometry,boundary,hole));
                }
            } else if (tag.equals("Point") || tag.equals("LineString") || tag.equals("LinearRing")) {
                Element c=child(geometry,"coordinates");
                if (c!=null) result.add(new Target(key,"Геометрия "+key+" · "+tag,
                    tag.equals("LinearRing")?"Polygon":tag,c,null,null,false));
            }
            if (result.size()>10000) throw new IllegalArgumentException("Слишком много контуров");
        }
    }

    private static String editorText(String source, String type) {
        StringBuilder out=new StringBuilder();
        for (String tuple : source.trim().split("\\s+")) {
            String[] fields=tuple.split(",",-1);
            if (fields.length<2 || fields.length>3)
                throw new IllegalArgumentException("Координаты этого контура нельзя безопасно открыть в редакторе");
            if (out.length()>0) out.append('\n');
            out.append(fields[1]).append(' ').append(fields[0]);
            if (fields.length==3) out.append(' ').append(fields[2]);
        }
        // Reading never silently repairs malformed or unsupported coordinates.
        GeometryCoordinates.parse(out.toString(),type);
        return out.toString();
    }

    private static String token(Element feature) {
        try {
            MessageDigest digest=MessageDigest.getInstance("SHA-256");
            for (Element e:children(feature)) if (kml(e) && Arrays.asList("Point","LineString","Polygon","MultiGeometry","LinearRing","Model").contains(local(e))) hash(e,digest,0);
            StringBuilder out=new StringBuilder();
            for (byte b:digest.digest()) out.append(String.format(Locale.US,"%02x",b&255));
            return out.toString();
        } catch (java.security.NoSuchAlgorithmException e) { throw new IllegalStateException(e); }
    }
    private static void part(MessageDigest digest,String value) {
        byte[] bytes=value.getBytes(UTF8);
        int n=bytes.length;
        digest.update((byte)(n>>>24));digest.update((byte)(n>>>16));
        digest.update((byte)(n>>>8));digest.update((byte)n);digest.update(bytes);
    }
    private static void hash(Node node,MessageDigest digest,int depth) {
        if (depth>64) throw new IllegalArgumentException("Слишком глубоко вложена геометрия");
        part(digest,Integer.toString(node.getNodeType()));
        part(digest,node.getNodeName());
        part(digest,node.getNamespaceURI()==null?"":node.getNamespaceURI());
        if(node.getNodeValue()!=null) part(digest,node.getNodeValue());
        NamedNodeMap attrs=node.getAttributes();
        if(attrs!=null){TreeMap<String,String> values=new TreeMap<>();for(int i=0;i<attrs.getLength();i++){Node a=attrs.item(i);values.put(a.getNodeName(),a.getNodeValue());}for(Map.Entry<String,String> a:values.entrySet()){part(digest,a.getKey());part(digest,a.getValue());}}
        for(Node child=node.getFirstChild();child!=null;child=child.getNextSibling())hash(child,digest,depth+1);
        part(digest,"/end");
    }
    private static boolean kml(Element e) {
        String ns=e.getNamespaceURI();return ns==null||ns.isEmpty()||ns.equals("http://www.opengis.net/kml/2.2")||ns.matches("http://earth\\.google\\.com/kml/2\\.[012]");
    }
    private static String local(Element e){return e.getLocalName()==null?e.getTagName():e.getLocalName();}
    private static boolean is(Element e,String tag){return kml(e)&&local(e).equals(tag);}
    private static Element child(Element parent,String tag){for(Element e:children(parent))if(is(e,tag))return e;return null;}
    private static List<Element> children(Element e){List<Element> result=new ArrayList<>();for(Node n=e.getFirstChild();n!=null;n=n.getNextSibling())if(n instanceof Element)result.add((Element)n);return result;}
    private static Element element(Element context,String name){String prefix=context.getPrefix(),ns=context.getNamespaceURI();return context.getOwnerDocument().createElementNS(ns==null||ns.isEmpty()?null:ns,prefix==null||prefix.isEmpty()?name:prefix+":"+name);}
}
