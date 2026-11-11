.class public final Lorg/rabochaya/projects/GeoTiffRaster;
.super Ljava/lang/Object;
.source "GeoTiffRaster.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/GeoTiffRaster$Entry;,
        Lorg/rabochaya/projects/GeoTiffRaster$StripInput;
    }
.end annotation


# static fields
.field public static final MAX_FILE:J = 0x20000000L


# instance fields
.field private final alpha:I

.field private final blockWidth:I

.field private final columns:I

.field private final compression:I

.field private decodedStrip:I

.field private decoder:Ljava/io/DataInputStream;

.field private final file:Ljava/io/RandomAccessFile;

.field public final height:I

.field private final length:J

.field private final little:Z

.field private nextRow:I

.field private final nodata:I

.field private final offsets:[J

.field private final photo:I

.field private final predictor:I

.field private final rowCache:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/Integer;",
            "[B>;"
        }
    .end annotation
.end field

.field private final rows:I

.field private final samples:I

.field private final sizes:[J

.field private final tags:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lorg/rabochaya/projects/GeoTiffRaster$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private final tileCache:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/Integer;",
            "[B>;"
        }
    .end annotation
.end field

.field private tileCacheBytes:J

.field private final tiled:Z

.field public final transform:Lorg/rabochaya/projects/GeoRasterTransform;

