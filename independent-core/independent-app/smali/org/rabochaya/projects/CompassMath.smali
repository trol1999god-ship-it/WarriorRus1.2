.class public final Lorg/rabochaya/projects/CompassMath;
.super Ljava/lang/Object;
.source "CompassMath.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static finite(D)Z
    .locals 1

    .line 19
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

.method public static heading([F[FI)D
    .locals 21

    .line 6
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    if-eqz v0, :cond_6

    if-eqz v1, :cond_6

    array-length v4, v0

    const/4 v5, 0x3

    if-lt v4, v5, :cond_6

    array-length v4, v1

    if-ge v4, v5, :cond_0

    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    goto/16 :goto_3

    .line 7
    :cond_0
    const/4 v4, 0x0

    aget v5, v0, v4

    float-to-double v5, v5

    const/4 v7, 0x1

    aget v8, v0, v7

    float-to-double v8, v8

    const/4 v10, 0x2

    aget v0, v0, v10

    float-to-double v11, v0

    aget v0, v1, v4

    float-to-double v13, v0

    aget v0, v1, v7

    float-to-double v2, v0

    aget v0, v1, v10

    float-to-double v0, v0

    .line 8
    mul-double v15, v5, v5

    mul-double v17, v8, v8

    add-double v15, v15, v17

    mul-double v17, v11, v11

    add-double v15, v15, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v15

    invoke-static/range {v15 .. v16}, Lorg/rabochaya/projects/CompassMath;->finite(D)Z

    move-result v4

    if-eqz v4, :cond_5

    const-wide v17, 0x3fb999999999999aL    # 0.1

    cmpg-double v4, v15, v17

    if-ltz v4, :cond_5

    invoke-static {v13, v14}, Lorg/rabochaya/projects/CompassMath;->finite(D)Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-static {v2, v3}, Lorg/rabochaya/projects/CompassMath;->finite(D)Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-static {v0, v1}, Lorg/rabochaya/projects/CompassMath;->finite(D)Z

    move-result v4

    if-nez v4, :cond_1

    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    goto/16 :goto_2

    .line 9
    :cond_1
    div-double/2addr v5, v15

    div-double/2addr v8, v15

    div-double/2addr v11, v15

    .line 10
    mul-double v15, v2, v11

    mul-double v17, v0, v8

    sub-double v15, v15, v17

    mul-double/2addr v0, v5

    mul-double v17, v13, v11

    sub-double v0, v0, v17

    mul-double/2addr v13, v8

    mul-double/2addr v2, v5

    sub-double/2addr v13, v2

    mul-double v2, v15, v15

    mul-double v17, v0, v0

    add-double v2, v2, v17

    mul-double v17, v13, v13

    add-double v2, v2, v17

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    .line 11
    invoke-static {v2, v3}, Lorg/rabochaya/projects/CompassMath;->finite(D)Z

    move-result v4

    if-eqz v4, :cond_4

    const-wide v17, 0x3f847ae147ae147bL    # 0.01

    cmpg-double v4, v2, v17

    if-gez v4, :cond_2

    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    goto :goto_1

    :cond_2
    div-double/2addr v15, v2

    div-double/2addr v0, v2

    div-double/2addr v13, v2

    .line 12
    mul-double/2addr v8, v13

    mul-double v2, v11, v0

    sub-double/2addr v8, v2

    mul-double/2addr v11, v15

    mul-double/2addr v5, v13

    sub-double/2addr v11, v5

    .line 13
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    const-wide/16 v6, 0x0

    packed-switch p2, :pswitch_data_0

    move-wide/from16 v19, v2

    move-wide v2, v6

    move-wide/from16 v6, v19

    goto :goto_0

    :pswitch_0
    move-wide v2, v6

    move-wide v6, v4

    goto :goto_0

    :pswitch_1
    move-wide v2, v4

    .line 14
    :goto_0
    :pswitch_2
    mul-double/2addr v15, v2

    mul-double/2addr v0, v6

    add-double/2addr v0, v15

    mul-double/2addr v8, v2

    mul-double/2addr v11, v6

    add-double/2addr v8, v11

    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v2

    const-wide v4, 0x3fa999999999999aL    # 0.05

    cmpg-double v2, v2, v4

    if-gez v2, :cond_3

    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    return-wide v0

    .line 15
    :cond_3
    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/rabochaya/projects/CompassMath;->wrap(D)D

    move-result-wide v0

    return-wide v0

    .line 11
    :cond_4
    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    :goto_1
    return-wide v0

    .line 8
    :cond_5
    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    :goto_2
    return-wide v0

    .line 6
    :cond_6
    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    :goto_3
    return-wide v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public static smooth(DD)D
    .locals 2

    .line 18
    invoke-static {p0, p1}, Lorg/rabochaya/projects/CompassMath;->finite(D)Z

    move-result v0

    if-nez v0, :cond_0

    return-wide p2

    :cond_0
    sub-double/2addr p2, p0

    const-wide v0, 0x4066800000000000L    # 180.0

    add-double/2addr p2, v0

    invoke-static {p2, p3}, Lorg/rabochaya/projects/CompassMath;->wrap(D)D

    move-result-wide p2

    sub-double/2addr p2, v0

    const-wide v0, 0x3fc999999999999aL    # 0.2

    mul-double/2addr p2, v0

    add-double/2addr p0, p2

    invoke-static {p0, p1}, Lorg/rabochaya/projects/CompassMath;->wrap(D)D

    move-result-wide p0

    return-wide p0
.end method

.method public static wrap(D)D
    .locals 2

    .line 17
    const-wide v0, 0x4076800000000000L    # 360.0

    rem-double/2addr p0, v0

    add-double/2addr p0, v0

    rem-double/2addr p0, v0

    return-wide p0
.end method
