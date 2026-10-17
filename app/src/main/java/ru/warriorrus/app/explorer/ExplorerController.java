package ru.warriorrus.app.explorer;

import java.util.*;
import ru.warriorrus.app.data.*;

/** UI-independent selection and clipboard. Clipboard contents are IDs, never external files. */
public final class ExplorerController {
  public final Set<Long> selected = new LinkedHashSet<>();
  private final ObjectStore store;
  private List<Long> clipboard = new ArrayList<>();
  private boolean cut;
  public long folder;
  public String query = "";
  public boolean alphabetical;
  public long fromDate, toDate;
  public boolean descriptions;

  public ExplorerController(ObjectStore store) {
    this.store = store;
  }

  public void toggle(long id) {
    if (!selected.remove(id)) selected.add(id);
  }

  public void clipboard(boolean cut) {
    this.clipboard = store.roots(selected);
    this.cut = cut;
  }

  public boolean hasClipboard() {
    return !clipboard.isEmpty();
  }

  public void paste() {
    store.transfer(clipboard, folder, !cut);
    if (cut) clipboard.clear();
    selected.clear();
  }

  public List<MapItem> entries() {
    List<MapItem> result = new ArrayList<>();
    for (MapItem i : store.all())
      if ((query.isEmpty() && fromDate==0 && toDate==0 ? i.parent==folder
          : (i.name+(descriptions?" "+i.description:"")).toLowerCase(Locale.ROOT).contains(query.toLowerCase(Locale.ROOT)))
          && (fromDate==0 || i.created>=fromDate) && (toDate==0 || (i.created>0 && i.created<toDate))) result.add(i);
    if (alphabetical)
      result.sort(
          Comparator.comparing((MapItem i) -> !i.isFolder())
              .thenComparing(i -> i.name.toLowerCase(Locale.ROOT)));
    return result;
  }

  public void open(long id) {
    MapItem i = store.get(id);
    if (i == null || !i.isFolder()) throw new IllegalArgumentException("Папка не найдена");
    folder = id;
    query = "";
    selected.clear();
  }

  public String breadcrumb() {
    List<String> names = new ArrayList<>();
    for (MapItem i = store.get(folder); i != null; i = store.get(i.parent)) names.add(i.name);
    Collections.reverse(names);
    StringBuilder path = new StringBuilder("Рабочая карта");
    for (String name : names) path.append(" / ").append(name);
    return path.toString();
  }

  public void reconcile() {
    if (folder != 0 && store.get(folder) == null) folder = 0;
    selected.removeIf(id -> store.get(id) == null);
  }
}
