package org.rabochaya.projects;

import java.util.List;

final class SurfaceMeasurement {
    private static final double RADIUS = 6371008.8;
    private static final double SPHERE = 4*Math.PI*RADIUS*RADIUS;

    static double area(List<List<double[]>> rings){
        if(rings.isEmpty())return 0;
        double value=ringArea(rings.get(0));
        for(int i=1;i<rings.size();i++)value-=ringArea(rings.get(i));
        return Math.max(0,value);
    }

    private static double ringArea(List<double[]> ring){
        if(ring.size()<3)return 0;
        double sum=0;
        double[] previous=ring.get(ring.size()-1);
        for(double[] next:ring){
            double delta=next[0]-previous[0];
            delta-=360*Math.floor((delta+180)/360);
            sum+=Math.toRadians(delta)*(Math.sin(Math.toRadians(previous[1]))+Math.sin(Math.toRadians(next[1])));
            previous=next;
        }
        double result=Math.abs(sum)*RADIUS*RADIUS/2 % SPHERE;
        return Math.min(result,SPHERE-result);
    }
}
