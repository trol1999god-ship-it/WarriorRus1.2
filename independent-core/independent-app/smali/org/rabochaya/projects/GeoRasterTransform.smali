.class public final Lorg/rabochaya/projects/GeoRasterTransform;
.super Ljava/lang/Object;
.source "GeoRasterTransform.java"


# static fields
.field public static final HALF_WORLD:D = 2.0037508342789244E7

.field public static final RADIUS:D = 6378137.0


# instance fields
.field private final a:D

.field private final b:D

.field private final c:D

.field public final crs:I

.field private final d:D

.field private final det:D

.field private final e:D

.field public final east:D

.field private final f:D

.field public final height:I

.field public final north:D

.field public final point:Z

.field public final south:D

.field public final west:D

.field public final width:I


# direct methods
.method public constructor <init>(IIIZDDDDDD)V
    .locals 40

    .line 7
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move-wide/from16 v5, p5

    move-wide/from16 v7, p7

    move-wide/from16 v9, p9

    move-wide/from16 v11, p11

    move-wide/from16 v13, p13

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const/4 v15, 0x1

    if-lt v1, v15, :cond_c

    if-lt v2, v15, :cond_c

    const/16 v15, 0x4e20

    if-gt v1, v15, :cond_c

    if-gt v2, v15, :cond_c

    const/16 v15, 0x10e6

    if-eq v3, v15, :cond_0

    const/16 v15, 0xf11

    if-ne v3, v15, :cond_c

    .line 9
    :cond_0
    mul-double v19, v5, v13

    mul-double v21, v7, v11

    sub-double v13, v19, v21

    invoke-static/range {p5 .. p6}, Lorg/rabochaya/projects/GeoRasterTransform;->finite(D)Z

    move-result v15

    if-eqz v15, :cond_b

    invoke-static/range {p7 .. p8}, Lorg/rabochaya/projects/GeoRasterTransform;->finite(D)Z

    move-result v15

    if-eqz v15, :cond_b

    invoke-static/range {p9 .. p10}, Lorg/rabochaya/projects/GeoRasterTransform;->finite(D)Z

    move-result v15

    if-eqz v15, :cond_b

    invoke-static/range {p11 .. p12}, Lorg/rabochaya/projects/GeoRasterTransform;->finite(D)Z

    move-result v15

    if-eqz v15, :cond_b

    invoke-static/range {p13 .. p14}, Lorg/rabochaya/projects/GeoRasterTransform;->finite(D)Z

    move-result v15

    if-eqz v15, :cond_b

    invoke-static/range {p15 .. p16}, Lorg/rabochaya/projects/GeoRasterTransform;->finite(D)Z

    move-result v15

    if-eqz v15, :cond_b

    invoke-static {v13, v14}, Lorg/rabochaya/projects/GeoRasterTransform;->finite(D)Z

    move-result v15

    if-eqz v15, :cond_b

    const-wide/16 v19, 0x0

    cmpl-double v15, v13, v19

    if-eqz v15, :cond_b

    .line 10
    iput v1, v0, Lorg/rabochaya/projects/GeoRasterTransform;->width:I

    iput v2, v0, Lorg/rabochaya/projects/GeoRasterTransform;->height:I

    iput v3, v0, Lorg/rabochaya/projects/GeoRasterTransform;->crs:I

    iput-boolean v4, v0, Lorg/rabochaya/projects/GeoRasterTransform;->point:Z

    iput-wide v5, v0, Lorg/rabochaya/projects/GeoRasterTransform;->a:D

    iput-wide v7, v0, Lorg/rabochaya/projects/GeoRasterTransform;->b:D

    iput-wide v9, v0, Lorg/rabochaya/projects/GeoRasterTransform;->c:D

    iput-wide v11, v0, Lorg/rabochaya/projects/GeoRasterTransform;->d:D

    move-wide v11, v13

    move-wide/from16 v13, p13

    iput-wide v13, v0, Lorg/rabochaya/projects/GeoRasterTransform;->e:D

    move-wide/from16 v13, p15

    iput-wide v13, v0, Lorg/rabochaya/projects/GeoRasterTransform;->f:D

    iput-wide v11, v0, Lorg/rabochaya/projects/GeoRasterTransform;->det:D

    .line 11
    if-eqz v4, :cond_1

    const-wide/high16 v19, -0x4020000000000000L    # -0.5

    :cond_1
    const-wide/high16 v11, 0x3fe0000000000000L    # 0.5

    int-to-double v13, v1

    if-eqz v4, :cond_2

    sub-double/2addr v13, v11

    :cond_2
    int-to-double v1, v2

    if-eqz v4, :cond_3

    sub-double/2addr v1, v11

    .line 12
    :cond_3
    const/4 v4, 0x2

    new-array v11, v4, [D

    const/4 v12, 0x0

    aput-wide v19, v11, v12

    const/4 v15, 0x1

    aput-wide v13, v11, v15

    const-wide/high16 v13, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    const-wide/high16 v21, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    move v15, v12

    move-wide/from16 v23, v13

    move-wide/from16 v25, v21

    move-wide/from16 v27, v25

    :goto_0
    move-wide/from16 v21, v13

    if-ge v15, v4, :cond_a

    aget-wide v29, v11, v15

    new-array v14, v4, [D

    const/16 v31, 0x0

    aput-wide v19, v14, v31

    const/16 v16, 0x1

    aput-wide v1, v14, v16

    move-wide/from16 v32, v21

    move-wide/from16 v34, v23

    move-wide/from16 v36, v25

    move-wide/from16 v38, v27

    move/from16 v12, v31

    :goto_1
    if-ge v12, v4, :cond_9

    aget-wide v21, v14, v12

    mul-double v23, v5, v29

    mul-double v25, v7, v21

    add-double v23, v23, v25

    add-double v23, v23, v9

    mul-double v25, p11, v29

    mul-double v21, v21, p13

    add-double v25, v25, v21

    add-double v25, v25, p15

    invoke-static/range {v23 .. v24}, Lorg/rabochaya/projects/GeoRasterTransform;->finite(D)Z

    move-result v13

    if-eqz v13, :cond_8

    invoke-static/range {v25 .. v26}, Lorg/rabochaya/projects/GeoRasterTransform;->finite(D)Z

    move-result v13

    if-eqz v13, :cond_8

    const/16 v13, 0xf11

    if-ne v3, v13, :cond_4

    invoke-static/range {v23 .. v24}, Ljava/lang/Math;->abs(D)D

    move-result-wide v21

    const-wide v27, 0x41731bf8457c10aeL    # 2.0037508342789344E7

    cmpl-double v17, v21, v27

    if-gtz v17, :cond_8

    invoke-static/range {v25 .. v26}, Ljava/lang/Math;->abs(D)D

    move-result-wide v21

    cmpl-double v17, v21, v27

    if-gtz v17, :cond_8

    :cond_4
    const-wide v21, 0x415854a640000000L    # 6378137.0

    const/16 v4, 0x10e6

    if-ne v3, v4, :cond_5

    goto :goto_2

    :cond_5
    div-double v23, v23, v21

    const-wide v17, 0x4066800000000000L    # 180.0

    mul-double v23, v23, v17

    const-wide v17, 0x400921fb54442d18L    # Math.PI

    div-double v23, v23, v17

    :goto_2
    move-object/from16 v17, v14

    move-wide/from16 v13, v23

    if-ne v3, v4, :cond_6

    goto :goto_3

    :cond_6
    div-double v25, v25, v21

    invoke-static/range {v25 .. v26}, Ljava/lang/Math;->sinh(D)D

    move-result-wide v21

    invoke-static/range {v21 .. v22}, Ljava/lang/Math;->atan(D)D

    move-result-wide v21

    invoke-static/range {v21 .. v22}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v25

    :goto_3
    move-wide/from16 v4, v25

    const-wide v21, -0x3f997fffffff7690L    # -180.000000001

    cmpg-double v21, v13, v21

    if-ltz v21, :cond_7

    const-wide v21, 0x4066800000008970L    # 180.000000001

    cmpl-double v21, v13, v21

    if-gtz v21, :cond_7

    const-wide v21, -0x3fa9800000000000L    # -90.0

    cmpg-double v21, v4, v21

    if-ltz v21, :cond_7

    const-wide v21, 0x4056800000000000L    # 90.0

    cmpl-double v21, v4, v21

    if-gtz v21, :cond_7

    move-wide/from16 v6, v32

    invoke-static {v6, v7, v13, v14}, Ljava/lang/Math;->min(DD)D

    move-result-wide v32

    move-wide/from16 v6, v36

    invoke-static {v6, v7, v13, v14}, Ljava/lang/Math;->max(DD)D

    move-result-wide v36

    move-wide/from16 v13, v34

    invoke-static {v13, v14, v4, v5}, Ljava/lang/Math;->min(DD)D

    move-result-wide v34

    move-wide/from16 v6, v38

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v38

    add-int/lit8 v12, v12, 0x1

    move-wide/from16 v5, p5

    move-wide/from16 v7, p7

    move-object/from16 v14, v17

    const/4 v4, 0x2

    goto/16 :goto_1

    :cond_7
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u044b\u0439 \u0433\u0435\u043e\u0433\u0440\u0430\u0444\u0438\u0447\u0435\u0441\u043a\u0438\u0439 extent"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_8
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u0420\u0430\u0441\u0442\u0440 \u0432\u044b\u0445\u043e\u0434\u0438\u0442 \u0437\u0430 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u043c\u0443\u044e \u043e\u0431\u043b\u0430\u0441\u0442\u044c CRS"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_9
    move-wide/from16 v6, v32

    move-wide/from16 v13, v34

    add-int/lit8 v15, v15, 0x1

    move-wide/from16 v23, v13

    move/from16 v12, v31

    move-wide/from16 v25, v36

    move-wide/from16 v27, v38

    const/4 v4, 0x2

    move-wide v13, v6

    move-wide/from16 v5, p5

    move-wide/from16 v7, p7

    goto/16 :goto_0

    .line 13
    :cond_a
    const-wide v1, -0x3f99800000000000L    # -180.0

    move-wide/from16 v6, v21

    invoke-static {v1, v2, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v1

    iput-wide v1, v0, Lorg/rabochaya/projects/GeoRasterTransform;->west:D

    move-wide/from16 v1, v25

    const-wide v3, 0x4066800000000000L    # 180.0

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->min(DD)D

    move-result-wide v1

    iput-wide v1, v0, Lorg/rabochaya/projects/GeoRasterTransform;->east:D

    move-wide/from16 v13, v23

    iput-wide v13, v0, Lorg/rabochaya/projects/GeoRasterTransform;->south:D

    move-wide/from16 v1, v27

    iput-wide v1, v0, Lorg/rabochaya/projects/GeoRasterTransform;->north:D

    .line 14
    return-void

    .line 9
    :cond_b
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u0412\u044b\u0440\u043e\u0436\u0434\u0435\u043d\u043d\u0430\u044f/\u043d\u0435\u0447\u0438\u0441\u043b\u043e\u0432\u0430\u044f \u0433\u0435\u043e\u043f\u0440\u0438\u0432\u044f\u0437\u043a\u0430"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 8
    :cond_c
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041d\u0435\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u043c\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440 \u0438\u043b\u0438 CRS \u0440\u0430\u0441\u0442\u0440\u0430"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static finite(D)Z
    .locals 1

    .line 16
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

.method public static scale(IIIZDDDDDD)Lorg/rabochaya/projects/GeoRasterTransform;
    .locals 20

    move-wide/from16 v0, p6

    move/from16 v3, p0

    move/from16 v4, p1

    move/from16 v5, p2

    move/from16 v6, p3

    move-wide/from16 v7, p4

    .line 15
    new-instance v19, Lorg/rabochaya/projects/GeoRasterTransform;

    move-object/from16 v2, v19

    mul-double v9, p4, p8

    sub-double v11, p12, v9

    neg-double v9, v0

    move-wide v15, v9

    mul-double v0, v0, p10

    add-double v17, p14, v0

    const-wide/16 v9, 0x0

    const-wide/16 v13, 0x0

    invoke-direct/range {v2 .. v18}, Lorg/rabochaya/projects/GeoRasterTransform;-><init>(IIIZDDDDDD)V

    return-object v19
.end method


# virtual methods
.method public cell(DD)J
    .locals 7

    .line 19
    invoke-static {p1, p2}, Lorg/rabochaya/projects/GeoRasterTransform;->finite(D)Z

    move-result v0

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_3

    invoke-static {p3, p4}, Lorg/rabochaya/projects/GeoRasterTransform;->finite(D)Z

    move-result v0

    if-eqz v0, :cond_3

    const-wide v3, -0x3f99800000000000L    # -180.0

    cmpg-double v0, p1, v3

    if-ltz v0, :cond_3

    const-wide v3, 0x4066800000000000L    # 180.0

    cmpl-double v0, p1, v3

    if-gtz v0, :cond_3

    const-wide v3, -0x3fa9800000000000L    # -90.0

    cmpg-double v0, p3, v3

    if-ltz v0, :cond_3

    const-wide v3, 0x4056800000000000L    # 90.0

    cmpl-double v0, p3, v3

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Lorg/rabochaya/projects/GeoRasterTransform;->crs:I

    const/16 v3, 0x10e6

    if-ne v0, v3, :cond_1

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/rabochaya/projects/GeoRasterTransform;->cellModel(DD)J

    move-result-wide p1

    return-wide p1

    :cond_1
    invoke-static {p3, p4}, Ljava/lang/Math;->abs(D)D

    move-result-wide v3

    const-wide v5, 0x40554345b1a57f00L    # 85.05112878

    cmpl-double v0, v3, v5

    if-lez v0, :cond_2

    return-wide v1

    :cond_2
    invoke-static {p1, p2}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide p1

    const-wide v0, 0x415854a640000000L    # 6378137.0

    mul-double/2addr p1, v0

    invoke-static {p3, p4}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide p3

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    div-double/2addr p3, v2

    const-wide v2, 0x3fe921fb54442d18L    # 0.7853981633974483

    add-double/2addr p3, v2

    invoke-static {p3, p4}, Ljava/lang/Math;->tan(D)D

    move-result-wide p3

    invoke-static {p3, p4}, Ljava/lang/Math;->log(D)D

    move-result-wide p3

    mul-double/2addr p3, v0

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/rabochaya/projects/GeoRasterTransform;->cellModel(DD)J

    move-result-wide p1

    return-wide p1

    :cond_3
    :goto_0
    return-wide v1
.end method

.method public cellModel(DD)J
    .locals 7

    .line 18
    invoke-static {p1, p2}, Lorg/rabochaya/projects/GeoRasterTransform;->finite(D)Z

    move-result v0

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_3

    invoke-static {p3, p4}, Lorg/rabochaya/projects/GeoRasterTransform;->finite(D)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-wide v3, p0, Lorg/rabochaya/projects/GeoRasterTransform;->c:D

    sub-double/2addr p1, v3

    iget-wide v3, p0, Lorg/rabochaya/projects/GeoRasterTransform;->f:D

    sub-double/2addr p3, v3

    iget-wide v3, p0, Lorg/rabochaya/projects/GeoRasterTransform;->e:D

    mul-double/2addr v3, p1

    iget-wide v5, p0, Lorg/rabochaya/projects/GeoRasterTransform;->b:D

    mul-double/2addr v5, p3

    sub-double/2addr v3, v5

    iget-wide v5, p0, Lorg/rabochaya/projects/GeoRasterTransform;->det:D

    div-double/2addr v3, v5

    iget-wide v5, p0, Lorg/rabochaya/projects/GeoRasterTransform;->d:D

    neg-double v5, v5

    mul-double/2addr v5, p1

    iget-wide p1, p0, Lorg/rabochaya/projects/GeoRasterTransform;->a:D

    mul-double/2addr p1, p3

    add-double/2addr v5, p1

    iget-wide p1, p0, Lorg/rabochaya/projects/GeoRasterTransform;->det:D

    div-double/2addr v5, p1

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeoRasterTransform;->point:Z

    if-eqz p1, :cond_1

    const-wide/high16 p1, 0x3fe0000000000000L    # 0.5

    add-double/2addr v3, p1

    add-double/2addr v5, p1

    :cond_1
    invoke-static {v3, v4}, Lorg/rabochaya/projects/GeoRasterTransform;->finite(D)Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-static {v5, v6}, Lorg/rabochaya/projects/GeoRasterTransform;->finite(D)Z

    move-result p1

    if-eqz p1, :cond_3

    const-wide/16 p1, 0x0

    cmpg-double p3, v3, p1

    if-ltz p3, :cond_3

    cmpg-double p1, v5, p1

    if-ltz p1, :cond_3

    iget p1, p0, Lorg/rabochaya/projects/GeoRasterTransform;->width:I

    int-to-double p1, p1

    cmpl-double p1, v3, p1

    if-gez p1, :cond_3

    iget p1, p0, Lorg/rabochaya/projects/GeoRasterTransform;->height:I

    int-to-double p1, p1

    cmpl-double p1, v5, p1

    if-ltz p1, :cond_2

    goto :goto_0

    :cond_2
    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    move-result-wide p1

    double-to-int p1, p1

    int-to-long p1, p1

    const/16 p3, 0x20

    shl-long/2addr p1, p3

    invoke-static {v3, v4}, Ljava/lang/Math;->floor(D)D

    move-result-wide p3

    double-to-int p3, p3

    int-to-long p3, p3

    const-wide v0, 0xffffffffL

    and-long/2addr p3, v0

    or-long/2addr p1, p3

    return-wide p1

    :cond_3
    :goto_0
    return-wide v1
.end method

.method public model(DD)[D
    .locals 4

    .line 20
    iget-wide v0, p0, Lorg/rabochaya/projects/GeoRasterTransform;->a:D

    mul-double/2addr v0, p1

    iget-wide v2, p0, Lorg/rabochaya/projects/GeoRasterTransform;->b:D

    mul-double/2addr v2, p3

    add-double/2addr v0, v2

    iget-wide v2, p0, Lorg/rabochaya/projects/GeoRasterTransform;->c:D

    add-double/2addr v0, v2

    iget-wide v2, p0, Lorg/rabochaya/projects/GeoRasterTransform;->d:D

    mul-double/2addr v2, p1

    iget-wide p1, p0, Lorg/rabochaya/projects/GeoRasterTransform;->e:D

    mul-double/2addr p1, p3

    add-double/2addr v2, p1

    iget-wide p1, p0, Lorg/rabochaya/projects/GeoRasterTransform;->f:D

    add-double/2addr v2, p1

    const/4 p1, 0x2

    new-array p1, p1, [D

    const/4 p2, 0x0

    aput-wide v0, p1, p2

    const/4 p2, 0x1

    aput-wide v2, p1, p2

    return-object p1
.end method