.field public final width:I


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 39
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8
    move-object/from16 v1, p0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 5
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    .line 6
    new-instance v0, Ljava/util/LinkedHashMap;

    const/16 v2, 0x10

    const/high16 v3, 0x3f400000    # 0.75f

    const/4 v4, 0x1

    invoke-direct {v0, v2, v3, v4}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->tileCache:Ljava/util/LinkedHashMap;

    const/4 v0, -0x1

    iput v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->decodedStrip:I

    new-instance v5, Lorg/rabochaya/projects/GeoTiffRaster$1;

    invoke-direct {v5, v1, v2, v3, v4}, Lorg/rabochaya/projects/GeoTiffRaster$1;-><init>(Lorg/rabochaya/projects/GeoTiffRaster;IFZ)V

    iput-object v5, v1, Lorg/rabochaya/projects/GeoTiffRaster;->rowCache:Ljava/util/LinkedHashMap;

    .line 8
    new-instance v3, Ljava/io/RandomAccessFile;

    const-string v5, "r"

    move-object/from16 v6, p1

    invoke-direct {v3, v6, v5}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    .line 9
    :try_start_0
    iget-object v5, v1, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v5}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v5

    iput-wide v5, v1, Lorg/rabochaya/projects/GeoTiffRaster;->length:J

    iget-wide v5, v1, Lorg/rabochaya/projects/GeoTiffRaster;->length:J

    const-wide/16 v7, 0x8

    cmp-long v5, v5, v7

    if-ltz v5, :cond_3d

    iget-wide v5, v1, Lorg/rabochaya/projects/GeoTiffRaster;->length:J

    const-wide/32 v9, 0x20000000

    cmp-long v5, v5, v9

    if-gtz v5, :cond_3d

    iget-object v5, v1, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v5}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v5

    iget-object v6, v1, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v6}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v6

    if-ne v5, v6, :cond_3c

    const/16 v6, 0x49

    if-eq v5, v6, :cond_1

    const/16 v9, 0x4d

    if-ne v5, v9, :cond_0

    goto :goto_0

    :cond_0
    move-object v4, v1

    move-object/from16 v18, v3

    goto/16 :goto_1b

    :cond_1
    :goto_0
    if-ne v5, v6, :cond_2

    move v5, v4

    goto :goto_1

    :cond_2
    const/4 v5, 0x0

    :goto_1
    iput-boolean v5, v1, Lorg/rabochaya/projects/GeoTiffRaster;->little:Z

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u16()I

    move-result v5

    const/16 v6, 0x2a

    if-ne v5, v6, :cond_3b

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u32()J

    move-result-wide v5

    const-wide/16 v10, 0x2

    invoke-direct {v1, v5, v6, v10, v11}, Lorg/rabochaya/projects/GeoTiffRaster;->range(JJ)V

    iget-object v12, v1, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v12, v5, v6}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u16()I

    move-result v12
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    if-lt v12, v4, :cond_3a

    const/16 v13, 0x100

    if-gt v12, v13, :cond_3a

    add-long/2addr v5, v10

    int-to-long v10, v12

    const-wide/16 v14, 0xc

    mul-long/2addr v10, v14

    const-wide/16 v16, 0x4

    move-object/from16 v18, v3

    add-long v2, v10, v16

    :try_start_1
    invoke-direct {v1, v5, v6, v2, v3}, Lorg/rabochaya/projects/GeoTiffRaster;->range(JJ)V

    .line 10
    const/4 v2, 0x0

    :goto_2
    if-ge v2, v12, :cond_6

    iget-object v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    move-wide/from16 v19, v10

    int-to-long v9, v2

    mul-long/2addr v9, v14

    add-long/2addr v9, v5

    invoke-virtual {v3, v9, v10}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u16()I

    move-result v3

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u16()I

    move-result v11

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u32()J

    move-result-wide v14

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u32()J

    move-result-wide v21

    invoke-static {v11}, Lorg/rabochaya/projects/GeoTiffRaster;->typeSize(I)I

    move-result v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const-wide/32 v23, 0x7fffffff

    cmp-long v23, v14, v23

    if-gtz v23, :cond_5

    int-to-long v0, v4

    mul-long/2addr v0, v14

    cmp-long v4, v0, v16

    if-gtz v4, :cond_3

    add-long v21, v9, v7

    :cond_3
    move-wide/from16 v9, v21

    move-object/from16 v4, p0

    :try_start_2
    invoke-direct {v4, v9, v10, v0, v1}, Lorg/rabochaya/projects/GeoTiffRaster;->range(JJ)V

    iget-object v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v3, Lorg/rabochaya/projects/GeoTiffRaster$Entry;

    long-to-int v14, v14

    invoke-direct {v3, v11, v14, v9, v10}, Lorg/rabochaya/projects/GeoTiffRaster$Entry;-><init>(IIJ)V

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_4

    add-int/lit8 v2, v2, 0x1

    move-object v1, v4

    move-wide/from16 v10, v19

    const/4 v0, -0x1

    const/4 v4, 0x1

    const-wide/16 v14, 0xc

    goto :goto_2

    :cond_4
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041f\u043e\u0432\u0442\u043e\u0440 TIFF tag"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_3
    throw v0

    :cond_5
    move-object v4, v1

    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0431\u043e\u043b\u044c\u0448\u043e\u0439 TIFF tag"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    .line 11
    :cond_6
    move-object v4, v1

    move-wide/from16 v19, v10

    iget-object v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    add-long v5, v5, v19

    invoke-virtual {v0, v5, v6}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u32()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_39

    iget-object v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    const/16 v1, 0x14a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_39

    .line 12
    const/4 v0, -0x1

    invoke-direct {v4, v13, v0}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v1

    iput v1, v4, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    const/16 v1, 0x101

    invoke-direct {v4, v1, v0}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v1

    iput v1, v4, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_38

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    if-lt v0, v1, :cond_38

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    const/16 v1, 0x4e20

    if-gt v0, v1, :cond_38

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    if-gt v0, v1, :cond_38

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    int-to-long v0, v0

    iget v5, v4, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    int-to-long v5, v5

    mul-long/2addr v0, v5

    const-wide/32 v5, 0x5f5e100

    cmp-long v0, v0, v5

    if-gtz v0, :cond_38

    .line 13
    const/16 v0, 0x103

    const/4 v1, 0x1

    invoke-direct {v4, v0, v1}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v0

    iput v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->compression:I

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->compression:I

    if-eq v0, v1, :cond_8

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->compression:I

    const/16 v1, 0x8

    if-eq v0, v1, :cond_8

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->compression:I

    const v1, 0x80b2

    if-ne v0, v1, :cond_7

    goto :goto_5

    :cond_7
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0443\u0436\u0435\u043d raw/Deflate GeoTIFF; \u044d\u0442\u043e\u0442 compression \u043f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_4
    throw v0

    :cond_8
    :goto_5
    const/16 v0, 0x13d

    const/4 v1, 0x1

    invoke-direct {v4, v0, v1}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v0

    iput v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->predictor:I

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->predictor:I

    const/4 v9, 0x2

    if-eq v0, v1, :cond_9

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->predictor:I

    if-ne v0, v9, :cond_a

    :cond_9
    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->compression:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_b

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->predictor:I

    if-ne v0, v1, :cond_a

    goto :goto_6

    :cond_a
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u043d\u044b\u0439 TIFF predictor"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :cond_b
    :goto_6
    iget-object v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    const/16 v1, 0x142

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v0, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const/16 v10, 0x145

    const/16 v11, 0x144

    const/16 v12, 0x143

    if-nez v0, :cond_d

    iget-object v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v0, v13}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    iget-object v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v0, v13}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    iget-object v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v0, v13}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    goto :goto_7

    :cond_c
    const/4 v0, 0x0

    goto :goto_8

    :cond_d
    :goto_7
    const/4 v0, 0x1

    :goto_8
    iput-boolean v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->tiled:Z

    iget-boolean v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->tiled:Z

    if-eqz v0, :cond_f

    const v0, 0x80e5

    const/4 v13, 0x1

    invoke-direct {v4, v0, v13}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v0

    if-ne v0, v13, :cond_e

    const v0, 0x80e6

    invoke-direct {v4, v0, v13}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v0

    if-ne v0, v13, :cond_e

    goto :goto_9

    :cond_e
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041e\u0431\u044a\u0451\u043c\u043d\u044b\u0435 TIFF tiles \u043f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u044b"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_4

    :cond_f
    :goto_9
    const/16 v0, 0x112

    const/4 v13, 0x1

    invoke-direct {v4, v0, v13}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v0

    if-ne v0, v13, :cond_37

    const/16 v0, 0x11c

    invoke-direct {v4, v0, v13}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v0

    if-ne v0, v13, :cond_37

    const/16 v0, 0x10a

    invoke-direct {v4, v0, v13}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v0

    if-ne v0, v13, :cond_37

    iget-object v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    const v13, 0x8773

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v0, v13}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_36

    .line 14
    const/16 v0, 0x106

    const/4 v13, -0x1

    invoke-direct {v4, v0, v13}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v0

    iput v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->photo:I

    const/16 v0, 0x115

    const/4 v13, 0x1

    invoke-direct {v4, v0, v13}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v0

    iput v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->photo:I

    if-ne v0, v9, :cond_10

    const/4 v0, 0x3

    goto :goto_b

    :cond_10
    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->photo:I

    if-eqz v0, :cond_12

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->photo:I

    const/4 v14, 0x1

    if-ne v0, v14, :cond_11

    goto :goto_a

    :cond_11
    const/4 v0, -0x1

    goto :goto_b

    :cond_12
    :goto_a
    const/4 v0, 0x1

    :goto_b
    if-ltz v0, :cond_35

    iget v14, v4, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    if-eq v14, v0, :cond_13

    iget v14, v4, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    add-int/lit8 v15, v0, 0x1

    if-ne v14, v15, :cond_35

    :cond_13
    const/16 v14, 0x102

    invoke-direct {v4, v14}, Lorg/rabochaya/projects/GeoTiffRaster;->integers(I)[J

    move-result-object v14

    array-length v15, v14

    iget v13, v4, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    if-ne v15, v13, :cond_34

    array-length v13, v14

    const/4 v15, 0x0

    :goto_c
    if-ge v15, v13, :cond_15

    aget-wide v19, v14, v15

    cmp-long v17, v19, v7

    if-nez v17, :cond_14

    add-int/lit8 v15, v15, 0x1

    goto :goto_c

    :cond_14
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041f\u043e\u043a\u0430 \u043d\u0443\u0436\u043d\u044b 8-bit samples; \u044d\u0442\u043e \u043d\u0435 DEM reader"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_d
    throw v0

    :cond_15
    iget-object v7, v4, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    const/16 v8, 0x153

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-interface {v7, v13}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_17

    invoke-direct {v4, v8}, Lorg/rabochaya/projects/GeoTiffRaster;->integers(I)[J

    move-result-object v7

    array-length v8, v7

    const/4 v13, 0x0

    :goto_e
    if-ge v13, v8, :cond_17

    aget-wide v14, v7, v13

    const-wide/16 v19, 0x1

    cmp-long v14, v14, v19

    if-nez v14, :cond_16

    add-int/lit8 v13, v13, 0x1

    goto :goto_e

    :cond_16
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0443\u0436\u043d\u044b unsigned samples"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_d

    .line 15
    :cond_17
    iget v7, v4, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    if-ne v7, v0, :cond_18

    const/4 v7, 0x0

    goto :goto_f

    :cond_18
    const/16 v7, 0x152

    const/4 v8, -0x1

    invoke-direct {v4, v7, v8}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v7

    :goto_f
    iput v7, v4, Lorg/rabochaya/projects/GeoTiffRaster;->alpha:I

    iget v7, v4, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    if-eq v7, v0, :cond_1a

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->alpha:I

    const/4 v7, 0x1

    if-eq v0, v7, :cond_1a

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->alpha:I

    if-ne v0, v9, :cond_19

    goto :goto_11

    :cond_19
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0443\u0436\u0435\u043d \u043e\u0431\u044a\u044f\u0432\u043b\u0435\u043d\u043d\u044b\u0439 alpha sample"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_10
    throw v0

    :cond_1a
    :goto_11
    iget-boolean v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->tiled:Z

    if-eqz v0, :cond_1f

    iget-object v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    const/16 v7, 0x111

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    iget-object v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    const/16 v7, 0x117

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    const/4 v0, -0x1

    invoke-direct {v4, v1, v0}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v1

    iput v1, v4, Lorg/rabochaya/projects/GeoTiffRaster;->blockWidth:I

    invoke-direct {v4, v12, v0}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v0

    iput v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->blockWidth:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_1d

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    if-lt v0, v1, :cond_1d

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->blockWidth:I

    const/16 v1, 0x1000

    if-gt v0, v1, :cond_1d

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    const/16 v1, 0x1000

    if-gt v0, v1, :cond_1d

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->blockWidth:I

    const/16 v1, 0x10

    rem-int/2addr v0, v1

    if-nez v0, :cond_1d

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    rem-int/2addr v0, v1

    if-nez v0, :cond_1d

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    iget v1, v4, Lorg/rabochaya/projects/GeoTiffRaster;->blockWidth:I

    add-int/2addr v0, v1

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    iget v1, v4, Lorg/rabochaya/projects/GeoTiffRaster;->blockWidth:I

    div-int/2addr v0, v1

    iput v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->columns:I

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->blockWidth:I

    int-to-long v0, v0

    iget v7, v4, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    int-to-long v7, v7

    mul-long/2addr v0, v7

    iget v7, v4, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    int-to-long v7, v7

    mul-long/2addr v0, v7

    const-wide/32 v7, 0x400000

    cmp-long v0, v0, v7

    if-gtz v0, :cond_1c

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->columns:I

    int-to-long v0, v0

    iget v7, v4, Lorg/rabochaya/projects/GeoTiffRaster;->blockWidth:I

    int-to-long v7, v7

    mul-long/2addr v0, v7

    iget v7, v4, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    iget v8, v4, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    add-int/2addr v7, v8

    const/4 v8, 0x1

    sub-int/2addr v7, v8

    iget v8, v4, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    div-int/2addr v7, v8

    int-to-long v7, v7

    mul-long/2addr v0, v7

    iget v7, v4, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    int-to-long v7, v7

    mul-long/2addr v0, v7

    cmp-long v0, v0, v5

    if-gtz v0, :cond_1b

    invoke-direct {v4, v11}, Lorg/rabochaya/projects/GeoTiffRaster;->integers(I)[J

    move-result-object v0

    iput-object v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->offsets:[J

    invoke-direct {v4, v10}, Lorg/rabochaya/projects/GeoTiffRaster;->integers(I)[J

    move-result-object v0

    iput-object v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->sizes:[J

    goto :goto_13

    :cond_1b
    new-instance v0, Ljava/io/IOException;

    const-string v1, "TIFF tiles: padded raster \u043f\u0440\u0435\u0432\u044b\u0448\u0430\u0435\u0442100\u043c\u043b\u043d \u043f\u0438\u043a\u0441\u0435\u043b\u0435\u0439"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_10

    :cond_1c
    new-instance v0, Ljava/io/IOException;

    const-string v1, "TIFF tile: decoded block \u043f\u0440\u0435\u0432\u044b\u0448\u0430\u0435\u04424\u041c\u0438\u0411"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_10

    :cond_1d
    new-instance v0, Ljava/io/IOException;

    const-string v1, "TIFF tiles: \u0440\u0430\u0437\u043c\u0435\u0440\u044b \u043a\u0440\u0430\u0442\u043d\u044b16, \u043e\u044216 \u0434\u043e4096"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_10

    :cond_1e
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0421\u043c\u0435\u0448\u0430\u043d\u043d\u044b\u0435 strips/tiles \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u044b"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_10

    :cond_1f
    iget-object v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    const/16 v1, 0x116

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    const/16 v0, 0x116

    invoke-direct {v4, v0}, Lorg/rabochaya/projects/GeoTiffRaster;->integers(I)[J

    move-result-object v0

    const/4 v1, 0x0

    aget-wide v5, v0, v1

    goto :goto_12

    :cond_20
    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    int-to-long v5, v0

    :goto_12
    const-wide/16 v0, 0x1

    cmp-long v0, v5, v0

    if-ltz v0, :cond_33

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    int-to-long v0, v0

    invoke-static {v0, v1, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    iput v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    iput v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->blockWidth:I

    const/4 v0, 0x1

    iput v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->columns:I

    const/16 v0, 0x111

    invoke-direct {v4, v0}, Lorg/rabochaya/projects/GeoTiffRaster;->integers(I)[J

    move-result-object v0

    iput-object v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->offsets:[J

    const/16 v0, 0x117

    invoke-direct {v4, v0}, Lorg/rabochaya/projects/GeoTiffRaster;->integers(I)[J

    move-result-object v0

    iput-object v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->sizes:[J

    :goto_13
    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->columns:I

    iget v1, v4, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    iget v5, v4, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    add-int/2addr v1, v5

    const/4 v5, 0x1

    sub-int/2addr v1, v5

    iget v5, v4, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    div-int/2addr v1, v5

    mul-int/2addr v0, v1

    iget-object v1, v4, Lorg/rabochaya/projects/GeoTiffRaster;->offsets:[J

    array-length v1, v1

    if-ne v1, v0, :cond_32

    iget-object v1, v4, Lorg/rabochaya/projects/GeoTiffRaster;->sizes:[J

    array-length v1, v1

    if-ne v1, v0, :cond_32

    const/4 v1, 0x0

    :goto_14
    if-ge v1, v0, :cond_23

    invoke-direct {v4, v1}, Lorg/rabochaya/projects/GeoTiffRaster;->decodedSize(I)J

    move-result-wide v5

    iget-object v7, v4, Lorg/rabochaya/projects/GeoTiffRaster;->sizes:[J

    aget-wide v10, v7, v1

    cmp-long v7, v10, v2

    if-lez v7, :cond_22

    iget v7, v4, Lorg/rabochaya/projects/GeoTiffRaster;->compression:I

    const/4 v8, 0x1

    if-ne v7, v8, :cond_21

    iget-object v7, v4, Lorg/rabochaya/projects/GeoTiffRaster;->sizes:[J

    aget-wide v10, v7, v1

    cmp-long v5, v10, v5

    if-nez v5, :cond_22

    :cond_21
    iget-object v5, v4, Lorg/rabochaya/projects/GeoTiffRaster;->offsets:[J

    aget-wide v6, v5, v1

    iget-object v5, v4, Lorg/rabochaya/projects/GeoTiffRaster;->sizes:[J

    aget-wide v10, v5, v1

    invoke-direct {v4, v6, v7, v10, v11}, Lorg/rabochaya/projects/GeoTiffRaster;->range(JJ)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    :cond_22
    new-instance v0, Ljava/io/IOException;

    const-string v1, "TIFF block byte count \u043d\u0435 \u0441\u043e\u043e\u0442\u0432\u0435\u0442\u0441\u0442\u0432\u0443\u0435\u0442 raster"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_10

    .line 16
    :cond_23
    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->readNoData()I

    move-result v0

    iput v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->nodata:I

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->keys()Ljava/util/Map;

    move-result-object v0

    const/16 v1, 0x400

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lorg/rabochaya/projects/GeoTiffRaster;->value(Ljava/util/Map;II)I

    move-result v1

    const/4 v3, 0x1

    if-ne v1, v3, :cond_24

    const/16 v3, 0xc00

    invoke-static {v0, v3, v2}, Lorg/rabochaya/projects/GeoTiffRaster;->value(Ljava/util/Map;II)I

    move-result v3

    goto :goto_15

    :cond_24
    if-ne v1, v9, :cond_25

    const/16 v3, 0x800

    invoke-static {v0, v3, v2}, Lorg/rabochaya/projects/GeoTiffRaster;->value(Ljava/util/Map;II)I

    move-result v3

    goto :goto_15

    :cond_25
    const/4 v3, 0x0

    :goto_15
    const/4 v2, 0x1

    if-ne v1, v2, :cond_26

    const/16 v2, 0xf11

    if-eq v3, v2, :cond_27

    :cond_26
    if-ne v1, v9, :cond_31

    const/16 v1, 0x10e6

    if-ne v3, v1, :cond_31

    :cond_27
    const/16 v1, 0x806

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_28

    const/16 v1, 0x806

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x238e

    if-ne v1, v2, :cond_29

    :cond_28
    const/16 v1, 0xc04

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2a

    const/16 v1, 0xc04

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0x2329

    if-ne v1, v2, :cond_29

    goto :goto_17

    :cond_29
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041a\u043e\u043d\u0444\u043b\u0438\u043a\u0442 \u0435\u0434\u0438\u043d\u0438\u0446 CRS"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_16
    throw v0

    :cond_2a
    :goto_17
    const/16 v1, 0x401

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lorg/rabochaya/projects/GeoTiffRaster;->value(Ljava/util/Map;II)I

    move-result v0

    if-eq v0, v2, :cond_2c

    if-ne v0, v9, :cond_2b

    goto :goto_18

    :cond_2b
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435\u0438\u0437\u0432\u0435\u0441\u0442\u043d\u044b\u0439 raster type"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_16

    :cond_2c
    :goto_18
    iget-object v1, v4, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    const v2, 0x85d8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_30

    const v1, 0x830e

    const/4 v2, 0x3

    invoke-direct {v4, v1, v2}, Lorg/rabochaya/projects/GeoTiffRaster;->doubles(II)[D

    move-result-object v1

    const v2, 0x8482

    const/4 v5, 0x6

    invoke-direct {v4, v2, v5}, Lorg/rabochaya/projects/GeoTiffRaster;->doubles(II)[D

    move-result-object v2

    aget-wide v5, v1, v9

    const-wide/16 v7, 0x0

    cmpl-double v5, v5, v7

    if-nez v5, :cond_2f

    aget-wide v5, v2, v9

    cmpl-double v5, v5, v7

    if-nez v5, :cond_2f

    const/4 v5, 0x5

    aget-wide v5, v2, v5

    cmpl-double v5, v5, v7

    if-nez v5, :cond_2f

    iget v5, v4, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    iget v6, v4, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    if-ne v0, v9, :cond_2d

    const/16 v26, 0x1

    goto :goto_19

    :cond_2d
    const/16 v26, 0x0

    :goto_19
    const/4 v0, 0x0

    aget-wide v27, v1, v0

    const/4 v7, 0x1

    aget-wide v29, v1, v7

    aget-wide v31, v2, v0

    aget-wide v33, v2, v7

    const/4 v0, 0x3

    aget-wide v35, v2, v0

    const/4 v0, 0x4

    aget-wide v37, v2, v0

    move/from16 v23, v5

    move/from16 v24, v6

    move/from16 v25, v3

    invoke-static/range {v23 .. v38}, Lorg/rabochaya/projects/GeoRasterTransform;->scale(IIIZDDDDDD)Lorg/rabochaya/projects/GeoRasterTransform;

    move-result-object v0

    iput-object v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->transform:Lorg/rabochaya/projects/GeoRasterTransform;

    iget v0, v4, Lorg/rabochaya/projects/GeoTiffRaster;->compression:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2e

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->validateDeflate()V

    .line 17
    :cond_2e
    return-void

    .line 16
    :cond_2f
    new-instance v0, Ljava/io/IOException;

    const-string v1, "3D \u0433\u0435\u043e\u043f\u0440\u0438\u0432\u044f\u0437\u043a\u0430 \u043f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u0430"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_16

    :cond_30
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Matrix/rotation GeoTIFF \u043f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_16

    :cond_31
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041f\u043e\u043a\u0430 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u044b \u0442\u043e\u043b\u044c\u043a\u043e \u044f\u0432\u043d\u044b\u0435 EPSG3857/4326"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_16

    .line 15
    :cond_32
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435\u0432\u0435\u0440\u043d\u043e\u0435 \u0447\u0438\u0441\u043b\u043e TIFF blocks"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_10

    :cond_33
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 RowsPerStrip"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_10

    .line 14
    :cond_34
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 BitsPerSample"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_d

    :cond_35
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0443\u0436\u0435\u043d RGB/gray raster, palette/DEM \u043f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u044b"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_d

    .line 13
    :cond_36
    new-instance v0, Ljava/io/IOException;

    const-string v1, "ICC-\u043f\u0440\u043e\u0444\u0438\u043b\u0438 \u043f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u044b"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_4

    :cond_37
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u043d\u0430\u044f orientation/planar/fill/predictor \u0441\u0445\u0435\u043c\u0430"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 12
    :cond_38
    new-instance v0, Ljava/io/IOException;

    const-string v1, "GeoTIFF: \u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u043e \u0434\u043e20000 \u043f\u043e \u043e\u0441\u0438/100\u043c\u043b\u043d \u043f\u0438\u043a\u0441\u0435\u043b\u0435\u0439"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 11
    :cond_39
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041c\u043d\u043e\u0433\u043e\u0441\u0442\u0440\u0430\u043d\u0438\u0447\u043d\u044b\u0435/overview TIFF \u043f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u044b"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 17
    :catch_0
    move-exception v0

    move-object v4, v1

    goto :goto_1c

    .line 9
    :cond_3a
    move-object v4, v1

    move-object/from16 v18, v3

    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u043c\u043d\u043e\u0433\u043e TIFF tags"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_1a
    throw v0

    :cond_3b
    move-object v4, v1

    move-object/from16 v18, v3

    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u0442\u0441\u044f TIFF6; BigTIFF \u043f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_1a

    :cond_3c
    move-object v4, v1

    move-object/from16 v18, v3

    :goto_1b
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0443\u0436\u0435\u043d TIFF \u0441 II/MM \u0437\u0430\u0433\u043e\u043b\u043e\u0432\u043a\u043e\u043c"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_1a

    :cond_3d
    move-object v4, v1

    move-object/from16 v18, v3

    new-instance v0, Ljava/io/IOException;

    const-string v1, "GeoTIFF: \u043f\u0440\u0435\u0434\u0435\u043b \u0444\u0430\u0439\u043b\u0430512\u041c\u0438\u0411"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1a

    .line 17
    :catch_1
    move-exception v0

    goto :goto_1c

    :catch_2
    move-exception v0

    move-object v4, v1

    move-object/from16 v18, v3

    :goto_1c
    invoke-virtual/range {v18 .. v18}, Ljava/io/RandomAccessFile;->close()V

    instance-of v1, v0, Ljava/io/IOException;

    if-eqz v1, :cond_3e

    check-cast v0, Ljava/io/IOException;

    throw v0

    :cond_3e
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u0440\u043e\u0447\u0438\u0442\u0430\u0442\u044c GeoTIFF: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method static synthetic access$000(Lorg/rabochaya/projects/GeoTiffRaster;)[J
    .locals 0

    .line 4
    iget-object p0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->offsets:[J

    return-object p0
.end method

.method static synthetic access$100(Lorg/rabochaya/projects/GeoTiffRaster;)[J
    .locals 0

    .line 4
    iget-object p0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->sizes:[J

    return-object p0
.end method

.method static synthetic access$200(Lorg/rabochaya/projects/GeoTiffRaster;)Ljava/io/RandomAccessFile;
    .locals 0

    .line 4
    iget-object p0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    return-object p0
.end method

.method private decodedSize(I)J
    .locals 4

    .line 30
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tiled:Z

    if-eqz v0, :cond_0

    iget p1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    goto :goto_0

    :cond_0
    iget v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    iget v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    iget v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    mul-int/2addr p1, v2

    sub-int/2addr v1, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    :goto_0
    int-to-long v0, p1

    iget p1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->blockWidth:I

    int-to-long v2, p1

    mul-long/2addr v0, v2

    iget p1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    int-to-long v2, p1

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method private doubles(II)[D
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 24
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;

    if-eqz v0, :cond_3

    iget v1, v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->type:I

    const/16 v2, 0xc

    if-ne v1, v2, :cond_3

    iget v1, v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->count:I

    if-ne v1, p2, :cond_3

    new-array p1, p2, [D

    iget-object v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    iget-wide v2, v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->at:J

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p2, :cond_2

    invoke-direct {p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u32()J

    move-result-wide v1

    invoke-direct {p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u32()J

    move-result-wide v3

    iget-boolean v5, p0, Lorg/rabochaya/projects/GeoTiffRaster;->little:Z

    const/16 v6, 0x20

    if-eqz v5, :cond_0

    shl-long/2addr v3, v6

    goto :goto_1

    :cond_0
    shl-long/2addr v1, v6

    :goto_1
    or-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v1

    aput-wide v1, p1, v0

    aget-wide v1, p1, v0

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-nez v1, :cond_1

    aget-wide v1, p1, v0

    invoke-static {v1, v2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v1

    if-nez v1, :cond_1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u041d\u0435\u0447\u0438\u0441\u043b\u043e\u0432\u0430\u044f \u0433\u0435\u043e\u043f\u0440\u0438\u0432\u044f\u0437\u043a\u0430"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    return-object p1

    :cond_3
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041d\u0443\u0436\u0435\u043d DOUBLE tag "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " \u0438\u0437 "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " \u0437\u043d\u0430\u0447\u0435\u043d\u0438\u0439"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private inflate(I)Ljava/io/InputStream;
    .locals 3

    .line 31
    new-instance v0, Ljava/util/zip/InflaterInputStream;

    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v2, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;

    invoke-direct {v2, p0, p1}, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;-><init>(Lorg/rabochaya/projects/GeoTiffRaster;I)V

    const/16 p1, 0x2000

    invoke-direct {v1, v2, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    invoke-direct {v0, v1}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method

.method private integers(I)[J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 22
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;

    if-eqz v0, :cond_3

    iget v1, v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->count:I

    const/4 v2, 0x1

    if-lt v1, v2, :cond_3

    iget v1, v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->count:I

    const/16 v2, 0x4e20

    if-gt v1, v2, :cond_3

    iget v1, v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->type:I

    const/4 v2, 0x3

    if-eq v1, v2, :cond_0

    iget v1, v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->type:I

    const/4 v3, 0x4

    if-ne v1, v3, :cond_3

    :cond_0
    iget p1, v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->count:I

    new-array v1, p1, [J

    iget-object v3, p0, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    iget-wide v4, v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->at:J

    invoke-virtual {v3, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    const/4 v3, 0x0

    :goto_0
    if-ge v3, p1, :cond_2

    iget v4, v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->type:I

    if-ne v4, v2, :cond_1

    invoke-direct {p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u16()I

    move-result v4

    int-to-long v4, v4

    goto :goto_1

    :cond_1
    invoke-direct {p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u32()J

    move-result-wide v4

    :goto_1
    aput-wide v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return-object v1

    :cond_3
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041d\u0443\u0436\u0435\u043d SHORT/LONG tag "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private keys()Ljava/util/Map;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 26
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    const v1, 0x87af

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;

    if-eqz v0, :cond_7

    iget v0, v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->type:I

    const/4 v2, 0x3

    if-ne v0, v2, :cond_7

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeoTiffRaster;->integers(I)[J

    move-result-object v0

    array-length v1, v0

    const/4 v3, 0x4

    if-lt v1, v3, :cond_6

    const/4 v1, 0x0

    aget-wide v4, v0, v1

    const-wide/16 v6, 0x1

    cmp-long v1, v4, v6

    if-nez v1, :cond_6

    const/4 v1, 0x1

    aget-wide v4, v0, v1

    cmp-long v4, v4, v6

    if-nez v4, :cond_6

    const/4 v4, 0x2

    aget-wide v4, v0, v4

    cmp-long v4, v4, v6

    if-gtz v4, :cond_6

    array-length v4, v0

    int-to-long v4, v4

    aget-wide v6, v0, v2

    const-wide/16 v8, 0x4

    mul-long/2addr v6, v8

    add-long/2addr v6, v8

    cmp-long v4, v4, v6

    if-ltz v4, :cond_6

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    :goto_0
    int-to-long v6, v3

    aget-wide v10, v0, v2

    mul-long/2addr v10, v8

    add-long/2addr v10, v8

    cmp-long v6, v6, v10

    if-gez v6, :cond_5

    aget-wide v6, v0, v3

    long-to-int v6, v6

    add-int/lit8 v7, v3, 0x1

    aget-wide v10, v0, v7

    long-to-int v7, v10

    add-int/lit8 v10, v3, 0x2

    aget-wide v10, v0, v10

    long-to-int v10, v10

    add-int/lit8 v11, v3, 0x3

    aget-wide v11, v0, v11

    long-to-int v11, v11

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-interface {v5, v12}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    if-nez v7, :cond_1

    if-ne v10, v1, :cond_0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 inline GeoKey"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    iget-object v12, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v12, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/rabochaya/projects/GeoTiffRaster$Entry;

    if-eqz v7, :cond_3

    if-lt v10, v1, :cond_3

    iget v7, v7, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->count:I

    sub-int/2addr v7, v10

    if-gt v11, v7, :cond_3

    const/16 v7, 0x400

    if-eq v6, v7, :cond_2

    const/16 v7, 0x401

    if-eq v6, v7, :cond_2

    const/16 v7, 0x800

    if-eq v6, v7, :cond_2

    const/16 v7, 0xc00

    if-eq v6, v7, :cond_2

    const/16 v7, 0x806

    if-eq v6, v7, :cond_2

    const/16 v7, 0xc04

    if-eq v6, v7, :cond_2

    :goto_1
    add-int/lit8 v3, v3, 0x4

    goto :goto_0

    :cond_2
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0414\u043b\u044f CRS \u043d\u0443\u0436\u0435\u043d inline GeoKey"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "GeoKey reference \u0432\u044b\u0445\u043e\u0434\u0438\u0442 \u0437\u0430 tag"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041f\u043e\u0432\u0442\u043e\u0440 GeoKey"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    return-object v4

    :cond_6
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 GeoKeyDirectory"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_7
    new-instance v0, Ljava/io/IOException;

    const-string v1, "GeoKeyDirectory \u0434\u043e\u043b\u0436\u0435\u043d \u0431\u044b\u0442\u044c SHORT"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private range(JJ)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 19
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_0

    cmp-long v0, p3, v0

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->length:J

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    iget-wide v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->length:J

    sub-long/2addr v0, p1

    cmp-long p1, p3, v0

    if-gtz p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string p2, "TIFF offset \u0432\u044b\u0445\u043e\u0434\u0438\u0442 \u0437\u0430 \u0444\u0430\u0439\u043b"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private readNoData()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 27
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    const v1, 0xa481

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;

    if-nez v0, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    iget v1, v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->type:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    iget v1, v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->count:I

    const/4 v2, 0x1

    if-lt v1, v2, :cond_2

    iget v1, v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->count:I

    const/16 v2, 0x20

    if-gt v1, v2, :cond_2

    iget v1, v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->count:I

    new-array v1, v1, [B

    iget-object v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    iget-wide v3, v0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->at:J

    invoke-virtual {v2, v3, v4}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, v1}, Ljava/io/RandomAccessFile;->readFully([B)V

    new-instance v0, Ljava/lang/String;

    const-string v2, "US-ASCII"

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-string v1, "\u0000"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :try_start_0
    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmpg-double v2, v0, v2

    if-ltz v2, :cond_1

    const-wide v2, 0x406fe00000000000L    # 255.0

    cmpl-double v2, v0, v2

    if-gtz v2, :cond_1

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    cmpl-double v2, v0, v2

    if-nez v2, :cond_1

    double-to-int v0, v0

    return v0

    :cond_1
    new-instance v0, Ljava/lang/NumberFormatException;

    invoke-direct {v0}, Ljava/lang/NumberFormatException;-><init>()V

    throw v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0414\u043b\u044f 8-bit raster \u043d\u0443\u0436\u0435\u043d \u0446\u0435\u043b\u044b\u0439 NoData0..255"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 GDAL_NODATA"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readRow(I)[B
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 34
    iget v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->compression:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    iget v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    mul-int/2addr v0, v1

    new-array v0, v0, [B

    iget-object v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    iget-object v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->offsets:[J

    iget v3, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    div-int v3, p1, v3

    aget-wide v3, v2, v3

    iget v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    rem-int v2, p1, v2

    int-to-long v5, v2

    iget v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    int-to-long v7, v2

    mul-long/2addr v5, v7

    iget v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    int-to-long v7, v2

    mul-long/2addr v5, v7

    add-long/2addr v3, v5

    invoke-virtual {v1, v3, v4}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v1, v0}, Ljava/io/RandomAccessFile;->readFully([B)V

    iget-object v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rowCache:Ljava/util/LinkedHashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, p1, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    :cond_0
    iget v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    div-int v0, p1, v0

    iget-object v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->decoder:Ljava/io/DataInputStream;

    if-eqz v2, :cond_1

    iget v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->decodedStrip:I

    if-ne v2, v0, :cond_1

    iget v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->nextRow:I

    if-ge p1, v2, :cond_3

    :cond_1
    iget-object v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->decoder:Ljava/io/DataInputStream;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->decoder:Ljava/io/DataInputStream;

    invoke-virtual {v2}, Ljava/io/DataInputStream;->close()V

    :cond_2
    new-instance v2, Ljava/io/DataInputStream;

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeoTiffRaster;->inflate(I)Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->decoder:Ljava/io/DataInputStream;

    iput v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->decodedStrip:I

    iget v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    mul-int/2addr v0, v2

    :goto_0
    iput v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->nextRow:I

    :cond_3
    iget v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->nextRow:I

    if-gt v0, p1, :cond_5

    iget v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    iget v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    mul-int/2addr v0, v2

    new-array v2, v0, [B

    iget-object v3, p0, Lorg/rabochaya/projects/GeoTiffRaster;->decoder:Ljava/io/DataInputStream;

    invoke-virtual {v3, v2}, Ljava/io/DataInputStream;->readFully([B)V

    iget v3, p0, Lorg/rabochaya/projects/GeoTiffRaster;->predictor:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_4

    iget v3, p0, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    :goto_1
    if-ge v3, v0, :cond_4

    aget-byte v4, v2, v3

    and-int/lit16 v4, v4, 0xff

    iget v5, p0, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    sub-int v5, v3, v5

    aget-byte v5, v2, v5

    and-int/lit16 v5, v5, 0xff

    add-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rowCache:Ljava/util/LinkedHashMap;

    iget v3, p0, Lorg/rabochaya/projects/GeoTiffRaster;->nextRow:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->nextRow:I

    add-int/2addr v0, v1

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rowCache:Ljava/util/LinkedHashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    return-object p1
.end method

.method private scalar(II)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 23
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return p2

    :cond_0
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeoTiffRaster;->integers(I)[J

    move-result-object p2

    array-length v0, p2

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    aget-wide v1, p2, v0

    const-wide/32 v3, 0x7fffffff

    cmp-long v1, v1, v3

    if-gtz v1, :cond_1

    aget-wide p1, p2, v0

    long-to-int p1, p1

    return p1

    :cond_1
    new-instance p2, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u041d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 scalar tag "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method private tile(I)[B
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 36
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tileCache:Ljava/util/LinkedHashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeoTiffRaster;->decodedSize(I)J

    move-result-wide v0

    long-to-int v0, v0

    iget-object v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tileCache:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    iget-object v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tileCache:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    iget-wide v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tileCacheBytes:J

    int-to-long v4, v0

    add-long/2addr v2, v4

    const-wide/32 v4, 0x1000000

    cmp-long v2, v2, v4

    if-gtz v2, :cond_1

    iget-object v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tileCache:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->size()I

    move-result v2

    const/16 v3, 0x80

    if-lt v2, v3, :cond_2

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    iget-wide v3, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tileCacheBytes:J

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    array-length v2, v2

    int-to-long v5, v2

    sub-long/2addr v3, v5

    iput-wide v3, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tileCacheBytes:J

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_2
    new-array v1, v0, [B

    iget v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->compression:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    iget-object v3, p0, Lorg/rabochaya/projects/GeoTiffRaster;->offsets:[J

    aget-wide v4, v3, p1

    invoke-virtual {v2, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v1}, Ljava/io/RandomAccessFile;->readFully([B)V

    goto :goto_1

    :cond_3
    new-instance v2, Ljava/io/DataInputStream;

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeoTiffRaster;->inflate(I)Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    :try_start_0
    invoke-virtual {v2, v1}, Ljava/io/DataInputStream;->readFully([B)V

    invoke-virtual {v2}, Ljava/io/DataInputStream;->read()I

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v4, -0x1

    if-ne v3, v4, :cond_6

    invoke-virtual {v2}, Ljava/io/DataInputStream;->close()V

    :goto_1
    iget v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->predictor:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_5

    const/4 v2, 0x0

    :goto_2
    iget v3, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    if-ge v2, v3, :cond_5

    iget v3, p0, Lorg/rabochaya/projects/GeoTiffRaster;->blockWidth:I

    mul-int/2addr v3, v2

    iget v4, p0, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    mul-int/2addr v3, v4

    iget v4, p0, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    add-int/2addr v3, v4

    :goto_3
    add-int/lit8 v4, v2, 0x1

    iget v5, p0, Lorg/rabochaya/projects/GeoTiffRaster;->blockWidth:I

    mul-int/2addr v5, v4

    iget v6, p0, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    mul-int/2addr v5, v6

    if-ge v3, v5, :cond_4

    aget-byte v4, v1, v3

    and-int/lit16 v4, v4, 0xff

    iget v5, p0, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    sub-int v5, v3, v5

    aget-byte v5, v1, v5

    and-int/lit16 v5, v5, 0xff

    add-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_4
    move v2, v4

    goto :goto_2

    :cond_5
    iget-object v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tileCache:Ljava/util/LinkedHashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v2, p1, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-wide v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tileCacheBytes:J

    int-to-long v4, v0

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tileCacheBytes:J

    return-object v1

    :cond_6
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string v0, "TIFF tile \u043f\u0440\u0435\u0432\u044b\u0448\u0430\u0435\u0442 \u043e\u0431\u044a\u044f\u0432\u043b\u0435\u043d\u043d\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    :try_start_2
    invoke-virtual {v2}, Ljava/io/DataInputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_4

    :catchall_1
    move-exception v0

    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_4
    throw p1
.end method

.method private static typeSize(I)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 18
    packed-switch p0, :pswitch_data_0

    new-instance p0, Ljava/io/IOException;

    const-string v0, "\u041d\u0435\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u043d\u044b\u0439 TIFF type"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_0
    const/16 p0, 0x8

    return p0

    :pswitch_1
    const/4 p0, 0x4

    return p0

    :pswitch_2
    const/4 p0, 0x2

    return p0

    :pswitch_3
    const/4 p0, 0x1

    return p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private u16()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 20
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v0

    iget-object v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v1

    iget-boolean v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->little:Z

    if-eqz v2, :cond_0

    shl-int/lit8 v1, v1, 0x8

    goto :goto_0

    :cond_0
    shl-int/lit8 v0, v0, 0x8

    :goto_0
    or-int/2addr v0, v1

    return v0
.end method

.method private u32()J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 21
    invoke-direct {p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u16()I

    move-result v0

    int-to-long v0, v0

    invoke-direct {p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u16()I

    move-result v2

    int-to-long v2, v2

    iget-boolean v4, p0, Lorg/rabochaya/projects/GeoTiffRaster;->little:Z

    const/16 v5, 0x10

    if-eqz v4, :cond_0

    shl-long/2addr v2, v5

    goto :goto_0

    :cond_0
    shl-long/2addr v0, v5

    :goto_0
    or-long/2addr v0, v2

    return-wide v0
.end method

.method private validateDeflate()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 33
    const/16 v0, 0x4000

    new-array v0, v0, [B

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->offsets:[J

    array-length v2, v2

    if-ge v1, v2, :cond_5

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeoTiffRaster;->decodedSize(I)J

    move-result-wide v2

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeoTiffRaster;->inflate(I)Ljava/io/InputStream;

    move-result-object v4

    const-wide/16 v5, 0x0

    :goto_1
    :try_start_0
    invoke-virtual {v4, v0}, Ljava/io/InputStream;->read([B)I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_1

    int-to-long v7, v7

    add-long/2addr v5, v7

    cmp-long v7, v5, v2

    if-gtz v7, :cond_0

    goto :goto_1

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Deflate strip \u043f\u0440\u0435\u0432\u044b\u0448\u0430\u0435\u0442 \u043e\u0431\u044a\u044f\u0432\u043b\u0435\u043d\u043d\u044b\u0439 raster"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_2
    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    cmp-long v2, v5, v2

    if-nez v2, :cond_3

    if-eqz v4, :cond_2

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    :try_start_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Deflate strip \u043a\u043e\u0440\u043e\u0447\u0435 \u043e\u0431\u044a\u044f\u0432\u043b\u0435\u043d\u043d\u043e\u0433\u043e raster"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    if-eqz v4, :cond_4

    :try_start_2
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception v1

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_4
    :goto_3
    throw v0

    :cond_5
    return-void
.end method

.method private static value(Ljava/util/Map;II)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;II)I"
        }
    .end annotation

    .line 25
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p2

    :goto_0
    return p2
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 40
    :try_start_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rowCache:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tileCache:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tileCacheBytes:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->decoder:Ljava/io/DataInputStream;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->decoder:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_0
    :try_start_2
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_3
    iget-object v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 40
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public color(DD)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 38
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->transform:Lorg/rabochaya/projects/GeoRasterTransform;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/rabochaya/projects/GeoRasterTransform;->cell(DD)J

    move-result-wide p1

    const-wide/16 p3, 0x0

    cmp-long p3, p1, p3

    if-gez p3, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    long-to-int p3, p1

    const/16 p4, 0x20

    ushr-long/2addr p1, p4

    long-to-int p1, p1

    invoke-virtual {p0, p3, p1}, Lorg/rabochaya/projects/GeoTiffRaster;->pixel(II)I

    move-result p1

    :goto_0
    return p1
.end method

.method public modelColor(DD)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 39
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->transform:Lorg/rabochaya/projects/GeoRasterTransform;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/rabochaya/projects/GeoRasterTransform;->cellModel(DD)J

    move-result-wide p1

    const-wide/16 p3, 0x0

    cmp-long p3, p1, p3

    if-gez p3, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    long-to-int p3, p1

    const/16 p4, 0x20

    ushr-long/2addr p1, p4

    long-to-int p1, p1

    invoke-virtual {p0, p3, p1}, Lorg/rabochaya/projects/GeoTiffRaster;->pixel(II)I

    move-result p1

    :goto_0
    return p1
.end method

.method public declared-synchronized pixel(II)I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 37
    const/4 v0, 0x0

    if-ltz p1, :cond_7

    if-ltz p2, :cond_7

    :try_start_0
    iget v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    if-ge p1, v1, :cond_7

    iget v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    if-lt p2, v1, :cond_0

    goto/16 :goto_5

    :cond_0
    iget-boolean v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->tiled:Z

    if-eqz v1, :cond_1

    iget v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    div-int v1, p2, v1

    iget v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->columns:I

    mul-int/2addr v1, v2

    iget v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->blockWidth:I

    div-int v2, p1, v2

    add-int/2addr v1, v2

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeoTiffRaster;->tile(I)[B

    move-result-object v1

    iget v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    rem-int/2addr p2, v2

    iget v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->blockWidth:I

    mul-int/2addr p2, v2

    iget v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->blockWidth:I

    rem-int/2addr p1, v2

    add-int/2addr p2, p1

    iget p1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    mul-int/2addr p2, p1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rowCache:Ljava/util/LinkedHashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    if-nez v1, :cond_2

    invoke-direct {p0, p2}, Lorg/rabochaya/projects/GeoTiffRaster;->readRow(I)[B

    move-result-object p2

    move-object v1, p2

    :cond_2
    iget p2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    mul-int/2addr p2, p1

    :goto_0
    iget p1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->photo:I

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-ne p1, v3, :cond_3

    const/4 p1, 0x3

    goto :goto_1

    :cond_3
    move p1, v2

    :goto_1
    iget v4, p0, Lorg/rabochaya/projects/GeoTiffRaster;->nodata:I

    if-ltz v4, :cond_4

    move v4, v2

    goto :goto_2

    :cond_4
    move v4, v0

    :goto_2
    move v5, v0

    :goto_3
    const/16 v6, 0xff

    if-ge v5, p1, :cond_6

    add-int v7, p2, v5

    aget-byte v7, v1, v7

    and-int/2addr v6, v7

    iget v7, p0, Lorg/rabochaya/projects/GeoTiffRaster;->nodata:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v6, v7, :cond_5

    move v6, v2

    goto :goto_4

    :cond_5
    move v6, v0

    :goto_4
    and-int/2addr v4, v6

    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    :cond_6
    if-eqz v4, :cond_8

    :cond_7
    :goto_5
    monitor-exit p0

    return v0

    :cond_8
    :try_start_1
    aget-byte p1, v1, p2

    and-int/2addr p1, v6

    iget v4, p0, Lorg/rabochaya/projects/GeoTiffRaster;->photo:I

    if-ne v4, v3, :cond_9

    add-int/lit8 v4, p2, 0x1

    aget-byte v4, v1, v4

    and-int/2addr v4, v6

    goto :goto_6

    :cond_9
    move v4, p1

    :goto_6
    iget v5, p0, Lorg/rabochaya/projects/GeoTiffRaster;->photo:I

    if-ne v5, v3, :cond_a

    add-int/lit8 v3, p2, 0x2

    aget-byte v3, v1, v3

    and-int/2addr v3, v6

    goto :goto_7

    :cond_a
    move v3, p1

    :goto_7
    iget v5, p0, Lorg/rabochaya/projects/GeoTiffRaster;->alpha:I

    if-nez v5, :cond_b

    move p2, v6

    goto :goto_8

    :cond_b
    iget v5, p0, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    add-int/2addr p2, v5

    sub-int/2addr p2, v2

    aget-byte p2, v1, p2

    and-int/2addr p2, v6

    :goto_8
    iget v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->photo:I

    if-nez v1, :cond_c

    rsub-int p1, p1, 0xff

    move v3, p1

    move v4, v3

    :cond_c
    iget v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->alpha:I

    if-ne v1, v2, :cond_e

    if-nez p2, :cond_d

    goto :goto_5

    :cond_d
    mul-int/lit16 p1, p1, 0xff

    div-int/lit8 v0, p2, 0x2

    add-int/2addr p1, v0

    div-int/2addr p1, p2

    invoke-static {v6, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    mul-int/lit16 v4, v4, 0xff

    div-int/lit8 v0, p2, 0x2

    add-int/2addr v4, v0

    div-int/2addr v4, p2

    invoke-static {v6, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    mul-int/lit16 v3, v3, 0xff

    div-int/lit8 v0, p2, 0x2

    add-int/2addr v3, v0

    div-int/2addr v3, p2

    invoke-static {v6, v3}, Ljava/lang/Math;->min(II)I

    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_e
    shl-int/lit8 p2, p2, 0x18

    shl-int/lit8 p1, p1, 0x10

    or-int/2addr p1, p2

    shl-int/lit8 p2, v4, 0x8

    or-int/2addr p1, p2

    or-int/2addr p1, v3

    monitor-exit p0

    return p1

    .line 37
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
