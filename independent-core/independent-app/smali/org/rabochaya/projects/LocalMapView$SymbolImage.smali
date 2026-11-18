.class final Lorg/rabochaya/projects/LocalMapView$SymbolImage;
.super Ljava/lang/Object;
.source "LocalMapView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/LocalMapView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SymbolImage"
.end annotation


# instance fields
.field final anchorX:F

.field final anchorY:F

.field final bitmap:Landroid/graphics/Bitmap;

.field final color:Ljava/lang/Integer;

.field final heading:F

.field final scale:F


# direct methods
.method constructor <init>(Landroid/graphics/Bitmap;Ljava/util/Map;Ljava/lang/Integer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Integer;",
            ")V"
        }
    .end annotation

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView$SymbolImage;->bitmap:Landroid/graphics/Bitmap;

    iput-object p3, p0, Lorg/rabochaya/projects/LocalMapView$SymbolImage;->color:Ljava/lang/Integer;

    const-string p3, "scale"

    invoke-interface {p2, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    const/high16 v0, 0x41800000    # 16.0f

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    invoke-static {p3, v1, v2, v0}, Lorg/rabochaya/projects/LocalMapView;->access$000(Ljava/lang/String;FFF)F

    move-result p3

    iput p3, p0, Lorg/rabochaya/projects/LocalMapView$SymbolImage;->scale:F

    const-string p3, "heading"

    invoke-interface {p2, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    const/high16 v0, -0x3c4c0000    # -360.0f

    const/high16 v1, 0x43b40000    # 360.0f

    invoke-static {p3, v2, v0, v1}, Lorg/rabochaya/projects/LocalMapView;->access$000(Ljava/lang/String;FFF)F

    move-result p3

    iput p3, p0, Lorg/rabochaya/projects/LocalMapView$SymbolImage;->heading:F

    const-string p3, "x"

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-static {p2, p3, v0}, Lorg/rabochaya/projects/LocalMapView$SymbolImage;->anchor(Ljava/util/Map;Ljava/lang/String;I)F

    move-result p3

    iput p3, p0, Lorg/rabochaya/projects/LocalMapView$SymbolImage;->anchorX:F

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p3

    int-to-float p3, p3

    const-string v0, "y"

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-static {p2, v0, v1}, Lorg/rabochaya/projects/LocalMapView$SymbolImage;->anchor(Ljava/util/Map;Ljava/lang/String;I)F

    move-result p2

    sub-float/2addr p3, p2

    iput p3, p0, Lorg/rabochaya/projects/LocalMapView$SymbolImage;->anchorY:F

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    int-to-float p2, p2

    iget p3, p0, Lorg/rabochaya/projects/LocalMapView$SymbolImage;->scale:F

    mul-float/2addr p2, p3

    const/high16 p3, 0x43800000    # 256.0f

    cmpl-float p2, p2, p3

    if-gtz p2, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    int-to-float p1, p1

    iget p2, p0, Lorg/rabochaya/projects/LocalMapView$SymbolImage;->scale:F

    mul-float/2addr p1, p2

    cmpl-float p1, p1, p3

    if-gtz p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "SVG: \u043c\u0430\u0441\u0448\u0442\u0430\u0431 \u0431\u043e\u043b\u044c\u0448\u0435256px"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static anchor(Ljava/util/Map;Ljava/lang/String;I)F
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "I)F"
        }
    .end annotation

    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "hotSpot."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/high16 v2, -0x3a800000    # -4096.0f

    const/high16 v3, 0x45800000    # 4096.0f

    const/high16 v4, 0x3f000000    # 0.5f

    invoke-static {v0, v4, v2, v3}, Lorg/rabochaya/projects/LocalMapView;->access$000(Ljava/lang/String;FFF)F

    move-result v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, "units"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_3

    const-string p1, "fraction"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const-string p1, "pixels"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    return v0

    :cond_1
    const-string p1, "insetPixels"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    int-to-float p0, p2

    sub-float/2addr p0, v0

    return p0

    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "SVG: \u043d\u0435\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u043d\u0430\u044f \u0435\u0434\u0438\u043d\u0438\u0446\u0430 hotSpot"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3
    :goto_0
    int-to-float p0, p2

    mul-float/2addr v0, p0

    return v0
.end method
