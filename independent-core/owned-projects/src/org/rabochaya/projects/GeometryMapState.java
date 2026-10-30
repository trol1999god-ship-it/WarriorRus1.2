package org.rabochaya.projects;

import java.util.*;

/** Unsaved editing of one geometry part. No Android, files, XML or network access. */
public final class GeometryMapState {
    private static final int MAX_HISTORY=32,MAX_HISTORY_CHARS=4000000;
    public final String type;
    public final boolean incompleteAllowed;
    private String text;
    private List<double[]> points;
    private int selected=-1,historyChars;
    private final Deque<Snapshot> history=new ArrayDeque<>();
    private static final class Snapshot {
        final String text;final int selected;
        Snapshot(String t,int s){text=t;selected=s;}
    }
    public GeometryMapState(String text,String type,boolean incompleteAllowed){
        if(!Arrays.asList("Point","LineString","Polygon").contains(type))throw new IllegalArgumentException("Неизвестная геометрия");
        if(incompleteAllowed&&!"Polygon".equals(type))throw new IllegalArgumentException("Неполный ввод разрешён только для нового внутреннего контура");
        this.type=type;this.incompleteAllowed=incompleteAllowed;
        points=read(text);this.text=text;
    }
    private List<double[]> read(String value){
        if(value==null||value.length()>500000)throw new IllegalArgumentException("Слишком длинный список координат");
        List<double[]> parsed;
        if(!incompleteAllowed)parsed=GeometryCoordinates.parse(value,type);
        else {
            parsed=new ArrayList<>();
            if(!value.trim().isEmpty())for(String line:value.trim().split("[\\r\\n]+")){
                parsed.add(GeometryCoordinates.parse(line,"Point").get(0));
                if(parsed.size()>10000)throw new IllegalArgumentException("Предел — 10 000 вершин");
            }
        }
        List<double[]> result=new ArrayList<>();for(double[] p:parsed)result.add(p.clone());
        if("Polygon".equals(type)&&result.size()>1&&Arrays.equals(result.get(0),result.get(result.size()-1)))result.remove(result.size()-1);
        return result;
    }
    public int size(){return points.size();}
    public double[] point(int index){return points.get(index).clone();}
    public String text(){return text;}
    public int selected(){return selected;}
    public void select(int index){if(index< -1||index>=size())throw new IllegalArgumentException("Вершина не найдена");selected=index;}
    public boolean canUndo(){return !history.isEmpty();}
    public int undoCount(){return history.size();}
    public boolean complete(){try{GeometryCoordinates.parse(text,type);return true;}catch(IllegalArgumentException e){return false;}}
    private List<double[]> copy(){List<double[]> result=new ArrayList<>();for(double[] p:points)result.add(p.clone());return result;}
    private void change(List<double[]> next,int selection){
        StringBuilder out=new StringBuilder();for(double[] p:next){if(out.length()>0)out.append('\n');out.append(p[1]).append(' ').append(p[0]).append(' ').append(p[2]);}
        String candidate=out.toString();List<double[]> checked=read(candidate);
        if(text.equals(candidate)){selected=selection;return;}
        history.addLast(new Snapshot(text,selected));historyChars+=text.length();
        while(history.size()>MAX_HISTORY||historyChars>MAX_HISTORY_CHARS){Snapshot old=history.removeFirst();historyChars-=old.text.length();}
        points=checked;text=candidate;selected=selection;
    }
    private static double[] coordinate(double lon,double lat,double altitude){
        return GeometryCoordinates.parse(lat+" "+lon+" "+altitude,"Point").get(0);
    }
    public void move(int index,double lon,double lat){
        double[] old=points.get(index);double[] point=coordinate(lon,lat,old[2]);
        if(Arrays.equals(old,point))return;
        List<double[]> next=copy();next.set(index,point);change(next,index);
    }
    public void insert(double lon,double lat){
        if("Point".equals(type))throw new IllegalArgumentException("У метки только одна вершина");
        if(size()>=10000)throw new IllegalArgumentException("Предел — 10 000 вершин");
        int at=selected<0?size():selected+1;List<double[]> next=copy();next.add(at,coordinate(lon,lat,0));change(next,at);
    }
    public void delete(){
        if(selected<0)throw new IllegalArgumentException("Сначала выберите вершину");
        if("Point".equals(type))throw new IllegalArgumentException("Нельзя удалить единственную вершину метки");
        List<double[]> next=copy();next.remove(selected);change(next,Math.min(selected,next.size()-1));
    }
    public void undo(){
        if(history.isEmpty())throw new IllegalArgumentException("Нет действий для отмены");
        Snapshot previous=history.removeLast();historyChars-=previous.text.length();points=read(previous.text);text=previous.text;selected=previous.selected;
    }
}
