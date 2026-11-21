package org.rabochaya.projects;
import android.graphics.*;
/** Local bounded static SVG → pixels. No external renderer, fonts, URI or network loaders. */
public final class SvgRaster {
 private SvgRaster(){}
 public static Bitmap render(SvgIcon icon){int width=Math.max(1,(int)Math.ceil(icon.pixelWidth)),height=Math.max(1,(int)Math.ceil(icon.pixelHeight));if(width>256||height>256)throw new IllegalArgumentException("SVG: размер изображения больше256px");Bitmap result=Bitmap.createBitmap(width,height,Bitmap.Config.ARGB_8888);boolean good=false;try{Canvas canvas=new Canvas(result);canvas.clipRect(0,0,width,height);double scale=Math.min(width/icon.width,height/icon.height);canvas.translate((float)((width-icon.width*scale)/2-icon.left*scale),(float)((height-icon.height*scale)/2-icon.top*scale));canvas.scale((float)scale,(float)scale);Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);paint.setStrokeJoin(Paint.Join.MITER);paint.setStrokeCap(Paint.Cap.BUTT);paint.setStrokeMiter(4);
  for(SvgIcon.Shape shape:icon.shapes){if(shape.path.isEmpty())continue;Path path=new Path();path.setFillType(shape.evenOdd?Path.FillType.EVEN_ODD:Path.FillType.WINDING);for(SvgPath.Segment segment:shape.path){double[] v=segment.values;switch(segment.command){case 'M':path.moveTo((float)v[0],(float)v[1]);break;case 'L':path.lineTo((float)v[0],(float)v[1]);break;case 'Q':path.quadTo((float)v[0],(float)v[1],(float)v[2],(float)v[3]);break;case 'C':path.cubicTo((float)v[0],(float)v[1],(float)v[2],(float)v[3],(float)v[4],(float)v[5]);break;case 'Z':path.close();break;default:throw new IllegalArgumentException("SVG: неизвестный сегмент");}}
   if(shape.fill!=null){paint.setStyle(Paint.Style.FILL);paint.setColor(shape.fill);canvas.drawPath(path,paint);}if(shape.stroke!=null&&shape.strokeWidth>0){paint.setStyle(Paint.Style.STROKE);paint.setColor(shape.stroke);paint.setStrokeWidth((float)shape.strokeWidth);canvas.drawPath(path,paint);}
  }good=true;return result;
 }finally{if(!good)result.recycle();}}
}
