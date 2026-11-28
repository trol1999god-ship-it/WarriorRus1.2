.class public final Lorg/rabochaya/projects/DemProfileView;
.super Landroid/view/View;
.source "DemProfileView.java"


# instance fields
.field private final density:F

.field private final paint:Landroid/graphics/Paint;

.field private final profile:Lorg/rabochaya/projects/DemProfile;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lorg/rabochaya/projects/DemProfile;)V
    .locals 2

    .line 6
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 5
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lorg/rabochaya/projects/DemProfileView;->paint:Landroid/graphics/Paint;

    .line 6
    iput-object p2, p0, Lorg/rabochaya/projects/DemProfileView;->profile:Lorg/rabochaya/projects/DemProfile;

    invoke-virtual {p0}, Lorg/rabochaya/projects/DemProfileView;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    iput p2, p0, Lorg/rabochaya/projects/DemProfileView;->density:F

    iget-object p2, p0, Lorg/rabochaya/projects/DemProfileView;->paint:Landroid/graphics/Paint;

    invoke-static {p1}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    const-string p1, "\u0413\u0440\u0430\u0444\u0438\u043a \u0432\u044b\u0441\u043e\u0442\u044b DEM; \u043f\u0440\u043e\u043f\u0443\u0441\u043a\u0438 \u043e\u0437\u043d\u0430\u0447\u0430\u044e\u0442 \u043e\u0442\u0441\u0443\u0442\u0441\u0442\u0432\u0438\u0435 \u0434\u0430\u043d\u043d\u044b\u0445"

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/DemProfileView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 22

    .line 7
    move-object/from16 v0, p0

    move-object/from16 v7, p1

    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    const v1, -0xdcd2e3

    invoke-virtual {v7, v1}, Landroid/graphics/Canvas;->drawColor(I)V

    const/high16 v1, 0x42800000    # 64.0f

    iget v2, v0, Lorg/rabochaya/projects/DemProfileView;->density:F

    mul-float v8, v2, v1

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/DemProfileView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x41400000    # 12.0f

    iget v3, v0, Lorg/rabochaya/projects/DemProfileView;->density:F

    mul-float/2addr v3, v2

    sub-float v9, v1, v3

    const/high16 v1, 0x41800000    # 16.0f

    iget v2, v0, Lorg/rabochaya/projects/DemProfileView;->density:F

    mul-float v10, v2, v1

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/DemProfileView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x41f00000    # 30.0f

    iget v3, v0, Lorg/rabochaya/projects/DemProfileView;->density:F

    mul-float/2addr v3, v2

    sub-float v11, v1, v3

    cmpg-float v1, v9, v8

    if-lez v1, :cond_5

    cmpg-float v1, v11, v10

    if-gtz v1, :cond_0

    goto/16 :goto_3

    :cond_0
    iget-object v1, v0, Lorg/rabochaya/projects/DemProfileView;->paint:Landroid/graphics/Paint;

    iget v2, v0, Lorg/rabochaya/projects/DemProfileView;->density:F

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, v0, Lorg/rabochaya/projects/DemProfileView;->paint:Landroid/graphics/Paint;

    const v2, -0x554a5c

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v6, v0, Lorg/rabochaya/projects/DemProfileView;->paint:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    move v2, v8

    move v3, v10

    move v4, v8

    move v5, v11

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v6, v0, Lorg/rabochaya/projects/DemProfileView;->paint:Landroid/graphics/Paint;

    move v3, v11

    move v4, v9

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v1, v0, Lorg/rabochaya/projects/DemProfileView;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41300000    # 11.0f

    iget v3, v0, Lorg/rabochaya/projects/DemProfileView;->density:F

    mul-float/2addr v3, v2

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    iget v1, v0, Lorg/rabochaya/projects/DemProfileView;->density:F

    const/high16 v2, 0x41900000    # 18.0f

    mul-float/2addr v1, v2

    add-float/2addr v1, v11

    iget-object v3, v0, Lorg/rabochaya/projects/DemProfileView;->paint:Landroid/graphics/Paint;

    const-string v4, "0"

    invoke-virtual {v7, v4, v8, v1, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-object v3, v0, Lorg/rabochaya/projects/DemProfileView;->profile:Lorg/rabochaya/projects/DemProfile;

    iget-wide v3, v3, Lorg/rabochaya/projects/DemProfile;->length:D

    const-wide v5, 0x408f400000000000L    # 1000.0

    div-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    const/4 v12, 0x1

    new-array v4, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v3, v4, v13

    const-string v3, "%.2f \u043a\u043c"

    invoke-static {v1, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget-object v3, v0, Lorg/rabochaya/projects/DemProfileView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v3

    sub-float v3, v9, v3

    invoke-static {v8, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    iget v4, v0, Lorg/rabochaya/projects/DemProfileView;->density:F

    mul-float/2addr v4, v2

    add-float/2addr v4, v11

    iget-object v2, v0, Lorg/rabochaya/projects/DemProfileView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v1, v3, v4, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v1, v0, Lorg/rabochaya/projects/DemProfileView;->profile:Lorg/rabochaya/projects/DemProfile;

    iget v1, v1, Lorg/rabochaya/projects/DemProfile;->valid:I

    if-nez v1, :cond_1

    const/high16 v1, 0x41000000    # 8.0f

    iget v2, v0, Lorg/rabochaya/projects/DemProfileView;->density:F

    mul-float/2addr v2, v1

    add-float/2addr v8, v2

    const/high16 v1, 0x41a00000    # 20.0f

    iget v2, v0, Lorg/rabochaya/projects/DemProfileView;->density:F

    mul-float/2addr v2, v1

    add-float/2addr v10, v2

    iget-object v1, v0, Lorg/rabochaya/projects/DemProfileView;->paint:Landroid/graphics/Paint;

    const-string v2, "\u041d\u0435\u0442 \u0434\u0430\u043d\u043d\u044b\u0445"

    invoke-virtual {v7, v2, v8, v10, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void

    :cond_1
    iget-object v1, v0, Lorg/rabochaya/projects/DemProfileView;->profile:Lorg/rabochaya/projects/DemProfile;

    iget-wide v1, v1, Lorg/rabochaya/projects/DemProfile;->min:D

    iget-object v3, v0, Lorg/rabochaya/projects/DemProfileView;->profile:Lorg/rabochaya/projects/DemProfile;

    iget-wide v3, v3, Lorg/rabochaya/projects/DemProfile;->max:D

    cmpl-double v5, v3, v1

    if-nez v5, :cond_2

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v1, v5

    add-double/2addr v3, v5

    :cond_2
    move-wide v14, v1

    move-wide/from16 v16, v3

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static/range {v16 .. v17}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    new-array v3, v12, [Ljava/lang/Object;

    aput-object v2, v3, v13

    const-string v2, "%.0f \u043c"

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget v3, v0, Lorg/rabochaya/projects/DemProfileView;->density:F

    const/high16 v4, 0x40000000    # 2.0f

    mul-float/2addr v3, v4

    const/high16 v5, 0x41200000    # 10.0f

    iget v6, v0, Lorg/rabochaya/projects/DemProfileView;->density:F

    mul-float/2addr v6, v5

    add-float/2addr v6, v10

    iget-object v5, v0, Lorg/rabochaya/projects/DemProfileView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v1, v3, v6, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    new-array v5, v12, [Ljava/lang/Object;

    aput-object v3, v5, v13

    invoke-static {v1, v2, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget v2, v0, Lorg/rabochaya/projects/DemProfileView;->density:F

    mul-float/2addr v2, v4

    iget-object v3, v0, Lorg/rabochaya/projects/DemProfileView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v1, v2, v11, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v1, v0, Lorg/rabochaya/projects/DemProfileView;->paint:Landroid/graphics/Paint;

    const v2, -0xc64501

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, v0, Lorg/rabochaya/projects/DemProfileView;->paint:Landroid/graphics/Paint;

    iget v2, v0, Lorg/rabochaya/projects/DemProfileView;->density:F

    mul-float/2addr v2, v4

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    move v1, v13

    move v6, v1

    :goto_0
    iget-object v4, v0, Lorg/rabochaya/projects/DemProfileView;->profile:Lorg/rabochaya/projects/DemProfile;

    iget-object v4, v4, Lorg/rabochaya/projects/DemProfile;->height:[D

    array-length v4, v4

    if-ge v6, v4, :cond_5

    iget-object v4, v0, Lorg/rabochaya/projects/DemProfileView;->profile:Lorg/rabochaya/projects/DemProfile;

    iget-object v4, v4, Lorg/rabochaya/projects/DemProfile;->height:[D

    aget-wide v18, v4, v6

    invoke-static/range {v18 .. v19}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-eqz v4, :cond_3

    move/from16 v19, v8

    move v1, v13

    move v13, v6

    goto :goto_2

    :cond_3
    sub-float v4, v9, v8

    iget-object v5, v0, Lorg/rabochaya/projects/DemProfileView;->profile:Lorg/rabochaya/projects/DemProfile;

    iget-object v5, v5, Lorg/rabochaya/projects/DemProfile;->distance:[D

    aget-wide v18, v5, v6

    iget-object v5, v0, Lorg/rabochaya/projects/DemProfileView;->profile:Lorg/rabochaya/projects/DemProfile;

    iget-wide v12, v5, Lorg/rabochaya/projects/DemProfile;->length:D

    div-double v12, v18, v12

    double-to-float v5, v12

    mul-float/2addr v4, v5

    add-float v12, v8, v4

    sub-float v4, v11, v10

    iget-object v5, v0, Lorg/rabochaya/projects/DemProfileView;->profile:Lorg/rabochaya/projects/DemProfile;

    iget-object v5, v5, Lorg/rabochaya/projects/DemProfile;->height:[D

    aget-wide v18, v5, v6

    sub-double v18, v18, v14

    sub-double v20, v16, v14

    move v13, v6

    div-double v5, v18, v20

    double-to-float v5, v5

    mul-float/2addr v4, v5

    sub-float v6, v11, v4

    if-eqz v1, :cond_4

    iget-object v5, v0, Lorg/rabochaya/projects/DemProfileView;->paint:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    move v4, v12

    move-object/from16 v18, v5

    move v5, v6

    move/from16 v19, v8

    move v8, v6

    move-object/from16 v6, v18

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_1

    :cond_4
    move/from16 v19, v8

    move v8, v6

    :goto_1
    const/high16 v1, 0x3fc00000    # 1.5f

    iget v2, v0, Lorg/rabochaya/projects/DemProfileView;->density:F

    mul-float/2addr v2, v1

    iget-object v1, v0, Lorg/rabochaya/projects/DemProfileView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v12, v8, v2, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    move v3, v8

    move v2, v12

    const/4 v1, 0x1

    :goto_2
    add-int/lit8 v6, v13, 0x1

    move/from16 v8, v19

    const/4 v12, 0x1

    const/4 v13, 0x0

    goto :goto_0

    :cond_5
    :goto_3
    return-void
.end method
