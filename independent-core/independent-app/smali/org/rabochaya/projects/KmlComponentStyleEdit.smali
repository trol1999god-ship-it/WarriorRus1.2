.class public final Lorg/rabochaya/projects/KmlComponentStyleEdit;
.super Ljava/lang/Object;
.source "KmlComponentStyleEdit.java"


# static fields
.field private static final NS:Ljava/lang/String; = "http://www.opengis.net/kml/2.2"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static add(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 7

    .line 19
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    invoke-static {p0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->order(Lorg/w3c/dom/Element;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, -0x1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    array-length v5, v1

    if-ge v4, v5, :cond_1

    aget-object v5, v1, v4

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v2, v4

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    if-ltz v2, :cond_5

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p1

    :goto_1
    if-eqz p1, :cond_5

    const/4 v4, 0x1

    add-int/lit8 v5, v2, 0x1

    :goto_2
    array-length v6, v1

    if-ge v5, v6, :cond_3

    aget-object v6, v1, v5

    invoke-static {p1, v6}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    goto :goto_3

    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_3
    move v4, v3

    :goto_3
    if-eqz v4, :cond_4

    goto :goto_4

    :cond_4
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p1

    goto :goto_1

    :cond_5
    const/4 p1, 0x0

    :goto_4
    invoke-interface {p0, v0, p1}, Lorg/w3c/dom/Element;->insertBefore(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    return-object v0
.end method

.method private static addInlineStyle(Lorg/w3c/dom/Element;)Lorg/w3c/dom/Element;
    .locals 3

    .line 28
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Style"

    invoke-interface {v0, v1, v2}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v1

    :goto_0
    if-eqz v1, :cond_1

    const-string v2, "Region"

    invoke-static {v1, v2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "Metadata"

    invoke-static {v1, v2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "ExtendedData"

    invoke-static {v1, v2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "AbstractFeatureSimpleExtensionGroup"

    invoke-static {v1, v2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "AbstractFeatureObjectExtensionGroup"

    invoke-static {v1, v2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "Point"

    invoke-static {v1, v2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "LineString"

    invoke-static {v1, v2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "LinearRing"

    invoke-static {v1, v2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "Polygon"

    invoke-static {v1, v2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "MultiGeometry"

    invoke-static {v1, v2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "Model"

    invoke-static {v1, v2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "PlacemarkSimpleExtensionGroup"

    invoke-static {v1, v2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "PlacemarkObjectExtensionGroup"

    invoke-static {v1, v2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    :cond_0
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :cond_2
    :goto_1
    invoke-interface {p0, v0, v1}, Lorg/w3c/dom/Element;->insertBefore(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 29
    return-object v0
.end method

.method public static apply(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 21
    invoke-static {p3, p4}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->value(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-static {p3}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->part(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p3}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->leaf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->target(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p1

    const/4 p2, 0x0

    :goto_0
    const-string v2, "colorMode"

    if-eqz p1, :cond_2

    const-string v3, "Style"

    invoke-static {p1, v3}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object p2, p1

    check-cast p2, Lorg/w3c/dom/Element;

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v3

    :goto_1
    if-eqz v3, :cond_1

    invoke-static {v3, v0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    move-object v4, v3

    check-cast v4, Lorg/w3c/dom/Element;

    invoke-static {v4, v1}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->remove(Lorg/w3c/dom/Element;Ljava/lang/String;)V

    invoke-static {p3}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->flag(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-static {p3}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->metric(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-static {v4, v2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->remove(Lorg/w3c/dom/Element;Ljava/lang/String;)V

    :cond_0
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v3

    goto :goto_1

    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p1

    goto :goto_0

    .line 22
    :cond_2
    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    .line 23
    :cond_3
    if-nez p2, :cond_4

    invoke-static {p0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->addInlineStyle(Lorg/w3c/dom/Element;)Lorg/w3c/dom/Element;

    move-result-object p2

    .line 24
    :cond_4
    invoke-static {p2, v0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    if-nez p0, :cond_5

    invoke-static {p2, v0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->add(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    :cond_5
    invoke-static {p0, v1}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->add(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p1

    invoke-interface {p1, p4}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    invoke-static {p3}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->flag(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_6

    invoke-static {p3}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->metric(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_6

    invoke-static {p0, v2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->add(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    const-string p1, "normal"

    invoke-interface {p0, p1}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 25
    :cond_6
    return-void
.end method

.method static assignIcon(Lorg/w3c/dom/Element;Ljava/lang/String;)V
    .locals 3

    .line 46
    nop

    .line 47
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 48
    const-string v2, "Style"

    invoke-static {v0, v2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v1, v0

    check-cast v1, Lorg/w3c/dom/Element;

    .line 47
    :cond_0
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v0

    goto :goto_0

    .line 51
    :cond_1
    if-eqz v1, :cond_2

    const-string v0, "id"

    invoke-interface {v1, v0}, Lorg/w3c/dom/Element;->hasAttribute(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    invoke-static {p0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->addInlineStyle(Lorg/w3c/dom/Element;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 52
    :cond_3
    const-string p0, "IconStyle"

    invoke-static {v1, p0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 53
    if-nez v0, :cond_4

    invoke-static {v1, p0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->add(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 54
    :cond_4
    const-string p0, "Icon"

    invoke-static {v0, p0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 55
    if-nez v1, :cond_5

    invoke-static {v0, p0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->add(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 56
    :cond_5
    const-string p0, "href"

    invoke-static {v1, p0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 57
    if-nez v0, :cond_6

    .line 58
    invoke-interface {v1}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-interface {v1}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, p0}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 59
    invoke-interface {v1}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p0

    invoke-interface {v1, v0, p0}, Lorg/w3c/dom/Element;->insertBefore(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 61
    :cond_6
    invoke-interface {v0, p1}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 62
    return-void
.end method

.method private static child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 1

    .line 15
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p0

    :goto_0
    if-eqz p0, :cond_1

    invoke-static {p0, p1}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    check-cast p0, Lorg/w3c/dom/Element;

    return-object p0

    :cond_0
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p0

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method private static flag(Ljava/lang/String;)Z
    .locals 1

    .line 10
    const-string v0, "component-fill"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "component-outline"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private static leaf(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 12
    const-string v0, "component-width"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "width"

    goto :goto_0

    :cond_0
    const-string v0, "component-label-scale"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p0, "scale"

    goto :goto_0

    :cond_1
    const-string v0, "component-fill"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p0, "fill"

    goto :goto_0

    :cond_2
    const-string v0, "component-outline"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    const-string p0, "outline"

    goto :goto_0

    :cond_3
    const-string p0, "color"

    :goto_0
    return-object p0
.end method

.method public static marker(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 3

    .line 33
    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->target(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    .line 34
    const-string p1, "*"

    const-string p2, "Point"

    invoke-interface {p0, p1, p2}, Lorg/w3c/dom/Element;->getElementsByTagNameNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object p1

    .line 35
    const/4 v0, 0x0

    :goto_0
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 36
    invoke-interface {p1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 37
    invoke-static {v1, p2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_2

    .line 38
    :cond_0
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v1

    .line 39
    :goto_1
    const-string v2, "MultiGeometry"

    invoke-static {v1, v2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v1

    goto :goto_1

    .line 40
    :cond_1
    if-ne v1, p0, :cond_2

    return-object p0

    .line 35
    :cond_2
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 42
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u043e\u0431\u044a\u0435\u043a\u0442 \u0441 \u0442\u043e\u0447\u043a\u043e\u0439 \u043d\u0430 \u043a\u0430\u0440\u0442\u0435"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static metric(Ljava/lang/String;)Z
    .locals 1

    .line 9
    const-string v0, "component-width"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "component-label-scale"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public static operation(Ljava/lang/String;)Z
    .locals 8

    .line 7
    const-string v6, "component-width"

    const-string v7, "component-label-scale"

    const-string v0, "component-icon"

    const-string v1, "component-line"

    const-string v2, "component-polygon"

    const-string v3, "component-label"

    const-string v4, "component-fill"

    const-string v5, "component-outline"

    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static order(Lorg/w3c/dom/Element;)[Ljava/lang/String;
    .locals 9

    .line 18
    const-string v0, "Style"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v7, "StyleSimpleExtensionGroup"

    const-string v8, "StyleObjectExtensionGroup"

    const-string v1, "IconStyle"

    const-string v2, "LabelStyle"

    const-string v3, "LineStyle"

    const-string v4, "PolyStyle"

    const-string v5, "BalloonStyle"

    const-string v6, "ListStyle"

    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const-string v0, "IconStyle"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    const-string v6, "IconStyleSimpleExtensionGroup"

    const-string v7, "IconStyleObjectExtensionGroup"

    const-string v2, "scale"

    const-string v3, "heading"

    const-string v4, "Icon"

    const-string v5, "hotSpot"

    filled-new-array/range {v2 .. v7}, [Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    :cond_1
    const-string v0, "LineStyle"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p0, "LineStyleSimpleExtensionGroup"

    const-string v0, "LineStyleObjectExtensionGroup"

    const-string v2, "width"

    :goto_0
    filled-new-array {v2, p0, v0}, [Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    :cond_2
    const-string v0, "PolyStyle"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string p0, "PolyStyleSimpleExtensionGroup"

    const-string v0, "PolyStyleObjectExtensionGroup"

    const-string v2, "fill"

    const-string v3, "outline"

    filled-new-array {v2, v3, p0, v0}, [Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    :cond_3
    const-string v0, "LabelStyle"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_4

    const-string p0, "LabelStyleSimpleExtensionGroup"

    const-string v0, "LabelStyleObjectExtensionGroup"

    const-string v2, "scale"

    goto :goto_0

    :cond_4
    new-array p0, v1, [Ljava/lang/String;

    :goto_1
    array-length v0, p0

    const/4 v2, 0x4

    add-int/2addr v0, v2

    new-array v0, v0, [Ljava/lang/String;

    const-string v3, "color"

    aput-object v3, v0, v1

    const/4 v3, 0x1

    const-string v4, "colorMode"

    aput-object v4, v0, v3

    const/4 v3, 0x2

    const-string v4, "AbstractColorStyleSimpleExtensionGroup"

    aput-object v4, v0, v3

    const/4 v3, 0x3

    const-string v4, "AbstractColorStyleObjectExtensionGroup"

    aput-object v4, v0, v3

    array-length v3, p0

    invoke-static {p0, v1, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0
.end method

.method private static part(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 11
    invoke-static {p0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->title(Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "component-icon"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "IconStyle"

    goto :goto_2

    :cond_0
    const-string v0, "component-line"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "component-width"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    const-string v0, "component-label"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "component-label-scale"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    goto :goto_0

    :cond_2
    const-string p0, "PolyStyle"

    goto :goto_2

    :cond_3
    :goto_0
    const-string p0, "LabelStyle"

    goto :goto_2

    :cond_4
    :goto_1
    const-string p0, "LineStyle"

    :goto_2
    return-object p0
.end method

.method public static read(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 17
    invoke-static {p3}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->part(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p3}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->leaf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->target(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p0

    const-string p1, ""

    :goto_0
    if-eqz p0, :cond_2

    const-string p2, "Style"

    invoke-static {p0, p2}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    move-object p2, p0

    check-cast p2, Lorg/w3c/dom/Element;

    invoke-static {p2, v0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p2

    if-nez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_1

    :cond_0
    invoke-static {p2, v1}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p2

    :goto_1
    if-eqz p2, :cond_1

    invoke-interface {p2}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    :cond_1
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p0

    goto :goto_0

    :cond_2
    invoke-static {p3}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->flag(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_4

    const-string p0, "true"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    const-string p0, "1"

    return-object p0

    :cond_3
    const-string p0, "false"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    const-string p0, "0"

    return-object p0

    :cond_4
    return-object p1
.end method

.method private static remove(Lorg/w3c/dom/Element;Ljava/lang/String;)V
    .locals 3

    .line 20
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v0

    :goto_0
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v1

    invoke-static {v0, p1}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p0, v0}, Lorg/w3c/dom/Element;->removeChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    :cond_0
    move-object v0, v1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private static tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z
    .locals 2

    .line 14
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    instance-of v1, p0, Lorg/w3c/dom/Element;

    if-eqz v1, :cond_2

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "http://www.opengis.net/kml/2.2"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_1
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object p0

    :goto_0
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    goto :goto_1

    :cond_2
    const/4 p0, 0x0

    :goto_1
    return p0
.end method

.method private static target(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 1

    .line 16
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {p0, v0, p2}, Lorg/rabochaya/projects/ObjectTree;->selection(Lorg/w3c/dom/Element;Ljava/util/Collection;Ljava/lang/String;)Ljava/util/List;

    invoke-static {p0, p1}, Lorg/rabochaya/projects/ObjectTree;->resolve(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    const-string p1, "Placemark"

    invoke-static {p0, p1}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-object p0

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u043e\u0434\u0438\u043d \u043e\u0431\u044a\u0435\u043a\u0442, \u0430 \u043d\u0435 \u043f\u0430\u043f\u043a\u0443"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static title(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 8
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :cond_0
    goto :goto_0

    :sswitch_0
    const-string v0, "component-label-scale"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_1

    :sswitch_1
    const-string v0, "component-line"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x3

    goto :goto_1

    :sswitch_2
    const-string v0, "component-icon"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x2

    goto :goto_1

    :sswitch_3
    const-string v0, "component-fill"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x6

    goto :goto_1

    :sswitch_4
    const-string v0, "component-polygon"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x4

    goto :goto_1

    :sswitch_5
    const-string v0, "component-outline"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x7

    goto :goto_1

    :sswitch_6
    const-string v0, "component-width"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    goto :goto_1

    :sswitch_7
    const-string v0, "component-label"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x5

    goto :goto_1

    :goto_0
    const/4 p0, -0x1

    :goto_1
    packed-switch p0, :pswitch_data_0

    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u041d\u0435\u0438\u0437\u0432\u0435\u0441\u0442\u043d\u043e\u0435 \u0441\u0432\u043e\u0439\u0441\u0442\u0432\u043e \u0441\u0442\u0438\u043b\u044f"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_0
    const-string p0, "\u041a\u043e\u043d\u0442\u0443\u0440 KML"

    return-object p0

    :pswitch_1
    const-string p0, "\u0417\u0430\u043b\u0438\u0432\u043a\u0430 KML"

    return-object p0

    :pswitch_2
    const-string p0, "\u0426\u0432\u0435\u0442 \u043f\u043e\u0434\u043f\u0438\u0441\u0438 KML"

    return-object p0

    :pswitch_3
    const-string p0, "\u0426\u0432\u0435\u0442 \u0437\u0430\u043b\u0438\u0432\u043a\u0438 KML"

    return-object p0

    :pswitch_4
    const-string p0, "\u0426\u0432\u0435\u0442 \u043b\u0438\u043d\u0438\u0438 \u0438 \u043a\u043e\u043d\u0442\u0443\u0440\u0430 KML"

    return-object p0

    :pswitch_5
    const-string p0, "\u0426\u0432\u0435\u0442 \u043c\u0435\u0442\u043a\u0438 KML"

    return-object p0

    :pswitch_6
    const-string p0, "\u041c\u0430\u0441\u0448\u0442\u0430\u0431 \u043f\u043e\u0434\u043f\u0438\u0441\u0438 KML"

    return-object p0

    :pswitch_7
    const-string p0, "\u0428\u0438\u0440\u0438\u043d\u0430 \u043b\u0438\u043d\u0438\u0438 KML (px)"

    return-object p0

    :sswitch_data_0
    .sparse-switch
        -0x71c3c1dc -> :sswitch_7
        -0x7125130a -> :sswitch_6
        -0x4e06448e -> :sswitch_5
        -0x23c7f796 -> :sswitch_4
        0x4ee69053 -> :sswitch_3
        0x4ee7d749 -> :sswitch_2
        0x4ee94ac4 -> :sswitch_1
        0x77433061 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static value(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 13
    invoke-static {p0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->title(Ljava/lang/String;)Ljava/lang/String;

    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    :cond_0
    invoke-static {p0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->metric(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "component-width"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    invoke-static {p1, v1}, Lorg/rabochaya/projects/KmlComponentStyle;->dimension(Ljava/lang/String;Z)Ljava/lang/Float;

    move-result-object p1

    if-nez p1, :cond_2

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const-string p0, "\u0428\u0438\u0440\u0438\u043d\u0430: \u043e\u0442 0 \u0434\u043e 256 px; \u043f\u0443\u0441\u0442\u043e \u2014 \u043d\u0430\u0441\u043b\u0435\u0434\u043e\u0432\u0430\u043d\u0438\u0435"

    goto :goto_0

    :cond_1
    const-string p0, "\u041c\u0430\u0441\u0448\u0442\u0430\u0431 \u043f\u043e\u0434\u043f\u0438\u0441\u0438: \u043e\u0442 0 \u0434\u043e 16; \u043f\u0443\u0441\u0442\u043e \u2014 \u043d\u0430\u0441\u043b\u0435\u0434\u043e\u0432\u0430\u043d\u0438\u0435"

    :goto_0
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    invoke-static {p0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->flag(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_5

    const-string p0, "0"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    const-string p0, "1"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    goto :goto_1

    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u0412\u0432\u0435\u0434\u0438\u0442\u0435 1, 0 \u0438\u043b\u0438 \u043e\u0441\u0442\u0430\u0432\u044c\u0442\u0435 \u043f\u0443\u0441\u0442\u044b\u043c \u0434\u043b\u044f \u043d\u0430\u0441\u043b\u0435\u0434\u043e\u0432\u0430\u043d\u0438\u044f"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_5
    invoke-static {p1}, Lorg/rabochaya/projects/KmlComponentStyle;->color(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    if-eqz p0, :cond_7

    :cond_6
    :goto_1
    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, p0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_7
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u0412\u0432\u0435\u0434\u0438\u0442\u0435 8 \u0437\u043d\u0430\u043a\u043e\u0432 aabbggrr, \u043d\u0430\u043f\u0440\u0438\u043c\u0435\u0440 ff0000ff \u2014 \u043a\u0440\u0430\u0441\u043d\u044b\u0439; \u043f\u0443\u0441\u0442\u043e \u2014 \u043d\u0430\u0441\u043b\u0435\u0434\u043e\u0432\u0430\u043d\u0438\u0435"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_8
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u0423\u043a\u0430\u0436\u0438\u0442\u0435 \u0437\u043d\u0430\u0447\u0435\u043d\u0438\u0435"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
