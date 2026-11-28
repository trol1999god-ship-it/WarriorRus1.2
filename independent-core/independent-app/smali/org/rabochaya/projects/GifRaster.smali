.class public final Lorg/rabochaya/projects/GifRaster;
.super Ljava/lang/Object;
.source "GifRaster.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/GifRaster$Bits;
    }
.end annotation


# static fields
.field public static final MAX_DECODE_MILLIS:J = 0x3a98L

.field public static final MAX_FILE:J = 0x1000000L

.field public static final MAX_PIXELS:J = 0x3d0900L


# instance fields
.field private closed:Z

.field private colors:[I

.field public final height:I

.field public final interlaced:Z

.field public final palette:I

.field private pixels:[B

.field public final transparent:Z

.field public final version:Ljava/lang/String;

.field public final width:I


# direct methods
.method private constructor <init>(II[I[BZZLjava/lang/String;)V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lorg/rabochaya/projects/GifRaster;->width:I

    iput p2, p0, Lorg/rabochaya/projects/GifRaster;->height:I

    array-length p1, p3

    iput p1, p0, Lorg/rabochaya/projects/GifRaster;->palette:I

    iput-object p3, p0, Lorg/rabochaya/projects/GifRaster;->colors:[I

    iput-object p4, p0, Lorg/rabochaya/projects/GifRaster;->pixels:[B

    iput-boolean p5, p0, Lorg/rabochaya/projects/GifRaster;->interlaced:Z

    iput-boolean p6, p0, Lorg/rabochaya/projects/GifRaster;->transparent:Z

    iput-object p7, p0, Lorg/rabochaya/projects/GifRaster;->version:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(J)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 4
    invoke-static {p0, p1}, Lorg/rabochaya/projects/GifRaster;->check(J)V

    return-void
.end method

.method static synthetic access$100(Ljava/lang/String;)Ljava/io/IOException;
    .locals 0

    .line 4
    invoke-static {p0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Ljava/io/RandomAccessFile;J[IJ)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 4
    invoke-static/range {p0 .. p5}, Lorg/rabochaya/projects/GifRaster;->blocks(Ljava/io/RandomAccessFile;J[IJ)I

    move-result p0

    return p0
.end method

.method private static bad(Ljava/lang/String;)Ljava/io/IOException;
    .locals 3

    .line 7
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "GIF: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private static blocks(Ljava/io/RandomAccessFile;J[IJ)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 11
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-static {p4, p5}, Lorg/rabochaya/projects/GifRaster;->check(J)V

    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v2

    if-nez v2, :cond_0

    return v1

    :cond_0
    aget v3, p3, v0

    add-int/lit8 v3, v3, 0x1

    aput v3, p3, v0

    const/high16 v4, 0x10000

    if-gt v3, v4, :cond_1

    invoke-static {p0, p1, p2, v2}, Lorg/rabochaya/projects/GifRaster;->skip(Ljava/io/RandomAccessFile;JI)V

    add-int/2addr v1, v2

    goto :goto_0

    :cond_1
    const-string p0, "\u0431\u043e\u043b\u044c\u0448\u0435 65 536 subblocks"

    invoke-static {p0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method private static check(J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    sub-long/2addr v0, p0

    const-wide/16 p0, 0x0

    cmp-long p0, v0, p0

    if-gez p0, :cond_0

    return-void

    :cond_0
    const-string p0, "\u043f\u0440\u0435\u0432\u044b\u0448\u0435\u043d \u043b\u0438\u043c\u0438\u0442 \u0432\u0440\u0435\u043c\u0435\u043d\u0438 \u0434\u0435\u043a\u043e\u0434\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u044f"

    invoke-static {p0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    :cond_1
    const-string p0, "\u0447\u0442\u0435\u043d\u0438\u0435 \u043f\u0440\u0435\u0440\u0432\u0430\u043d\u043e"

    invoke-static {p0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method private static decode(Ljava/io/RandomAccessFile;J[IIIIIZJ)[B
    .locals 27
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 20
    move/from16 v0, p4

    move/from16 v1, p6

    move/from16 v2, p7

    const/4 v3, 0x2

    if-lt v0, v3, :cond_16

    const/16 v4, 0x8

    if-gt v0, v4, :cond_16

    mul-int v5, p5, v1

    const/4 v6, 0x1

    shl-int v7, v6, v0

    add-int/lit8 v8, v7, 0x1

    add-int/lit8 v9, v7, 0x2

    add-int/2addr v0, v6

    new-array v10, v5, [B

    const/16 v11, 0x1000

    new-array v12, v11, [B

    new-array v13, v11, [B

    new-array v14, v11, [S

    const/4 v15, 0x0

    move v11, v15

    :goto_0
    if-ge v11, v7, :cond_0

    int-to-byte v4, v11

    aput-byte v4, v12, v11

    add-int/lit8 v11, v11, 0x1

    const/16 v4, 0x8

    goto :goto_0

    :cond_0
    new-array v4, v1, [I

    if-eqz p8, :cond_2

    const/4 v11, 0x4

    filled-new-array {v15, v11, v3, v6}, [I

    move-result-object v17

    const/16 v6, 0x8

    filled-new-array {v6, v6, v11, v3}, [I

    move-result-object v3

    move v6, v15

    move/from16 v16, v6

    :goto_1
    if-ge v6, v11, :cond_3

    aget v18, v17, v6

    move/from16 v11, v18

    :goto_2
    if-ge v11, v1, :cond_1

    add-int/lit8 v18, v16, 0x1

    aput v11, v4, v16

    aget v16, v3, v6

    add-int v11, v11, v16

    move/from16 v16, v18

    goto :goto_2

    :cond_1
    add-int/lit8 v6, v6, 0x1

    const/4 v11, 0x4

    goto :goto_1

    :cond_2
    move v3, v15

    :goto_3
    if-ge v3, v1, :cond_3

    aput v3, v4, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_3
    new-instance v1, Lorg/rabochaya/projects/GifRaster$Bits;

    move-object/from16 v18, v1

    move-object/from16 v19, p0

    move-wide/from16 v20, p1

    move-object/from16 v22, p3

    move-wide/from16 v23, p9

    invoke-direct/range {v18 .. v24}, Lorg/rabochaya/projects/GifRaster$Bits;-><init>(Ljava/io/RandomAccessFile;J[IJ)V

    invoke-virtual {v1, v0}, Lorg/rabochaya/projects/GifRaster$Bits;->code(I)I

    move-result v3

    if-ne v3, v7, :cond_15

    .line 21
    const-wide/16 v16, 0x0

    move v6, v0

    move/from16 v21, v6

    move v11, v9

    move v0, v15

    move v3, v0

    move-wide/from16 v18, v16

    const/4 v15, -0x1

    :goto_4
    const-wide/16 v22, 0x2

    move-object/from16 v24, v12

    move-object/from16 v25, v13

    int-to-long v12, v5

    mul-long v12, v12, v22

    const-wide/16 v22, 0x400

    add-long v12, v12, v22

    cmp-long v12, v18, v12

    if-gtz v12, :cond_14

    const-wide/16 v12, 0x3ff

    and-long v12, v18, v12

    cmp-long v12, v12, v16

    if-nez v12, :cond_4

    invoke-static/range {p9 .. p10}, Lorg/rabochaya/projects/GifRaster;->check(J)V

    :cond_4
    invoke-virtual {v1, v6}, Lorg/rabochaya/projects/GifRaster$Bits;->code(I)I

    move-result v12

    if-ne v12, v7, :cond_5

    move/from16 v22, v0

    move-object/from16 p6, v1

    move v11, v9

    move/from16 v6, v21

    const/16 v0, 0x1000

    const/4 v1, 0x1

    const/4 v15, -0x1

    goto/16 :goto_8

    :cond_5
    if-ne v12, v8, :cond_7

    if-ne v3, v5, :cond_6

    invoke-virtual {v1}, Lorg/rabochaya/projects/GifRaster$Bits;->finish()V

    return-object v10

    :cond_6
    const-string v0, "LZW pixel count \u043d\u0435 \u0441\u043e\u0432\u043f\u0430\u0434\u0430\u0435\u0442"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :cond_7
    if-ne v12, v11, :cond_9

    if-ltz v15, :cond_8

    const/16 v13, 0x1000

    if-ge v11, v13, :cond_8

    int-to-byte v0, v0

    const/4 v13, 0x0

    aput-byte v0, v25, v13

    move v0, v15

    const/4 v13, 0x1

    goto :goto_5

    :cond_8
    const-string v0, "\u043d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 \u043f\u0435\u0440\u0432\u044b\u0439/\u043d\u043e\u0432\u044b\u0439 LZW code"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :cond_9
    const/4 v13, 0x0

    if-ge v12, v11, :cond_13

    move v0, v12

    :goto_5
    if-lt v0, v7, :cond_b

    if-lt v0, v9, :cond_a

    if-ge v0, v11, :cond_a

    move-object/from16 p6, v1

    const/16 v1, 0xfff

    if-ge v13, v1, :cond_a

    add-int/lit8 v1, v13, 0x1

    aget-byte v22, v24, v0

    aput-byte v22, v25, v13

    aget-short v0, v14, v0

    const v13, 0xffff

    and-int/2addr v0, v13

    move v13, v1

    move-object/from16 v1, p6

    goto :goto_5

    :cond_a
    const-string v0, "\u043f\u043e\u0432\u0440\u0435\u0436\u0434\u0451\u043d\u043d\u044b\u0439 LZW \u0441\u043b\u043e\u0432\u0430\u0440\u044c"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :cond_b
    move-object/from16 p6, v1

    if-ge v0, v2, :cond_12

    add-int/lit8 v1, v13, 0x1

    move/from16 p1, v1

    int-to-byte v1, v0

    aput-byte v1, v25, v13

    move v13, v3

    move/from16 v3, p1

    :goto_6
    if-lez v3, :cond_e

    move/from16 v22, v0

    and-int/lit16 v0, v13, 0xfff

    if-nez v0, :cond_c

    invoke-static/range {p9 .. p10}, Lorg/rabochaya/projects/GifRaster;->check(J)V

    :cond_c
    add-int/lit8 v3, v3, -0x1

    aget-byte v0, v25, v3

    and-int/lit16 v0, v0, 0xff

    if-ge v0, v2, :cond_d

    if-ge v13, v5, :cond_d

    div-int v23, v13, p5

    aget v23, v4, v23

    mul-int v23, v23, p5

    rem-int v26, v13, p5

    add-int v23, v23, v26

    int-to-byte v0, v0

    aput-byte v0, v10, v23

    add-int/lit8 v13, v13, 0x1

    move/from16 v0, v22

    goto :goto_6

    :cond_d
    const-string v0, "LZW index/pixel count \u0432\u043d\u0435 \u0433\u0440\u0430\u043d\u0438\u0446"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :cond_e
    move/from16 v22, v0

    if-ltz v15, :cond_f

    const/16 v0, 0x1000

    if-ge v11, v0, :cond_10

    int-to-short v3, v15

    aput-short v3, v14, v11

    aput-byte v1, v24, v11

    add-int/lit8 v11, v11, 0x1

    const/4 v1, 0x1

    shl-int v3, v1, v6

    if-ne v11, v3, :cond_11

    const/16 v3, 0xc

    if-ge v6, v3, :cond_11

    add-int/lit8 v6, v6, 0x1

    goto :goto_7

    :cond_f
    const/16 v0, 0x1000

    :cond_10
    const/4 v1, 0x1

    :cond_11
    :goto_7
    move v15, v12

    move v3, v13

    :goto_8
    const-wide/16 v12, 0x1

    add-long v18, v18, v12

    move-object/from16 v1, p6

    move/from16 v0, v22

    move-object/from16 v12, v24

    move-object/from16 v13, v25

    goto/16 :goto_4

    :cond_12
    const-string v0, "LZW index \u0432\u043d\u0435 \u043f\u0430\u043b\u0438\u0442\u0440\u044b"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :cond_13
    const-string v0, "LZW code \u0432\u043d\u0435 \u0441\u043b\u043e\u0432\u0430\u0440\u044f"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 22
    :cond_14
    const-string v0, "\u0441\u043b\u0438\u0448\u043a\u043e\u043c \u043c\u043d\u043e\u0433\u043e LZW codes"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 20
    :cond_15
    const-string v0, "\u043f\u0435\u0440\u0432\u044b\u0439 LZW code \u0434\u043e\u043b\u0436\u0435\u043d \u0431\u044b\u0442\u044c CLEAR"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :cond_16
    const-string v0, "\u043d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 LZW code size"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0
.end method

.method private static palette(Ljava/io/RandomAccessFile;I)[I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 12
    new-array v0, p1, [I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p1, :cond_0

    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v2

    shl-int/lit8 v2, v2, 0x10

    const/high16 v3, -0x1000000

    or-int/2addr v2, v3

    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v3

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v2, v3

    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v3

    or-int/2addr v2, v3

    aput v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static read(Ljava/io/File;)Lorg/rabochaya/projects/GifRaster;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 24
    const-wide/16 v0, 0x3a98

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/GifRaster;->read(Ljava/io/File;J)Lorg/rabochaya/projects/GifRaster;

    move-result-object p0

    return-object p0
.end method

.method static read(Ljava/io/File;J)Lorg/rabochaya/projects/GifRaster;
    .locals 30
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 25
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_17

    const-wide/16 v0, 0x3a98

    cmp-long v0, p1, v0

    if-gtz v0, :cond_17

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    const-wide/32 v2, 0xf4240

    mul-long v2, v2, p1

    add-long/2addr v0, v2

    invoke-static {v0, v1}, Lorg/rabochaya/projects/GifRaster;->check(J)V

    :try_start_0
    new-instance v2, Ljava/io/RandomAccessFile;

    const-string v3, "r"

    move-object/from16 v4, p0

    invoke-direct {v2, v4, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v15

    const-wide/16 v3, 0xe

    cmp-long v3, v15, v3

    if-ltz v3, :cond_16

    const-wide/32 v3, 0x1000000

    cmp-long v3, v15, v3

    if-gtz v3, :cond_16

    const/4 v3, 0x6

    new-array v3, v3, [B

    invoke-virtual {v2, v3}, Ljava/io/RandomAccessFile;->readFully([B)V

    new-instance v13, Ljava/lang/String;

    sget-object v4, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v13, v3, v4}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    const-string v3, "GIF87a"

    invoke-virtual {v13, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string v14, "GIF89a"

    if-nez v3, :cond_1

    :try_start_2
    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    :cond_0
    const-string v0, "\u043d\u0443\u0436\u0435\u043d GIF87a/89a"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    :goto_0
    throw v0

    :cond_1
    :goto_1
    invoke-static {v2}, Lorg/rabochaya/projects/GifRaster;->u16(Ljava/io/RandomAccessFile;)I

    move-result v3

    invoke-static {v2}, Lorg/rabochaya/projects/GifRaster;->u16(Ljava/io/RandomAccessFile;)I

    move-result v12

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v4

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v5

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v6

    const/4 v11, 0x1

    if-lt v3, v11, :cond_15

    if-lt v12, v11, :cond_15

    const/16 v7, 0x4e20

    if-gt v3, v7, :cond_15

    if-gt v12, v7, :cond_15

    int-to-long v7, v3

    int-to-long v9, v12

    mul-long/2addr v7, v9

    const-wide/32 v9, 0x3d0900

    cmp-long v7, v7, v9

    if-gtz v7, :cond_15

    if-nez v6, :cond_15

    and-int/lit16 v6, v4, 0x80

    const/16 v17, 0x0

    if-eqz v6, :cond_2

    and-int/lit8 v4, v4, 0x7

    add-int/2addr v4, v11

    shl-int v4, v11, v4

    goto :goto_2

    :cond_2
    move/from16 v4, v17

    :goto_2
    const/4 v6, 0x0

    if-lez v4, :cond_4

    if-ge v5, v4, :cond_3

    invoke-static {v2, v4}, Lorg/rabochaya/projects/GifRaster;->palette(Ljava/io/RandomAccessFile;I)[I

    move-result-object v4

    move-object/from16 v18, v4

    goto :goto_3

    :cond_3
    const-string v0, "\u043d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 background index"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    goto :goto_0

    :cond_4
    move-object/from16 v18, v6

    :goto_3
    filled-new-array/range {v17 .. v17}, [I

    move-result-object v19

    .line 26
    move-object v10, v6

    move-object/from16 v20, v10

    move/from16 v8, v17

    move v9, v8

    move/from16 v21, v9

    move/from16 v22, v21

    move/from16 v23, v22

    move/from16 v24, v23

    :goto_4
    const/16 v4, 0x400

    if-ge v8, v4, :cond_14

    invoke-static {v0, v1}, Lorg/rabochaya/projects/GifRaster;->check(J)V

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v4

    const/16 v5, 0x3b

    if-ne v4, v5, :cond_6

    if-eqz v23, :cond_5

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v0

    cmp-long v0, v0, v15

    if-nez v0, :cond_5

    new-instance v0, Lorg/rabochaya/projects/GifRaster;

    move-object v4, v0

    move v5, v3

    move v6, v12

    move-object v7, v10

    move-object/from16 v8, v20

    move/from16 v9, v21

    move/from16 v10, v22

    move-object v11, v13

    invoke-direct/range {v4 .. v11}, Lorg/rabochaya/projects/GifRaster;-><init>(II[I[BZZLjava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 30
    :try_start_3
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V
    :try_end_3
    .catch Ljava/io/EOFException; {:try_start_3 .. :try_end_3} :catch_0

    .line 26
    return-object v0

    :cond_5
    :try_start_4
    const-string v0, "\u043d\u0435\u0442 \u043f\u043e\u043b\u043d\u043e\u0433\u043e \u043a\u0430\u0434\u0440\u0430/\u043b\u0438\u0448\u043d\u0438\u0435 \u0434\u0430\u043d\u043d\u044b\u0435"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 27
    :cond_6
    const/16 v5, 0x21

    if-ne v4, v5, :cond_c

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v4

    const/16 v5, 0xfe

    if-ne v4, v5, :cond_7

    move-object v4, v2

    move-wide v5, v15

    move-object/from16 v7, v19

    move/from16 v26, v8

    move/from16 v25, v9

    move-wide v8, v0

    invoke-static/range {v4 .. v9}, Lorg/rabochaya/projects/GifRaster;->blocks(Ljava/io/RandomAccessFile;J[IJ)I

    move/from16 v27, v11

    move-object/from16 v28, v13

    move-object/from16 v29, v14

    move-object/from16 v4, v20

    move/from16 v9, v25

    :goto_5
    move/from16 v20, v12

    goto/16 :goto_c

    :cond_7
    move/from16 v26, v8

    const/16 v5, 0xf9

    if-ne v4, v5, :cond_a

    if-nez v23, :cond_a

    if-nez v24, :cond_a

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v4

    const/4 v5, 0x4

    if-ne v4, v5, :cond_a

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v4

    invoke-static {v2}, Lorg/rabochaya/projects/GifRaster;->u16(Ljava/io/RandomAccessFile;)I

    move-result v5

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v9

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v6

    if-nez v6, :cond_9

    and-int/lit16 v6, v4, 0xe2

    if-nez v6, :cond_9

    shr-int/lit8 v6, v4, 0x2

    and-int/lit8 v6, v6, 0x7

    if-gt v6, v11, :cond_9

    if-nez v5, :cond_9

    and-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_8

    move/from16 v22, v11

    goto :goto_6

    :cond_8
    move/from16 v22, v17

    :goto_6
    move/from16 v24, v11

    move/from16 v27, v24

    move-object/from16 v28, v13

    move-object/from16 v29, v14

    move-object/from16 v4, v20

    goto :goto_5

    :cond_9
    const-string v0, "\u0430\u043d\u0438\u043c\u0430\u0446\u0438\u044f/user input/disposal/reserved flags \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u044b"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    :goto_7
    throw v0

    :cond_a
    const-string v0, "\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d \u043e\u0434\u0438\u043d \u0441\u0442\u0430\u0442\u0438\u0447\u0435\u0441\u043a\u0438\u0439 \u043a\u0430\u0434\u0440, \u0431\u0435\u0437 application/plaintext/\u043f\u043e\u0432\u0442\u043e\u0440\u043d\u044b\u0445 GCE"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    goto :goto_7

    :cond_b
    const-string v0, "\u0440\u0430\u0441\u0448\u0438\u0440\u0435\u043d\u0438\u044f \u0442\u0440\u0435\u0431\u0443\u044e\u0442 GIF89a"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    goto :goto_7

    .line 28
    :cond_c
    move/from16 v26, v8

    move/from16 v25, v9

    const/16 v5, 0x2c

    if-ne v4, v5, :cond_13

    if-nez v23, :cond_13

    invoke-static {v2}, Lorg/rabochaya/projects/GifRaster;->u16(Ljava/io/RandomAccessFile;)I

    move-result v4

    invoke-static {v2}, Lorg/rabochaya/projects/GifRaster;->u16(Ljava/io/RandomAccessFile;)I

    move-result v5

    invoke-static {v2}, Lorg/rabochaya/projects/GifRaster;->u16(Ljava/io/RandomAccessFile;)I

    move-result v6

    invoke-static {v2}, Lorg/rabochaya/projects/GifRaster;->u16(Ljava/io/RandomAccessFile;)I

    move-result v7

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v8

    if-nez v4, :cond_12

    if-nez v5, :cond_12

    if-ne v6, v3, :cond_12

    if-ne v7, v12, :cond_12

    and-int/lit8 v4, v8, 0x18

    if-nez v4, :cond_12

    and-int/lit8 v4, v8, 0x40

    if-eqz v4, :cond_d

    move/from16 v21, v11

    goto :goto_8

    :cond_d
    move/from16 v21, v17

    :goto_8
    and-int/lit16 v4, v8, 0x80

    if-eqz v4, :cond_e

    and-int/lit8 v4, v8, 0x7

    add-int/2addr v4, v11

    shl-int v4, v11, v4

    invoke-static {v2, v4}, Lorg/rabochaya/projects/GifRaster;->palette(Ljava/io/RandomAccessFile;I)[I

    move-result-object v4

    move-object v10, v4

    goto :goto_9

    :cond_e
    move-object/from16 v10, v18

    :goto_9
    if-eqz v10, :cond_11

    if-eqz v22, :cond_10

    array-length v4, v10

    move/from16 v9, v25

    if-ge v9, v4, :cond_f

    aput v17, v10, v9

    goto :goto_b

    :cond_f
    const-string v0, "\u043d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 transparent index"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    :goto_a
    throw v0

    :cond_10
    move/from16 v9, v25

    :goto_b
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v8

    array-length v7, v10

    move-object v4, v2

    move-wide v5, v15

    move/from16 v20, v7

    move-object/from16 v7, v19

    move/from16 v23, v9

    move v9, v3

    move-object/from16 v25, v10

    move v10, v12

    move/from16 v27, v11

    move/from16 v11, v20

    move/from16 v20, v12

    move/from16 v12, v21

    move-object/from16 v28, v13

    move-object/from16 v29, v14

    move-wide v13, v0

    invoke-static/range {v4 .. v14}, Lorg/rabochaya/projects/GifRaster;->decode(Ljava/io/RandomAccessFile;J[IIIIIZJ)[B

    move-result-object v4

    move/from16 v9, v23

    move-object/from16 v10, v25

    move/from16 v23, v27

    .line 26
    :goto_c
    add-int/lit8 v8, v26, 0x1

    move/from16 v12, v20

    move/from16 v11, v27

    move-object/from16 v13, v28

    move-object/from16 v14, v29

    move-object/from16 v20, v4

    goto/16 :goto_4

    .line 28
    :cond_11
    const-string v0, "\u043d\u0435\u0442 \u043f\u0430\u043b\u0438\u0442\u0440\u044b"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    goto :goto_a

    :cond_12
    const-string v0, "\u043d\u0443\u0436\u0435\u043d \u043f\u043e\u043b\u043d\u044b\u0439 \u043a\u0430\u0434\u0440 \u0431\u0435\u0437 crop/reserved flags"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    goto :goto_a

    :cond_13
    const-string v0, "\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d \u0440\u043e\u0432\u043d\u043e \u043e\u0434\u0438\u043d image descriptor"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    goto :goto_a

    .line 29
    :cond_14
    const-string v0, "\u0431\u043e\u043b\u044c\u0448\u0435 1024 records"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 25
    :cond_15
    const-string v0, "\u043d\u0443\u0436\u043d\u044b \u043a\u0432\u0430\u0434\u0440\u0430\u0442\u043d\u044b\u0435 \u043f\u0438\u043a\u0441\u0435\u043b\u0438, \u0434\u043e 20k \u043f\u043e \u0441\u0442\u043e\u0440\u043e\u043d\u0435 / 4 \u043c\u043b\u043d \u043f\u0438\u043a\u0441\u0435\u043b\u0435\u0439"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    goto/16 :goto_0

    :cond_16
    const-string v0, "\u043f\u0440\u0435\u0434\u0435\u043b \u0444\u0430\u0439\u043b\u0430 16 \u041c\u0438\u0411"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    move-object v1, v0

    :try_start_5
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_d

    :catchall_1
    move-exception v0

    move-object v2, v0

    :try_start_6
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_d
    throw v1
    :try_end_6
    .catch Ljava/io/EOFException; {:try_start_6 .. :try_end_6} :catch_0

    .line 30
    :catch_0
    move-exception v0

    const-string v0, "\u043e\u0431\u0440\u0435\u0437\u0430\u043d\u043d\u0430\u044f \u0441\u0442\u0440\u0443\u043a\u0442\u0443\u0440\u0430"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 25
    :cond_17
    const-string v0, "\u043d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 \u043b\u0438\u043c\u0438\u0442 \u0432\u0440\u0435\u043c\u0435\u043d\u0438"

    invoke-static {v0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0
.end method

.method private static skip(Ljava/io/RandomAccessFile;JI)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v0

    if-ltz p3, :cond_0

    int-to-long v2, p3

    sub-long/2addr p1, v2

    cmp-long p1, v0, p1

    if-gtz p1, :cond_0

    add-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Ljava/io/RandomAccessFile;->seek(J)V

    return-void

    :cond_0
    const-string p0, "\u043e\u0431\u0440\u0435\u0437\u0430\u043d\u043d\u044b\u0435 \u0434\u0430\u043d\u043d\u044b\u0435"

    invoke-static {p0}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method private static u16(Ljava/io/RandomAccessFile;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 9
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v0

    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result p0

    shl-int/lit8 p0, p0, 0x8

    or-int/2addr p0, v0

    return p0
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1

    monitor-enter p0

    .line 32
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lorg/rabochaya/projects/GifRaster;->closed:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/GifRaster;->pixels:[B

    iput-object v0, p0, Lorg/rabochaya/projects/GifRaster;->colors:[I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 32
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized pixel(II)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 31
    :try_start_0
    iget-boolean v0, p0, Lorg/rabochaya/projects/GifRaster;->closed:Z

    if-nez v0, :cond_2

    if-ltz p1, :cond_1

    if-ltz p2, :cond_1

    iget v0, p0, Lorg/rabochaya/projects/GifRaster;->width:I

    if-ge p1, v0, :cond_1

    iget v0, p0, Lorg/rabochaya/projects/GifRaster;->height:I

    if-lt p2, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/GifRaster;->colors:[I

    iget-object v1, p0, Lorg/rabochaya/projects/GifRaster;->pixels:[B

    iget v2, p0, Lorg/rabochaya/projects/GifRaster;->width:I

    mul-int/2addr p2, v2

    add-int/2addr p2, p1

    aget-byte p1, v1, p2

    and-int/lit16 p1, p1, 0xff

    aget p1, v0, p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :cond_1
    :goto_0
    monitor-exit p0

    const/4 p1, 0x0

    return p1

    :cond_2
    :try_start_1
    const-string p1, "reader \u0437\u0430\u043a\u0440\u044b\u0442"

    invoke-static {p1}, Lorg/rabochaya/projects/GifRaster;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p1

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
