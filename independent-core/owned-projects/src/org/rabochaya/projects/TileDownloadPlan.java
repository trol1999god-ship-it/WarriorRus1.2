package org.rabochaya.projects;
import java.util.*;
/** Every constituent layer is downloaded in its own projection and cache. */
public final class TileDownloadPlan {
 public final TileSource[] sources;public final TileRegion[] regions;public final long count;
 public TileDownloadPlan(TileSource source,double west,double south,double east,double north,int min,int max){
  if(min<source.minZoom||max>source.maxZoom||min>max)throw new IllegalArgumentException("Масштабы источника: "+source.minZoom+"–"+source.maxZoom);
  ArrayList<TileSource> s=new ArrayList<>();ArrayList<TileRegion> r=new ArrayList<>();long total=0;
  for(TileSource leaf:source.leafs()){int lo=Math.max(min,leaf.minZoom),hi=Math.min(max,leaf.maxZoom);if(lo>hi)continue;for(int z=lo;z<=hi;z++)if(!leaf.canDownload(z))throw new IllegalArgumentException("Источник «"+leaf.name+"» не разрешает скачивание области на z"+z+"; просмотренный кеш сохраняется автоматически");TileRegion region=new TileRegion(west,south,east,north,lo,hi,leaf.ellipsoid);total+=region.count;if(total>TileRegion.MAX_TILES)throw new IllegalArgumentException("Суммарно во всех слоях больше 20 000 тайлов");s.add(leaf);r.add(region);}
  if(total<1)throw new IllegalArgumentException("В выбранных масштабах нет тайлов");count=total;sources=s.toArray(new TileSource[0]);regions=r.toArray(new TileRegion[0]);
 }
}
