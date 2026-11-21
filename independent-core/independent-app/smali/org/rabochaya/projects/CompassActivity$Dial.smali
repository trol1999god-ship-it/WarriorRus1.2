.class final Lorg/rabochaya/projects/CompassActivity$Dial;
.super Landroid/view/View;
.source "CompassActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/CompassActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Dial"
.end annotation


# instance fields
.field private final paint:Landroid/graphics/Paint;

.field final synthetic this$0:Lorg/rabochaya/projects/CompassActivity;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/CompassActivity;Landroid/content/Context;)V
    .locals 0

    .line 16
    iput-object p1, p0, Lorg/rabochaya/projects/CompassActivity$Dial;->this$0:Lorg/rabochaya/projects/CompassActivity;

    invoke-direct {p0, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x3

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lorg/rabochaya/projects/CompassActivity$Dial;->paint:Landroid/graphics/Paint;

    const-string p1, "\u041c\u0430\u0433\u043d\u0438\u0442\u043d\u044b\u0439 \u043a\u043e\u043c\u043f\u0430\u0441"

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/CompassActivity$Dial;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 18

    .line 17
    move-object/from16 v0, p0

    move-object/from16 v7, p1

    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/CompassActivity$Dial;->getWidth()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float v8, v1, v2

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/CompassActivity$Dial;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float v9, v1, v2

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/CompassActivity$Dial;->getWidth()I

    move-result v1

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/CompassActivity$Dial;->getHeight()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    int-to-float v1, v1

    const v2, 0x3ec7ae14    # 0.39f

    mul-float v10, v1, v2

    iget-object v1, v0, Lorg/rabochaya/projects/CompassActivity$Dial;->paint:Landroid/graphics/Paint;

    const v11, -0x1a1523

    invoke-virtual {v1, v11}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, v0, Lorg/rabochaya/projects/CompassActivity$Dial;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, v0, Lorg/rabochaya/projects/CompassActivity$Dial;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40400000    # 3.0f

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, v0, Lorg/rabochaya/projects/CompassActivity$Dial;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v8, v9, v10, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v1, v0, Lorg/rabochaya/projects/CompassActivity$Dial;->this$0:Lorg/rabochaya/projects/CompassActivity;

    invoke-static {v1}, Lorg/rabochaya/projects/CompassActivity;->access$000(Lorg/rabochaya/projects/CompassActivity;)D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-eqz v1, :cond_0

    const-wide/16 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, v0, Lorg/rabochaya/projects/CompassActivity$Dial;->this$0:Lorg/rabochaya/projects/CompassActivity;

    invoke-static {v1}, Lorg/rabochaya/projects/CompassActivity;->access$000(Lorg/rabochaya/projects/CompassActivity;)D

    move-result-wide v1

    :goto_0
    move-wide v12, v1

    .line 18
    const/4 v1, 0x0

    move v14, v1

    :goto_1
    const/16 v1, 0x168

    if-ge v14, v1, :cond_3

    int-to-double v1, v14

    sub-double/2addr v1, v12

    invoke-static {v1, v2}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    double-to-float v3, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v1

    double-to-float v1, v1

    iget-object v2, v0, Lorg/rabochaya/projects/CompassActivity$Dial;->paint:Landroid/graphics/Paint;

    if-nez v14, :cond_1

    const v4, -0x129798

    goto :goto_2

    :cond_1
    move v4, v11

    :goto_2
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    mul-float v15, v3, v10

    const v2, 0x3f5eb852    # 0.87f

    mul-float v3, v15, v2

    add-float/2addr v3, v8

    mul-float v16, v1, v10

    mul-float v2, v2, v16

    sub-float v4, v9, v2

    add-float v5, v8, v15

    sub-float v6, v9, v16

    iget-object v2, v0, Lorg/rabochaya/projects/CompassActivity$Dial;->paint:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    move-object/from16 v17, v2

    move v2, v3

    move v3, v4

    move v4, v5

    move v5, v6

    move-object/from16 v6, v17

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    rem-int/lit8 v1, v14, 0x5a

    if-nez v1, :cond_2

    iget-object v1, v0, Lorg/rabochaya/projects/CompassActivity$Dial;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, v0, Lorg/rabochaya/projects/CompassActivity$Dial;->paint:Landroid/graphics/Paint;

    const v2, 0x3e23d70a    # 0.16f

    mul-float/2addr v2, v10

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v1, v0, Lorg/rabochaya/projects/CompassActivity$Dial;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    const-string v1, "\u042e"

    const-string v2, "\u0417"

    const-string v3, "\u0421"

    const-string v4, "\u0412"

    filled-new-array {v3, v4, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    div-int/lit8 v2, v14, 0x5a

    aget-object v1, v1, v2

    const v2, 0x3f333333    # 0.7f

    mul-float/2addr v15, v2

    add-float/2addr v15, v8

    mul-float v16, v16, v2

    sub-float v2, v9, v16

    const v3, 0x3d4ccccd    # 0.05f

    mul-float/2addr v3, v10

    add-float/2addr v2, v3

    iget-object v3, v0, Lorg/rabochaya/projects/CompassActivity$Dial;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v1, v15, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v1, v0, Lorg/rabochaya/projects/CompassActivity$Dial;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    :cond_2
    add-int/lit8 v14, v14, 0xa

    goto/16 :goto_1

    .line 19
    :cond_3
    iget-object v1, v0, Lorg/rabochaya/projects/CompassActivity$Dial;->paint:Landroid/graphics/Paint;

    const v2, -0xf30ae

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, v0, Lorg/rabochaya/projects/CompassActivity$Dial;->paint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v1, 0x40a00000    # 5.0f

    iget-object v3, v0, Lorg/rabochaya/projects/CompassActivity$Dial;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v8, v9, v1, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v1, v0, Lorg/rabochaya/projects/CompassActivity$Dial;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    const v2, 0x3f051eb8    # 0.52f

    mul-float/2addr v2, v10

    sub-float v2, v9, v2

    invoke-virtual {v1, v8, v2}, Landroid/graphics/Path;->moveTo(FF)V

    const v2, 0x3d8f5c29    # 0.07f

    mul-float/2addr v2, v10

    sub-float v3, v8, v2

    const v4, 0x3ebd70a4    # 0.37f

    mul-float/2addr v10, v4

    sub-float/2addr v9, v10

    invoke-virtual {v1, v3, v9}, Landroid/graphics/Path;->lineTo(FF)V

    add-float/2addr v8, v2

    invoke-virtual {v1, v8, v9}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    iget-object v2, v0, Lorg/rabochaya/projects/CompassActivity$Dial;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 20
    return-void
.end method
