package org.rabochaya.projects;

import java.util.*;

/** Edits the unsaved coordinate text only. Ring closure follows the first vertex. */
public final class GeometryVertices {
    private GeometryVertices() {}
    public static List<String> rows(String text,String type) {
        List<double[]> points=GeometryCoordinates.parse(text,type);
        int count=points.size()-("Polygon".equals(type)?1:0);
        List<String> result=new ArrayList<>();
        for(int i=0;i<count;i++) {
            double[] p=points.get(i);
            result.add(p[1]+" "+p[0]+" "+p[2]);
        }
        return result;
    }
    public static String edit(String text,String type,int index,String operation,String coordinate) {
        List<String> rows=rows(text,type);
        if(index<0||index>=rows.size())throw new IllegalArgumentException("Вершина больше не найдена");
        if("replace".equals(operation)||"before".equals(operation)||"after".equals(operation)) {
            if(!"replace".equals(operation)&&"Point".equals(type))throw new IllegalArgumentException("У метки только одна вершина");
            String point=rows(coordinate,"Point").get(0);
            if("replace".equals(operation))rows.set(index,point);
            else rows.add(index+("after".equals(operation)?1:0),point);
        }else if("delete".equals(operation))rows.remove(index);
        else if("up".equals(operation)||"down".equals(operation)) {
            int other=index+("up".equals(operation)?-1:1);
            if(other<0||other>=rows.size())throw new IllegalArgumentException("Достигнут край списка вершин");
            Collections.swap(rows,index,other);
        }else throw new IllegalArgumentException("Неизвестное действие с вершиной");
        StringBuilder result=new StringBuilder();
        for(String row:rows){if(result.length()>0)result.append('\n');result.append(row);}
        // Validate before returning: a rejected action cannot change the editor or project.
        GeometryCoordinates.parse(result.toString(),type);
        return result.toString();
    }
}
