import org.rabochaya.projects.*;import org.w3c.dom.*;import javax.xml.parsers.*;import java.io.*;
public final class ObjectEditorDraftTests {
 static int checks;static void check(boolean value){checks++;if(!value)throw new AssertionError("draft check "+checks);}
 static ObjectEditorDraft draft(long project,String op,String key,String token){return new ObjectEditorDraft(project,op,key,token,"Draft 😀\nТекст",3,8);}
 public static void main(String[] args)throws Exception{
  DocumentBuilderFactory factory=DocumentBuilderFactory.newInstance();factory.setNamespaceAware(true);Element root=factory.newDocumentBuilder().parse(new ByteArrayInputStream("<Document xmlns='http://www.opengis.net/kml/2.2'><Folder id='f'><Placemark id='p'><name>Point</name><Point><coordinates>10,20,30</coordinates></Point></Placemark></Folder><Placemark id='q'><name>Other</name></Placemark></Document>".getBytes("UTF-8"))).getDocumentElement();String token=ObjectTree.token(root);
  for(String op:new String[]{"rename","description"}){ObjectEditorDraft d=draft(7,op,"0/0",token);check(d.matches(7,root));check(!d.matches(8,root));check(!d.matches(7,null));check(d.start==3&&d.end==8&&d.text.equals("Draft 😀\nТекст"));check(!draft(7,op,"",token).matches(7,root));check(!draft(7,op,"0/9",token).matches(7,root));check(!draft(7,op,"00/0",token).matches(7,root));check(!draft(7,op,"0/0",null).matches(7,root));}
  check(draft(7,"create","",token).matches(7,root));check(draft(7,"create","0",token).matches(7,root));check(!draft(7,"create","0/0",token).matches(7,root));check(!draft(-1,"rename","0/0",token).matches(-1,root));check(ObjectTree.token(root).equals(token));
  ObjectEditorDraft stale=draft(7,"description","0/0",token);Element folder=ObjectTree.resolve(root,"0");folder.insertBefore(ObjectTree.resolve(root,"1"),folder.getFirstChild());check(!stale.matches(7,root));check(ObjectTree.resolve(root,"0/0").getAttribute("id").equals("q"));
  ObjectEditorDraft fresh=draft(7,"description","0/1",ObjectTree.token(root));check(fresh.matches(7,root));ObjectTree.resolve(root,"0/1").setAttribute("changed","true");check(!fresh.matches(7,root));check(!draft(7,"rename","0/0",token).matches(7,root));
  ObjectEditorDraft cursor=new ObjectEditorDraft(7,"rename","0",token,"😀",-4,99);check(cursor.start==0&&cursor.end==2);boolean bad=false;try{draft(7,"delete","0",token);}catch(IllegalArgumentException e){bad=true;}check(bad);
  for(String value:new String[]{null,new String(new char[100001])}){boolean rejected=false;try{new ObjectEditorDraft(7,"rename","0",token,value,0,0);}catch(IllegalArgumentException e){rejected=true;}check(rejected);}
  System.out.println("PASS ObjectEditorDraft: "+checks+" assertions");
 }
}
