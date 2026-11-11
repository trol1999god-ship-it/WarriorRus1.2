.class public final Lorg/rabochaya/projects/CompositionDownloadActivity;
.super Landroid/app/Activity;
.source "CompositionDownloadActivity.java"


# instance fields
.field private volatile active:Lorg/rabochaya/projects/OnlineTiles;

.field private busy:Z

.field private calculate:Landroid/widget/Button;

.field private volatile cancelled:Z

.field private final choices:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Landroid/widget/CheckBox;",
            ">;"
        }
    .end annotation
.end field

.field private volatile disposed:Z

.field private final fields:[Landroid/widget/EditText;

.field private final offered:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/rabochaya/projects/MapComposition$Layer;",
            ">;"
        }
    .end annotation
.end field

.field private project:J

.field private resume:Landroid/widget/Button;

.field private snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

.field private status:Landroid/widget/TextView;

.field private final worker:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 4
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 5
    const/4 v0, 0x6

    new-array v0, v0, [Landroid/widget/EditText;

    iput-object v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->fields:[Landroid/widget/EditText;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->choices:Ljava/util/LinkedHashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->offered:Ljava/util/Map;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->worker:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .locals 4

    .line 18
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 p2, 0x0

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    const/4 v1, 0x4

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setMinHeight(I)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setMinimumHeight(I)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v1, p2, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0, p3}, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/CompositionDownloadActivity;Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method private calculate()V
    .locals 15

    .line 20
    const/4 v0, 0x4

    :try_start_0
    new-array v1, v0, [D

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_0

    iget-object v4, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->fields:[Landroid/widget/EditText;

    aget-object v4, v4, v3

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x2c

    const/16 v6, 0x2e

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    aput-wide v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iget-object v4, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->choices:Ljava/util/LinkedHashMap;

    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/widget/CheckBox;

    invoke-virtual {v6}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v6

    if-eqz v6, :cond_1

    iget-object v6, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->offered:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/rabochaya/projects/MapComposition$Layer;

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    new-instance v13, Lorg/rabochaya/projects/CompositionDownloadJob;

    new-instance v4, Lorg/rabochaya/projects/MapComposition;

    iget-wide v5, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    invoke-direct {v4, v5, v6, v3}, Lorg/rabochaya/projects/MapComposition;-><init>(JLjava/util/List;)V

    aget-wide v5, v1, v2

    const/4 v2, 0x1

    aget-wide v7, v1, v2

    const/4 v2, 0x2

    aget-wide v9, v1, v2

    const/4 v2, 0x3

    aget-wide v11, v1, v2

    iget-object v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->fields:[Landroid/widget/EditText;

    aget-object v0, v1, v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->fields:[Landroid/widget/EditText;

    const/4 v2, 0x5

    aget-object v1, v1, v2

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    move-object v1, v13

    move-object v2, v4

    move-wide v3, v5

    move-wide v5, v7

    move-wide v7, v9

    move-wide v9, v11

    move v11, v0

    move v12, v14

    invoke-direct/range {v1 .. v12}, Lorg/rabochaya/projects/CompositionDownloadJob;-><init>(Lorg/rabochaya/projects/MapComposition;DDDDII)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u0417\u0430\u0433\u0440\u0443\u0437\u0438\u0442\u044c \u043e\u0431\u043b\u0430\u0441\u0442\u044c \u0434\u043b\u044f "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v13, Lorg/rabochaya/projects/CompositionDownloadJob;->tasks:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u0443\u043d\u0438\u043a\u0430\u043b\u044c\u043d\u044b\u0445 \u0442\u0430\u0439\u043b\u043e\u0432: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v13, Lorg/rabochaya/projects/CompositionDownloadJob;->composition:Lorg/rabochaya/projects/MapComposition;

    invoke-static {v2}, Lorg/rabochaya/projects/CompositionDownloadActivity;->names(Lorg/rabochaya/projects/MapComposition;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "? "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    iget-object v2, v2, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    if-nez v2, :cond_3

    const-string v2, ""

    goto :goto_2

    :cond_3
    const-string v2, "\u041f\u0440\u0435\u0436\u043d\u0435\u0435 \u0437\u0430\u0434\u0430\u043d\u0438\u0435 \u0431\u0443\u0434\u0435\u0442 \u0437\u0430\u043c\u0435\u043d\u0435\u043d\u043e, \u043f\u043e\u043b\u0443\u0447\u0435\u043d\u043d\u044b\u0439 \u043a\u0435\u0448 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d. "

    :goto_2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\u0421\u043a\u0430\u0447\u0438\u0432\u0430\u043d\u0438\u0435 \u0438\u0434\u0451\u0442, \u043f\u043e\u043a\u0430 \u043e\u0442\u043a\u0440\u044b\u0442 \u044d\u043a\u0440\u0430\u043d; \u043f\u043e\u0441\u043b\u0435 \u043e\u0441\u0442\u0430\u043d\u043e\u0432\u043a\u0438 \u043f\u0440\u043e\u0434\u043e\u043b\u0436\u0435\u043d\u0438\u0435 \u0442\u043e\u043b\u044c\u043a\u043e \u044f\u0432\u043d\u043e."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0421\u043a\u0430\u0447\u0430\u0442\u044c"

    new-instance v2, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda8;

    invoke-direct {v2, p0, v13}, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda8;-><init>(Lorg/rabochaya/projects/CompositionDownloadActivity;Lorg/rabochaya/projects/CompositionDownloadJob;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda9;

    invoke-direct {v1, p0, v0}, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda9;-><init>(Lorg/rabochaya/projects/CompositionDownloadActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    iget-object v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->status:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u041d\u0435 \u0440\u0430\u0441\u0441\u0447\u0438\u0442\u0430\u043d\u043e: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_3
    return-void
.end method

.method private current()Lorg/rabochaya/projects/MapComposition;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 19
    iget-wide v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/MapCompositionSettings;->active(Landroid/content/Context;J)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/MapCompositionSettings;->load(Landroid/content/Context;J)Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    move-result-object v0

    iget-object v0, v0, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;

    return-object v0

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0421\u043d\u0430\u0447\u0430\u043b\u0430 \u0432\u043a\u043b\u044e\u0447\u0438\u0442\u0435 \u0441\u043e\u0441\u0442\u0430\u0432 \u0432 \u00ab\u0421\u043b\u043e\u0438 \u043a\u0430\u0440\u0442\u044b\u00bb"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private download(Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;)V
    .locals 14

    .line 24
    const-string v0, "; \u043a\u0435\u0448 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d."

    const-string v1, ":"

    const-string v2, " / "

    const-string v3, "\u041f\u0430\u0443\u0437\u0430. "

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    const/4 v5, 0x0

    const/4 v6, 0x0

    :try_start_0
    iget-object v7, p1, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget-object v7, v7, Lorg/rabochaya/projects/CompositionDownloadJob;->tasks:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-object v8, p1

    :cond_0
    :goto_0
    :try_start_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_a

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/rabochaya/projects/CompositionDownloadJob$Task;

    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->network(Landroid/content/Context;)Z

    move-result v10

    const/4 v11, 0x1

    if-nez v10, :cond_1

    iput-boolean v11, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->cancelled:Z

    :cond_1
    iget-boolean v10, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->cancelled:Z

    if-nez v10, :cond_a

    iget-boolean v10, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->disposed:Z

    if-eqz v10, :cond_2

    goto/16 :goto_3

    :cond_2
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v12, v9, Lorg/rabochaya/projects/CompositionDownloadJob$Task;->source:Lorg/rabochaya/projects/TileSource;

    iget-object v12, v12, Lorg/rabochaya/projects/TileSource;->id:Ljava/lang/String;

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v12, v9, Lorg/rabochaya/projects/CompositionDownloadJob$Task;->source:Lorg/rabochaya/projects/TileSource;

    iget v12, v12, Lorg/rabochaya/projects/TileSource;->minZoom:I

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v12, v9, Lorg/rabochaya/projects/CompositionDownloadJob$Task;->source:Lorg/rabochaya/projects/TileSource;

    iget v12, v12, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v4, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/rabochaya/projects/OnlineTiles;

    if-nez v12, :cond_3

    new-instance v12, Lorg/rabochaya/projects/OnlineTiles;

    iget-object v13, v9, Lorg/rabochaya/projects/CompositionDownloadJob$Task;->source:Lorg/rabochaya/projects/TileSource;

    invoke-direct {v12, p0, v13}, Lorg/rabochaya/projects/OnlineTiles;-><init>(Landroid/content/Context;Lorg/rabochaya/projects/TileSource;)V

    invoke-interface {v4, v10, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    iput-object v12, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->active:Lorg/rabochaya/projects/OnlineTiles;

    iget-boolean v10, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->cancelled:Z

    if-nez v10, :cond_9

    iget-boolean v10, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->disposed:Z

    if-nez v10, :cond_9

    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->network(Landroid/content/Context;)Z

    move-result v10

    if-nez v10, :cond_4

    goto :goto_2

    :cond_4
    iget v10, v9, Lorg/rabochaya/projects/CompositionDownloadJob$Task;->z:I

    iget v11, v9, Lorg/rabochaya/projects/CompositionDownloadJob$Task;->x:I

    iget v13, v9, Lorg/rabochaya/projects/CompositionDownloadJob$Task;->y:I

    invoke-virtual {v12, v10, v11, v13}, Lorg/rabochaya/projects/OnlineTiles;->contains(III)Z

    move-result v10

    iget-boolean v11, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->cancelled:Z

    if-nez v11, :cond_8

    iget-boolean v11, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->disposed:Z

    if-eqz v11, :cond_5

    goto :goto_1

    :cond_5
    iget v11, v9, Lorg/rabochaya/projects/CompositionDownloadJob$Task;->z:I

    iget v13, v9, Lorg/rabochaya/projects/CompositionDownloadJob$Task;->x:I

    iget v9, v9, Lorg/rabochaya/projects/CompositionDownloadJob$Task;->y:I

    invoke-virtual {v12, v11, v13, v9}, Lorg/rabochaya/projects/OnlineTiles;->download(III)V

    add-int/lit8 v6, v6, 0x1

    rem-int/lit8 v9, v6, 0x5

    if-eqz v9, :cond_6

    iget-object v9, p1, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget-object v9, v9, Lorg/rabochaya/projects/CompositionDownloadJob;->tasks:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    if-ne v6, v9, :cond_7

    :cond_6
    iget-wide v11, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    invoke-static {p0, v11, v12, v8, v6}, Lorg/rabochaya/projects/CompositionDownloadSettings;->progress(Landroid/content/Context;JLorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;I)Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    move-result-object v8

    new-instance v9, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda6;

    invoke-direct {v9, p0, v6, p1}, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda6;-><init>(Lorg/rabochaya/projects/CompositionDownloadActivity;ILorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;)V

    invoke-virtual {p0, v9}, Lorg/rabochaya/projects/CompositionDownloadActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_7
    if-nez v10, :cond_0

    const-wide/16 v9, 0xc8

    invoke-static {v9, v10}, Ljava/lang/Thread;->sleep(J)V

    goto/16 :goto_0

    :cond_8
    :goto_1
    invoke-virtual {v12}, Lorg/rabochaya/projects/OnlineTiles;->cancel()V

    goto :goto_3

    :cond_9
    :goto_2
    iput-boolean v11, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->cancelled:Z

    goto :goto_1

    :cond_a
    :goto_3
    iget-object v1, v8, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget v1, v1, Lorg/rabochaya/projects/CompositionDownloadJob;->completed:I

    if-eq v6, v1, :cond_b

    iget-wide v9, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    invoke-static {p0, v9, v10, v8, v6}, Lorg/rabochaya/projects/CompositionDownloadSettings;->progress(Landroid/content/Context;JLorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;I)Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    move-result-object v8

    :cond_b
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-boolean v7, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->cancelled:Z

    if-nez v7, :cond_d

    iget-boolean v7, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->disposed:Z

    if-eqz v7, :cond_c

    goto :goto_4

    :cond_c
    const-string v7, "\u0413\u043e\u0442\u043e\u0432\u043e. "

    goto :goto_5

    :cond_d
    :goto_4
    move-object v7, v3

    :goto_5
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v7, p1, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget-object v7, v7, Lorg/rabochaya/projects/CompositionDownloadJob;->tasks:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    iput-object v5, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->active:Lorg/rabochaya/projects/OnlineTiles;

    :try_start_2
    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_11

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/OnlineTiles;

    invoke-virtual {v2}, Lorg/rabochaya/projects/OnlineTiles;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_6

    :catchall_0
    move-exception v0

    iget-wide v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    iget-object p1, p1, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget-object p1, p1, Lorg/rabochaya/projects/CompositionDownloadJob;->generation:Ljava/lang/String;

    invoke-static {v1, v2, p1}, Lorg/rabochaya/projects/CompositionDownloadSettings;->end(JLjava/lang/String;)V

    throw v0

    :catch_0
    move-exception v1

    goto :goto_7

    :catchall_1
    move-exception v0

    goto/16 :goto_d

    :catch_1
    move-exception v1

    move-object v8, p1

    :goto_7
    :try_start_3
    const-string v7, ""
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :try_start_4
    iget-object v9, v8, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget v9, v9, Lorg/rabochaya/projects/CompositionDownloadJob;->completed:I

    if-eq v6, v9, :cond_e

    iget-wide v9, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    invoke-static {p0, v9, v10, v8, v6}, Lorg/rabochaya/projects/CompositionDownloadSettings;->progress(Landroid/content/Context;JLorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;I)Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_8

    :catch_2
    move-exception v7

    :try_start_5
    const-string v7, " \u041f\u0440\u043e\u0433\u0440\u0435\u0441\u0441 \u0437\u0430\u043f\u0438\u0441\u0430\u0442\u044c \u043d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c; \u043f\u0440\u043e\u0434\u043e\u043b\u0436\u0435\u043d\u0438\u0435 \u043f\u0440\u043e\u0432\u0435\u0440\u0438\u0442 \u043a\u0435\u0448 \u0437\u0430\u043d\u043e\u0432\u043e."

    :cond_e
    :goto_8
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-boolean v9, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->cancelled:Z

    if-nez v9, :cond_10

    iget-boolean v9, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->disposed:Z

    if-eqz v9, :cond_f

    goto :goto_a

    :cond_f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041e\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d\u043e: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ". \u041f\u043e\u043b\u0443\u0447\u0435\u043d\u043d\u044b\u0439 \u043a\u0435\u0448 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d; \u043f\u0440\u043e\u0434\u043e\u043b\u0436\u0438\u0442\u0435 \u044f\u0432\u043d\u043e."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    :goto_9
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_b

    :cond_10
    :goto_a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget-object v2, v2, Lorg/rabochaya/projects/CompositionDownloadJob;->tasks:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    goto :goto_9

    :goto_b
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    iput-object v5, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->active:Lorg/rabochaya/projects/OnlineTiles;

    :try_start_6
    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_11

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/OnlineTiles;

    invoke-virtual {v2}, Lorg/rabochaya/projects/OnlineTiles;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    goto :goto_c

    :cond_11
    iget-wide v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    iget-object p1, p1, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget-object p1, p1, Lorg/rabochaya/projects/CompositionDownloadJob;->generation:Ljava/lang/String;

    invoke-static {v1, v2, p1}, Lorg/rabochaya/projects/CompositionDownloadSettings;->end(JLjava/lang/String;)V

    new-instance p1, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda7;

    invoke-direct {p1, p0, v0}, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda7;-><init>(Lorg/rabochaya/projects/CompositionDownloadActivity;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/CompositionDownloadActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    :catchall_2
    move-exception v0

    iget-wide v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    iget-object p1, p1, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget-object p1, p1, Lorg/rabochaya/projects/CompositionDownloadJob;->generation:Ljava/lang/String;

    invoke-static {v1, v2, p1}, Lorg/rabochaya/projects/CompositionDownloadSettings;->end(JLjava/lang/String;)V

    throw v0

    :goto_d
    iput-object v5, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->active:Lorg/rabochaya/projects/OnlineTiles;

    :try_start_7
    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_12

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/OnlineTiles;

    invoke-virtual {v2}, Lorg/rabochaya/projects/OnlineTiles;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto :goto_e

    :cond_12
    iget-wide v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    iget-object p1, p1, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget-object p1, p1, Lorg/rabochaya/projects/CompositionDownloadJob;->generation:Ljava/lang/String;

    invoke-static {v1, v2, p1}, Lorg/rabochaya/projects/CompositionDownloadSettings;->end(JLjava/lang/String;)V

    throw v0

    :catchall_3
    move-exception v0

    iget-wide v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    iget-object p1, p1, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget-object p1, p1, Lorg/rabochaya/projects/CompositionDownloadJob;->generation:Ljava/lang/String;

    invoke-static {v1, v2, p1}, Lorg/rabochaya/projects/CompositionDownloadSettings;->end(JLjava/lang/String;)V

    throw v0
.end method

.method private font(Landroid/view/View;)V
    .locals 3

    .line 21
    instance-of v0, p1, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Landroid/widget/TextView;

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    move-object v1, p1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_1

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/CompositionDownloadActivity;->font(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private static names(Lorg/rabochaya/projects/MapComposition;)Ljava/lang/String;
    .locals 3

    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p0, p0, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/MapComposition$Layer;

    iget-boolean v2, v1, Lorg/rabochaya/projects/MapComposition$Layer;->visible:Z

    if-eqz v2, :cond_0

    iget v2, v1, Lorg/rabochaya/projects/MapComposition$Layer;->opacity:I

    if-lez v2, :cond_0

    invoke-virtual {v1}, Lorg/rabochaya/projects/MapComposition$Layer;->source()Lorg/rabochaya/projects/TileSource;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_1

    const-string v2, " \u00b7 "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    iget-object v1, v1, Lorg/rabochaya/projects/MapComposition$Layer;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static number(D)Ljava/lang/String;
    .locals 2

    .line 17
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, p1, v1

    const-string p0, "%.8f"

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private pause()V
    .locals 2

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->cancelled:Z

    iget-object v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->active:Lorg/rabochaya/projects/OnlineTiles;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/rabochaya/projects/OnlineTiles;->cancel()V

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041f\u0430\u0443\u0437\u0430\u2026 \u041f\u043e\u043b\u0443\u0447\u0435\u043d\u043d\u044b\u0439 \u043a\u0435\u0448 \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u0435\u0442\u0441\u044f"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private resumeJob()V
    .locals 4

    .line 22
    :try_start_0
    iget-wide v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/CompositionDownloadSettings;->load(Landroid/content/Context;J)Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    iget-object v1, v1, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    if-eqz v1, :cond_0

    iget-object v1, v0, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    iget-object v1, v1, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget-object v1, v1, Lorg/rabochaya/projects/CompositionDownloadJob;->generation:Ljava/lang/String;

    iget-object v2, v0, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget-object v2, v2, Lorg/rabochaya/projects/CompositionDownloadJob;->generation:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iput-object v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    iget-object v0, v0, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/CompositionDownloadActivity;->start(Lorg/rabochaya/projects/CompositionDownloadJob;)V

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0421\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u043e\u0435 \u0437\u0430\u0434\u0430\u043d\u0438\u0435 \u0437\u0430\u043c\u0435\u043d\u0435\u043d\u043e; \u043e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u044d\u043a\u0440\u0430\u043d \u0437\u0430\u043d\u043e\u0432\u043e"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->status:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u041d\u0435 \u0437\u0430\u043f\u0443\u0449\u0435\u043d\u043e: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method private start(Lorg/rabochaya/projects/CompositionDownloadJob;)V
    .locals 4

    .line 23
    :try_start_0
    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->network(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lorg/rabochaya/projects/CompositionDownloadActivity;->current()Lorg/rabochaya/projects/MapComposition;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/rabochaya/projects/CompositionDownloadJob;->matches(Lorg/rabochaya/projects/MapComposition;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    iget-object v2, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Lorg/rabochaya/projects/CompositionDownloadJob;->progress(I)Lorg/rabochaya/projects/CompositionDownloadJob;

    move-result-object p1

    invoke-static {p0, v0, v1, v2, p1}, Lorg/rabochaya/projects/CompositionDownloadSettings;->begin(Landroid/content/Context;JLorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;Lorg/rabochaya/projects/CompositionDownloadJob;)Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->busy:Z

    iput-boolean v3, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->cancelled:Z

    iget-object p1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->calculate:Landroid/widget/Button;

    invoke-virtual {p1, v3}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object p1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->resume:Landroid/widget/Button;

    invoke-virtual {p1, v3}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object p1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->status:Landroid/widget/TextView;

    const-string v0, "\u041f\u0440\u043e\u0432\u0435\u0440\u043a\u0430 \u043f\u043e\u043b\u0443\u0447\u0435\u043d\u043d\u044b\u0445 \u0442\u0430\u0439\u043b\u043e\u0432\u2026"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    iget-object v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1}, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda5;-><init>(Lorg/rabochaya/projects/CompositionDownloadActivity;Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_1

    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "\u0412\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0435 \u0441\u043b\u043e\u0438 \u0438\u0437\u043c\u0435\u043d\u0435\u043d\u044b; \u043e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u044d\u043a\u0440\u0430\u043d \u0437\u0430\u043d\u043e\u0432\u043e"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_0
    throw p1

    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string v0, "\u0420\u0430\u0437\u0440\u0435\u0448\u0438\u0442\u0435 \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0443 \u0442\u0430\u0439\u043b\u043e\u0432 \u0438\u0437 \u0438\u043d\u0442\u0435\u0440\u043d\u0435\u0442\u0430"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041d\u0435 \u0437\u0430\u043f\u0443\u0449\u0435\u043d\u043e: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_1
    return-void
.end method

.method private text(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/TextView;
    .locals 1

    .line 17
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float p2, p3

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 p2, -0x1

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object v0
.end method


# virtual methods
.method synthetic lambda$button$4$org-rabochaya-projects-CompositionDownloadActivity(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 18
    iget-boolean p2, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->busy:Z

    if-nez p2, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lorg/rabochaya/projects/CompositionDownloadActivity;->pause()V

    :goto_0
    return-void
.end method

.method synthetic lambda$calculate$5$org-rabochaya-projects-CompositionDownloadActivity(Lorg/rabochaya/projects/CompositionDownloadJob;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/CompositionDownloadActivity;->start(Lorg/rabochaya/projects/CompositionDownloadJob;)V

    return-void
.end method

.method synthetic lambda$calculate$6$org-rabochaya-projects-CompositionDownloadActivity(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .locals 0

    .line 20
    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/CompositionDownloadActivity;->font(Landroid/view/View;)V

    return-void
.end method

.method synthetic lambda$download$8$org-rabochaya-projects-CompositionDownloadActivity(ILorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;)V
    .locals 3

    .line 24
    iget-boolean v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->disposed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041f\u0440\u043e\u0432\u0435\u0440\u0435\u043d\u043e / \u0441\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u043e: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " / "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p2, p2, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget-object p2, p2, Lorg/rabochaya/projects/CompositionDownloadJob;->tasks:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$download$9$org-rabochaya-projects-CompositionDownloadActivity(Ljava/lang/String;)V
    .locals 3

    .line 24
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->busy:Z

    iget-boolean v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->disposed:Z

    if-nez v1, :cond_1

    :try_start_0
    iget-wide v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    invoke-static {p0, v1, v2}, Lorg/rabochaya/projects/CompositionDownloadSettings;->load(Landroid/content/Context;J)Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    move-result-object v1

    iput-object v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->calculate:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object p1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->resume:Landroid/widget/Button;

    iget-object v2, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    iget-object v2, v2, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    if-eqz v2, :cond_0

    move v0, v1

    :cond_0
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    :goto_0
    return-void
.end method

.method synthetic lambda$onCreate$0$org-rabochaya-projects-CompositionDownloadActivity(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 8
    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "network"

    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    if-nez p2, :cond_0

    iget-boolean p1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->busy:Z

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lorg/rabochaya/projects/CompositionDownloadActivity;->pause()V

    :cond_0
    return-void
.end method

.method synthetic lambda$onCreate$1$org-rabochaya-projects-CompositionDownloadActivity()V
    .locals 0

    .line 14
    invoke-direct {p0}, Lorg/rabochaya/projects/CompositionDownloadActivity;->calculate()V

    return-void
.end method

.method synthetic lambda$onCreate$2$org-rabochaya-projects-CompositionDownloadActivity()V
    .locals 0

    .line 14
    invoke-direct {p0}, Lorg/rabochaya/projects/CompositionDownloadActivity;->resumeJob()V

    return-void
.end method

.method synthetic lambda$onCreate$3$org-rabochaya-projects-CompositionDownloadActivity()V
    .locals 0

    .line 14
    invoke-virtual {p0}, Lorg/rabochaya/projects/CompositionDownloadActivity;->onBackPressed()V

    return-void
.end method

.method synthetic lambda$start$7$org-rabochaya-projects-CompositionDownloadActivity(Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/CompositionDownloadActivity;->download(Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;)V

    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 25
    iget-boolean v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->busy:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lorg/rabochaya/projects/CompositionDownloadActivity;->pause()V

    goto :goto_0

    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 28

    .line 6
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v3, "selected"

    const-string v4, "job_generation"

    invoke-super/range {p0 .. p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/CompositionDownloadActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v5, "project"

    const-wide/16 v6, -0x1

    invoke-virtual {v0, v5, v6, v7}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v8

    iput-wide v8, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const v0, -0xdcd2e3

    invoke-virtual {v8, v0}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    const/16 v0, 0x8

    const/16 v10, 0xc

    invoke-virtual {v8, v10, v0, v10, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-virtual {v1, v8}, Lorg/rabochaya/projects/CompositionDownloadActivity;->setContentView(Landroid/view/View;)V

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/CompositionDownloadActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v11, 0x10

    invoke-virtual {v0, v11}, Landroid/view/Window;->setSoftInputMode(I)V

    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v11, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v0, v11}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x3f800000    # 1.0f

    const/4 v14, -0x1

    const/4 v15, 0x0

    invoke-direct {v12, v14, v15, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v0, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v0, "\u041a\u0435\u0448 \u0441\u043b\u043e\u0451\u0432"

    const/16 v12, 0x15

    invoke-direct {v1, v11, v0, v12}, Lorg/rabochaya/projects/CompositionDownloadActivity;->text(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/TextView;

    const-string v12, ""

    const/16 v13, 0xe

    invoke-direct {v1, v11, v12, v13}, Lorg/rabochaya/projects/CompositionDownloadActivity;->text(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->status:Landroid/widget/TextView;

    const-string v0, "\u0422\u043e\u043b\u044c\u043a\u043e \u0432\u0438\u0434\u0438\u043c\u044b\u0435 \u043e\u043d\u043b\u0430\u0439\u043d-\u0441\u043b\u043e\u0438 \u0441 \u043d\u0435\u043d\u0443\u043b\u0435\u0432\u043e\u0439 \u043d\u0435\u043f\u0440\u043e\u0437\u0440\u0430\u0447\u043d\u043e\u0441\u0442\u044c\u044e. \u0414\u043e 20 000 \u0443\u043d\u0438\u043a\u0430\u043b\u044c\u043d\u044b\u0445 \u0442\u0430\u0439\u043b\u043e\u0432, \u0434\u043e 256 \u041c\u0438\u0411 \u043d\u0430 \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a. \u0421\u043a\u0430\u0447\u0438\u0432\u0430\u044e\u0442\u0441\u044f \u0442\u043e\u043b\u044c\u043a\u043e \u0434\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0435 \u0443\u0440\u043e\u0432\u043d\u0438 \u043a\u0430\u0436\u0434\u043e\u0433\u043e \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a\u0430. \u041b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0435 \u043a\u0430\u0440\u0442\u044b \u043d\u0435 \u0441\u043a\u0430\u0447\u0438\u0432\u0430\u044e\u0442\u0441\u044f. \u041e\u0431\u044a\u0435\u043a\u0442\u044b \u0438 \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u044f \u043d\u0435 \u043f\u0435\u0440\u0435\u0434\u0430\u044e\u0442\u0441\u044f."

    invoke-direct {v1, v11, v0, v13}, Lorg/rabochaya/projects/CompositionDownloadActivity;->text(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/TextView;

    .line 7
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "\u0421\u043e\u0441\u0442\u0430\u0432: "

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/CompositionDownloadActivity;->current()Lorg/rabochaya/projects/MapComposition;

    move-result-object v10

    invoke-static {v10}, Lorg/rabochaya/projects/CompositionDownloadActivity;->names(Lorg/rabochaya/projects/MapComposition;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v11, v0, v13}, Lorg/rabochaya/projects/CompositionDownloadActivity;->text(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/TextView;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v10, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    :goto_0
    new-instance v0, Landroid/widget/CheckBox;

    invoke-direct {v0, v1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    const-string v10, "\u0420\u0430\u0437\u0440\u0435\u0448\u0438\u0442\u044c \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0443 \u0442\u0430\u0439\u043b\u043e\u0432 \u0438\u0437 \u0438\u043d\u0442\u0435\u0440\u043d\u0435\u0442\u0430"

    invoke-virtual {v0, v10}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    invoke-static/range {p0 .. p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object v10

    invoke-virtual {v0, v10}, Landroid/widget/CheckBox;->setTypeface(Landroid/graphics/Typeface;)V

    invoke-virtual {v0, v14}, Landroid/widget/CheckBox;->setTextColor(I)V

    const v10, -0x473056

    invoke-static {v10}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v13

    invoke-virtual {v0, v13}, Landroid/widget/CheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    invoke-static/range {p0 .. p0}, Lorg/rabochaya/projects/OnlineMapSettings;->network(Landroid/content/Context;)Z

    move-result v13

    invoke-virtual {v0, v13}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v13, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda1;

    invoke-direct {v13, v1}, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda1;-><init>(Lorg/rabochaya/projects/CompositionDownloadActivity;)V

    invoke-virtual {v0, v13}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 9
    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/CompositionDownloadActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v13, "bounds"

    invoke-virtual {v0, v13}, Landroid/content/Intent;->getDoubleArrayExtra(Ljava/lang/String;)[D

    move-result-object v0

    const/4 v13, 0x4

    if-eqz v0, :cond_0

    array-length v6, v0

    if-eq v6, v13, :cond_1

    :cond_0
    new-array v0, v13, [D

    fill-array-data v0, :array_0

    :cond_1
    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/CompositionDownloadActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "zoom"

    move-object/from16 v18, v11

    const-wide/high16 v10, 0x4000000000000000L    # 2.0

    invoke-virtual {v6, v7, v10, v11}, Landroid/content/Intent;->getDoubleExtra(Ljava/lang/String;D)D

    move-result-wide v6

    double-to-int v6, v6

    const/16 v7, 0x17

    invoke-static {v7, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-static {v15, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    aget-wide v10, v0, v15

    invoke-static {v10, v11}, Lorg/rabochaya/projects/CompositionDownloadActivity;->number(D)Ljava/lang/String;

    move-result-object v19

    aget-wide v10, v0, v9

    invoke-static {v10, v11}, Lorg/rabochaya/projects/CompositionDownloadActivity;->number(D)Ljava/lang/String;

    move-result-object v20

    const/4 v7, 0x2

    aget-wide v10, v0, v7

    invoke-static {v10, v11}, Lorg/rabochaya/projects/CompositionDownloadActivity;->number(D)Ljava/lang/String;

    move-result-object v21

    const/4 v10, 0x3

    aget-wide v22, v0, v10

    invoke-static/range {v22 .. v23}, Lorg/rabochaya/projects/CompositionDownloadActivity;->number(D)Ljava/lang/String;

    move-result-object v22

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    filled-new-array/range {v19 .. v24}, [Ljava/lang/String;

    move-result-object v6

    .line 10
    const/4 v11, 0x6

    :try_start_1
    iget-wide v13, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    invoke-static {v1, v13, v14}, Lorg/rabochaya/projects/CompositionDownloadSettings;->load(Landroid/content/Context;J)Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    move-result-object v13

    iput-object v13, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    iget-object v13, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    iget-object v13, v13, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    if-eqz v13, :cond_2

    iget-object v13, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    iget-object v13, v13, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    new-array v14, v11, [Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    :try_start_2
    iget-wide v0, v13, Lorg/rabochaya/projects/CompositionDownloadJob;->west:D

    invoke-static {v0, v1}, Lorg/rabochaya/projects/CompositionDownloadActivity;->number(D)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v14, v15

    iget-wide v0, v13, Lorg/rabochaya/projects/CompositionDownloadJob;->south:D

    invoke-static {v0, v1}, Lorg/rabochaya/projects/CompositionDownloadActivity;->number(D)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v14, v9

    iget-wide v0, v13, Lorg/rabochaya/projects/CompositionDownloadJob;->east:D

    invoke-static {v0, v1}, Lorg/rabochaya/projects/CompositionDownloadActivity;->number(D)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v14, v7

    iget-wide v0, v13, Lorg/rabochaya/projects/CompositionDownloadJob;->north:D

    invoke-static {v0, v1}, Lorg/rabochaya/projects/CompositionDownloadActivity;->number(D)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v14, v10

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, v13, Lorg/rabochaya/projects/CompositionDownloadJob;->min:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    aput-object v0, v14, v1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, v13, Lorg/rabochaya/projects/CompositionDownloadJob;->max:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x5

    aput-object v0, v14, v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-object/from16 v1, p0

    :try_start_3
    iget-object v0, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->status:Landroid/widget/TextView;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\u0421\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u043e\u0435 \u0437\u0430\u0434\u0430\u043d\u0438\u0435: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v13, Lorg/rabochaya/projects/CompositionDownloadJob;->completed:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " / "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v13, Lorg/rabochaya/projects/CompositionDownloadJob;->tasks:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ". \u041f\u0440\u043e\u0434\u043e\u043b\u0436\u0435\u043d\u0438\u0435 \u043f\u0440\u043e\u0432\u0435\u0440\u0438\u0442 \u0432\u0441\u0435 \u0442\u0430\u0439\u043b\u044b; \u0438\u043c\u0435\u044e\u0449\u0438\u0435\u0441\u044f \u043d\u0435 \u0441\u043a\u0430\u0447\u0438\u0432\u0430\u044e\u0442\u0441\u044f \u043f\u043e\u0432\u0442\u043e\u0440\u043d\u043e."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    move-object v6, v14

    goto :goto_1

    :catch_1
    move-exception v0

    move-object v6, v14

    goto :goto_2

    :catch_2
    move-exception v0

    move-object/from16 v1, p0

    goto :goto_2

    :cond_2
    :goto_1
    move-object v7, v6

    move-object v6, v12

    goto :goto_3

    :catch_3
    move-exception v0

    :goto_2
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    iget-object v7, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    move-object v7, v6

    move-object v6, v0

    .line 11
    :goto_3
    const-string v0, "\u0421\u043b\u043e\u0438 \u0434\u043b\u044f \u043d\u043e\u0432\u043e\u0433\u043e \u0437\u0430\u0434\u0430\u043d\u0438\u044f (\u0441\u043e\u0441\u0442\u0430\u0432 \u043a\u0430\u0440\u0442\u044b \u043d\u0435 \u0438\u0437\u043c\u0435\u043d\u044f\u0435\u0442\u0441\u044f)"

    const/16 v10, 0xf

    move-object/from16 v13, v18

    invoke-direct {v1, v13, v0, v10}, Lorg/rabochaya/projects/CompositionDownloadActivity;->text(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/TextView;

    .line 12
    :try_start_4
    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/CompositionDownloadActivity;->current()Lorg/rabochaya/projects/MapComposition;

    move-result-object v0

    iget-object v0, v0, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move v10, v15

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_10

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/rabochaya/projects/MapComposition$Layer;

    iget-boolean v15, v14, Lorg/rabochaya/projects/MapComposition$Layer;->visible:Z

    if-eqz v15, :cond_f

    iget v15, v14, Lorg/rabochaya/projects/MapComposition$Layer;->opacity:I

    if-lez v15, :cond_f

    const-string v15, "custom"

    iget-object v9, v14, Lorg/rabochaya/projects/MapComposition$Layer;->kind:Ljava/lang/String;

    invoke-virtual {v15, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_4

    const-string v9, "catalog"

    iget-object v15, v14, Lorg/rabochaya/projects/MapComposition$Layer;->kind:Ljava/lang/String;

    invoke-virtual {v9, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    goto :goto_5

    :cond_3
    move-object/from16 v22, v0

    const/16 v9, 0xc

    goto/16 :goto_e

    :cond_4
    :goto_5
    invoke-virtual {v14}, Lorg/rabochaya/projects/MapComposition$Layer;->source()Lorg/rabochaya/projects/TileSource;

    move-result-object v9

    new-instance v15, Landroid/widget/CheckBox;

    invoke-direct {v15, v1}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v10, v10, 0x1

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    move-object/from16 v22, v0

    const-string v0, ". "

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v11, v14, Lorg/rabochaya/projects/MapComposition$Layer;->name:Ljava/lang/String;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v15, v0}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    const/4 v11, -0x1

    invoke-virtual {v15, v11}, Landroid/widget/CheckBox;->setTextColor(I)V

    invoke-static/range {p0 .. p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {v15, v0}, Landroid/widget/CheckBox;->setTypeface(Landroid/graphics/Typeface;)V

    const v11, -0x473056

    invoke-static {v11}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v15, v0}, Landroid/widget/CheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    if-eqz v9, :cond_5

    iget-boolean v0, v9, Lorg/rabochaya/projects/TileSource;->downloads:Z

    if-eqz v0, :cond_5

    const/4 v0, 0x1

    goto :goto_6

    :cond_5
    const/4 v0, 0x0

    :goto_6
    iget-object v11, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    if-eqz v11, :cond_8

    iget-object v11, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    iget-object v11, v11, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    if-eqz v11, :cond_8

    iget-object v0, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    iget-object v0, v0, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget-object v0, v0, Lorg/rabochaya/projects/CompositionDownloadJob;->composition:Lorg/rabochaya/projects/MapComposition;

    iget-object v0, v0, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v11, 0x0

    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    move-object/from16 v24, v0

    move-object/from16 v0, v23

    check-cast v0, Lorg/rabochaya/projects/MapComposition$Layer;

    iget-object v0, v0, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    move/from16 v23, v10

    iget-object v10, v14, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const/4 v11, 0x1

    :cond_6
    move/from16 v10, v23

    move-object/from16 v0, v24

    goto :goto_7

    :cond_7
    move/from16 v23, v10

    move v0, v11

    goto :goto_8

    :cond_8
    move/from16 v23, v10

    :goto_8
    if-eqz v2, :cond_b

    const-wide/16 v10, -0x1

    invoke-virtual {v2, v5, v10, v11}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v24

    iget-wide v10, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    cmp-long v10, v24, v10

    if-nez v10, :cond_b

    invoke-virtual {v2, v4, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iget-object v11, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    if-eqz v11, :cond_a

    iget-object v11, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    iget-object v11, v11, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    if-nez v11, :cond_9

    goto :goto_9

    :cond_9
    iget-object v11, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    iget-object v11, v11, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget-object v11, v11, Lorg/rabochaya/projects/CompositionDownloadJob;->generation:Ljava/lang/String;

    goto :goto_a

    :cond_a
    :goto_9
    move-object v11, v12

    :goto_a
    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_b

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_b

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v10, v14, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    :cond_b
    invoke-virtual {v15, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    if-eqz v9, :cond_c

    const/4 v0, 0x1

    goto :goto_b

    :cond_c
    const/4 v0, 0x0

    :goto_b
    invoke-virtual {v15, v0}, Landroid/widget/CheckBox;->setEnabled(Z)V

    invoke-virtual {v13, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    if-eqz v9, :cond_e

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "z"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v10, v9, Lorg/rabochaya/projects/TileSource;->minZoom:I

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v10, "\u2013"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v10, v9, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v9, v9, Lorg/rabochaya/projects/TileSource;->downloads:Z

    if-eqz v9, :cond_d

    move-object v9, v12

    goto :goto_c

    :cond_d
    const-string v9, " \u00b7 \u0442\u043e\u043b\u044c\u043a\u043e \u043f\u0440\u043e\u0441\u043c\u043e\u0442\u0440; \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0430 \u043e\u0431\u043b\u0430\u0441\u0442\u0438 \u0437\u0430\u043f\u0440\u0435\u0449\u0435\u043d\u0430"

    :goto_c
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v9, 0xc

    invoke-direct {v1, v13, v0, v9}, Lorg/rabochaya/projects/CompositionDownloadActivity;->text(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/TextView;

    goto :goto_d

    :cond_e
    const/16 v9, 0xc

    :goto_d
    iget-object v0, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->choices:Ljava/util/LinkedHashMap;

    iget-object v10, v14, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    invoke-virtual {v0, v10, v15}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->offered:Ljava/util/Map;

    iget-object v10, v14, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    invoke-interface {v0, v10, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    move/from16 v10, v23

    goto :goto_e

    :cond_f
    move-object/from16 v22, v0

    const/16 v9, 0xc

    :goto_e
    move-object/from16 v0, v22

    const/4 v9, 0x1

    const/4 v11, 0x6

    const/4 v15, 0x0

    goto/16 :goto_4

    :catch_4
    move-exception v0

    iget-object v3, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 13
    :cond_10
    const-string v26, "\u041c\u0438\u043d\u0438\u043c\u0430\u043b\u044c\u043d\u044b\u0439 zoom"

    const-string v27, "\u041c\u0430\u043a\u0441\u0438\u043c\u0430\u043b\u044c\u043d\u044b\u0439 zoom"

    const-string v22, "\u0417\u0430\u043f\u0430\u0434"

    const-string v23, "\u042e\u0433"

    const-string v24, "\u0412\u043e\u0441\u0442\u043e\u043a (\u0437\u0430\u043f\u0430\u0434 > \u0432\u043e\u0441\u0442\u043e\u043a\u0430 \u2014 \u0447\u0435\u0440\u0435\u0437 180\u00b0)"

    const-string v25, "\u0421\u0435\u0432\u0435\u0440"

    filled-new-array/range {v22 .. v27}, [Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    :goto_f
    const/4 v9, 0x6

    if-ge v3, v9, :cond_14

    aget-object v10, v0, v3

    const/16 v11, 0xe

    invoke-direct {v1, v13, v10, v11}, Lorg/rabochaya/projects/CompositionDownloadActivity;->text(Landroid/widget/LinearLayout;Ljava/lang/String;I)Landroid/widget/TextView;

    new-instance v10, Landroid/widget/EditText;

    invoke-direct {v10, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-static/range {p0 .. p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object v14

    invoke-virtual {v10, v14}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    const/4 v14, 0x1

    invoke-virtual {v10, v14}, Landroid/widget/EditText;->setSingleLine(Z)V

    const v15, -0xdfdfe0

    invoke-virtual {v10, v15}, Landroid/widget/EditText;->setTextColor(I)V

    const/4 v15, -0x1

    invoke-virtual {v10, v15}, Landroid/widget/EditText;->setBackgroundColor(I)V

    const/16 v15, 0x3002

    invoke-virtual {v10, v15}, Landroid/widget/EditText;->setInputType(I)V

    if-eqz v2, :cond_13

    const-wide/16 v14, -0x1

    invoke-virtual {v2, v5, v14, v15}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v16

    iget-wide v14, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    cmp-long v14, v16, v14

    if-nez v14, :cond_13

    invoke-virtual {v2, v4, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iget-object v15, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    if-eqz v15, :cond_12

    iget-object v15, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    iget-object v15, v15, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    if-nez v15, :cond_11

    goto :goto_10

    :cond_11
    iget-object v15, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    iget-object v15, v15, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget-object v15, v15, Lorg/rabochaya/projects/CompositionDownloadJob;->generation:Ljava/lang/String;

    goto :goto_11

    :cond_12
    :goto_10
    move-object v15, v12

    :goto_11
    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "field_"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    aget-object v15, v7, v3

    invoke-virtual {v2, v14, v15}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    goto :goto_12

    :cond_13
    aget-object v14, v7, v3

    :goto_12
    invoke-virtual {v10, v14}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v14, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->fields:[Landroid/widget/EditText;

    aput-object v10, v14, v3

    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v15, -0x2

    const/4 v9, -0x1

    invoke-direct {v14, v9, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v13, v10, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_f

    .line 14
    :cond_14
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v8, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda2;

    invoke-direct {v2, v1}, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda2;-><init>(Lorg/rabochaya/projects/CompositionDownloadActivity;)V

    const-string v3, "\u0420\u0430\u0441\u0441\u0447\u0438\u0442\u0430\u0442\u044c"

    invoke-direct {v1, v0, v3, v2}, Lorg/rabochaya/projects/CompositionDownloadActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->calculate:Landroid/widget/Button;

    new-instance v2, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda3;

    invoke-direct {v2, v1}, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda3;-><init>(Lorg/rabochaya/projects/CompositionDownloadActivity;)V

    const-string v3, "\u041f\u0440\u043e\u0434\u043e\u043b\u0436\u0438\u0442\u044c"

    invoke-direct {v1, v0, v3, v2}, Lorg/rabochaya/projects/CompositionDownloadActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->resume:Landroid/widget/Button;

    new-instance v2, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda4;

    invoke-direct {v2, v1}, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda4;-><init>(Lorg/rabochaya/projects/CompositionDownloadActivity;)V

    const-string v3, "\u041d\u0430\u0437\u0430\u0434 / \u043f\u0430\u0443\u0437\u0430"

    invoke-direct {v1, v0, v3, v2}, Lorg/rabochaya/projects/CompositionDownloadActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    iget-object v0, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->calculate:Landroid/widget/Button;

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->resume:Landroid/widget/Button;

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_15

    iget-object v2, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    if-eqz v2, :cond_15

    iget-object v2, v1, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    iget-object v2, v2, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    if-eqz v2, :cond_15

    const/4 v9, 0x1

    goto :goto_13

    :cond_15
    const/4 v9, 0x0

    :goto_13
    invoke-virtual {v0, v9}, Landroid/widget/Button;->setEnabled(Z)V

    .line 15
    return-void

    :array_0
    .array-data 8
        -0x4010000000000000L    # -1.0
        -0x4010000000000000L    # -1.0
        0x3ff0000000000000L    # 1.0
        0x3ff0000000000000L    # 1.0
    .end array-data
.end method

.method protected onDestroy()V
    .locals 1

    .line 26
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->disposed:Z

    iput-boolean v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->cancelled:Z

    iget-object v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->worker:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 4

    .line 26
    const-string v0, "project"

    iget-wide v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->project:J

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    iget-object v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    iget-object v0, v0, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->snapshot:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    iget-object v0, v0, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget-object v0, v0, Lorg/rabochaya/projects/CompositionDownloadJob;->generation:Ljava/lang/String;

    goto :goto_1

    :cond_1
    :goto_0
    const-string v0, ""

    :goto_1
    const-string v1, "job_generation"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->choices:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    invoke-virtual {v3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_3
    const-string v1, "selected"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const/4 v0, 0x0

    :goto_3
    const/4 v1, 0x6

    if-ge v0, v1, :cond_4

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "field_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->fields:[Landroid/widget/EditText;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_4
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method protected onStop()V
    .locals 1

    .line 26
    iget-boolean v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity;->busy:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lorg/rabochaya/projects/CompositionDownloadActivity;->pause()V

    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    return-void
.end method
