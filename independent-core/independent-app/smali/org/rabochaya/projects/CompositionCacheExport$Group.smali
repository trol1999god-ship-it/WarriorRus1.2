.class final Lorg/rabochaya/projects/CompositionCacheExport$Group;
.super Ljava/lang/Object;
.source "CompositionCacheExport.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/CompositionCacheExport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Group"
.end annotation


# instance fields
.field bundled:Lorg/rabochaya/projects/BundledTiles;

.field local:Lorg/rabochaya/projects/OfflineTiles;

.field final model:Lorg/rabochaya/projects/MapComposition$Layer;

.field readers:[Lorg/rabochaya/projects/OnlineTiles;

.field sources:[Lorg/rabochaya/projects/TileSource;


# direct methods
.method constructor <init>(Landroid/content/Context;JLorg/rabochaya/projects/MapComposition$Layer;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p4, p0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->model:Lorg/rabochaya/projects/MapComposition$Layer;

    :try_start_0
    const-string v0, "local"

    iget-object v1, p4, Lorg/rabochaya/projects/MapComposition$Layer;->kind:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lorg/rabochaya/projects/OfflineTiles;

    new-instance v1, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "local_basemap_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, ".mbtiles"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v1, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/rabochaya/projects/OfflineTiles;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->local:Lorg/rabochaya/projects/OfflineTiles;

    goto :goto_1

    :cond_0
    const-string p2, "bundled"

    iget-object p3, p4, Lorg/rabochaya/projects/MapComposition$Layer;->kind:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    new-instance p2, Lorg/rabochaya/projects/BundledTiles;

    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/rabochaya/projects/BundledTiles;-><init>(Landroid/content/res/AssetManager;)V

    iput-object p2, p0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->bundled:Lorg/rabochaya/projects/BundledTiles;

    goto :goto_1

    :cond_1
    invoke-virtual {p4}, Lorg/rabochaya/projects/MapComposition$Layer;->source()Lorg/rabochaya/projects/TileSource;

    move-result-object p2

    if-eqz p2, :cond_3

    invoke-virtual {p2}, Lorg/rabochaya/projects/TileSource;->leafs()[Lorg/rabochaya/projects/TileSource;

    move-result-object p2

    iput-object p2, p0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->sources:[Lorg/rabochaya/projects/TileSource;

    iget-object p2, p0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->sources:[Lorg/rabochaya/projects/TileSource;

    array-length p2, p2

    new-array p2, p2, [Lorg/rabochaya/projects/OnlineTiles;

    iput-object p2, p0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->readers:[Lorg/rabochaya/projects/OnlineTiles;

    const/4 p2, 0x0

    :goto_0
    iget-object p3, p0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->sources:[Lorg/rabochaya/projects/TileSource;

    array-length p3, p3

    if-ge p2, p3, :cond_2

    iget-object p3, p0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->readers:[Lorg/rabochaya/projects/OnlineTiles;

    new-instance v0, Lorg/rabochaya/projects/OnlineTiles;

    iget-object v1, p0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->sources:[Lorg/rabochaya/projects/TileSource;

    aget-object v1, v1, p2

    invoke-direct {v0, p1, v1}, Lorg/rabochaya/projects/OnlineTiles;-><init>(Landroid/content/Context;Lorg/rabochaya/projects/TileSource;)V

    aput-object v0, p3, p2

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return-void

    :cond_3
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "\u0418\u0441\u0442\u043e\u0447\u043d\u0438\u043a \u043e\u0442\u0441\u0443\u0442\u0441\u0442\u0432\u0443\u0435\u0442 \u0432 \u043a\u0430\u0442\u0430\u043b\u043e\u0433\u0435: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object p3, p4, Lorg/rabochaya/projects/MapComposition$Layer;->name:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    invoke-virtual {p0}, Lorg/rabochaya/projects/CompositionCacheExport$Group;->close()V

    instance-of p2, p1, Ljava/io/IOException;

    if-eqz p2, :cond_4

    check-cast p1, Ljava/io/IOException;

    throw p1

    :cond_4
    new-instance p2, Ljava/io/IOException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043e\u0442\u043a\u0440\u044b\u0442\u044c \u0441\u043b\u043e\u0439: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    iget-object p4, p4, Lorg/rabochaya/projects/MapComposition$Layer;->name:Ljava/lang/String;

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p2, p3, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method


# virtual methods
.method public close()V
    .locals 4

    .line 10
    iget-object v0, p0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->local:Lorg/rabochaya/projects/OfflineTiles;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->local:Lorg/rabochaya/projects/OfflineTiles;

    invoke-virtual {v0}, Lorg/rabochaya/projects/OfflineTiles;->close()V

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->readers:[Lorg/rabochaya/projects/OnlineTiles;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->readers:[Lorg/rabochaya/projects/OnlineTiles;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, v0, v2

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lorg/rabochaya/projects/OnlineTiles;->close()V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method keys(Ljava/util/TreeMap;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/TreeMap<",
            "Ljava/lang/String;",
            "[I>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 11
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->readers:[Lorg/rabochaya/projects/OnlineTiles;

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v2, :cond_3

    move v2, v4

    :goto_0
    iget-object v6, v0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->readers:[Lorg/rabochaya/projects/OnlineTiles;

    array-length v6, v6

    if-ge v2, v6, :cond_7

    iget-object v6, v0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->readers:[Lorg/rabochaya/projects/OnlineTiles;

    aget-object v6, v6, v2

    invoke-virtual {v6}, Lorg/rabochaya/projects/OnlineTiles;->keys()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [I

    aget v8, v7, v4

    shl-int v9, v5, v8

    aget v10, v7, v3

    iget-object v11, v0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->sources:[Lorg/rabochaya/projects/TileSource;

    aget-object v11, v11, v2

    iget-boolean v11, v11, Lorg/rabochaya/projects/TileSource;->ellipsoid:Z

    if-eqz v11, :cond_0

    aget v10, v7, v3

    int-to-double v10, v10

    int-to-double v12, v9

    div-double/2addr v10, v12

    invoke-static {v10, v11, v5}, Lorg/rabochaya/projects/TileProjection;->latitude(DZ)D

    move-result-wide v10

    invoke-static {v10, v11}, Lorg/rabochaya/projects/MapMath;->y(D)D

    move-result-wide v10

    mul-double/2addr v10, v12

    const-wide v14, 0x3e112e0be826d695L    # 1.0E-9

    add-double/2addr v10, v14

    invoke-static {v10, v11}, Ljava/lang/Math;->floor(D)D

    move-result-wide v10

    double-to-int v10, v10

    invoke-static {v4, v10}, Ljava/lang/Math;->max(II)I

    move-result v10

    sub-int/2addr v9, v5

    aget v11, v7, v3

    int-to-double v3, v11

    const-wide/high16 v16, 0x3ff0000000000000L    # 1.0

    add-double v3, v3, v16

    div-double/2addr v3, v12

    invoke-static {v3, v4, v5}, Lorg/rabochaya/projects/TileProjection;->latitude(DZ)D

    move-result-wide v3

    invoke-static {v3, v4}, Lorg/rabochaya/projects/MapMath;->y(D)D

    move-result-wide v3

    mul-double/2addr v3, v12

    sub-double/2addr v3, v14

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v3, v3

    sub-int/2addr v3, v5

    invoke-static {v9, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    goto :goto_2

    :cond_0
    move v3, v10

    :goto_2
    if-gt v10, v3, :cond_1

    aget v4, v7, v5

    invoke-static {v1, v8, v4, v10}, Lorg/rabochaya/projects/CompositionCacheExport;->access$000(Ljava/util/TreeMap;III)V

    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    :cond_1
    const/4 v3, 0x2

    const/4 v4, 0x0

    goto :goto_1

    :cond_2
    add-int/lit8 v2, v2, 0x1

    const/4 v3, 0x2

    const/4 v4, 0x0

    goto :goto_0

    :cond_3
    iget-object v2, v0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->local:Lorg/rabochaya/projects/OfflineTiles;

    if-eqz v2, :cond_4

    iget-object v2, v0, Lorg/rabochaya/projects/CompositionCacheExport$Group;->local:Lorg/rabochaya/projects/OfflineTiles;

    invoke-virtual {v2}, Lorg/rabochaya/projects/OfflineTiles;->keys()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [I

    const/4 v4, 0x0

    aget v6, v3, v4

    aget v7, v3, v5

    const/4 v8, 0x2

    aget v3, v3, v8

    invoke-static {v1, v6, v7, v3}, Lorg/rabochaya/projects/CompositionCacheExport;->access$000(Ljava/util/TreeMap;III)V

    goto :goto_3

    :cond_4
    const/4 v4, 0x0

    move v2, v5

    :goto_4
    const/4 v3, 0x3

    if-gt v2, v3, :cond_7

    move v3, v4

    :goto_5
    shl-int v6, v5, v2

    if-ge v3, v6, :cond_6

    move v7, v4

    :goto_6
    if-ge v7, v6, :cond_5

    invoke-static {v1, v2, v3, v7}, Lorg/rabochaya/projects/CompositionCacheExport;->access$000(Ljava/util/TreeMap;III)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_6

    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_7
    return-void
.end method

.method render(III)Landroid/graphics/Bitmap;
    .locals 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 12
    move-object/from16 v1, p0

    move/from16 v0, p1

    move/from16 v2, p2

    move/from16 v3, p3

    iget-object v4, v1, Lorg/rabochaya/projects/CompositionCacheExport$Group;->readers:[Lorg/rabochaya/projects/OnlineTiles;

    if-eqz v4, :cond_0

    iget-object v4, v1, Lorg/rabochaya/projects/CompositionCacheExport$Group;->readers:[Lorg/rabochaya/projects/OnlineTiles;

    iget-object v5, v1, Lorg/rabochaya/projects/CompositionCacheExport$Group;->sources:[Lorg/rabochaya/projects/TileSource;

    invoke-static {v4, v5, v0, v2, v3}, Lorg/rabochaya/projects/CacheExport;->render([Lorg/rabochaya/projects/OnlineTiles;[Lorg/rabochaya/projects/TileSource;III)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v4, v1, Lorg/rabochaya/projects/CompositionCacheExport$Group;->local:Lorg/rabochaya/projects/OfflineTiles;

    if-eqz v4, :cond_1

    iget-object v4, v1, Lorg/rabochaya/projects/CompositionCacheExport$Group;->local:Lorg/rabochaya/projects/OfflineTiles;

    invoke-virtual {v4, v0}, Lorg/rabochaya/projects/OfflineTiles;->zoomFor(I)I

    move-result v4

    goto :goto_0

    :cond_1
    iget-object v4, v1, Lorg/rabochaya/projects/CompositionCacheExport$Group;->bundled:Lorg/rabochaya/projects/BundledTiles;

    invoke-virtual {v4, v0}, Lorg/rabochaya/projects/BundledTiles;->zoomFor(I)I

    move-result v4

    :goto_0
    const/4 v5, 0x1

    shl-int v6, v5, v4

    shl-int v0, v5, v0

    int-to-double v7, v2

    int-to-double v9, v0

    div-double v11, v7, v9

    int-to-double v2, v3

    div-double v13, v2, v9

    const-wide/high16 v15, 0x3ff0000000000000L    # 1.0

    add-double/2addr v7, v15

    div-double/2addr v7, v9

    add-double/2addr v2, v15

    div-double/2addr v2, v9

    move-wide v15, v9

    int-to-double v9, v6

    mul-double v17, v11, v9

    move/from16 v19, v6

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->floor(D)D

    move-result-wide v5

    double-to-int v5, v5

    const/4 v6, 0x0

    invoke-static {v6, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    const/4 v0, 0x1

    add-int/lit8 v6, v19, -0x1

    mul-double/2addr v7, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v7

    double-to-int v7, v7

    sub-int/2addr v7, v0

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    mul-double v17, v13, v9

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    mul-double/2addr v2, v9

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-static {v6, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    sub-int v3, v7, v5

    add-int/2addr v3, v2

    move/from16 p1, v5

    int-to-long v5, v3

    sub-int v3, v1, v0

    add-int/2addr v3, v2

    int-to-long v2, v3

    mul-long/2addr v5, v2

    const-wide/16 v2, 0x20

    cmp-long v2, v5, v2

    if-gtz v2, :cond_8

    :try_start_0
    new-instance v3, Landroid/graphics/Paint;

    const/4 v5, 0x2

    invoke-direct {v3, v5}, Landroid/graphics/Paint;-><init>(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_4

    const/4 v5, 0x0

    :goto_1
    if-gt v0, v1, :cond_6

    move/from16 v6, p1

    :goto_2
    if-gt v6, v7, :cond_5

    move-object/from16 v8, p0

    :try_start_1
    iget-object v2, v8, Lorg/rabochaya/projects/CompositionCacheExport$Group;->local:Lorg/rabochaya/projects/OfflineTiles;

    if-eqz v2, :cond_2

    iget-object v2, v8, Lorg/rabochaya/projects/CompositionCacheExport$Group;->local:Lorg/rabochaya/projects/OfflineTiles;

    invoke-virtual {v2, v4, v6, v0}, Lorg/rabochaya/projects/OfflineTiles;->tile(III)Landroid/graphics/Bitmap;

    move-result-object v2

    goto :goto_3

    :cond_2
    iget-object v2, v8, Lorg/rabochaya/projects/CompositionCacheExport$Group;->bundled:Lorg/rabochaya/projects/BundledTiles;

    invoke-virtual {v2, v4, v6, v0}, Lorg/rabochaya/projects/BundledTiles;->tile(III)Landroid/graphics/Bitmap;

    move-result-object v2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_2

    :goto_3
    if-nez v2, :cond_3

    move/from16 p3, v1

    move/from16 v17, v4

    move/from16 v21, v7

    move-wide/from16 v19, v9

    const/4 v4, 0x0

    goto :goto_5

    :cond_3
    if-nez v5, :cond_4

    move/from16 p3, v1

    :try_start_2
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move/from16 v17, v4

    const/16 v4, 0x100

    invoke-static {v4, v4, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v5

    goto :goto_4

    :cond_4
    move/from16 p3, v1

    move/from16 v17, v4

    :goto_4
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v5}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-object/from16 v18, v5

    int-to-double v4, v6

    div-double/2addr v4, v9

    sub-double/2addr v4, v11

    mul-double/2addr v4, v15

    const-wide/high16 v19, 0x4070000000000000L    # 256.0

    mul-double v4, v4, v19

    double-to-float v4, v4

    move/from16 v21, v7

    int-to-double v7, v0

    div-double/2addr v7, v9

    sub-double/2addr v7, v13

    mul-double/2addr v7, v15

    mul-double v7, v7, v19

    double-to-float v5, v7

    div-double v7, v15, v9

    mul-double v7, v7, v19

    double-to-float v7, v7

    :try_start_3
    new-instance v8, Landroid/graphics/RectF;

    move-wide/from16 v19, v9

    add-float v9, v4, v7

    add-float/2addr v7, v5

    invoke-direct {v8, v4, v5, v9, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v8, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    move-object/from16 v5, v18

    :goto_5
    add-int/lit8 v6, v6, 0x1

    move/from16 v1, p3

    move/from16 v4, v17

    move-wide/from16 v9, v19

    move/from16 v7, v21

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_6

    :catchall_1
    move-exception v0

    move-object/from16 v18, v5

    :goto_6
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    throw v0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception v0

    goto :goto_7

    :catch_1
    move-exception v0

    :goto_7
    move-object/from16 v2, v18

    goto :goto_a

    :catch_2
    move-exception v0

    goto :goto_8

    :catch_3
    move-exception v0

    :goto_8
    move-object v2, v5

    goto :goto_a

    :cond_5
    move/from16 p3, v1

    move/from16 v17, v4

    move/from16 v21, v7

    move-wide/from16 v19, v9

    const/4 v4, 0x0

    add-int/lit8 v0, v0, 0x1

    move/from16 v4, v17

    goto/16 :goto_1

    :cond_6
    return-object v5

    :catch_4
    move-exception v0

    goto :goto_9

    :catch_5
    move-exception v0

    :goto_9
    const/4 v4, 0x0

    move-object v2, v4

    :goto_a
    if-eqz v2, :cond_7

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    :cond_7
    throw v0

    :cond_8
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0414\u043b\u044f \u044d\u0442\u043e\u0433\u043e \u0441\u043e\u0447\u0435\u0442\u0430\u043d\u0438\u044f \u0443\u0440\u043e\u0432\u043d\u0435\u0439 \u043d\u0443\u0436\u043d\u043e \u0431\u043e\u043b\u044c\u0448\u0435 32 \u0438\u0441\u0445\u043e\u0434\u043d\u044b\u0445 \u0442\u0430\u0439\u043b\u043e\u0432 \u043d\u0430 \u0432\u044b\u0445\u043e\u0434\u043d\u043e\u0439 \u0442\u0430\u0439\u043b"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
