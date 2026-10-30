.class public final Lorg/rabochaya/projects/MapMath;
.super Ljava/lang/Object;
.source "MapMath.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clamp(DDD)D
    .locals 0

    .line 5
    invoke-static {p4, p5, p0, p1}, Ljava/lang/Math;->min(DD)D

    move-result-wide p0

    invoke-static {p2, p3, p0, p1}, Ljava/lang/Math;->max(DD)D

    move-result-wide p0

    return-wide p0
.end method

.method public static delta(DD)D
    .locals 0

    .line 10
    sub-double/2addr p0, p2

    const-wide/high16 p2, 0x3fe0000000000000L    # 0.5

    add-double/2addr p2, p0

    invoke-static {p2, p3}, Ljava/lang/Math;->floor(D)D

    move-result-wide p2

    sub-double/2addr p0, p2

    return-wide p0
.end method

.method public static fit([[DII)[D
    .locals 25

    .line 13
    move-object/from16 v0, p0

    array-length v1, v0

    const/4 v2, 0x3

    if-nez v1, :cond_0

    new-array v0, v2, [D

    fill-array-data v0, :array_0

    return-object v0

    .line 14
    :cond_0
    const/4 v1, 0x0

    aget-object v3, v0, v1

    aget-wide v4, v3, v1

    invoke-static {v4, v5}, Lorg/rabochaya/projects/MapMath;->x(D)D

    move-result-wide v3

    .line 15
    array-length v5, v0

    const-wide/high16 v6, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    const-wide/high16 v8, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    move v14, v1

    move-wide v10, v8

    move-wide v12, v10

    move-wide v8, v6

    :goto_0
    const/4 v15, 0x1

    if-ge v14, v5, :cond_1

    aget-object v16, v0, v14

    aget-wide v17, v16, v1

    invoke-static/range {v17 .. v18}, Lorg/rabochaya/projects/MapMath;->x(D)D

    move-result-wide v1

    invoke-static {v1, v2, v3, v4}, Lorg/rabochaya/projects/MapMath;->delta(DD)D

    move-result-wide v1

    add-double/2addr v1, v3

    aget-wide v15, v16, v15

    move-wide/from16 v17, v3

    invoke-static/range {v15 .. v16}, Lorg/rabochaya/projects/MapMath;->y(D)D

    move-result-wide v3

    invoke-static {v6, v7, v1, v2}, Ljava/lang/Math;->min(DD)D

    move-result-wide v6

    invoke-static {v10, v11, v1, v2}, Ljava/lang/Math;->max(DD)D

    move-result-wide v10

    invoke-static {v8, v9, v3, v4}, Ljava/lang/Math;->min(DD)D

    move-result-wide v8

    invoke-static {v12, v13, v3, v4}, Ljava/lang/Math;->max(DD)D

    move-result-wide v12

    add-int/lit8 v14, v14, 0x1

    move-wide/from16 v3, v17

    const/4 v1, 0x0

    const/4 v2, 0x3

    goto :goto_0

    .line 16
    :cond_1
    add-int/lit8 v0, p1, -0x60

    invoke-static {v15, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-double v0, v0

    sub-double v2, v10, v6

    const-wide v4, 0x3e45798ee2308c3aL    # 1.0E-8

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    div-double/2addr v0, v2

    add-int/lit8 v2, p2, -0x60

    invoke-static {v15, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    int-to-double v2, v2

    sub-double v14, v12, v8

    invoke-static {v14, v15, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    div-double/2addr v2, v4

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    .line 17
    const-wide/high16 v2, 0x4070000000000000L    # 256.0

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide v4

    div-double v19, v0, v4

    const-wide/16 v21, 0x0

    const-wide/high16 v23, 0x4032000000000000L    # 18.0

    invoke-static/range {v19 .. v24}, Lorg/rabochaya/projects/MapMath;->clamp(DDD)D

    move-result-wide v0

    .line 18
    add-double/2addr v6, v10

    div-double/2addr v6, v2

    invoke-static {v6, v7}, Lorg/rabochaya/projects/MapMath;->wrap(D)D

    move-result-wide v4

    add-double/2addr v8, v12

    div-double v10, v8, v2

    const-wide/16 v12, 0x0

    const-wide/high16 v14, 0x3ff0000000000000L    # 1.0

    invoke-static/range {v10 .. v15}, Lorg/rabochaya/projects/MapMath;->clamp(DDD)D

    move-result-wide v2

    const/4 v6, 0x3

    new-array v6, v6, [D

    const/4 v7, 0x0

    aput-wide v4, v6, v7

    const/4 v4, 0x1

    aput-wide v2, v6, v4

    const/4 v2, 0x2

    aput-wide v0, v6, v2

    return-object v6

    nop

    :array_0
    .array-data 8
        0x3fe0000000000000L    # 0.5
        0x3fe0000000000000L    # 0.5
        0x4000000000000000L    # 2.0
    .end array-data
.end method

.method public static lat(D)D
    .locals 6

    .line 9
    const-wide/16 v2, 0x0

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    move-wide v0, p0

    invoke-static/range {v0 .. v5}, Lorg/rabochaya/projects/MapMath;->clamp(DDD)D

    move-result-wide p0

    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    mul-double/2addr p0, v0

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v0, p0

    const-wide p0, 0x400921fb54442d18L    # Math.PI

    mul-double/2addr v0, p0

    invoke-static {v0, v1}, Ljava/lang/Math;->sinh(D)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Math;->atan(D)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide p0

    return-wide p0
.end method

.method public static lon(D)D
    .locals 2

    .line 8
    invoke-static {p0, p1}, Lorg/rabochaya/projects/MapMath;->wrap(D)D

    move-result-wide p0

    const-wide v0, 0x4076800000000000L    # 360.0

    mul-double/2addr p0, v0

    const-wide v0, 0x4066800000000000L    # 180.0

    sub-double/2addr p0, v0

    return-wide p0
.end method

.method public static tmsRow(IJ)J
    .locals 4

    .line 11
    if-ltz p0, :cond_0

    const/16 v0, 0x17

    if-gt p0, v0, :cond_0

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    const-wide/16 v0, 0x1

    shl-long v2, v0, p0

    cmp-long p0, p1, v2

    if-gez p0, :cond_0

    sub-long/2addr v2, v0

    sub-long/2addr v2, p1

    return-wide v2

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Invalid tile"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static wrap(D)D
    .locals 2

    .line 4
    invoke-static {p0, p1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    sub-double/2addr p0, v0

    return-wide p0
.end method

.method public static x(D)D
    .locals 2

    .line 6
    const-wide v0, 0x4066800000000000L    # 180.0

    add-double/2addr p0, v0

    const-wide v0, 0x4076800000000000L    # 360.0

    div-double/2addr p0, v0

    return-wide p0
.end method

.method public static y(D)D
    .locals 6

    .line 7
    const-wide v2, -0x3faabcba4e5a8100L    # -85.05112878

    const-wide v4, 0x40554345b1a57f00L    # 85.05112878

    move-wide v0, p0

    invoke-static/range {v0 .. v5}, Lorg/rabochaya/projects/MapMath;->clamp(DDD)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide p0

    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    div-double/2addr p0, v0

    const-wide v2, 0x3fe921fb54442d18L    # 0.7853981633974483

    add-double/2addr p0, v2

    invoke-static {p0, p1}, Ljava/lang/Math;->tan(D)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Math;->log(D)D

    move-result-wide p0

    const-wide v2, 0x400921fb54442d18L    # Math.PI

    div-double/2addr p0, v2

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v2, p0

    div-double/2addr v2, v0

    return-wide v2
.end method
