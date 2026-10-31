import org.rabochaya.maptests.UiText;
import java.util.Locale;

public final class UiTextTests {
 static int checks;
 static void check(boolean value){if(!value)throw new AssertionError("UiText check "+checks);checks++;}
 public static void main(String[] args){
  String button="android.widget.Button",label="android.widget.TextView";
  for(Locale locale:new Locale[]{Locale.ROOT,Locale.US,new Locale("ru"),new Locale("tr")}){
   check(UiText.matches("Сохранить MBTiles",button,"Сохранить MBTiles",true,locale));
   check(UiText.matches("Сохранить MBTiles".toUpperCase(locale),button,"Сохранить MBTiles",true,locale));
   check(UiText.matches("СОХРАНИТЬ MBTILES",button,"Сохранить",false,locale));
   check(!UiText.matches("СОХРАНИТЬ MBTILES",button,"Сохранить",true,locale));
   check(!UiText.matches("СОХРАНИТЬ MBTILES",label,"Сохранить MBTiles",true,locale));
   check(!UiText.matches("CLIP_SOURCE",label,"clip_source",false,locale));
   check(!UiText.matches("сохранить mbtiles",button,"Сохранить MBTiles",true,locale));
   check(!UiText.matches(null,button,"Сохранить MBTiles",true,locale));
   check(!UiText.matches("СОХРАНИТЬ MBTILES",null,"Сохранить MBTiles",true,locale));
   check(!UiText.matches("ОТМЕНА",button,"Сохранить MBTiles",true,locale));
   check(UiText.matches("QA_Point",label,"QA_Point",true,locale));
  }
  check(!UiText.matches("СОХРАНИТЬ MBTILES","android.widget.EditText","Сохранить MBTiles",true,Locale.ROOT));
  check(UiText.matches("Сохранить MBTiles",label,"Сохранить",false,Locale.ROOT));
  System.out.println("PASS UiText: "+checks+" assertions");
 }
}
