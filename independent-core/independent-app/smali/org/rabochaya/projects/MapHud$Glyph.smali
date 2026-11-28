.class final Lorg/rabochaya/projects/MapHud$Glyph;
.super Landroid/graphics/drawable/Drawable;
.source "MapHud.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/MapHud;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Glyph"
.end annotation


# instance fields
.field private final name:Ljava/lang/String;

.field private final paint:Landroid/graphics/Paint;

.field private final path:Landroid/graphics/Path;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 56
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 53
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    .line 54
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/MapHud$Glyph;->path:Landroid/graphics/Path;

    .line 57
    iput-object p1, p0, Lorg/rabochaya/projects/MapHud$Glyph;->name:Ljava/lang/String;

    .line 58
    iget-object p1, p0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    const v0, 0x3fe66666    # 1.8f

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 59
    iget-object p1, p0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 60
    iget-object p1, p0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 61
    iget-object p1, p0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 62
    return-void
.end method

.method private varargs outline(Landroid/graphics/Canvas;[F)V
    .locals 4

    .line 123
    iget-object v0, p0, Lorg/rabochaya/projects/MapHud$Glyph;->path:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 124
    iget-object v0, p0, Lorg/rabochaya/projects/MapHud$Glyph;->path:Landroid/graphics/Path;

    const/4 v1, 0x0

    aget v1, p2, v1

    const/4 v2, 0x1

    aget v2, p2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 125
    const/4 v0, 0x2

    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lorg/rabochaya/projects/MapHud$Glyph;->path:Landroid/graphics/Path;

    aget v2, p2, v0

    add-int/lit8 v3, v0, 0x1

    aget v3, p2, v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 126
    :cond_0
    iget-object p2, p0, Lorg/rabochaya/projects/MapHud$Glyph;->path:Landroid/graphics/Path;

    iget-object v0, p0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 127
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 23

    .line 65
    move-object/from16 v0, p0

    move-object/from16 v7, p1

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/MapHud$Glyph;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    .line 66
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v8

    .line 67
    iget v2, v1, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget v3, v1, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    invoke-virtual {v7, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 68
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x41c00000    # 24.0f

    div-float/2addr v2, v3

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v3

    invoke-virtual {v7, v2, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 69
    iget-object v1, v0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    const v2, -0x150a01

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 70
    iget-object v1, v0, Lorg/rabochaya/projects/MapHud$Glyph;->name:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    const/4 v3, 0x6

    sparse-switch v2, :sswitch_data_0

    :cond_0
    goto :goto_0

    :sswitch_0
    const-string v2, "compass"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_1

    :sswitch_1
    const-string v2, "minus"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x8

    goto :goto_1

    :sswitch_2
    const-string v2, "marks"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x2

    goto :goto_1

    :sswitch_3
    const-string v2, "files"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x3

    goto :goto_1

    :sswitch_4
    const-string v2, "plus"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x7

    goto :goto_1

    :sswitch_5
    const-string v2, "menu"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_1

    :sswitch_6
    const-string v2, "maps"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_1

    :sswitch_7
    const-string v2, "collapse"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x5

    goto :goto_1

    :sswitch_8
    const-string v2, "expand"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move v1, v3

    goto :goto_1

    :goto_0
    const/4 v1, -0x1

    :goto_1
    const v2, -0x7e3a0e

    const/high16 v4, 0x41400000    # 12.0f

    packed-switch v1, :pswitch_data_0

    .line 117
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown map control: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lorg/rabochaya/projects/MapHud$Glyph;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 114
    :pswitch_0
    const/high16 v5, 0x41400000    # 12.0f

    iget-object v6, v0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40a00000    # 5.0f

    const/high16 v3, 0x41400000    # 12.0f

    const/high16 v4, 0x41980000    # 19.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 115
    goto/16 :goto_2

    .line 110
    :pswitch_1
    const/high16 v5, 0x41980000    # 19.0f

    iget-object v6, v0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41400000    # 12.0f

    const/high16 v3, 0x40a00000    # 5.0f

    const/high16 v4, 0x41400000    # 12.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 111
    const/high16 v5, 0x41400000    # 12.0f

    iget-object v6, v0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40a00000    # 5.0f

    const/high16 v3, 0x41400000    # 12.0f

    const/high16 v4, 0x41980000    # 19.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 112
    goto/16 :goto_2

    .line 107
    :pswitch_2
    new-array v1, v3, [F

    fill-array-data v1, :array_0

    invoke-direct {v0, v7, v1}, Lorg/rabochaya/projects/MapHud$Glyph;->outline(Landroid/graphics/Canvas;[F)V

    .line 108
    goto/16 :goto_2

    .line 104
    :pswitch_3
    new-array v1, v3, [F

    fill-array-data v1, :array_1

    invoke-direct {v0, v7, v1}, Lorg/rabochaya/projects/MapHud$Glyph;->outline(Landroid/graphics/Canvas;[F)V

    .line 105
    goto/16 :goto_2

    .line 99
    :pswitch_4
    const/high16 v1, 0x41180000    # 9.5f

    iget-object v3, v0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v4, v4, v1, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 100
    iget-object v1, v0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 101
    const/16 v1, 0xa

    new-array v1, v1, [F

    fill-array-data v1, :array_2

    invoke-direct {v0, v7, v1}, Lorg/rabochaya/projects/MapHud$Glyph;->outline(Landroid/graphics/Canvas;[F)V

    .line 102
    goto/16 :goto_2

    .line 94
    :pswitch_5
    const/16 v1, 0xe

    new-array v1, v1, [F

    fill-array-data v1, :array_3

    invoke-direct {v0, v7, v1}, Lorg/rabochaya/projects/MapHud$Glyph;->outline(Landroid/graphics/Canvas;[F)V

    .line 95
    iget-object v1, v0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 96
    const/high16 v5, 0x41300000    # 11.0f

    iget-object v6, v0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40800000    # 4.0f

    const/high16 v3, 0x41300000    # 11.0f

    const/high16 v4, 0x41a00000    # 20.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 97
    goto/16 :goto_2

    .line 83
    :pswitch_6
    iget-object v1, v0, Lorg/rabochaya/projects/MapHud$Glyph;->path:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 84
    iget-object v1, v0, Lorg/rabochaya/projects/MapHud$Glyph;->path:Landroid/graphics/Path;

    const/high16 v3, 0x41b00000    # 22.0f

    invoke-virtual {v1, v4, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 85
    iget-object v9, v0, Lorg/rabochaya/projects/MapHud$Glyph;->path:Landroid/graphics/Path;

    const/high16 v14, 0x40a00000    # 5.0f

    const/high16 v15, 0x41100000    # 9.0f

    const/high16 v10, 0x41100000    # 9.0f

    const/high16 v11, 0x41900000    # 18.0f

    const/high16 v12, 0x40a00000    # 5.0f

    const/high16 v13, 0x41600000    # 14.0f

    invoke-virtual/range {v9 .. v15}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 86
    iget-object v1, v0, Lorg/rabochaya/projects/MapHud$Glyph;->path:Landroid/graphics/Path;

    const/high16 v21, 0x41980000    # 19.0f

    const/high16 v22, 0x41100000    # 9.0f

    const/high16 v17, 0x40a00000    # 5.0f

    const/16 v18, 0x0

    const/high16 v19, 0x41980000    # 19.0f

    const/16 v20, 0x0

    move-object/from16 v16, v1

    invoke-virtual/range {v16 .. v22}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 87
    iget-object v9, v0, Lorg/rabochaya/projects/MapHud$Glyph;->path:Landroid/graphics/Path;

    const/high16 v14, 0x41400000    # 12.0f

    const/high16 v15, 0x41b00000    # 22.0f

    const/high16 v10, 0x41980000    # 19.0f

    const/high16 v11, 0x41600000    # 14.0f

    const/high16 v12, 0x41700000    # 15.0f

    const/high16 v13, 0x41900000    # 18.0f

    invoke-virtual/range {v9 .. v15}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 88
    iget-object v1, v0, Lorg/rabochaya/projects/MapHud$Glyph;->path:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    .line 89
    iget-object v1, v0, Lorg/rabochaya/projects/MapHud$Glyph;->path:Landroid/graphics/Path;

    iget-object v3, v0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v7, v1, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 90
    iget-object v1, v0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 91
    const v1, 0x4019999a    # 2.4f

    iget-object v2, v0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x41100000    # 9.0f

    invoke-virtual {v7, v4, v3, v1, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 92
    goto :goto_2

    .line 77
    :pswitch_7
    const/16 v1, 0x12

    new-array v1, v1, [F

    fill-array-data v1, :array_4

    invoke-direct {v0, v7, v1}, Lorg/rabochaya/projects/MapHud$Glyph;->outline(Landroid/graphics/Canvas;[F)V

    .line 78
    iget-object v1, v0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 79
    const/high16 v5, 0x41900000    # 18.0f

    iget-object v6, v0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41000000    # 8.0f

    const/high16 v3, 0x40400000    # 3.0f

    const/high16 v4, 0x41000000    # 8.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 80
    const/high16 v5, 0x41a80000    # 21.0f

    iget-object v6, v0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x41800000    # 16.0f

    const/high16 v3, 0x40c00000    # 6.0f

    const/high16 v4, 0x41800000    # 16.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 81
    goto :goto_2

    .line 72
    :pswitch_8
    const/high16 v5, 0x40c00000    # 6.0f

    iget-object v6, v0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    const/high16 v2, 0x40800000    # 4.0f

    const/high16 v3, 0x40c00000    # 6.0f

    const/high16 v4, 0x41a00000    # 20.0f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 73
    const/high16 v5, 0x41400000    # 12.0f

    iget-object v6, v0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x41400000    # 12.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 74
    const/high16 v5, 0x41900000    # 18.0f

    iget-object v6, v0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 75
    nop

    .line 119
    :goto_2
    invoke-virtual {v7, v8}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 120
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x4cd72166 -> :sswitch_8
        -0x25acdc53 -> :sswitch_7
        0x330697 -> :sswitch_6
        0x33155f -> :sswitch_5
        0x348d9a -> :sswitch_4
        0x5ceba77 -> :sswitch_3
        0x62dd346 -> :sswitch_2
        0x6316870 -> :sswitch_1
        0x38a73d12 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :array_0
    .array-data 4
        0x41100000    # 9.0f
        0x40c00000    # 6.0f
        0x41700000    # 15.0f
        0x41400000    # 12.0f
        0x41100000    # 9.0f
        0x41900000    # 18.0f
    .end array-data

    :array_1
    .array-data 4
        0x40c00000    # 6.0f
        0x41700000    # 15.0f
        0x41400000    # 12.0f
        0x41100000    # 9.0f
        0x41900000    # 18.0f
        0x41700000    # 15.0f
    .end array-data

    :array_2
    .array-data 4
        0x41800000    # 16.0f
        0x40e00000    # 7.0f
        0x41500000    # 13.0f
        0x41600000    # 14.0f
        0x41000000    # 8.0f
        0x41880000    # 17.0f
        0x41300000    # 11.0f
        0x41200000    # 10.0f
        0x41800000    # 16.0f
        0x40e00000    # 7.0f
    .end array-data

    :array_3
    .array-data 4
        0x40000000    # 2.0f
        0x41a00000    # 20.0f
        0x40000000    # 2.0f
        0x40a00000    # 5.0f
        0x41100000    # 9.0f
        0x40a00000    # 5.0f
        0x41300000    # 11.0f
        0x41000000    # 8.0f
        0x41b00000    # 22.0f
        0x41000000    # 8.0f
        0x41b00000    # 22.0f
        0x41a00000    # 20.0f
        0x40000000    # 2.0f
        0x41a00000    # 20.0f
    .end array-data

    :array_4
    .array-data 4
        0x40000000    # 2.0f
        0x40c00000    # 6.0f
        0x41000000    # 8.0f
        0x40400000    # 3.0f
        0x41800000    # 16.0f
        0x40c00000    # 6.0f
        0x41b00000    # 22.0f
        0x40400000    # 3.0f
        0x41b00000    # 22.0f
        0x41900000    # 18.0f
        0x41800000    # 16.0f
        0x41a80000    # 21.0f
        0x41000000    # 8.0f
        0x41900000    # 18.0f
        0x40000000    # 2.0f
        0x41a80000    # 21.0f
        0x40000000    # 2.0f
        0x40c00000    # 6.0f
    .end array-data
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .line 130
    const/16 v0, 0x18

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .line 129
    const/16 v0, 0x18

    return v0
.end method

.method public getOpacity()I
    .locals 1

    .line 133
    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .locals 1

    .line 131
    iget-object v0, p0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .line 132
    iget-object v0, p0, Lorg/rabochaya/projects/MapHud$Glyph;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
