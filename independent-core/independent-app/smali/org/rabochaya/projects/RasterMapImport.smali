.class public final Lorg/rabochaya/projects/RasterMapImport;
.super Ljava/lang/Object;
.source "RasterMapImport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/RasterMapImport$Source;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static first(DI)I
    .locals 3

    .line 24
    add-int/lit8 v0, p2, -0x1

    int-to-double v1, p2

    mul-double/2addr p0, v1

    invoke-static {p0, p1}, Ljava/lang/Math;->floor(D)D

    move-result-wide p0

    double-to-int p0, p0

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 p1, 0x0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method static synthetic lambda$write$0(Lorg/rabochaya/projects/RasterMapImport$Source;Lorg/rabochaya/projects/CacheExport$Progress;Ljava/lang/String;ZLjava/io/File;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 7
    invoke-static {p0, p4, p1, p2, p3}, Lorg/rabochaya/projects/RasterMapImport;->prepared(Lorg/rabochaya/projects/RasterMapImport$Source;Ljava/io/File;Lorg/rabochaya/projects/CacheExport$Progress;Ljava/lang/String;Z)I

    move-result p0

    return p0
.end method

.method private static last(DI)I
    .locals 3

    .line 25
    add-int/lit8 v0, p2, -0x1

    int-to-double v1, p2

    mul-double/2addr p0, v1

    invoke-static {p0, p1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide p0

    double-to-int p0, p0

    add-int/lit8 p0, p0, -0x1

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 p1, 0x0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method private static meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 8
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

.method private static prepared(Lorg/rabochaya/projects/RasterMapImport$Source;Ljava/io/File;Lorg/rabochaya/projects/CacheExport$Progress;Ljava/lang/String;Z)I
    .locals 35
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    move-object/from16 v0, p2

    invoke-interface/range {p0 .. p0}, Lorg/rabochaya/projects/RasterMapImport$Source;->transform()Lorg/rabochaya/projects/GeoRasterTransform;

    move-result-object v1

    iget-wide v2, v1, Lorg/rabochaya/projects/GeoRasterTransform;->south:D

    const-wide v4, -0x3faabcba4e5a8100L    # -85.05112878

    cmpg-double v2, v2, v4

    if-ltz v2, :cond_13

    iget-wide v2, v1, Lorg/rabochaya/projects/GeoRasterTransform;->north:D

    const-wide v4, 0x40554345b1a57f00L    # 85.05112878

    cmpl-double v2, v2, v4

    if-gtz v2, :cond_13

    .line 11
    iget-wide v2, v1, Lorg/rabochaya/projects/GeoRasterTransform;->west:D

    invoke-static {v2, v3}, Lorg/rabochaya/projects/MapMath;->x(D)D

    move-result-wide v2

    iget-wide v4, v1, Lorg/rabochaya/projects/GeoRasterTransform;->east:D

    invoke-static {v4, v5}, Lorg/rabochaya/projects/MapMath;->x(D)D

    move-result-wide v4

    iget-wide v6, v1, Lorg/rabochaya/projects/GeoRasterTransform;->north:D

    invoke-static {v6, v7}, Lorg/rabochaya/projects/MapMath;->y(D)D

    move-result-wide v6

    iget-wide v8, v1, Lorg/rabochaya/projects/GeoRasterTransform;->south:D

    invoke-static {v8, v9}, Lorg/rabochaya/projects/MapMath;->y(D)D

    move-result-wide v8

    .line 12
    cmpl-double v10, v4, v2

    if-lez v10, :cond_12

    cmpl-double v10, v8, v6

    if-lez v10, :cond_12

    .line 13
    iget v10, v1, Lorg/rabochaya/projects/GeoRasterTransform;->width:I

    int-to-double v10, v10

    sub-double v12, v4, v2

    div-double/2addr v10, v12

    iget v12, v1, Lorg/rabochaya/projects/GeoRasterTransform;->height:I

    int-to-double v12, v12

    sub-double v14, v8, v6

    div-double/2addr v12, v14

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->max(DD)D

    move-result-wide v10

    if-eqz p4, :cond_1

    invoke-virtual {v1}, Lorg/rabochaya/projects/GeoRasterTransform;->pixelsPerWorldUnit()D

    move-result-wide v13

    const-wide/16 v15, 0x0

    cmpl-double v15, v13, v15

    if-lez v15, :cond_0

    invoke-static {v13, v14}, Ljava/lang/Double;->isNaN(D)Z

    move-result v15

    if-nez v15, :cond_0

    invoke-static {v13, v14}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v15

    if-nez v15, :cond_0

    invoke-static {v10, v11, v13, v14}, Ljava/lang/Math;->max(DD)D

    move-result-wide v10

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435\u043f\u0440\u0435\u0434\u0441\u0442\u0430\u0432\u0438\u043c\u044b\u0439 \u0448\u0430\u0433 affine \u0440\u0430\u0441\u0442\u0440\u0430"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    const/4 v13, 0x0

    :goto_1
    const/16 v14, 0x17

    const-wide/16 v15, 0x100

    if-ge v13, v14, :cond_2

    move-object v14, v1

    shl-long v0, v15, v13

    long-to-double v0, v0

    cmpg-double v0, v0, v10

    if-gez v0, :cond_3

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v0, p2

    move-object v1, v14

    goto :goto_1

    :cond_2
    move-object v14, v1

    .line 14
    :cond_3
    shl-long v0, v15, v13

    long-to-double v0, v0

    cmpg-double v0, v0, v10

    if-ltz v0, :cond_11

    .line 15
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    const/4 v10, 0x1

    if-gt v0, v13, :cond_5

    shl-int v11, v10, v0

    invoke-static {v4, v5, v11}, Lorg/rabochaya/projects/RasterMapImport;->last(DI)I

    move-result v15

    invoke-static {v2, v3, v11}, Lorg/rabochaya/projects/RasterMapImport;->first(DI)I

    move-result v16

    sub-int v15, v15, v16

    add-int/2addr v15, v10

    move/from16 p4, v13

    int-to-long v12, v15

    invoke-static {v8, v9, v11}, Lorg/rabochaya/projects/RasterMapImport;->last(DI)I

    move-result v15

    invoke-static {v6, v7, v11}, Lorg/rabochaya/projects/RasterMapImport;->first(DI)I

    move-result v11

    sub-int/2addr v15, v11

    add-int/2addr v15, v10

    int-to-long v10, v15

    mul-long/2addr v12, v10

    rsub-int v10, v1, 0x4e20

    int-to-long v10, v10

    cmp-long v10, v12, v10

    if-gtz v10, :cond_4

    long-to-int v10, v12

    add-int/2addr v1, v10

    add-int/lit8 v0, v0, 0x1

    move/from16 v13, p4

    goto :goto_2

    :cond_4
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0418\u043c\u043f\u043e\u0440\u0442 \u043e\u0433\u0440\u0430\u043d\u0438\u0447\u0435\u043d 20 000 \u0442\u0430\u0439\u043b\u043e\u0432"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 16
    :cond_5
    move/from16 p4, v13

    move-object/from16 v0, p2

    const/4 v11, 0x0

    invoke-interface {v0, v11, v1}, Lorg/rabochaya/projects/CacheExport$Progress;->update(II)V

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_7

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->delete()Z

    move-result v11

    if-eqz v11, :cond_6

    goto :goto_3

    :cond_6
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u0438\u0442\u044c \u0432\u0440\u0435\u043c\u0435\u043d\u043d\u0443\u044e \u043a\u0430\u0440\u0442\u0443"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 17
    :cond_7
    :goto_3
    const/4 v11, 0x0

    move-object/from16 v12, p1

    :try_start_0
    invoke-static {v12, v11}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/io/File;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v12
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    :try_start_1
    const-string v13, "CREATE TABLE metadata(name TEXT PRIMARY KEY,value TEXT)"

    invoke-virtual {v12, v13}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v13, "CREATE TABLE tiles(zoom_level INTEGER NOT NULL,tile_column INTEGER NOT NULL,tile_row INTEGER NOT NULL,tile_data BLOB NOT NULL,PRIMARY KEY(zoom_level,tile_column,tile_row))"

    invoke-virtual {v12, v13}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v13, "name"

    move-object/from16 v15, p3

    invoke-static {v12, v13, v15}, Lorg/rabochaya/projects/RasterMapImport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v13, "format"

    const-string v15, "png"

    invoke-static {v12, v13, v15}, Lorg/rabochaya/projects/RasterMapImport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v13, "type"

    const-string v15, "baselayer"

    invoke-static {v12, v13, v15}, Lorg/rabochaya/projects/RasterMapImport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v13, "version"

    const-string v15, "1.3"

    invoke-static {v12, v13, v15}, Lorg/rabochaya/projects/RasterMapImport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v13, "scheme"

    const-string v15, "tms"

    invoke-static {v12, v13, v15}, Lorg/rabochaya/projects/RasterMapImport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v13, "minzoom"

    const-string v15, "0"

    invoke-static {v12, v13, v15}, Lorg/rabochaya/projects/RasterMapImport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v13, "maxzoom"

    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v15

    invoke-static {v12, v13, v15}, Lorg/rabochaya/projects/RasterMapImport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v13, "bounds"

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v11, "%.12f,%.12f,%.12f,%.12f"

    const/4 v10, 0x4

    new-array v10, v10, [Ljava/lang/Object;

    move/from16 v17, v1

    iget-wide v0, v14, Lorg/rabochaya/projects/GeoRasterTransform;->west:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    const/4 v1, 0x0

    aput-object v0, v10, v1

    move-wide/from16 v18, v2

    iget-wide v1, v14, Lorg/rabochaya/projects/GeoRasterTransform;->south:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, v10, v1

    iget-wide v0, v14, Lorg/rabochaya/projects/GeoRasterTransform;->east:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    const/4 v1, 0x2

    aput-object v0, v10, v1

    iget-wide v0, v14, Lorg/rabochaya/projects/GeoRasterTransform;->north:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    const/4 v1, 0x3

    aput-object v0, v10, v1

    invoke-static {v15, v11, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v12, v13, v0}, Lorg/rabochaya/projects/RasterMapImport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    invoke-virtual {v12}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    const/high16 v0, 0x10000

    :try_start_2
    new-array v0, v0, [I

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    const/4 v11, 0x0

    :goto_4
    move/from16 v13, p4

    if-gt v11, v13, :cond_e

    const/4 v10, 0x1

    shl-int v14, v10, v11

    invoke-static {v6, v7, v14}, Lorg/rabochaya/projects/RasterMapImport;->first(DI)I

    move-result v15

    :goto_5
    invoke-static {v8, v9, v14}, Lorg/rabochaya/projects/RasterMapImport;->last(DI)I

    move-result v10

    if-gt v15, v10, :cond_d

    move-wide/from16 p3, v1

    move-wide/from16 v1, v18

    invoke-static {v1, v2, v14}, Lorg/rabochaya/projects/RasterMapImport;->first(DI)I

    move-result v10

    move-wide/from16 v18, p3

    :goto_6
    move-wide/from16 v20, v1

    invoke-static {v4, v5, v14}, Lorg/rabochaya/projects/RasterMapImport;->last(DI)I

    move-result v1

    if-gt v10, v1, :cond_c

    .line 19
    move-object/from16 v1, p2

    move/from16 v2, v17

    invoke-interface {v1, v3, v2}, Lorg/rabochaya/projects/CacheExport$Progress;->update(II)V

    move-wide/from16 v22, v4

    const/4 v4, 0x0

    :goto_7
    const/16 v5, 0x100

    if-ge v4, v5, :cond_9

    move-wide/from16 v24, v6

    int-to-double v5, v15

    move-wide/from16 v26, v8

    int-to-double v7, v4

    const-wide/high16 v28, 0x3fe0000000000000L    # 0.5

    add-double v7, v7, v28

    const-wide/high16 v30, 0x4070000000000000L    # 256.0

    div-double v7, v7, v30

    add-double/2addr v5, v7

    int-to-double v7, v14

    div-double/2addr v5, v7

    invoke-static {v5, v6}, Lorg/rabochaya/projects/MapMath;->lat(D)D

    move-result-wide v5

    const/4 v9, 0x0

    :goto_8
    move/from16 v17, v13

    const/16 v13, 0x100

    if-ge v9, v13, :cond_8

    mul-int/lit16 v13, v4, 0x100

    add-int/2addr v13, v9

    move/from16 v32, v2

    int-to-double v1, v10

    move/from16 v33, v14

    move/from16 v34, v15

    int-to-double v14, v9

    add-double v14, v14, v28

    div-double v14, v14, v30

    add-double/2addr v1, v14

    div-double/2addr v1, v7

    const-wide v14, 0x4076800000000000L    # 360.0

    mul-double/2addr v1, v14

    const-wide v14, 0x4066800000000000L    # 180.0

    sub-double/2addr v1, v14

    move-object/from16 v14, p0

    invoke-interface {v14, v1, v2, v5, v6}, Lorg/rabochaya/projects/RasterMapImport$Source;->color(DD)I

    move-result v1

    aput v1, v0, v13

    add-int/lit8 v9, v9, 0x1

    move-object/from16 v1, p2

    move/from16 v13, v17

    move/from16 v2, v32

    move/from16 v14, v33

    move/from16 v15, v34

    goto :goto_8

    :cond_8
    move/from16 v32, v2

    move/from16 v33, v14

    move/from16 v34, v15

    move-object/from16 v14, p0

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v1, p2

    move/from16 v13, v17

    move-wide/from16 v6, v24

    move-wide/from16 v8, v26

    move/from16 v14, v33

    goto :goto_7

    .line 20
    :cond_9
    move/from16 v32, v2

    move-wide/from16 v24, v6

    move-wide/from16 v26, v8

    move/from16 v17, v13

    move/from16 v33, v14

    move/from16 v34, v15

    move-object/from16 v14, p0

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/16 v2, 0x100

    invoke-static {v0, v2, v2, v1}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :try_start_3
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v5, 0x64

    invoke-virtual {v1, v4, v5, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v4

    if-eqz v4, :cond_b

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    array-length v1, v2

    int-to-long v4, v1

    add-long v18, v18, v4

    const-wide/32 v4, 0x20000000

    cmp-long v1, v18, v4

    if-gtz v1, :cond_a

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v4, "zoom_level"

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v4, "tile_column"

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v4, "tile_row"

    move/from16 v15, v34

    int-to-long v5, v15

    invoke-static {v11, v5, v6}, Lorg/rabochaya/projects/MapMath;->tmsRow(IJ)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v4, "tile_data"

    invoke-virtual {v1, v4, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v2, "tiles"

    const/4 v4, 0x0

    invoke-virtual {v12, v2, v4, v1}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    add-int/lit8 v3, v3, 0x1

    .line 18
    add-int/lit8 v10, v10, 0x1

    move/from16 v13, v17

    move-wide/from16 v1, v20

    move-wide/from16 v4, v22

    move-wide/from16 v6, v24

    move-wide/from16 v8, v26

    move/from16 v17, v32

    move/from16 v14, v33

    goto/16 :goto_6

    .line 20
    :cond_a
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041a\u0430\u0440\u0442\u0430 \u0431\u043e\u043b\u044c\u0448\u0435 512 \u041c\u0438\u0411"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_9
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :cond_b
    :try_start_5
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u041e\u0448\u0438\u0431\u043a\u0430 \u043a\u043e\u0434\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u044f \u043a\u0430\u0440\u0442\u044b"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :catchall_0
    move-exception v0

    :try_start_6
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_9

    .line 18
    :cond_c
    move-wide/from16 v22, v4

    move-wide/from16 v24, v6

    move-wide/from16 v26, v8

    move/from16 v33, v14

    move/from16 v32, v17

    const/4 v4, 0x0

    move-object/from16 v14, p0

    move/from16 v17, v13

    add-int/lit8 v15, v15, 0x1

    move-wide/from16 v1, v18

    move-wide/from16 v18, v20

    move-wide/from16 v4, v22

    move/from16 v17, v32

    move/from16 v14, v33

    const/4 v10, 0x1

    goto/16 :goto_5

    :cond_d
    move-object/from16 v14, p0

    move-wide/from16 p3, v1

    move-wide/from16 v22, v4

    move-wide/from16 v24, v6

    move-wide/from16 v26, v8

    move/from16 v32, v17

    move-wide/from16 v20, v18

    const/4 v4, 0x0

    move/from16 v17, v13

    add-int/lit8 v11, v11, 0x1

    move/from16 p4, v17

    move-wide/from16 v4, v22

    move/from16 v17, v32

    goto/16 :goto_4

    .line 21
    :cond_e
    move/from16 v32, v17

    move-object/from16 v0, p2

    move/from16 v1, v32

    invoke-interface {v0, v3, v1}, Lorg/rabochaya/projects/CacheExport$Progress;->update(II)V

    invoke-virtual {v12}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :try_start_7
    invoke-virtual {v12}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 22
    if-eqz v12, :cond_f

    invoke-virtual {v12}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 21
    :cond_f
    return v3

    :catchall_1
    move-exception v0

    :try_start_8
    invoke-virtual {v12}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0
    :try_end_8
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 22
    :catchall_2
    move-exception v0

    move-object v11, v12

    goto :goto_b

    :catch_0
    move-exception v0

    move-object v11, v12

    goto :goto_a

    :catchall_3
    move-exception v0

    move-object v4, v11

    goto :goto_b

    :catch_1
    move-exception v0

    move-object v4, v11

    :goto_a
    :try_start_9
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u0440\u0435\u043e\u0431\u0440\u0430\u0437\u043e\u0432\u0430\u0442\u044c \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 \u0440\u0430\u0441\u0442\u0440: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    :catchall_4
    move-exception v0

    :goto_b
    if-eqz v11, :cond_10

    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    :cond_10
    throw v0

    .line 14
    :cond_11
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0420\u0430\u0437\u0440\u0435\u0448\u0435\u043d\u0438\u0435 \u0440\u0430\u0441\u0442\u0440\u0430 \u0432\u044b\u0448\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u043c\u043e\u0433\u043e z23"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 12
    :cond_12
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041f\u0443\u0441\u0442\u044b\u0435 \u0433\u0440\u0430\u043d\u0438\u0446\u044b \u0440\u0430\u0441\u0442\u0440\u0430"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 10
    :cond_13
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0420\u0430\u0441\u0442\u0440 \u0432\u044b\u0445\u043e\u0434\u0438\u0442 \u0437\u0430 \u043e\u0431\u043b\u0430\u0441\u0442\u044c Web Mercator"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static write(Lorg/rabochaya/projects/RasterMapImport$Source;Ljava/io/File;Lorg/rabochaya/projects/CacheExport$Progress;Ljava/lang/String;Z)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 7
    new-instance v0, Lorg/rabochaya/projects/RasterMapImport$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p2, p3, p4}, Lorg/rabochaya/projects/RasterMapImport$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/RasterMapImport$Source;Lorg/rabochaya/projects/CacheExport$Progress;Ljava/lang/String;Z)V

    invoke-static {p1, v0}, Lorg/rabochaya/projects/RasterExportFile;->replace(Ljava/io/File;Lorg/rabochaya/projects/RasterExportFile$Writer;)I

    move-result p0

    return p0
.end method
