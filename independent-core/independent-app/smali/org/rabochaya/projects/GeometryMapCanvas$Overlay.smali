.class final Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;
.super Landroid/view/View;
.source "GeometryMapCanvas.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/GeometryMapCanvas;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Overlay"
.end annotation


# instance fields
.field private down:Landroid/view/MotionEvent;

.field private dragging:Z

.field private forwarding:Z

.field private final paint:Landroid/graphics/Paint;

.field private preview:[D

.field private startX:F

.field private startY:F

.field final synthetic this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

.field private vertex:I


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/GeometryMapCanvas;Landroid/app/Activity;)V
    .locals 0

    .line 78
    iput-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-direct {p0, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 72
    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->paint:Landroid/graphics/Paint;

    .line 74
    const/4 p1, -0x1

    iput p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->vertex:I

    .line 78
    const-string p1, "\u0412\u0435\u0440\u0448\u0438\u043d\u044b \u043a\u043e\u043d\u0442\u0443\u0440\u0430 \u043d\u0430 \u043a\u0430\u0440\u0442\u0435. \u041a\u043e\u0441\u043d\u0438\u0442\u0435\u0441\u044c \u0432\u0435\u0440\u0448\u0438\u043d\u044b \u0438 \u043f\u0435\u0440\u0435\u0442\u0430\u0449\u0438\u0442\u0435. \u0421\u0432\u043e\u0431\u043e\u0434\u043d\u043e\u0435 \u043c\u0435\u0441\u0442\u043e \u2014 \u043f\u0435\u0440\u0435\u043c\u0435\u0449\u0435\u043d\u0438\u0435 \u043a\u0430\u0440\u0442\u044b, \u0434\u0432\u0430 \u043f\u0430\u043b\u044c\u0446\u0430 \u2014 \u043c\u0430\u0441\u0448\u0442\u0430\u0431."

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private forward(Landroid/view/MotionEvent;)V
    .locals 1

    .line 91
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v0}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$200(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/LocalMapView;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/rabochaya/projects/LocalMapView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    return-void
.end method

.method private hit(FF)I
    .locals 9

    .line 89
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    const/high16 v1, 0x41c00000    # 24.0f

    invoke-static {v0, v1}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$600(Lorg/rabochaya/projects/GeometryMapCanvas;F)I

    move-result v0

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v2, v1}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$600(Lorg/rabochaya/projects/GeometryMapCanvas;F)I

    move-result v1

    mul-int/2addr v0, v1

    int-to-double v0, v0

    const/4 v2, -0x1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    iget-object v5, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v5}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$700(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object v5

    invoke-virtual {v5}, Lorg/rabochaya/projects/GeometryMapState;->size()I

    move-result v5

    if-ge v4, v5, :cond_2

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    iget-object v6, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v6}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$700(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object v6

    invoke-virtual {v6, v4}, Lorg/rabochaya/projects/GeometryMapState;->point(I)[D

    move-result-object v6

    invoke-static {v5, v6}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$800(Lorg/rabochaya/projects/GeometryMapCanvas;[D)[F

    move-result-object v5

    aget v6, v5, v3

    sub-float v6, p1, v6

    aget v7, v5, v3

    sub-float v7, p1, v7

    mul-float/2addr v6, v7

    const/4 v7, 0x1

    aget v8, v5, v7

    sub-float v8, p2, v8

    aget v5, v5, v7

    sub-float v5, p2, v5

    mul-float/2addr v8, v5

    add-float/2addr v6, v8

    float-to-double v5, v6

    cmpg-double v7, v5, v0

    if-ltz v7, :cond_0

    cmpl-double v7, v5, v0

    if-nez v7, :cond_1

    iget-object v7, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v7}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$700(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object v7

    invoke-virtual {v7}, Lorg/rabochaya/projects/GeometryMapState;->selected()I

    move-result v7

    if-ne v4, v7, :cond_1

    :cond_0
    move v2, v4

    move-wide v0, v5

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    return v2
.end method

.method private path(Landroid/graphics/Canvas;Ljava/util/List;Ljava/lang/String;II)V
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Canvas;",
            "Ljava/util/List<",
            "[D>;",
            "Ljava/lang/String;",
            "II)V"
        }
    .end annotation

    .line 85
    move-object/from16 v0, p0

    invoke-interface/range {p2 .. p2}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iget-object v2, v0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v2}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$200(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/LocalMapView;

    move-result-object v2

    invoke-virtual {v2}, Lorg/rabochaya/projects/LocalMapView;->viewport()[D

    move-result-object v2

    const/4 v3, 0x2

    aget-wide v4, v2, v3

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    const-wide/high16 v8, 0x4070000000000000L    # 256.0

    mul-double/2addr v4, v8

    .line 86
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    const/4 v9, 0x1

    const-wide/16 v10, 0x0

    move v12, v9

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, [D

    const/4 v14, 0x0

    if-eqz v12, :cond_1

    aget-wide v10, v13, v14

    invoke-static {v10, v11}, Lorg/rabochaya/projects/MapMath;->x(D)D

    move-result-wide v10

    move-wide/from16 v16, v4

    aget-wide v3, v2, v14

    invoke-static {v10, v11, v3, v4}, Lorg/rabochaya/projects/MapMath;->delta(DD)D

    move-result-wide v3

    move-wide v10, v3

    goto :goto_1

    :cond_1
    move-wide/from16 v16, v4

    aget-wide v3, v13, v14

    invoke-static {v3, v4}, Lorg/rabochaya/projects/MapMath;->x(D)D

    move-result-wide v3

    aget-wide v18, v2, v14

    add-double v18, v18, v10

    invoke-static/range {v18 .. v19}, Lorg/rabochaya/projects/MapMath;->wrap(D)D

    move-result-wide v14

    invoke-static {v3, v4, v14, v15}, Lorg/rabochaya/projects/MapMath;->delta(DD)D

    move-result-wide v3

    add-double/2addr v10, v3

    :goto_1
    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->getWidth()I

    move-result v3

    int-to-double v3, v3

    div-double/2addr v3, v6

    mul-double v14, v10, v16

    add-double/2addr v3, v14

    double-to-float v3, v3

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->getHeight()I

    move-result v4

    int-to-double v14, v4

    div-double/2addr v14, v6

    aget-wide v18, v13, v9

    invoke-static/range {v18 .. v19}, Lorg/rabochaya/projects/MapMath;->y(D)D

    move-result-wide v18

    aget-wide v20, v2, v9

    sub-double v18, v18, v20

    mul-double v18, v18, v16

    add-double v14, v14, v18

    double-to-float v4, v14

    if-eqz v12, :cond_2

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    const/4 v12, 0x0

    goto :goto_2

    :cond_2
    invoke-virtual {v1, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    :goto_2
    move-wide/from16 v4, v16

    const/4 v3, 0x2

    goto :goto_0

    .line 87
    :cond_3
    const-string v2, "Polygon"

    move-object/from16 v3, p3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x2

    if-le v2, v3, :cond_4

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    :cond_4
    iget-object v2, v0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, v0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->paint:Landroid/graphics/Paint;

    move/from16 v3, p5

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v2, v0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->paint:Landroid/graphics/Paint;

    move/from16 v3, p4

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v2, v0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->paint:Landroid/graphics/Paint;

    move-object/from16 v3, p1

    invoke-virtual {v3, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 88
    return-void
.end method


# virtual methods
.method cancelGesture()V
    .locals 2

    .line 90
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->forwarding:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->down:Landroid/view/MotionEvent;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->down:Landroid/view/MotionEvent;

    invoke-static {v0}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->setAction(I)V

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v1}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$200(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/LocalMapView;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/rabochaya/projects/LocalMapView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->down:Landroid/view/MotionEvent;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->down:Landroid/view/MotionEvent;

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->down:Landroid/view/MotionEvent;

    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->dragging:Z

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->forwarding:Z

    const/4 v0, -0x1

    iput v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->vertex:I

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->preview:[D

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->invalidate()V

    return-void
.end method

.method synthetic lambda$onTouchEvent$0$org-rabochaya-projects-GeometryMapCanvas$Overlay([D)V
    .locals 5

    .line 105
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v0}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$700(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object v0

    const/4 v1, 0x0

    aget-wide v1, p1, v1

    const/4 v3, 0x1

    aget-wide v3, p1, v3

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/rabochaya/projects/GeometryMapState;->insert(DD)V

    return-void
.end method

.method synthetic lambda$onTouchEvent$1$org-rabochaya-projects-GeometryMapCanvas$Overlay(I[D)V
    .locals 7

    .line 106
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v0}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$700(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object v1

    const/4 v0, 0x0

    aget-wide v3, p2, v0

    const/4 v0, 0x1

    aget-wide v5, p2, v0

    move v2, p1

    invoke-virtual/range {v1 .. v6}, Lorg/rabochaya/projects/GeometryMapState;->move(IDD)V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 80
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v2, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v2}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$400(Lorg/rabochaya/projects/GeometryMapCanvas;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v2}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$400(Lorg/rabochaya/projects/GeometryMapCanvas;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Ljava/util/List;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v2}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$500(Lorg/rabochaya/projects/GeometryMapCanvas;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Ljava/lang/String;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    const/high16 v3, 0x3fc00000    # 1.5f

    invoke-static {v2, v3}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$600(Lorg/rabochaya/projects/GeometryMapCanvas;F)I

    move-result v8

    const v7, -0x564b5e

    move-object v3, p0

    move-object v4, p1

    invoke-direct/range {v3 .. v8}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->path(Landroid/graphics/Canvas;Ljava/util/List;Ljava/lang/String;II)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 81
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move v2, v0

    :goto_1
    iget-object v3, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v3}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$700(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object v3

    invoke-virtual {v3}, Lorg/rabochaya/projects/GeometryMapState;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    iget v3, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->vertex:I

    if-ne v2, v3, :cond_1

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->preview:[D

    if-eqz v3, :cond_1

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->preview:[D

    goto :goto_2

    :cond_1
    iget-object v3, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v3}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$700(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object v3

    invoke-virtual {v3, v2}, Lorg/rabochaya/projects/GeometryMapState;->point(I)[D

    move-result-object v3

    :goto_2
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 82
    :cond_2
    iget-object v2, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v2}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$700(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object v2

    iget-object v5, v2, Lorg/rabochaya/projects/GeometryMapState;->type:Ljava/lang/String;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    const/high16 v3, 0x40400000    # 3.0f

    invoke-static {v2, v3}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$600(Lorg/rabochaya/projects/GeometryMapCanvas;F)I

    move-result v7

    const v6, -0x982109

    move-object v2, p0

    move-object v3, p1

    move-object v4, v1

    invoke-direct/range {v2 .. v7}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->path(Landroid/graphics/Canvas;Ljava/util/List;Ljava/lang/String;II)V

    .line 83
    move v2, v0

    :goto_3
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_8

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [D

    invoke-static {v3, v4}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$800(Lorg/rabochaya/projects/GeometryMapCanvas;[D)[F

    move-result-object v3

    aget v4, v3, v0

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    const/high16 v6, 0x41a00000    # 20.0f

    invoke-static {v5, v6}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$600(Lorg/rabochaya/projects/GeometryMapCanvas;F)I

    move-result v5

    neg-int v5, v5

    int-to-float v5, v5

    cmpg-float v4, v4, v5

    if-ltz v4, :cond_7

    aget v4, v3, v0

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->getWidth()I

    move-result v5

    iget-object v7, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v7, v6}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$600(Lorg/rabochaya/projects/GeometryMapCanvas;F)I

    move-result v7

    add-int/2addr v5, v7

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-gtz v4, :cond_7

    const/4 v4, 0x1

    aget v5, v3, v4

    iget-object v7, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v7, v6}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$600(Lorg/rabochaya/projects/GeometryMapCanvas;F)I

    move-result v7

    neg-int v7, v7

    int-to-float v7, v7

    cmpg-float v5, v5, v7

    if-ltz v5, :cond_7

    aget v5, v3, v4

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->getHeight()I

    move-result v7

    iget-object v8, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v8, v6}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$600(Lorg/rabochaya/projects/GeometryMapCanvas;F)I

    move-result v6

    add-int/2addr v7, v6

    int-to-float v6, v7

    cmpl-float v5, v5, v6

    if-lez v5, :cond_3

    goto/16 :goto_7

    :cond_3
    iget-object v5, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->paint:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->paint:Landroid/graphics/Paint;

    iget-object v6, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v6}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$700(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object v6

    invoke-virtual {v6}, Lorg/rabochaya/projects/GeometryMapState;->selected()I

    move-result v6

    if-ne v2, v6, :cond_4

    const/16 v6, -0x37a9

    goto :goto_4

    :cond_4
    const v6, -0x190401

    :goto_4
    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    aget v5, v3, v0

    aget v6, v3, v4

    iget-object v7, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    iget-object v8, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v8}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$700(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object v8

    invoke-virtual {v8}, Lorg/rabochaya/projects/GeometryMapState;->selected()I

    move-result v8

    const/high16 v9, 0x41100000    # 9.0f

    const/high16 v10, 0x40c00000    # 6.0f

    if-ne v2, v8, :cond_5

    move v8, v9

    goto :goto_5

    :cond_5
    move v8, v10

    :goto_5
    invoke-static {v7, v8}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$600(Lorg/rabochaya/projects/GeometryMapCanvas;F)I

    move-result v7

    int-to-float v7, v7

    iget-object v8, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v6, v7, v8}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->paint:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->paint:Landroid/graphics/Paint;

    iget-object v6, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    const/high16 v7, 0x40000000    # 2.0f

    invoke-static {v6, v7}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$600(Lorg/rabochaya/projects/GeometryMapCanvas;F)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->paint:Landroid/graphics/Paint;

    const v6, -0xe6dbe9

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    aget v5, v3, v0

    aget v3, v3, v4

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    iget-object v6, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v6}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$700(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object v6

    invoke-virtual {v6}, Lorg/rabochaya/projects/GeometryMapState;->selected()I

    move-result v6

    if-ne v2, v6, :cond_6

    goto :goto_6

    :cond_6
    move v9, v10

    :goto_6
    invoke-static {v4, v9}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$600(Lorg/rabochaya/projects/GeometryMapCanvas;F)I

    move-result v4

    int-to-float v4, v4

    iget-object v6, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v3, v4, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :cond_7
    :goto_7
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_3

    .line 84
    :cond_8
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 7

    .line 79
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    if-lez p1, :cond_1

    if-lez p2, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {p1}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$000(Lorg/rabochaya/projects/GeometryMapCanvas;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$002(Lorg/rabochaya/projects/GeometryMapCanvas;Z)Z

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {p1}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$100(Lorg/rabochaya/projects/GeometryMapCanvas;)[D

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {p1}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$100(Lorg/rabochaya/projects/GeometryMapCanvas;)[D

    move-result-object p1

    array-length p1, p1

    const/4 p3, 0x3

    if-ne p1, p3, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {p1}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$200(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/LocalMapView;

    move-result-object v0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {p1}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$100(Lorg/rabochaya/projects/GeometryMapCanvas;)[D

    move-result-object p1

    const/4 p3, 0x0

    aget-wide v1, p1, p3

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {p1}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$100(Lorg/rabochaya/projects/GeometryMapCanvas;)[D

    move-result-object p1

    aget-wide v3, p1, p2

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {p1}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$100(Lorg/rabochaya/projects/GeometryMapCanvas;)[D

    move-result-object p1

    const/4 p2, 0x2

    aget-wide v5, p1, p2

    invoke-virtual/range {v0 .. v6}, Lorg/rabochaya/projects/LocalMapView;->restore(DDD)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {p1}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$300(Lorg/rabochaya/projects/GeometryMapCanvas;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 10

    .line 93
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v0}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$900(Lorg/rabochaya/projects/GeometryMapCanvas;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_13

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v0}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$1000(Lorg/rabochaya/projects/GeometryMapCanvas;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_5

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    .line 94
    const/4 v4, -0x1

    if-nez v0, :cond_4

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->cancelGesture()V

    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->down:Landroid/view/MotionEvent;

    iput v2, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->startX:F

    iput v3, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->startY:F

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v0}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$1100(Lorg/rabochaya/projects/GeometryMapCanvas;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-direct {p0, v2, v3}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->hit(FF)I

    move-result v4

    :goto_0
    iput v4, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->vertex:I

    iget v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->vertex:I

    if-ltz v0, :cond_2

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {p1}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$700(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object p1

    iget v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->vertex:I

    invoke-virtual {p1, v0}, Lorg/rabochaya/projects/GeometryMapState;->select(I)V

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {p1}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$1200(Lorg/rabochaya/projects/GeometryMapCanvas;)V

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {p1}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$1300(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/GeometryMapCanvas$Listener;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u0412\u0435\u0440\u0448\u0438\u043d\u0430 "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->vertex:I

    add-int/2addr v2, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ": \u043f\u0435\u0440\u0435\u0442\u0430\u0449\u0438\u0442\u0435 \u0434\u043b\u044f \u0438\u0437\u043c\u0435\u043d\u0435\u043d\u0438\u044f \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lorg/rabochaya/projects/GeometryMapCanvas$Listener;->message(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v0}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$1100(Lorg/rabochaya/projects/GeometryMapCanvas;)Z

    move-result v0

    if-nez v0, :cond_3

    iput-boolean v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->forwarding:Z

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->forward(Landroid/view/MotionEvent;)V

    :cond_3
    :goto_1
    return v1

    .line 95
    :cond_4
    iget-object v5, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->down:Landroid/view/MotionEvent;

    if-nez v5, :cond_5

    return v1

    .line 96
    :cond_5
    const/4 v5, 0x5

    if-ne v0, v5, :cond_6

    iget-boolean v5, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->forwarding:Z

    if-nez v5, :cond_6

    const/4 v5, 0x0

    iput-object v5, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->preview:[D

    iput v4, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->vertex:I

    iput-boolean v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->forwarding:Z

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->down:Landroid/view/MotionEvent;

    invoke-direct {p0, v4}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->forward(Landroid/view/MotionEvent;)V

    .line 97
    :cond_6
    iget-boolean v4, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->forwarding:Z

    const/4 v5, 0x3

    if-eqz v4, :cond_9

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->forward(Landroid/view/MotionEvent;)V

    if-eq v0, v1, :cond_7

    if-ne v0, v5, :cond_8

    :cond_7
    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->cancelGesture()V

    :cond_8
    return v1

    .line 98
    :cond_9
    const/4 v4, 0x2

    if-ne v0, v4, :cond_c

    iget v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->startX:F

    sub-float v0, v2, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget v6, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->startY:F

    sub-float v6, v3, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    add-float/2addr v0, v6

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v6

    int-to-float v6, v6

    cmpl-float v0, v0, v6

    if-lez v0, :cond_b

    .line 99
    iget v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->vertex:I

    if-ltz v0, :cond_a

    iput-boolean v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->dragging:Z

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {p1, v2, v3}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$1400(Lorg/rabochaya/projects/GeometryMapCanvas;FF)[D

    move-result-object p1

    const/4 v0, 0x0

    aget-wide v2, p1, v0

    aget-wide v6, p1, v1

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {p1}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$700(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object p1

    iget v8, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->vertex:I

    invoke-virtual {p1, v8}, Lorg/rabochaya/projects/GeometryMapState;->point(I)[D

    move-result-object p1

    aget-wide v8, p1, v4

    new-array p1, v5, [D

    aput-wide v2, p1, v0

    aput-wide v6, p1, v1

    aput-wide v8, p1, v4

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->preview:[D

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->invalidate()V

    goto :goto_2

    .line 100
    :cond_a
    iput-boolean v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->forwarding:Z

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->down:Landroid/view/MotionEvent;

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->forward(Landroid/view/MotionEvent;)V

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->forward(Landroid/view/MotionEvent;)V

    .line 101
    :cond_b
    :goto_2
    return v1

    .line 102
    :cond_c
    if-ne v0, v5, :cond_d

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->cancelGesture()V

    return v1

    .line 103
    :cond_d
    if-ne v0, v1, :cond_12

    iget p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->vertex:I

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->dragging:Z

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->cancelGesture()V

    .line 104
    const/4 v4, 0x0

    cmpg-float v5, v2, v4

    if-ltz v5, :cond_11

    cmpg-float v4, v3, v4

    if-ltz v4, :cond_11

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->getWidth()I

    move-result v4

    int-to-float v4, v4

    cmpl-float v4, v2, v4

    if-gtz v4, :cond_11

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->getHeight()I

    move-result v4

    int-to-float v4, v4

    cmpl-float v4, v3, v4

    if-lez v4, :cond_e

    goto :goto_4

    .line 105
    :cond_e
    iget-object v4, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v4}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$1100(Lorg/rabochaya/projects/GeometryMapCanvas;)Z

    move-result v4

    if-eqz v4, :cond_f

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {p1, v2, v3}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$1400(Lorg/rabochaya/projects/GeometryMapCanvas;FF)[D

    move-result-object p1

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    new-instance v2, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, p1}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;[D)V

    invoke-static {v0, v2}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$1500(Lorg/rabochaya/projects/GeometryMapCanvas;Ljava/lang/Runnable;)V

    goto :goto_3

    .line 106
    :cond_f
    if-ltz p1, :cond_10

    if-eqz v0, :cond_10

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {v0, v2, v3}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$1400(Lorg/rabochaya/projects/GeometryMapCanvas;FF)[D

    move-result-object v0

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    new-instance v3, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay$$ExternalSyntheticLambda1;

    invoke-direct {v3, p0, p1, v0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay$$ExternalSyntheticLambda1;-><init>(Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;I[D)V

    invoke-static {v2, v3}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$1500(Lorg/rabochaya/projects/GeometryMapCanvas;Ljava/lang/Runnable;)V

    .line 107
    :cond_10
    :goto_3
    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->performClick()Z

    return v1

    .line 104
    :cond_11
    :goto_4
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->this$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-static {p1}, Lorg/rabochaya/projects/GeometryMapCanvas;->access$1300(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/GeometryMapCanvas$Listener;

    move-result-object p1

    const-string v0, "\u041f\u0435\u0440\u0435\u043d\u043e\u0441 \u043e\u0442\u043c\u0435\u043d\u0451\u043d \u0437\u0430 \u043f\u0440\u0435\u0434\u0435\u043b\u0430\u043c\u0438 \u043a\u0430\u0440\u0442\u044b"

    invoke-interface {p1, v0}, Lorg/rabochaya/projects/GeometryMapCanvas$Listener;->message(Ljava/lang/String;)V

    return v1

    .line 108
    :cond_12
    return v1

    .line 93
    :cond_13
    :goto_5
    return v1
.end method

.method public performClick()Z
    .locals 1

    .line 110
    invoke-super {p0}, Landroid/view/View;->performClick()Z

    const/4 v0, 0x1

    return v0
.end method
