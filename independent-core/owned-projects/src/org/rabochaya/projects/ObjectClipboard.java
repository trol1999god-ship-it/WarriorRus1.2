package org.rabochaya.projects;
import java.util.*;import java.io.*;import java.security.MessageDigest;
/** Bounded, checksummed private reference clipboard. Contains no XML, asset bytes or system clip. */
public final class ObjectClipboard {
 public static final int MAX_BYTES=1024*1024;
 public final long project;public final boolean cut;public final String token;public final List<String> keys;
 public ObjectClipboard(long project,boolean cut,String token,Collection<String> keys){
  if(project<=0||token==null||!token.matches("[a-f0-9]{64}")||keys==null||keys.isEmpty()||keys.size()>10000)throw new IllegalArgumentException("Недопустимый буфер объектов");
  Set<String> unique=new HashSet<>();for(String key:keys){if(key==null||key.length()>256||!key.matches("(0|[1-9][0-9]*)(/(0|[1-9][0-9]*))*")||key.split("/").length>33||!unique.add(key))throw new IllegalArgumentException("Недопустимый выбор в буфере");try{for(String part:key.split("/"))Integer.parseInt(part);}catch(NumberFormatException e){throw new IllegalArgumentException("Недопустимый выбор в буфере");}}
  this.project=project;this.cut=cut;this.token=token;this.keys=Collections.unmodifiableList(new ArrayList<>(keys));
 }
 private static byte[] digest(byte[] bytes){try{return MessageDigest.getInstance("SHA-256").digest(bytes);}catch(java.security.NoSuchAlgorithmException e){throw new IllegalStateException(e);}}
 public String fingerprint()throws IOException{StringBuilder out=new StringBuilder();for(byte b:digest(encode()))out.append(String.format(Locale.US,"%02x",b&255));return out.toString();}
 public byte[] encode()throws IOException{
  ByteArrayOutputStream buffer=new ByteArrayOutputStream();DataOutputStream out=new DataOutputStream(buffer);out.writeInt(0x524b4342);out.writeInt(1);out.writeLong(project);out.writeBoolean(cut);out.writeUTF(token);out.writeInt(keys.size());for(String key:keys)out.writeUTF(key);out.flush();byte[] body=buffer.toByteArray();if(body.length+32>MAX_BYTES)throw new IOException("Слишком большой выбор для буфера");buffer.write(digest(body));return buffer.toByteArray();
 }
 public static ObjectClipboard decode(byte[] data)throws IOException{
  if(data==null||data.length<32||data.length>MAX_BYTES)throw new IOException("Буфер повреждён; очистите его и повторите выбор");byte[] body=Arrays.copyOf(data,data.length-32);if(!MessageDigest.isEqual(digest(body),Arrays.copyOfRange(data,data.length-32,data.length)))throw new IOException("Буфер повреждён; очистите его и повторите выбор");
  try{DataInputStream in=new DataInputStream(new ByteArrayInputStream(body));if(in.readInt()!=0x524b4342||in.readInt()!=1)throw new IOException("Неизвестная версия буфера");long project=in.readLong();boolean cut=in.readBoolean();String token=in.readUTF();int count=in.readInt();if(count<1||count>10000)throw new IOException("Недопустимый размер буфера");List<String> keys=new ArrayList<>();for(int i=0;i<count;i++)keys.add(in.readUTF());if(in.available()!=0)throw new IOException("Лишние данные в буфере");return new ObjectClipboard(project,cut,token,keys);}catch(IllegalArgumentException e){throw new IOException("Буфер повреждён; очистите его и повторите выбор",e);}
 }
}
