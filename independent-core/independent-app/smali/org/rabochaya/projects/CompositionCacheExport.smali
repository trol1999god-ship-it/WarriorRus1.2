.class public final Lorg/rabochaya/projects/CompositionCacheExport;
.super Ljava/lang/Object;
.source "CompositionCacheExport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/CompositionCacheExport$Group;
    }
.end annotation


# static fields
.field private static final MAX_BYTES:J = 0x20000000L


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/util/TreeMap;III)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 4
    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/CompositionCacheExport;->add(Ljava/util/TreeMap;III)V

    return-void
.end method

.method private static add(Ljava/util/TreeMap;III)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/TreeMap<",
            "Ljava/lang/String;",
            "[I>;III)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    filled-new-array {p1, p2, p3}, [I

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/util/TreeMap;->size()I

    move-result p0

    const/16 p1, 0x4e20

    if-gt p0, p1, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u042d\u043a\u0441\u043f\u043e\u0440\u0442 \u043e\u0433\u0440\u0430\u043d\u0438\u0447\u0435\u043d 20 000 \u0432\u044b\u0445\u043e\u0434\u043d\u044b\u0445 \u0442\u0430\u0439\u043b\u043e\u0432"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static synthetic lambda$write$0(Landroid/content/Context;Lorg/rabochaya/projects/MapComposition;Lorg/rabochaya/projects/CacheExport$Progress;Ljava/io/File;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    invoke-static {p0, p1, p3, p2}, Lorg/rabochaya/projects/CompositionCacheExport;->prepared(Landroid/content/Context;Lorg/rabochaya/projects/MapComposition;Ljava/io/File;Lorg/rabochaya/projects/CacheExport$Progress;)I

    move-result p0

    return p0
.end method

.method private static meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 15
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "name"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "value"

    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "metadata"

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    return-void
.end method

