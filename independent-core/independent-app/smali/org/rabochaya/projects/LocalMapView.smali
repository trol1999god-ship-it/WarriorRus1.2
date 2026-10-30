.class public final Lorg/rabochaya/projects/LocalMapView;
.super Landroid/view/View;
.source "LocalMapView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/LocalMapView$Listener;
    }
.end annotation


# instance fields
.field private bundled:Lorg/rabochaya/projects/BundledTiles;

.field private final cache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private final contextGesture:Landroid/view/GestureDetector;

.field private cx:D

.field private cy:D

.field private volatile disposed:Z

.field private downX:F

.field private downY:F

.field private draft:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "[D>;"
        }
    .end annotation
.end field

.field private draftType:Ljava/lang/String;

.field private final features:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/KmlProject$Feature;",
            ">;"
        }
    .end annotation
.end field

.field private fitted:Z

.field private lastX:F

.field private lastY:F

.field private final listener:Lorg/rabochaya/projects/LocalMapView$Listener;

.field private longConsumed:Z

.field private volatile mapReady:Z

.field private maxZoom:I

.field private minZoom:I

.field private final missing:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private moved:Z

.field private volatile online:[Lorg/rabochaya/projects/OnlineTiles;

.field private final onlineSource:Lorg/rabochaya/projects/TileSource;

.field private final paint:Landroid/graphics/Paint;

.field private volatile paused:Z

.field private final pending:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private restored:Z

.field private final scale:Landroid/view/ScaleGestureDetector;

.field private tiles:Lorg/rabochaya/projects/OfflineTiles;

.field private final useNetwork:Z

.field private final worker:Ljava/util/concurrent/ExecutorService;

.field private zoom:D


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Ljava/io/File;Lorg/rabochaya/projects/LocalMapView$Listener;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/KmlProject$Feature;",
            ">;",
            "Ljava/io/File;",
            "Lorg/rabochaya/projects/LocalMapView$Listener;",
            ")V"
        }
    .end annotation

    .line 10
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v6}, Lorg/rabochaya/projects/LocalMapView;-><init>(Landroid/content/Context;Ljava/util/List;Ljava/io/File;Lorg/rabochaya/projects/LocalMapView$Listener;Lorg/rabochaya/projects/TileSource;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Ljava/io/File;Lorg/rabochaya/projects/LocalMapView$Listener;Lorg/rabochaya/projects/TileSource;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/KmlProject$Feature;",
            ">;",
            "Ljava/io/File;",
            "Lorg/rabochaya/projects/LocalMapView$Listener;",
            "Lorg/rabochaya/projects/TileSource;",
            "Z)V"
        }
    .end annotation

    .line 12
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 6
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->worker:Ljava/util/concurrent/ExecutorService;

    .line 7
    new-instance v0, Lorg/rabochaya/projects/LocalMapView$1;

    const/high16 v2, 0x1000000

    invoke-direct {v0, p0, v2}, Lorg/rabochaya/projects/LocalMapView$1;-><init>(Lorg/rabochaya/projects/LocalMapView;I)V

    iput-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->cache:Landroid/util/LruCache;

    .line 8
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->pending:Ljava/util/Set;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->missing:Ljava/util/Set;

    .line 9
    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    iput-wide v2, p0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    iput-wide v2, p0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    iput-wide v2, p0, Lorg/rabochaya/projects/LocalMapView;->zoom:D

    .line 12
    iput-object p5, p0, Lorg/rabochaya/projects/LocalMapView;->onlineSource:Lorg/rabochaya/projects/TileSource;

    iput-boolean p6, p0, Lorg/rabochaya/projects/LocalMapView;->useNetwork:Z

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapView;->features:Ljava/util/List;

    iput-object p4, p0, Lorg/rabochaya/projects/LocalMapView;->listener:Lorg/rabochaya/projects/LocalMapView$Listener;

    const-string p2, "\u041a\u0430\u0440\u0442\u0430 \u0438 \u043e\u0431\u044a\u0435\u043a\u0442\u044b KML. \u041f\u0435\u0440\u0435\u043c\u0435\u0449\u0435\u043d\u0438\u0435 \u043e\u0434\u043d\u0438\u043c \u043f\u0430\u043b\u044c\u0446\u0435\u043c, \u043c\u0430\u0441\u0448\u0442\u0430\u0431 \u0434\u0432\u0443\u043c\u044f."

    invoke-virtual {p0, p2}, Lorg/rabochaya/projects/LocalMapView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 13
    new-instance p2, Landroid/view/GestureDetector;

    new-instance p6, Lorg/rabochaya/projects/LocalMapView$2;

    invoke-direct {p6, p0, p4}, Lorg/rabochaya/projects/LocalMapView$2;-><init>(Lorg/rabochaya/projects/LocalMapView;Lorg/rabochaya/projects/LocalMapView$Listener;)V

    invoke-direct {p2, p1, p6}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapView;->contextGesture:Landroid/view/GestureDetector;

    .line 14
    new-instance p2, Landroid/view/ScaleGestureDetector;

    new-instance p6, Lorg/rabochaya/projects/LocalMapView$3;

    invoke-direct {p6, p0}, Lorg/rabochaya/projects/LocalMapView$3;-><init>(Lorg/rabochaya/projects/LocalMapView;)V

    invoke-direct {p2, p1, p6}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapView;->scale:Landroid/view/ScaleGestureDetector;

    .line 15
    if-eqz p5, :cond_0

    iget-object p2, p0, Lorg/rabochaya/projects/LocalMapView;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance p3, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda2;

    invoke-direct {p3, p0, p5, p1, p4}, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda2;-><init>(Lorg/rabochaya/projects/LocalMapView;Lorg/rabochaya/projects/TileSource;Landroid/content/Context;Lorg/rabochaya/projects/LocalMapView$Listener;)V

    invoke-interface {p2, p3}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 16
    :cond_0
    if-eqz p3, :cond_1

    invoke-virtual {p3}, Ljava/io/File;->isFile()Z

    move-result p2

    if-eqz p2, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapView;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance p2, Lorg/rabochaya/projects/LocalMapView$4;

    invoke-direct {p2, p0, p3, p4}, Lorg/rabochaya/projects/LocalMapView$4;-><init>(Lorg/rabochaya/projects/LocalMapView;Ljava/io/File;Lorg/rabochaya/projects/LocalMapView$Listener;)V

    invoke-interface {p1, p2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 17
    :cond_1
    new-instance p2, Lorg/rabochaya/projects/BundledTiles;

    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/rabochaya/projects/BundledTiles;-><init>(Landroid/content/res/AssetManager;)V

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapView;->bundled:Lorg/rabochaya/projects/BundledTiles;

    const/4 p1, 0x1

    iput p1, p0, Lorg/rabochaya/projects/LocalMapView;->minZoom:I

    iput v1, p0, Lorg/rabochaya/projects/LocalMapView;->maxZoom:I

    iput-boolean p1, p0, Lorg/rabochaya/projects/LocalMapView;->mapReady:Z

    .line 18
    :goto_0
    return-void
.end method

.method static synthetic access$000(Lorg/rabochaya/projects/LocalMapView;)Z
    .locals 0

    .line 4
    iget-boolean p0, p0, Lorg/rabochaya/projects/LocalMapView;->disposed:Z

    return p0
.end method

.method static synthetic access$100(Lorg/rabochaya/projects/LocalMapView;)Z
    .locals 0

    .line 4
    iget-boolean p0, p0, Lorg/rabochaya/projects/LocalMapView;->paused:Z

    return p0
.end method

.method static synthetic access$1000(Lorg/rabochaya/projects/LocalMapView;)Lorg/rabochaya/projects/OfflineTiles;
    .locals 0

    .line 4
    iget-object p0, p0, Lorg/rabochaya/projects/LocalMapView;->tiles:Lorg/rabochaya/projects/OfflineTiles;

    return-object p0
.end method

.method static synthetic access$1002(Lorg/rabochaya/projects/LocalMapView;Lorg/rabochaya/projects/OfflineTiles;)Lorg/rabochaya/projects/OfflineTiles;
    .locals 0

    .line 4
    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView;->tiles:Lorg/rabochaya/projects/OfflineTiles;

    return-object p1
.end method

.method static synthetic access$1102(Lorg/rabochaya/projects/LocalMapView;I)I
    .locals 0

    .line 4
    iput p1, p0, Lorg/rabochaya/projects/LocalMapView;->minZoom:I

    return p1
.end method

.method static synthetic access$1202(Lorg/rabochaya/projects/LocalMapView;I)I
    .locals 0

    .line 4
    iput p1, p0, Lorg/rabochaya/projects/LocalMapView;->maxZoom:I

    return p1
.end method

.method static synthetic access$1302(Lorg/rabochaya/projects/LocalMapView;Z)Z
    .locals 0

    .line 4
    iput-boolean p1, p0, Lorg/rabochaya/projects/LocalMapView;->mapReady:Z

    return p1
.end method

.method static synthetic access$1400(Lorg/rabochaya/projects/LocalMapView;)[Lorg/rabochaya/projects/OnlineTiles;
    .locals 0

    .line 4
    iget-object p0, p0, Lorg/rabochaya/projects/LocalMapView;->online:[Lorg/rabochaya/projects/OnlineTiles;

    return-object p0
.end method

.method static synthetic access$1500(Lorg/rabochaya/projects/LocalMapView;)Z
    .locals 0

    .line 4
    iget-boolean p0, p0, Lorg/rabochaya/projects/LocalMapView;->useNetwork:Z

    return p0
.end method

.method static synthetic access$1600(Lorg/rabochaya/projects/LocalMapView;)Lorg/rabochaya/projects/BundledTiles;
    .locals 0

    .line 4
    iget-object p0, p0, Lorg/rabochaya/projects/LocalMapView;->bundled:Lorg/rabochaya/projects/BundledTiles;

    return-object p0
.end method

.method static synthetic access$1700(Lorg/rabochaya/projects/LocalMapView;)Ljava/util/Set;
    .locals 0

    .line 4
    iget-object p0, p0, Lorg/rabochaya/projects/LocalMapView;->pending:Ljava/util/Set;

    return-object p0
.end method

.method static synthetic access$1800(Lorg/rabochaya/projects/LocalMapView;)Landroid/util/LruCache;
    .locals 0

    .line 4
    iget-object p0, p0, Lorg/rabochaya/projects/LocalMapView;->cache:Landroid/util/LruCache;

    return-object p0
.end method

.method static synthetic access$1900(Lorg/rabochaya/projects/LocalMapView;)Ljava/util/Set;
    .locals 0

    .line 4
    iget-object p0, p0, Lorg/rabochaya/projects/LocalMapView;->missing:Ljava/util/Set;

    return-object p0
.end method

.method static synthetic access$200(Lorg/rabochaya/projects/LocalMapView;)Z
    .locals 0

    .line 4
    iget-boolean p0, p0, Lorg/rabochaya/projects/LocalMapView;->moved:Z

    return p0
.end method

.method static synthetic access$2000(Lorg/rabochaya/projects/LocalMapView;)Lorg/rabochaya/projects/LocalMapView$Listener;
    .locals 0

    .line 4
    iget-object p0, p0, Lorg/rabochaya/projects/LocalMapView;->listener:Lorg/rabochaya/projects/LocalMapView$Listener;

    return-object p0
.end method

.method static synthetic access$202(Lorg/rabochaya/projects/LocalMapView;Z)Z
    .locals 0

    .line 4
    iput-boolean p1, p0, Lorg/rabochaya/projects/LocalMapView;->moved:Z

    return p1
.end method

.method static synthetic access$300(Lorg/rabochaya/projects/LocalMapView;)Ljava/util/ArrayList;
    .locals 0

    .line 4
    iget-object p0, p0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$402(Lorg/rabochaya/projects/LocalMapView;Z)Z
    .locals 0

    .line 4
    iput-boolean p1, p0, Lorg/rabochaya/projects/LocalMapView;->longConsumed:Z

    return p1
.end method

.method static synthetic access$500(Lorg/rabochaya/projects/LocalMapView;)D
    .locals 2

    .line 4
    iget-wide v0, p0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    return-wide v0
.end method

.method static synthetic access$600(Lorg/rabochaya/projects/LocalMapView;)D
    .locals 2

    .line 4
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$700(Lorg/rabochaya/projects/LocalMapView;)D
    .locals 2

    .line 4
    iget-wide v0, p0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    return-wide v0
.end method

.method static synthetic access$800(Lorg/rabochaya/projects/LocalMapView;DFF)V
    .locals 0

    .line 4
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/rabochaya/projects/LocalMapView;->zoomAt(DFF)V

    return-void
.end method

.method static synthetic access$900(Lorg/rabochaya/projects/LocalMapView;)V
    .locals 0

    .line 4
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapView;->settle()V

    return-void
.end method

.method private changed()V
    .locals 7

    .line 29
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->listener:Lorg/rabochaya/projects/LocalMapView$Listener;

    iget-wide v1, p0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    invoke-static {v1, v2}, Lorg/rabochaya/projects/MapMath;->lat(D)D

    move-result-wide v1

    iget-wide v3, p0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    invoke-static {v3, v4}, Lorg/rabochaya/projects/MapMath;->lon(D)D

    move-result-wide v3

    iget-wide v5, p0, Lorg/rabochaya/projects/LocalMapView;->zoom:D

    invoke-interface/range {v0 .. v6}, Lorg/rabochaya/projects/LocalMapView$Listener;->center(DDD)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->invalidate()V

    return-void
.end method

.method private drawDraft(Landroid/graphics/Canvas;)V
    .locals 18

    .line 38
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    if-nez v2, :cond_0

    return-void

    :cond_0
    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, 0x1

    const-wide/16 v5, 0x0

    move v7, v4

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    const/4 v9, 0x0

    if-eqz v8, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [D

    aget-wide v10, v8, v9

    invoke-static {v10, v11}, Lorg/rabochaya/projects/MapMath;->x(D)D

    move-result-wide v10

    if-eqz v7, :cond_1

    iget-wide v5, v0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    invoke-static {v10, v11, v5, v6}, Lorg/rabochaya/projects/MapMath;->delta(DD)D

    move-result-wide v5

    goto :goto_1

    :cond_1
    iget-wide v12, v0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    add-double/2addr v12, v5

    invoke-static {v12, v13}, Lorg/rabochaya/projects/MapMath;->wrap(D)D

    move-result-wide v12

    invoke-static {v10, v11, v12, v13}, Lorg/rabochaya/projects/MapMath;->delta(DD)D

    move-result-wide v10

    add-double/2addr v5, v10

    :goto_1
    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v10

    int-to-double v10, v10

    const-wide/high16 v12, 0x4000000000000000L    # 2.0

    div-double/2addr v10, v12

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v14

    mul-double/2addr v14, v5

    add-double/2addr v10, v14

    double-to-float v10, v10

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v11

    int-to-double v14, v11

    div-double/2addr v14, v12

    aget-wide v11, v8, v4

    invoke-static {v11, v12}, Lorg/rabochaya/projects/MapMath;->y(D)D

    move-result-wide v11

    move-wide/from16 v16, v5

    iget-wide v4, v0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    sub-double/2addr v11, v4

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v4

    mul-double/2addr v11, v4

    add-double/2addr v14, v11

    double-to-float v4, v14

    if-eqz v7, :cond_2

    invoke-virtual {v2, v10, v4}, Landroid/graphics/Path;->moveTo(FF)V

    move v7, v9

    goto :goto_2

    :cond_2
    invoke-virtual {v2, v10, v4}, Landroid/graphics/Path;->lineTo(FF)V

    :goto_2
    move-wide/from16 v5, v16

    const/4 v4, 0x1

    goto :goto_0

    .line 39
    :cond_3
    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    const v4, -0x982109

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    const/high16 v6, 0x40400000    # 3.0f

    mul-float/2addr v5, v6

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const-string v3, "Polygon"

    iget-object v5, v0, Lorg/rabochaya/projects/LocalMapView;->draftType:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v5, 0x3

    if-lt v3, v5, :cond_4

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    const v5, 0x3367def7

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    :cond_4
    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    iget-object v2, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, v0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [D

    invoke-direct {v0, v3}, Lorg/rabochaya/projects/LocalMapView;->point([D)[F

    move-result-object v3

    aget v4, v3, v9

    const/4 v5, 0x1

    aget v3, v3, v5

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v6, v6, Landroid/util/DisplayMetrics;->density:F

    const/high16 v7, 0x40800000    # 4.0f

    mul-float/2addr v6, v7

    iget-object v7, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v4, v3, v6, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_3

    .line 40
    :cond_5
    return-void
.end method

.method private drawTiles(Landroid/graphics/Canvas;ILorg/rabochaya/projects/TileSource;)V
    .locals 34

    .line 60
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v0, p3

    if-nez v0, :cond_1

    iget-object v1, v6, Lorg/rabochaya/projects/LocalMapView;->tiles:Lorg/rabochaya/projects/OfflineTiles;

    if-eqz v1, :cond_0

    iget-object v1, v6, Lorg/rabochaya/projects/LocalMapView;->tiles:Lorg/rabochaya/projects/OfflineTiles;

    iget-wide v2, v6, Lorg/rabochaya/projects/LocalMapView;->zoom:D

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int v2, v2

    invoke-virtual {v1, v2}, Lorg/rabochaya/projects/OfflineTiles;->zoomFor(I)I

    move-result v1

    goto :goto_0

    :cond_0
    iget-object v1, v6, Lorg/rabochaya/projects/LocalMapView;->bundled:Lorg/rabochaya/projects/BundledTiles;

    iget-wide v2, v6, Lorg/rabochaya/projects/LocalMapView;->zoom:D

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int v2, v2

    invoke-virtual {v1, v2}, Lorg/rabochaya/projects/BundledTiles;->zoomFor(I)I

    move-result v1

    goto :goto_0

    :cond_1
    iget-wide v1, v6, Lorg/rabochaya/projects/LocalMapView;->zoom:D

    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v1

    double-to-int v1, v1

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/TileSource;->zoomFor(I)I

    move-result v1

    :goto_0
    move v8, v1

    const/4 v9, 0x1

    shl-int v10, v9, v8

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v1

    int-to-double v11, v10

    div-double v13, v1, v11

    const/4 v15, 0x0

    if-eqz v0, :cond_2

    iget-boolean v0, v0, Lorg/rabochaya/projects/TileSource;->ellipsoid:Z

    if-eqz v0, :cond_2

    move v5, v9

    goto :goto_1

    :cond_2
    move v5, v15

    .line 61
    :goto_1
    iget-wide v0, v6, Lorg/rabochaya/projects/LocalMapView;->cy:D

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v2

    int-to-double v2, v2

    const-wide/high16 v16, 0x4000000000000000L    # 2.0

    div-double v2, v2, v16

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v18

    div-double v2, v2, v18

    sub-double v18, v0, v2

    const-wide/16 v20, 0x0

    const-wide/high16 v22, 0x3ff0000000000000L    # 1.0

    invoke-static/range {v18 .. v23}, Lorg/rabochaya/projects/MapMath;->clamp(DDD)D

    move-result-wide v0

    iget-wide v2, v6, Lorg/rabochaya/projects/LocalMapView;->cy:D

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v4

    move/from16 v19, v10

    int-to-double v9, v4

    div-double v9, v9, v16

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v20

    div-double v9, v9, v20

    add-double v20, v2, v9

    const-wide/16 v22, 0x0

    const-wide/high16 v24, 0x3ff0000000000000L    # 1.0

    invoke-static/range {v20 .. v25}, Lorg/rabochaya/projects/MapMath;->clamp(DDD)D

    move-result-wide v2

    .line 62
    iget-wide v9, v6, Lorg/rabochaya/projects/LocalMapView;->cx:D

    mul-double/2addr v9, v11

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v4

    move/from16 v20, v8

    int-to-double v7, v4

    div-double v7, v7, v16

    div-double/2addr v7, v13

    sub-double/2addr v9, v7

    invoke-static {v9, v10}, Ljava/lang/Math;->floor(D)D

    move-result-wide v7

    double-to-int v7, v7

    iget-wide v8, v6, Lorg/rabochaya/projects/LocalMapView;->cx:D

    mul-double/2addr v8, v11

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v4

    move v10, v7

    int-to-double v6, v4

    div-double v6, v6, v16

    div-double/2addr v6, v13

    add-double/2addr v8, v6

    invoke-static {v8, v9}, Ljava/lang/Math;->floor(D)D

    move-result-wide v6

    double-to-int v6, v6

    invoke-static {v0, v1}, Lorg/rabochaya/projects/MapMath;->lat(D)D

    move-result-wide v0

    invoke-static {v0, v1, v5}, Lorg/rabochaya/projects/TileProjection;->y(DZ)D

    move-result-wide v0

    mul-double/2addr v0, v11

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    invoke-static {v2, v3}, Lorg/rabochaya/projects/MapMath;->lat(D)D

    move-result-wide v1

    invoke-static {v1, v2, v5}, Lorg/rabochaya/projects/TileProjection;->y(DZ)D

    move-result-wide v1

    mul-double/2addr v1, v11

    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v1

    double-to-int v7, v1

    .line 63
    sub-int v1, v6, v10

    const/4 v2, 0x1

    add-int/2addr v1, v2

    int-to-long v3, v1

    add-int/lit8 v8, v19, -0x1

    invoke-static {v8, v7}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v15, v0}, Ljava/lang/Math;->max(II)I

    move-result v9

    sub-int/2addr v1, v9

    add-int/2addr v1, v2

    invoke-static {v15, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-long v1, v1

    mul-long/2addr v3, v1

    const-wide/16 v1, 0x20

    cmp-long v1, v3, v1

    const/4 v9, -0x1

    if-lez v1, :cond_3

    move-object/from16 v4, p0

    iget-object v0, v4, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v9}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, v4, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->scaledDensity:F

    const/high16 v2, 0x41600000    # 14.0f

    mul-float/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    const/high16 v0, 0x41e00000    # 28.0f

    iget-object v1, v4, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    const-string v2, "\u0423\u0432\u0435\u043b\u0438\u0447\u044c\u0442\u0435 \u043c\u0430\u0441\u0448\u0442\u0430\u0431 \u0434\u043b\u044f \u044d\u0442\u043e\u0439 \u043a\u0430\u0440\u0442\u044b"

    const/high16 v3, 0x41800000    # 16.0f

    move-object/from16 v5, p1

    invoke-virtual {v5, v2, v3, v0, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void

    .line 64
    :cond_3
    move-object/from16 v4, p0

    move-object/from16 v3, p1

    invoke-static {v15, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    :goto_2
    move v2, v0

    invoke-static {v8, v7}, Ljava/lang/Math;->min(II)I

    move-result v0

    if-gt v2, v0, :cond_8

    move v1, v10

    :goto_3
    if-gt v1, v6, :cond_7

    .line 65
    rem-int v0, v1, v19

    add-int v0, v0, v19

    rem-int v0, v0, v19

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v9, p2

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v3, "/"

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move/from16 v22, v6

    move/from16 v6, v20

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v15, v4, Lorg/rabochaya/projects/LocalMapView;->cache:Landroid/util/LruCache;

    invoke-virtual {v15, v3}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/graphics/Bitmap;

    move/from16 v20, v0

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v0

    move/from16 v23, v7

    move/from16 v24, v8

    int-to-double v7, v0

    div-double v7, v7, v16

    move/from16 v25, v10

    int-to-double v9, v1

    move/from16 v26, v1

    iget-wide v0, v4, Lorg/rabochaya/projects/LocalMapView;->cx:D

    mul-double/2addr v0, v11

    sub-double/2addr v9, v0

    mul-double/2addr v9, v13

    add-double/2addr v7, v9

    double-to-float v0, v7

    .line 66
    if-nez v15, :cond_4

    move/from16 v7, v20

    move-object/from16 v0, p0

    move/from16 v10, v26

    move-object v1, v3

    move v8, v2

    move v2, v6

    move-object/from16 v9, p1

    move v3, v7

    move-object v7, v4

    move v4, v8

    move/from16 v20, v5

    move/from16 v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/LocalMapView;->request(Ljava/lang/String;IIII)V

    move/from16 v27, v6

    move/from16 v28, v8

    move-object v2, v9

    move-wide/from16 v31, v13

    const/4 v8, 0x0

    goto/16 :goto_5

    :cond_4
    move-object/from16 v9, p1

    move v8, v2

    move-object v7, v4

    move/from16 v20, v5

    move/from16 v10, v26

    iget-object v1, v7, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, v7, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    const/16 v3, 0xff

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v1, v7, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 67
    if-nez v20, :cond_5

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v1

    int-to-double v2, v1

    div-double v2, v2, v16

    int-to-double v4, v8

    move v1, v8

    iget-wide v8, v7, Lorg/rabochaya/projects/LocalMapView;->cy:D

    mul-double/2addr v8, v11

    sub-double/2addr v4, v8

    mul-double/2addr v4, v13

    add-double/2addr v2, v4

    double-to-float v2, v2

    new-instance v3, Landroid/graphics/RectF;

    float-to-double v4, v0

    add-double/2addr v4, v13

    const-wide/high16 v8, 0x3fe0000000000000L    # 0.5

    add-double/2addr v4, v8

    double-to-float v4, v4

    move/from16 v27, v6

    float-to-double v5, v2

    add-double/2addr v5, v13

    add-double/2addr v5, v8

    double-to-float v5, v5

    invoke-direct {v3, v0, v2, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget-object v0, v7, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    move-object/from16 v4, p1

    invoke-virtual {v4, v15, v2, v3, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    move/from16 v28, v1

    move-object v2, v4

    move-wide/from16 v31, v13

    const/4 v8, 0x0

    goto/16 :goto_5

    .line 69
    :cond_5
    move/from16 v27, v6

    move v1, v8

    move-object v4, v9

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x10

    const/4 v3, 0x1

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    const/4 v3, 0x0

    :goto_4
    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    if-ge v3, v5, :cond_6

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    add-int v6, v3, v2

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v5

    int-to-double v8, v1

    move/from16 v28, v1

    move/from16 v29, v2

    int-to-double v1, v3

    move/from16 v30, v6

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    move-wide/from16 v31, v13

    int-to-double v13, v6

    div-double/2addr v1, v13

    add-double/2addr v1, v8

    div-double/2addr v1, v11

    const/4 v6, 0x1

    invoke-static {v1, v2, v6}, Lorg/rabochaya/projects/TileProjection;->latitude(DZ)D

    move-result-wide v1

    invoke-static {v1, v2}, Lorg/rabochaya/projects/MapMath;->y(D)D

    move-result-wide v1

    int-to-double v13, v5

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    move/from16 v33, v3

    int-to-double v3, v6

    div-double/2addr v13, v3

    add-double/2addr v8, v13

    div-double/2addr v8, v11

    const/4 v3, 0x1

    invoke-static {v8, v9, v3}, Lorg/rabochaya/projects/TileProjection;->latitude(DZ)D

    move-result-wide v8

    invoke-static {v8, v9}, Lorg/rabochaya/projects/MapMath;->y(D)D

    move-result-wide v8

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v4

    int-to-double v13, v4

    div-double v13, v13, v16

    iget-wide v3, v7, Lorg/rabochaya/projects/LocalMapView;->cy:D

    sub-double/2addr v1, v3

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v3

    mul-double/2addr v1, v3

    add-double/2addr v13, v1

    double-to-float v1, v13

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v2

    int-to-double v2, v2

    div-double v2, v2, v16

    iget-wide v13, v7, Lorg/rabochaya/projects/LocalMapView;->cy:D

    sub-double/2addr v8, v13

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v13

    mul-double/2addr v8, v13

    add-double/2addr v2, v8

    double-to-float v2, v2

    new-instance v3, Landroid/graphics/Rect;

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    move/from16 v6, v33

    const/4 v8, 0x0

    invoke-direct {v3, v8, v6, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v4, Landroid/graphics/RectF;

    float-to-double v5, v0

    add-double v5, v5, v31

    const-wide/high16 v13, 0x3fe0000000000000L    # 0.5

    add-double/2addr v5, v13

    double-to-float v5, v5

    const/high16 v6, 0x3f000000    # 0.5f

    add-float/2addr v2, v6

    invoke-direct {v4, v0, v1, v5, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget-object v1, v7, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual {v2, v15, v3, v4, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    move-object v4, v2

    move/from16 v1, v28

    move/from16 v2, v29

    move/from16 v3, v30

    move-wide/from16 v13, v31

    goto/16 :goto_4

    :cond_6
    move/from16 v28, v1

    move-object v2, v4

    move-wide/from16 v31, v13

    const/4 v8, 0x0

    .line 64
    :goto_5
    add-int/lit8 v1, v10, 0x1

    move-object v3, v2

    move-object v4, v7

    move v15, v8

    move/from16 v5, v20

    move/from16 v6, v22

    move/from16 v7, v23

    move/from16 v8, v24

    move/from16 v10, v25

    move/from16 v20, v27

    move/from16 v2, v28

    move-wide/from16 v13, v31

    const/4 v9, -0x1

    goto/16 :goto_3

    :cond_7
    move/from16 v28, v2

    move-object v2, v3

    move/from16 v22, v6

    move/from16 v23, v7

    move/from16 v24, v8

    move/from16 v25, v10

    move-wide/from16 v31, v13

    move v8, v15

    move/from16 v27, v20

    move-object v7, v4

    move/from16 v20, v5

    add-int/lit8 v0, v28, 0x1

    move/from16 v7, v23

    move/from16 v8, v24

    move/from16 v20, v27

    const/4 v9, -0x1

    goto/16 :goto_2

    .line 72
    :cond_8
    move-object v7, v4

    return-void
.end method

.method private point([D)[F
    .locals 9

    .line 30
    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v0

    int-to-double v0, v0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    div-double/2addr v0, v2

    const/4 v4, 0x0

    aget-wide v5, p1, v4

    invoke-static {v5, v6}, Lorg/rabochaya/projects/MapMath;->x(D)D

    move-result-wide v5

    iget-wide v7, p0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    invoke-static {v5, v6, v7, v8}, Lorg/rabochaya/projects/MapMath;->delta(DD)D

    move-result-wide v5

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v7

    mul-double/2addr v5, v7

    add-double/2addr v0, v5

    double-to-float v0, v0

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v1

    int-to-double v5, v1

    div-double/2addr v5, v2

    const/4 v1, 0x1

    aget-wide v2, p1, v1

    invoke-static {v2, v3}, Lorg/rabochaya/projects/MapMath;->y(D)D

    move-result-wide v2

    iget-wide v7, p0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    sub-double/2addr v2, v7

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v7

    mul-double/2addr v2, v7

    add-double/2addr v5, v2

    double-to-float p1, v5

    const/4 v2, 0x2

    new-array v2, v2, [F

    aput v0, v2, v4

    aput p1, v2, v1

    return-object v2
.end method

.method private request(Ljava/lang/String;IIII)V
    .locals 9

    .line 42
    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapView;->disposed:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapView;->paused:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->pending:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    const/16 v1, 0x20

    if-ge v0, v1, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->pending:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->missing:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->pending:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 43
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v8, Lorg/rabochaya/projects/LocalMapView$5;

    move-object v1, v8

    move-object v2, p0

    move v3, p5

    move v4, p2

    move v5, p3

    move v6, p4

    move-object v7, p1

    invoke-direct/range {v1 .. v7}, Lorg/rabochaya/projects/LocalMapView$5;-><init>(Lorg/rabochaya/projects/LocalMapView;IIIILjava/lang/String;)V

    invoke-interface {v0, v8}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 44
    return-void

    .line 42
    :cond_1
    :goto_0
    return-void
.end method

.method private settle()V
    .locals 7

    .line 28
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->listener:Lorg/rabochaya/projects/LocalMapView$Listener;

    iget-wide v1, p0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    iget-wide v3, p0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    iget-wide v5, p0, Lorg/rabochaya/projects/LocalMapView;->zoom:D

    invoke-interface/range {v0 .. v6}, Lorg/rabochaya/projects/LocalMapView$Listener;->settled(DDD)V

    return-void
.end method

.method private world()D
    .locals 4

    .line 20
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    iget-wide v2, p0, Lorg/rabochaya/projects/LocalMapView;->zoom:D

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    const-wide/high16 v2, 0x4070000000000000L    # 256.0

    mul-double/2addr v0, v2

    return-wide v0
.end method

.method private zoomAt(DFF)V
    .locals 16

    .line 27
    move-object/from16 v0, p0

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v1

    iget-wide v3, v0, Lorg/rabochaya/projects/LocalMapView;->zoom:D

    add-double v5, v3, p1

    const-wide/16 v7, 0x0

    const-wide/high16 v9, 0x4037000000000000L    # 23.0

    invoke-static/range {v5 .. v10}, Lorg/rabochaya/projects/MapMath;->clamp(DDD)D

    move-result-wide v3

    iget-wide v5, v0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    move/from16 v7, p3

    float-to-double v7, v7

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v9

    int-to-double v9, v9

    const-wide/high16 v11, 0x4000000000000000L    # 2.0

    div-double/2addr v9, v11

    sub-double v9, v7, v9

    div-double/2addr v9, v1

    add-double/2addr v5, v9

    iget-wide v9, v0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    move/from16 v13, p4

    float-to-double v13, v13

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v15

    move-wide/from16 p1, v5

    int-to-double v5, v15

    div-double/2addr v5, v11

    sub-double v5, v13, v5

    div-double/2addr v5, v1

    add-double/2addr v9, v5

    iput-wide v3, v0, Lorg/rabochaya/projects/LocalMapView;->zoom:D

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v1

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v3

    int-to-double v3, v3

    div-double/2addr v3, v11

    sub-double/2addr v7, v3

    div-double/2addr v7, v1

    move-wide/from16 v5, p1

    sub-double/2addr v5, v7

    invoke-static {v5, v6}, Lorg/rabochaya/projects/MapMath;->wrap(D)D

    move-result-wide v3

    iput-wide v3, v0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v3

    int-to-double v3, v3

    div-double/2addr v3, v11

    sub-double/2addr v13, v3

    div-double/2addr v13, v1

    sub-double v1, v9, v13

    const-wide/16 v3, 0x0

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    invoke-static/range {v1 .. v6}, Lorg/rabochaya/projects/MapMath;->clamp(DDD)D

    move-result-wide v1

    iput-wide v1, v0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->changed()V

    return-void
.end method


# virtual methods
.method public addDrawingCenter()V
    .locals 4

    .line 35
    iget-wide v0, p0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    invoke-static {v0, v1}, Lorg/rabochaya/projects/MapMath;->lon(D)D

    move-result-wide v0

    iget-wide v2, p0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    invoke-static {v2, v3}, Lorg/rabochaya/projects/MapMath;->lat(D)D

    move-result-wide v2

    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/rabochaya/projects/LocalMapView;->addDrawingPoint(DD)V

    return-void
.end method

.method public addDrawingPoint(DD)V
    .locals 4

    .line 34
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0x7d0

    if-lt v0, v1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapView;->listener:Lorg/rabochaya/projects/LocalMapView$Listener;

    const-string p2, "\u041f\u0440\u0435\u0434\u0435\u043b \u0440\u0438\u0441\u0443\u043d\u043a\u0430 \u2014 2000 \u0432\u0435\u0440\u0448\u0438\u043d"

    invoke-interface {p1, p2}, Lorg/rabochaya/projects/LocalMapView$Listener;->error(Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {p3, p4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {p1, p2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {p3, p4}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {p3, p4}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    const-wide v2, 0x4056800000000000L    # 90.0

    cmpl-double v0, v0, v2

    if-lez v0, :cond_2

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapMath;->x(D)D

    move-result-wide p1

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapMath;->lon(D)D

    move-result-wide p1

    const/4 v1, 0x3

    new-array v1, v1, [D

    const/4 v2, 0x0

    aput-wide p1, v1, v2

    const/4 p1, 0x1

    aput-wide p3, v1, p1

    const-wide/16 p1, 0x0

    const/4 p3, 0x2

    aput-wide p1, v1, p3

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapView;->listener:Lorg/rabochaya/projects/LocalMapView$Listener;

    iget-object p2, p0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    invoke-interface {p1, p2}, Lorg/rabochaya/projects/LocalMapView$Listener;->draftChanged(I)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->invalidate()V

    :cond_3
    :goto_0
    return-void
.end method

.method public beginDrawing(Ljava/lang/String;)V
    .locals 1

    .line 33
    const-string v0, "LineString"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "Polygon"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "drawing type"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView;->draftType:Ljava/lang/String;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapView;->listener:Lorg/rabochaya/projects/LocalMapView$Listener;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lorg/rabochaya/projects/LocalMapView$Listener;->draftChanged(I)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->invalidate()V

    return-void
.end method

.method public bounds()[D
    .locals 10

    .line 85
    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v0

    int-to-double v0, v0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    div-double/2addr v0, v2

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v4

    div-double/2addr v0, v4

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v4

    int-to-double v4, v4

    div-double/2addr v4, v2

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v2

    div-double/2addr v4, v2

    const/4 v2, 0x4

    new-array v2, v2, [D

    const-wide/high16 v6, 0x3fe0000000000000L    # 0.5

    cmpl-double v3, v0, v6

    if-ltz v3, :cond_0

    const-wide v6, -0x3f99800000000000L    # -180.0

    goto :goto_0

    :cond_0
    iget-wide v6, p0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    sub-double/2addr v6, v0

    invoke-static {v6, v7}, Lorg/rabochaya/projects/MapMath;->lon(D)D

    move-result-wide v6

    :goto_0
    const/4 v8, 0x0

    aput-wide v6, v2, v8

    iget-wide v6, p0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    add-double/2addr v6, v4

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->min(DD)D

    move-result-wide v6

    invoke-static {v6, v7}, Lorg/rabochaya/projects/MapMath;->lat(D)D

    move-result-wide v6

    const/4 v8, 0x1

    aput-wide v6, v2, v8

    if-ltz v3, :cond_1

    const-wide v0, 0x4066800000000000L    # 180.0

    goto :goto_1

    :cond_1
    iget-wide v6, p0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    add-double/2addr v6, v0

    invoke-static {v6, v7}, Lorg/rabochaya/projects/MapMath;->lon(D)D

    move-result-wide v0

    :goto_1
    const/4 v3, 0x2

    aput-wide v0, v2, v3

    iget-wide v0, p0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    sub-double/2addr v0, v4

    const-wide/16 v3, 0x0

    invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/rabochaya/projects/MapMath;->lat(D)D

    move-result-wide v0

    const/4 v3, 0x3

    aput-wide v0, v2, v3

    return-object v2
.end method

.method public cancelDrawing()V
    .locals 2

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    iput-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->draftType:Ljava/lang/String;

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->listener:Lorg/rabochaya/projects/LocalMapView$Listener;

    const/4 v1, -0x1

    invoke-interface {v0, v1}, Lorg/rabochaya/projects/LocalMapView$Listener;->draftChanged(I)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->invalidate()V

    return-void
.end method

.method public close()V
    .locals 4

    .line 87
    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapView;->disposed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/LocalMapView;->disposed:Z

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->online:[Lorg/rabochaya/projects/OnlineTiles;

    if-eqz v0, :cond_1

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    invoke-virtual {v3}, Lorg/rabochaya/projects/OnlineTiles;->cancel()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/rabochaya/projects/LocalMapView$6;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/LocalMapView$6;-><init>(Lorg/rabochaya/projects/LocalMapView;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->worker:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->cache:Landroid/util/LruCache;

    invoke-virtual {v0}, Landroid/util/LruCache;->evictAll()V

    return-void
.end method

.method public drawingPoints()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "[D>;"
        }
    .end annotation

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [D

    invoke-virtual {v2}, [D->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [D

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public drawingType()Ljava/lang/String;
    .locals 1

    .line 31
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->draftType:Ljava/lang/String;

    return-object v0
.end method

.method public fit()V
    .locals 7

    .line 23
    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-lt v0, v2, :cond_4

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v0

    if-ge v0, v2, :cond_0

    goto :goto_1

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v3, p0, Lorg/rabochaya/projects/LocalMapView;->features:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/KmlProject$Feature;

    iget-object v4, v4, Lorg/rabochaya/projects/KmlProject$Feature;->shapes:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/rabochaya/projects/KmlProject$Geometry;

    iget-object v5, v5, Lorg/rabochaya/projects/KmlProject$Geometry;->rings:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [[D

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[D

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v4

    invoke-static {v0, v3, v4}, Lorg/rabochaya/projects/MapMath;->fit([[DII)[D

    move-result-object v0

    aget-wide v3, v0, v1

    iput-wide v3, p0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    aget-wide v3, v0, v2

    iput-wide v3, p0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    const/4 v1, 0x2

    aget-wide v3, v0, v1

    iput-wide v3, p0, Lorg/rabochaya/projects/LocalMapView;->zoom:D

    iput-boolean v2, p0, Lorg/rabochaya/projects/LocalMapView;->fitted:Z

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapView;->changed()V

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapView;->settle()V

    return-void

    :cond_4
    :goto_1
    iput-boolean v1, p0, Lorg/rabochaya/projects/LocalMapView;->fitted:Z

    iput-boolean v1, p0, Lorg/rabochaya/projects/LocalMapView;->restored:Z

    return-void
.end method

.method public focus(Lorg/rabochaya/projects/KmlProject$Feature;)V
    .locals 9

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object p1, p1, Lorg/rabochaya/projects/KmlProject$Feature;->shapes:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/KmlProject$Geometry;

    iget-object v1, v1, Lorg/rabochaya/projects/KmlProject$Geometry;->rings:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [[D

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [[D

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {p1, v0, v2}, Lorg/rabochaya/projects/MapMath;->fit([[DII)[D

    move-result-object p1

    const/4 v0, 0x0

    aget-wide v3, p1, v0

    aget-wide v5, p1, v1

    const/4 v0, 0x2

    aget-wide v7, p1, v0

    move-object v2, p0

    invoke-virtual/range {v2 .. v8}, Lorg/rabochaya/projects/LocalMapView;->restore(DDD)V

    return-void
.end method

.method synthetic lambda$new$0$org-rabochaya-projects-LocalMapView()V
    .locals 1

    .line 15
    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapView;->disposed:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->invalidate()V

    :cond_0
    return-void
.end method

.method synthetic lambda$new$1$org-rabochaya-projects-LocalMapView(Lorg/rabochaya/projects/LocalMapView$Listener;Ljava/lang/Exception;)V
    .locals 1

    .line 15
    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapView;->disposed:Z

    if-nez v0, :cond_0

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Lorg/rabochaya/projects/LocalMapView$Listener;->error(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$new$2$org-rabochaya-projects-LocalMapView(Lorg/rabochaya/projects/TileSource;Landroid/content/Context;Lorg/rabochaya/projects/LocalMapView$Listener;)V
    .locals 7

    .line 15
    :try_start_0
    invoke-virtual {p1}, Lorg/rabochaya/projects/TileSource;->leafs()[Lorg/rabochaya/projects/TileSource;

    move-result-object v0

    array-length v1, v0

    new-array v2, v1, [Lorg/rabochaya/projects/OnlineTiles;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    :try_start_1
    array-length v5, v0

    if-ge v4, v5, :cond_0

    new-instance v5, Lorg/rabochaya/projects/OnlineTiles;

    aget-object v6, v0, v4

    invoke-direct {v5, p2, v6}, Lorg/rabochaya/projects/OnlineTiles;-><init>(Landroid/content/Context;Lorg/rabochaya/projects/TileSource;)V

    aput-object v5, v2, v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    :try_start_2
    iput-object v2, p0, Lorg/rabochaya/projects/LocalMapView;->online:[Lorg/rabochaya/projects/OnlineTiles;

    iget p2, p1, Lorg/rabochaya/projects/TileSource;->minZoom:I

    iput p2, p0, Lorg/rabochaya/projects/LocalMapView;->minZoom:I

    iget p1, p1, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    iput p1, p0, Lorg/rabochaya/projects/LocalMapView;->maxZoom:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lorg/rabochaya/projects/LocalMapView;->mapReady:Z

    new-instance p1, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/LocalMapView;)V

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/LocalMapView;->post(Ljava/lang/Runnable;)Z

    goto :goto_2

    :catch_0
    move-exception p1

    :goto_1
    if-ge v3, v1, :cond_2

    aget-object p2, v2, v3

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lorg/rabochaya/projects/OnlineTiles;->close()V

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_2
    throw p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :catch_1
    move-exception p1

    new-instance p2, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda1;

    invoke-direct {p2, p0, p3, p1}, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda1;-><init>(Lorg/rabochaya/projects/LocalMapView;Lorg/rabochaya/projects/LocalMapView$Listener;Ljava/lang/Exception;)V

    invoke-virtual {p0, p2}, Lorg/rabochaya/projects/LocalMapView;->post(Ljava/lang/Runnable;)Z

    :goto_2
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 26

    .line 46
    move-object/from16 v0, p0

    move-object/from16 v7, p1

    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    const v1, -0xdacfe0

    invoke-virtual {v7, v1}, Landroid/graphics/Canvas;->drawColor(I)V

    iget-object v1, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    const v2, -0xc1b3cb

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-virtual {v1, v8}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 47
    const/4 v9, 0x0

    move v10, v9

    :goto_0
    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v1

    if-ge v10, v1, :cond_0

    int-to-float v4, v10

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v1

    int-to-float v5, v1

    iget-object v6, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    const/4 v3, 0x0

    move-object/from16 v1, p1

    move v2, v4

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v10, v10, 0x40

    goto :goto_0

    :cond_0
    move v10, v9

    :goto_1
    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v1

    if-ge v10, v1, :cond_1

    int-to-float v5, v10

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v1

    int-to-float v4, v1

    iget-object v6, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    move-object/from16 v1, p1

    move v3, v5

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v10, v10, 0x40

    goto :goto_1

    .line 48
    :cond_1
    iget-boolean v1, v0, Lorg/rabochaya/projects/LocalMapView;->mapReady:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    iget-object v1, v0, Lorg/rabochaya/projects/LocalMapView;->online:[Lorg/rabochaya/projects/OnlineTiles;

    if-eqz v1, :cond_2

    move v1, v9

    :goto_2
    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapView;->online:[Lorg/rabochaya/projects/OnlineTiles;

    array-length v3, v3

    if-ge v1, v3, :cond_3

    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapView;->online:[Lorg/rabochaya/projects/OnlineTiles;

    aget-object v3, v3, v1

    iget-object v3, v3, Lorg/rabochaya/projects/OnlineTiles;->source:Lorg/rabochaya/projects/TileSource;

    invoke-direct {v0, v7, v1, v3}, Lorg/rabochaya/projects/LocalMapView;->drawTiles(Landroid/graphics/Canvas;ILorg/rabochaya/projects/TileSource;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_2
    invoke-direct {v0, v7, v9, v2}, Lorg/rabochaya/projects/LocalMapView;->drawTiles(Landroid/graphics/Canvas;ILorg/rabochaya/projects/TileSource;)V

    .line 49
    :cond_3
    nop

    .line 50
    iget-object v1, v0, Lorg/rabochaya/projects/LocalMapView;->features:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move v3, v9

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/high16 v5, 0x40400000    # 3.0f

    if-eqz v4, :cond_f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/KmlProject$Feature;

    iget-object v6, v4, Lorg/rabochaya/projects/KmlProject$Feature;->shapes:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move-object v10, v2

    :goto_4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    const/high16 v12, -0x1000000

    const/4 v13, 0x1

    if-eqz v11, :cond_c

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/rabochaya/projects/KmlProject$Geometry;

    iget-object v14, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    iget v15, v4, Lorg/rabochaya/projects/KmlProject$Feature;->color:I

    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v14, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    invoke-virtual {v15}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v15

    iget v15, v15, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v15, v5

    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v14, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    sget-object v15, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 51
    const-string v14, "Point"

    iget-object v15, v11, Lorg/rabochaya/projects/KmlProject$Geometry;->type:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_4

    iget-object v10, v11, Lorg/rabochaya/projects/KmlProject$Geometry;->rings:Ljava/util/List;

    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [D

    invoke-direct {v0, v10}, Lorg/rabochaya/projects/LocalMapView;->point([D)[F

    move-result-object v10

    iget-object v11, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    sget-object v14, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v11, v14}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    aget v11, v10, v9

    aget v14, v10, v13

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    invoke-virtual {v15}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v15

    iget v15, v15, Landroid/util/DisplayMetrics;->density:F

    const/high16 v16, 0x40e00000    # 7.0f

    mul-float v15, v15, v16

    iget-object v2, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v11, v14, v15, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v2, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    sget-object v11, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v11}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v2, v12}, Landroid/graphics/Paint;->setColor(I)V

    aget v2, v10, v9

    aget v11, v10, v13

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v12}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v12

    iget v12, v12, Landroid/util/DisplayMetrics;->density:F

    const/high16 v13, 0x41000000    # 8.0f

    mul-float/2addr v12, v13

    iget-object v13, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v2, v11, v12, v13}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    move-object/from16 v23, v6

    move-object v6, v7

    goto/16 :goto_a

    .line 52
    :cond_4
    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    sget-object v12, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    invoke-virtual {v2, v12}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    iget-object v12, v11, Lorg/rabochaya/projects/KmlProject$Geometry;->rings:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_5
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    const-string v15, "Polygon"

    if-eqz v14, :cond_a

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/List;

    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    const-wide/16 v17, 0x0

    move/from16 v19, v13

    :goto_6
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_8

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, [D

    aget-wide v21, v20, v9

    move-object/from16 v23, v6

    invoke-static/range {v21 .. v22}, Lorg/rabochaya/projects/MapMath;->x(D)D

    move-result-wide v5

    iget-wide v8, v0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    if-eqz v19, :cond_5

    invoke-static {v5, v6, v8, v9}, Lorg/rabochaya/projects/MapMath;->delta(DD)D

    move-result-wide v5

    move-wide/from16 v17, v5

    goto :goto_7

    :cond_5
    add-double v8, v8, v17

    invoke-static {v8, v9}, Lorg/rabochaya/projects/MapMath;->wrap(D)D

    move-result-wide v8

    invoke-static {v5, v6, v8, v9}, Lorg/rabochaya/projects/MapMath;->delta(DD)D

    move-result-wide v5

    add-double v17, v17, v5

    :goto_7
    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v5

    int-to-double v5, v5

    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    div-double/2addr v5, v8

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v24

    mul-double v24, v24, v17

    add-double v5, v5, v24

    double-to-float v5, v5

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v6

    int-to-double v6, v6

    div-double/2addr v6, v8

    aget-wide v8, v20, v13

    invoke-static {v8, v9}, Lorg/rabochaya/projects/MapMath;->y(D)D

    move-result-wide v8

    move-object/from16 v24, v14

    iget-wide v13, v0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    sub-double/2addr v8, v13

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v13

    mul-double/2addr v8, v13

    add-double/2addr v6, v8

    double-to-float v6, v6

    if-nez v10, :cond_6

    const/4 v7, 0x2

    new-array v10, v7, [F

    const/4 v7, 0x0

    aput v5, v10, v7

    const/4 v7, 0x1

    aput v6, v10, v7

    :cond_6
    if-eqz v19, :cond_7

    invoke-virtual {v2, v5, v6}, Landroid/graphics/Path;->moveTo(FF)V

    const/16 v19, 0x0

    goto :goto_8

    :cond_7
    invoke-virtual {v2, v5, v6}, Landroid/graphics/Path;->lineTo(FF)V

    :goto_8
    move-object/from16 v7, p1

    move-object/from16 v6, v23

    move-object/from16 v14, v24

    const/high16 v5, 0x40400000    # 3.0f

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    const/4 v13, 0x1

    goto :goto_6

    :cond_8
    move-object/from16 v23, v6

    iget-object v5, v11, Lorg/rabochaya/projects/KmlProject$Geometry;->type:Ljava/lang/String;

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_9

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    :cond_9
    move-object/from16 v7, p1

    move-object/from16 v6, v23

    const/high16 v5, 0x40400000    # 3.0f

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    const/4 v13, 0x1

    goto/16 :goto_5

    .line 53
    :cond_a
    move-object/from16 v23, v6

    iget-object v5, v11, Lorg/rabochaya/projects/KmlProject$Geometry;->type:Ljava/lang/String;

    invoke-virtual {v15, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    iget-object v5, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v5, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    iget v6, v4, Lorg/rabochaya/projects/KmlProject$Feature;->color:I

    const v7, 0xffffff

    and-int/2addr v6, v7

    const/high16 v7, 0x45000000    # 2048.0f

    or-int/2addr v6, v7

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v5, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    move-object/from16 v6, p1

    invoke-virtual {v6, v2, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    iget-object v5, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v5, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    iget v7, v4, Lorg/rabochaya/projects/KmlProject$Feature;->color:I

    invoke-virtual {v5, v7}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_9

    :cond_b
    move-object/from16 v6, p1

    :goto_9
    iget-object v5, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v6, v2, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 54
    :goto_a
    move-object v7, v6

    move-object/from16 v6, v23

    const/4 v2, 0x0

    const/high16 v5, 0x40400000    # 3.0f

    const/high16 v8, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    goto/16 :goto_4

    .line 55
    :cond_c
    move-object v6, v7

    if-eqz v10, :cond_e

    add-int/lit8 v2, v3, 0x1

    const/16 v5, 0xc8

    if-ge v3, v5, :cond_d

    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    const/4 v5, -0x1

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->scaledDensity:F

    const/high16 v7, 0x41600000    # 14.0f

    mul-float/2addr v5, v7

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    const/high16 v5, 0x40400000    # 3.0f

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-virtual {v3, v5, v8, v8, v12}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    iget-object v3, v4, Lorg/rabochaya/projects/KmlProject$Feature;->name:Ljava/lang/String;

    const/4 v4, 0x0

    aget v5, v10, v4

    add-float/2addr v5, v7

    const/4 v9, 0x1

    aget v9, v10, v9

    sub-float/2addr v9, v7

    iget-object v7, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v6, v3, v5, v9, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->clearShadowLayer()V

    goto :goto_b

    :cond_d
    const/4 v4, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    .line 56
    :goto_b
    move v3, v2

    goto :goto_c

    .line 55
    :cond_e
    const/4 v4, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    .line 56
    :goto_c
    move v9, v4

    move-object v7, v6

    const/4 v2, 0x0

    goto/16 :goto_3

    .line 57
    :cond_f
    move-object v6, v7

    invoke-direct/range {p0 .. p1}, Lorg/rabochaya/projects/LocalMapView;->drawDraft(Landroid/graphics/Canvas;)V

    iget-object v1, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    const v2, -0xf30ae

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v2

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    const/high16 v4, 0x40400000    # 3.0f

    mul-float/2addr v2, v4

    iget-object v4, v0, Lorg/rabochaya/projects/LocalMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v6, v1, v3, v2, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 58
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 25
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    iget-boolean p1, p0, Lorg/rabochaya/projects/LocalMapView;->fitted:Z

    if-nez p1, :cond_0

    iget-boolean p1, p0, Lorg/rabochaya/projects/LocalMapView;->restored:Z

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->fit()V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapView;->changed()V

    :goto_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 35

    .line 74
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_0

    iput-boolean v3, v0, Lorg/rabochaya/projects/LocalMapView;->longConsumed:Z

    :cond_0
    iget-object v2, v0, Lorg/rabochaya/projects/LocalMapView;->contextGesture:Landroid/view/GestureDetector;

    invoke-virtual {v2, v1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    iget-object v2, v0, Lorg/rabochaya/projects/LocalMapView;->scale:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v2, v1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    .line 75
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v5

    const/4 v6, 0x1

    packed-switch v5, :pswitch_data_0

    .line 82
    :pswitch_0
    move v1, v6

    return v1

    .line 78
    :pswitch_1
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    if-nez v2, :cond_1

    move v3, v6

    :cond_1
    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    iput v2, v0, Lorg/rabochaya/projects/LocalMapView;->lastX:F

    invoke-virtual {v1, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    iput v1, v0, Lorg/rabochaya/projects/LocalMapView;->lastY:F

    return v6

    .line 77
    :pswitch_2
    iput-boolean v6, v0, Lorg/rabochaya/projects/LocalMapView;->moved:Z

    return v6

    .line 81
    :pswitch_3
    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->settle()V

    return v6

    .line 79
    :pswitch_4
    iget-boolean v3, v0, Lorg/rabochaya/projects/LocalMapView;->longConsumed:Z

    if-eqz v3, :cond_2

    return v6

    :cond_2
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    if-ne v1, v6, :cond_4

    iget-object v1, v0, Lorg/rabochaya/projects/LocalMapView;->scale:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v1}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v1

    if-nez v1, :cond_4

    iget-wide v7, v0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    iget v1, v0, Lorg/rabochaya/projects/LocalMapView;->lastX:F

    sub-float v1, v2, v1

    float-to-double v9, v1

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v11

    div-double/2addr v9, v11

    sub-double/2addr v7, v9

    invoke-static {v7, v8}, Lorg/rabochaya/projects/MapMath;->wrap(D)D

    move-result-wide v7

    iput-wide v7, v0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    iget-wide v7, v0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    iget v1, v0, Lorg/rabochaya/projects/LocalMapView;->lastY:F

    sub-float v1, v4, v1

    float-to-double v9, v1

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v11

    div-double/2addr v9, v11

    sub-double v11, v7, v9

    const-wide/16 v13, 0x0

    const-wide/high16 v15, 0x3ff0000000000000L    # 1.0

    invoke-static/range {v11 .. v16}, Lorg/rabochaya/projects/MapMath;->clamp(DDD)D

    move-result-wide v7

    iput-wide v7, v0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    iget v1, v0, Lorg/rabochaya/projects/LocalMapView;->downX:F

    sub-float v1, v2, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iget v3, v0, Lorg/rabochaya/projects/LocalMapView;->downY:F

    sub-float v3, v4, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    add-float/2addr v1, v3

    const/high16 v3, 0x41000000    # 8.0f

    cmpl-float v1, v1, v3

    if-lez v1, :cond_3

    iput-boolean v6, v0, Lorg/rabochaya/projects/LocalMapView;->moved:Z

    :cond_3
    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->changed()V

    :cond_4
    iput v2, v0, Lorg/rabochaya/projects/LocalMapView;->lastX:F

    iput v4, v0, Lorg/rabochaya/projects/LocalMapView;->lastY:F

    return v6

    .line 80
    :pswitch_5
    iget-boolean v1, v0, Lorg/rabochaya/projects/LocalMapView;->longConsumed:Z

    if-eqz v1, :cond_5

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->settle()V

    return v6

    :cond_5
    iget-boolean v1, v0, Lorg/rabochaya/projects/LocalMapView;->moved:Z

    if-eqz v1, :cond_6

    iget-wide v7, v0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    iget v1, v0, Lorg/rabochaya/projects/LocalMapView;->lastX:F

    sub-float v1, v2, v1

    float-to-double v9, v1

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v11

    div-double/2addr v9, v11

    sub-double/2addr v7, v9

    invoke-static {v7, v8}, Lorg/rabochaya/projects/MapMath;->wrap(D)D

    move-result-wide v7

    iput-wide v7, v0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    iget-wide v7, v0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    iget v1, v0, Lorg/rabochaya/projects/LocalMapView;->lastY:F

    sub-float v1, v4, v1

    float-to-double v9, v1

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v11

    div-double/2addr v9, v11

    sub-double v11, v7, v9

    const-wide/16 v13, 0x0

    const-wide/high16 v15, 0x3ff0000000000000L    # 1.0

    invoke-static/range {v11 .. v16}, Lorg/rabochaya/projects/MapMath;->clamp(DDD)D

    move-result-wide v7

    iput-wide v7, v0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->changed()V

    :cond_6
    iget-boolean v1, v0, Lorg/rabochaya/projects/LocalMapView;->moved:Z

    if-nez v1, :cond_e

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->performClick()Z

    iget-object v1, v0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    if-eqz v1, :cond_7

    iget-wide v7, v0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    float-to-double v1, v2

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v3

    int-to-double v9, v3

    const-wide/high16 v11, 0x4000000000000000L    # 2.0

    div-double/2addr v9, v11

    sub-double/2addr v1, v9

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v9

    div-double/2addr v1, v9

    add-double/2addr v7, v1

    invoke-static {v7, v8}, Lorg/rabochaya/projects/MapMath;->lon(D)D

    move-result-wide v1

    iget-wide v7, v0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    float-to-double v3, v4

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v5

    int-to-double v9, v5

    div-double/2addr v9, v11

    sub-double/2addr v3, v9

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v9

    div-double/2addr v3, v9

    add-double/2addr v7, v3

    invoke-static {v7, v8}, Lorg/rabochaya/projects/MapMath;->lat(D)D

    move-result-wide v3

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/rabochaya/projects/LocalMapView;->addDrawingPoint(DD)V

    goto/16 :goto_4

    :cond_7
    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v5, 0x42000000    # 32.0f

    mul-float/2addr v1, v5

    float-to-double v7, v1

    iget-object v1, v0, Lorg/rabochaya/projects/LocalMapView;->features:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v5, -0x1

    const/4 v9, 0x0

    move-wide v10, v7

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/rabochaya/projects/KmlProject$Feature;

    iget-object v13, v12, Lorg/rabochaya/projects/KmlProject$Feature;->shapes:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_c

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/rabochaya/projects/KmlProject$Geometry;

    iget-object v15, v14, Lorg/rabochaya/projects/KmlProject$Geometry;->type:Ljava/lang/String;

    iget-object v3, v14, Lorg/rabochaya/projects/KmlProject$Geometry;->rings:Ljava/util/List;

    move-wide/from16 v29, v7

    iget-wide v6, v0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    move-object/from16 p1, v9

    iget-wide v8, v0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->world()D

    move-result-wide v21

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v23

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v24

    move-object/from16 v31, v12

    move-object/from16 v32, v13

    float-to-double v12, v2

    move-object/from16 v34, v1

    move/from16 v33, v2

    float-to-double v1, v4

    move-object/from16 v16, v3

    move-wide/from16 v17, v6

    move-wide/from16 v19, v8

    move-wide/from16 v25, v12

    move-wide/from16 v27, v1

    invoke-static/range {v15 .. v28}, Lorg/rabochaya/projects/MapHitTest;->distance(Ljava/lang/String;Ljava/util/List;DDDIIDD)D

    move-result-wide v1

    const-string v3, "Point"

    iget-object v6, v14, Lorg/rabochaya/projects/KmlProject$Geometry;->type:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    const/4 v3, 0x2

    goto :goto_2

    :cond_8
    const-string v3, "LineString"

    iget-object v6, v14, Lorg/rabochaya/projects/KmlProject$Geometry;->type:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    const/4 v3, 0x1

    goto :goto_2

    :cond_9
    const/4 v3, 0x0

    :goto_2
    cmpg-double v6, v1, v29

    if-gtz v6, :cond_b

    if-gt v3, v5, :cond_a

    if-ne v3, v5, :cond_b

    cmpg-double v6, v1, v10

    if-gtz v6, :cond_b

    :cond_a
    move-wide v10, v1

    move v5, v3

    move-object/from16 v9, v31

    goto :goto_3

    :cond_b
    move-object/from16 v9, p1

    :goto_3
    move-wide/from16 v7, v29

    move-object/from16 v12, v31

    move-object/from16 v13, v32

    move/from16 v2, v33

    move-object/from16 v1, v34

    const/4 v3, 0x0

    const/4 v6, 0x1

    goto :goto_1

    :cond_c
    move-object/from16 v34, v1

    move/from16 v33, v2

    move-wide/from16 v29, v7

    move-object/from16 p1, v9

    const/4 v3, 0x0

    const/4 v6, 0x1

    goto/16 :goto_0

    :cond_d
    if-eqz v9, :cond_e

    iget-object v1, v0, Lorg/rabochaya/projects/LocalMapView;->listener:Lorg/rabochaya/projects/LocalMapView$Listener;

    invoke-interface {v1, v9}, Lorg/rabochaya/projects/LocalMapView$Listener;->picked(Lorg/rabochaya/projects/KmlProject$Feature;)V

    :cond_e
    :goto_4
    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapView;->settle()V

    const/4 v1, 0x1

    return v1

    .line 76
    :pswitch_6
    move/from16 v33, v2

    move v1, v6

    iput v2, v0, Lorg/rabochaya/projects/LocalMapView;->lastX:F

    iput v2, v0, Lorg/rabochaya/projects/LocalMapView;->downX:F

    iput v4, v0, Lorg/rabochaya/projects/LocalMapView;->lastY:F

    iput v4, v0, Lorg/rabochaya/projects/LocalMapView;->downY:F

    const/4 v2, 0x0

    iput-boolean v2, v0, Lorg/rabochaya/projects/LocalMapView;->moved:Z

    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public performClick()Z
    .locals 1

    .line 84
    invoke-super {p0}, Landroid/view/View;->performClick()Z

    const/4 v0, 0x1

    return v0
.end method

.method public restore(DDD)V
    .locals 6

    .line 21
    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p1, p2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p3, p4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p3, p4}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p5, p6}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p5, p6}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapMath;->wrap(D)D

    move-result-wide p1

    iput-wide p1, p0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    const-wide/16 v2, 0x0

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    move-wide v0, p3

    invoke-static/range {v0 .. v5}, Lorg/rabochaya/projects/MapMath;->clamp(DDD)D

    move-result-wide p1

    iput-wide p1, p0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    const-wide/high16 v4, 0x4037000000000000L    # 23.0

    move-wide v0, p5

    invoke-static/range {v0 .. v5}, Lorg/rabochaya/projects/MapMath;->clamp(DDD)D

    move-result-wide p1

    iput-wide p1, p0, Lorg/rabochaya/projects/LocalMapView;->zoom:D

    const/4 p1, 0x1

    iput-boolean p1, p0, Lorg/rabochaya/projects/LocalMapView;->restored:Z

    iput-boolean p1, p0, Lorg/rabochaya/projects/LocalMapView;->fitted:Z

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapView;->changed()V

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapView;->settle()V

    :cond_1
    :goto_0
    return-void
.end method

.method public step(D)V
    .locals 3

    .line 26
    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v1

    invoke-direct {p0, p1, p2, v0, v2}, Lorg/rabochaya/projects/LocalMapView;->zoomAt(DFF)V

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapView;->settle()V

    return-void
.end method

.method public suspend(Z)V
    .locals 3

    .line 86
    iput-boolean p1, p0, Lorg/rabochaya/projects/LocalMapView;->paused:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapView;->online:[Lorg/rabochaya/projects/OnlineTiles;

    if-eqz p1, :cond_1

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    invoke-virtual {v2}, Lorg/rabochaya/projects/OnlineTiles;->interrupt()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapView;->missing:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->invalidate()V

    :cond_1
    return-void
.end method

.method public undoDrawing()V
    .locals 2

    .line 36
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView;->listener:Lorg/rabochaya/projects/LocalMapView$Listener;

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView;->draft:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-interface {v0, v1}, Lorg/rabochaya/projects/LocalMapView$Listener;->draftChanged(I)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapView;->invalidate()V

    :cond_0
    return-void
.end method

.method public viewport()[D
    .locals 8

    .line 22
    iget-wide v0, p0, Lorg/rabochaya/projects/LocalMapView;->cx:D

    iget-wide v2, p0, Lorg/rabochaya/projects/LocalMapView;->cy:D

    iget-wide v4, p0, Lorg/rabochaya/projects/LocalMapView;->zoom:D

    const/4 v6, 0x3

    new-array v6, v6, [D

    const/4 v7, 0x0

    aput-wide v0, v6, v7

    const/4 v0, 0x1

    aput-wide v2, v6, v0

    const/4 v0, 0x2

    aput-wide v4, v6, v0

    return-object v6
.end method
