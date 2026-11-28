package org.rabochaya.projects;

import java.util.Arrays;
import java.util.List;

public final class TrackDisplayFilterTests {
 public static void main(String[] args){
  double[] start={10,20,1},spike={10,20.001,2},back={10,20.00001,3},end={10,20.0002,4};
  List<double[]> raw=Arrays.asList(start,spike,back,end);
  List<double[]> filtered=TrackDisplayFilter.withoutSpikes(raw);
  if(filtered.size()!=3||filtered.get(0)!=start||filtered.get(1)!=back||filtered.get(2)!=end||raw.size()!=4)
   throw new AssertionError("isolated excursion and original points");
  List<double[]> bend=Arrays.asList(start,spike,new double[]{10.001,20.001,4});
  if(TrackDisplayFilter.withoutSpikes(bend)!=bend)throw new AssertionError("ordinary bend");
  System.out.println("Track display filter checks passed");
 }
}
