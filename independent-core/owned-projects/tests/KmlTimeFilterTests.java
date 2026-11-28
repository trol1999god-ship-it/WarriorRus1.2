import org.rabochaya.projects.*;import org.w3c.dom.*;import javax.xml.parsers.*;import java.io.*;import java.util.*;
public final class KmlTimeFilterTests {
 static int checks;
 static void check(boolean ok){checks++;if(!ok)throw new AssertionError("check "+checks);}
 static Element parse(String xml)throws Exception{DocumentBuilderFactory f=DocumentBuilderFactory.newInstance();f.setNamespaceAware(true);return f.newDocumentBuilder().parse(new ByteArrayInputStream(xml.getBytes("UTF-8"))).getDocumentElement();}
 static KmlTimeFilter.Entry entry(String body)throws Exception{return KmlTimeFilter.read(parse("<Placemark xmlns='http://www.opengis.net/kml/2.2'>"+body+"</Placemark>"));}
 static KmlTimeFilter.Entry stamp(String value)throws Exception{return entry("<TimeStamp><when>"+value+"</when></TimeStamp>");}
 static boolean on(KmlTimeFilter.Entry entry,String day){return new KmlTimeFilter.Query(2,day,day).matches(entry);}
 static void invalid(Runnable r){boolean bad=false;try{r.run();}catch(IllegalArgumentException e){bad=true;}check(bad);}
 public static void main(String[] args)throws Exception{
  check(stamp("1970-01-01T00:00:00Z").status==KmlTimeFilter.VALID);
  for(String value:new String[]{"2024","2024-02","2024-02-29","2024-02-29T12:30:59Z","2024-02-29T12:30:59.123456789123456789+03:00","2024-02-29T12:30:59","2024-02Z","2024+14:00"})check(on(stamp(value),"2024-02-29"));
  check(!on(stamp("2024-02"),"2024-03-01"));check(!on(stamp("2024"),"2025-01-01"));check(!on(stamp("2024-02-29"),"2024-02-28"));
  check(on(stamp("2024-03-01T00:30:00+03:00"),"2024-02-29"));check(!on(stamp("2024-03-01T00:30:00+03:00"),"2024-03-01"));
  check(on(stamp("2024-02-29T23:30:00-03:00"),"2024-03-01"));check(on(stamp("1970-01-01T24:00:00Z"),"1970-01-02"));check(!on(stamp("1970-01-01T24:00:00Z"),"1970-01-01"));
  check(on(stamp("2024-03-01T00:00:00.00000000000000000001Z"),"2024-03-01"));check(!on(stamp("2024-02-29T23:59:59.99999999999999999999Z"),"2024-03-01"));
  check(on(stamp("2024-03-01+03:00"),"2024-02-29"));check(on(stamp("2024-03-01+03:00"),"2024-03-01"));check(!on(stamp("2024-03-01+03:00"),"2024-03-02"));
  for(String value:new String[]{"2023-02-29","1900-02-29","2024-13","2024-00-01","2024-01-00","0000","-0001","10000","2024-01-01T25:00:00Z","2024-01-01T23:60:00Z","2024-01-01T23:59:60Z","2024-01-01T24:00:01Z","2024-01-01T24:00:00.01Z","2024-01-01T01:00Z","2024-01-01T01:00:00+14:01","2024-01-01T01:00:00-15:00","2024-01-01T01:00:00+01:60","2024-1-1","today",""})check(stamp(value).status==KmlTimeFilter.UNRECOGNIZED);
  check(on(stamp("1500-03-01"),"1500-03-01"));check(stamp("1500-02-29").status==KmlTimeFilter.UNRECOGNIZED);check(on(stamp("1600-02-29"),"1600-02-29"));check(on(stamp("0001"),"0001-01-01"));check(on(stamp("9999"),"9999-12-31"));check(on(stamp("9999-12-31T23:59:59Z"),"9999-12-31"));
  KmlTimeFilter.Entry range=entry("<TimeSpan><begin>2024-02</begin><end>2024-03</end></TimeSpan>");check(on(range,"2024-02-01"));check(on(range,"2024-03-31"));check(!on(range,"2024-01-31"));check(!on(range,"2024-04-01"));
  range=entry("<TimeSpan><begin>2024-03-01T00:00:00Z</begin><end>2024-03-02T00:00:00Z</end></TimeSpan>");check(on(range,"2024-03-02"));check(!on(range,"2024-03-03"));
  check(on(entry("<TimeSpan><begin>2024-02-29</begin></TimeSpan>"),"9999-12-31"));check(!on(entry("<TimeSpan><begin>2024-02-29</begin></TimeSpan>"),"2024-02-28"));check(on(entry("<TimeSpan><end>2024-02-29</end></TimeSpan>"),"0001-01-01"));check(!on(entry("<TimeSpan><end>2024-02-29</end></TimeSpan>"),"2024-03-01"));
  check(entry("<TimeSpan><begin>2024-03-02</begin><end>2024-03-01</end></TimeSpan>").status==KmlTimeFilter.UNRECOGNIZED);
  check(on(entry("<TimeSpan><begin>2024-03-01T00:00:00Z</begin><end>2024-03-01T00:00:00Z</end></TimeSpan>"),"2024-03-01"));
  for(String xml:new String[]{"<TimeSpan/>","<TimeSpan><begin/></TimeSpan>","<TimeStamp/>","<TimeStamp><when>2024</when><when>2025</when></TimeStamp>","<TimeSpan><begin>2024</begin><begin>2025</begin></TimeSpan>","<TimeStamp><when><x>2024</x></when></TimeStamp>","<TimeStamp><when>2024</when></TimeStamp><TimeSpan><begin>2024</begin></TimeSpan>"})check(entry(xml).status==KmlTimeFilter.UNRECOGNIZED);
  KmlTimeFilter.Entry absent=entry("<ExtendedData><TimeStamp><when>2024</when></TimeStamp></ExtendedData><gx:TimeStamp xmlns:gx='http://www.google.com/kml/ext/2.2'><when>2024</when></gx:TimeStamp>");check(absent.status==KmlTimeFilter.ABSENT);
  KmlTimeFilter.Entry bad=stamp("nonsense"),valid=stamp("2024");check(KmlTimeFilter.Query.defaults().matches(absent));check(KmlTimeFilter.Query.defaults().matches(bad));check(new KmlTimeFilter.Query(1,"","").matches(valid));check(!new KmlTimeFilter.Query(1,"","").matches(bad));check(new KmlTimeFilter.Query(3,"","").matches(absent));check(!new KmlTimeFilter.Query(3,"","").matches(bad));check(new KmlTimeFilter.Query(4,"","").matches(bad));check(!new KmlTimeFilter.Query(4,"","").matches(absent));
  check(new KmlTimeFilter.Query(2,"2024-01-01","").matches(valid));check(new KmlTimeFilter.Query(2,"","2024-12-31").matches(valid));check(!new KmlTimeFilter.Query(2,"2024-01-01","").matches(absent));
  invalid(()->new KmlTimeFilter.Query(2,"",""));invalid(()->new KmlTimeFilter.Query(2,"2024-02-30",""));invalid(()->new KmlTimeFilter.Query(2,"2024-03-02","2024-03-01"));invalid(()->new KmlTimeFilter.Query(2,"2024",""));invalid(()->new KmlTimeFilter.Query(-1,"",""));invalid(()->new KmlTimeFilter.Query(5,"",""));
  TimeZone zone=TimeZone.getDefault();Locale locale=Locale.getDefault();try{TimeZone.setDefault(TimeZone.getTimeZone("Pacific/Honolulu"));Locale.setDefault(new Locale("th","TH"));check(on(stamp("2024-03-01T00:30:00+03:00"),"2024-02-29"));}finally{TimeZone.setDefault(zone);Locale.setDefault(locale);}
  Element root=parse("<Document xmlns='http://www.opengis.net/kml/2.2'><Folder><name>Parent</name><TimeStamp><when>2024</when></TimeStamp><Placemark><name>Child</name><Point/></Placemark></Folder><Placemark><name>Own</name><description>Note</description><TimeStamp><when>2024-02-29</when></TimeStamp><Point/></Placemark></Document>");String token=ObjectTree.token(root);ObjectListing listing=ObjectListing.build(root,ObjectTree.rows(root));
  check(listing.select("",new ObjectListing.Options("",0,0,0,true,false,0,2,"2024-02-29","2024-02-29")).size()==2);check(listing.select("0",new ObjectListing.Options("",0,0,0,true,false,0,1,"","")).isEmpty());check(listing.select("",new ObjectListing.Options("note",2,0,0,true,false,1,2,"2024-02-29","2024-02-29")).get(0).row.key.equals("1"));check(ObjectTree.token(root).equals(token));
  check(KmlTimeFilter.read(parse("<Placemark><TimeStamp><when>2024</when></TimeStamp></Placemark>")).status==KmlTimeFilter.VALID);check(KmlTimeFilter.read(parse("<Placemark xmlns='http://earth.google.com/kml/2.1'><TimeStamp><when>2024</when></TimeStamp></Placemark>")).status==KmlTimeFilter.VALID);
  check(entry("<TimeStamp><x:when xmlns:x='urn:foreign'>2024</x:when></TimeStamp>").status==KmlTimeFilter.UNRECOGNIZED);
  check(entry("<x:TimeStamp xmlns:x='urn:foreign'><when>2024</when></x:TimeStamp>").status==KmlTimeFilter.ABSENT);
  check(entry("<TimeSpan><end>2024</end><end>2025</end></TimeSpan>").status==KmlTimeFilter.UNRECOGNIZED);
  check(entry("<TimeSpan><begin>2024-03-01T00:00:00.0000000002Z</begin><end>2024-03-01T00:00:00.0000000001Z</end></TimeSpan>").status==KmlTimeFilter.UNRECOGNIZED);
  check(on(stamp("2024-01-01T00:00:00-14:00"),"2024-01-01"));
  check(new KmlTimeFilter.Query(2," 2024-02-29 "," 2024-02-29 ").matches(stamp("2024-02-29T12:00:00")));
  check(new ObjectListing.Options("",0,0,0,false,false,0,3,"","").filtered());check(ObjectListing.Options.defaults().dates.mode==0);
  System.out.println("PASS KmlTimeFilter: "+checks+" assertions");
 }
}
