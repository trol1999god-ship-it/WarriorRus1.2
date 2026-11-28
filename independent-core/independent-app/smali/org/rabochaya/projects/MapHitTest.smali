.class public final Lorg/rabochaya/projects/MapHitTest;
.super Ljava/lang/Object;
.source "MapHitTest.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static crosses(DDDDDD)Z
    .locals 4

    .line 26
    cmpl-double v0, p6, p2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-lez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    cmpl-double v3, p10, p2

    if-lez v3, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    move v3, v2

    :goto_1
    if-eq v0, v3, :cond_2

    sub-double/2addr p8, p4

    sub-double/2addr p2, p6

    mul-double/2addr p8, p2

    sub-double/2addr p10, p6

    div-double/2addr p8, p10

    add-double/2addr p8, p4

    cmpg-double p0, p0, p8

    if-gez p0, :cond_2

    goto :goto_2

    :cond_2
    move v1, v2

    :goto_2
    return v1
.end method

.method public static distance(Ljava/lang/String;Ljava/util/List;DDDIIDD)D
    .locals 36
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "[D>;>;DDDIIDD)D"
        }
    .end annotation

    .line 7
    move-object/from16 v0, p0

    move-wide/from16 v1, p2

    .line 8
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const-wide/high16 v4, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    const/4 v6, 0x0

    move v7, v6

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    const-wide/16 v9, 0x0

    if-eqz v8, :cond_8

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    .line 9
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_0

    goto :goto_0

    .line 10
    :cond_0
    nop

    .line 11
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    const/4 v11, 0x1

    move-wide v12, v9

    move-wide/from16 v24, v12

    move-wide/from16 v26, v24

    move-wide/from16 v28, v26

    move/from16 v30, v11

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    const-string v15, "Polygon"

    if-eqz v14, :cond_5

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, [D

    .line 12
    aget-wide v16, v14, v6

    move/from16 v31, v7

    invoke-static/range {v16 .. v17}, Lorg/rabochaya/projects/MapMath;->x(D)D

    move-result-wide v6

    .line 13
    if-eqz v30, :cond_1

    invoke-static {v6, v7, v1, v2}, Lorg/rabochaya/projects/MapMath;->delta(DD)D

    move-result-wide v6

    goto :goto_2

    :cond_1
    add-double v16, v1, v12

    invoke-static/range {v16 .. v17}, Lorg/rabochaya/projects/MapMath;->wrap(D)D

    move-result-wide v1

    invoke-static {v6, v7, v1, v2}, Lorg/rabochaya/projects/MapMath;->delta(DD)D

    move-result-wide v1

    add-double/2addr v12, v1

    move-wide v6, v12

    .line 14
    :goto_2
    move/from16 v1, p8

    int-to-double v12, v1

    const-wide/high16 v16, 0x4000000000000000L    # 2.0

    div-double v12, v12, v16

    mul-double v18, v6, p6

    add-double v32, v12, v18

    move/from16 v2, p9

    int-to-double v12, v2

    div-double v12, v12, v16

    aget-wide v16, v14, v11

    invoke-static/range {v16 .. v17}, Lorg/rabochaya/projects/MapMath;->y(D)D

    move-result-wide v16

    sub-double v16, v16, p4

    mul-double v16, v16, p6

    add-double v34, v12, v16

    .line 15
    const-string v12, "Point"

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    sub-double v9, p10, v32

    sub-double v12, p12, v34

    invoke-static {v9, v10, v12, v13}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v9

    invoke-static {v4, v5, v9, v10}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    goto :goto_3

    .line 16
    :cond_2
    if-nez v30, :cond_3

    move-wide/from16 v12, p10

    move-object v11, v15

    move-wide/from16 v14, p12

    move-wide/from16 v16, v9

    move-wide/from16 v18, v24

    move-wide/from16 v20, v32

    move-wide/from16 v22, v34

    invoke-static/range {v12 .. v23}, Lorg/rabochaya/projects/MapHitTest;->segment(DDDDDD)D

    move-result-wide v12

    invoke-static {v4, v5, v12, v13}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_3

    move-wide/from16 v12, p10

    move-wide/from16 v14, p12

    move-wide/from16 v16, v9

    move-wide/from16 v18, v24

    move-wide/from16 v20, v32

    move-wide/from16 v22, v34

    invoke-static/range {v12 .. v23}, Lorg/rabochaya/projects/MapHitTest;->crosses(DDDDDD)Z

    move-result v9

    if-eqz v9, :cond_3

    xor-int/lit8 v9, v31, 0x1

    move/from16 v31, v9

    .line 17
    :cond_3
    :goto_3
    if-eqz v30, :cond_4

    move-wide/from16 v26, v32

    move-wide/from16 v28, v34

    const/16 v30, 0x0

    .line 18
    :cond_4
    move-wide/from16 v1, p2

    move-wide v12, v6

    move/from16 v7, v31

    move-wide/from16 v9, v32

    move-wide/from16 v24, v34

    const/4 v6, 0x0

    const/4 v11, 0x1

    goto/16 :goto_1

    .line 19
    :cond_5
    move/from16 v1, p8

    move/from16 v2, p9

    move/from16 v31, v7

    move-object v11, v15

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 20
    move-wide/from16 v12, p10

    move-wide/from16 v14, p12

    move-wide/from16 v16, v9

    move-wide/from16 v18, v24

    move-wide/from16 v20, v26

    move-wide/from16 v22, v28

    invoke-static/range {v12 .. v23}, Lorg/rabochaya/projects/MapHitTest;->segment(DDDDDD)D

    move-result-wide v6

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(DD)D

    move-result-wide v4

    .line 21
    invoke-static/range {v12 .. v23}, Lorg/rabochaya/projects/MapHitTest;->crosses(DDDDDD)Z

    move-result v6

    if-eqz v6, :cond_6

    xor-int/lit8 v6, v31, 0x1

    move v7, v6

    goto :goto_4

    :cond_6
    move/from16 v7, v31

    goto :goto_4

    .line 19
    :cond_7
    move/from16 v7, v31

    .line 23
    :goto_4
    move-wide/from16 v1, p2

    const/4 v6, 0x0

    goto/16 :goto_0

    .line 24
    :cond_8
    if-eqz v7, :cond_9

    move-wide v4, v9

    :cond_9
    return-wide v4
.end method

.method private static segment(DDDDDD)D
    .locals 14

    .line 28
    sub-double v0, p8, p4

    sub-double v2, p10, p6

    mul-double v4, v0, v0

    mul-double v6, v2, v2

    add-double/2addr v4, v6

    .line 29
    const-wide/16 v6, 0x0

    cmpl-double v8, v4, v6

    if-nez v8, :cond_0

    goto :goto_0

    :cond_0
    sub-double v6, p0, p4

    mul-double/2addr v6, v0

    sub-double v8, p2, p6

    mul-double/2addr v8, v2

    add-double/2addr v6, v8

    div-double v8, v6, v4

    const-wide/16 v10, 0x0

    const-wide/high16 v12, 0x3ff0000000000000L    # 1.0

    invoke-static/range {v8 .. v13}, Lorg/rabochaya/projects/MapMath;->clamp(DDD)D

    move-result-wide v6

    .line 30
    :goto_0
    sub-double v4, p0, p4

    mul-double/2addr v0, v6

    sub-double/2addr v4, v0

    sub-double v0, p2, p6

    mul-double/2addr v6, v2

    sub-double/2addr v0, v6

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v0

    return-wide v0
.end method
