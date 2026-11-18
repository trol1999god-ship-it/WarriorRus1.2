.class public final Lorg/rabochaya/projects/KmlComponentStyle;
.super Ljava/lang/Object;
.source "KmlComponentStyle.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/KmlComponentStyle$Resolver;
    }
.end annotation


# static fields
.field public static final DEFAULT_COLOR:I = -0x193ba6

.field public static final EMPTY:Lorg/rabochaya/projects/KmlComponentStyle;

.field private static final NS:Ljava/lang/String; = "http://www.opengis.net/kml/2.2"


# instance fields
.field public final fill:Ljava/lang/Boolean;

.field public final icon:Ljava/lang/Integer;

.field public final label:Ljava/lang/Integer;

.field public final labelScale:Ljava/lang/Float;

.field public final line:Ljava/lang/Integer;

.field public final outline:Ljava/lang/Boolean;

.field public final polygon:Ljava/lang/Integer;

.field public final width:Ljava/lang/Float;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 7
    new-instance v9, Lorg/rabochaya/projects/KmlComponentStyle;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, v9

    invoke-direct/range {v0 .. v8}, Lorg/rabochaya/projects/KmlComponentStyle;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Float;Ljava/lang/Float;)V

    sput-object v9, Lorg/rabochaya/projects/KmlComponentStyle;->EMPTY:Lorg/rabochaya/projects/KmlComponentStyle;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Float;Ljava/lang/Float;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/KmlComponentStyle;->icon:Ljava/lang/Integer;

    iput-object p2, p0, Lorg/rabochaya/projects/KmlComponentStyle;->line:Ljava/lang/Integer;

    iput-object p3, p0, Lorg/rabochaya/projects/KmlComponentStyle;->polygon:Ljava/lang/Integer;

    iput-object p4, p0, Lorg/rabochaya/projects/KmlComponentStyle;->label:Ljava/lang/Integer;

    iput-object p5, p0, Lorg/rabochaya/projects/KmlComponentStyle;->fill:Ljava/lang/Boolean;

    iput-object p6, p0, Lorg/rabochaya/projects/KmlComponentStyle;->outline:Ljava/lang/Boolean;

    iput-object p7, p0, Lorg/rabochaya/projects/KmlComponentStyle;->width:Ljava/lang/Float;

    iput-object p8, p0, Lorg/rabochaya/projects/KmlComponentStyle;->labelScale:Ljava/lang/Float;

    return-void
.end method

.method static synthetic access$000(Lorg/w3c/dom/Node;Ljava/lang/String;)Z
    .locals 0

    .line 4
    invoke-static {p0, p1}, Lorg/rabochaya/projects/KmlComponentStyle;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$100(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 4
    invoke-static {p0, p1}, Lorg/rabochaya/projects/KmlComponentStyle;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lorg/w3c/dom/Element;)Lorg/rabochaya/projects/KmlComponentStyle;
    .locals 0

    .line 4
    invoke-static {p0}, Lorg/rabochaya/projects/KmlComponentStyle;->inline(Lorg/w3c/dom/Element;)Lorg/rabochaya/projects/KmlComponentStyle;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lorg/rabochaya/projects/KmlComponentStyle;Lorg/rabochaya/projects/KmlComponentStyle;)Lorg/rabochaya/projects/KmlComponentStyle;
    .locals 0

    .line 4
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/KmlComponentStyle;->over(Lorg/rabochaya/projects/KmlComponentStyle;)Lorg/rabochaya/projects/KmlComponentStyle;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 0

    .line 4
    invoke-static {p0, p1}, Lorg/rabochaya/projects/KmlComponentStyle;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    return-object p0
.end method

.method private static child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 1

    .line 12
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p0

    :goto_0
    if-eqz p0, :cond_1

    invoke-static {p0, p1}, Lorg/rabochaya/projects/KmlComponentStyle;->tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

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

