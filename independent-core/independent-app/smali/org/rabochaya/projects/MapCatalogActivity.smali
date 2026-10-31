.class public final Lorg/rabochaya/projects/MapCatalogActivity;
.super Landroid/app/Activity;
.source "MapCatalogActivity.java"


# static fields
.field public static final ACTION_EXPORT:I = 0x2

.field public static final ACTION_SETTINGS:I = 0x1

.field public static final RESULT_ACTION:Ljava/lang/String; = "catalog_action"


# instance fields
.field private final cache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[J>;"
        }
    .end annotation
.end field

.field private volatile disposed:Z

.field private generation:I

.field private list:Landroid/widget/LinearLayout;

.field private loading:Z

.field private prefs:Landroid/content/SharedPreferences;

.field private final previews:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private project:J

.field private restoreY:I

.field private root:Landroid/widget/LinearLayout;

.field private scroll:Landroid/widget/ScrollView;

.field private state:Landroid/widget/TextView;

.field private final worker:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 4
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 7
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->cache:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->previews:Ljava/util/Map;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->loading:Z

    return-void
.end method

.method private actions(Lorg/rabochaya/projects/MapCatalog$Entry;)V
    .locals 6

    .line 33
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p1, Lorg/rabochaya/projects/MapCatalog$Entry;->source:Lorg/rabochaya/projects/TileSource;

    iget-object v1, v1, Lorg/rabochaya/projects/TileSource;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0421\u0432\u0435\u0434\u0435\u043d\u0438\u044f \u043e\u0431 \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a\u0435"

    const-string v2, "\u041e\u0447\u0438\u0441\u0442\u0438\u0442\u044c \u043a\u0435\u0448"

    const-string v3, "\u041e\u0442\u043a\u0440\u044b\u0442\u044c \u043a\u0430\u0440\u0442\u0443"

    const-string v4, "\u041a\u0435\u0448 \u0438 \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0430"

    const-string v5, "\u042d\u043a\u0441\u043f\u043e\u0440\u0442 \u043a\u0435\u0448\u0430 MBTiles"

    filled-new-array {v3, v4, v5, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, p1}, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda1;-><init>(Lorg/rabochaya/projects/MapCatalogActivity;Lorg/rabochaya/projects/MapCatalog$Entry;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private build()V
    .locals 18

    .line 12
    move-object/from16 v0, p0

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lorg/rabochaya/projects/MapCatalogActivity;->root:Landroid/widget/LinearLayout;

    iget-object v1, v0, Lorg/rabochaya/projects/MapCatalogActivity;->root:Landroid/widget/LinearLayout;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v1, v0, Lorg/rabochaya/projects/MapCatalogActivity;->root:Landroid/widget/LinearLayout;

    const v3, -0xdfd3e7

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object v1, v0, Lorg/rabochaya/projects/MapCatalogActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/MapCatalogActivity;->setContentView(Landroid/view/View;)V

    .line 13
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v3, 0x10

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v4, v0, Lorg/rabochaya/projects/MapCatalogActivity;->root:Landroid/widget/LinearLayout;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x42840000    # 66.0f

    invoke-direct {v0, v6}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v6

    const/4 v7, -0x1

    invoke-direct {v5, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v1, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda7;

    invoke-direct {v4, v0}, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda7;-><init>(Lorg/rabochaya/projects/MapCatalogActivity;)V

    const-string v5, "\u2630"

    const-string v6, "\u041c\u0435\u043d\u044e \u043e\u043d\u043b\u0430\u0439\u043d-\u043a\u0430\u0440\u0442"

    invoke-direct {v0, v5, v6, v4}, Lorg/rabochaya/projects/MapCatalogActivity;->icon(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v4

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x42500000    # 52.0f

    invoke-direct {v0, v6}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v6

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const-string v5, "\u041e\u043d\u043b\u0430\u0439\u043d-\u043a\u0430\u0440\u0442\u044b"

    const/16 v6, 0x16

    invoke-direct {v0, v5, v6, v7}, Lorg/rabochaya/projects/MapCatalogActivity;->label(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v5, "\u0423\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d\u043d\u044b\u0435 \u043a\u0430\u0440\u0442\u044b"

    const v6, -0x2f2937

    invoke-direct {v0, v5, v3, v6}, Lorg/rabochaya/projects/MapCatalogActivity;->label(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, 0x0

    const/4 v9, -0x2

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v5, v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda8;

    invoke-direct {v4, v0}, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda8;-><init>(Lorg/rabochaya/projects/MapCatalogActivity;)V

    const-string v5, "\u00d7"

    const-string v9, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c \u043e\u043d\u043b\u0430\u0439\u043d-\u043a\u0430\u0440\u0442\u044b"

    invoke-direct {v0, v5, v9, v4}, Lorg/rabochaya/projects/MapCatalogActivity;->icon(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v4

    const v5, -0x2d8e9b

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v9, 0x42300000    # 44.0f

    invoke-direct {v0, v9}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v11

    invoke-direct {v5, v11, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda9;

    invoke-direct {v4, v0}, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda9;-><init>(Lorg/rabochaya/projects/MapCatalogActivity;)V

    const-string v5, "\u22ee"

    const-string v11, "\u0414\u0435\u0439\u0441\u0442\u0432\u0438\u044f \u043a\u0430\u0442\u0430\u043b\u043e\u0433\u0430"

    invoke-direct {v0, v5, v11, v4}, Lorg/rabochaya/projects/MapCatalogActivity;->icon(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v4

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v9}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v9

    invoke-direct {v5, v9, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 14
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/high16 v3, 0x41c00000    # 24.0f

    invoke-direct {v0, v3}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v3

    const/high16 v4, 0x41400000    # 12.0f

    invoke-direct {v0, v4}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v5

    const/high16 v9, 0x41800000    # 16.0f

    invoke-direct {v0, v9}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v11

    invoke-direct {v0, v4}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v4

    invoke-virtual {v1, v3, v5, v11, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v3, v0, Lorg/rabochaya/projects/MapCatalogActivity;->root:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x42680000    # 58.0f

    invoke-direct {v0, v5}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v5

    invoke-direct {v4, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/MapCatalogActivity;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getTotalSpace()J

    move-result-wide v3

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/MapCatalogActivity;->getFilesDir()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getUsableSpace()J

    move-result-wide v11

    sub-long v11, v3, v11

    const-wide/16 v13, 0x0

    invoke-static {v13, v14, v11, v12}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v11

    new-instance v5, Landroid/widget/FrameLayout;

    invoke-direct {v5, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v5, v6}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v9, 0x41900000    # 18.0f

    invoke-direct {v0, v9}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v9

    invoke-direct {v15, v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v5, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v9, Landroid/widget/ProgressBar;

    const/4 v15, 0x0

    const v10, 0x1010078

    invoke-direct {v9, v0, v15, v10}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 v10, 0x3e8

    invoke-virtual {v9, v10}, Landroid/widget/ProgressBar;->setMax(I)V

    cmp-long v10, v3, v13

    if-lez v10, :cond_0

    long-to-double v13, v11

    const-wide v16, 0x408f400000000000L    # 1000.0

    mul-double v13, v13, v16

    long-to-double v6, v3

    div-double/2addr v13, v6

    double-to-int v6, v13

    goto :goto_0

    :cond_0
    move v6, v8

    :goto_0
    invoke-virtual {v9, v6}, Landroid/widget/ProgressBar;->setProgress(I)V

    const v6, -0xc937c7

    invoke-static {v6}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-virtual {v9, v6}, Landroid/widget/ProgressBar;->setProgressTintList(Landroid/content/res/ColorStateList;)V

    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v7, -0x1

    invoke-direct {v6, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v9, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    long-to-double v11, v11

    const-wide/high16 v13, 0x41d0000000000000L    # 1.073741824E9

    div-double/2addr v11, v13

    invoke-static {v11, v12}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    long-to-double v3, v3

    div-double/2addr v3, v13

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v7, v4, v8

    aput-object v3, v4, v2

    const-string v3, "%.1f / %.1f \u0413\u0438\u0411"

    invoke-static {v6, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0xb

    const v6, -0xe8dfee

    invoke-direct {v0, v3, v4, v6}, Lorg/rabochaya/projects/MapCatalogActivity;->label(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v3

    const/16 v4, 0x11

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setGravity(I)V

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v6, -0x1

    invoke-direct {v4, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda10;

    invoke-direct {v3, v0}, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda10;-><init>(Lorg/rabochaya/projects/MapCatalogActivity;)V

    const-string v4, "\u2699"

    const-string v5, "\u041a\u0435\u0448 \u0438 \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0430"

    invoke-direct {v0, v4, v5, v3}, Lorg/rabochaya/projects/MapCatalogActivity;->icon(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object v3

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x42400000    # 48.0f

    invoke-direct {v0, v5}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v5

    const/high16 v6, 0x42200000    # 40.0f

    invoke-direct {v0, v6}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 15
    const-string v1, "\u0427\u0442\u0435\u043d\u0438\u0435 \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u043e\u0433\u043e \u043a\u0435\u0448\u0430\u2026"

    const/16 v3, 0xc

    const v4, -0x2f2937

    invoke-direct {v0, v1, v3, v4}, Lorg/rabochaya/projects/MapCatalogActivity;->label(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, v0, Lorg/rabochaya/projects/MapCatalogActivity;->state:Landroid/widget/TextView;

    iget-object v1, v0, Lorg/rabochaya/projects/MapCatalogActivity;->state:Landroid/widget/TextView;

    const/high16 v3, 0x41800000    # 16.0f

    invoke-direct {v0, v3}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v4

    invoke-direct {v0, v3}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v3

    const/high16 v5, 0x40c00000    # 6.0f

    invoke-direct {v0, v5}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v5

    invoke-virtual {v1, v4, v8, v3, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v1, v0, Lorg/rabochaya/projects/MapCatalogActivity;->root:Landroid/widget/LinearLayout;

    iget-object v3, v0, Lorg/rabochaya/projects/MapCatalogActivity;->state:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lorg/rabochaya/projects/MapCatalogActivity;->scroll:Landroid/widget/ScrollView;

    iget-object v1, v0, Lorg/rabochaya/projects/MapCatalogActivity;->root:Landroid/widget/LinearLayout;

    iget-object v3, v0, Lorg/rabochaya/projects/MapCatalogActivity;->scroll:Landroid/widget/ScrollView;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v4, v5, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lorg/rabochaya/projects/MapCatalogActivity;->list:Landroid/widget/LinearLayout;

    iget-object v1, v0, Lorg/rabochaya/projects/MapCatalogActivity;->list:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v1, v0, Lorg/rabochaya/projects/MapCatalogActivity;->scroll:Landroid/widget/ScrollView;

    iget-object v2, v0, Lorg/rabochaya/projects/MapCatalogActivity;->list:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/MapCatalogActivity;->render()V

    .line 16
    return-void
.end method

.method private card(Lorg/rabochaya/projects/MapCatalog$Entry;Z)V
    .locals 13

    .line 26
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x42980000    # 76.0f

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v2

    const/4 v3, -0x1

    invoke-direct {v1, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/high16 v2, 0x41400000    # 12.0f

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v4

    const/high16 v5, 0x40c00000    # 6.0f

    invoke-direct {p0, v5}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v5

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v6

    const/high16 v7, 0x41000000    # 8.0f

    invoke-direct {p0, v7}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v7

    invoke-virtual {v1, v4, v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    iget-object v4, p0, Lorg/rabochaya/projects/MapCatalogActivity;->list:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p1, Lorg/rabochaya/projects/MapCatalog$Entry;->key:Ljava/lang/String;

    invoke-static {v1}, Lorg/rabochaya/projects/CatalogIndex;->preview(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/MapCatalogActivity;->preview(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_0

    new-instance v4, Landroid/widget/ImageView;

    invoke-direct {v4, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v4, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v4, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0

    :cond_0
    const v1, -0x1a1829

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 27
    :goto_0
    new-instance v1, Landroid/view/View;

    invoke-direct {v1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v4, 0x65ffffff

    invoke-virtual {v1, v4}, Landroid/view/View;->setBackgroundColor(I)V

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v4, 0x10

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v2

    const/high16 v4, 0x40800000    # 4.0f

    invoke-direct {p0, v4}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v5

    const/high16 v6, 0x40000000    # 2.0f

    invoke-direct {p0, v6}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v6

    invoke-direct {p0, v4}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v4

    invoke-virtual {v1, v2, v5, v6, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const v4, 0x800005

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p2, :cond_1

    const-string p2, "\u2713 "

    goto :goto_1

    :cond_1
    const-string p2, ""

    :goto_1
    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object v5, p1, Lorg/rabochaya/projects/MapCatalog$Entry;->source:Lorg/rabochaya/projects/TileSource;

    iget-object v5, v5, Lorg/rabochaya/projects/TileSource;->name:Ljava/lang/String;

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/16 v5, 0x13

    const v6, -0xefe8f3

    invoke-direct {p0, p2, v5, v6}, Lorg/rabochaya/projects/MapCatalogActivity;->label(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p2

    invoke-virtual {p2, v4}, Landroid/widget/TextView;->setGravity(I)V

    const/4 v5, 0x2

    invoke-virtual {p2, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    invoke-virtual {v2, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object p2, p0, Lorg/rabochaya/projects/MapCatalogActivity;->cache:Ljava/util/Map;

    iget-object v6, p1, Lorg/rabochaya/projects/MapCatalog$Entry;->key:Ljava/lang/String;

    invoke-interface {p2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [J

    iget-boolean v6, p0, Lorg/rabochaya/projects/MapCatalogActivity;->loading:Z

    const/4 v7, 0x0

    if-eqz v6, :cond_2

    const-string p2, "\u041a\u0435\u0448: \u043f\u0440\u043e\u0432\u0435\u0440\u043a\u0430\u2026"

    goto :goto_2

    :cond_2
    if-nez p2, :cond_3

    const-string p2, "\u041a\u0435\u0448: \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u0435\u043d"

    goto :goto_2

    :cond_3
    aget-wide v8, p2, v7

    const-wide/16 v10, 0x0

    cmp-long v6, v8, v10

    if-nez v6, :cond_4

    const-string p2, "\u041a\u0435\u0448: \u043d\u0435\u0442"

    goto :goto_2

    :cond_4
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    aget-wide v8, p2, v7

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aget-wide v9, p2, v3

    long-to-double v9, v9

    const-wide/high16 v11, 0x4130000000000000L    # 1048576.0

    div-double/2addr v9, v11

    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v8, v5, v7

    aput-object p2, v5, v3

    const-string p2, "\u041a\u0435\u0448: %d \u0442\u0430\u0439\u043b\u043e\u0432 \u00b7 %.1f \u041c\u0438\u0411"

    invoke-static {v6, p2, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    :goto_2
    const/16 v3, 0xc

    const v5, -0xdbc7e4

    invoke-direct {p0, p2, v3, v5}, Lorg/rabochaya/projects/MapCatalogActivity;->label(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p2

    invoke-virtual {p2, v4}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v2, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {p2, v7, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p2, p1, Lorg/rabochaya/projects/MapCatalog$Entry;->source:Lorg/rabochaya/projects/TileSource;

    iget-object p2, p2, Lorg/rabochaya/projects/TileSource;->name:Ljava/lang/String;

    invoke-virtual {v2, p2}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance p2, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda11;

    invoke-direct {p2, p0, p1}, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda11;-><init>(Lorg/rabochaya/projects/MapCatalogActivity;Lorg/rabochaya/projects/MapCatalog$Entry;)V

    invoke-virtual {v2, p2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda12;

    invoke-direct {p2, p0, p1}, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda12;-><init>(Lorg/rabochaya/projects/MapCatalogActivity;Lorg/rabochaya/projects/MapCatalog$Entry;)V

    invoke-virtual {v0, p2}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u0414\u0435\u0439\u0441\u0442\u0432\u0438\u044f: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object v0, p1, Lorg/rabochaya/projects/MapCatalog$Entry;->source:Lorg/rabochaya/projects/TileSource;

    iget-object v0, v0, Lorg/rabochaya/projects/TileSource;->name:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance v0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda13;

    invoke-direct {v0, p0, p1}, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda13;-><init>(Lorg/rabochaya/projects/MapCatalogActivity;Lorg/rabochaya/projects/MapCatalog$Entry;)V

    const-string p1, "\u2630"

    invoke-direct {p0, p1, p2, v0}, Lorg/rabochaya/projects/MapCatalogActivity;->icon(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;

    move-result-object p1

    const p2, -0xac9289

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v0, 0x42400000    # 48.0f

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v2

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v0

    invoke-direct {p2, v2, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    return-void
.end method

.method private choose(Lorg/rabochaya/projects/MapCatalog$Entry;)V
    .locals 3

    .line 30
    iget-object v0, p1, Lorg/rabochaya/projects/MapCatalog$Entry;->key:Ljava/lang/String;

    iget-wide v1, p0, Lorg/rabochaya/projects/MapCatalogActivity;->project:J

    invoke-static {p0, v0, v1, v2}, Lorg/rabochaya/projects/OnlineMapSettings;->select(Landroid/content/Context;Ljava/lang/String;J)V

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "catalog"

    iget-object p1, p1, Lorg/rabochaya/projects/MapCatalog$Entry;->key:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const/4 v0, -0x1

    invoke-virtual {p0, v0, p1}, Lorg/rabochaya/projects/MapCatalogActivity;->setResult(ILandroid/content/Intent;)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/MapCatalogActivity;->finish()V

    return-void
.end method

.method private confirmClear(Lorg/rabochaya/projects/MapCatalog$Entry;)V
    .locals 3

    .line 34
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u041e\u0447\u0438\u0441\u0442\u0438\u0442\u044c \u043a\u0435\u0448?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0442\u0430\u0439\u043b\u044b \u00ab"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lorg/rabochaya/projects/MapCatalog$Entry;->source:Lorg/rabochaya/projects/TileSource;

    iget-object v2, v2, Lorg/rabochaya/projects/TileSource;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\u00bb? \u041e\u0431\u0449\u0438\u0435 \u0441\u043b\u043e\u0438 \u0438\u0441\u043f\u043e\u043b\u044c\u0437\u0443\u044e\u0442\u0441\u044f \u0438 \u0434\u0440\u0443\u0433\u0438\u043c\u0438 \u043d\u0430\u0431\u043e\u0440\u0430\u043c\u0438. \u041e\u0431\u044a\u0435\u043a\u0442\u044b, \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u044f \u0438 \u0438\u043c\u043f\u043e\u0440\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u043d\u044b\u0435 \u043a\u0430\u0440\u0442\u044b \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u0442\u0441\u044f."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1}, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda5;-><init>(Lorg/rabochaya/projects/MapCatalogActivity;Lorg/rabochaya/projects/MapCatalog$Entry;)V

    const-string p1, "\u041e\u0447\u0438\u0441\u0442\u0438\u0442\u044c"

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private dp(F)I
    .locals 1

    .line 9
    invoke-virtual {p0}, Lorg/rabochaya/projects/MapCatalogActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private icon(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/TextView;
    .locals 2

    .line 11
    const/16 v0, 0x19

    const/4 v1, -0x1

    invoke-direct {p0, p1, v0, v1}, Lorg/rabochaya/projects/MapCatalogActivity;->label(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object p1

    const/16 v0, 0x11

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    const/high16 p2, 0x42400000    # 48.0f

    invoke-direct {p0, p2}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setMinHeight(I)V

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setFocusable(Z)V

    new-instance p2, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda0;

    invoke-direct {p2, p3}, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p1
.end method

.method private label(Ljava/lang/String;II)Landroid/widget/TextView;
    .locals 1

    .line 10
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float p1, p2

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 p1, 0x10

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setGravity(I)V

    return-object v0
.end method

.method static synthetic lambda$icon$0(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 11
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method private menu()V
    .locals 4

    .line 32
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "\u041a\u0435\u0448 \u0438 \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0430"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/4 v1, 0x1

    const-string v3, "\u0420\u0430\u0437\u0432\u0435\u0440\u043d\u0443\u0442\u044c \u0432\u0441\u0435 \u0433\u0440\u0443\u043f\u043f\u044b"

    aput-object v3, v0, v1

    const/4 v1, 0x2

    const-string v3, "\u0421\u0432\u0435\u0440\u043d\u0443\u0442\u044c \u0432\u0441\u0435 \u0433\u0440\u0443\u043f\u043f\u044b"

    aput-object v3, v0, v1

    iget-object v1, p0, Lorg/rabochaya/projects/MapCatalogActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v3, "cached_only"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "\u041f\u043e\u043a\u0430\u0437\u0430\u0442\u044c \u0432\u0441\u0435 \u043a\u0430\u0440\u0442\u044b"

    goto :goto_0

    :cond_0
    const-string v1, "\u041f\u043e\u043a\u0430\u0437\u0430\u0442\u044c \u0442\u043e\u043b\u044c\u043a\u043e \u043a\u0430\u0440\u0442\u044b \u0441 \u043a\u0435\u0448\u0435\u043c"

    :goto_0
    const/4 v2, 0x3

    aput-object v1, v0, v2

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "\u041e\u043d\u043b\u0430\u0439\u043d-\u043a\u0430\u0440\u0442\u044b"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda6;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda6;-><init>(Lorg/rabochaya/projects/MapCatalogActivity;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private preview(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 4

    .line 29
    iget-object v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->previews:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->previews:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    return-object p1

    :cond_0
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Lorg/rabochaya/projects/MapCatalogActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "catalog-previews/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".jpg"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_2

    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :catchall_0
    move-exception v2

    if-eqz v1, :cond_1

    :try_start_3
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v1

    :try_start_4
    invoke-virtual {v2, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v2
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception v1

    :cond_2
    :goto_1
    iget-object v1, p0, Lorg/rabochaya/projects/MapCatalogActivity;->previews:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method private readStats(Lorg/rabochaya/projects/TileSource;)[J
    .locals 7

    .line 36
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lorg/rabochaya/projects/MapCatalogActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "tile-cache"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p1, p1, Lorg/rabochaya/projects/TileSource;->id:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, ".mbtiles"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    const/4 v1, 0x2

    if-nez p1, :cond_0

    new-array p1, v1, [J

    fill-array-data p1, :array_0

    return-object p1

    :cond_0
    const/4 p1, 0x0

    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    invoke-static {v0, p1, v2}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    const-string v3, "SELECT count(*),coalesce(sum(length(tile_data)),0) FROM tiles"

    invoke-virtual {v0, v3, p1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    :try_start_2
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_3

    new-array v1, v1, [J

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    aput-wide v5, v1, v4

    invoke-interface {v3, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    aput-wide v4, v1, v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v3, :cond_1

    :try_start_3
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :cond_1
    if-eqz v0, :cond_2

    :try_start_4
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    :cond_2
    return-object v1

    :cond_3
    if-eqz v3, :cond_4

    :try_start_5
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :cond_4
    if-eqz v0, :cond_7

    :try_start_6
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    goto :goto_2

    :catchall_0
    move-exception v1

    if-eqz v3, :cond_5

    :try_start_7
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    :try_start_8
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_5
    :goto_0
    throw v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :catchall_2
    move-exception v1

    if-eqz v0, :cond_6

    :try_start_9
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    goto :goto_1

    :catchall_3
    move-exception v0

    :try_start_a
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_6
    :goto_1
    throw v1
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0

    :catch_0
    move-exception v0

    :cond_7
    :goto_2
    return-object p1

    nop

    :array_0
    .array-data 8
        0x0
        0x0
    .end array-data
.end method

.method private render()V
    .locals 17

    .line 17
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lorg/rabochaya/projects/MapCatalogActivity;->disposed:Z

    if-eqz v1, :cond_0

    return-void

    :cond_0
    iget v1, v0, Lorg/rabochaya/projects/MapCatalogActivity;->restoreY:I

    iget-object v2, v0, Lorg/rabochaya/projects/MapCatalogActivity;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v2}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    const/4 v2, 0x0

    iput v2, v0, Lorg/rabochaya/projects/MapCatalogActivity;->restoreY:I

    iget-object v3, v0, Lorg/rabochaya/projects/MapCatalogActivity;->list:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v3, v0, Lorg/rabochaya/projects/MapCatalogActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v4, "cached_only"

    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    invoke-static/range {p0 .. p0}, Lorg/rabochaya/projects/OnlineMapSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "catalog"

    const-string v6, ""

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 18
    invoke-static {}, Lorg/rabochaya/projects/CatalogIndex;->groups()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move v6, v2

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const/4 v8, -0x1

    if-eqz v7, :cond_9

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 19
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v7}, Lorg/rabochaya/projects/CatalogIndex;->entries(Ljava/lang/String;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_1
    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_3

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/rabochaya/projects/MapCatalog$Entry;

    iget-object v12, v0, Lorg/rabochaya/projects/MapCatalogActivity;->cache:Ljava/util/Map;

    iget-object v13, v11, Lorg/rabochaya/projects/MapCatalog$Entry;->key:Ljava/lang/String;

    invoke-interface {v12, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [J

    if-eqz v3, :cond_2

    iget-boolean v13, v0, Lorg/rabochaya/projects/MapCatalogActivity;->loading:Z

    if-nez v13, :cond_2

    if-eqz v12, :cond_1

    aget-wide v13, v12, v2

    const-wide/16 v15, 0x0

    cmp-long v12, v13, v15

    if-lez v12, :cond_1

    :cond_2
    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    invoke-virtual {v9}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_4

    goto :goto_0

    :cond_4
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v10

    add-int/2addr v6, v10

    invoke-static {v4}, Lorg/rabochaya/projects/CatalogIndex;->find(Ljava/lang/String;)Lorg/rabochaya/projects/MapCatalog$Entry;

    move-result-object v10

    iget-object v11, v0, Lorg/rabochaya/projects/MapCatalogActivity;->prefs:Landroid/content/SharedPreferences;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "expanded_"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    if-eqz v10, :cond_5

    iget-object v10, v10, Lorg/rabochaya/projects/MapCatalog$Entry;->group:Ljava/lang/String;

    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    move v10, v13

    goto :goto_2

    :cond_5
    move v10, v2

    :goto_2
    invoke-interface {v11, v12, v10}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v10

    .line 20
    new-instance v11, Landroid/widget/LinearLayout;

    invoke-direct {v11, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v12, 0x10

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->setGravity(I)V

    const/high16 v12, 0x41400000    # 12.0f

    invoke-direct {v0, v12}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v14

    const/high16 v15, 0x41200000    # 10.0f

    invoke-direct {v0, v15}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v2

    invoke-direct {v0, v12}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v12

    invoke-direct {v0, v15}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v15

    invoke-virtual {v11, v14, v2, v12, v15}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/high16 v2, 0x42780000    # 62.0f

    invoke-direct {v0, v2}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v2

    invoke-virtual {v11, v2}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    if-eqz v10, :cond_6

    const-string v2, "\u2b06"

    goto :goto_3

    :cond_6
    const-string v2, "\u2b07"

    :goto_3
    const/16 v12, 0x18

    const v14, -0xa26c9b

    invoke-direct {v0, v2, v12, v14}, Lorg/rabochaya/projects/MapCatalogActivity;->label(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v14, 0x42100000    # 36.0f

    invoke-direct {v0, v14}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v14

    const/high16 v15, 0x42300000    # 44.0f

    invoke-direct {v0, v15}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v15

    invoke-direct {v12, v14, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v11, v2, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v13}, Landroid/widget/LinearLayout;->setOrientation(I)V

    sget-object v12, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v7, v12}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    const/16 v13, 0x12

    invoke-direct {v0, v12, v13, v8}, Lorg/rabochaya/projects/MapCatalogActivity;->label(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v12

    invoke-virtual {v2, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    if-eqz v10, :cond_7

    const/4 v12, 0x0

    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/rabochaya/projects/MapCatalog$Entry;

    iget-object v12, v13, Lorg/rabochaya/projects/MapCatalog$Entry;->source:Lorg/rabochaya/projects/TileSource;

    iget-object v12, v12, Lorg/rabochaya/projects/TileSource;->attribution:Ljava/lang/String;

    const/16 v13, 0xc

    const v14, -0x2f2937

    invoke-direct {v0, v12, v13, v14}, Lorg/rabochaya/projects/MapCatalogActivity;->label(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v12

    const/4 v13, 0x2

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setMaxLines(I)V

    invoke-virtual {v2, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_7
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v13, -0x2

    const/high16 v14, 0x3f800000    # 1.0f

    const/4 v15, 0x0

    invoke-direct {v12, v15, v13, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v11, v2, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v11, v7}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v2, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda3;

    invoke-direct {v2, v0, v7, v10}, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda3;-><init>(Lorg/rabochaya/projects/MapCatalogActivity;Ljava/lang/String;Z)V

    invoke-virtual {v11, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, v0, Lorg/rabochaya/projects/MapCatalogActivity;->list:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Landroid/view/View;

    invoke-direct {v2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const v7, -0xc1b5ca

    invoke-virtual {v2, v7}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v7, v0, Lorg/rabochaya/projects/MapCatalogActivity;->list:Landroid/widget/LinearLayout;

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v14}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v12

    invoke-direct {v11, v8, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v2, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    if-eqz v10, :cond_8

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/rabochaya/projects/MapCatalog$Entry;

    iget-object v8, v7, Lorg/rabochaya/projects/MapCatalog$Entry;->key:Ljava/lang/String;

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    invoke-direct {v0, v7, v8}, Lorg/rabochaya/projects/MapCatalogActivity;->card(Lorg/rabochaya/projects/MapCatalog$Entry;Z)V

    goto :goto_4

    .line 22
    :cond_8
    move v2, v15

    goto/16 :goto_0

    .line 23
    :cond_9
    if-nez v6, :cond_a

    const-string v2, "\u0412 \u043a\u0435\u0448\u0435 \u043f\u043e\u043a\u0430 \u043d\u0435\u0442 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u0445 \u043a\u0430\u0440\u0442"

    const/16 v4, 0x11

    invoke-direct {v0, v2, v4, v8}, Lorg/rabochaya/projects/MapCatalogActivity;->label(Ljava/lang/String;II)Landroid/widget/TextView;

    move-result-object v2

    const/high16 v4, 0x41a00000    # 20.0f

    invoke-direct {v0, v4}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v5

    const/high16 v6, 0x41c00000    # 24.0f

    invoke-direct {v0, v6}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v7

    invoke-direct {v0, v4}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v4

    invoke-direct {v0, v6}, Lorg/rabochaya/projects/MapCatalogActivity;->dp(F)I

    move-result v6

    invoke-virtual {v2, v5, v7, v4, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v4, v0, Lorg/rabochaya/projects/MapCatalogActivity;->list:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_a
    iget-boolean v2, v0, Lorg/rabochaya/projects/MapCatalogActivity;->loading:Z

    if-nez v2, :cond_c

    iget-object v2, v0, Lorg/rabochaya/projects/MapCatalogActivity;->state:Landroid/widget/TextView;

    if-eqz v3, :cond_b

    const-string v3, "\u041f\u043e\u043a\u0430\u0437\u0430\u043d\u044b \u043a\u0430\u0440\u0442\u044b \u0441 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u043c\u0438 \u0442\u0430\u0439\u043b\u0430\u043c\u0438"

    goto :goto_5

    :cond_b
    const-string v3, "54 \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a\u0430 \u00b7 3 \u043d\u0430\u0431\u043e\u0440\u0430 \u00b7 \u0442\u043e\u043b\u044c\u043a\u043e \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0435 \u0441\u0432\u0435\u0434\u0435\u043d\u0438\u044f \u043e \u043a\u0435\u0448\u0435"

    :goto_5
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_c
    iget-object v2, v0, Lorg/rabochaya/projects/MapCatalogActivity;->scroll:Landroid/widget/ScrollView;

    new-instance v3, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda4;

    invoke-direct {v3, v0, v1}, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda4;-><init>(Lorg/rabochaya/projects/MapCatalogActivity;I)V

    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 24
    return-void
.end method

.method private returnAction(Lorg/rabochaya/projects/MapCatalog$Entry;I)V
    .locals 2

    .line 31
    if-eqz p1, :cond_0

    iget-object p1, p1, Lorg/rabochaya/projects/MapCatalog$Entry;->key:Ljava/lang/String;

    iget-wide v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->project:J

    invoke-static {p0, p1, v0, v1}, Lorg/rabochaya/projects/OnlineMapSettings;->select(Landroid/content/Context;Ljava/lang/String;J)V

    :cond_0
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string v0, "catalog_action"

    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p1

    const/4 p2, -0x1

    invoke-virtual {p0, p2, p1}, Lorg/rabochaya/projects/MapCatalogActivity;->setResult(ILandroid/content/Intent;)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/MapCatalogActivity;->finish()V

    return-void
.end method

.method private scan()V
    .locals 3

    .line 35
    iget v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->generation:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->generation:I

    iput-boolean v1, p0, Lorg/rabochaya/projects/MapCatalogActivity;->loading:Z

    iget-object v1, p0, Lorg/rabochaya/projects/MapCatalogActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0, v0}, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda2;-><init>(Lorg/rabochaya/projects/MapCatalogActivity;I)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$actions$11$org-rabochaya-projects-MapCatalogActivity(Lorg/rabochaya/projects/MapCatalog$Entry;Landroid/content/DialogInterface;I)V
    .locals 1

    .line 33
    if-nez p3, :cond_0

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapCatalogActivity;->choose(Lorg/rabochaya/projects/MapCatalog$Entry;)V

    goto :goto_1

    :cond_0
    const/4 p2, 0x1

    if-ne p3, p2, :cond_1

    :goto_0
    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/MapCatalogActivity;->returnAction(Lorg/rabochaya/projects/MapCatalog$Entry;I)V

    goto :goto_1

    :cond_1
    const/4 p2, 0x2

    if-ne p3, p2, :cond_2

    goto :goto_0

    :cond_2
    const/4 p2, 0x3

    if-ne p3, p2, :cond_3

    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object p3, p1, Lorg/rabochaya/projects/MapCatalog$Entry;->source:Lorg/rabochaya/projects/TileSource;

    iget-object p3, p3, Lorg/rabochaya/projects/TileSource;->name:Ljava/lang/String;

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p1, Lorg/rabochaya/projects/MapCatalog$Entry;->source:Lorg/rabochaya/projects/TileSource;

    iget-object v0, v0, Lorg/rabochaya/projects/TileSource;->attribution:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, "\n\u041c\u0430\u0441\u0448\u0442\u0430\u0431\u044b: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    iget-object v0, p1, Lorg/rabochaya/projects/MapCatalog$Entry;->source:Lorg/rabochaya/projects/TileSource;

    iget v0, v0, Lorg/rabochaya/projects/TileSource;->minZoom:I

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, "\u2013"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    iget-object v0, p1, Lorg/rabochaya/projects/MapCatalog$Entry;->source:Lorg/rabochaya/projects/TileSource;

    iget v0, v0, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, "\n\u0421\u043b\u043e\u0451\u0432: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    iget-object p1, p1, Lorg/rabochaya/projects/MapCatalog$Entry;->source:Lorg/rabochaya/projects/TileSource;

    invoke-virtual {p1}, Lorg/rabochaya/projects/TileSource;->leafs()[Lorg/rabochaya/projects/TileSource;

    move-result-object p1

    array-length p1, p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_1

    :cond_3
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapCatalogActivity;->confirmClear(Lorg/rabochaya/projects/MapCatalog$Entry;)V

    :goto_1
    return-void
.end method

.method synthetic lambda$build$1$org-rabochaya-projects-MapCatalogActivity()V
    .locals 0

    .line 13
    invoke-direct {p0}, Lorg/rabochaya/projects/MapCatalogActivity;->menu()V

    return-void
.end method

.method synthetic lambda$build$2$org-rabochaya-projects-MapCatalogActivity()V
    .locals 0

    .line 13
    invoke-virtual {p0}, Lorg/rabochaya/projects/MapCatalogActivity;->finish()V

    return-void
.end method

.method synthetic lambda$build$3$org-rabochaya-projects-MapCatalogActivity()V
    .locals 0

    .line 13
    invoke-direct {p0}, Lorg/rabochaya/projects/MapCatalogActivity;->menu()V

    return-void
.end method

.method synthetic lambda$build$4$org-rabochaya-projects-MapCatalogActivity()V
    .locals 2

    .line 14
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lorg/rabochaya/projects/MapCatalogActivity;->returnAction(Lorg/rabochaya/projects/MapCatalog$Entry;I)V

    return-void
.end method

.method synthetic lambda$card$7$org-rabochaya-projects-MapCatalogActivity(Lorg/rabochaya/projects/MapCatalog$Entry;Landroid/view/View;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapCatalogActivity;->choose(Lorg/rabochaya/projects/MapCatalog$Entry;)V

    return-void
.end method

.method synthetic lambda$card$8$org-rabochaya-projects-MapCatalogActivity(Lorg/rabochaya/projects/MapCatalog$Entry;Landroid/view/View;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapCatalogActivity;->choose(Lorg/rabochaya/projects/MapCatalog$Entry;)V

    return-void
.end method

.method synthetic lambda$card$9$org-rabochaya-projects-MapCatalogActivity(Lorg/rabochaya/projects/MapCatalog$Entry;)V
    .locals 0

    .line 27
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapCatalogActivity;->actions(Lorg/rabochaya/projects/MapCatalog$Entry;)V

    return-void
.end method

.method synthetic lambda$confirmClear$12$org-rabochaya-projects-MapCatalogActivity(Ljava/lang/String;)V
    .locals 3

    .line 34
    iget-boolean v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->disposed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043e\u0447\u0438\u0441\u0442\u0438\u0442\u044c \u043a\u0435\u0448: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    :cond_1
    invoke-direct {p0}, Lorg/rabochaya/projects/MapCatalogActivity;->scan()V

    return-void
.end method

.method synthetic lambda$confirmClear$13$org-rabochaya-projects-MapCatalogActivity(Lorg/rabochaya/projects/MapCatalog$Entry;)V
    .locals 4

    .line 34
    :try_start_0
    iget-object p1, p1, Lorg/rabochaya/projects/MapCatalog$Entry;->source:Lorg/rabochaya/projects/TileSource;

    invoke-virtual {p1}, Lorg/rabochaya/projects/TileSource;->leafs()[Lorg/rabochaya/projects/TileSource;

    move-result-object p1

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    iget-boolean v3, p0, Lorg/rabochaya/projects/MapCatalogActivity;->disposed:Z

    if-eqz v3, :cond_0

    return-void

    :cond_0
    new-instance v3, Lorg/rabochaya/projects/OnlineTiles;

    invoke-direct {v3, p0, v2}, Lorg/rabochaya/projects/OnlineTiles;-><init>(Landroid/content/Context;Lorg/rabochaya/projects/TileSource;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-virtual {v3}, Lorg/rabochaya/projects/OnlineTiles;->clear()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-virtual {v3}, Lorg/rabochaya/projects/OnlineTiles;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catchall_0
    move-exception p1

    :try_start_3
    invoke-virtual {v3}, Lorg/rabochaya/projects/OnlineTiles;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw p1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    :cond_1
    const/4 p1, 0x0

    goto :goto_2

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    :goto_2
    new-instance v0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda14;

    invoke-direct {v0, p0, p1}, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda14;-><init>(Lorg/rabochaya/projects/MapCatalogActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/MapCatalogActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$confirmClear$14$org-rabochaya-projects-MapCatalogActivity(Lorg/rabochaya/projects/MapCatalog$Entry;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 34
    iget-object p2, p0, Lorg/rabochaya/projects/MapCatalogActivity;->state:Landroid/widget/TextView;

    const-string p3, "\u041e\u0447\u0438\u0441\u0442\u043a\u0430 \u043a\u0435\u0448\u0430\u2026"

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Lorg/rabochaya/projects/MapCatalogActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance p3, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda16;

    invoke-direct {p3, p0, p1}, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda16;-><init>(Lorg/rabochaya/projects/MapCatalogActivity;Lorg/rabochaya/projects/MapCatalog$Entry;)V

    invoke-interface {p2, p3}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$menu$10$org-rabochaya-projects-MapCatalogActivity(Landroid/content/DialogInterface;I)V
    .locals 6

    .line 32
    const/4 p1, 0x1

    if-nez p2, :cond_0

    const/4 p2, 0x0

    invoke-direct {p0, p2, p1}, Lorg/rabochaya/projects/MapCatalogActivity;->returnAction(Lorg/rabochaya/projects/MapCatalog$Entry;I)V

    goto :goto_3

    :cond_0
    const/4 v0, 0x3

    const/4 v1, 0x0

    if-ne p2, v0, :cond_1

    iget-object p2, p0, Lorg/rabochaya/projects/MapCatalogActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    iget-object v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->prefs:Landroid/content/SharedPreferences;

    const-string v2, "cached_only"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    xor-int/2addr p1, v0

    invoke-interface {p2, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_2

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-static {}, Lorg/rabochaya/projects/CatalogIndex;->groups()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "expanded_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    if-ne p2, p1, :cond_2

    move v4, p1

    goto :goto_1

    :cond_2
    move v4, v1

    :goto_1
    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    :cond_3
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :goto_2
    invoke-direct {p0}, Lorg/rabochaya/projects/MapCatalogActivity;->render()V

    :goto_3
    return-void
.end method

.method synthetic lambda$render$5$org-rabochaya-projects-MapCatalogActivity(Ljava/lang/String;ZLandroid/view/View;)V
    .locals 2

    .line 20
    iget-object p3, p0, Lorg/rabochaya/projects/MapCatalogActivity;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "expanded_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    xor-int/lit8 p2, p2, 0x1

    invoke-interface {p3, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    invoke-direct {p0}, Lorg/rabochaya/projects/MapCatalogActivity;->render()V

    return-void
.end method

.method synthetic lambda$render$6$org-rabochaya-projects-MapCatalogActivity(I)V
    .locals 2

    .line 23
    iget-boolean v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->disposed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->scroll:Landroid/widget/ScrollView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Landroid/widget/ScrollView;->scrollTo(II)V

    :cond_0
    return-void
.end method

.method synthetic lambda$scan$15$org-rabochaya-projects-MapCatalogActivity(ILjava/util/Map;)V
    .locals 1

    .line 35
    iget-boolean v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->disposed:Z

    if-nez v0, :cond_1

    iget v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->generation:I

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lorg/rabochaya/projects/MapCatalogActivity;->cache:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->clear()V

    iget-object p1, p0, Lorg/rabochaya/projects/MapCatalogActivity;->cache:Ljava/util/Map;

    invoke-interface {p1, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lorg/rabochaya/projects/MapCatalogActivity;->loading:Z

    invoke-direct {p0}, Lorg/rabochaya/projects/MapCatalogActivity;->render()V

    :cond_1
    :goto_0
    return-void
.end method

.method synthetic lambda$scan$16$org-rabochaya-projects-MapCatalogActivity(I)V
    .locals 16

    .line 35
    move-object/from16 v0, p0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Lorg/rabochaya/projects/MapCatalog;->entries()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/MapCatalog$Entry;

    iget-boolean v5, v0, Lorg/rabochaya/projects/MapCatalogActivity;->disposed:Z

    if-eqz v5, :cond_0

    return-void

    :cond_0
    const/4 v5, 0x2

    new-array v5, v5, [J

    iget-object v6, v4, Lorg/rabochaya/projects/MapCatalog$Entry;->source:Lorg/rabochaya/projects/TileSource;

    invoke-virtual {v6}, Lorg/rabochaya/projects/TileSource;->leafs()[Lorg/rabochaya/projects/TileSource;

    move-result-object v6

    array-length v7, v6

    const/4 v8, 0x0

    move v9, v8

    :goto_1
    const/4 v10, 0x1

    if-ge v9, v7, :cond_3

    aget-object v11, v6, v9

    iget-object v12, v11, Lorg/rabochaya/projects/TileSource;->id:Ljava/lang/String;

    invoke-interface {v2, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1

    iget-object v11, v11, Lorg/rabochaya/projects/TileSource;->id:Ljava/lang/String;

    invoke-interface {v2, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [J

    goto :goto_2

    :cond_1
    invoke-direct {v0, v11}, Lorg/rabochaya/projects/MapCatalogActivity;->readStats(Lorg/rabochaya/projects/TileSource;)[J

    move-result-object v12

    iget-object v11, v11, Lorg/rabochaya/projects/TileSource;->id:Ljava/lang/String;

    invoke-interface {v2, v11, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v11, v12

    :goto_2
    if-nez v11, :cond_2

    goto :goto_3

    :cond_2
    aget-wide v12, v5, v8

    aget-wide v14, v11, v8

    add-long/2addr v12, v14

    aput-wide v12, v5, v8

    aget-wide v12, v5, v10

    aget-wide v14, v11, v10

    add-long/2addr v12, v14

    aput-wide v12, v5, v10

    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    :cond_3
    move v8, v10

    :goto_3
    iget-object v4, v4, Lorg/rabochaya/projects/MapCatalog$Entry;->key:Ljava/lang/String;

    if-eqz v8, :cond_4

    goto :goto_4

    :cond_4
    const/4 v5, 0x0

    :goto_4
    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_5
    new-instance v2, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda15;

    move/from16 v3, p1

    invoke-direct {v2, v0, v3, v1}, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda15;-><init>(Lorg/rabochaya/projects/MapCatalogActivity;ILjava/util/Map;)V

    invoke-virtual {v0, v2}, Lorg/rabochaya/projects/MapCatalogActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 8
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/MapCatalogActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "project"

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->project:J

    const-string v0, "catalog-ui"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/rabochaya/projects/MapCatalogActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->prefs:Landroid/content/SharedPreferences;

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "scroll"

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    :goto_0
    iput v1, p0, Lorg/rabochaya/projects/MapCatalogActivity;->restoreY:I

    invoke-virtual {p0}, Lorg/rabochaya/projects/MapCatalogActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const v0, -0xe8dfee

    invoke-virtual {p1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/MapCatalogActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Window;->setNavigationBarColor(I)V

    invoke-direct {p0}, Lorg/rabochaya/projects/MapCatalogActivity;->build()V

    invoke-direct {p0}, Lorg/rabochaya/projects/MapCatalogActivity;->scan()V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 38
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->disposed:Z

    iget-object v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->worker:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 37
    iget-object v0, p0, Lorg/rabochaya/projects/MapCatalogActivity;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v0

    const-string v1, "scroll"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method
