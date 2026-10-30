package org.rabochaya.projects;

import android.app.*;
import android.content.*;
import android.os.Bundle;
import android.view.*;
import android.widget.*;
import java.io.*;
import java.util.*;
import java.util.concurrent.*;
import org.w3c.dom.Element;

/** Own editor of individual routes, polygon boundaries and MultiGeometry parts. */
public final class GeometryEditorActivity extends Activity {
    private long project;
    private String featureId;
    private List<GeometryEdits.Part> parts;
    private LinearLayout root;
    private TextView status;
    private Spinner selector;
    private EditText input;
    private FrameLayout body;
    private Button mode;
    private GeometryMapState mapState;
    private GeometryMapCanvas mapCanvas;
    private boolean mapMode,restoreMap;
    private GeometryDraft ownedDraft;
    private int restoreSelection=-1;
    private double[] mapViewport;
    private String preferredKey;
    private Button save,more,close;
    private Toast notice;
    private final ExecutorService worker=Executors.newSingleThreadExecutor();
    private boolean busy,disposed,selecting,addingHole,orphan;
    private int current=-1;
    private String expected,base="";

    public static void open(Activity parent,long project,String feature) {
        parent.startActivity(new Intent(parent,GeometryEditorActivity.class).putExtra("project",project).putExtra("feature",feature));
    }
    private File drafts(){return new File(getFilesDir(),"geometry-drafts");}
    protected void onCreate(Bundle state) {
        super.onCreate(state);project=getIntent().getLongExtra("project",-1);featureId=getIntent().getStringExtra("feature");
        if(state!=null){restoreMap=state.getBoolean("geometry_map",false);restoreSelection=state.getInt("geometry_selected",-1);mapViewport=state.getDoubleArray("geometry_viewport");preferredKey=state.getString("geometry_part");}
        getWindow().setStatusBarColor(0xff1c2518);getWindow().setNavigationBarColor(0xff1c2518);
        root=new LinearLayout(this);root.setOrientation(1);int pad=WorkspaceUi.dp(this,12);root.setPadding(pad,pad,pad,pad);root.setBackgroundColor(0xff232d1d);setContentView(root);
        status=label("Открытие геометрии…",16);root.addView(status);load();
    }
    private TextView label(String text,int size){TextView v=new TextView(this);v.setText(text);v.setTextColor(-1);v.setTextSize(size);v.setTypeface(WorkspaceUi.font(this));return v;}
    private Button button(LinearLayout parent,String text,Runnable action){Button b=new Button(this);b.setText(text);b.setAllCaps(false);b.setTypeface(WorkspaceUi.font(this));parent.addView(b,new LinearLayout.LayoutParams(-1,-2));b.setOnClickListener(v->{if(!busy)action.run();});return b;}
    private void enabled(boolean on){busy=!on;for(View v:new View[]{selector,more,close,mode})if(v!=null)v.setEnabled(on);if(input!=null)input.setEnabled(on&&!orphan);if(save!=null)save.setEnabled(on&&!orphan);if(mode!=null)mode.setEnabled(on&&!orphan);if(mapCanvas!=null)mapCanvas.setEditingEnabled(on&&!orphan);}
    private void actions(){
        final List<String> choices=new ArrayList<>();GeometryEdits.Part part=parts.get(current);
        if(!orphan&&!addingHole&&part.polygon&&!part.hole)choices.add("Добавить внутренний контур");
        if(!orphan&&!addingHole&&part.hole)choices.add("Удалить внутренний контур");
        if(!orphan)choices.add("Редактировать вершины");
        choices.add("Копировать ввод");choices.add("Перечитать объект");
        new AlertDialog.Builder(this).setTitle("Действия с контуром").setItems(choices.toArray(new String[choices.size()]),(d,w)->{String selected=choices.get(w);if(selected.equals("Редактировать вершины")){textMode();vertices();}else if(selected.equals("Добавить внутренний контур"))newHole();else if(selected.equals("Удалить внутренний контур")){if(dirty()){status.setText("Сначала сохраните или отмените текущий ввод");return;}new AlertDialog.Builder(this).setMessage("Удалить только выбранный внутренний контур? Остальная область сохраняется.").setPositiveButton("Удалить контур",(dialog,which)->write(true)).setNegativeButton("Отмена",null).show();}else if(selected.equals("Перечитать объект"))discardReload();else{android.content.ClipboardManager clipboard=(android.content.ClipboardManager)getSystemService(CLIPBOARD_SERVICE);if(clipboard!=null)clipboard.setPrimaryClip(ClipData.newPlainText("Координаты WGS 84",input.getText().toString()));}}).setNegativeButton("Закрыть",null).show();
    }
    private void vertices(){
        final String text=input.getText().toString(),type=addingHole?"Polygon":parts.get(current).type;
        final List<String> rows;
        try{rows=GeometryVertices.rows(text,type);}catch(IllegalArgumentException e){input.setError(e.getMessage());return;}
        String[] names=new String[rows.size()];for(int i=0;i<names.length;i++)names[i]=(i+1)+". "+rows.get(i);
        new AlertDialog.Builder(this).setTitle("Вершины: широта долгота высота").setItems(names,(d,index)->{
            List<String> titles=new ArrayList<>(),operations=new ArrayList<>();
            titles.add("Изменить координаты");operations.add("replace");
            if(!"Point".equals(type)){
                titles.add("Вставить перед");operations.add("before");titles.add("Вставить после");operations.add("after");
                if(index>0){titles.add("Выше в списке");operations.add("up");}
                if(index+1<rows.size()){titles.add("Ниже в списке");operations.add("down");}
                titles.add("Удалить вершину");operations.add("delete");
            }
            new AlertDialog.Builder(this).setTitle("Вершина "+(index+1)).setItems(titles.toArray(new String[titles.size()]),(dialog,which)->{
                final String operation=operations.get(which);
                if(operation.equals("replace")||operation.equals("before")||operation.equals("after")){
                    EditText value=new EditText(this);value.setSingleLine(true);value.setText(rows.get(index));value.setSelectAllOnFocus(true);value.setContentDescription("Координаты вершины WGS 84");
                    AlertDialog edit=new AlertDialog.Builder(this).setTitle(titles.get(which)).setMessage("Широта долгота [высота], разделитель — пробел").setView(value).setPositiveButton("Применить",null).setNegativeButton("Отмена",null).create();
                    edit.setOnShowListener(shown->edit.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v->{if(applyVertex(text,type,index,operation,value.getText().toString(),value))edit.dismiss();}));edit.show();
                }else if(operation.equals("delete"))new AlertDialog.Builder(this).setMessage("Удалить вершину "+(index+1)+" из текущего ввода?").setPositiveButton("Удалить",(confirmed,whichButton)->applyVertex(text,type,index,operation,null,null)).setNegativeButton("Отмена",null).show();
                else applyVertex(text,type,index,operation,null,null);
            }).setNegativeButton("Отмена",null).show();
        }).setNegativeButton("Закрыть",null).show();
    }
    private boolean applyVertex(String original,String type,int index,String operation,String point,EditText field){
        if(busy||disposed||!input.getText().toString().equals(original)){status.setText("Ввод изменился; выберите вершину заново");return false;}
        try{String updated=GeometryVertices.edit(original,type,index,operation,point);clearNotice();input.setText(updated);input.setError(null);status.setText("Вершины изменены во вводе. Для записи объекта нажмите «Сохранить»");return true;}
        catch(IllegalArgumentException e){if(field!=null)field.setError(e.getMessage());else status.setText(e.getMessage());return false;}
    }
    private void load(){
        if(mapMode)restoreMap=true;releaseMap();mapMode=false;mapState=null;
        enabled(false);status.setText("Открытие геометрии…");
        worker.execute(()->{ProjectStore store=new ProjectStore(this);try{
            Element feature=store.load(project).byId(featureId);if(feature==null)throw new IOException("Объект больше не существует");
            final List<GeometryEdits.Part> found=GeometryEdits.parts(feature);if(found.isEmpty())throw new IOException("Нет поддерживаемых контуров для редактирования");
            GeometryDraft draft=null;String warning="";try{draft=GeometryDraft.load(drafts(),project,featureId);}catch(IOException e){warning=e.getMessage();}
            final GeometryDraft restored=draft;final String message=warning;
            runOnUiThread(()->{if(!disposed){parts=found;build(restored,message);}});
        }catch(final Exception e){runOnUiThread(()->{if(!disposed){busy=false;status.setText("Не удалось открыть геометрию: "+e.getMessage());if(root.getChildCount()==1)button(root,"Закрыть",()->finish());}});}finally{store.close();}});
    }
    private void build(GeometryDraft draft,String warning){
        root.removeAllViews();root.addView(label("Координаты и контуры",21));selector=new Spinner(this);selector.setBackgroundColor(-1);selector.setContentDescription("Выбор геометрии и контура");String[] names=new String[parts.size()];for(int i=0;i<names.length;i++)names[i]=parts.get(i).name;ArrayAdapter<String> adapter=new ArrayAdapter<>(this,android.R.layout.simple_spinner_item,names);adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);selector.setAdapter(adapter);root.addView(selector);
        root.addView(label("WGS 84: широта долгота [высота], одна вершина в строке",12));
        mode=button(root,"Редактировать на карте",()->{if(mapMode)textMode();else openMap();});
        input=new EditText(this);input.setTextColor(0xff202020);input.setBackgroundColor(-1);input.setTypeface(WorkspaceUi.font(this));input.setGravity(Gravity.TOP|Gravity.LEFT);input.setInputType(android.text.InputType.TYPE_CLASS_TEXT|android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE|android.text.InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);input.setSaveEnabled(false);input.setFilters(new android.text.InputFilter[]{new android.text.InputFilter.LengthFilter(500000)});body=new FrameLayout(this);body.addView(input,new FrameLayout.LayoutParams(-1,-1));root.addView(body,new LinearLayout.LayoutParams(-1,0,1));
        status=label("",12);root.addView(status);LinearLayout actions=new LinearLayout(this);root.addView(actions,new LinearLayout.LayoutParams(-1,WorkspaceUi.dp(this,54)));
        save=button(actions,"Сохранить",()->write(false));more=button(actions,"Действия",()->actions());close=button(actions,"Закрыть",()->onBackPressed());for(int n=0;n<actions.getChildCount();n++)actions.getChildAt(n).setLayoutParams(new LinearLayout.LayoutParams(0,-1,1));
        current=0;String wanted=draft!=null?draft.key:preferredKey;if(wanted!=null)for(int i=0;i<parts.size();i++)if(parts.get(i).key.equals(wanted)){current=i;break;}
        double[] previousViewport=mapViewport;selecting=true;selector.setSelection(current);selecting=false;showPart(current);if(restoreMap)mapViewport=previousViewport;
        if(draft!=null){GeometryEdits.Part part=parts.get(current);if(part.key.equals(draft.key)){input.setText(draft.text);expected=draft.token;addingHole=draft.addingHole;status.setText(draft.token.equals(part.token)?"Восстановлен локальный черновик":"Геометрия изменилась; черновик сохранён. Перед записью перечитайте объект");}else{orphan=true;input.setText(draft.text);expected=draft.token;status.setText("Контур черновика больше не найден. Ввод сохранён; можно скопировать его или перечитать объект");}}
        ownedDraft=draft;if(!warning.isEmpty())status.setText(warning);
        selector.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener(){public void onNothingSelected(AdapterView<?> p){}public void onItemSelected(AdapterView<?> p,View v,int position,long id){if(selecting||position==current)return;if(dirty()){final int old=current;selecting=true;selector.setSelection(old);selecting=false;new AlertDialog.Builder(GeometryEditorActivity.this).setMessage("Сменить контур и отменить несохранённый ввод?").setPositiveButton("Сменить контур",(d,w)->{try{GeometryDraft.delete(drafts(),project,featureId);choosePart(position);selecting=true;selector.setSelection(position);selecting=false;enabled(true);}catch(IOException e){status.setText(e.getMessage());}}).setNegativeButton("Продолжить редактирование",null).show();}else{choosePart(position);enabled(true);}}});enabled(true);if(restoreMap&&!orphan){restoreMap=false;openMap();}
    }
    private void showPart(int index){releaseMap();mapMode=false;mapState=null;mapViewport=null;orphan=false;current=index;GeometryEdits.Part part=parts.get(index);preferredKey=part.key;expected=part.token;base=part.text;addingHole=false;input.setText(base);body.removeAllViews();body.addView(input,new FrameLayout.LayoutParams(-1,-1));mode.setText("Редактировать на карте");status.setText(part.name);}
    private void choosePart(int index){if(!dirty()&&!persist())return;ownedDraft=null;boolean onMap=mapMode;showPart(index);if(onMap)openMap();}
    private void releaseMap(){if(mapCanvas!=null){mapViewport=mapCanvas.viewport();mapCanvas.close();mapCanvas=null;}}
    private void textMode(){if(!mapMode)return;releaseMap();mapMode=false;body.removeAllViews();body.addView(input,new FrameLayout.LayoutParams(-1,-1));mode.setText("Редактировать на карте");status.setText("Координаты текущего ввода. Для записи объекта нажмите «Сохранить»");}
    private void openMap(){
        if(busy||orphan||current<0)return;
        try{
            String type=addingHole?"Polygon":parts.get(current).type,text=input.getText().toString();
            if(mapState==null||!mapState.text().equals(text)||!mapState.type.equals(type)||mapState.incompleteAllowed!=addingHole)mapState=new GeometryMapState(text,type,addingHole);
            for(int i=0;i<mapState.size();i++)if(Math.abs(mapState.point(i)[1])>85.05112878)throw new IllegalArgumentException("Эта карта отображает широты до ±85.05112878°. Для полярных вершин используйте список координат");
            if(restoreSelection>=0&&restoreSelection<mapState.size())mapState.select(restoreSelection);restoreSelection=-1;
            input.clearFocus();android.view.inputmethod.InputMethodManager keyboard=(android.view.inputmethod.InputMethodManager)getSystemService(INPUT_METHOD_SERVICE);if(keyboard!=null)keyboard.hideSoftInputFromWindow(root.getWindowToken(),0);
            mapCanvas=new GeometryMapCanvas(this,project,mapState,parts,parts.get(current).key,addingHole,mapViewport,new GeometryMapCanvas.Listener(){
                public void changed(){if(disposed||busy||mapCanvas==null)return;clearNotice();input.setText(mapState.text());input.setError(null);if(persist())mapMessage((mapState.selected()>=0?"Вершина "+(mapState.selected()+1)+", высота "+mapState.point(mapState.selected())[2]+" м. ":"")+(mapState.complete()?"Ввод изменён; нажмите «Сохранить»":"Новый контур: нужны минимум три разные вершины"));}
                public void message(String message){if(!disposed)mapMessage(message);}
            });
            body.removeAllViews();body.addView(mapCanvas,new FrameLayout.LayoutParams(-1,-1));mapMode=true;mode.setText("Координаты списком");mapMessage("Коснитесь вершины и перетащите. Свободное место — перемещение карты, два пальца — масштаб");
        }catch(IllegalArgumentException e){input.setError(e.getMessage());status.setText(e.getMessage());}
    }
    private void mapMessage(String message){boolean stale=current>=0&&!expected.equals(parts.get(current).token);status.setText((stale?"Геометрия изменилась; запись будет отклонена. ":"")+message);}

    private boolean dirty(){return input!=null&&current>=0&&(orphan||addingHole||!expected.equals(parts.get(current).token)||!input.getText().toString().equals(base));}
    private boolean persist(){if(busy||orphan)return true;try{if(!dirty()){if(ownedDraft!=null){if(!GeometryDraft.discardIfMatches(drafts(),project,featureId,ownedDraft))throw new IOException("Более новый черновик оставлен. Перечитайте объект");ownedDraft=null;}return true;}GeometryDraft next=new GeometryDraft(parts.get(current).key,expected,input.getText().toString(),addingHole);next.save(drafts(),project,featureId);ownedDraft=next;return true;}catch(Exception e){status.setText("Черновик не сохранён: "+e.getMessage());return false;}}
    private void clearNotice(){if(notice!=null){notice.cancel();notice=null;}}
    private void newHole(){if(dirty()){status.setText("Сначала сохраните или отмените текущий ввод");return;}clearNotice();boolean onMap=mapMode;textMode();mapState=null;addingHole=true;input.setText("");status.setText("Новый внутренний контур: минимум три разные вершины");enabled(true);if(onMap)openMap();}
    private void discardReload(){new AlertDialog.Builder(this).setMessage("Перечитать объект и удалить локальный черновик этого объекта?").setPositiveButton("Перечитать",(d,w)->{try{GeometryDraft.delete(drafts(),project,featureId);base=input.getText().toString();addingHole=false;orphan=false;load();}catch(IOException e){status.setText(e.getMessage());}}).setNegativeButton("Отмена",null).show();}
    private void write(boolean deleting){
        if(current<0||busy)return;if(mapCanvas!=null)mapCanvas.cancelGesture();if(notice!=null){notice.cancel();notice=null;}final GeometryEdits.Part part=parts.get(current);final String text=input.getText().toString(),token=expected;final boolean hole=addingHole;
        if(!deleting)try{GeometryCoordinates.parse(text,hole?"Polygon":part.type);}catch(IllegalArgumentException e){input.setError(e.getMessage());status.setText(e.getMessage());return;}
        if(!persist())return;final GeometryDraft writtenDraft=ownedDraft;enabled(false);status.setText("Сохранение геометрии…");
        worker.execute(()->{ProjectStore store=new ProjectStore(this);try{
            KmlProject doc=store.load(project);Element feature=doc.byId(featureId);if(feature==null)throw new IOException("Объект удалён; черновик сохранён");
            if(deleting)GeometryEdits.removeHole(feature,part.key,token);else if(hole)GeometryEdits.addHole(feature,part.key,token,text);else GeometryEdits.replace(feature,part.key,token,text);
            String focus=part.key;
            if(hole){String prefix=part.key.substring(0,part.key.length()-"/outer".length())+"/inner/";for(GeometryEdits.Part candidate:GeometryEdits.parts(feature))if(candidate.key.startsWith(prefix))focus=candidate.key;}
            else if(deleting)focus=part.key.substring(0,part.key.indexOf("/inner/"))+"/outer";
            final String focusKey=focus;
            store.saveDocument(project,doc);String warning="";try{if(writtenDraft!=null&&!GeometryDraft.discardIfMatches(drafts(),project,featureId,writtenDraft))warning=" · Более новый черновик оставлен";}catch(IOException e){warning=" · "+e.getMessage();}final String message="Геометрия сохранена"+warning;
            runOnUiThread(()->{if(!disposed){base=text;addingHole=false;input.setText(text);preferredKey=focusKey;notice=Toast.makeText(this,message,Toast.LENGTH_LONG);notice.show();load();}});
        }catch(final Exception e){runOnUiThread(()->{if(!disposed){enabled(true);status.setText("Не удалось сохранить: "+e.getMessage());}});}finally{store.close();}});
    }
    public void onBackPressed(){if(busy){status.setText("Дождитесь окончания операции");return;}if(!dirty()){finish();return;}new AlertDialog.Builder(this).setMessage("Сохранить ввод как локальный черновик и закрыть редактор?").setPositiveButton("Сохранить черновик",(d,w)->{if(persist())finish();}).setNegativeButton("Продолжить редактирование",null).setNeutralButton("Отменить ввод",(d,w)->{try{GeometryDraft.delete(drafts(),project,featureId);base=input.getText().toString();addingHole=false;finish();}catch(IOException e){status.setText(e.getMessage());}}).show();}
    protected void onSaveInstanceState(Bundle state){if(mapCanvas!=null)mapCanvas.cancelGesture();persist();state.putBoolean("geometry_map",mapMode);state.putString("geometry_part",current>=0?parts.get(current).key:preferredKey);state.putInt("geometry_selected",mapState==null?-1:mapState.selected());state.putDoubleArray("geometry_viewport",mapCanvas==null?mapViewport:mapCanvas.viewport());super.onSaveInstanceState(state);}
    protected void onPause(){if(mapCanvas!=null)mapCanvas.suspend(true);persist();super.onPause();}
    protected void onResume(){super.onResume();if(mapCanvas!=null)mapCanvas.suspend(false);}
    protected void onDestroy(){disposed=true;releaseMap();if(notice!=null)notice.cancel();worker.shutdown();super.onDestroy();}
}
