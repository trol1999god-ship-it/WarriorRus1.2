package ru.warriorrus.app;

import android.app.*;
import android.view.*;
import android.widget.*;
import java.util.*;
import java.util.function.Consumer;
import ru.warriorrus.app.data.MapItem;

/** Local properties are collected before starting a manual drawing. */
public final class GeometryPropertiesDialog {
  private GeometryPropertiesDialog() {}

  public static final class State {
    private final MapItem value;private final EditText name;private final Spinner folder;
    private final List<Long> parents;private final AlertDialog dialog;
    private State(MapItem value,EditText name,Spinner folder,List<Long> parents,AlertDialog dialog){this.value=value;this.name=name;this.folder=folder;this.parents=parents;this.dialog=dialog;}
    public boolean isShowing(){return dialog.isShowing();}
    public void dismiss(){dialog.dismiss();}
    public MapItem snapshot(){value.name=name.getText().toString();value.parent=parents.get(folder.getSelectedItemPosition());return value;}
  }

  public static State show(Activity activity, MapItem source, List<MapItem> objects,
      Consumer<MapItem> accepted) {
    ReferenceMenu ui = new ReferenceMenu(activity);
    MapItem value = new MapItem();
    value.kind = source.kind; value.parent = source.parent; value.name = source.name;
    value.description = source.description; value.color = source.color;
    value.visible = source.visible; value.opacity = source.opacity; value.icon = source.icon;
    value.appearance=source.appearance.copy();
    LinearLayout form = new LinearLayout(activity);
    form.setOrientation(LinearLayout.VERTICAL);
    form.setPadding(ui.dp(18), ui.dp(8), ui.dp(18), ui.dp(8));
    TextView label = new TextView(activity); label.setText("Имя");
    label.setTextColor(ReferenceMenu.TEXT); label.setTextSize(14); form.addView(label);
    EditText name = new EditText(activity); name.setTag("geometryName");
    name.setSingleLine(true); name.setHint("Необязательно"); name.setText(source.name);
    form.addView(name, new LinearLayout.LayoutParams(-1, ui.dp(48)));
    List<Long> parents = new ArrayList<>(); List<String> names = new ArrayList<>();
    parents.add(0L); names.add("Несортированные метки");
    for (MapItem object : objects) if (object.isFolder() && !object.trashed) {
      parents.add(object.id); names.add(folderPath(object, objects));
    }
    Spinner folder = new Spinner(activity); folder.setTag("geometryFolder");
    folder.setContentDescription("Место сохранения");
    ArrayAdapter<String> adapter = new ArrayAdapter<>(activity,
        android.R.layout.simple_spinner_item, names);
    adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
    folder.setAdapter(adapter); int selected = parents.indexOf(source.parent);
    folder.setSelection(Math.max(0, selected));
    LinearLayout.LayoutParams location = new LinearLayout.LayoutParams(-1, ui.dp(56));
    location.topMargin = ui.dp(18); form.addView(folder, location);
    LinearLayout actions = new LinearLayout(activity);
    Button color = ui.action("", () -> chooseColor(activity, value));
    color.setContentDescription("Цвет"); ReferenceAssets.applyNamed(color,"app_action_color_24",24,true);
    actions.addView(color, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(44)));
    Button note = ui.action("", () -> {
      EditText description = new EditText(activity); description.setText(value.description);
      description.setHint("Описание"); description.setMinLines(3);
      new AlertDialog.Builder(activity).setTitle("Описание").setView(description)
          .setPositiveButton("ОК", (d,w) -> value.description = description.getText().toString())
          .setNegativeButton("Отмена", null).show();
    });
    note.setContentDescription("Описание"); ReferenceAssets.applyNamed(note,"app_action_description_24",24,true);
    actions.addView(note, new LinearLayout.LayoutParams(ui.dp(48), ui.dp(44)));
    Button more = ui.action("Ещё…", () -> new AlertDialog.Builder(activity).setTitle("Свойства")
        .setItems(new String[]{"Оформление и дополнительные свойства","Видимость и непрозрачность"},(menu,index)->{
          if(index==0){ObjectAppearanceDialog.show(activity,value,next->value.appearance=next);return;}
      LinearLayout options = new LinearLayout(activity); options.setOrientation(LinearLayout.VERTICAL);
      CheckBox visible = new CheckBox(activity); visible.setText("Отображать на карте"); visible.setChecked(value.visible);
      options.addView(visible); TextView opacity = new TextView(activity);
      opacity.setText("Непрозрачность"); options.addView(opacity);
      SeekBar alpha = new SeekBar(activity); alpha.setMax(100); alpha.setProgress(Math.round(value.opacity*100)); options.addView(alpha);
      new AlertDialog.Builder(activity).setTitle("Отображение").setView(options)
          .setPositiveButton("ОК", (d,w) -> {value.visible=visible.isChecked(); value.opacity=alpha.getProgress()/100f;})
          .setNegativeButton("Отмена", null).show();
    }).setNegativeButton("Закрыть",null).show());
    actions.addView(more, new LinearLayout.LayoutParams(0,ui.dp(44),1));
    LinearLayout.LayoutParams actionParams = new LinearLayout.LayoutParams(-1,-2);
    actionParams.topMargin=ui.dp(18); actionParams.bottomMargin=ui.dp(18); form.addView(actions,actionParams);
    ScrollView scroll = new ScrollView(activity); scroll.addView(form);
    String icon = "area".equals(value.kind)?"landmarks_explorer_cell_area_36":
        "route".equals(value.kind)?"landmarks_explorer_cell_route_36":"landmarks_explorer_cell_path_36";
    AlertDialog dialog = new AlertDialog.Builder(activity).setTitle(value.typeName())
        .setIcon(ReferenceAssets.drawable(activity,icon,36,true)).setView(scroll)
        .setPositiveButton("ОК", (d,w) -> {
          value.name=name.getText().toString().trim(); value.parent=parents.get(folder.getSelectedItemPosition());
          accepted.accept(value);
        }).setNegativeButton("Отмена",null).create();
    dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
    dialog.show(); name.requestFocus();
    return new State(value,name,folder,parents,dialog);
  }

  private static String folderPath(MapItem folder, List<MapItem> objects) {
    String path=folder.name; long parent=folder.parent; Set<Long> visited=new HashSet<>(); visited.add(folder.id);
    while(parent!=0 && visited.add(parent)) {
      MapItem found=null; for(MapItem object:objects) if(object.id==parent){found=object;break;}
      if(found==null)break; path=found.name+" / "+path; parent=found.parent;
    }
    return path;
  }

  private static void chooseColor(Activity activity, MapItem value) {
    String[] names={"Синий","Голубой","Красный","Зелёный","Жёлтый","Чёрный","Белый","Другой…"};
    int[] colors={0xff3f6db5,0xff00aaff,0xffdc3030,0xff238547,0xffffce30,0xff000000,0xffffffff};
    new AlertDialog.Builder(activity).setTitle("Цвет").setItems(names,(d,n)->{
      if(n<colors.length){value.color=colors[n];return;}
      EditText input=new EditText(activity); input.setSingleLine(true); input.setHint("#RRGGBB");
      input.setText(String.format(Locale.ROOT,"#%06X",value.color&0xffffff));
      AlertDialog custom=new AlertDialog.Builder(activity).setTitle("Цвет").setView(input)
          .setPositiveButton("ОК",null).setNegativeButton("Отмена",null).create();
      custom.setOnShowListener(v->custom.getButton(-1).setOnClickListener(w->{
        try {String text=input.getText().toString().trim();if(!text.matches("#[0-9a-fA-F]{6}"))throw new IllegalArgumentException();
          value.color=android.graphics.Color.parseColor(text);custom.dismiss();
        } catch(IllegalArgumentException error){input.setError("Введите цвет #RRGGBB");}
      }));custom.show();
    }).setNegativeButton("Отмена",null).show();
  }
}
