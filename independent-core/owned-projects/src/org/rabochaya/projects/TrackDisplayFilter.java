package org.rabochaya.projects;

import java.util.ArrayList;
import java.util.List;

/** Filters obvious single-sample excursions in a display copy of one track segment. */
final class TrackDisplayFilter {
 private static final double MIN_EXCURSION_METRES=30;
 private static final double MAX_RETURN_METRES=10;

 private TrackDisplayFilter(){}

 static List<double[]> withoutSpikes(List<double[]> points){
  List<double[]> filtered=null;
  int last=points.size()-1;
  for(int i=1;i<last;i++){
   double[] start=points.get(i-1),candidate=points.get(i),end=points.get(i+1);
   double gap=distance(start,end);
   boolean skip=false;
   if(gap<=MAX_RETURN_METRES){
    double excursion=Math.min(distance(start,candidate),distance(candidate,end));
    skip=excursion>=MIN_EXCURSION_METRES&&gap<=excursion/10;
   }
   if(skip){
    if(filtered==null)filtered=new ArrayList<>(points.subList(0,i));
    filtered.add(end);
    i++;
   }else if(filtered!=null)filtered.add(candidate);
  }
  if(filtered==null)return points;
  if(filtered.get(filtered.size()-1)!=points.get(last))filtered.add(points.get(last));
  return filtered;
 }

 private static double distance(double[] a,double[] b){
  return DemProfile.metres(a[0],a[1],b[0],b[1]);
 }
}
