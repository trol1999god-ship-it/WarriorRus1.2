.class public final Lorg/rabochaya/projects/BmpRaster;
.super Ljava/lang/Object;
.source "BmpRaster.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/BmpRaster$Tile;
    }
.end annotation


# static fields
.field public static final MAX_FILE:J = 0x20000000L


# instance fields
.field private bytes:J

.field private closed:Z

.field private final file:Ljava/io/RandomAccessFile;

.field public final height:I

.field private final offset:J

.field private final samples:I

.field private final stride:I

.field private final tiles:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/Long;",
            "Lorg/rabochaya/projects/BmpRaster$Tile;",
            ">;"
        }
    .end annotation
.end field

.field private final topDown:Z

.field public final width:I


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 25
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 9
    move-object/from16 v1, p0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 5
    new-instance v0, Ljava/util/LinkedHashMap;

    const/16 v2, 0x10

    const/high16 v3, 0x3f400000    # 0.75f

    const/4 v4, 0x1

    invoke-direct {v0, v2, v3, v4}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, v1, Lorg/rabochaya/projects/BmpRaster;->tiles:Ljava/util/LinkedHashMap;

    .line 10
    new-instance v2, Ljava/io/RandomAccessFile;

    const-string v0, "r"

    move-object/from16 v3, p1

    invoke-direct {v2, v3, v0}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_0
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v5

    const-wide/16 v7, 0x36

    cmp-long v0, v5, v7

    if-ltz v0, :cond_7

    const-wide/32 v9, 0x20000000

    cmp-long v0, v5, v9

    if-gtz v0, :cond_7

    const/16 v0, 0x36

    new-array v0, v0, [B

    invoke-virtual {v2, v0}, Ljava/io/RandomAccessFile;->readFully([B)V

    const/4 v3, 0x0

    aget-byte v9, v0, v3

    const/16 v10, 0x42

    if-ne v9, v10, :cond_6

    aget-byte v9, v0, v4

    const/16 v10, 0x4d

    if-ne v9, v10, :cond_6

    const/4 v9, 0x2

    invoke-static {v0, v9}, Lorg/rabochaya/projects/BmpRaster;->u32([BI)J

    move-result-wide v9

    cmp-long v9, v9, v5

    if-nez v9, :cond_6

    const/4 v9, 0x6

    invoke-static {v0, v9}, Lorg/rabochaya/projects/BmpRaster;->u16([BI)I

    move-result v9

    if-nez v9, :cond_6

    const/16 v9, 0x8

    invoke-static {v0, v9}, Lorg/rabochaya/projects/BmpRaster;->u16([BI)I

    move-result v10

    if-nez v10, :cond_6

    const/16 v10, 0xe

    invoke-static {v0, v10}, Lorg/rabochaya/projects/BmpRaster;->u32([BI)J

    move-result-wide v10

    const-wide/16 v12, 0x28

    cmp-long v10, v10, v12

    if-nez v10, :cond_5

    const/16 v10, 0x1a

    invoke-static {v0, v10}, Lorg/rabochaya/projects/BmpRaster;->u16([BI)I

    move-result v10

    if-ne v10, v4, :cond_5

    const/16 v10, 0x1e

    invoke-static {v0, v10}, Lorg/rabochaya/projects/BmpRaster;->u32([BI)J

    move-result-wide v10

    const-wide/16 v12, 0x0

    cmp-long v10, v10, v12

    if-nez v10, :cond_5

    const/16 v10, 0x2e

    invoke-static {v0, v10}, Lorg/rabochaya/projects/BmpRaster;->u32([BI)J

    move-result-wide v10

    cmp-long v10, v10, v12

    if-nez v10, :cond_5

    const/16 v10, 0x12

    invoke-static {v0, v10}, Lorg/rabochaya/projects/BmpRaster;->u32([BI)J

    move-result-wide v10

    long-to-int v10, v10

    const/16 v11, 0x16

    invoke-static {v0, v11}, Lorg/rabochaya/projects/BmpRaster;->u32([BI)J

    move-result-wide v14

    long-to-int v11, v14

    const/16 v14, 0x1c

    invoke-static {v0, v14}, Lorg/rabochaya/projects/BmpRaster;->u16([BI)I

    move-result v14

    int-to-long v12, v11

    invoke-static {v12, v13}, Ljava/lang/Math;->abs(J)J

    move-result-wide v12

    if-lt v10, v4, :cond_4

    const-wide/16 v17, 0x1

    cmp-long v17, v12, v17

    if-ltz v17, :cond_4

    const/16 v3, 0x4e20

    if-gt v10, v3, :cond_4

    const-wide/16 v17, 0x4e20

    cmp-long v3, v12, v17

    if-gtz v3, :cond_4

    move-wide/from16 v17, v5

    int-to-long v4, v10

    mul-long v19, v4, v12

    const-wide/32 v21, 0x5f5e100

    cmp-long v6, v19, v21

    if-gtz v6, :cond_4

    const/16 v6, 0x18

    if-eq v14, v6, :cond_0

    const/16 v6, 0x20

    if-ne v14, v6, :cond_4

    :cond_0
    move/from16 v19, v10

    int-to-long v9, v14

    mul-long/2addr v4, v9

    const-wide/16 v9, 0x1f

    add-long/2addr v4, v9

    const-wide/16 v9, 0x20

    div-long/2addr v4, v9

    const-wide/16 v9, 0x4

    mul-long/2addr v4, v9

    mul-long v9, v4, v12

    const/16 v3, 0xa

    invoke-static {v0, v3}, Lorg/rabochaya/projects/BmpRaster;->u32([BI)J

    move-result-wide v6

    const/16 v3, 0x22

    invoke-static {v0, v3}, Lorg/rabochaya/projects/BmpRaster;->u32([BI)J

    move-result-wide v23

    const-wide/16 v21, 0x36

    cmp-long v0, v6, v21

    if-ltz v0, :cond_3

    cmp-long v0, v6, v17

    if-gtz v0, :cond_3

    sub-long v21, v17, v6

    cmp-long v0, v9, v21

    if-gtz v0, :cond_3

    add-long v21, v6, v9

    cmp-long v0, v21, v17

    if-nez v0, :cond_3

    const-wide/16 v15, 0x0

    cmp-long v0, v23, v15

    if-eqz v0, :cond_1

    cmp-long v0, v23, v9

    if-nez v0, :cond_3

    :cond_1
    move/from16 v0, v19

    iput v0, v1, Lorg/rabochaya/projects/BmpRaster;->width:I

    long-to-int v0, v12

    iput v0, v1, Lorg/rabochaya/projects/BmpRaster;->height:I

    if-gez v11, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, v1, Lorg/rabochaya/projects/BmpRaster;->topDown:Z

    const/16 v0, 0x8

    div-int/2addr v14, v0

    iput v14, v1, Lorg/rabochaya/projects/BmpRaster;->samples:I

    long-to-int v0, v4

    iput v0, v1, Lorg/rabochaya/projects/BmpRaster;->stride:I

    iput-wide v6, v1, Lorg/rabochaya/projects/BmpRaster;->offset:J

    iput-object v2, v1, Lorg/rabochaya/projects/BmpRaster;->file:Ljava/io/RandomAccessFile;

    .line 11
    return-void

    .line 10
    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v3, "BMP: \u043d\u0435\u0432\u0435\u0440\u043d\u044b\u0435 offset/stride/\u0440\u0430\u0437\u043c\u0435\u0440 \u043f\u0438\u043a\u0441\u0435\u043b\u0435\u0439 \u0438\u043b\u0438 \u043b\u0438\u0448\u043d\u0438\u0435 \u0434\u0430\u043d\u043d\u044b\u0435"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_1
    throw v0

    :cond_4
    new-instance v0, Ljava/io/IOException;

    const-string v3, "BMP: \u043d\u0443\u0436\u043d\u044b 24/32bit, \u0434\u043e 20 000 \u043f\u043e \u0441\u0442\u043e\u0440\u043e\u043d\u0435 / 100 \u043c\u043b\u043d \u043f\u0438\u043a\u0441\u0435\u043b\u0435\u0439"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :cond_5
    new-instance v0, Ljava/io/IOException;

    const-string v3, "BMP: \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d \u0442\u043e\u043b\u044c\u043a\u043e INFOHEADER40 / BI_RGB \u0431\u0435\u0437 \u043f\u0430\u043b\u0438\u0442\u0440\u044b"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :cond_6
    new-instance v0, Ljava/io/IOException;

    const-string v3, "BMP: \u043d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 file header/\u0440\u0430\u0437\u043c\u0435\u0440"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :cond_7
    new-instance v0, Ljava/io/IOException;

    const-string v3, "BMP: \u043f\u0440\u0435\u0434\u0435\u043b 54 \u0431\u0430\u0439\u0442\u0430 \u2014 512 \u041c\u0438\u0411"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    :goto_2
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V

    instance-of v2, v0, Ljava/io/IOException;

    if-eqz v2, :cond_8

    check-cast v0, Ljava/io/IOException;

    throw v0

    :cond_8
    new-instance v2, Ljava/io/IOException;

    const-string v3, "BMP: \u043f\u043e\u0432\u0440\u0435\u0436\u0434\u0451\u043d\u043d\u044b\u0439 \u0437\u0430\u0433\u043e\u043b\u043e\u0432\u043e\u043a"

    invoke-direct {v2, v3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static u16([BI)I
    .locals 1

    .line 8
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 p1, p1, 0x1

    aget-byte p0, p0, p1

    and-int/lit16 p0, p0, 0xff

    shl-int/lit8 p0, p0, 0x8

    or-int/2addr p0, v0

    return p0
.end method

.method private static u32([BI)J
    .locals 7

    .line 7
    aget-byte v0, p0, p1

    int-to-long v0, v0

    const-wide/16 v2, 0xff

    and-long/2addr v0, v2

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x8

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x2

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x10

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 p1, p1, 0x3

    aget-byte p0, p0, p1

    int-to-long p0, p0

    and-long/2addr p0, v2

    const/16 v2, 0x18

    shl-long/2addr p0, v2

    or-long/2addr p0, v0

    return-wide p0
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

    .line 14
    :try_start_0
    iget-boolean v0, p0, Lorg/rabochaya/projects/BmpRaster;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    :goto_0
    monitor-exit p0

    return-void

    :cond_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lorg/rabochaya/projects/BmpRaster;->closed:Z

    iget-object v0, p0, Lorg/rabochaya/projects/BmpRaster;->tiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/rabochaya/projects/BmpRaster;->bytes:J

    iget-object v0, p0, Lorg/rabochaya/projects/BmpRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 14
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized pixel(II)I
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p0

    move/from16 v0, p1

    move/from16 v2, p2

    monitor-enter p0

    .line 13
    :try_start_0
    iget-boolean v3, v1, Lorg/rabochaya/projects/BmpRaster;->closed:Z

    if-nez v3, :cond_8

    if-ltz v0, :cond_7

    if-ltz v2, :cond_7

    iget v4, v1, Lorg/rabochaya/projects/BmpRaster;->width:I

    if-ge v0, v4, :cond_7

    iget v4, v1, Lorg/rabochaya/projects/BmpRaster;->height:I

    if-lt v2, v4, :cond_0

    goto/16 :goto_4

    :cond_0
    div-int/lit16 v4, v0, 0x100

    div-int/lit16 v5, v2, 0x100

    int-to-long v6, v5

    const/16 v8, 0x20

    shl-long/2addr v6, v8

    int-to-long v8, v4

    or-long/2addr v6, v8

    iget-object v8, v1, Lorg/rabochaya/projects/BmpRaster;->tiles:Ljava/util/LinkedHashMap;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/rabochaya/projects/BmpRaster$Tile;

    const/16 v9, 0x100

    if-nez v8, :cond_6

    mul-int/2addr v4, v9

    mul-int/2addr v5, v9

    iget v8, v1, Lorg/rabochaya/projects/BmpRaster;->width:I

    sub-int/2addr v8, v4

    invoke-static {v9, v8}, Ljava/lang/Math;->min(II)I

    move-result v8

    iget v10, v1, Lorg/rabochaya/projects/BmpRaster;->height:I

    sub-int/2addr v10, v5

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v10

    new-instance v11, Lorg/rabochaya/projects/BmpRaster$Tile;

    invoke-direct {v11, v8, v10}, Lorg/rabochaya/projects/BmpRaster$Tile;-><init>(II)V

    iget v12, v1, Lorg/rabochaya/projects/BmpRaster;->samples:I

    mul-int/2addr v12, v8

    new-array v12, v12, [B

    const/4 v13, 0x0

    :goto_0
    if-ge v13, v10, :cond_3

    iget-boolean v14, v1, Lorg/rabochaya/projects/BmpRaster;->topDown:Z

    if-eqz v14, :cond_1

    add-int v14, v5, v13

    goto :goto_1

    :cond_1
    iget v14, v1, Lorg/rabochaya/projects/BmpRaster;->height:I

    add-int/lit8 v14, v14, -0x1

    sub-int/2addr v14, v5

    sub-int/2addr v14, v13

    :goto_1
    iget-object v15, v1, Lorg/rabochaya/projects/BmpRaster;->file:Ljava/io/RandomAccessFile;

    move/from16 v16, v10

    iget-wide v9, v1, Lorg/rabochaya/projects/BmpRaster;->offset:J

    move/from16 v17, v4

    int-to-long v3, v14

    iget v14, v1, Lorg/rabochaya/projects/BmpRaster;->stride:I

    move-wide/from16 v18, v6

    move v7, v5

    int-to-long v5, v14

    mul-long/2addr v3, v5

    add-long/2addr v9, v3

    move/from16 v4, v17

    int-to-long v5, v4

    iget v3, v1, Lorg/rabochaya/projects/BmpRaster;->samples:I

    move/from16 v17, v4

    int-to-long v3, v3

    mul-long/2addr v5, v3

    add-long/2addr v9, v5

    invoke-virtual {v15, v9, v10}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object v3, v1, Lorg/rabochaya/projects/BmpRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v3, v12}, Ljava/io/RandomAccessFile;->readFully([B)V

    const/4 v3, 0x0

    :goto_2
    if-ge v3, v8, :cond_2

    iget v4, v1, Lorg/rabochaya/projects/BmpRaster;->samples:I

    mul-int/2addr v4, v3

    iget-object v5, v11, Lorg/rabochaya/projects/BmpRaster$Tile;->pixels:[I

    mul-int v6, v13, v8

    add-int/2addr v6, v3

    add-int/lit8 v9, v4, 0x2

    aget-byte v9, v12, v9

    and-int/lit16 v9, v9, 0xff

    shl-int/lit8 v9, v9, 0x10

    const/high16 v10, -0x1000000

    or-int/2addr v9, v10

    add-int/lit8 v10, v4, 0x1

    aget-byte v10, v12, v10

    and-int/lit16 v10, v10, 0xff

    shl-int/lit8 v10, v10, 0x8

    or-int/2addr v9, v10

    aget-byte v4, v12, v4

    and-int/lit16 v4, v4, 0xff

    or-int/2addr v4, v9

    aput v4, v5, v6

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_2
    add-int/lit8 v13, v13, 0x1

    move v5, v7

    move/from16 v10, v16

    move/from16 v4, v17

    move-wide/from16 v6, v18

    const/16 v9, 0x100

    goto :goto_0

    :cond_3
    move-wide/from16 v18, v6

    iget-object v3, v11, Lorg/rabochaya/projects/BmpRaster$Tile;->pixels:[I

    array-length v3, v3

    int-to-long v3, v3

    const-wide/16 v5, 0x4

    mul-long/2addr v3, v5

    :goto_3
    iget-object v7, v1, Lorg/rabochaya/projects/BmpRaster;->tiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v7}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_5

    iget-object v7, v1, Lorg/rabochaya/projects/BmpRaster;->tiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v7}, Ljava/util/LinkedHashMap;->size()I

    move-result v7

    const/16 v8, 0x40

    if-ge v7, v8, :cond_4

    iget-wide v7, v1, Lorg/rabochaya/projects/BmpRaster;->bytes:J

    add-long/2addr v7, v3

    const-wide/32 v9, 0x1000000

    cmp-long v7, v7, v9

    if-lez v7, :cond_5

    :cond_4
    iget-object v7, v1, Lorg/rabochaya/projects/BmpRaster;->tiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v7}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map$Entry;

    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/rabochaya/projects/BmpRaster$Tile;

    invoke-interface {v7}, Ljava/util/Iterator;->remove()V

    iget-wide v9, v1, Lorg/rabochaya/projects/BmpRaster;->bytes:J

    iget-object v7, v8, Lorg/rabochaya/projects/BmpRaster$Tile;->pixels:[I

    array-length v7, v7

    int-to-long v7, v7

    mul-long/2addr v7, v5

    sub-long/2addr v9, v7

    iput-wide v9, v1, Lorg/rabochaya/projects/BmpRaster;->bytes:J

    goto :goto_3

    :cond_5
    iget-object v5, v1, Lorg/rabochaya/projects/BmpRaster;->tiles:Ljava/util/LinkedHashMap;

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v5, v6, v11}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-wide v5, v1, Lorg/rabochaya/projects/BmpRaster;->bytes:J

    add-long/2addr v5, v3

    iput-wide v5, v1, Lorg/rabochaya/projects/BmpRaster;->bytes:J

    move-object v8, v11

    :cond_6
    iget-object v3, v8, Lorg/rabochaya/projects/BmpRaster$Tile;->pixels:[I

    const/16 v4, 0x100

    rem-int/2addr v2, v4

    iget v5, v8, Lorg/rabochaya/projects/BmpRaster$Tile;->width:I

    mul-int/2addr v2, v5

    rem-int/2addr v0, v4

    add-int/2addr v2, v0

    aget v0, v3, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :cond_7
    :goto_4
    monitor-exit p0

    const/4 v0, 0x0

    return v0

    :cond_8
    :try_start_1
    new-instance v0, Ljava/io/IOException;

    const-string v2, "BMP reader \u0437\u0430\u043a\u0440\u044b\u0442"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
