.class final Lorg/rabochaya/projects/ProjectMapView;
.super Landroid/view/View;
.source "ProjectMapView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/ProjectMapView$Pick;
    }
.end annotation


# instance fields
.field anchor:D

.field final detector:Landroid/view/ScaleGestureDetector;

.field downX:F

.field downY:F

.field dx:F

.field dy:F

.field final features:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/KmlProject$Feature;",
            ">;"
        }
    .end annotation
.end field

.field lastX:F

.field lastY:F

.field maxX:D

.field maxY:D

.field minX:D

.field minY:D

.field moved:Z

.field final paint:Landroid/graphics/Paint;

.field final pick:Lorg/rabochaya/projects/ProjectMapView$Pick;

.field zoom:F


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/util/List;Lorg/rabochaya/projects/ProjectMapView$Pick;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/KmlProject$Feature;",
            ">;",
            "Lorg/rabochaya/projects/ProjectMapView$Pick;",
            ")V"
        }
    .end annotation

    .line 18
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 12
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    .line 15
    const-wide/high16 v0, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    iput-wide v0, p0, Lorg/rabochaya/projects/ProjectMapView;->minX:D

    iget-wide v0, p0, Lorg/rabochaya/projects/ProjectMapView;->minX:D

    iput-wide v0, p0, Lorg/rabochaya/projects/ProjectMapView;->minY:D

    const-wide/high16 v0, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    iput-wide v0, p0, Lorg/rabochaya/projects/ProjectMapView;->maxX:D

    iget-wide v0, p0, Lorg/rabochaya/projects/ProjectMapView;->maxX:D

    iput-wide v0, p0, Lorg/rabochaya/projects/ProjectMapView;->maxY:D

    .line 16
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lorg/rabochaya/projects/ProjectMapView;->zoom:F

    .line 18
    iput-object p2, p0, Lorg/rabochaya/projects/ProjectMapView;->features:Ljava/util/List;

    iput-object p3, p0, Lorg/rabochaya/projects/ProjectMapView;->pick:Lorg/rabochaya/projects/ProjectMapView$Pick;

    .line 19
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const/4 p3, 0x1

    move v0, p3

    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/KmlProject$Feature;

    iget-object v1, v1, Lorg/rabochaya/projects/KmlProject$Feature;->shapes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/KmlProject$Geometry;

    iget-object v2, v2, Lorg/rabochaya/projects/KmlProject$Geometry;->rings:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [D

    .line 20
    const/4 v5, 0x0

    if-eqz v0, :cond_3

    aget-wide v6, v4, v5

    iput-wide v6, p0, Lorg/rabochaya/projects/ProjectMapView;->anchor:D

    move v0, v5

    :cond_3
    invoke-virtual {p0, v4}, Lorg/rabochaya/projects/ProjectMapView;->mercator([D)[D

    move-result-object v4

    .line 21
    iget-wide v6, p0, Lorg/rabochaya/projects/ProjectMapView;->minX:D

    aget-wide v8, v4, v5

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->min(DD)D

    move-result-wide v6

    iput-wide v6, p0, Lorg/rabochaya/projects/ProjectMapView;->minX:D

    iget-wide v6, p0, Lorg/rabochaya/projects/ProjectMapView;->maxX:D

    aget-wide v8, v4, v5

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(DD)D

    move-result-wide v5

    iput-wide v5, p0, Lorg/rabochaya/projects/ProjectMapView;->maxX:D

    iget-wide v5, p0, Lorg/rabochaya/projects/ProjectMapView;->minY:D

    aget-wide v7, v4, p3

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(DD)D

    move-result-wide v5

    iput-wide v5, p0, Lorg/rabochaya/projects/ProjectMapView;->minY:D

    iget-wide v5, p0, Lorg/rabochaya/projects/ProjectMapView;->maxY:D

    aget-wide v7, v4, p3

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    iput-wide v4, p0, Lorg/rabochaya/projects/ProjectMapView;->maxY:D

    .line 22
    goto :goto_0

    .line 23
    :cond_4
    if-eqz v0, :cond_5

    const-wide/16 p2, 0x0

    iput-wide p2, p0, Lorg/rabochaya/projects/ProjectMapView;->minX:D

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    iput-wide v0, p0, Lorg/rabochaya/projects/ProjectMapView;->maxX:D

    iput-wide p2, p0, Lorg/rabochaya/projects/ProjectMapView;->minY:D

    iput-wide v0, p0, Lorg/rabochaya/projects/ProjectMapView;->maxY:D

    .line 24
    :cond_5
    iget-wide p2, p0, Lorg/rabochaya/projects/ProjectMapView;->maxX:D

    iget-wide v0, p0, Lorg/rabochaya/projects/ProjectMapView;->minX:D

    sub-double/2addr p2, v0

    const-wide v0, 0x3e45798ee2308c3aL    # 1.0E-8

    cmpg-double p2, p2, v0

    const-wide v2, 0x3f1a36e2eb1c432dL    # 1.0E-4

    if-gez p2, :cond_6

    iget-wide p2, p0, Lorg/rabochaya/projects/ProjectMapView;->minX:D

    sub-double/2addr p2, v2

    iput-wide p2, p0, Lorg/rabochaya/projects/ProjectMapView;->minX:D

    iget-wide p2, p0, Lorg/rabochaya/projects/ProjectMapView;->maxX:D

    add-double/2addr p2, v2

    iput-wide p2, p0, Lorg/rabochaya/projects/ProjectMapView;->maxX:D

    .line 25
    :cond_6
    iget-wide p2, p0, Lorg/rabochaya/projects/ProjectMapView;->maxY:D

    iget-wide v4, p0, Lorg/rabochaya/projects/ProjectMapView;->minY:D

    sub-double/2addr p2, v4

    cmpg-double p2, p2, v0

    if-gez p2, :cond_7

    iget-wide p2, p0, Lorg/rabochaya/projects/ProjectMapView;->minY:D

    sub-double/2addr p2, v2

    iput-wide p2, p0, Lorg/rabochaya/projects/ProjectMapView;->minY:D

    iget-wide p2, p0, Lorg/rabochaya/projects/ProjectMapView;->maxY:D

    add-double/2addr p2, v2

    iput-wide p2, p0, Lorg/rabochaya/projects/ProjectMapView;->maxY:D

    .line 26
    :cond_7
    new-instance p2, Landroid/view/ScaleGestureDetector;

    new-instance p3, Lorg/rabochaya/projects/ProjectMapView$1;

    invoke-direct {p3, p0}, Lorg/rabochaya/projects/ProjectMapView$1;-><init>(Lorg/rabochaya/projects/ProjectMapView;)V

    invoke-direct {p2, p1, p3}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectMapView;->detector:Landroid/view/ScaleGestureDetector;

    .line 28
    const-string p1, "\u041b\u043e\u043a\u0430\u043b\u044c\u043d\u0430\u044f \u0441\u0445\u0435\u043c\u0430 \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432. \u041c\u0430\u0441\u0448\u0442\u0430\u0431 \u0438\u0437\u043c\u0435\u043d\u044f\u0435\u0442\u0441\u044f \u0434\u0432\u0443\u043c\u044f \u043f\u0430\u043b\u044c\u0446\u0430\u043c\u0438."

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/ProjectMapView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 29
    return-void
.end method


# virtual methods
.method mercator([D)[D
    .locals 10

    .line 30
    const/4 v0, 0x0

    aget-wide v1, p1, v0

    :goto_0
    iget-wide v3, p0, Lorg/rabochaya/projects/ProjectMapView;->anchor:D

    sub-double v3, v1, v3

    const-wide v5, 0x4066800000000000L    # 180.0

    cmpl-double v3, v3, v5

    const-wide v4, 0x4076800000000000L    # 360.0

    if-lez v3, :cond_0

    sub-double/2addr v1, v4

    goto :goto_0

    :cond_0
    :goto_1
    iget-wide v6, p0, Lorg/rabochaya/projects/ProjectMapView;->anchor:D

    sub-double v6, v1, v6

    const-wide v8, -0x3f99800000000000L    # -180.0

    cmpg-double v3, v6, v8

    if-gez v3, :cond_1

    add-double/2addr v1, v4

    goto :goto_1

    :cond_1
    const-wide v6, 0x40554345b1a57f00L    # 85.05112878

    const/4 v3, 0x1

    aget-wide v8, p1, v3

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->min(DD)D

    move-result-wide v6

    const-wide v8, -0x3faabcba4e5a8100L    # -85.05112878

    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v6

    div-double/2addr v1, v4

    const-wide v8, 0x400921fb54442d18L    # Math.PI

    mul-double/2addr v6, v8

    div-double/2addr v6, v4

    const-wide v4, 0x3fe921fb54442d18L    # 0.7853981633974483

    add-double/2addr v6, v4

    invoke-static {v6, v7}, Ljava/lang/Math;->tan(D)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Math;->log(D)D

    move-result-wide v4

    neg-double v4, v4

    const-wide v6, 0x401921fb54442d18L    # 6.283185307179586

    div-double/2addr v4, v6

    const/4 p1, 0x2

    new-array p1, p1, [D

    aput-wide v1, p1, v0

    aput-wide v4, p1, v3

    return-object p1
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 18

    .line 33
    move-object/from16 v0, p0

    move-object/from16 v7, p1

    const v1, -0xe7dee9

    invoke-virtual {v7, v1}, Landroid/graphics/Canvas;->drawColor(I)V

    iget-object v1, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-virtual {v1, v8}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    const v2, -0xcbbcd5

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 34
    const/4 v9, 0x0

    move v10, v9

    :goto_0
    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/ProjectMapView;->getWidth()I

    move-result v1

    if-ge v10, v1, :cond_0

    int-to-float v4, v10

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/ProjectMapView;->getHeight()I

    move-result v1

    int-to-float v5, v1

    iget-object v6, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    const/4 v3, 0x0

    move-object/from16 v1, p1

    move v2, v4

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v10, v10, 0x40

    goto :goto_0

    .line 35
    :cond_0
    move v10, v9

    :goto_1
    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/ProjectMapView;->getHeight()I

    move-result v1

    if-ge v10, v1, :cond_1

    int-to-float v5, v10

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/ProjectMapView;->getWidth()I

    move-result v1

    int-to-float v4, v1

    iget-object v6, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    move-object/from16 v1, p1

    move v3, v5

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v10, v10, 0x40

    goto :goto_1

    .line 36
    :cond_1
    nop

    .line 37
    iget-object v1, v0, Lorg/rabochaya/projects/ProjectMapView;->features:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move v2, v9

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/rabochaya/projects/KmlProject$Feature;

    .line 38
    nop

    .line 39
    iget-object v6, v3, Lorg/rabochaya/projects/KmlProject$Feature;->shapes:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    const/4 v10, 0x0

    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    const/high16 v12, 0x41000000    # 8.0f

    const/high16 v13, 0x40400000    # 3.0f

    const/4 v14, 0x1

    if-eqz v11, :cond_9

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/rabochaya/projects/KmlProject$Geometry;

    .line 40
    iget-object v15, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    iget v8, v3, Lorg/rabochaya/projects/KmlProject$Feature;->color:I

    invoke-virtual {v15, v8}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v8, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v8, v13}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v8, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    sget-object v13, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v13}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 41
    const-string v8, "Point"

    iget-object v13, v11, Lorg/rabochaya/projects/KmlProject$Geometry;->type:Ljava/lang/String;

    invoke-virtual {v8, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    iget-object v8, v11, Lorg/rabochaya/projects/KmlProject$Geometry;->rings:Ljava/util/List;

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [D

    invoke-virtual {v0, v8}, Lorg/rabochaya/projects/ProjectMapView;->point([D)[F

    move-result-object v8

    iget-object v10, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    sget-object v11, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v10, v11}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    aget v10, v8, v9

    aget v11, v8, v14

    iget-object v13, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v10, v11, v12, v13}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    move-object v10, v8

    goto/16 :goto_6

    .line 43
    :cond_2
    new-instance v8, Landroid/graphics/Path;

    invoke-direct {v8}, Landroid/graphics/Path;-><init>()V

    sget-object v12, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    invoke-virtual {v8, v12}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 44
    iget-object v12, v11, Lorg/rabochaya/projects/KmlProject$Geometry;->rings:Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_3
    :goto_4
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    const-string v15, "Polygon"

    if-eqz v13, :cond_7

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    move/from16 v16, v14

    :goto_5
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_6

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v5, v17

    check-cast v5, [D

    invoke-virtual {v0, v5}, Lorg/rabochaya/projects/ProjectMapView;->point([D)[F

    move-result-object v5

    if-nez v10, :cond_4

    move-object v10, v5

    :cond_4
    if-eqz v16, :cond_5

    aget v4, v5, v9

    aget v5, v5, v14

    invoke-virtual {v8, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    move/from16 v16, v9

    goto :goto_5

    :cond_5
    aget v4, v5, v9

    aget v5, v5, v14

    invoke-virtual {v8, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_5

    :cond_6
    iget-object v4, v11, Lorg/rabochaya/projects/KmlProject$Geometry;->type:Ljava/lang/String;

    invoke-virtual {v15, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {v8}, Landroid/graphics/Path;->close()V

    goto :goto_4

    .line 45
    :cond_7
    iget-object v4, v11, Lorg/rabochaya/projects/KmlProject$Geometry;->type:Ljava/lang/String;

    invoke-virtual {v15, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    iget-object v4, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v4, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    iget v5, v3, Lorg/rabochaya/projects/KmlProject$Feature;->color:I

    const v11, 0xffffff

    and-int/2addr v5, v11

    const/high16 v11, 0x45000000    # 2048.0f

    or-int/2addr v5, v11

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v4, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v8, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    iget-object v4, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    iget v5, v3, Lorg/rabochaya/projects/KmlProject$Feature;->color:I

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v4, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 46
    :cond_8
    iget-object v4, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v8, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 48
    :goto_6
    const/high16 v8, 0x3f800000    # 1.0f

    goto/16 :goto_3

    .line 49
    :cond_9
    if-eqz v10, :cond_b

    add-int/lit8 v4, v2, 0x1

    const/16 v5, 0xc8

    if-ge v2, v5, :cond_a

    iget-object v2, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/ProjectMapView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->scaledDensity:F

    const/high16 v6, 0x41600000    # 14.0f

    mul-float/2addr v5, v6

    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v2, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    const/4 v5, -0x1

    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v2, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    const/high16 v5, -0x1000000

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual {v2, v13, v6, v6, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    iget-object v2, v3, Lorg/rabochaya/projects/KmlProject$Feature;->name:Ljava/lang/String;

    aget v3, v10, v9

    const/high16 v5, 0x41400000    # 12.0f

    add-float/2addr v3, v5

    aget v5, v10, v14

    sub-float/2addr v5, v12

    iget-object v8, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v2, v3, v5, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v2, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->clearShadowLayer()V

    goto :goto_7

    :cond_a
    const/high16 v6, 0x3f800000    # 1.0f

    .line 50
    :goto_7
    move v2, v4

    goto :goto_8

    .line 49
    :cond_b
    const/high16 v6, 0x3f800000    # 1.0f

    .line 50
    :goto_8
    move v8, v6

    goto/16 :goto_2

    .line 51
    :cond_c
    iget-object v1, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/ProjectMapView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->scaledDensity:F

    const/high16 v3, 0x41600000    # 14.0f

    mul-float/2addr v2, v3

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    const/high16 v1, 0x41e00000    # 28.0f

    iget-object v2, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    const-string v3, "\u0421\u0435\u0432\u0435\u0440 \u2191"

    const/high16 v4, 0x41800000    # 16.0f

    invoke-virtual {v7, v3, v4, v1, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 52
    iget-object v1, v0, Lorg/rabochaya/projects/ProjectMapView;->features:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_d

    const/high16 v1, 0x42700000    # 60.0f

    iget-object v2, v0, Lorg/rabochaya/projects/ProjectMapView;->paint:Landroid/graphics/Paint;

    const-string v3, "\u041d\u0435\u0442 \u0432\u0438\u0434\u0438\u043c\u044b\u0445 \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432"

    invoke-virtual {v7, v3, v4, v1, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 53
    :cond_d
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 16

    .line 55
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/rabochaya/projects/ProjectMapView;->detector:Landroid/view/ScaleGestureDetector;

    move-object/from16 v2, p1

    invoke-virtual {v1, v2}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    .line 56
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x1

    packed-switch v4, :pswitch_data_0

    .line 60
    move v2, v6

    return v2

    .line 58
    :pswitch_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    if-ne v2, v6, :cond_1

    iget-object v2, v0, Lorg/rabochaya/projects/ProjectMapView;->detector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v2}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v2

    if-nez v2, :cond_1

    iget v2, v0, Lorg/rabochaya/projects/ProjectMapView;->dx:F

    iget v4, v0, Lorg/rabochaya/projects/ProjectMapView;->lastX:F

    sub-float v4, v1, v4

    add-float/2addr v2, v4

    iput v2, v0, Lorg/rabochaya/projects/ProjectMapView;->dx:F

    iget v2, v0, Lorg/rabochaya/projects/ProjectMapView;->dy:F

    iget v4, v0, Lorg/rabochaya/projects/ProjectMapView;->lastY:F

    sub-float v4, v3, v4

    add-float/2addr v2, v4

    iput v2, v0, Lorg/rabochaya/projects/ProjectMapView;->dy:F

    iget v2, v0, Lorg/rabochaya/projects/ProjectMapView;->downX:F

    sub-float v2, v1, v2

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget v4, v0, Lorg/rabochaya/projects/ProjectMapView;->downY:F

    sub-float v4, v3, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    add-float/2addr v2, v4

    const/high16 v4, 0x41000000    # 8.0f

    cmpl-float v2, v2, v4

    if-lez v2, :cond_0

    iput-boolean v6, v0, Lorg/rabochaya/projects/ProjectMapView;->moved:Z

    :cond_0
    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/ProjectMapView;->invalidate()V

    :cond_1
    iput v1, v0, Lorg/rabochaya/projects/ProjectMapView;->lastX:F

    iput v3, v0, Lorg/rabochaya/projects/ProjectMapView;->lastY:F

    return v6

    .line 59
    :pswitch_1
    iget-boolean v2, v0, Lorg/rabochaya/projects/ProjectMapView;->moved:Z

    if-nez v2, :cond_7

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/ProjectMapView;->performClick()Z

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/ProjectMapView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    const/high16 v4, 0x42200000    # 40.0f

    mul-float/2addr v2, v4

    float-to-double v7, v2

    iget-object v2, v0, Lorg/rabochaya/projects/ProjectMapView;->features:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v4, 0x0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/rabochaya/projects/KmlProject$Feature;

    iget-object v10, v9, Lorg/rabochaya/projects/KmlProject$Feature;->shapes:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_5

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/rabochaya/projects/KmlProject$Geometry;

    iget-object v11, v11, Lorg/rabochaya/projects/KmlProject$Geometry;->rings:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_4

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_3
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_3

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [D

    invoke-virtual {v0, v13}, Lorg/rabochaya/projects/ProjectMapView;->point([D)[F

    move-result-object v13

    aget v14, v13, v5

    sub-float/2addr v14, v1

    float-to-double v14, v14

    aget v13, v13, v6

    sub-float/2addr v13, v3

    float-to-double v5, v13

    invoke-static {v14, v15, v5, v6}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v5

    cmpg-double v13, v5, v7

    if-gez v13, :cond_2

    move-wide v7, v5

    move-object v4, v9

    :cond_2
    const/4 v5, 0x0

    const/4 v6, 0x1

    goto :goto_3

    :cond_3
    const/4 v5, 0x0

    const/4 v6, 0x1

    goto :goto_2

    :cond_4
    const/4 v5, 0x0

    const/4 v6, 0x1

    goto :goto_1

    :cond_5
    const/4 v5, 0x0

    const/4 v6, 0x1

    goto :goto_0

    :cond_6
    if-eqz v4, :cond_7

    iget-object v1, v0, Lorg/rabochaya/projects/ProjectMapView;->pick:Lorg/rabochaya/projects/ProjectMapView$Pick;

    invoke-interface {v1, v4}, Lorg/rabochaya/projects/ProjectMapView$Pick;->picked(Lorg/rabochaya/projects/KmlProject$Feature;)V

    :cond_7
    const/4 v2, 0x1

    return v2

    .line 57
    :pswitch_2
    move v2, v6

    iput v1, v0, Lorg/rabochaya/projects/ProjectMapView;->downX:F

    iput v1, v0, Lorg/rabochaya/projects/ProjectMapView;->lastX:F

    iput v3, v0, Lorg/rabochaya/projects/ProjectMapView;->downY:F

    iput v3, v0, Lorg/rabochaya/projects/ProjectMapView;->lastY:F

    const/4 v1, 0x0

    iput-boolean v1, v0, Lorg/rabochaya/projects/ProjectMapView;->moved:Z

    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public performClick()Z
    .locals 1

    .line 62
    invoke-super {p0}, Landroid/view/View;->performClick()Z

    const/4 v0, 0x1

    return v0
.end method

.method point([D)[F
    .locals 16

    .line 31
    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p1}, Lorg/rabochaya/projects/ProjectMapView;->mercator([D)[D

    move-result-object v1

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/ProjectMapView;->getWidth()I

    move-result v2

    add-int/lit8 v2, v2, -0x40

    int-to-double v2, v2

    iget-wide v4, v0, Lorg/rabochaya/projects/ProjectMapView;->maxX:D

    iget-wide v6, v0, Lorg/rabochaya/projects/ProjectMapView;->minX:D

    sub-double/2addr v4, v6

    div-double/2addr v2, v4

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/ProjectMapView;->getHeight()I

    move-result v4

    add-int/lit8 v4, v4, -0x40

    int-to-double v4, v4

    iget-wide v6, v0, Lorg/rabochaya/projects/ProjectMapView;->maxY:D

    iget-wide v8, v0, Lorg/rabochaya/projects/ProjectMapView;->minY:D

    sub-double/2addr v6, v8

    div-double/2addr v4, v6

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(DD)D

    move-result-wide v2

    iget v4, v0, Lorg/rabochaya/projects/ProjectMapView;->zoom:F

    float-to-double v4, v4

    mul-double/2addr v2, v4

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/ProjectMapView;->getWidth()I

    move-result v4

    const/4 v5, 0x2

    div-int/2addr v4, v5

    int-to-float v4, v4

    iget v6, v0, Lorg/rabochaya/projects/ProjectMapView;->dx:F

    add-float/2addr v4, v6

    float-to-double v6, v4

    const/4 v4, 0x0

    aget-wide v8, v1, v4

    iget-wide v10, v0, Lorg/rabochaya/projects/ProjectMapView;->minX:D

    iget-wide v12, v0, Lorg/rabochaya/projects/ProjectMapView;->maxX:D

    add-double/2addr v10, v12

    const-wide/high16 v12, 0x4000000000000000L    # 2.0

    div-double/2addr v10, v12

    sub-double/2addr v8, v10

    mul-double/2addr v8, v2

    add-double/2addr v6, v8

    double-to-float v6, v6

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/ProjectMapView;->getHeight()I

    move-result v7

    div-int/2addr v7, v5

    int-to-float v7, v7

    iget v8, v0, Lorg/rabochaya/projects/ProjectMapView;->dy:F

    add-float/2addr v7, v8

    float-to-double v7, v7

    const/4 v9, 0x1

    aget-wide v10, v1, v9

    iget-wide v14, v0, Lorg/rabochaya/projects/ProjectMapView;->minY:D

    iget-wide v4, v0, Lorg/rabochaya/projects/ProjectMapView;->maxY:D

    add-double/2addr v14, v4

    div-double/2addr v14, v12

    sub-double/2addr v10, v14

    mul-double/2addr v10, v2

    add-double/2addr v7, v10

    double-to-float v2, v7

    const/4 v3, 0x2

    new-array v3, v3, [F

    const/4 v1, 0x0

    aput v6, v3, v1

    aput v2, v3, v9

    return-object v3
.end method