.method public static color(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 9

    .line 15
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "[a-fA-F0-9]{8}"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x10

    invoke-static {p0, v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v1

    const-wide v3, 0xff000000L

    and-long/2addr v3, v1

    const-wide/16 v5, 0xff

    and-long v7, v1, v5

    shl-long/2addr v7, v0

    or-long/2addr v3, v7

    const-wide/32 v7, 0xff00

    and-long/2addr v7, v1

    or-long/2addr v3, v7

    ushr-long v0, v1, v0

    and-long/2addr v0, v5

    or-long/2addr v0, v3

    long-to-int p0, v0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static component(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/Integer;
    .locals 2

    .line 16
    invoke-static {p0, p1}, Lorg/rabochaya/projects/KmlComponentStyle;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    const/4 p1, 0x0

    if-nez p0, :cond_0

    return-object p1

    :cond_0
    const-string v0, "colorMode"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/KmlComponentStyle;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "normal"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const-string p1, "color"

    invoke-static {p0, p1}, Lorg/rabochaya/projects/KmlComponentStyle;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lorg/rabochaya/projects/KmlComponentStyle;->color(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    :cond_2
    return-object p1
.end method

.method public static dimension(Ljava/lang/String;Z)Ljava/lang/Float;
    .locals 5

    .line 19
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x40

    if-gt v1, v2, :cond_6

    const-string v1, "[+-]?(?:[0-9]+(?:\\.[0-9]*)?|\\.[0-9]+)(?:[eE][+-]?[0-9]+)?"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_2

    :cond_1
    :try_start_0
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    move-result p0

    if-nez p0, :cond_5

    invoke-static {v1, v2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result p0

    if-nez p0, :cond_5

    const-wide/16 v3, 0x0

    cmpg-double p0, v1, v3

    if-ltz p0, :cond_5

    if-eqz p1, :cond_2

    const/16 p0, 0x100

    goto :goto_0

    :cond_2
    const/16 p0, 0x10

    :goto_0
    int-to-double p0, p0

    cmpl-double p0, v1, p0

    if-lez p0, :cond_3

    goto :goto_1

    :cond_3
    double-to-float p0, v1

    cmpl-double p1, v1, v3

    if-lez p1, :cond_4

    const/4 p1, 0x0

    cmpl-float p1, p0, p1

    if-nez p1, :cond_4

    goto :goto_1

    :cond_4
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_5
    :goto_1
    return-object v0

    :catch_0
    move-exception p0

    :cond_6
    :goto_2
    return-object v0
.end method

.method private static dimension(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/Float;
    .locals 0

    .line 20
    invoke-static {p0, p1}, Lorg/rabochaya/projects/KmlComponentStyle;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-static {p0, p2}, Lorg/rabochaya/projects/KmlComponentStyle;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p3}, Lorg/rabochaya/projects/KmlComponentStyle;->dimension(Ljava/lang/String;Z)Ljava/lang/Float;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method private static flag(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 17
    invoke-static {p0, p1}, Lorg/rabochaya/projects/KmlComponentStyle;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "1"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    const-string p1, "true"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_1

    :cond_0
    const-string p1, "0"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    const-string p1, "false"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    goto :goto_2

    :cond_2
    :goto_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_2

    :cond_3
    :goto_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_2
    return-object p0
.end method

.method private static inline(Lorg/w3c/dom/Element;)Lorg/rabochaya/projects/KmlComponentStyle;
    .locals 12

    .line 21
    const-string v0, "PolyStyle"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/KmlComponentStyle;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    new-instance v11, Lorg/rabochaya/projects/KmlComponentStyle;

    const-string v2, "IconStyle"

    invoke-static {p0, v2}, Lorg/rabochaya/projects/KmlComponentStyle;->component(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    const-string v2, "LineStyle"

    invoke-static {p0, v2}, Lorg/rabochaya/projects/KmlComponentStyle;->component(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {p0, v0}, Lorg/rabochaya/projects/KmlComponentStyle;->component(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    const-string v0, "LabelStyle"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/KmlComponentStyle;->component(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x0

    if-nez v1, :cond_0

    move-object v8, v7

    goto :goto_0

    :cond_0
    const-string v8, "fill"

    invoke-static {v1, v8}, Lorg/rabochaya/projects/KmlComponentStyle;->flag(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v8

    :goto_0
    if-nez v1, :cond_1

    move-object v1, v7

    goto :goto_1

    :cond_1
    const-string v7, "outline"

    invoke-static {v1, v7}, Lorg/rabochaya/projects/KmlComponentStyle;->flag(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v1

    :goto_1
    const-string v7, "width"

    const/4 v9, 0x1

    invoke-static {p0, v2, v7, v9}, Lorg/rabochaya/projects/KmlComponentStyle;->dimension(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/Float;

    move-result-object v9

    const-string v2, "scale"

    const/4 v7, 0x0

    invoke-static {p0, v0, v2, v7}, Lorg/rabochaya/projects/KmlComponentStyle;->dimension(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/Float;

    move-result-object v10

    move-object v2, v11

    move-object v7, v8

    move-object v8, v1

    invoke-direct/range {v2 .. v10}, Lorg/rabochaya/projects/KmlComponentStyle;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Float;Ljava/lang/Float;)V

    return-object v11
.end method

.method private over(Lorg/rabochaya/projects/KmlComponentStyle;)Lorg/rabochaya/projects/KmlComponentStyle;
    .locals 10

    .line 10
    new-instance v9, Lorg/rabochaya/projects/KmlComponentStyle;

    iget-object v0, p0, Lorg/rabochaya/projects/KmlComponentStyle;->icon:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/KmlComponentStyle;->icon:Ljava/lang/Integer;

    goto :goto_0

    :cond_0
    iget-object v0, p1, Lorg/rabochaya/projects/KmlComponentStyle;->icon:Ljava/lang/Integer;

    :goto_0
    move-object v1, v0

    iget-object v0, p0, Lorg/rabochaya/projects/KmlComponentStyle;->line:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/KmlComponentStyle;->line:Ljava/lang/Integer;

    goto :goto_1

    :cond_1
    iget-object v0, p1, Lorg/rabochaya/projects/KmlComponentStyle;->line:Ljava/lang/Integer;

    :goto_1
    move-object v2, v0

    iget-object v0, p0, Lorg/rabochaya/projects/KmlComponentStyle;->polygon:Ljava/lang/Integer;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/KmlComponentStyle;->polygon:Ljava/lang/Integer;

    goto :goto_2

    :cond_2
    iget-object v0, p1, Lorg/rabochaya/projects/KmlComponentStyle;->polygon:Ljava/lang/Integer;

    :goto_2
    move-object v3, v0

    iget-object v0, p0, Lorg/rabochaya/projects/KmlComponentStyle;->label:Ljava/lang/Integer;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/KmlComponentStyle;->label:Ljava/lang/Integer;

    goto :goto_3

    :cond_3
    iget-object v0, p1, Lorg/rabochaya/projects/KmlComponentStyle;->label:Ljava/lang/Integer;

    :goto_3
    move-object v4, v0

    iget-object v0, p0, Lorg/rabochaya/projects/KmlComponentStyle;->fill:Ljava/lang/Boolean;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lorg/rabochaya/projects/KmlComponentStyle;->fill:Ljava/lang/Boolean;

    goto :goto_4

    :cond_4
    iget-object v0, p1, Lorg/rabochaya/projects/KmlComponentStyle;->fill:Ljava/lang/Boolean;

    :goto_4
    move-object v5, v0

    iget-object v0, p0, Lorg/rabochaya/projects/KmlComponentStyle;->outline:Ljava/lang/Boolean;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lorg/rabochaya/projects/KmlComponentStyle;->outline:Ljava/lang/Boolean;

    goto :goto_5

    :cond_5
    iget-object v0, p1, Lorg/rabochaya/projects/KmlComponentStyle;->outline:Ljava/lang/Boolean;

    :goto_5
    move-object v6, v0

    iget-object v0, p0, Lorg/rabochaya/projects/KmlComponentStyle;->width:Ljava/lang/Float;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lorg/rabochaya/projects/KmlComponentStyle;->width:Ljava/lang/Float;

    goto :goto_6

    :cond_6
    iget-object v0, p1, Lorg/rabochaya/projects/KmlComponentStyle;->width:Ljava/lang/Float;

    :goto_6
    move-object v7, v0

    iget-object v0, p0, Lorg/rabochaya/projects/KmlComponentStyle;->labelScale:Ljava/lang/Float;

    if-eqz v0, :cond_7

    iget-object p1, p0, Lorg/rabochaya/projects/KmlComponentStyle;->labelScale:Ljava/lang/Float;

    goto :goto_7

    :cond_7
    iget-object p1, p1, Lorg/rabochaya/projects/KmlComponentStyle;->labelScale:Ljava/lang/Float;

    :goto_7
    move-object v8, p1

    move-object v0, v9

    invoke-direct/range {v0 .. v8}, Lorg/rabochaya/projects/KmlComponentStyle;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Float;Ljava/lang/Float;)V

    return-object v9
.end method

.method private static tag(Lorg/w3c/dom/Node;Ljava/lang/String;)Z
    .locals 4

    .line 11
    instance-of v0, p0, Lorg/w3c/dom/Element;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v2

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, "http://www.opengis.net/kml/2.2"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_1
    if-nez v2, :cond_2

    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v2

    :cond_2
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    const/4 v1, 0x1

    :cond_3
    return v1
.end method

.method private static text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 13
    invoke-static {p0, p1}, Lorg/rabochaya/projects/KmlComponentStyle;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    if-nez p0, :cond_0

    const-string p0, ""

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method
