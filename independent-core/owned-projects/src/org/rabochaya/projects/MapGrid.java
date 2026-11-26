package org.rabochaya.projects;

import android.graphics.Canvas;
import android.graphics.DashPathEffect;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Typeface;

/** Draws local coordinate overlays without touching tile data or project objects. */
final class MapGrid {
    private static final double RADIUS = 6378137;
    private static final int SAMPLES = 32;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path path = new Path();
    private DashPathEffect secondaryStyle;
    private double cx, cy, world;
    private float width, height, inset, stroke;

    void draw(Canvas canvas, double cx, double cy, double world, int width, int height,
              float density, Typeface font, int primary, int secondary, boolean radiusRuler) {
        if (width <= 0 || height <= 0) return;
        this.cx = cx;
        this.cy = cy;
        this.world = world;
        this.width = width;
        this.height = height;
        inset = 4 * density;
        stroke = Math.max(1,density);
        paint.setStrokeWidth(stroke);
        paint.setTextSize(11 * density);
        paint.setTypeface(font);
        if (secondaryStyle == null) secondaryStyle = new DashPathEffect(new float[]{6*density,4*density},0);
        if (primary >= 0) drawGrid(canvas, primary, false, false);
        if (secondary >= 0 && secondary != primary) {
            boolean sameProjection = primary >= 0 && (primary < Coordinates.UTM)==(secondary < Coordinates.UTM);
            drawGrid(canvas, secondary, true, sameProjection);
        }
        if (radiusRuler) drawRuler(canvas);
    }

    private void drawGrid(Canvas canvas,int format,boolean secondary,boolean labelsOnly) {
        paint.setColor(secondary ? 0xfff0d99a : 0xffcbe9fa);
        paint.setPathEffect(secondary ? secondaryStyle : null);
        if (format < Coordinates.UTM) drawGeographic(canvas,format,secondary,labelsOnly);
        else drawProjected(canvas,format,secondary,labelsOnly);
    }

    private static double step(double minimum) {
        double order = Math.pow(10,Math.floor(Math.log10(minimum)));
        double ratio = minimum / order;
        return order * (ratio <= 1 ? 1 : ratio <= 2 ? 2 : ratio <= 5 ? 5 : 10);
    }

    private void drawGeographic(Canvas canvas,int format,boolean secondary,boolean labelsOnly) {
        double west = (cx-width/(2*world))*360-180, east = (cx+width/(2*world))*360-180;
        double top = Math.max(0,cy-height/(2*world)), bottom = Math.min(1,cy+height/(2*world));
        if (bottom <= top) return;
        double north = MapMath.lat(top), south = MapMath.lat(bottom);
        double lonStep = step((east-west)/6), latStep = step((north-south)/6);
        float topPixel = pixelY(top), bottomPixel = pixelY(bottom);
        for (double lon = Math.ceil(west/lonStep)*lonStep; lon <= east; lon += lonStep) {
            float x = pixelX((lon+180)/360-cx);
            if (!labelsOnly) line(canvas,x,topPixel,x,bottomPixel);
            label(canvas,Coordinates.gridAngle(MapMath.lon(MapMath.x(lon)),false,format,precision(lonStep)),
                  x+inset,secondary?bottomPixel-inset:topPixel+paint.getTextSize()+inset);
        }
        for (double lat = Math.ceil(south/latStep)*latStep; lat <= north; lat += latStep) {
            float y = pixelY(MapMath.y(lat));
            if (!labelsOnly) line(canvas,0,y,width,y);
            String text=Coordinates.gridAngle(lat,true,format,precision(latStep));
            label(canvas,text,secondary?width-paint.measureText(text)-inset:inset,y-inset);
        }
    }

    private static int precision(double step) {
        return Math.max(0,Math.min(8,(int)Math.ceil(-Math.log10(step))));
    }

    private void drawProjected(Canvas canvas,int format,boolean secondary,boolean labelsOnly) {
        double lat = MapMath.lat(cy);
        if (lat < -80 || lat >= 84) return;
        Coordinates.Grid centre = Coordinates.toUtm(lat,MapMath.lon(cx));
        double metresPerPixel = Math.cos(Math.toRadians(lat))*2*Math.PI*RADIUS/world;
        double interval = step(Math.max(width,height)*metresPerPixel/6);
        double reach = Math.min(2000000,Math.hypot(width,height)*metresPerPixel);
        for (boolean easting : new boolean[]{true,false}) {
            double origin=easting?centre.easting:centre.northing;
            double other=easting?centre.northing:centre.easting;
            for(double fixed=Math.ceil((origin-reach)/interval)*interval;fixed<=origin+reach;fixed+=interval) {
                projectedLine(canvas,centre,format,easting,fixed,other,reach,secondary,labelsOnly);
            }
        }
    }

