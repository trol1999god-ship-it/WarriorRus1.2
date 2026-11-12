.class public final Lorg/rabochaya/projects/HgtHillshade;
.super Ljava/lang/Object;
.source "HgtHillshade.java"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field public static final BLOCK:I = 0x40

.field public static final MAX_BLOCKS:I = 0x40


# instance fields
.field private final blocks:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/Long;",
            "[I>;"
        }
    .end annotation
.end field

.field private closed:Z

.field private final eastLight:D

.field private final height:Lorg/rabochaya/projects/HgtRaster;

.field private final northLight:D

.field private final step:D

.field private final transform:Lorg/rabochaya/projects/GeoRasterTransform;

.field private final upLight:D


# direct methods
.method public constructor <init>(Ljava/io/File;J)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 7
    const-wide v4, 0x4073b00000000000L    # 315.0

    const-wide v6, 0x4046800000000000L    # 45.0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    invoke-direct/range {v0 .. v7}, Lorg/rabochaya/projects/HgtHillshade;-><init>(Ljava/io/File;JDD)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;JDD)V
    .locals 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8
    move-object/from16 v1, p0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 6
    new-instance v0, Ljava/util/LinkedHashMap;

    const/16 v2, 0x10

    const/high16 v3, 0x3f400000    # 0.75f

    const/4 v4, 0x1

    invoke-direct {v0, v2, v3, v4}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, v1, Lorg/rabochaya/projects/HgtHillshade;->blocks:Ljava/util/LinkedHashMap;

    .line 9
    invoke-static/range {p4 .. p7}, Lorg/rabochaya/projects/HgtHillshade;->lighting(DD)V

    invoke-static/range {p1 .. p3}, Lorg/rabochaya/projects/HgtRaster;->owned(Ljava/io/File;J)Lorg/rabochaya/projects/HgtRaster;

    move-result-object v2

    .line 10
    :try_start_0
    iput-object v2, v1, Lorg/rabochaya/projects/HgtHillshade;->height:Lorg/rabochaya/projects/HgtRaster;

    iget-object v0, v1, Lorg/rabochaya/projects/HgtHillshade;->height:Lorg/rabochaya/projects/HgtRaster;

    iget v0, v0, Lorg/rabochaya/projects/HgtRaster;->samples:I

    add-int/lit8 v7, v0, -0x1

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    int-to-double v8, v7

    div-double/2addr v5, v8

    iput-wide v5, v1, Lorg/rabochaya/projects/HgtHillshade;->step:D

    new-instance v0, Lorg/rabochaya/projects/GeoRasterTransform;

    iget-wide v10, v1, Lorg/rabochaya/projects/HgtHillshade;->step:D

    iget-object v3, v1, Lorg/rabochaya/projects/HgtHillshade;->height:Lorg/rabochaya/projects/HgtRaster;

    iget v3, v3, Lorg/rabochaya/projects/HgtRaster;->west:I

    int-to-double v14, v3

    iget-wide v5, v1, Lorg/rabochaya/projects/HgtHillshade;->step:D

    neg-double v5, v5

    iget-object v3, v1, Lorg/rabochaya/projects/HgtHillshade;->height:Lorg/rabochaya/projects/HgtRaster;

    iget v3, v3, Lorg/rabochaya/projects/HgtRaster;->south:I

    add-int/2addr v3, v4

    int-to-double v3, v3

    move-wide/from16 v20, v3

    const/16 v8, 0x10e6

    const/4 v9, 0x0

    const-wide/16 v12, 0x0

    const-wide/16 v16, 0x0

    move-wide v3, v5

    move-object v5, v0

    move v6, v7

    move-wide/from16 v18, v3

    invoke-direct/range {v5 .. v21}, Lorg/rabochaya/projects/GeoRasterTransform;-><init>(IIIZDDDDDD)V

    iput-object v0, v1, Lorg/rabochaya/projects/HgtHillshade;->transform:Lorg/rabochaya/projects/GeoRasterTransform;

    invoke-static/range {p4 .. p5}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v3

    invoke-static/range {p6 .. p7}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v7

    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    move-result-wide v9

    mul-double/2addr v7, v9

    iput-wide v7, v1, Lorg/rabochaya/projects/HgtHillshade;->eastLight:D

    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v7

    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    move-result-wide v3

    mul-double/2addr v7, v3

    iput-wide v7, v1, Lorg/rabochaya/projects/HgtHillshade;->northLight:D

    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    iput-wide v3, v1, Lorg/rabochaya/projects/HgtHillshade;->upLight:D
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    return-void

    .line 10
    :catch_0
    move-exception v0

    invoke-virtual {v2}, Lorg/rabochaya/projects/HgtRaster;->close()V

    new-instance v2, Ljava/io/IOException;

    const-string v3, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u0438\u0442\u044c \u043e\u0442\u043c\u044b\u0432\u043a\u0443 HGT"

    invoke-direct {v2, v3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static finite(D)Z
    .locals 1

    .line 12
    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0, p1}, Ljava/lang/Double;->isInfinite(D)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static lighting(DD)V
    .locals 4

    .line 13
    invoke-static {p0, p1}, Lorg/rabochaya/projects/HgtHillshade;->finite(D)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p2, p3}, Lorg/rabochaya/projects/HgtHillshade;->finite(D)Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 v0, 0x0

    cmpg-double v2, p0, v0

    if-ltz v2, :cond_0

    const-wide v2, 0x4076800000000000L    # 360.0

    cmpl-double p0, p0, v2

    if-gez p0, :cond_0

    cmpg-double p0, p2, v0

    if-lez p0, :cond_0

    const-wide p0, 0x4056800000000000L    # 90.0

    cmpl-double p0, p2, p0

    if-gtz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u041d\u0443\u0436\u043d\u044b \u0430\u0437\u0438\u043c\u0443\u0442 [0,360) \u0438 \u0432\u044b\u0441\u043e\u0442\u0430 \u0441\u0432\u0435\u0442\u0430 (0,90] \u0433\u0440\u0430\u0434\u0443\u0441\u043e\u0432"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private readBlock(II)[I
    .locals 43
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 22
    move-object/from16 v0, p0

    const/16 v1, 0x1000

    new-array v1, v1, [I

    iget-object v2, v0, Lorg/rabochaya/projects/HgtHillshade;->transform:Lorg/rabochaya/projects/GeoRasterTransform;

    iget v2, v2, Lorg/rabochaya/projects/GeoRasterTransform;->width:I

    add-int/lit8 v3, p1, 0x1

    mul-int/lit8 v3, v3, 0x40

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    iget-object v3, v0, Lorg/rabochaya/projects/HgtHillshade;->transform:Lorg/rabochaya/projects/GeoRasterTransform;

    iget v3, v3, Lorg/rabochaya/projects/GeoRasterTransform;->height:I

    add-int/lit8 v4, p2, 0x1

    mul-int/lit8 v4, v4, 0x40

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    iget-wide v4, v0, Lorg/rabochaya/projects/HgtHillshade;->step:D

    invoke-static {v4, v5}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v4

    .line 23
    mul-int/lit8 v6, p2, 0x40

    :goto_0
    if-ge v6, v3, :cond_2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v7

    if-nez v7, :cond_1

    iget-object v7, v0, Lorg/rabochaya/projects/HgtHillshade;->height:Lorg/rabochaya/projects/HgtRaster;

    iget v7, v7, Lorg/rabochaya/projects/HgtRaster;->south:I

    add-int/lit8 v7, v7, 0x1

    int-to-double v7, v7

    int-to-double v9, v6

    iget-wide v11, v0, Lorg/rabochaya/projects/HgtHillshade;->step:D

    mul-double/2addr v9, v11

    sub-double/2addr v7, v9

    iget-object v9, v0, Lorg/rabochaya/projects/HgtHillshade;->height:Lorg/rabochaya/projects/HgtRaster;

    iget v9, v9, Lorg/rabochaya/projects/HgtRaster;->south:I

    add-int/lit8 v9, v9, 0x1

    int-to-double v9, v9

    add-int/lit8 v11, v6, 0x1

    int-to-double v12, v11

    iget-wide v14, v0, Lorg/rabochaya/projects/HgtHillshade;->step:D

    mul-double/2addr v12, v14

    sub-double/2addr v9, v12

    add-double v12, v7, v9

    const-wide/high16 v14, 0x4000000000000000L    # 2.0

    div-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Math;->sin(D)D

    move-result-wide v14

    const-wide v16, 0x3f7b6b90f1fe94f0L    # 0.0066943799901413165

    mul-double v16, v16, v14

    mul-double v16, v16, v14

    const-wide/high16 v14, 0x3ff0000000000000L    # 1.0

    sub-double v14, v14, v16

    const-wide v16, 0x415854a640000000L    # 6378137.0

    mul-double v16, v16, v4

    invoke-static {v14, v15}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v18

    div-double v18, v16, v18

    invoke-static {v12, v13}, Ljava/lang/Math;->cos(D)D

    move-result-wide v12

    mul-double v18, v18, v12

    const-wide v12, 0x3fefc928de1c02d6L    # 0.9933056200098587

    mul-double v16, v16, v12

    const-wide/high16 v12, 0x3ff8000000000000L    # 1.5

    invoke-static {v14, v15, v12, v13}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v12

    div-double v16, v16, v12

    .line 24
    mul-int/lit8 v12, p1, 0x40

    :goto_1
    if-ge v12, v2, :cond_0

    iget-object v13, v0, Lorg/rabochaya/projects/HgtHillshade;->height:Lorg/rabochaya/projects/HgtRaster;

    iget v13, v13, Lorg/rabochaya/projects/HgtRaster;->west:I

    int-to-double v13, v13

    move v15, v2

    move/from16 v38, v3

    int-to-double v2, v12

    move-wide/from16 v39, v4

    iget-wide v4, v0, Lorg/rabochaya/projects/HgtHillshade;->step:D

    mul-double/2addr v2, v4

    add-double/2addr v13, v2

    iget-object v2, v0, Lorg/rabochaya/projects/HgtHillshade;->height:Lorg/rabochaya/projects/HgtRaster;

    iget v2, v2, Lorg/rabochaya/projects/HgtRaster;->west:I

    int-to-double v2, v2

    add-int/lit8 v4, v12, 0x1

    move-wide/from16 v41, v9

    int-to-double v9, v4

    move/from16 p2, v4

    iget-wide v4, v0, Lorg/rabochaya/projects/HgtHillshade;->step:D

    mul-double/2addr v9, v4

    add-double/2addr v2, v9

    rem-int/lit8 v4, v6, 0x40

    mul-int/lit8 v4, v4, 0x40

    rem-int/lit8 v12, v12, 0x40

    add-int/2addr v4, v12

    iget-object v5, v0, Lorg/rabochaya/projects/HgtHillshade;->height:Lorg/rabochaya/projects/HgtRaster;

    invoke-virtual {v5, v13, v14, v7, v8}, Lorg/rabochaya/projects/HgtRaster;->height(DD)D

    move-result-wide v20

    iget-object v5, v0, Lorg/rabochaya/projects/HgtHillshade;->height:Lorg/rabochaya/projects/HgtRaster;

    invoke-virtual {v5, v2, v3, v7, v8}, Lorg/rabochaya/projects/HgtRaster;->height(DD)D

    move-result-wide v22

    iget-object v5, v0, Lorg/rabochaya/projects/HgtHillshade;->height:Lorg/rabochaya/projects/HgtRaster;

    move-wide/from16 v9, v41

    invoke-virtual {v5, v13, v14, v9, v10}, Lorg/rabochaya/projects/HgtRaster;->height(DD)D

    move-result-wide v24

    iget-object v5, v0, Lorg/rabochaya/projects/HgtHillshade;->height:Lorg/rabochaya/projects/HgtRaster;

    invoke-virtual {v5, v2, v3, v9, v10}, Lorg/rabochaya/projects/HgtRaster;->height(DD)D

    move-result-wide v26

    iget-wide v2, v0, Lorg/rabochaya/projects/HgtHillshade;->eastLight:D

    move-wide/from16 v32, v2

    iget-wide v2, v0, Lorg/rabochaya/projects/HgtHillshade;->northLight:D

    move-wide/from16 v34, v2

    iget-wide v2, v0, Lorg/rabochaya/projects/HgtHillshade;->upLight:D

    move-wide/from16 v36, v2

    move-wide/from16 v28, v18

    move-wide/from16 v30, v16

    invoke-static/range {v20 .. v37}, Lorg/rabochaya/projects/HgtHillshade;->shade(DDDDDDDDD)I

    move-result v2

    aput v2, v1, v4

    move/from16 v12, p2

    move v2, v15

    move/from16 v3, v38

    move-wide/from16 v4, v39

    goto :goto_1

    .line 23
    :cond_0
    move v15, v2

    move/from16 v38, v3

    move-wide/from16 v39, v4

    move v6, v11

    goto/16 :goto_0

    :cond_1
    new-instance v1, Ljava/io/IOException;

    const-string v2, "\u041e\u0442\u043c\u044b\u0432\u043a\u0430 HGT \u043f\u0440\u0435\u0440\u0432\u0430\u043d\u0430"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 25
    :cond_2
    return-object v1
.end method

.method public static shade(DDDDDDDD)I
    .locals 20

    .line 15
    invoke-static/range {p12 .. p15}, Lorg/rabochaya/projects/HgtHillshade;->lighting(DD)V

    invoke-static/range {p8 .. p9}, Lorg/rabochaya/projects/HgtHillshade;->finite(D)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static/range {p10 .. p11}, Lorg/rabochaya/projects/HgtHillshade;->finite(D)Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 v0, 0x0

    cmpg-double v2, p8, v0

    if-lez v2, :cond_0

    cmpg-double v0, p10, v0

    if-lez v0, :cond_0

    invoke-static/range {p12 .. p13}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v0

    invoke-static/range {p14 .. p15}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    mul-double v14, v4, v6

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    mul-double v16, v4, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v18

    move-wide/from16 v2, p0

    move-wide/from16 v4, p2

    move-wide/from16 v6, p4

    move-wide/from16 v8, p6

    move-wide/from16 v10, p8

    move-wide/from16 v12, p10

    invoke-static/range {v2 .. v19}, Lorg/rabochaya/projects/HgtHillshade;->shade(DDDDDDDDD)I

    move-result v0

    return v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u041d\u0443\u0436\u043d\u044b \u043f\u043e\u043b\u043e\u0436\u0438\u0442\u0435\u043b\u044c\u043d\u044b\u0435 \u0440\u0430\u0437\u043c\u0435\u0440\u044b \u044f\u0447\u0435\u0439\u043a\u0438 \u0432 \u043c\u0435\u0442\u0440\u0430\u0445"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static shade(DDDDDDDDD)I
    .locals 8

    .line 17
    invoke-static {p0, p1}, Lorg/rabochaya/projects/HgtHillshade;->finite(D)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p2, p3}, Lorg/rabochaya/projects/HgtHillshade;->finite(D)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p4, p5}, Lorg/rabochaya/projects/HgtHillshade;->finite(D)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p6, p7}, Lorg/rabochaya/projects/HgtHillshade;->finite(D)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 18
    :cond_0
    sub-double v0, p2, p0

    sub-double v2, p6, p4

    add-double/2addr v0, v2

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    mul-double v4, p8, v2

    div-double/2addr v0, v4

    sub-double v4, p0, p4

    sub-double v6, p2, p6

    add-double/2addr v4, v6

    mul-double v2, v2, p10

    div-double/2addr v4, v2

    neg-double v2, v0

    mul-double v2, v2, p12

    mul-double v6, v4, p14

    sub-double/2addr v2, v6

    add-double v2, v2, p16

    mul-double/2addr v0, v0

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    add-double/2addr v0, v6

    mul-double/2addr v4, v4

    add-double/2addr v0, v4

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    div-double/2addr v2, v0

    const-wide/16 v0, 0x0

    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    const-wide v2, 0x406fe00000000000L    # 255.0

    mul-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-int v0, v0

    shl-int/lit8 v1, v0, 0x10

    const/high16 v2, -0x1000000

    or-int/2addr v1, v2

    shl-int/lit8 v2, v0, 0x8

    or-int/2addr v1, v2

    or-int/2addr v0, v1

    return v0

    .line 17
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 27
    :try_start_0
    iget-boolean v0, p0, Lorg/rabochaya/projects/HgtHillshade;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    :goto_0
    monitor-exit p0

    return-void

    :cond_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lorg/rabochaya/projects/HgtHillshade;->closed:Z

    iget-object v0, p0, Lorg/rabochaya/projects/HgtHillshade;->blocks:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    iget-object v0, p0, Lorg/rabochaya/projects/HgtHillshade;->height:Lorg/rabochaya/projects/HgtRaster;

    invoke-virtual {v0}, Lorg/rabochaya/projects/HgtRaster;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 27
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized color(DD)I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 21
    :try_start_0
    iget-boolean v0, p0, Lorg/rabochaya/projects/HgtHillshade;->closed:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/HgtHillshade;->transform:Lorg/rabochaya/projects/GeoRasterTransform;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/rabochaya/projects/GeoRasterTransform;->cell(DD)J

    move-result-wide p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 p3, 0x0

    cmp-long p3, p1, p3

    if-gez p3, :cond_0

    monitor-exit p0

    const/4 p1, 0x0

    return p1

    :cond_0
    long-to-int p3, p1

    const/16 p4, 0x20

    ushr-long/2addr p1, p4

    long-to-int p1, p1

    :try_start_1
    div-int/lit8 p2, p3, 0x40

    div-int/lit8 v0, p1, 0x40

    int-to-long v1, v0

    shl-long/2addr v1, p4

    int-to-long v3, p2

    const-wide v5, 0xffffffffL

    and-long/2addr v3, v5

    or-long/2addr v1, v3

    iget-object p4, p0, Lorg/rabochaya/projects/HgtHillshade;->blocks:Ljava/util/LinkedHashMap;

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {p4, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, [I

    const/16 v3, 0x40

    if-nez p4, :cond_2

    invoke-direct {p0, p2, v0}, Lorg/rabochaya/projects/HgtHillshade;->readBlock(II)[I

    move-result-object p4

    :goto_0
    iget-object p2, p0, Lorg/rabochaya/projects/HgtHillshade;->blocks:Ljava/util/LinkedHashMap;

    invoke-virtual {p2}, Ljava/util/LinkedHashMap;->size()I

    move-result p2

    if-lt p2, v3, :cond_1

    iget-object p2, p0, Lorg/rabochaya/projects/HgtHillshade;->blocks:Ljava/util/LinkedHashMap;

    invoke-virtual {p2}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    invoke-interface {p2}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_1
    iget-object p2, p0, Lorg/rabochaya/projects/HgtHillshade;->blocks:Ljava/util/LinkedHashMap;

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p2, v0, p4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    rem-int/2addr p1, v3

    mul-int/2addr p1, v3

    rem-int/2addr p3, v3

    add-int/2addr p1, p3

    aget p1, p4, p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :cond_3
    :try_start_2
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u041e\u0442\u043c\u044b\u0432\u043a\u0430 HGT \u0437\u0430\u043a\u0440\u044b\u0442\u0430"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 21
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public transform()Lorg/rabochaya/projects/GeoRasterTransform;
    .locals 1

    .line 20
    iget-object v0, p0, Lorg/rabochaya/projects/HgtHillshade;->transform:Lorg/rabochaya/projects/GeoRasterTransform;

    return-object v0
.end method
