.class final Lorg/rabochaya/projects/MapScaleView;
.super Landroid/view/View;
.source "MapScaleView.java"


# static fields
.field private static final EARTH_RADIUS_METRES:D = 6378137.0


# instance fields
.field private barLength:F

.field private final barLimit:I

.field private caption:Ljava/lang/String;

.field private final inset:I

.field private final paint:Landroid/graphics/Paint;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 3

    .line 18
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 12
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lorg/rabochaya/projects/MapScaleView;->paint:Landroid/graphics/Paint;

    .line 15
    const-string v0, ""

    iput-object v0, p0, Lorg/rabochaya/projects/MapScaleView;->caption:Ljava/lang/String;

    .line 19
    const/high16 v0, 0x40e00000    # 7.0f

    invoke-static {p1, v0}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v0

    iput v0, p0, Lorg/rabochaya/projects/MapScaleView;->inset:I

    .line 20
    const/high16 v0, 0x42c00000    # 96.0f

    invoke-static {p1, v0}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v0

    iput v0, p0, Lorg/rabochaya/projects/MapScaleView;->barLimit:I

    .line 21
    iget-object v0, p0, Lorg/rabochaya/projects/MapScaleView;->paint:Landroid/graphics/Paint;

    const v2, -0xf7d1b4

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 22
    iget-object v0, p0, Lorg/rabochaya/projects/MapScaleView;->paint:Landroid/graphics/Paint;

    invoke-static {p1}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 23
    iget-object p1, p0, Lorg/rabochaya/projects/MapScaleView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lorg/rabochaya/projects/MapScaleView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->scaledDensity:F

    const/high16 v2, 0x41300000    # 11.0f

    mul-float/2addr v0, v2

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 24
    invoke-static {}, Lorg/rabochaya/projects/WorkspaceUi;->panel()Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/MapScaleView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 25
    invoke-virtual {p0, v1}, Lorg/rabochaya/projects/MapScaleView;->setImportantForAccessibility(I)V

    .line 26
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 55
    iget-object v0, p0, Lorg/rabochaya/projects/MapScaleView;->caption:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 56
    :cond_0
    invoke-virtual {p0}, Lorg/rabochaya/projects/MapScaleView;->getHeight()I

    move-result v0

    iget v1, p0, Lorg/rabochaya/projects/MapScaleView;->inset:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    .line 57
    iget v1, p0, Lorg/rabochaya/projects/MapScaleView;->inset:I

    int-to-float v1, v1

    iget v2, p0, Lorg/rabochaya/projects/MapScaleView;->barLength:F

    invoke-virtual {p0}, Lorg/rabochaya/projects/MapScaleView;->getWidth()I

    move-result v3

    iget v4, p0, Lorg/rabochaya/projects/MapScaleView;->inset:I

    mul-int/lit8 v4, v4, 0x2

    sub-int/2addr v3, v4

    int-to-float v3, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    add-float v7, v1, v2

    .line 58
    iget-object v1, p0, Lorg/rabochaya/projects/MapScaleView;->paint:Landroid/graphics/Paint;

    iget v2, p0, Lorg/rabochaya/projects/MapScaleView;->inset:I

    int-to-float v2, v2

    const/high16 v3, 0x40800000    # 4.0f

    div-float/2addr v2, v3

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 59
    iget v1, p0, Lorg/rabochaya/projects/MapScaleView;->inset:I

    int-to-float v2, v1

    iget-object v6, p0, Lorg/rabochaya/projects/MapScaleView;->paint:Landroid/graphics/Paint;

    move-object v1, p1

    move v3, v0

    move v4, v7

    move v5, v0

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 60
    iget v1, p0, Lorg/rabochaya/projects/MapScaleView;->inset:I

    int-to-float v2, v1

    iget v1, p0, Lorg/rabochaya/projects/MapScaleView;->inset:I

    int-to-float v1, v1

    const/high16 v8, 0x40000000    # 2.0f

    div-float/2addr v1, v8

    sub-float v3, v0, v1

    iget v1, p0, Lorg/rabochaya/projects/MapScaleView;->inset:I

    int-to-float v4, v1

    iget-object v6, p0, Lorg/rabochaya/projects/MapScaleView;->paint:Landroid/graphics/Paint;

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 61
    iget v1, p0, Lorg/rabochaya/projects/MapScaleView;->inset:I

    int-to-float v1, v1

    div-float/2addr v1, v8

    sub-float v3, v0, v1

    iget-object v6, p0, Lorg/rabochaya/projects/MapScaleView;->paint:Landroid/graphics/Paint;

    move-object v1, p1

    move v2, v7

    move v4, v7

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 62
    iget-object v0, p0, Lorg/rabochaya/projects/MapScaleView;->caption:Ljava/lang/String;

    iget v1, p0, Lorg/rabochaya/projects/MapScaleView;->inset:I

    int-to-float v1, v1

    iget v2, p0, Lorg/rabochaya/projects/MapScaleView;->inset:I

    int-to-float v2, v2

    iget-object v3, p0, Lorg/rabochaya/projects/MapScaleView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->ascent()F

    move-result v3

    sub-float/2addr v2, v3

    iget-object v3, p0, Lorg/rabochaya/projects/MapScaleView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 63
    return-void
