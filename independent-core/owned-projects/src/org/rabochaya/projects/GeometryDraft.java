package org.rabochaya.projects;

import java.io.*;
import java.nio.charset.Charset;
import java.security.*;

/** Private, bounded, checksummed geometry draft. It never replaces a project file. */
public final class GeometryDraft {
    private static final Charset UTF8=Charset.forName("UTF-8");
    private static final int MAGIC=0x524b4744,MAX_BYTES=2000000;
    public final String key,token,text;
    public final boolean addingHole;
    public GeometryDraft(String key,String token,String text,boolean addingHole) {
        if(key==null||key.length()>512||!key.matches("\\d+(?:\\.\\d+)*(?:/(?:outer|inner/\\d+))?")||key.length()>512||token==null||!token.matches("[0-9a-f]{64}")||text==null||text.length()>500000)
            throw new IllegalArgumentException("Недопустимый черновик геометрии");
        this.key=key;this.token=token;this.text=text;this.addingHole=addingHole;
    }
    private static byte[] digest(byte[] data) {
        try{return MessageDigest.getInstance("SHA-256").digest(data);}
        catch(NoSuchAlgorithmException e){throw new IllegalStateException(e);}
    }
    private static File path(File directory,long project,String feature) {
        if(project<=0||feature==null||feature.isEmpty()||feature.length()>4096)throw new IllegalArgumentException("Нужен существующий объект проекта");
        StringBuilder name=new StringBuilder();for(byte b:digest(feature.getBytes(UTF8)))name.append(String.format(java.util.Locale.US,"%02x",b&255));
        return new File(directory,"g_"+project+"_"+name+".draft");
    }
    public void save(File directory,long project,String feature)throws IOException {
        synchronized(GeometryDraft.class){saveUnlocked(directory,project,feature);}
    }
    private void saveUnlocked(File directory,long project,String feature)throws IOException {
        File target=path(directory,project,feature);
        if(!directory.isDirectory()&&!directory.mkdirs())throw new IOException("Не удалось создать каталог черновиков");
        ByteArrayOutputStream bytes=new ByteArrayOutputStream();
        try(DataOutputStream out=new DataOutputStream(bytes)) {
            out.writeInt(MAGIC);out.writeInt(1);out.writeLong(project);out.writeUTF(feature);
            out.writeUTF(key);out.writeUTF(token);out.writeBoolean(addingHole);
            byte[] raw=text.getBytes(UTF8);if(raw.length>MAX_BYTES)throw new IOException("Слишком длинный черновик");
            out.writeInt(raw.length);out.write(raw);
        }
        byte[] body=bytes.toByteArray();File temp=File.createTempFile("geometry-",".tmp",directory);
        try {
            try(FileOutputStream file=new FileOutputStream(temp)) {file.write(body);file.write(digest(body));file.getFD().sync();}
            if(!temp.renameTo(target))throw new IOException("Не удалось сохранить черновик; проект не изменён");
        }finally{if(temp.exists())temp.delete();}
    }
    public static synchronized GeometryDraft load(File directory,long project,String feature)throws IOException {
        File file=path(directory,project,feature);if(!file.exists())return null;
        if(file.length()<32||file.length()>MAX_BYTES+32768)throw new IOException("Недопустимый размер черновика");
        ByteArrayOutputStream data=new ByteArrayOutputStream();
        try(InputStream in=new FileInputStream(file)){byte[] b=new byte[8192];int n;while((n=in.read(b))!=-1){if(data.size()+n>MAX_BYTES+32768)throw new IOException("Черновик слишком велик");data.write(b,0,n);}}
        byte[] all=data.toByteArray();if(all.length<32)throw new IOException("Черновик обрезан");byte[] body=java.util.Arrays.copyOf(all,all.length-32),sha=java.util.Arrays.copyOfRange(all,all.length-32,all.length);
        if(!MessageDigest.isEqual(digest(body),sha))throw new IOException("Черновик повреждён; файл сохранён для восстановления");
        try(DataInputStream in=new DataInputStream(new ByteArrayInputStream(body))) {
            if(in.readInt()!=MAGIC||in.readInt()!=1||in.readLong()!=project||!in.readUTF().equals(feature))throw new IOException("Черновик относится к другому объекту или версии");
            String key=in.readUTF(),token=in.readUTF();boolean adding=in.readBoolean();int length=in.readInt();
            if(length<0||length>MAX_BYTES||length!=in.available())throw new IOException("Недопустимая длина черновика");
            byte[] raw=new byte[length];in.readFully(raw);
            try{return new GeometryDraft(key,token,UTF8.newDecoder().onMalformedInput(java.nio.charset.CodingErrorAction.REPORT).onUnmappableCharacter(java.nio.charset.CodingErrorAction.REPORT).decode(java.nio.ByteBuffer.wrap(raw)).toString(),adding);}
            catch(IllegalArgumentException e){throw new IOException("Некорректный черновик",e);}
        }
    }
    public static synchronized void delete(File directory,long project,String feature)throws IOException {
        File file=path(directory,project,feature);if(file.exists()&&!file.delete())throw new IOException("Не удалось удалить черновик");
    }
    /** A completed save/undo must not erase a newer lifecycle's accepted draft. */
    public static synchronized boolean discardIfMatches(File directory,long project,String feature,GeometryDraft expected)throws IOException {
        if(expected==null)throw new IllegalArgumentException("Не указан собственный черновик");
        GeometryDraft current=load(directory,project,feature);if(current==null)return true;
        if(!current.key.equals(expected.key)||!current.token.equals(expected.token)||!current.text.equals(expected.text)||current.addingHole!=expected.addingHole)return false;
        delete(directory,project,feature);return true;
    }
}