    private void projectedLine(Canvas canvas,Coordinates.Grid centre,int format,boolean easting,
                               double fixed,double origin,double reach,boolean secondary,boolean labelsOnly) {
        path.rewind();
        boolean segment=false;
        float labelX=0,labelY=0;
        Coordinates.Position labelled=null;
        for(int i=0;i<=SAMPLES;i++){
            double varying=origin+reach*(2.0*i/SAMPLES-1);
            try{
                Coordinates.Position point=Coordinates.fromUtm(new Coordinates.Grid(centre.zone,centre.north,
                        easting?fixed:varying,easting?varying:fixed));
                if(Coordinates.zone(point.lat,point.lon)!=centre.zone){segment=false;continue;}
                float x=pixelX(MapMath.delta(MapMath.x(point.lon),cx)), y=pixelY(MapMath.y(point.lat));
                if(segment)path.lineTo(x,y);else path.moveTo(x,y);
                segment=true;
                if(x>=inset&&x<width-inset&&y>=paint.getTextSize()&&y<height-inset
                    &&(labelled==null||secondary)){
                    labelX=x;
                    labelY=y;
                    labelled=point;
                }
            }catch(IllegalArgumentException outside){segment=false;}
        }
        if(!labelsOnly){
            paint.setStyle(Paint.Style.STROKE);
            canvas.drawPath(path,paint);
        }
        if(labelled!=null){
            String text=format==Coordinates.MGRS
                ? Coordinates.mgrs(labelled.lat,labelled.lon,3)
                : Math.round(fixed)+(easting?" E":" N");
            label(canvas,text,Math.max(inset,Math.min(labelX+inset,width-paint.measureText(text)-inset)),labelY-inset);
        }
    }

    private void drawRuler(Canvas canvas) {
        double metresPerPixel=Math.cos(Math.toRadians(MapMath.lat(cy)))*2*Math.PI*RADIUS/world;
        double interval=step(Math.min(width,height)*metresPerPixel/8);
        paint.setPathEffect(null);
        for(int i=1;i<=3;i++){
            double metres=i*interval;
            float radius=(float)(metres/metresPerPixel);
            if(radius>=Math.min(width,height)/2)break;
            paint.setColor(0xffcbe9fa);
            paint.setStyle(Paint.Style.STROKE);
            path.rewind();
            double lat=Math.toRadians(MapMath.lat(cy)), angle=metres/RADIUS;
            for(int j=0;j<=64;j++){
                double bearing=j*Math.PI/32;
                double target=Math.asin(Math.sin(lat)*Math.cos(angle)+Math.cos(lat)*Math.sin(angle)*Math.cos(bearing));
                double lonDelta=Math.atan2(Math.sin(bearing)*Math.sin(angle)*Math.cos(lat),
                    Math.cos(angle)-Math.sin(lat)*Math.sin(target));
                float x=pixelX(lonDelta/(2*Math.PI)), y=pixelY(MapMath.y(Math.toDegrees(target)));
                if(j==0)path.moveTo(x,y);else path.lineTo(x,y);
            }
            path.close();
            canvas.drawPath(path,paint);
            String text=metres>=1000 ? (metres/1000)+" км" : Math.round(metres)+" м";
            label(canvas,text,width/2+inset,height/2-radius-inset);
        }
    }

    private void line(Canvas canvas,float x,float y,float otherX,float otherY) {
        paint.setStyle(Paint.Style.STROKE);
        canvas.drawLine(x,y,otherX,otherY,paint);
    }

    private void label(Canvas canvas,String text,float x,float y) {
        int color=paint.getColor();
        android.graphics.PathEffect effect=paint.getPathEffect();
        paint.setPathEffect(null);
        paint.setStyle(Paint.Style.STROKE);
        paint.setStrokeWidth(3*stroke);
        paint.setColor(0xff16344b);
        canvas.drawText(text,x,y,paint);
        paint.setStrokeWidth(stroke);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(color);
        canvas.drawText(text,x,y,paint);
        paint.setPathEffect(effect);
    }

    private float pixelX(double delta){return (float)(width/2+delta*world);}
    private float pixelY(double y){return (float)(height/2+(y-cy)*world);}
}
