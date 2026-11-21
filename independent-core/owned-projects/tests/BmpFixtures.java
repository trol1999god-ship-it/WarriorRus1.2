package org.rabochaya.maptests;
/** Independent BMP controls with visible padding and deliberately varying reserved high bytes. */
public final class BmpFixtures {
 private BmpFixtures(){}
 public static byte[] field(byte[] input,int at,long value,int length){byte[] data=input.clone();for(int i=0;i<length;i++)data[at+i]=(byte)(value>>8*i);return data;}
 static void put(byte[] a,int at,long value,int count){for(int i=0;i<count;i++)a[at+i]=(byte)(value>>8*i);}
 public static byte[] image(int width,int height,int bits,boolean topDown,int gap){int samples=bits/8,stride=((width*samples+3)/4)*4,start=54+gap;byte[] data=new byte[start+stride*height];data[0]=66;data[1]=77;put(data,2,data.length,4);put(data,10,start,4);put(data,14,40,4);put(data,18,width,4);put(data,22,topDown?-height:height,4);put(data,26,1,2);put(data,28,bits,2);put(data,34,stride*height,4);for(int i=54;i<data.length;i++)data[i]=(byte)0xed;for(int y=0;y<height;y++)for(int x=0;x<width;x++){int at=start+(topDown?y:height-1-y)*stride+x*samples;data[at]=(byte)(100+x*3+y*5);data[at+1]=(byte)(20+x*7+y*11);data[at+2]=(byte)(40+x*13+y*17);if(samples==4)data[at+3]=(byte)((x+y)%3==0?0:(x+y)%3==1?128:255);}return data;}
}
