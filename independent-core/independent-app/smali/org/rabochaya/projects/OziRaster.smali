.class public final Lorg/rabochaya/projects/OziRaster;
.super Ljava/lang/Object;
.source "OziRaster.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Lorg/rabochaya/projects/RasterMapImport$Source;


# static fields
.field public static final MAX_IMAGE:J = 0x20000000L


# instance fields
.field private bytes:J

.field public final calibration:Lorg/rabochaya/projects/OziCalibration;

.field private closed:Z

.field private final decoder:Landroid/graphics/BitmapRegionDecoder;

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
    .locals 7
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

    if-eqz v0, :cond_6

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    const-wide/32 v4, 0x20000

    cmp-long v0, v0, v4

    if-gtz v0, :cond_6

    invoke-virtual {p2}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide v0

    const-wide/32 v4, 0x20000000

    cmp-long v0, v0, v4

    if-gtz v0, :cond_6

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

    if-ne v4, v5, :cond_0

    aget-byte v4, v1, v3

    and-int/2addr v4, v5

    const/16 v6, 0xd8

    if-ne v4, v6, :cond_0

    const/4 v4, 0x2

    aget-byte v1, v1, v4

    and-int/2addr v1, v5

    if-ne v1, v5, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    if-nez v0, :cond_2

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Ozi: \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u044b \u0442\u043e\u043b\u044c\u043a\u043e PNG/JPEG"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 9
    :cond_2
    :goto_1
    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, v2}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/lang/String;Z)Landroid/graphics/BitmapRegionDecoder;

    move-result-object p2

    if-eqz p2, :cond_5

    :try_start_1
    invoke-virtual {p2}, Landroid/graphics/BitmapRegionDecoder;->getWidth()I

    move-result v0

    invoke-virtual {p2}, Landroid/graphics/BitmapRegionDecoder;->getHeight()I

    move-result v1

    if-lt v0, v3, :cond_3

    if-lt v1, v3, :cond_3

    const/16 v2, 0x4e20

    if-gt v0, v2, :cond_3

    if-gt v1, v2, :cond_3

    int-to-long v2, v0

    int-to-long v4, v1

    mul-long/2addr v2, v4

    const-wide/32 v4, 0x5f5e100

    cmp-long v2, v2, v4

    if-gtz v2, :cond_3

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    :try_start_2
    invoke-static {v2, p3, v0, v1}, Lorg/rabochaya/projects/OziCalibration;->read(Ljava/io/InputStream;Ljava/lang/String;II)Lorg/rabochaya/projects/OziCalibration;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/OziRaster;->calibration:Lorg/rabochaya/projects/OziCalibration;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    iput-object p2, p0, Lorg/rabochaya/projects/OziRaster;->decoder:Landroid/graphics/BitmapRegionDecoder;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_0

    .line 10
    return-void

    .line 9
    :catchall_0
    move-exception p1

    :try_start_4
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p3

    :try_start_5
    invoke-virtual {p1, p3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_2
    throw p1

    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string p3, "Ozi: \u043f\u0440\u0435\u0434\u0435\u043b 20 000 \u043f\u043e \u0441\u0442\u043e\u0440\u043e\u043d\u0435 / 100 \u043c\u043b\u043d \u043f\u0438\u043a\u0441\u0435\u043b\u0435\u0439"

    invoke-direct {p1, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    goto :goto_3

    :catch_1
    move-exception p1

    :goto_3
    invoke-virtual {p2}, Landroid/graphics/BitmapRegionDecoder;->recycle()V

    instance-of p2, p1, Ljava/io/IOException;

    if-eqz p2, :cond_4

    check-cast p1, Ljava/io/IOException;

    throw p1

    :cond_4
    new-instance p2, Ljava/io/IOException;

    const-string p3, "Ozi: \u043e\u0448\u0438\u0431\u043a\u0430 \u0438\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u044f/\u043f\u0440\u0438\u0432\u044f\u0437\u043a\u0438"

    invoke-direct {p2, p3, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    :cond_5
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Ozi: \u0438\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u043d\u0435 \u0434\u0435\u043a\u043e\u0434\u0438\u0440\u043e\u0432\u0430\u043d\u043e"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 8
    :catchall_2
    move-exception p1

    :try_start_6
    invoke-virtual {v2}, Ljava/io/DataInputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    goto :goto_4

    :catchall_3
    move-exception p2

    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_4
    throw p1

    .line 7
    :cond_6
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

    monitor-enter p0

    .line 13
    :try_start_0
    iget-boolean v0, p0, Lorg/rabochaya/projects/OziRaster;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    :goto_0
    monitor-exit p0

    return-void

    :cond_0
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

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/OziRaster;->tiles:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/rabochaya/projects/OziRaster;->bytes:J

    iget-object v0, p0, Lorg/rabochaya/projects/OziRaster;->decoder:Landroid/graphics/BitmapRegionDecoder;

    invoke-virtual {v0}, Landroid/graphics/BitmapRegionDecoder;->recycle()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 13
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

    .line 12
    :try_start_0
    iget-boolean v0, p0, Lorg/rabochaya/projects/OziRaster;->closed:Z

    if-nez v0, :cond_5

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

    if-nez v0, :cond_4

    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    iput-object v4, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    iput-boolean p4, v0, Landroid/graphics/BitmapFactory$Options;->inScaled:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    mul-int/lit16 p2, p2, 0x100

    mul-int/lit16 v1, v1, 0x100

    :try_start_2
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
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v0, :cond_3

    :try_start_3
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result p2

    int-to-long v4, p2

    :goto_0
    iget-object p2, p0, Lorg/rabochaya/projects/OziRaster;->tiles:Ljava/util/LinkedHashMap;

    invoke-virtual {p2}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_2

    iget-object p2, p0, Lorg/rabochaya/projects/OziRaster;->tiles:Ljava/util/LinkedHashMap;

    invoke-virtual {p2}, Ljava/util/LinkedHashMap;->size()I

    move-result p2

    const/16 p4, 0x40

    if-ge p2, p4, :cond_1

    iget-wide v6, p0, Lorg/rabochaya/projects/OziRaster;->bytes:J

    add-long/2addr v6, v4

    const-wide/32 v8, 0x1000000

    cmp-long p2, v6, v8

    if-lez p2, :cond_2

    :cond_1
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

    goto :goto_0

    :cond_2
    iget-object p2, p0, Lorg/rabochaya/projects/OziRaster;->tiles:Ljava/util/LinkedHashMap;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    invoke-virtual {p2, p4, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-wide v1, p0, Lorg/rabochaya/projects/OziRaster;->bytes:J

    add-long/2addr v1, v4

    iput-wide v1, p0, Lorg/rabochaya/projects/OziRaster;->bytes:J

    goto :goto_2

    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Ozi: \u043f\u0443\u0441\u0442\u043e\u0439 \u0440\u0435\u0433\u0438\u043e\u043d \u0438\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u044f"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_1
    throw p1

    :catch_0
    move-exception p1

    new-instance p2, Ljava/io/IOException;

    const-string p3, "Ozi: \u043e\u0448\u0438\u0431\u043a\u0430 \u0447\u0442\u0435\u043d\u0438\u044f \u0440\u0435\u0433\u0438\u043e\u043d\u0430"

    invoke-direct {p2, p3, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    :cond_4
    :goto_2
    rem-int/lit16 p3, p3, 0x100

    rem-int/lit16 p1, p1, 0x100

    invoke-virtual {v0, p3, p1}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return p1

    :cond_5
    :try_start_4
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Ozi reader \u0437\u0430\u043a\u0440\u044b\u0442"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 12
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public transform()Lorg/rabochaya/projects/GeoRasterTransform;
    .locals 1

    .line 11
    iget-object v0, p0, Lorg/rabochaya/projects/OziRaster;->calibration:Lorg/rabochaya/projects/OziCalibration;

    iget-object v0, v0, Lorg/rabochaya/projects/OziCalibration;->transform:Lorg/rabochaya/projects/GeoRasterTransform;

    return-object v0
.end method
