.class public final Lorg/rabochaya/projects/GeoTiffRaster;
.super Ljava/lang/Object;
.source "GeoTiffRaster.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/GeoTiffRaster$Entry;
    }
.end annotation


# static fields
.field public static final MAX_FILE:J = 0x20000000L


# instance fields
.field private final alpha:I

.field private final file:Ljava/io/RandomAccessFile;

.field public final height:I

.field private final length:J

.field private final little:Z

.field private final nodata:I

.field private final offsets:[J

.field private final photo:I

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

.field public final transform:Lorg/rabochaya/projects/GeoRasterTransform;

.field public final width:I


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 33
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
    new-instance v0, Lorg/rabochaya/projects/GeoTiffRaster$1;

    const/16 v2, 0x10

    const/high16 v3, 0x3f400000    # 0.75f

    const/4 v4, 0x1

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/rabochaya/projects/GeoTiffRaster$1;-><init>(Lorg/rabochaya/projects/GeoTiffRaster;IFZ)V

    iput-object v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->rowCache:Ljava/util/LinkedHashMap;

    .line 8
    new-instance v2, Ljava/io/RandomAccessFile;

    const-string v0, "r"

    move-object/from16 v3, p1

    invoke-direct {v2, v3, v0}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, v1, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    .line 9
    :try_start_0
    iget-object v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v5

    iput-wide v5, v1, Lorg/rabochaya/projects/GeoTiffRaster;->length:J

    iget-wide v5, v1, Lorg/rabochaya/projects/GeoTiffRaster;->length:J

    const-wide/16 v7, 0x8

    cmp-long v0, v5, v7

    if-ltz v0, :cond_2e

    iget-wide v5, v1, Lorg/rabochaya/projects/GeoTiffRaster;->length:J

    const-wide/32 v9, 0x20000000

    cmp-long v0, v5, v9

    if-gtz v0, :cond_2e

    iget-object v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v0

    iget-object v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v3

    if-ne v0, v3, :cond_2d

    const/16 v3, 0x49

    if-eq v0, v3, :cond_0

    const/16 v5, 0x4d

    if-ne v0, v5, :cond_2d

    :cond_0
    if-ne v0, v3, :cond_1

    move v0, v4

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->little:Z

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u16()I

    move-result v0

    const/16 v3, 0x2a

    if-ne v0, v3, :cond_2c

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u32()J

    move-result-wide v9

    const-wide/16 v11, 0x2

    invoke-direct {v1, v9, v10, v11, v12}, Lorg/rabochaya/projects/GeoTiffRaster;->range(JJ)V

    iget-object v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, v9, v10}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u16()I

    move-result v0

    if-lt v0, v4, :cond_2b

    const/16 v3, 0x100

    if-gt v0, v3, :cond_2b

    add-long/2addr v9, v11

    int-to-long v11, v0

    const-wide/16 v13, 0xc

    mul-long/2addr v11, v13

    const-wide/16 v15, 0x4

    add-long v5, v11, v15

    invoke-direct {v1, v9, v10, v5, v6}, Lorg/rabochaya/projects/GeoTiffRaster;->range(JJ)V

    .line 10
    const/4 v5, 0x0

    :goto_1
    if-ge v5, v0, :cond_5

    iget-object v6, v1, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    int-to-long v3, v5

    mul-long/2addr v3, v13

    add-long/2addr v3, v9

    invoke-virtual {v6, v3, v4}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u16()I

    move-result v6

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u16()I

    move-result v13

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u32()J

    move-result-wide v7

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u32()J

    move-result-wide v22

    invoke-static {v13}, Lorg/rabochaya/projects/GeoTiffRaster;->typeSize(I)I

    move-result v14

    const-wide/32 v24, 0x7fffffff

    cmp-long v24, v7, v24

    if-gtz v24, :cond_4

    move-wide/from16 v24, v9

    int-to-long v9, v14

    mul-long/2addr v9, v7

    cmp-long v14, v9, v15

    if-gtz v14, :cond_2

    const-wide/16 v20, 0x8

    add-long v22, v3, v20

    :cond_2
    move-wide/from16 v3, v22

    invoke-direct {v1, v3, v4, v9, v10}, Lorg/rabochaya/projects/GeoTiffRaster;->range(JJ)V

    iget-object v9, v1, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-instance v10, Lorg/rabochaya/projects/GeoTiffRaster$Entry;

    long-to-int v7, v7

    invoke-direct {v10, v13, v7, v3, v4}, Lorg/rabochaya/projects/GeoTiffRaster$Entry;-><init>(IIJ)V

    invoke-interface {v9, v6, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_3

    add-int/lit8 v5, v5, 0x1

    move-wide/from16 v9, v24

    const/16 v3, 0x100

    const/4 v4, 0x1

    const-wide/16 v7, 0x8

    const-wide/16 v13, 0xc

    goto :goto_1

    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v3, "\u041f\u043e\u0432\u0442\u043e\u0440 TIFF tag"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_2
    throw v0

    :cond_4
    new-instance v0, Ljava/io/IOException;

    const-string v3, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0431\u043e\u043b\u044c\u0448\u043e\u0439 TIFF tag"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    .line 11
    :cond_5
    move-wide/from16 v24, v9

    iget-object v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    add-long v9, v24, v11

    invoke-virtual {v0, v9, v10}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->u32()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v0, v3, v5

    if-nez v0, :cond_2a

    iget-object v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    const/16 v3, 0x14a

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2a

    .line 12
    const/4 v0, -0x1

    const/16 v3, 0x100

    invoke-direct {v1, v3, v0}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v3

    iput v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    const/16 v3, 0x101

    invoke-direct {v1, v3, v0}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v3

    iput v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    iget v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    const/4 v4, 0x1

    if-lt v3, v4, :cond_29

    iget v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    if-lt v3, v4, :cond_29

    iget v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    const/16 v4, 0x4e20

    if-gt v3, v4, :cond_29

    iget v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    if-gt v3, v4, :cond_29

    iget v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    int-to-long v3, v3

    iget v5, v1, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    int-to-long v5, v5

    mul-long/2addr v3, v5

    const-wide/32 v5, 0x5f5e100

    cmp-long v3, v3, v5

    if-gtz v3, :cond_29

    .line 13
    const/16 v3, 0x103

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v3

    if-ne v3, v4, :cond_28

    iget-object v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    const/16 v4, 0x142

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_27

    iget-object v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    const/16 v4, 0x144

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_27

    const/16 v3, 0x112

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v3

    if-ne v3, v4, :cond_26

    const/16 v3, 0x11c

    invoke-direct {v1, v3, v4}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v3

    if-ne v3, v4, :cond_26

    const/16 v3, 0x10a

    invoke-direct {v1, v3, v4}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v3

    if-ne v3, v4, :cond_26

    const/16 v3, 0x13d

    invoke-direct {v1, v3, v4}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v3

    if-ne v3, v4, :cond_26

    iget-object v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    const v4, 0x8773

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_25

    .line 14
    const/16 v3, 0x106

    invoke-direct {v1, v3, v0}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v3

    iput v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->photo:I

    const/16 v3, 0x115

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v3

    iput v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    iget v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->photo:I

    const/4 v4, 0x3

    const/4 v5, 0x2

    if-ne v3, v5, :cond_6

    move v3, v4

    goto :goto_4

    :cond_6
    iget v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->photo:I

    if-eqz v3, :cond_8

    iget v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->photo:I

    const/4 v6, 0x1

    if-ne v3, v6, :cond_7

    goto :goto_3

    :cond_7
    move v3, v0

    goto :goto_4

    :cond_8
    :goto_3
    const/4 v3, 0x1

    :goto_4
    if-ltz v3, :cond_24

    iget v6, v1, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    if-eq v6, v3, :cond_9

    iget v6, v1, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    add-int/lit8 v7, v3, 0x1

    if-ne v6, v7, :cond_24

    :cond_9
    const/16 v6, 0x102

    invoke-direct {v1, v6}, Lorg/rabochaya/projects/GeoTiffRaster;->integers(I)[J

    move-result-object v6

    array-length v7, v6

    iget v8, v1, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    if-ne v7, v8, :cond_23

    array-length v7, v6

    const/4 v8, 0x0

    :goto_5
    if-ge v8, v7, :cond_b

    aget-wide v9, v6, v8

    const-wide/16 v11, 0x8

    cmp-long v9, v9, v11

    if-nez v9, :cond_a

    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    :cond_a
    new-instance v0, Ljava/io/IOException;

    const-string v3, "\u041f\u043e\u043a\u0430 \u043d\u0443\u0436\u043d\u044b 8-bit samples; \u044d\u0442\u043e \u043d\u0435 DEM reader"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_6
    throw v0

    :cond_b
    iget-object v6, v1, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    const/16 v7, 0x153

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v6, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    const-wide/16 v8, 0x1

    if-eqz v6, :cond_d

    invoke-direct {v1, v7}, Lorg/rabochaya/projects/GeoTiffRaster;->integers(I)[J

    move-result-object v6

    array-length v7, v6

    const/4 v10, 0x0

    :goto_7
    if-ge v10, v7, :cond_d

    aget-wide v11, v6, v10

    cmp-long v11, v11, v8

    if-nez v11, :cond_c

    add-int/lit8 v10, v10, 0x1

    goto :goto_7

    :cond_c
    new-instance v0, Ljava/io/IOException;

    const-string v3, "\u041d\u0443\u0436\u043d\u044b unsigned samples"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_6

    .line 15
    :cond_d
    iget v6, v1, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    if-ne v6, v3, :cond_e

    const/4 v0, 0x0

    goto :goto_8

    :cond_e
    const/16 v6, 0x152

    invoke-direct {v1, v6, v0}, Lorg/rabochaya/projects/GeoTiffRaster;->scalar(II)I

    move-result v0

    :goto_8
    iput v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->alpha:I

    iget v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    if-eq v0, v3, :cond_10

    iget v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->alpha:I

    const/4 v3, 0x1

    if-eq v0, v3, :cond_10

    iget v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->alpha:I

    if-ne v0, v5, :cond_f

    goto :goto_a

    :cond_f
    new-instance v0, Ljava/io/IOException;

    const-string v3, "\u041d\u0443\u0436\u0435\u043d \u043e\u0431\u044a\u044f\u0432\u043b\u0435\u043d\u043d\u044b\u0439 alpha sample"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_9
    throw v0

    :cond_10
    :goto_a
    iget-object v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    const/16 v3, 0x116

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v0, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-direct {v1, v3}, Lorg/rabochaya/projects/GeoTiffRaster;->integers(I)[J

    move-result-object v0

    const/4 v3, 0x0

    aget-wide v6, v0, v3

    goto :goto_b

    :cond_11
    iget v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    int-to-long v6, v0

    :goto_b
    cmp-long v0, v6, v8

    if-ltz v0, :cond_22

    iget v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    int-to-long v8, v0

    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    long-to-int v0, v6

    iput v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    const/16 v0, 0x111

    invoke-direct {v1, v0}, Lorg/rabochaya/projects/GeoTiffRaster;->integers(I)[J

    move-result-object v0

    iput-object v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->offsets:[J

    const/16 v0, 0x117

    invoke-direct {v1, v0}, Lorg/rabochaya/projects/GeoTiffRaster;->integers(I)[J

    move-result-object v0

    iget v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    iget v6, v1, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    add-int/2addr v3, v6

    const/4 v6, 0x1

    sub-int/2addr v3, v6

    iget v6, v1, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    div-int/2addr v3, v6

    iget-object v6, v1, Lorg/rabochaya/projects/GeoTiffRaster;->offsets:[J

    array-length v6, v6

    if-ne v6, v3, :cond_21

    array-length v6, v0

    if-ne v6, v3, :cond_21

    const/4 v6, 0x0

    :goto_c
    if-ge v6, v3, :cond_13

    iget v7, v1, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    iget v8, v1, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    iget v9, v1, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    mul-int/2addr v9, v6

    sub-int/2addr v8, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    int-to-long v7, v7

    iget v9, v1, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    int-to-long v9, v9

    mul-long/2addr v7, v9

    iget v9, v1, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    int-to-long v9, v9

    mul-long/2addr v7, v9

    aget-wide v9, v0, v6

    cmp-long v9, v9, v7

    if-nez v9, :cond_12

    iget-object v9, v1, Lorg/rabochaya/projects/GeoTiffRaster;->offsets:[J

    aget-wide v10, v9, v6

    invoke-direct {v1, v10, v11, v7, v8}, Lorg/rabochaya/projects/GeoTiffRaster;->range(JJ)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_c

    :cond_12
    new-instance v0, Ljava/io/IOException;

    const-string v3, "Strip byte count \u043d\u0435 \u0441\u043e\u043e\u0442\u0432\u0435\u0442\u0441\u0442\u0432\u0443\u0435\u0442 raster"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_9

    .line 16
    :cond_13
    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->readNoData()I

    move-result v0

    iput v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->nodata:I

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeoTiffRaster;->keys()Ljava/util/Map;

    move-result-object v0

    const/16 v3, 0x400

    const/4 v6, 0x0

    invoke-static {v0, v3, v6}, Lorg/rabochaya/projects/GeoTiffRaster;->value(Ljava/util/Map;II)I

    move-result v3

    const/4 v7, 0x1

    if-ne v3, v7, :cond_14

    const/16 v7, 0xc00

    invoke-static {v0, v7, v6}, Lorg/rabochaya/projects/GeoTiffRaster;->value(Ljava/util/Map;II)I

    move-result v7

    goto :goto_d

    :cond_14
    if-ne v3, v5, :cond_15

    const/16 v7, 0x800

    invoke-static {v0, v7, v6}, Lorg/rabochaya/projects/GeoTiffRaster;->value(Ljava/util/Map;II)I

    move-result v7

    goto :goto_d

    :cond_15
    const/4 v7, 0x0

    :goto_d
    const/4 v6, 0x1

    if-ne v3, v6, :cond_16

    const/16 v6, 0xf11

    if-eq v7, v6, :cond_17

    :cond_16
    if-ne v3, v5, :cond_20

    const/16 v3, 0x10e6

    if-ne v7, v3, :cond_20

    :cond_17
    const/16 v3, 0x806

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v0, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_18

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v6, 0x238e

    if-ne v3, v6, :cond_19

    :cond_18
    const/16 v3, 0xc04

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v0, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1a

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/16 v6, 0x2329

    if-ne v3, v6, :cond_19

    goto :goto_f

    :cond_19
    new-instance v0, Ljava/io/IOException;

    const-string v3, "\u041a\u043e\u043d\u0444\u043b\u0438\u043a\u0442 \u0435\u0434\u0438\u043d\u0438\u0446 CRS"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_e
    throw v0

    :cond_1a
    :goto_f
    const/16 v3, 0x401

    const/4 v6, 0x1

    invoke-static {v0, v3, v6}, Lorg/rabochaya/projects/GeoTiffRaster;->value(Ljava/util/Map;II)I

    move-result v0

    if-eq v0, v6, :cond_1c

    if-ne v0, v5, :cond_1b

    goto :goto_10

    :cond_1b
    new-instance v0, Ljava/io/IOException;

    const-string v3, "\u041d\u0435\u0438\u0437\u0432\u0435\u0441\u0442\u043d\u044b\u0439 raster type"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_e

    :cond_1c
    :goto_10
    iget-object v3, v1, Lorg/rabochaya/projects/GeoTiffRaster;->tags:Ljava/util/Map;

    const v6, 0x85d8

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1f

    const v3, 0x830e

    invoke-direct {v1, v3, v4}, Lorg/rabochaya/projects/GeoTiffRaster;->doubles(II)[D

    move-result-object v3

    const v6, 0x8482

    const/4 v8, 0x6

    invoke-direct {v1, v6, v8}, Lorg/rabochaya/projects/GeoTiffRaster;->doubles(II)[D

    move-result-object v6

    aget-wide v8, v3, v5

    const-wide/16 v10, 0x0

    cmpl-double v8, v8, v10

    if-nez v8, :cond_1e

    aget-wide v8, v6, v5

    cmpl-double v8, v8, v10

    if-nez v8, :cond_1e

    const/4 v8, 0x5

    aget-wide v8, v6, v8

    cmpl-double v8, v8, v10

    if-nez v8, :cond_1e

    iget v8, v1, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    iget v9, v1, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    if-ne v0, v5, :cond_1d

    const/16 v20, 0x1

    goto :goto_11

    :cond_1d
    const/16 v20, 0x0

    :goto_11
    const/4 v0, 0x0

    aget-wide v21, v3, v0

    const/4 v5, 0x1

    aget-wide v23, v3, v5

    aget-wide v25, v6, v0

    aget-wide v27, v6, v5

    aget-wide v29, v6, v4

    const/4 v0, 0x4

    aget-wide v31, v6, v0

    move/from16 v17, v8

    move/from16 v18, v9

    move/from16 v19, v7

    invoke-static/range {v17 .. v32}, Lorg/rabochaya/projects/GeoRasterTransform;->scale(IIIZDDDDDD)Lorg/rabochaya/projects/GeoRasterTransform;

    move-result-object v0

    iput-object v0, v1, Lorg/rabochaya/projects/GeoTiffRaster;->transform:Lorg/rabochaya/projects/GeoRasterTransform;

    .line 17
    return-void

    .line 16
    :cond_1e
    new-instance v0, Ljava/io/IOException;

    const-string v3, "3D \u0433\u0435\u043e\u043f\u0440\u0438\u0432\u044f\u0437\u043a\u0430 \u043f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u0430"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_e

    :cond_1f
    new-instance v0, Ljava/io/IOException;

    const-string v3, "Matrix/rotation GeoTIFF \u043f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_e

    :cond_20
    new-instance v0, Ljava/io/IOException;

    const-string v3, "\u041f\u043e\u043a\u0430 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u044b \u0442\u043e\u043b\u044c\u043a\u043e \u044f\u0432\u043d\u044b\u0435 EPSG3857/4326"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_e

    .line 15
    :cond_21
    new-instance v0, Ljava/io/IOException;

    const-string v3, "\u041d\u0435\u0432\u0435\u0440\u043d\u043e\u0435 \u0447\u0438\u0441\u043b\u043e strips"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_9

    :cond_22
    new-instance v0, Ljava/io/IOException;

    const-string v3, "\u041d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 RowsPerStrip"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_9

    .line 14
    :cond_23
    new-instance v0, Ljava/io/IOException;

    const-string v3, "\u041d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 BitsPerSample"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_6

    :cond_24
    new-instance v0, Ljava/io/IOException;

    const-string v3, "\u041d\u0443\u0436\u0435\u043d RGB/gray raster, palette/DEM \u043f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u044b"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto/16 :goto_6

    .line 13
    :cond_25
    new-instance v0, Ljava/io/IOException;

    const-string v3, "ICC-\u043f\u0440\u043e\u0444\u0438\u043b\u0438 \u043f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u044b"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_12
    throw v0

    :cond_26
    new-instance v0, Ljava/io/IOException;

    const-string v3, "\u041d\u0435\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u043d\u0430\u044f orientation/planar/fill/predictor \u0441\u0445\u0435\u043c\u0430"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_12

    :cond_27
    new-instance v0, Ljava/io/IOException;

    const-string v3, "Tiled GeoTIFF \u043f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d; \u043d\u0443\u0436\u043d\u044b strips"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_12

    :cond_28
    new-instance v0, Ljava/io/IOException;

    const-string v3, "\u041f\u043e\u043a\u0430 \u043d\u0443\u0436\u0435\u043d uncompressed GeoTIFF (Compression=1)"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_12

    .line 12
    :cond_29
    new-instance v0, Ljava/io/IOException;

    const-string v3, "GeoTIFF: \u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u043e \u0434\u043e20000 \u043f\u043e \u043e\u0441\u0438/100\u043c\u043b\u043d \u043f\u0438\u043a\u0441\u0435\u043b\u0435\u0439"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 11
    :cond_2a
    new-instance v0, Ljava/io/IOException;

    const-string v3, "\u041c\u043d\u043e\u0433\u043e\u0441\u0442\u0440\u0430\u043d\u0438\u0447\u043d\u044b\u0435/overview TIFF \u043f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u044b"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 9
    :cond_2b
    new-instance v0, Ljava/io/IOException;

    const-string v3, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u043c\u043d\u043e\u0433\u043e TIFF tags"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_13
    throw v0

    :cond_2c
    new-instance v0, Ljava/io/IOException;

    const-string v3, "\u041f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u0442\u0441\u044f TIFF6; BigTIFF \u043f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_13

    :cond_2d
    new-instance v0, Ljava/io/IOException;

    const-string v3, "\u041d\u0443\u0436\u0435\u043d TIFF \u0441 II/MM \u0437\u0430\u0433\u043e\u043b\u043e\u0432\u043a\u043e\u043c"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_13

    :cond_2e
    new-instance v0, Ljava/io/IOException;

    const-string v3, "GeoTIFF: \u043f\u0440\u0435\u0434\u0435\u043b \u0444\u0430\u0439\u043b\u0430512\u041c\u0438\u0411"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_13

    .line 17
    :catch_0
    move-exception v0

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V

    instance-of v2, v0, Ljava/io/IOException;

    if-eqz v2, :cond_2f

    check-cast v0, Ljava/io/IOException;

    throw v0

    :cond_2f
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u0440\u043e\u0447\u0438\u0442\u0430\u0442\u044c GeoTIFF: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
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
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 31
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rowCache:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    return-void
.end method

.method public color(DD)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 29
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

    .line 30
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
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 28
    const/4 v0, 0x0

    if-ltz p1, :cond_6

    if-ltz p2, :cond_6

    :try_start_0
    iget v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    if-ge p1, v1, :cond_6

    iget v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->height:I

    if-lt p2, v1, :cond_0

    goto/16 :goto_4

    :cond_0
    iget-object v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rowCache:Ljava/util/LinkedHashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    if-nez v1, :cond_1

    iget v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    iget v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    mul-int/2addr v1, v2

    new-array v1, v1, [B

    iget-object v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    iget-object v3, p0, Lorg/rabochaya/projects/GeoTiffRaster;->offsets:[J

    iget v4, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    div-int v4, p2, v4

    aget-wide v4, v3, v4

    iget v3, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rows:I

    rem-int v3, p2, v3

    int-to-long v6, v3

    iget v3, p0, Lorg/rabochaya/projects/GeoTiffRaster;->width:I

    int-to-long v8, v3

    mul-long/2addr v6, v8

    iget v3, p0, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    int-to-long v8, v3

    mul-long/2addr v6, v8

    add-long/2addr v4, v6

    invoke-virtual {v2, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v2, v1}, Ljava/io/RandomAccessFile;->readFully([B)V

    iget-object v2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->rowCache:Ljava/util/LinkedHashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v2, p2, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    iget p2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    mul-int/2addr p1, p2

    iget p2, p0, Lorg/rabochaya/projects/GeoTiffRaster;->photo:I

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-ne p2, v3, :cond_2

    const/4 p2, 0x3

    goto :goto_0

    :cond_2
    move p2, v2

    :goto_0
    iget v4, p0, Lorg/rabochaya/projects/GeoTiffRaster;->nodata:I

    if-ltz v4, :cond_3

    move v4, v2

    goto :goto_1

    :cond_3
    move v4, v0

    :goto_1
    move v5, v0

    :goto_2
    const/16 v6, 0xff

    if-ge v5, p2, :cond_5

    add-int v7, p1, v5

    aget-byte v7, v1, v7

    and-int/2addr v6, v7

    iget v7, p0, Lorg/rabochaya/projects/GeoTiffRaster;->nodata:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v6, v7, :cond_4

    move v6, v2

    goto :goto_3

    :cond_4
    move v6, v0

    :goto_3
    and-int/2addr v4, v6

    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_5
    if-eqz v4, :cond_7

    :cond_6
    :goto_4
    monitor-exit p0

    return v0

    :cond_7
    :try_start_1
    aget-byte p2, v1, p1

    and-int/2addr p2, v6

    iget v4, p0, Lorg/rabochaya/projects/GeoTiffRaster;->photo:I

    if-ne v4, v3, :cond_8

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, v1, v4

    and-int/2addr v4, v6

    goto :goto_5

    :cond_8
    move v4, p2

    :goto_5
    iget v5, p0, Lorg/rabochaya/projects/GeoTiffRaster;->photo:I

    if-ne v5, v3, :cond_9

    add-int/lit8 v3, p1, 0x2

    aget-byte v3, v1, v3

    and-int/2addr v3, v6

    goto :goto_6

    :cond_9
    move v3, p2

    :goto_6
    iget v5, p0, Lorg/rabochaya/projects/GeoTiffRaster;->alpha:I

    if-nez v5, :cond_a

    move p1, v6

    goto :goto_7

    :cond_a
    iget v5, p0, Lorg/rabochaya/projects/GeoTiffRaster;->samples:I

    add-int/2addr p1, v5

    sub-int/2addr p1, v2

    aget-byte p1, v1, p1

    and-int/2addr p1, v6

    :goto_7
    iget v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->photo:I

    if-nez v1, :cond_b

    rsub-int p2, p2, 0xff

    move v3, p2

    move v4, v3

    :cond_b
    iget v1, p0, Lorg/rabochaya/projects/GeoTiffRaster;->alpha:I

    if-ne v1, v2, :cond_d

    if-nez p1, :cond_c

    goto :goto_4

    :cond_c
    mul-int/lit16 p2, p2, 0xff

    div-int/lit8 v0, p1, 0x2

    add-int/2addr p2, v0

    div-int/2addr p2, p1

    invoke-static {v6, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    mul-int/lit16 v4, v4, 0xff

    div-int/lit8 v0, p1, 0x2

    add-int/2addr v4, v0

    div-int/2addr v4, p1

    invoke-static {v6, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    mul-int/lit16 v3, v3, 0xff

    div-int/lit8 v0, p1, 0x2

    add-int/2addr v3, v0

    div-int/2addr v3, p1

    invoke-static {v6, v3}, Ljava/lang/Math;->min(II)I

    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_d
    shl-int/lit8 p1, p1, 0x18

    shl-int/lit8 p2, p2, 0x10

    or-int/2addr p1, p2

    shl-int/lit8 p2, v4, 0x8

    or-int/2addr p1, p2

    or-int/2addr p1, v3

    monitor-exit p0

    return p1

    .line 28
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
