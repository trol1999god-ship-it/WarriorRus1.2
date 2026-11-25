package org.rabochaya.projects;

import java.io.*;
import java.math.BigDecimal;
import java.nio.ByteBuffer;
import java.nio.charset.*;
import java.util.*;
import org.w3c.dom.*;
import static org.rabochaya.projects.ObjectExchange.*;

/** Local OziExplorer text import. Coordinates are accepted only with an explicit WGS 84 datum. */
final class OziObjectImport {
 private static final String WAYPOINTS = "OziExplorer Waypoint File Version ";
 private static final String TRACKS = "OziExplorer Track Point File Version ";
 private static final BigDecimal FEET_TO_METRES = new BigDecimal("0.3048");

 private OziObjectImport() {}

 static boolean matches(byte[] bytes, int start) {
  String header = new String(bytes, start, Math.min(bytes.length - start, 48), StandardCharsets.US_ASCII);
  return header.startsWith(WAYPOINTS) || header.startsWith(TRACKS);
 }

 static Document read(byte[] bytes, int start) throws Exception {
  String text;
  try {
   text = StandardCharsets.UTF_8.newDecoder().decode(ByteBuffer.wrap(bytes, start, bytes.length - start)).toString();
  } catch (CharacterCodingException malformedUtf8) {
   text = new String(bytes, start, bytes.length - start, Charset.forName("windows-1251"));
  }
  try (BufferedReader reader = new BufferedReader(new StringReader(text))) {
   String header = line(reader);
   boolean waypoints = header.startsWith(WAYPOINTS);
   if (!(waypoints ? header.matches(WAYPOINTS + "1\\.[01]") : header.matches(TRACKS + "2\\.[01]"))) {
    throw invalid("Версия WPT или PLT не поддерживается");
   }
   if (!line(reader).replaceAll("\\s+", "").equalsIgnoreCase("WGS84")) {
    throw invalid("Импорт WPT и PLT требует датум WGS 84");
   }
   line(reader);
   line(reader);
   Document document = newDocument();
   Element root = kml(document);
   if (waypoints) readWaypoints(root, reader);
   else readTrack(root, reader, fields(line(reader)));
   return document;
  }
 }

 private static void readWaypoints(Element root, BufferedReader reader) throws IOException {
  int count = 0;
  for (String raw; (raw = reader.readLine()) != null;) {
   if (raw.trim().isEmpty()) continue;
   if (++count > 10000) throw invalid("В WPT больше 10 000 меток");
   String[] row = fields(raw);
   double[] point = coordinates(row, 3, 2, 14);
   Element feature = place(root, textField(row, 1), textField(row, 10));
   keep(feature, "ozi:date", field(row, 4));
   keep(feature, "ozi:symbol", field(row, 5));
   geometry(feature, "Point", Collections.singletonList(point));
  }
 }

 private static void readTrack(Element root, BufferedReader reader, String[] style) throws IOException {
  line(reader); // Advisory count; actual rows are authoritative.
  List<List<double[]>> segments = new ArrayList<>();
  List<double[]> segment = new ArrayList<>();
  segments.add(segment);
  List<String> serialDates = new ArrayList<>();
  boolean hasDates = false;
  for (String raw; (raw = reader.readLine()) != null;) {
   if (raw.trim().isEmpty()) continue;
   if (serialDates.size() >= 100000) throw invalid("В PLT больше 100 000 вершин");
   String[] row = fields(raw);
   String code = field(row, 2);
   if (!code.isEmpty() && !code.equals("0") && !code.equals("1")) throw invalid("Недопустимый код вершины PLT");
   if (code.equals("1") && !segment.isEmpty()) {
    segment = new ArrayList<>();
    segments.add(segment);
   }
   segment.add(coordinates(row, 1, 0, 3));
   String date = field(row, 4);
   if (date.length() > 32 || (!date.isEmpty() && !date.matches("-?[0-9]+(?:\\.[0-9]+)?"))) {
    throw invalid("Недопустимая дата вершины PLT");
   }
   hasDates |= !date.isEmpty();
   serialDates.add(date);
  }
  if (serialDates.isEmpty()) throw invalid("В PLT нет вершин");
  String title = textField(style, 3);
  Element feature = place(root, title.isEmpty() ? "Трек OziExplorer" : title, "");
  String type = field(style, 5);
  boolean polygon = type.equals("10");
  if (hasDates) data(feature, "ozi:point-dates", joinDates(serialDates));
  if (polygon) {
   if (segments.size() != 1 || segment.size() < 3) throw invalid("Некорректный замкнутый контур PLT");
   if (!Arrays.equals(segment.get(0), segment.get(segment.size() - 1))) segment.add(segment.get(0));
   requireRing(segment);
   polygon(feature, Collections.singletonList(segment));
   return;
  }
  data(feature, KIND, "trk");
  Element parent = segments.size() > 1 ? add(feature, "MultiGeometry", null) : feature;
  for (List<double[]> points : segments) geometry(parent, points.size() == 1 ? "Point" : "LineString", points);
 }

 private static double[] coordinates(String[] row, int lon, int lat, int altitude) throws IOException {
  String feet = field(row, altitude);
  String metres = null;
  if (!feet.isEmpty()) {
   try {
    if (!feet.matches("[+-]?[0-9]{1,12}(?:\\.[0-9]{1,12})?")) throw new NumberFormatException();
    BigDecimal value = new BigDecimal(feet);
    if (value.compareTo(BigDecimal.valueOf(-777)) != 0) metres = value.multiply(FEET_TO_METRES).toPlainString();
   } catch (NumberFormatException invalid) {
    throw invalid("Недопустимая высота OziExplorer");
   }
  }
  return position(field(row, lon), field(row, lat), metres);
 }

 private static String joinDates(List<String> values) {
  StringBuilder joined = new StringBuilder();
  for (int i = 0; i < values.size(); i++) {
   if (i != 0) joined.append(',');
   joined.append(values.get(i));
  }
  return joined.toString();
 }

 private static String line(BufferedReader reader) throws IOException {
  String value = reader.readLine();
  if (value == null || value.length() > 8192) throw invalid("Повреждён заголовок OziExplorer");
  return value.trim();
 }

 private static String[] fields(String row) throws IOException {
  if (row.length() > 8192) throw invalid("Слишком длинная строка OziExplorer");
  return row.split(",", -1);
 }

 private static String field(String[] row, int index) { return index < row.length ? row[index].trim() : ""; }
 private static String textField(String[] row, int index) { return field(row, index).replace('Ñ', ','); }
 private static void keep(Element feature, String name, String value) { if (!value.isEmpty()) data(feature, name, value); }
}
