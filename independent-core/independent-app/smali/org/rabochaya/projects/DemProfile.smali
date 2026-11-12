.class public final Lorg/rabochaya/projects/DemProfile;
.super Ljava/lang/Object;
.source "DemProfile.java"


# instance fields
.field public final distance:[D

.field public final gain:D

.field public final height:[D

.field public final length:D

.field public final loss:D

.field public final max:D

.field public final min:D

.field public final valid:I


# direct methods
.method private constructor <init>([D[DD)V
    .locals 19

    .line 11
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 12
    move-object/from16 v2, p1

    iput-object v2, v0, Lorg/rabochaya/projects/DemProfile;->distance:[D

    iput-object v1, v0, Lorg/rabochaya/projects/DemProfile;->height:[D

    move-wide/from16 v2, p3

    iput-wide v2, v0, Lorg/rabochaya/projects/DemProfile;->length:D

    .line 13
    nop

    .line 14
    const-wide/high16 v2, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    const-wide/high16 v4, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    const-wide/16 v6, 0x0

    const/4 v8, 0x0

    move-wide v10, v6

    move-wide v12, v10

    move v9, v8

    :goto_0
    array-length v14, v1

    if-ge v8, v14, :cond_2

    aget-wide v14, v1, v8

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    move-result v14

    if-nez v14, :cond_1

    add-int/lit8 v9, v9, 0x1

    aget-wide v14, v1, v8

    invoke-static {v2, v3, v14, v15}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    aget-wide v14, v1, v8

    invoke-static {v4, v5, v14, v15}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    if-lez v8, :cond_1

    add-int/lit8 v14, v8, -0x1

    aget-wide v15, v1, v14

    invoke-static/range {v15 .. v16}, Ljava/lang/Double;->isNaN(D)Z

    move-result v15

    if-nez v15, :cond_1

    aget-wide v15, v1, v8

    aget-wide v17, v1, v14

    sub-double v15, v15, v17

    cmpl-double v14, v15, v6

    if-lez v14, :cond_0

    add-double/2addr v10, v15

    goto :goto_1

    :cond_0
    sub-double/2addr v12, v15

    :cond_1
    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 15
    :cond_2
    iput v9, v0, Lorg/rabochaya/projects/DemProfile;->valid:I

    const-wide/high16 v6, 0x7ff8000000000000L    # Double.NaN

    if-nez v9, :cond_3

    move-wide v2, v6

    :cond_3
    iput-wide v2, v0, Lorg/rabochaya/projects/DemProfile;->min:D

    if-nez v9, :cond_4

    move-wide v4, v6

    :cond_4
    iput-wide v4, v0, Lorg/rabochaya/projects/DemProfile;->max:D

    iput-wide v10, v0, Lorg/rabochaya/projects/DemProfile;->gain:D

    iput-wide v12, v0, Lorg/rabochaya/projects/DemProfile;->loss:D

    .line 16
    return-void
.end method

.method private static finite(D)Z
    .locals 1

    .line 23
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

.method private static longitudeDelta(D)D
    .locals 4

    .line 22
    const-wide v0, 0x4066800000000000L    # 180.0

    add-double/2addr v0, p0

    const-wide v2, 0x4076800000000000L    # 360.0

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    mul-double/2addr v0, v2

    sub-double/2addr p0, v0

    return-wide p0
.end method

.method public static metres(DDDD)D
    .locals 4

    .line 18
    invoke-static {p2, p3}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide p2

    invoke-static {p6, p7}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide p6

    sub-double/2addr p4, p0

    invoke-static {p4, p5}, Lorg/rabochaya/projects/DemProfile;->longitudeDelta(D)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide p0

    sub-double p4, p6, p2

    .line 19
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    div-double/2addr p4, v0

    invoke-static {p4, p5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    invoke-static {p4, p5}, Ljava/lang/Math;->sin(D)D

    move-result-wide p4

    mul-double/2addr v2, p4

    invoke-static {p2, p3}, Ljava/lang/Math;->cos(D)D

    move-result-wide p2

    invoke-static {p6, p7}, Ljava/lang/Math;->cos(D)D

    move-result-wide p4

    mul-double/2addr p2, p4

    div-double/2addr p0, v0

    invoke-static {p0, p1}, Ljava/lang/Math;->sin(D)D

    move-result-wide p4

    mul-double/2addr p2, p4

    invoke-static {p0, p1}, Ljava/lang/Math;->sin(D)D

    move-result-wide p0

    mul-double/2addr p2, p0

    add-double/2addr v2, p2

    .line 20
    const-wide/high16 p0, 0x3ff0000000000000L    # 1.0

    invoke-static {p0, p1, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide p0

    const-wide/16 p2, 0x0

    invoke-static {p2, p3, p0, p1}, Ljava/lang/Math;->max(DD)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Math;->asin(D)D

    move-result-wide p0

    const-wide p2, 0x41684db033333333L    # 1.27420176E7

    mul-double/2addr p0, p2

    return-wide p0
.end method

.method public static sample(Lorg/rabochaya/projects/HgtRaster;Ljava/util/List;I)Lorg/rabochaya/projects/DemProfile;
    .locals 27
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/rabochaya/projects/HgtRaster;",
            "Ljava/util/List<",
            "[D>;I)",
            "Lorg/rabochaya/projects/DemProfile;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 25
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    if-eqz v0, :cond_8

    if-eqz v1, :cond_8

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x2

    if-lt v3, v4, :cond_8

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v3

    const/16 v5, 0x2710

    if-gt v3, v5, :cond_8

    if-lt v2, v4, :cond_8

    const/16 v3, 0x800

    if-gt v2, v3, :cond_8

    .line 26
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v3

    new-array v5, v3, [D

    .line 27
    const/4 v6, 0x0

    move v7, v6

    :goto_0
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v8

    const/4 v9, 0x1

    if-ge v7, v8, :cond_2

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [D

    if-eqz v8, :cond_1

    array-length v10, v8

    if-lt v10, v4, :cond_1

    aget-wide v10, v8, v6

    invoke-static {v10, v11}, Lorg/rabochaya/projects/DemProfile;->finite(D)Z

    move-result v10

    if-eqz v10, :cond_1

    aget-wide v10, v8, v9

    invoke-static {v10, v11}, Lorg/rabochaya/projects/DemProfile;->finite(D)Z

    move-result v10

    if-eqz v10, :cond_1

    aget-wide v10, v8, v6

    invoke-static {v10, v11}, Ljava/lang/Math;->abs(D)D

    move-result-wide v10

    const-wide v12, 0x4066800000000000L    # 180.0

    cmpl-double v10, v10, v12

    if-gtz v10, :cond_1

    aget-wide v10, v8, v9

    invoke-static {v10, v11}, Ljava/lang/Math;->abs(D)D

    move-result-wide v10

    const-wide v12, 0x4056800000000000L    # 90.0

    cmpl-double v10, v10, v12

    if-gtz v10, :cond_1

    if-lez v7, :cond_0

    add-int/lit8 v10, v7, -0x1

    invoke-interface {v1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [D

    aget-wide v12, v5, v10

    aget-wide v14, v11, v6

    aget-wide v16, v11, v9

    aget-wide v18, v8, v6

    aget-wide v20, v8, v9

    invoke-static/range {v14 .. v21}, Lorg/rabochaya/projects/DemProfile;->metres(DDDD)D

    move-result-wide v8

    add-double/2addr v12, v8

    aput-wide v12, v5, v7

    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u041d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u044b\u0435 \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b \u043f\u0440\u043e\u0444\u0438\u043b\u044f"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 28
    :cond_2
    sub-int/2addr v3, v9

    aget-wide v7, v5, v3

    const-wide/16 v10, 0x0

    cmpl-double v4, v7, v10

    if-lez v4, :cond_7

    .line 29
    new-array v4, v2, [D

    new-array v12, v2, [D

    .line 30
    move v13, v6

    move v14, v9

    :goto_1
    if-ge v13, v2, :cond_6

    .line 31
    int-to-double v9, v13

    mul-double/2addr v9, v7

    add-int/lit8 v11, v2, -0x1

    move-wide/from16 v19, v7

    int-to-double v6, v11

    div-double/2addr v9, v6

    aput-wide v9, v4, v13

    .line 32
    :goto_2
    if-ge v14, v3, :cond_4

    aget-wide v6, v5, v14

    cmpg-double v6, v6, v9

    if-ltz v6, :cond_3

    aget-wide v6, v5, v14

    add-int/lit8 v8, v14, -0x1

    aget-wide v21, v5, v8

    cmpl-double v6, v6, v21

    if-nez v6, :cond_4

    :cond_3
    add-int/lit8 v14, v14, 0x1

    goto :goto_2

    .line 33
    :cond_4
    aget-wide v6, v5, v14

    add-int/lit8 v8, v14, -0x1

    aget-wide v21, v5, v8

    sub-double v6, v6, v21

    move v11, v3

    const-wide/16 v2, 0x0

    cmpl-double v16, v6, v2

    if-nez v16, :cond_5

    move-wide v6, v2

    goto :goto_3

    :cond_5
    aget-wide v16, v5, v8

    sub-double v9, v9, v16

    div-double/2addr v9, v6

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    invoke-static {v6, v7, v9, v10}, Ljava/lang/Math;->min(DD)D

    move-result-wide v6

    invoke-static {v2, v3, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v6

    .line 34
    :goto_3
    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [D

    invoke-interface {v1, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [D

    const/4 v10, 0x0

    aget-wide v16, v8, v10

    aget-wide v21, v9, v10

    aget-wide v23, v8, v10

    sub-double v21, v21, v23

    invoke-static/range {v21 .. v22}, Lorg/rabochaya/projects/DemProfile;->longitudeDelta(D)D

    move-result-wide v21

    mul-double v21, v21, v6

    add-double v16, v16, v21

    invoke-static/range {v16 .. v17}, Lorg/rabochaya/projects/DemProfile;->longitudeDelta(D)D

    move-result-wide v2

    .line 35
    const/4 v15, 0x1

    aget-wide v16, v8, v15

    aget-wide v23, v9, v15

    aget-wide v25, v8, v15

    sub-double v23, v23, v25

    mul-double v23, v23, v6

    add-double v6, v16, v23

    invoke-virtual {v0, v2, v3, v6, v7}, Lorg/rabochaya/projects/HgtRaster;->height(DD)D

    move-result-wide v2

    aput-wide v2, v12, v13

    .line 30
    add-int/lit8 v13, v13, 0x1

    move/from16 v2, p2

    move v6, v10

    move v3, v11

    move v9, v15

    move-wide/from16 v7, v19

    const-wide/16 v10, 0x0

    goto/16 :goto_1

    .line 37
    :cond_6
    move-wide/from16 v19, v7

    new-instance v0, Lorg/rabochaya/projects/DemProfile;

    move-wide/from16 v1, v19

    invoke-direct {v0, v4, v12, v1, v2}, Lorg/rabochaya/projects/DemProfile;-><init>([D[DD)V

    return-object v0

    .line 28
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u0414\u043b\u044f \u043f\u0440\u043e\u0444\u0438\u043b\u044f \u043d\u0443\u0436\u043d\u0430 \u043d\u0435\u043d\u0443\u043b\u0435\u0432\u0430\u044f \u0434\u043b\u0438\u043d\u0430"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 25
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u041f\u0440\u043e\u0444\u0438\u043b\u044c: 2\u201310000 \u0432\u0435\u0440\u0448\u0438\u043d \u0438 2\u20132048 \u043e\u0442\u0441\u0447\u0451\u0442\u043e\u0432"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
