.class public final Lorg/rabochaya/projects/OziRaster;
.super Ljava/lang/Object;
.source "OziRaster.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Lorg/rabochaya/projects/RasterMapImport$Source;


# static fields
.field public static final MAX_IMAGE:J = 0x20000000L


# instance fields
.field private final bitmap:Lorg/rabochaya/projects/BmpRaster;

.field private bytes:J

.field public final calibration:Lorg/rabochaya/projects/OziCalibration;

.field private closed:Z

.field private final decoder:Landroid/graphics/BitmapRegionDecoder;

.field private final gifRaster:Lorg/rabochaya/projects/GifRaster;

.field private final tiles:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/Long;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    new-instance v0, Ljava/util/LinkedHashMap;

    const/16 v1, 0x10

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Lorg/rabochaya/projects/OziRaster;->tiles:Ljava/util/LinkedHashMap;

    .line 7
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    const-wide/32 v4, 0x20000

    cmp-long v0, v0, v4

    if-gtz v0, :cond_d

    invoke-virtual {p2}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide v0

    const-wide/32 v4, 0x20000000

    cmp-long v0, v0, v4

    if-gtz v0, :cond_d

    .line 8
    const/16 v0, 0x8

    new-array v1, v0, [B

    new-instance v2, Ljava/io/DataInputStream;

    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v4}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    :try_start_0
    invoke-virtual {v2, v1}, Ljava/io/DataInputStream;->readFully([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    invoke-virtual {v2}, Ljava/io/DataInputStream;->close()V

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    invoke-static {v1, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    const/4 v2, 0x0

    aget-byte v4, v1, v2

    const/16 v5, 0xff

    and-int/2addr v4, v5

    const/4 v6, 0x2

    if-ne v4, v5, :cond_0

    aget-byte v4, v1, v3

    and-int/2addr v4, v5

    const/16 v7, 0xd8

    if-ne v4, v7, :cond_0

    aget-byte v4, v1, v6

    and-int/2addr v4, v5

    if-ne v4, v5, :cond_0

    move v4, v3

    goto :goto_0

    :cond_0
    move v4, v2

    :goto_0
    aget-byte v5, v1, v2

    const/16 v7, 0x42

    if-ne v5, v7, :cond_1

    aget-byte v5, v1, v3

    const/16 v7, 0x4d

    if-ne v5, v7, :cond_1

    move v5, v3

    goto :goto_1

    :cond_1
    move v5, v2

    :goto_1
    aget-byte v7, v1, v2

    const/16 v8, 0x47

    if-ne v7, v8, :cond_2

    aget-byte v7, v1, v3

    const/16 v8, 0x49

    if-ne v7, v8, :cond_2

    aget-byte v1, v1, v6

    const/16 v6, 0x46

    if-ne v1, v6, :cond_2

    move v1, v3

    goto :goto_2

    :cond_2
    move v1, v2

    :goto_2
    if-nez v0, :cond_4

    if-nez v4, :cond_4

    if-nez v5, :cond_4

    if-eqz v1, :cond_3

    goto :goto_3

    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Ozi: \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u044b PNG/JPEG/raw BMP24/32 \u0438\u043b\u0438 \u043e\u0434\u0438\u043d \u0441\u0442\u0430\u0442\u0438\u0447\u0435\u0441\u043a\u0438\u0439 GIF"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 9
    :cond_4
    :goto_3
    const/4 v0, 0x0

    if-eqz v1, :cond_5

    :try_start_1
    invoke-static {p2}, Lorg/rabochaya/projects/GifRaster;->read(Ljava/io/File;)Lorg/rabochaya/projects/GifRaster;

    move-result-object p2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_2

    :try_start_2
    iget v1, p2, Lorg/rabochaya/projects/GifRaster;->width:I

    iget v2, p2, Lorg/rabochaya/projects/GifRaster;->height:I
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    move v4, v2

    move v2, v1

    move-object v1, v0

    goto :goto_7

    :catch_0
    move-exception p1

    goto :goto_4

    :catch_1
    move-exception p1

    :goto_4
    move-object v1, v0

    goto/16 :goto_a

    :catch_2
    move-exception p1

    goto :goto_5

    :catch_3
    move-exception p1

    :goto_5
    move-object p2, v0

    move-object v1, p2

    goto/16 :goto_a

    :cond_5
    if-eqz v5, :cond_6

    :try_start_3
    new-instance v1, Lorg/rabochaya/projects/BmpRaster;

    invoke-direct {v1, p2}, Lorg/rabochaya/projects/BmpRaster;-><init>(Ljava/io/File;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_2

    :try_start_4
    iget p2, v1, Lorg/rabochaya/projects/BmpRaster;->width:I

    iget v2, v1, Lorg/rabochaya/projects/BmpRaster;->height:I
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_5
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_4

    move v4, v2

    move v2, p2

    move-object p2, v0

    goto :goto_7

    :catch_4
    move-exception p1

    goto :goto_6

    :catch_5
    move-exception p1

    :goto_6
    move-object p2, v0

    goto/16 :goto_a

    :cond_6
    :try_start_5
    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, v2}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/lang/String;Z)Landroid/graphics/BitmapRegionDecoder;

    move-result-object p2
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_2

    if-eqz p2, :cond_8

    :try_start_6
    invoke-virtual {p2}, Landroid/graphics/BitmapRegionDecoder;->getWidth()I

    move-result v1

    invoke-virtual {p2}, Landroid/graphics/BitmapRegionDecoder;->getHeight()I

    move-result v2
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_9
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_8

    move v4, v2

    move v2, v1

    move-object v1, v0

    move-object v0, p2

    move-object p2, v1

    :goto_7
    if-lt v2, v3, :cond_7

    if-lt v4, v3, :cond_7

    const/16 v3, 0x4e20

    if-gt v2, v3, :cond_7

    if-gt v4, v3, :cond_7

    int-to-long v5, v2

    int-to-long v7, v4

    mul-long/2addr v5, v7

    const-wide/32 v7, 0x5f5e100

    cmp-long v3, v5, v7

    if-gtz v3, :cond_7

    :try_start_7
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_7
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_6

    :try_start_8
    invoke-static {v3, p3, v2, v4}, Lorg/rabochaya/projects/OziCalibration;->read(Ljava/io/InputStream;Ljava/lang/String;II)Lorg/rabochaya/projects/OziCalibration;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/OziRaster;->calibration:Lorg/rabochaya/projects/OziCalibration;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    :try_start_9
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    iput-object v0, p0, Lorg/rabochaya/projects/OziRaster;->decoder:Landroid/graphics/BitmapRegionDecoder;

    iput-object v1, p0, Lorg/rabochaya/projects/OziRaster;->bitmap:Lorg/rabochaya/projects/BmpRaster;

    iput-object p2, p0, Lorg/rabochaya/projects/OziRaster;->gifRaster:Lorg/rabochaya/projects/GifRaster;
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_7
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_9} :catch_6

    .line 11
    return-void

    .line 9
    :catchall_0
    move-exception p1

    :try_start_a
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    goto :goto_8

    :catchall_1
    move-exception p3

    :try_start_b
    invoke-virtual {p1, p3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_8
    throw p1

    :cond_7
    new-instance p1, Ljava/io/IOException;

    const-string p3, "Ozi: \u043f\u0440\u0435\u0434\u0435\u043b 20 000 \u043f\u043e \u0441\u0442\u043e\u0440\u043e\u043d\u0435 / 100 \u043c\u043b\u043d \u043f\u0438\u043a\u0441\u0435\u043b\u0435\u0439"

    invoke-direct {p1, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_7
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_b} :catch_6

    goto :goto_8

    :catch_6
    move-exception p1

    goto :goto_a

    :catch_7
    move-exception p1

    goto :goto_a

    :catch_8
    move-exception p1

    goto :goto_9

    :catch_9
    move-exception p1

    :goto_9
    move-object v1, v0

    move-object v0, p2

    move-object p2, v1

    goto :goto_a

    :cond_8
    :try_start_c
    new-instance p1, Ljava/io/IOException;

    const-string p3, "Ozi: \u0438\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u043d\u0435 \u0434\u0435\u043a\u043e\u0434\u0438\u0440\u043e\u0432\u0430\u043d\u043e"

    invoke-direct {p1, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_9
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_c} :catch_8

    :goto_a
    if-eqz v0, :cond_9

    invoke-virtual {v0}, Landroid/graphics/BitmapRegionDecoder;->recycle()V

    :cond_9
    if-eqz p2, :cond_a

    invoke-virtual {p2}, Lorg/rabochaya/projects/GifRaster;->close()V

    :cond_a
    if-eqz v1, :cond_b

    :try_start_d
    invoke-virtual {v1}, Lorg/rabochaya/projects/BmpRaster;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_a

    goto :goto_b

    :catch_a
    move-exception p2

    :cond_b
    :goto_b
    instance-of p2, p1, Ljava/io/IOException;

    if-eqz p2, :cond_c

    check-cast p1, Ljava/io/IOException;

    throw p1

    :cond_c
    new-instance p2, Ljava/io/IOException;

    const-string p3, "Ozi: \u043e\u0448\u0438\u0431\u043a\u0430 \u0438\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u044f/\u043f\u0440\u0438\u0432\u044f\u0437\u043a\u0438"

    invoke-direct {p2, p3, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    .line 8
    :catchall_2
    move-exception p1

    :try_start_e
    invoke-virtual {v2}, Ljava/io/DataInputStream;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    goto :goto_c

    :catchall_3
    move-exception p2

    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_c
    throw p1

    .line 7
    :cond_d
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Ozi: \u043f\u0440\u0435\u0434\u0435\u043b .map 128 \u041a\u0438\u0411, \u0438\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u044f 512 \u041c\u0438\u0411"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    nop

    :array_0
    .array-data 1
        -0x77t
        0x50t
        0x4et
        0x47t
        0xdt
        0xat
        0x1at
        0xat
    .end array-data
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
    iget-boolean v0, p0, Lorg/rabochaya/projects/OziRaster;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :cond_1
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lorg/rabochaya/projects/OziRaster;->closed:Z

    iget-object v0, p0, Lorg/rabochaya/projects/OziRaster;->tiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lorg/rabochaya/projects/OziRaster;->tiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/rabochaya/projects/OziRaster;->bytes:J

    iget-object v0, p0, Lorg/rabochaya/projects/OziRaster;->decoder:Landroid/graphics/BitmapRegionDecoder;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/OziRaster;->decoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v0}, Landroid/graphics/BitmapRegionDecoder;->recycle()V

    :cond_3
    iget-object v0, p0, Lorg/rabochaya/projects/OziRaster;->bitmap:Lorg/rabochaya/projects/BmpRaster;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lorg/rabochaya/projects/OziRaster;->bitmap:Lorg/rabochaya/projects/BmpRaster;

    invoke-virtual {v0}, Lorg/rabochaya/projects/BmpRaster;->close()V

    :cond_4
    iget-object v0, p0, Lorg/rabochaya/projects/OziRaster;->gifRaster:Lorg/rabochaya/projects/GifRaster;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/OziRaster;->gifRaster:Lorg/rabochaya/projects/GifRaster;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GifRaster;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 14
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized color(DD)I
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 13
    :try_start_0
    iget-boolean v0, p0, Lorg/rabochaya/projects/OziRaster;->closed:Z

    if-nez v0, :cond_7

    invoke-virtual {p0}, Lorg/rabochaya/projects/OziRaster;->transform()Lorg/rabochaya/projects/GeoRasterTransform;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/rabochaya/projects/GeoRasterTransform;->cell(DD)J

    move-result-wide p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 p3, 0x0

    cmp-long p3, p1, p3

    const/4 p4, 0x0

    if-gez p3, :cond_0

    monitor-exit p0

    return p4

    :cond_0
    long-to-int p3, p1

    const/16 v0, 0x20

    ushr-long/2addr p1, v0

    long-to-int p1, p1

    :try_start_1
    iget-object p2, p0, Lorg/rabochaya/projects/OziRaster;->bitmap:Lorg/rabochaya/projects/BmpRaster;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lorg/rabochaya/projects/OziRaster;->bitmap:Lorg/rabochaya/projects/BmpRaster;

    invoke-virtual {p2, p3, p1}, Lorg/rabochaya/projects/BmpRaster;->pixel(II)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    monitor-exit p0

    return p1

    :cond_1
    :try_start_2
    iget-object p2, p0, Lorg/rabochaya/projects/OziRaster;->gifRaster:Lorg/rabochaya/projects/GifRaster;

    if-eqz p2, :cond_2

    iget-object p2, p0, Lorg/rabochaya/projects/OziRaster;->gifRaster:Lorg/rabochaya/projects/GifRaster;

    invoke-virtual {p2, p3, p1}, Lorg/rabochaya/projects/GifRaster;->pixel(II)I

    move-result p1

    goto :goto_0

    :cond_2
    div-int/lit16 p2, p3, 0x100

    div-int/lit16 v1, p1, 0x100

    int-to-long v2, v1

    shl-long/2addr v2, v0

    int-to-long v4, p2

    or-long/2addr v2, v4

    iget-object v0, p0, Lorg/rabochaya/projects/OziRaster;->tiles:Ljava/util/LinkedHashMap;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    if-nez v0, :cond_6

    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v4, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    iput-boolean p4, v0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    mul-int/lit16 p2, p2, 0x100

    mul-int/lit16 v1, v1, 0x100

    :try_start_3
    iget-object p4, p0, Lorg/rabochaya/projects/OziRaster;->decoder:Landroid/graphics/BitmapRegionDecoder;

    new-instance v4, Landroid/graphics/Rect;

    add-int/lit16 v5, p2, 0x100

    invoke-virtual {p0}, Lorg/rabochaya/projects/OziRaster;->transform()Lorg/rabochaya/projects/GeoRasterTransform;

    move-result-object v6

    iget v6, v6, Lorg/rabochaya/projects/GeoRasterTransform;->width:I

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v5

    add-int/lit16 v6, v1, 0x100

    invoke-virtual {p0}, Lorg/rabochaya/projects/OziRaster;->transform()Lorg/rabochaya/projects/GeoRasterTransform;

    move-result-object v7

    iget v7, v7, Lorg/rabochaya/projects/GeoRasterTransform;->height:I

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-direct {v4, p2, v1, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p4, v4, v0}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v0, :cond_5

    :try_start_4
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result p2

    int-to-long v4, p2

    :goto_1
    iget-object p2, p0, Lorg/rabochaya/projects/OziRaster;->tiles:Ljava/util/LinkedHashMap;

    invoke-virtual {p2}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_4

    iget-object p2, p0, Lorg/rabochaya/projects/OziRaster;->tiles:Ljava/util/LinkedHashMap;

    invoke-virtual {p2}, Ljava/util/LinkedHashMap;->size()I

    move-result p2

    const/16 p4, 0x40

    if-ge p2, p4, :cond_3

    iget-wide v6, p0, Lorg/rabochaya/projects/OziRaster;->bytes:J

    add-long/2addr v6, v4

    const-wide/32 v8, 0x1000000

    cmp-long p2, v6, v8

    if-lez p2, :cond_4

    :cond_3
    iget-object p2, p0, Lorg/rabochaya/projects/OziRaster;->tiles:Ljava/util/LinkedHashMap;

    invoke-virtual {p2}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/util/Map$Entry;

    invoke-interface {p4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Landroid/graphics/Bitmap;

    invoke-interface {p2}, Ljava/util/Iterator;->remove()V

    iget-wide v6, p0, Lorg/rabochaya/projects/OziRaster;->bytes:J

    invoke-virtual {p4}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result p2

    int-to-long v8, p2

    sub-long/2addr v6, v8

    iput-wide v6, p0, Lorg/rabochaya/projects/OziRaster;->bytes:J

    invoke-virtual {p4}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_1

    :cond_4
    iget-object p2, p0, Lorg/rabochaya/projects/OziRaster;->tiles:Ljava/util/LinkedHashMap;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    invoke-virtual {p2, p4, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-wide v1, p0, Lorg/rabochaya/projects/OziRaster;->bytes:J

    add-long/2addr v1, v4

    iput-wide v1, p0, Lorg/rabochaya/projects/OziRaster;->bytes:J

    goto :goto_3

    :cond_5
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Ozi: \u043f\u0443\u0441\u0442\u043e\u0439 \u0440\u0435\u0433\u0438\u043e\u043d \u0438\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u044f"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_2
    throw p1

    :catch_0
    move-exception p1

    new-instance p2, Ljava/io/IOException;

    const-string p3, "Ozi: \u043e\u0448\u0438\u0431\u043a\u0430 \u0447\u0442\u0435\u043d\u0438\u044f \u0440\u0435\u0433\u0438\u043e\u043d\u0430"

    invoke-direct {p2, p3, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    :cond_6
    :goto_3
    rem-int/lit16 p3, p3, 0x100

    rem-int/lit16 p1, p1, 0x100

    invoke-virtual {v0, p3, p1}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result p1

    goto/16 :goto_0

    :cond_7
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Ozi reader \u0437\u0430\u043a\u0440\u044b\u0442"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_2

    .line 13
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public transform()Lorg/rabochaya/projects/GeoRasterTransform;
    .locals 1

    .line 12
    iget-object v0, p0, Lorg/rabochaya/projects/OziRaster;->calibration:Lorg/rabochaya/projects/OziCalibration;

    iget-object v0, v0, Lorg/rabochaya/projects/OziCalibration;->transform:Lorg/rabochaya/projects/GeoRasterTransform;

    return-object v0
.end method
