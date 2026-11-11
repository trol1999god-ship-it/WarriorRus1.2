.class public final Lorg/rabochaya/projects/GeoTiffImport;
.super Ljava/lang/Object;
.source "GeoTiffImport.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static first(DI)I
    .locals 3

    .line 26
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

.method static synthetic lambda$write$0(Lorg/rabochaya/projects/GeoTiffRaster;Lorg/rabochaya/projects/CacheExport$Progress;Ljava/io/File;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8
    invoke-static {p0, p2, p1}, Lorg/rabochaya/projects/GeoTiffImport;->prepared(Lorg/rabochaya/projects/GeoTiffRaster;Ljava/io/File;Lorg/rabochaya/projects/CacheExport$Progress;)I

    move-result p0

    return p0
.end method

.method private static last(DI)I
    .locals 3

    .line 27
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

    .line 10
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

.method private static prepared(Lorg/rabochaya/projects/GeoTiffRaster;Ljava/io/File;Lorg/rabochaya/projects/CacheExport$Progress;)I
    .locals 35
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 12
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    iget-object v2, v0, Lorg/rabochaya/projects/GeoTiffRaster;->transform:Lorg/rabochaya/projects/GeoRasterTransform;

    iget-wide v3, v2, Lorg/rabochaya/projects/GeoRasterTransform;->south:D

    const-wide v5, -0x3faabcba4e5a8100L    # -85.05112878

    cmpg-double v3, v3, v5

    if-ltz v3, :cond_10

    iget-wide v3, v2, Lorg/rabochaya/projects/GeoRasterTransform;->north:D

    const-wide v5, 0x40554345b1a57f00L    # 85.05112878

    cmpl-double v3, v3, v5

    if-gtz v3, :cond_10

    .line 13
    iget-wide v3, v2, Lorg/rabochaya/projects/GeoRasterTransform;->west:D

    invoke-static {v3, v4}, Lorg/rabochaya/projects/MapMath;->x(D)D

    move-result-wide v3

    iget-wide v5, v2, Lorg/rabochaya/projects/GeoRasterTransform;->east:D

    invoke-static {v5, v6}, Lorg/rabochaya/projects/MapMath;->x(D)D

    move-result-wide v5

    iget-wide v7, v2, Lorg/rabochaya/projects/GeoRasterTransform;->north:D

    invoke-static {v7, v8}, Lorg/rabochaya/projects/MapMath;->y(D)D

    move-result-wide v7

    iget-wide v9, v2, Lorg/rabochaya/projects/GeoRasterTransform;->south:D

    invoke-static {v9, v10}, Lorg/rabochaya/projects/MapMath;->y(D)D

    move-result-wide v9

    .line 14
    cmpl-double v11, v5, v3

    if-lez v11, :cond_f

    cmpl-double v11, v9, v7

    if-lez v11, :cond_f

    .line 15
    iget v11, v0, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    int-to-double v11, v11

    sub-double v13, v5, v3

    div-double/2addr v11, v13

    iget v13, v0, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    int-to-double v13, v13

    sub-double v15, v9, v7

    div-double/2addr v13, v15

    invoke-static {v11, v12, v13, v14}, Ljava/lang/Math;->max(DD)D

    move-result-wide v11

    const/4 v14, 0x0

    :goto_0
    const/16 v15, 0x17

    const-wide/16 v16, 0x100

    if-ge v14, v15, :cond_0

    shl-long v0, v16, v14

    long-to-double v0, v0

    cmpg-double v0, v0, v11

    if-gez v0, :cond_0

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    goto :goto_0

    .line 16
    :cond_0
    shl-long v0, v16, v14

    long-to-double v0, v0

    cmpg-double v0, v0, v11

    if-ltz v0, :cond_e

    .line 17
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_1
    const/4 v11, 0x1

    if-gt v0, v14, :cond_2

    shl-int v12, v11, v0

    invoke-static {v5, v6, v12}, Lorg/rabochaya/projects/GeoTiffImport;->last(DI)I

    move-result v15

    invoke-static {v3, v4, v12}, Lorg/rabochaya/projects/GeoTiffImport;->first(DI)I

    move-result v16

    sub-int v15, v15, v16

    add-int/2addr v15, v11

    move/from16 v17, v14

    int-to-long v13, v15

    invoke-static {v9, v10, v12}, Lorg/rabochaya/projects/GeoTiffImport;->last(DI)I

    move-result v15

    invoke-static {v7, v8, v12}, Lorg/rabochaya/projects/GeoTiffImport;->first(DI)I

    move-result v12

    sub-int/2addr v15, v12

    add-int/2addr v15, v11

    int-to-long v11, v15

    mul-long/2addr v13, v11

    rsub-int v11, v1, 0x4e20

    int-to-long v11, v11

    cmp-long v11, v13, v11

    if-gtz v11, :cond_1

    long-to-int v11, v13

    add-int/2addr v1, v11

    add-int/lit8 v0, v0, 0x1

    move/from16 v14, v17

    goto :goto_1

    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0418\u043c\u043f\u043e\u0440\u0442 \u043e\u0433\u0440\u0430\u043d\u0438\u0447\u0435\u043d 20 000 \u0442\u0430\u0439\u043b\u043e\u0432"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 18
    :cond_2
    move/from16 v17, v14

    move-object/from16 v0, p2

    const/4 v12, 0x0

    invoke-interface {v0, v12, v1}, Lorg/rabochaya/projects/CacheExport$Progress;->update(II)V

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_4

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->delete()Z

    move-result v12

    if-eqz v12, :cond_3

    goto :goto_2

    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u0438\u0442\u044c \u0432\u0440\u0435\u043c\u0435\u043d\u043d\u0443\u044e \u043a\u0430\u0440\u0442\u0443"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 19
    :cond_4
    :goto_2
    const/4 v12, 0x0

    move-object/from16 v13, p1

    :try_start_0
    invoke-static {v13, v12}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/io/File;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v13
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_8

    :try_start_1
    const-string v14, "CREATE TABLE metadata(name TEXT PRIMARY KEY,value TEXT)"

    invoke-virtual {v13, v14}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v14, "CREATE TABLE tiles(zoom_level INTEGER NOT NULL,tile_column INTEGER NOT NULL,tile_row INTEGER NOT NULL,tile_data BLOB NOT NULL,PRIMARY KEY(zoom_level,tile_column,tile_row))"

    invoke-virtual {v13, v14}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string v14, "name"

    const-string v15, "\u041b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 GeoTIFF"

    invoke-static {v13, v14, v15}, Lorg/rabochaya/projects/GeoTiffImport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v14, "format"

    const-string v15, "png"

    invoke-static {v13, v14, v15}, Lorg/rabochaya/projects/GeoTiffImport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v14, "type"

    const-string v15, "baselayer"

    invoke-static {v13, v14, v15}, Lorg/rabochaya/projects/GeoTiffImport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v14, "version"

    const-string v15, "1.3"

    invoke-static {v13, v14, v15}, Lorg/rabochaya/projects/GeoTiffImport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v14, "scheme"

    const-string v15, "tms"

    invoke-static {v13, v14, v15}, Lorg/rabochaya/projects/GeoTiffImport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v14, "minzoom"

    const-string v15, "0"

    invoke-static {v13, v14, v15}, Lorg/rabochaya/projects/GeoTiffImport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v14, "maxzoom"

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v15

    invoke-static {v13, v14, v15}, Lorg/rabochaya/projects/GeoTiffImport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    const-string v14, "bounds"

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v12, "%.12f,%.12f,%.12f,%.12f"

    const/4 v11, 0x4

    new-array v11, v11, [Ljava/lang/Object;

    move/from16 v18, v1

    iget-wide v0, v2, Lorg/rabochaya/projects/GeoRasterTransform;->west:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    const/4 v1, 0x0

    aput-object v0, v11, v1

    iget-wide v0, v2, Lorg/rabochaya/projects/GeoRasterTransform;->south:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, v11, v1

    iget-wide v0, v2, Lorg/rabochaya/projects/GeoRasterTransform;->east:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    const/4 v1, 0x2

    aput-object v0, v11, v1

    iget-wide v0, v2, Lorg/rabochaya/projects/GeoRasterTransform;->north:D

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    const/4 v1, 0x3

    aput-object v0, v11, v1

    invoke-static {v15, v12, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v13, v14, v0}, Lorg/rabochaya/projects/GeoTiffImport;->meta(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    invoke-virtual {v13}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_7

    const/high16 v0, 0x10000

    :try_start_2
    new-array v0, v0, [I

    const-wide/16 v1, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    :goto_3
    move/from16 v14, v17

    if-gt v12, v14, :cond_b

    move-wide/from16 v19, v1

    const/4 v15, 0x1

    shl-int v1, v15, v12

    invoke-static {v7, v8, v1}, Lorg/rabochaya/projects/GeoTiffImport;->first(DI)I

    move-result v2

    :goto_4
    invoke-static {v9, v10, v1}, Lorg/rabochaya/projects/GeoTiffImport;->last(DI)I

    move-result v15

    if-gt v2, v15, :cond_a

    invoke-static {v3, v4, v1}, Lorg/rabochaya/projects/GeoTiffImport;->first(DI)I

    move-result v15

    :goto_5
    move-wide/from16 v21, v3

    invoke-static {v5, v6, v1}, Lorg/rabochaya/projects/GeoTiffImport;->last(DI)I

    move-result v3

    if-gt v15, v3, :cond_9

    .line 21
    move-object/from16 v3, p2

    move/from16 v4, v18

    invoke-interface {v3, v11, v4}, Lorg/rabochaya/projects/CacheExport$Progress;->update(II)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    move-wide/from16 v23, v5

    const/4 v5, 0x0

    :goto_6
    const/16 v6, 0x100

    if-ge v5, v6, :cond_6

    move-wide/from16 v25, v7

    int-to-double v6, v2

    move-wide/from16 v27, v9

    int-to-double v8, v5

    const-wide/high16 v29, 0x3fe0000000000000L    # 0.5

    add-double v8, v8, v29

    const-wide/high16 v31, 0x4070000000000000L    # 256.0

    div-double v8, v8, v31

    add-double/2addr v6, v8

    int-to-double v8, v1

    div-double/2addr v6, v8

    :try_start_3
    invoke-static {v6, v7}, Lorg/rabochaya/projects/MapMath;->lat(D)D

    move-result-wide v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const/4 v10, 0x0

    :goto_7
    move/from16 v17, v1

    const/16 v1, 0x100

    if-ge v10, v1, :cond_5

    mul-int/lit16 v1, v5, 0x100

    add-int/2addr v1, v10

    move/from16 v18, v4

    int-to-double v3, v15

    move-object/from16 v33, v13

    move/from16 v34, v14

    int-to-double v13, v10

    add-double v13, v13, v29

    div-double v13, v13, v31

    add-double/2addr v3, v13

    div-double/2addr v3, v8

    const-wide v13, 0x4076800000000000L    # 360.0

    mul-double/2addr v3, v13

    const-wide v13, 0x4066800000000000L    # 180.0

    sub-double/2addr v3, v13

    move-object/from16 v13, p0

    :try_start_4
    invoke-virtual {v13, v3, v4, v6, v7}, Lorg/rabochaya/projects/GeoTiffRaster;->color(DD)I

    move-result v3

    aput v3, v0, v1

    add-int/lit8 v10, v10, 0x1

    move-object/from16 v3, p2

    move/from16 v1, v17

    move/from16 v4, v18

    move-object/from16 v13, v33

    move/from16 v14, v34

    goto :goto_7

    :cond_5
    move/from16 v18, v4

    move-object/from16 v33, v13

    move/from16 v34, v14

    move-object/from16 v13, p0

    add-int/lit8 v5, v5, 0x1

    move-object/from16 v3, p2

    move/from16 v1, v17

    move-wide/from16 v7, v25

    move-wide/from16 v9, v27

    move-object/from16 v13, v33

    goto :goto_6

    .line 23
    :catchall_0
    move-exception v0

    move-object/from16 v33, v13

    goto/16 :goto_a

    .line 22
    :cond_6
    move/from16 v17, v1

    move/from16 v18, v4

    move-wide/from16 v25, v7

    move-wide/from16 v27, v9

    move-object/from16 v33, v13

    move/from16 v34, v14

    move-object/from16 v13, p0

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/16 v3, 0x100

    invoke-static {v0, v3, v3, v1}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    :try_start_5
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v5, 0x64

    invoke-virtual {v1, v4, v5, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :try_start_6
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    array-length v1, v3

    int-to-long v4, v1

    add-long v19, v19, v4

    const-wide/32 v4, 0x20000000

    cmp-long v1, v19, v4

    if-gtz v1, :cond_7

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v4, "zoom_level"

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v4, "tile_column"

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v4, "tile_row"

    int-to-long v5, v2

    invoke-static {v12, v5, v6}, Lorg/rabochaya/projects/MapMath;->tmsRow(IJ)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v4, "tile_data"

    invoke-virtual {v1, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v3, "tiles"
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    move-object/from16 v4, v33

    const/4 v5, 0x0

    :try_start_7
    invoke-virtual {v4, v3, v5, v1}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    add-int/lit8 v11, v11, 0x1

    .line 20
    add-int/lit8 v15, v15, 0x1

    move-object v13, v4

    move/from16 v1, v17

    move-wide/from16 v3, v21

    move-wide/from16 v5, v23

    move-wide/from16 v7, v25

    move-wide/from16 v9, v27

    move/from16 v14, v34

    goto/16 :goto_5

    .line 22
    :cond_7
    move-object/from16 v4, v33

    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041a\u0430\u0440\u0442\u0430 \u0431\u043e\u043b\u044c\u0448\u0435 512 \u041c\u0438\u0411"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_8
    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    :cond_8
    move-object/from16 v4, v33

    :try_start_8
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u041e\u0448\u0438\u0431\u043a\u0430 \u043a\u043e\u0434\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u044f \u043a\u0430\u0440\u0442\u044b"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :catchall_1
    move-exception v0

    goto :goto_9

    :catchall_2
    move-exception v0

    move-object/from16 v4, v33

    :goto_9
    :try_start_9
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_8

    .line 23
    :catchall_3
    move-exception v0

    :goto_a
    move-object/from16 v4, v33

    goto :goto_b

    .line 20
    :cond_9
    move/from16 v17, v1

    move-wide/from16 v23, v5

    move-wide/from16 v25, v7

    move-wide/from16 v27, v9

    move-object v4, v13

    move/from16 v34, v14

    const/4 v5, 0x0

    move-object/from16 v13, p0

    add-int/lit8 v2, v2, 0x1

    move-object v13, v4

    move-wide/from16 v3, v21

    move-wide/from16 v5, v23

    const/4 v15, 0x1

    goto/16 :goto_4

    :cond_a
    move-wide/from16 v21, v3

    move-wide/from16 v23, v5

    move-wide/from16 v25, v7

    move-wide/from16 v27, v9

    move-object v4, v13

    move/from16 v34, v14

    const/4 v5, 0x0

    move-object/from16 v13, p0

    add-int/lit8 v12, v12, 0x1

    move-object v13, v4

    move-wide/from16 v1, v19

    move-wide/from16 v3, v21

    move-wide/from16 v5, v23

    move/from16 v17, v34

    goto/16 :goto_3

    .line 23
    :cond_b
    move-object v4, v13

    move-object/from16 v0, p2

    move/from16 v13, v18

    invoke-interface {v0, v11, v13}, Lorg/rabochaya/projects/CacheExport$Progress;->update(II)V

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    :try_start_a
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_a
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .line 24
    if-eqz v4, :cond_c

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 23
    :cond_c
    return v11

    :catchall_4
    move-exception v0

    goto :goto_b

    :catchall_5
    move-exception v0

    move-object v4, v13

    :goto_b
    :try_start_b
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0
    :try_end_b
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_b} :catch_0
    .catchall {:try_start_b .. :try_end_b} :catchall_6

    .line 24
    :catchall_6
    move-exception v0

    goto :goto_c

    :catch_0
    move-exception v0

    goto :goto_d

    :catchall_7
    move-exception v0

    move-object v4, v13

    :goto_c
    move-object v12, v4

    goto :goto_f

    :catch_1
    move-exception v0

    move-object v4, v13

    :goto_d
    move-object v12, v4

    goto :goto_e

    :catchall_8
    move-exception v0

    move-object v5, v12

    goto :goto_f

    :catch_2
    move-exception v0

    move-object v5, v12

    :goto_e
    :try_start_c
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u0440\u0435\u043e\u0431\u0440\u0430\u0437\u043e\u0432\u0430\u0442\u044c GeoTIFF: "

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
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_9

    :catchall_9
    move-exception v0

    :goto_f
    if-eqz v12, :cond_d

    invoke-virtual {v12}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    :cond_d
    throw v0

    .line 16
    :cond_e
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0420\u0430\u0437\u0440\u0435\u0448\u0435\u043d\u0438\u0435 \u0440\u0430\u0441\u0442\u0440\u0430 \u0432\u044b\u0448\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u043c\u043e\u0433\u043e z23"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 14
    :cond_f
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041f\u0443\u0441\u0442\u044b\u0435 \u0433\u0440\u0430\u043d\u0438\u0446\u044b \u0440\u0430\u0441\u0442\u0440\u0430"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 12
    :cond_10
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0420\u0430\u0441\u0442\u0440 \u0432\u044b\u0445\u043e\u0434\u0438\u0442 \u0437\u0430 \u043e\u0431\u043b\u0430\u0441\u0442\u044c Web Mercator"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static write(Ljava/io/File;Ljava/io/File;Lorg/rabochaya/projects/CacheExport$Progress;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 7
    invoke-virtual {p0}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 8
    new-instance v0, Lorg/rabochaya/projects/GeoTiffRaster;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/GeoTiffRaster;-><init>(Ljava/io/File;)V

    :try_start_0
    new-instance p0, Lorg/rabochaya/projects/GeoTiffImport$$ExternalSyntheticLambda0;

    invoke-direct {p0, v0, p2}, Lorg/rabochaya/projects/GeoTiffImport$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/GeoTiffRaster;Lorg/rabochaya/projects/CacheExport$Progress;)V

    invoke-static {p1, p0}, Lorg/rabochaya/projects/RasterExportFile;->replace(Ljava/io/File;Lorg/rabochaya/projects/RasterExportFile$Writer;)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeoTiffRaster;->close()V

    return p0

    :catchall_0
    move-exception p0

    :try_start_1
    invoke-virtual {v0}, Lorg/rabochaya/projects/GeoTiffRaster;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw p0

    .line 7
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u0418\u0441\u0445\u043e\u0434\u043d\u044b\u0439 GeoTIFF \u043d\u0435\u043b\u044c\u0437\u044f \u043f\u0435\u0440\u0435\u0437\u0430\u043f\u0438\u0441\u044b\u0432\u0430\u0442\u044c"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