.method private static prepared(Landroid/content/Context;Lorg/rabochaya/projects/MapComposition;Ljava/io/File;Lorg/rabochaya/projects/CacheExport$Progress;)I
    .locals 30
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 17
    move-object/from16 v0, p1

    move-object/from16 v1, p3

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    :try_start_0
    new-instance v4, Ljava/util/TreeMap;

    invoke-direct {v4}, Ljava/util/TreeMap;-><init>()V

    iget-object v5, v0, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_c

    if-eqz v6, :cond_1

    :try_start_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/rabochaya/projects/MapComposition$Layer;

    iget-boolean v7, v6, Lorg/rabochaya/projects/MapComposition$Layer;->visible:Z

    if-eqz v7, :cond_0

    iget v7, v6, Lorg/rabochaya/projects/MapComposition$Layer;->opacity:I

    if-lez v7, :cond_0

    new-instance v7, Lorg/rabochaya/projects/CompositionCacheExport$Group;

    iget-wide v8, v0, Lorg/rabochaya/projects/MapComposition;->project:J

    move-object/from16 v10, p0

    invoke-direct {v7, v10, v8, v9, v6}, Lorg/rabochaya/projects/CompositionCacheExport$Group;-><init>(Landroid/content/Context;JLorg/rabochaya/projects/MapComposition$Layer;)V

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v7, v4}, Lorg/rabochaya/projects/CompositionCacheExport$Group;->keys(Ljava/util/TreeMap;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :cond_0
    move-object/from16 v10, p0

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object v6, v2

    goto/16 :goto_10

    :catch_0
    move-exception v0

    move-object v6, v2

    goto/16 :goto_f

    :cond_1
    :try_start_2
    invoke-virtual {v4}, Ljava/util/TreeMap;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_f

    invoke-virtual {v4}, Ljava/util/TreeMap;->size()I

    move-result v5

    const/4 v6, 0x0

    invoke-interface {v1, v6, v5}, Lorg/rabochaya/projects/CacheExport$Progress;->update(II)V

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->exists()Z

    move-result v5
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_c

    if-eqz v5, :cond_3

    :try_start_3
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->delete()Z

    move-result v5

    if-eqz v5, :cond_2

    goto :goto_1

    :cond_2
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u0438\u0442\u044c \u0432\u0440\u0435\u043c\u0435\u043d\u043d\u044b\u0439 \u044d\u043a\u0441\u043f\u043e\u0440\u0442"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_3
    :goto_1
    move-object/from16 v5, p2

    :try_start_4
    invoke-static {v5, v3}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/io/File;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v7
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_c

    :try_start_5
    const-string v8, "CREATE TABLE metadata(name TEXT PRIMARY KEY,value TEXT)"

    invoke-virtual {v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v8, "CREATE TABLE tiles(zoom_level INTEGER NOT NULL,tile_column INTEGER NOT NULL,tile_row INTEGER NOT NULL,tile_data BLOB NOT NULL,PRIMARY KEY(zoom_level,tile_column,tile_row))"

    invoke-virtual {v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v8, "name"

    const-string v9, "\u041a\u043e\u043c\u043f\u043e\u0437\u0438\u0446\u0438\u044f \u0441\u043b\u043e\u0451\u0432"

    invoke-static {v7, v8, v9}, Lorg/rabochaya/projects/CompositionCacheExport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v8, "attribution"

    invoke-virtual/range {p1 .. p1}, Lorg/rabochaya/projects/MapComposition;->attributions()Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v8, v0}, Lorg/rabochaya/projects/CompositionCacheExport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "format"

    const-string v8, "png"

    invoke-static {v7, v0, v8}, Lorg/rabochaya/projects/CompositionCacheExport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "type"

    const-string v8, "baselayer"

    invoke-static {v7, v0, v8}, Lorg/rabochaya/projects/CompositionCacheExport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "version"

    const-string v8, "1.3"

    invoke-static {v7, v0, v8}, Lorg/rabochaya/projects/CompositionCacheExport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "scheme"

    const-string v8, "tms"

    invoke-static {v7, v0, v8}, Lorg/rabochaya/projects/CompositionCacheExport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x4

    new-array v8, v0, [D

    fill-array-data v8, :array_0

    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_a

    :try_start_6
    new-instance v9, Landroid/graphics/Paint;

    const/4 v10, 0x2

    invoke-direct {v9, v10}, Landroid/graphics/Paint;-><init>(I)V

    invoke-virtual {v4}, Ljava/util/TreeMap;->values()Ljava/util/Collection;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v11

    const/16 v12, 0x18

    const/4 v13, -0x1

    const-wide/16 v14, 0x0

    move v0, v6

    move/from16 v16, v0

    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    const/16 v18, 0x3

    const/16 v19, 0x1

    if-eqz v17, :cond_c

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, [I

    invoke-virtual {v4}, Ljava/util/TreeMap;->size()I

    move-result v3

    invoke-interface {v1, v0, v3}, Lorg/rabochaya/projects/CacheExport$Progress;->update(II)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_8

    :try_start_7
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_6

    const/16 v20, 0x0

    :goto_3
    :try_start_8
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v21
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    if-eqz v21, :cond_6

    :try_start_9
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    move-object/from16 v10, v21

    check-cast v10, Lorg/rabochaya/projects/CompositionCacheExport$Group;

    move-object/from16 v21, v3

    aget v3, v17, v6

    aget v6, v17, v19

    const/16 v22, 0x2

    aget v5, v17, v22

    invoke-virtual {v10, v3, v6, v5}, Lorg/rabochaya/projects/CompositionCacheExport$Group;->render(III)Landroid/graphics/Bitmap;

    move-result-object v3
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    if-nez v3, :cond_4

    move-object/from16 v5, p2

    move-object/from16 v3, v21

    const/4 v6, 0x0

    const/4 v10, 0x2

    goto :goto_3

    :cond_4
    move-object/from16 v5, v20

    if-nez v5, :cond_5

    :try_start_a
    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move-object/from16 v20, v11

    const/16 v11, 0x100

    invoke-static {v11, v11, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v5

    goto :goto_4

    :cond_5
    move-object/from16 v20, v11

    :goto_4
    iget-object v6, v10, Lorg/rabochaya/projects/CompositionCacheExport$Group;->model:Lorg/rabochaya/projects/MapComposition$Layer;

    iget v6, v6, Lorg/rabochaya/projects/MapComposition$Layer;->opacity:I

    int-to-float v6, v6

    const/high16 v10, 0x437f0000    # 255.0f

    mul-float/2addr v6, v10

    const/high16 v10, 0x42c80000    # 100.0f

    div-float/2addr v6, v10

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    invoke-virtual {v9, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    new-instance v6, Landroid/graphics/Canvas;

    invoke-direct {v6, v5}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/4 v10, 0x0

    invoke-virtual {v6, v3, v10, v10, v9}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    :try_start_b
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->recycle()V

    move-object/from16 v11, v20

    move-object/from16 v3, v21

    const/4 v6, 0x0

    const/4 v10, 0x2

    move-object/from16 v20, v5

    move-object/from16 v5, p2

    goto :goto_3

    :catchall_1
    move-exception v0

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->recycle()V

    throw v0

    :catchall_2
    move-exception v0

    move-object/from16 v5, v20

    :goto_5
    move-object v6, v2

    goto/16 :goto_8

    :cond_6
    move-object/from16 v5, v20

    move-object/from16 v20, v11

    if-eqz v5, :cond_9

    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    sget-object v6, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v10, 0x64

    invoke-virtual {v5, v6, v10, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v6

    if-eqz v6, :cond_8

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    array-length v6, v3

    int-to-long v10, v6

    add-long/2addr v14, v10

    const-wide/32 v10, 0x20000000

    cmp-long v6, v14, v10

    if-gtz v6, :cond_7

    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    const-string v10, "zoom_level"

    const/4 v11, 0x0

    aget v21, v17, v11

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v10, "tile_column"

    aget v11, v17, v19

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v10, "tile_row"

    move-object/from16 v21, v9

    const/4 v11, 0x0

    aget v9, v17, v11

    move-wide/from16 v22, v14

    const/4 v11, 0x2

    aget v14, v17, v11

    int-to-long v14, v14

    invoke-static {v9, v14, v15}, Lorg/rabochaya/projects/MapMath;->tmsRow(IJ)J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v6, v10, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v9, "tile_data"

    invoke-virtual {v6, v9, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v3, "tiles"

    const/4 v9, 0x0

    invoke-virtual {v7, v3, v9, v6}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    add-int/lit8 v16, v16, 0x1

    const/4 v3, 0x0

    aget v6, v17, v3

    shl-int v6, v19, v6

    int-to-double v10, v6

    aget-wide v14, v8, v3

    aget v3, v17, v19
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    move-object v6, v2

    int-to-double v2, v3

    div-double/2addr v2, v10

    const-wide v24, 0x4076800000000000L    # 360.0

    mul-double v2, v2, v24

    const-wide v26, 0x4066800000000000L    # 180.0

    sub-double v2, v2, v26

    :try_start_c
    invoke-static {v14, v15, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    const/4 v14, 0x0

    aput-wide v2, v8, v14

    aget-wide v2, v8, v19

    const/4 v14, 0x2

    aget v15, v17, v14

    int-to-double v14, v15

    const-wide/high16 v28, 0x3ff0000000000000L    # 1.0

    add-double v14, v14, v28

    div-double/2addr v14, v10

    invoke-static {v14, v15}, Lorg/rabochaya/projects/MapMath;->lat(D)D

    move-result-wide v14

    invoke-static {v2, v3, v14, v15}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    aput-wide v2, v8, v19

    const/4 v2, 0x2

    aget-wide v14, v8, v2

    aget v2, v17, v19

    int-to-double v2, v2

    add-double v2, v2, v28

    div-double/2addr v2, v10

    mul-double v2, v2, v24

    sub-double v2, v2, v26

    invoke-static {v14, v15, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    const/4 v14, 0x2

    aput-wide v2, v8, v14

    aget-wide v2, v8, v18

    aget v15, v17, v14

    int-to-double v14, v15

    div-double/2addr v14, v10

    invoke-static {v14, v15}, Lorg/rabochaya/projects/MapMath;->lat(D)D

    move-result-wide v10

    invoke-static {v2, v3, v10, v11}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    aput-wide v2, v8, v18

    const/4 v2, 0x0

    aget v3, v17, v2

    invoke-static {v12, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    aget v10, v17, v2

    invoke-static {v13, v10}, Ljava/lang/Math;->max(II)I

    move-result v2

    move v13, v2

    move v12, v3

    move-wide/from16 v14, v22

    goto :goto_7

    :cond_7
    move-object v6, v2

    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u042d\u043a\u0441\u043f\u043e\u0440\u0442 \u0431\u043e\u043b\u044c\u0448\u0435 512 \u041c\u0438\u0411"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_6
    throw v0

    :cond_8
    move-object v6, v2

    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0441\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c \u0438\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u0442\u0430\u0439\u043b\u0430"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    goto :goto_6

    :catchall_3
    move-exception v0

    goto :goto_8

    :catchall_4
    move-exception v0

    goto/16 :goto_5

    :cond_9
    move-object v6, v2

    move-object/from16 v21, v9

    const/4 v9, 0x0

    :goto_7
    if-eqz v5, :cond_a

    :try_start_d
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->recycle()V

    :cond_a
    add-int/lit8 v0, v0, 0x1

    move-object/from16 v5, p2

    move-object v2, v6

    move-object v3, v9

    move-object/from16 v11, v20

    move-object/from16 v9, v21

    const/4 v6, 0x0

    const/4 v10, 0x2

    goto/16 :goto_2

    :catchall_5
    move-exception v0

    move-object v6, v2

    move-object/from16 v5, v20

    :goto_8
    move-object v3, v5

    goto :goto_9

    :catchall_6
    move-exception v0

    move-object v6, v2

    const/4 v9, 0x0

    move-object v3, v9

    :goto_9
    if-eqz v3, :cond_b

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->recycle()V

    :cond_b
    :goto_a
    throw v0

    :cond_c
    move-object v6, v2

    move-object v9, v3

    if-eqz v16, :cond_e

    const-string v0, "bounds"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%.9f,%.9f,%.9f,%.9f"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v10, 0x0

    aget-wide v14, v8, v10

    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v11

    aput-object v11, v5, v10

    aget-wide v10, v8, v19

    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v10

    aput-object v10, v5, v19

    const/4 v10, 0x2

    aget-wide v14, v8, v10

    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v11

    aput-object v11, v5, v10

    aget-wide v10, v8, v18

    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    aput-object v8, v5, v18

    invoke-static {v2, v3, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v7, v0, v2}, Lorg/rabochaya/projects/CompositionCacheExport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "minzoom"

    invoke-static {v12}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v7, v0, v2}, Lorg/rabochaya/projects/CompositionCacheExport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "maxzoom"

    invoke-static {v13}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v7, v0, v2}, Lorg/rabochaya/projects/CompositionCacheExport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_7

    :try_start_e
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_1
    .catchall {:try_start_e .. :try_end_e} :catchall_9

    :try_start_f
    invoke-virtual {v4}, Ljava/util/TreeMap;->size()I

    move-result v0

    invoke-virtual {v4}, Ljava/util/TreeMap;->size()I

    move-result v2

    invoke-interface {v1, v0, v2}, Lorg/rabochaya/projects/CacheExport$Progress;->update(II)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_3
    .catchall {:try_start_f .. :try_end_f} :catchall_b

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/CompositionCacheExport$Group;

    invoke-virtual {v1}, Lorg/rabochaya/projects/CompositionCacheExport$Group;->close()V

    goto :goto_b

    :cond_d
    return v16

    :catchall_7
    move-exception v0

    goto :goto_c

    :cond_e
    :try_start_10
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435\u0442 \u0447\u0438\u0442\u0430\u0435\u043c\u044b\u0445 \u0440\u0430\u0441\u0442\u0440\u043e\u0432\u044b\u0445 \u0442\u0430\u0439\u043b\u043e\u0432"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_7

    goto :goto_a

    :catchall_8
    move-exception v0

    move-object v6, v2

    :goto_c
    :try_start_11
    invoke-virtual {v7}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_1
    .catchall {:try_start_11 .. :try_end_11} :catchall_9

    :catchall_9
    move-exception v0

    goto :goto_d

    :catch_1
    move-exception v0

    goto :goto_e

    :catchall_a
    move-exception v0

    move-object v6, v2

    :goto_d
    move-object v3, v7

    goto :goto_10

    :catch_2
    move-exception v0

    move-object v6, v2

    :goto_e
    move-object v3, v7

    goto :goto_f

    :cond_f
    move-object v6, v2

    move-object v9, v3

    :try_start_12
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0412 \u0432\u0438\u0434\u0438\u043c\u044b\u0445 \u0441\u043b\u043e\u044f\u0445 \u043d\u0435\u0442 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u0445 \u0442\u0430\u0439\u043b\u043e\u0432"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_3
    .catchall {:try_start_12 .. :try_end_12} :catchall_b

    :catchall_b
    move-exception v0

    move-object v3, v9

    goto :goto_10

    :catch_3
    move-exception v0

    move-object v3, v9

    goto :goto_f

    :catchall_c
    move-exception v0

    move-object v6, v2

    move-object v9, v3

    goto :goto_10

    :catch_4
    move-exception v0

    move-object v6, v2

    move-object v9, v3

    :goto_f
    :try_start_13
    instance-of v1, v0, Ljava/io/IOException;

    if-eqz v1, :cond_10

    check-cast v0, Ljava/io/IOException;

    throw v0

    :cond_10
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u044d\u043a\u0441\u043f\u043e\u0440\u0442\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u0441\u043e\u0441\u0442\u0430\u0432 \u043a\u0430\u0440\u0442: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_d

    :catchall_d
    move-exception v0

    :goto_10
    if-eqz v3, :cond_11

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    :cond_11
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_12

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/CompositionCacheExport$Group;

    invoke-virtual {v2}, Lorg/rabochaya/projects/CompositionCacheExport$Group;->close()V

    goto :goto_11

    :cond_12
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->delete()Z

    throw v0

    :array_0
    .array-data 8
        0x4066800000000000L    # 180.0
        0x4056800000000000L    # 90.0
        -0x3f99800000000000L    # -180.0
        -0x3fa9800000000000L    # -90.0
    .end array-data
.end method

.method public static write(Landroid/content/Context;Lorg/rabochaya/projects/MapComposition;Ljava/io/File;Lorg/rabochaya/projects/CacheExport$Progress;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    if-eqz p1, :cond_0

    new-instance v0, Lorg/rabochaya/projects/CompositionCacheExport$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1, p3}, Lorg/rabochaya/projects/CompositionCacheExport$$ExternalSyntheticLambda0;-><init>(Landroid/content/Context;Lorg/rabochaya/projects/MapComposition;Lorg/rabochaya/projects/CacheExport$Progress;)V

    invoke-static {p2, v0}, Lorg/rabochaya/projects/RasterExportFile;->replace(Ljava/io/File;Lorg/rabochaya/projects/RasterExportFile$Writer;)I

    move-result p0

    return p0

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u041d\u0443\u0436\u0435\u043d \u0441\u043e\u0441\u0442\u0430\u0432 \u043a\u0430\u0440\u0442"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
