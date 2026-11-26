package org.rabochaya.projects;

import android.hardware.GeomagneticField;

/** Magnetic reference evaluated at the displayed map centre, without device location. */
final class NorthReference {
    static final String[] NAMES={"Магнитный север","Истинный (географический) север","Координатный север"};
    private double lastLat=Double.NaN,lastLon=Double.NaN,declination,convergence;
    private long day=-1;

    static final class Reading {
        final double degrees;
        final String label;
        Reading(double degrees,String label){this.degrees=degrees;this.label=label;}
    }

    Reading at(double magnetic,int reference,double lat,double lon){
        if(reference==0||Double.isNaN(lat)||Double.isNaN(lon))return new Reading(magnetic,"Магнитный азимут");
        long now=System.currentTimeMillis(), currentDay=now/86400000;
        if(Double.isNaN(lastLat)||Math.abs(lat-lastLat)>=.02||Math.abs(lon-lastLon)>=.02||day!=currentDay){
            declination=new GeomagneticField((float)lat,(float)lon,0,now).getDeclination();
            convergence=gridConvergence(lat,lon);
            lastLat=lat;lastLon=lon;day=currentDay;
        }
        if(reference==2&&!Double.isNaN(convergence))
            return new Reading(corrected(magnetic,declination,convergence),"Координатный азимут");
        return new Reading(corrected(magnetic,declination,0),
            reference==2?"Истинный азимут (сетка UTM недоступна)":"Истинный азимут");
    }

    static double corrected(double magnetic,double declination,double convergence){
        double degrees=magnetic+declination-convergence;
        return degrees-360*Math.floor(degrees/360);
    }

    static double gridConvergence(double lat,double lon){
        try{
            Coordinates.Grid grid=Coordinates.toUtm(lat,lon);
            boolean forward=grid.northing<=9999990;
            double next=grid.northing+(forward?10:-10);
            Coordinates.Position point=Coordinates.fromUtm(new Coordinates.Grid(grid.zone,grid.north,grid.easting,next));
            double a=Math.toRadians(forward?lat:point.lat),b=Math.toRadians(forward?point.lat:lat);
            double delta=Math.toRadians(forward?point.lon-lon:lon-point.lon);
            return Math.toDegrees(Math.atan2(Math.sin(delta)*Math.cos(b),
                Math.cos(a)*Math.sin(b)-Math.sin(a)*Math.cos(b)*Math.cos(delta)));
        }catch(IllegalArgumentException outside){return Double.NaN;}
    }
}