.end method

.method protected onMeasure(II)V
    .locals 3

    .line 49
    iget-object v0, p0, Lorg/rabochaya/projects/MapScaleView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v0

    .line 50
    iget v1, p0, Lorg/rabochaya/projects/MapScaleView;->barLimit:I

    iget v2, p0, Lorg/rabochaya/projects/MapScaleView;->inset:I

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    invoke-static {v1, p1}, Lorg/rabochaya/projects/MapScaleView;->resolveSize(II)I

    move-result p1

    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->top:F

    sub-float/2addr v1, v0

    float-to-double v0, v1

    .line 51
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    iget v1, p0, Lorg/rabochaya/projects/MapScaleView;->inset:I

    mul-int/lit8 v1, v1, 0x3

    add-int/2addr v0, v1

    invoke-static {v0, p2}, Lorg/rabochaya/projects/MapScaleView;->resolveSize(II)I

    move-result p2

    .line 50
    invoke-virtual {p0, p1, p2}, Lorg/rabochaya/projects/MapScaleView;->setMeasuredDimension(II)V

    .line 52
    return-void
.end method

.method update(DD)V
    .locals 6

    .line 29
    nop

    .line 30
    invoke-static {p1, p2}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Math;->cos(D)D

    move-result-wide p1

    const-wide v0, 0x41831bf8457c1093L    # 4.007501668557849E7

    mul-double/2addr p1, v0

    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    invoke-static {v0, v1, p3, p4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide p3

    const-wide/high16 v2, 0x4070000000000000L    # 256.0

    mul-double/2addr p3, v2

    div-double/2addr p1, p3

    .line 31
    iget p3, p0, Lorg/rabochaya/projects/MapScaleView;->barLimit:I

    int-to-double p3, p3

    mul-double/2addr p3, p1

    .line 32
    const-wide/16 v2, 0x0

    cmpl-double v2, p3, v2

    if-lez v2, :cond_6

    invoke-static {p3, p4}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v2

    if-eqz v2, :cond_0

    goto/16 :goto_2

    .line 33
    :cond_0
    invoke-static {p3, p4}, Ljava/lang/Math;->log10(D)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    const-wide/high16 v4, 0x4024000000000000L    # 10.0

    invoke-static {v4, v5, v2, v3}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    .line 34
    div-double/2addr p3, v2

    .line 35
    const-wide/high16 v4, 0x4014000000000000L    # 5.0

    cmpl-double v4, p3, v4

    const/4 v5, 0x1

    if-ltz v4, :cond_1

    const/4 p3, 0x5

    goto :goto_0

    :cond_1
    cmpl-double p3, p3, v0

    if-ltz p3, :cond_2

    const/4 p3, 0x2

    goto :goto_0

    :cond_2
    move p3, v5

    :goto_0
    int-to-double p3, p3

    mul-double/2addr v2, p3

    .line 36
    div-double p1, v2, p1

    double-to-float p1, p1

    iput p1, p0, Lorg/rabochaya/projects/MapScaleView;->barLength:F

    .line 38
    const-wide p1, 0x408f400000000000L    # 1000.0

    cmpl-double p3, v2, p1

    const/4 p4, 0x0

    if-ltz p3, :cond_3

    sget-object p3, Ljava/util/Locale;->US:Ljava/util/Locale;

    div-double/2addr v2, p1

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    new-array p2, v5, [Ljava/lang/Object;

    aput-object p1, p2, p4

    const-string p1, "%,.0f \u043a\u043c"

    invoke-static {p3, p1, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 39
    :cond_3
    const-wide/high16 p1, 0x3ff0000000000000L    # 1.0

    cmpl-double p1, v2, p1

    if-ltz p1, :cond_4

    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p2

    new-array p3, v5, [Ljava/lang/Object;

    aput-object p2, p3, p4

    const-string p2, "%.0f \u043c"

    invoke-static {p1, p2, p3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 40
    :cond_4
    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-wide/high16 p2, 0x4059000000000000L    # 100.0

    mul-double/2addr v2, p2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p2

    new-array p3, v5, [Ljava/lang/Object;

    aput-object p2, p3, p4

    const-string p2, "%.0f \u0441\u043c"

    invoke-static {p1, p2, p3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 41
    :goto_1
    iget-object p2, p0, Lorg/rabochaya/projects/MapScaleView;->caption:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_5

    .line 42
    iput-object p1, p0, Lorg/rabochaya/projects/MapScaleView;->caption:Ljava/lang/String;

    .line 43
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "\u041c\u0430\u0441\u0448\u0442\u0430\u0431 \u043a\u0430\u0440\u0442\u044b: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p2, p0, Lorg/rabochaya/projects/MapScaleView;->caption:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/MapScaleView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 45
    :cond_5
    invoke-virtual {p0}, Lorg/rabochaya/projects/MapScaleView;->invalidate()V

    .line 46
    return-void

    .line 32
    :cond_6
    :goto_2
    return-void
.end method
