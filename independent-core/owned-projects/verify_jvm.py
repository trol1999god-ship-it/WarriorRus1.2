"""Run actual JVM checks of projection, hit testing, compass and tile planning."""
from pathlib import Path
import subprocess,tempfile,json,sys
root=Path(__file__).resolve().parent
modules=['ObjectEditorDraft','KmlXml','ObjectDescription','KmlTimeFilter','ObjectVisibility','ObjectListing','ObjectClipboard','ObjectTree','GeometryMapState','GeometryVertices','GeometryCoordinates','GeometryEdits','GeometryDraft','Coordinates','MapMath','MapHitTest','CompassMath','TileRegion','TileProjection','TileSource','MapCatalog','TileDownloadPlan']
tests=['ObjectEditorDraftTests','KmlXmlTests','ObjectDescriptionTests','KmlTimeFilterTests','ObjectVisibilityTests','ObjectListingTests','ObjectClipboardTests','ObjectTreeTests','GeometryMapStateTests','GeometryVerticesTests','GeometryCoordinatesTests','GeometryEditsTests','CoordinateTests','MapMathTests','MapHitTestTests','CompassMathTests','TileRegionTests']
with tempfile.TemporaryDirectory(prefix='rk-jvm-') as temp:
 w=Path(temp);compiler=w/'Compile.java';compiler.write_text('class Compile {public static void main(String[] args){int code=javax.tools.ToolProvider.getSystemJavaCompiler().run(null,System.out,System.err,args);if(code!=0)System.exit(code);}}')
 tests.append('UiTextTests')
 sources=[root/'src/org/rabochaya/projects'/f'{m}.java' for m in modules]+[root/'tests'/f'{m}.java' for m in tests]+[root/'tests/UiText.java']
 subprocess.run(['java',str(compiler),'-d',str(w),*map(str,sources)],check=True)
 results=[]
 for test in tests:
  name='org.rabochaya.projects.'+test if test=='TileRegionTests' else test
  result=subprocess.run(['java','-cp',str(w),name],text=True,capture_output=True)
  if result.returncode:
   print(result.stdout,end='');print(result.stderr,end='',file=sys.stderr);raise SystemExit(result.returncode)
  print(result.stdout.strip());results.append({'test':test,'result':result.stdout.strip()})
 (root.parent/'security/jvm-current.json').write_text(json.dumps(results,indent=2)+'\n')
