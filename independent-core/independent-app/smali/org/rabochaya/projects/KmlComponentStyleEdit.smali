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
    .locals 2

    .line 17
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p1

    invoke-interface {p0, p1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    return-object p1
.end method

.method public static apply(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 19
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

    move-object v2, p2

    :goto_0
    const-string v3, "colorMode"

    const-string v4, "Style"

    if-eqz p1, :cond_2

    invoke-static {p1, v4}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    move-object v2, p1

    check-cast v2, Lorg/w3c/dom/Element;

    invoke-interface {p1}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v4

    :goto_1
    if-eqz v4, :cond_1

    invoke-static {v4, v0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    move-object v5, v4

    check-cast v5, Lorg/w3c/dom/Element;

    invoke-static {v5, v1}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->remove(Lorg/w3c/dom/Element;Ljava/lang/String;)V

    invoke-static {p3}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->flag(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-static {v5, v3}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->remove(Lorg/w3c/dom/Element;Ljava/lang/String;)V

    :cond_0
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v4

    goto :goto_1

    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p1

    goto :goto_0

    .line 20
    :cond_2
    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    .line 21
    :cond_3
    if-nez v2, :cond_7

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object p1

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2, v4}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p1

    :goto_2
    if-eqz p1, :cond_6

    const-string v4, "Point"

    invoke-static {p1, v4}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5

    const-string v4, "LineString"

    invoke-static {p1, v4}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5

    const-string v4, "Polygon"

    invoke-static {p1, v4}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5

    const-string v4, "MultiGeometry"

    invoke-static {p1, v4}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_5

    const-string v4, "Model"

    invoke-static {p1, v4}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    goto :goto_3

    :cond_4
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p1

    goto :goto_2

    :cond_5
    :goto_3
    move-object p2, p1

    :cond_6
    invoke-interface {p0, v2, p2}, Lorg/w3c/dom/Element;->insertBefore(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 22
    :cond_7
    invoke-static {v2, v0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    if-nez p0, :cond_8

    invoke-static {v2, v0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->add(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    :cond_8
    invoke-static {p0, v1}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->add(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p1

    invoke-interface {p1, p4}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    invoke-static {p3}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->flag(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_9

    invoke-static {p0, v3}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->add(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    const-string p1, "normal"

    invoke-interface {p0, p1}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 23
    :cond_9
    return-void
.end method

.method private static child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 1

    .line 14
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

    .line 9
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

    .line 11
    const-string v0, "component-fill"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "fill"

    goto :goto_0

    :cond_0
    const-string v0, "component-outline"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const-string p0, "outline"

    goto :goto_0

    :cond_1
    const-string p0, "color"

    :goto_0
    return-object p0
.end method

.method public static operation(Ljava/lang/String;)Z
    .locals 6

    .line 7
    const-string v4, "component-fill"

    const-string v5, "component-outline"

    const-string v0, "component-icon"

    const-string v1, "component-line"

    const-string v2, "component-polygon"

    const-string v3, "component-label"

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static part(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 10
    invoke-static {p0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->title(Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "component-icon"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "IconStyle"

    goto :goto_0

    :cond_0
    const-string v0, "component-line"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p0, "LineStyle"

    goto :goto_0

    :cond_1
    const-string v0, "component-label"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const-string p0, "LabelStyle"

    goto :goto_0

    :cond_2
    const-string p0, "PolyStyle"

    :goto_0
    return-object p0
.end method

.method public static read(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 16
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

    .line 18
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

    .line 13
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

    .line 15
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
    const-string v0, "component-line"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_1

    :sswitch_1
    const-string v0, "component-icon"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    goto :goto_1

    :sswitch_2
    const-string v0, "component-fill"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x4

    goto :goto_1

    :sswitch_3
    const-string v0, "component-polygon"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x2

    goto :goto_1

    :sswitch_4
    const-string v0, "component-outline"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x5

    goto :goto_1

    :sswitch_5
    const-string v0, "component-label"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x3

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

    :sswitch_data_0
    .sparse-switch
        -0x71c3c1dc -> :sswitch_5
        -0x4e06448e -> :sswitch_4
        -0x23c7f796 -> :sswitch_3
        0x4ee69053 -> :sswitch_2
        0x4ee7d749 -> :sswitch_1
        0x4ee94ac4 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static value(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 12
    invoke-static {p0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->title(Ljava/lang/String;)Ljava/lang/String;

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    :cond_0
    invoke-static {p0}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->flag(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    const-string p0, "0"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    const-string p0, "1"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_0

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u0412\u0432\u0435\u0434\u0438\u0442\u0435 1, 0 \u0438\u043b\u0438 \u043e\u0441\u0442\u0430\u0432\u044c\u0442\u0435 \u043f\u0443\u0441\u0442\u044b\u043c \u0434\u043b\u044f \u043d\u0430\u0441\u043b\u0435\u0434\u043e\u0432\u0430\u043d\u0438\u044f"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    invoke-static {p1}, Lorg/rabochaya/projects/KmlComponentStyle;->color(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    if-eqz p0, :cond_4

    :cond_3
    :goto_0
    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, p0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u0412\u0432\u0435\u0434\u0438\u0442\u0435 8 \u0437\u043d\u0430\u043a\u043e\u0432 aabbggrr, \u043d\u0430\u043f\u0440\u0438\u043c\u0435\u0440 ff0000ff \u2014 \u043a\u0440\u0430\u0441\u043d\u044b\u0439; \u043f\u0443\u0441\u0442\u043e \u2014 \u043d\u0430\u0441\u043b\u0435\u0434\u043e\u0432\u0430\u043d\u0438\u0435"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u0423\u043a\u0430\u0436\u0438\u0442\u0435 \u0437\u043d\u0430\u0447\u0435\u043d\u0438\u0435"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
