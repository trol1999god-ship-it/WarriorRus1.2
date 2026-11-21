.class public final Lorg/rabochaya/projects/SvgRaster;
.super Ljava/lang/Object;
.source "SvgRaster.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static render(Lorg/rabochaya/projects/SvgIcon;)Landroid/graphics/Bitmap;
    .locals 18

    .line 6
    move-object/from16 v0, p0

    iget-wide v1, v0, Lorg/rabochaya/projects/SvgIcon;->pixelWidth:D

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    const/4 v2, 0x1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget-wide v3, v0, Lorg/rabochaya/projects/SvgIcon;->pixelHeight:D

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v3, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    const/16 v4, 0x100

    if-gt v1, v4, :cond_6

    if-gt v3, v4, :cond_6

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    :try_start_0
    new-instance v5, Landroid/graphics/Canvas;

    invoke-direct {v5, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/4 v6, 0x0

    invoke-virtual {v5, v6, v6, v1, v3}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    int-to-double v7, v1

    iget-wide v9, v0, Lorg/rabochaya/projects/SvgIcon;->width:D

    div-double v9, v7, v9

    int-to-double v11, v3

    iget-wide v13, v0, Lorg/rabochaya/projects/SvgIcon;->height:D

    div-double v13, v11, v13

    invoke-static {v9, v10, v13, v14}, Ljava/lang/Math;->min(DD)D

    move-result-wide v9

    iget-wide v13, v0, Lorg/rabochaya/projects/SvgIcon;->width:D

    mul-double/2addr v13, v9

    sub-double/2addr v7, v13

    const-wide/high16 v13, 0x4000000000000000L    # 2.0

    div-double/2addr v7, v13

    iget-wide v2, v0, Lorg/rabochaya/projects/SvgIcon;->left:D

    mul-double/2addr v2, v9

    sub-double/2addr v7, v2

    double-to-float v2, v7

    iget-wide v7, v0, Lorg/rabochaya/projects/SvgIcon;->height:D

    mul-double/2addr v7, v9

    sub-double/2addr v11, v7

    div-double/2addr v11, v13

    iget-wide v7, v0, Lorg/rabochaya/projects/SvgIcon;->top:D

    mul-double/2addr v7, v9

    sub-double/2addr v11, v7

    double-to-float v3, v11

    invoke-virtual {v5, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    double-to-float v2, v9

    invoke-virtual {v5, v2, v2}, Landroid/graphics/Canvas;->scale(FF)V

    new-instance v2, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v2, v1}, Landroid/graphics/Paint;-><init>(I)V

    sget-object v3, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    sget-object v3, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    const/high16 v3, 0x40800000    # 4.0f

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeMiter(F)V

    .line 7
    iget-object v0, v0, Lorg/rabochaya/projects/SvgIcon;->shapes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/rabochaya/projects/SvgIcon$Shape;

    iget-object v7, v3, Lorg/rabochaya/projects/SvgIcon$Shape;->path:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_0

    goto :goto_0

    :cond_0
    new-instance v7, Landroid/graphics/Path;

    invoke-direct {v7}, Landroid/graphics/Path;-><init>()V

    iget-boolean v8, v3, Lorg/rabochaya/projects/SvgIcon$Shape;->evenOdd:Z

    if-eqz v8, :cond_1

    sget-object v8, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    goto :goto_1

    :cond_1
    sget-object v8, Landroid/graphics/Path$FillType;->WINDING:Landroid/graphics/Path$FillType;

    :goto_1
    invoke-virtual {v7, v8}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    iget-object v8, v3, Lorg/rabochaya/projects/SvgIcon$Shape;->path:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_2
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/rabochaya/projects/SvgPath$Segment;

    iget-object v9, v8, Lorg/rabochaya/projects/SvgPath$Segment;->values:[D

    iget-char v8, v8, Lorg/rabochaya/projects/SvgPath$Segment;->command:C

    const/4 v10, 0x3

    const/4 v11, 0x2

    sparse-switch v8, :sswitch_data_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    goto :goto_5

    :sswitch_0
    invoke-virtual {v7}, Landroid/graphics/Path;->close()V

    :goto_3
    move-object/from16 v16, v2

    move-object/from16 v17, v7

    goto :goto_4

    :sswitch_1
    aget-wide v12, v9, v6

    double-to-float v8, v12

    const/4 v1, 0x1

    aget-wide v12, v9, v1

    double-to-float v12, v12

    aget-wide v13, v9, v11

    double-to-float v11, v13

    aget-wide v13, v9, v10

    double-to-float v9, v13

    invoke-virtual {v7, v8, v12, v11, v9}, Landroid/graphics/Path;->quadTo(FFFF)V

    goto :goto_3

    :sswitch_2
    aget-wide v10, v9, v6

    double-to-float v8, v10

    const/4 v1, 0x1

    aget-wide v10, v9, v1

    double-to-float v9, v10

    invoke-virtual {v7, v8, v9}, Landroid/graphics/Path;->moveTo(FF)V

    goto :goto_3

    :sswitch_3
    aget-wide v10, v9, v6

    double-to-float v8, v10

    const/4 v1, 0x1

    aget-wide v10, v9, v1

    double-to-float v9, v10

    invoke-virtual {v7, v8, v9}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_3

    :sswitch_4
    aget-wide v12, v9, v6

    double-to-float v12, v12

    const/4 v1, 0x1

    aget-wide v13, v9, v1

    double-to-float v13, v13

    move-object/from16 v16, v2

    aget-wide v1, v9, v11

    double-to-float v11, v1

    aget-wide v1, v9, v10

    double-to-float v1, v1

    const/4 v2, 0x4

    move-object/from16 v17, v7

    aget-wide v6, v9, v2

    double-to-float v2, v6

    const/4 v6, 0x5

    aget-wide v6, v9, v6

    double-to-float v14, v6

    move-object/from16 v8, v17

    move v9, v12

    move v10, v13

    move v12, v1

    move v13, v2

    invoke-virtual/range {v8 .. v14}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    :goto_4
    move-object/from16 v2, v16

    move-object/from16 v7, v17

    const/4 v6, 0x0

    goto :goto_2

    :goto_5
    const-string v1, "SVG: \u043d\u0435\u0438\u0437\u0432\u0435\u0441\u0442\u043d\u044b\u0439 \u0441\u0435\u0433\u043c\u0435\u043d\u0442"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 8
    :cond_2
    move-object/from16 v16, v2

    move-object/from16 v17, v7

    iget-object v1, v3, Lorg/rabochaya/projects/SvgIcon$Shape;->fill:Ljava/lang/Integer;

    if-eqz v1, :cond_3

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    move-object/from16 v2, v16

    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, v3, Lorg/rabochaya/projects/SvgIcon$Shape;->fill:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setColor(I)V

    move-object/from16 v1, v17

    invoke-virtual {v5, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_6

    :cond_3
    move-object/from16 v2, v16

    move-object/from16 v1, v17

    :goto_6
    iget-object v6, v3, Lorg/rabochaya/projects/SvgIcon$Shape;->stroke:Ljava/lang/Integer;

    if-eqz v6, :cond_4

    iget-wide v6, v3, Lorg/rabochaya/projects/SvgIcon$Shape;->strokeWidth:D

    const-wide/16 v8, 0x0

    cmpl-double v6, v6, v8

    if-lez v6, :cond_4

    sget-object v6, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v6, v3, Lorg/rabochaya/projects/SvgIcon$Shape;->stroke:Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v2, v6}, Landroid/graphics/Paint;->setColor(I)V

    iget-wide v6, v3, Lorg/rabochaya/projects/SvgIcon$Shape;->strokeWidth:D

    double-to-float v3, v6

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    invoke-virtual {v5, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    :cond_4
    const/4 v6, 0x0

    goto/16 :goto_0

    :cond_5
    nop

    .line 10
    nop

    .line 9
    return-object v4

    .line 10
    :catchall_0
    move-exception v0

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    throw v0

    .line 6
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "SVG: \u0440\u0430\u0437\u043c\u0435\u0440 \u0438\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u044f \u0431\u043e\u043b\u044c\u0448\u0435256px"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x43 -> :sswitch_4
        0x4c -> :sswitch_3
        0x4d -> :sswitch_2
        0x51 -> :sswitch_1
        0x5a -> :sswitch_0
    .end sparse-switch
.end method
