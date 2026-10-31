.class public final Lorg/rabochaya/projects/KmlProject;
.super Ljava/lang/Object;
.source "KmlProject.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/KmlProject$Feature;,
        Lorg/rabochaya/projects/KmlProject$Geometry;,
        Lorg/rabochaya/projects/KmlProject$LimitedInput;
    }
.end annotation


# static fields
.field public static final MAX_ARCHIVE:I = 0x2000000

.field public static final MAX_XML:I = 0x400000


# instance fields
.field public final assets:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation
.end field

.field private cached:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/KmlProject$Feature;",
            ">;"
        }
    .end annotation
.end field

.field public final document:Lorg/w3c/dom/Document;

.field public entry:Ljava/lang/String;

.field private final ids:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lorg/w3c/dom/Element;",
            ">;"
        }
    .end annotation
.end field

.field private final styles:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/w3c/dom/Element;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lorg/w3c/dom/Document;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    .line 22
    const-string v0, "doc.kml"

    iput-object v0, p0, Lorg/rabochaya/projects/KmlProject;->entry:Ljava/lang/String;

    .line 23
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/KmlProject;->ids:Ljava/util/LinkedHashMap;

    .line 24
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/KmlProject;->styles:Ljava/util/Map;

    .line 38
    iput-object p1, p0, Lorg/rabochaya/projects/KmlProject;->document:Lorg/w3c/dom/Document;

    .line 39
    nop

    .line 40
    const-string v0, "*"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object p1

    .line 41
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 42
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    const-string v4, "id"

    if-ge v2, v3, :cond_4

    .line 43
    invoke-interface {p1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Element;

    .line 44
    invoke-interface {v3, v4}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 45
    const-string v5, "Style"

    invoke-static {v3}, Lorg/rabochaya/projects/KmlProject;->tag(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    const-string v5, "StyleMap"

    invoke-static {v3}, Lorg/rabochaya/projects/KmlProject;->tag(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    :cond_0
    iget-object v5, p0, Lorg/rabochaya/projects/KmlProject;->styles:Ljava/util/Map;

    invoke-interface {v5, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    :cond_1
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    invoke-virtual {v0, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_1

    :cond_2
    new-instance p1, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u041f\u043e\u0432\u0442\u043e\u0440\u044f\u044e\u0449\u0438\u0439\u0441\u044f id: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 42
    :cond_3
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 48
    :cond_4
    move v2, v1

    move v3, v2

    :goto_2
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    if-ge v2, v5, :cond_a

    .line 49
    invoke-interface {p1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    check-cast v5, Lorg/w3c/dom/Element;

    invoke-static {v5}, Lorg/rabochaya/projects/KmlProject;->tag(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v6

    .line 50
    const-string v7, "NetworkLink"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_9

    const-string v7, "NetworkLinkControl"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_9

    const-string v7, "Update"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_9

    .line 52
    invoke-static {v5}, Lorg/rabochaya/projects/KmlProject;->isContainer(Lorg/w3c/dom/Element;)Z

    move-result v7

    if-nez v7, :cond_5

    const-string v7, "Placemark"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 53
    :cond_5
    invoke-interface {v5, v4}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 54
    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 55
    :cond_6
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "rk_node_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6

    .line 56
    invoke-virtual {v0, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-interface {v5, v4, v6}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    :cond_7
    iget-object v7, p0, Lorg/rabochaya/projects/KmlProject;->ids:Ljava/util/LinkedHashMap;

    invoke-virtual {v7, v6, v5}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    :cond_8
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 51
    :cond_9
    new-instance p1, Ljava/io/IOException;

    const-string v0, "\u0421\u0435\u0442\u0435\u0432\u044b\u0435 \u0441\u0441\u044b\u043b\u043a\u0438 \u0438 \u0443\u0434\u0430\u043b\u0451\u043d\u043d\u044b\u0435 \u043e\u0431\u043d\u043e\u0432\u043b\u0435\u043d\u0438\u044f KML \u0437\u0430\u043f\u0440\u0435\u0449\u0435\u043d\u044b"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 61
    :cond_a
    invoke-virtual {p0, v1}, Lorg/rabochaya/projects/KmlProject;->features(Z)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/KmlProject;->cached:Ljava/util/List;

    .line 62
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/16 v2, 0x1388

    if-gt v0, v2, :cond_f

    .line 63
    nop

    .line 64
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/rabochaya/projects/KmlProject$Feature;

    iget-object v0, v0, Lorg/rabochaya/projects/KmlProject$Feature;->shapes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/KmlProject$Geometry;

    iget-object v2, v2, Lorg/rabochaya/projects/KmlProject$Geometry;->rings:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 65
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/2addr v1, v3

    const v3, 0x186a0

    if-gt v1, v3, :cond_d

    .line 66
    goto :goto_3

    .line 65
    :cond_d
    new-instance p1, Ljava/io/IOException;

    const-string v0, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u043c\u043d\u043e\u0433\u043e \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 67
    :cond_e
    return-void

    .line 62
    :cond_f
    new-instance p1, Ljava/io/IOException;

    const-string v0, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u043c\u043d\u043e\u0433\u043e \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 1

    .line 174
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p0

    :goto_0
    if-eqz p0, :cond_1

    instance-of v0, p0, Lorg/w3c/dom/Element;

    if-eqz v0, :cond_0

    invoke-static {p0}, Lorg/rabochaya/projects/KmlProject;->tag(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method private color(Lorg/w3c/dom/Element;)I
    .locals 8

    .line 236
    const-string v0, "Style"

    invoke-static {p1, v0}, Lorg/rabochaya/projects/KmlProject;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    const-string v2, "styleUrl"

    invoke-static {p1, v2}, Lorg/rabochaya/projects/KmlProject;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 237
    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-nez v1, :cond_4

    const-string v5, "#"

    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    const/16 v5, 0x8

    if-ge v4, v5, :cond_4

    .line 238
    iget-object v5, p0, Lorg/rabochaya/projects/KmlProject;->styles:Ljava/util/Map;

    const/4 v6, 0x1

    invoke-virtual {p1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/w3c/dom/Element;

    if-nez p1, :cond_0

    goto :goto_3

    .line 239
    :cond_0
    invoke-static {p1}, Lorg/rabochaya/projects/KmlProject;->tag(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    move-object v1, p1

    goto :goto_3

    .line 240
    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p1

    :goto_1
    if-eqz p1, :cond_3

    instance-of v5, p1, Lorg/w3c/dom/Element;

    if-eqz v5, :cond_2

    const-string v5, "Pair"

    invoke-static {p1}, Lorg/rabochaya/projects/KmlProject;->tag(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    move-object v5, p1

    check-cast v5, Lorg/w3c/dom/Element;

    const-string v6, "key"

    invoke-static {v5, v6}, Lorg/rabochaya/projects/KmlProject;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string v7, "normal"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-static {v5, v2}, Lorg/rabochaya/projects/KmlProject;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    :cond_2
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p1

    goto :goto_1

    :cond_3
    const-string p1, ""

    .line 237
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 242
    :cond_4
    :goto_3
    if-eqz v1, :cond_6

    const-string p1, "PolyStyle"

    const-string v0, "IconStyle"

    const-string v2, "LineStyle"

    filled-new-array {v2, p1, v0}, [Ljava/lang/String;

    move-result-object p1

    :goto_4
    const/4 v0, 0x3

    if-ge v3, v0, :cond_6

    aget-object v0, p1, v3

    invoke-static {v1, v0}, Lorg/rabochaya/projects/KmlProject;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    if-eqz v0, :cond_5

    const-string v2, "color"

    invoke-static {v0, v2}, Lorg/rabochaya/projects/KmlProject;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v2, "[a-fA-F0-9]{8}"

    invoke-virtual {v0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/16 p1, 0x10

    invoke-static {v0, p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v0

    const-wide v2, 0xff000000L

    and-long/2addr v2, v0

    const-wide/16 v4, 0xff

    and-long v6, v0, v4

    shl-long/2addr v6, p1

    or-long/2addr v2, v6

    const-wide/32 v6, 0xff00

    and-long/2addr v6, v0

    or-long/2addr v2, v6

    shr-long/2addr v0, p1

    and-long/2addr v0, v4

    or-long/2addr v0, v2

    long-to-int p1, v0

    return p1

    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 243
    :cond_6
    const p1, -0x193ba6

    return p1
.end method

.method private static coordinates(Ljava/lang/String;)Ljava/util/List;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "[D>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 225
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 226
    new-instance v1, Ljava/util/StringTokenizer;

    invoke-direct {v1, p0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 227
    :goto_0
    :try_start_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result p0

    if-eqz p0, :cond_4

    .line 228
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    const v2, 0x186a0

    if-ge p0, v2, :cond_3

    .line 229
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object p0

    const-string v2, ","

    const/4 v3, -0x1

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p0

    array-length v2, p0

    const/4 v3, 0x2

    if-lt v2, v3, :cond_2

    array-length v2, p0

    const/4 v4, 0x3

    if-gt v2, v4, :cond_2

    .line 230
    const/4 v2, 0x0

    aget-object v5, p0, v2

    invoke-static {v5}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v5

    const/4 v7, 0x1

    aget-object v8, p0, v7

    invoke-static {v8}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v8

    array-length v10, p0

    if-ne v10, v4, :cond_0

    aget-object v10, p0, v3

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_0

    aget-object p0, p0, v3

    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v10

    goto :goto_1

    :cond_0
    const-wide/16 v10, 0x0

    .line 231
    :goto_1
    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    move-result p0

    if-nez p0, :cond_1

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    move-result p0

    if-nez p0, :cond_1

    invoke-static {v10, v11}, Ljava/lang/Double;->isNaN(D)Z

    move-result p0

    if-nez p0, :cond_1

    invoke-static {v5, v6}, Ljava/lang/Double;->isInfinite(D)Z

    move-result p0

    if-nez p0, :cond_1

    invoke-static {v8, v9}, Ljava/lang/Double;->isInfinite(D)Z

    move-result p0

    if-nez p0, :cond_1

    invoke-static {v10, v11}, Ljava/lang/Double;->isInfinite(D)Z

    move-result p0

    if-nez p0, :cond_1

    const-wide v12, -0x3f99800000000000L    # -180.0

    cmpg-double p0, v5, v12

    if-ltz p0, :cond_1

    const-wide v12, 0x4066800000000000L    # 180.0

    cmpl-double p0, v5, v12

    if-gtz p0, :cond_1

    const-wide v12, -0x3fa9800000000000L    # -90.0

    cmpg-double p0, v8, v12

    if-ltz p0, :cond_1

    const-wide v12, 0x4056800000000000L    # 90.0

    cmpl-double p0, v8, v12

    if-gtz p0, :cond_1

    .line 232
    new-array p0, v4, [D

    aput-wide v5, p0, v2

    aput-wide v8, p0, v7

    aput-wide v10, p0, v3

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 233
    goto/16 :goto_0

    .line 231
    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string v0, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u0430 \u0432\u043d\u0435 \u0434\u0438\u0430\u043f\u0430\u0437\u043e\u043d\u0430"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 229
    :cond_2
    new-instance p0, Ljava/io/IOException;

    const-string v0, "\u041d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u0430\u044f \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u0430"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 228
    :cond_3
    new-instance p0, Ljava/io/IOException;

    const-string v0, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u043c\u043d\u043e\u0433\u043e \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 233
    :cond_4
    return-object v0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u043e\u0435 \u0447\u0438\u0441\u043b\u043e \u0432 \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u0430\u0445"

    invoke-direct {v0, v1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method private geometry(Lorg/w3c/dom/Element;Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/KmlProject$Geometry;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 200
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_c

    instance-of v0, p1, Lorg/w3c/dom/Element;

    if-eqz v0, :cond_b

    move-object v0, p1

    check-cast v0, Lorg/w3c/dom/Element;

    invoke-static {v0}, Lorg/rabochaya/projects/KmlProject;->tag(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    .line 201
    const-string v2, "Point"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const-string v4, "LineString"

    const-string v5, "Polygon"

    if-nez v3, :cond_3

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    .line 213
    :cond_0
    const-string v2, "MultiGeometry"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-direct {p0, v0, p2}, Lorg/rabochaya/projects/KmlProject;->geometry(Lorg/w3c/dom/Element;Ljava/util/List;)V

    goto/16 :goto_5

    .line 214
    :cond_1
    const-string v0, "Model"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "Track"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "MultiTrack"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto/16 :goto_5

    :cond_2
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u041f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u0442\u0441\u044f \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "; \u0438\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u0444\u0430\u0439\u043b \u043d\u0435 \u0438\u0437\u043c\u0435\u043d\u0451\u043d"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 202
    :cond_3
    :goto_1
    new-instance v3, Lorg/rabochaya/projects/KmlProject$Geometry;

    invoke-direct {v3}, Lorg/rabochaya/projects/KmlProject$Geometry;-><init>()V

    iput-object v1, v3, Lorg/rabochaya/projects/KmlProject$Geometry;->type:Ljava/lang/String;

    .line 203
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_7

    .line 204
    const-string v1, "outerBoundaryIs"

    invoke-static {v0, v1}, Lorg/rabochaya/projects/KmlProject;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 205
    iget-object v2, v3, Lorg/rabochaya/projects/KmlProject$Geometry;->rings:Ljava/util/List;

    invoke-direct {p0, v1, v6}, Lorg/rabochaya/projects/KmlProject;->ring(Lorg/w3c/dom/Element;Z)Ljava/util/List;

    move-result-object v1

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    invoke-interface {v0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v0

    :goto_2
    if-eqz v0, :cond_5

    instance-of v1, v0, Lorg/w3c/dom/Element;

    if-eqz v1, :cond_4

    const-string v1, "innerBoundaryIs"

    invoke-static {v0}, Lorg/rabochaya/projects/KmlProject;->tag(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, v3, Lorg/rabochaya/projects/KmlProject$Geometry;->rings:Ljava/util/List;

    move-object v2, v0

    check-cast v2, Lorg/w3c/dom/Element;

    invoke-direct {p0, v2, v6}, Lorg/rabochaya/projects/KmlProject;->ring(Lorg/w3c/dom/Element;Z)Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v0

    goto :goto_2

    .line 207
    :cond_5
    goto :goto_4

    .line 204
    :cond_6
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u0423 \u043e\u0431\u043b\u0430\u0441\u0442\u0438 \u043d\u0435\u0442 \u0432\u043d\u0435\u0448\u043d\u0435\u0433\u043e \u043a\u043e\u043d\u0442\u0443\u0440\u0430"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 208
    :cond_7
    const-string v5, "coordinates"

    invoke-static {v0, v5}, Lorg/rabochaya/projects/KmlProject;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/rabochaya/projects/KmlProject;->coordinates(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 209
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ne v2, v6, :cond_9

    :cond_8
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    const/4 v4, 0x2

    if-lt v2, v4, :cond_9

    goto :goto_3

    :cond_9
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u041d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u0430\u044f \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 210
    :cond_a
    :goto_3
    iget-object v1, v3, Lorg/rabochaya/projects/KmlProject$Geometry;->rings:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 212
    :goto_4
    invoke-interface {p2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 213
    nop

    .line 200
    :cond_b
    :goto_5
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p1

    goto/16 :goto_0

    .line 216
    :cond_c
    return-void
.end method

.method public static isContainer(Lorg/w3c/dom/Element;)Z
    .locals 2

    .line 173
    const-string v0, "Document"

    invoke-static {p0}, Lorg/rabochaya/projects/KmlProject;->tag(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "Folder"

    invoke-static {p0}, Lorg/rabochaya/projects/KmlProject;->tag(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method public static name(Lorg/w3c/dom/Element;)Ljava/lang/String;
    .locals 2

    .line 176
    const-string v0, "name"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/KmlProject;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v0, "Placemark"

    invoke-static {p0}, Lorg/rabochaya/projects/KmlProject;->tag(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const-string v0, "\u0411\u0435\u0437 \u043d\u0430\u0437\u0432\u0430\u043d\u0438\u044f"

    goto :goto_0

    :cond_0
    const-string v0, "\u0413\u0440\u0443\u043f\u043f\u0430"

    :cond_1
    :goto_0
    return-object v0
.end method

.method public static parse([B)Lorg/rabochaya/projects/KmlProject;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 121
    array-length v0, p0

    const/high16 v1, 0x400000

    if-gt v0, v1, :cond_7

    .line 123
    :try_start_0
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 124
    array-length v1, p0

    const/4 v2, -0x2

    const/4 v3, -0x1

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-lt v1, v4, :cond_0

    aget-byte v1, p0, v6

    if-ne v1, v3, :cond_0

    aget-byte v1, p0, v5

    if-ne v1, v2, :cond_0

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_16LE:Ljava/nio/charset/Charset;

    goto :goto_0

    .line 125
    :cond_0
    array-length v1, p0

    if-lt v1, v4, :cond_1

    aget-byte v1, p0, v6

    if-ne v1, v2, :cond_1

    aget-byte v1, p0, v5

    if-ne v1, v3, :cond_1

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_16BE:Ljava/nio/charset/Charset;

    goto :goto_0

    .line 126
    :cond_1
    array-length v1, p0

    const/16 v2, 0x3c

    const/4 v3, 0x4

    if-lt v1, v3, :cond_2

    aget-byte v1, p0, v6

    if-nez v1, :cond_2

    aget-byte v1, p0, v5

    if-ne v1, v2, :cond_2

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_16BE:Ljava/nio/charset/Charset;

    move v4, v6

    goto :goto_0

    .line 127
    :cond_2
    array-length v1, p0

    if-lt v1, v3, :cond_3

    aget-byte v1, p0, v6

    if-ne v1, v2, :cond_3

    aget-byte v1, p0, v5

    if-nez v1, :cond_3

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_16LE:Ljava/nio/charset/Charset;

    move v4, v6

    goto :goto_0

    .line 128
    :cond_3
    move v4, v6

    :goto_0
    invoke-virtual {v0}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v1}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v1}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    array-length v1, p0

    sub-int/2addr v1, v4

    invoke-static {p0, v4, v1}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 129
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const v1, 0xfeff

    if-ne v0, v1, :cond_4

    invoke-virtual {p0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 130
    :cond_4
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 131
    const-string v1, "<!DOCTYPE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "<!ENTITY"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 132
    filled-new-array {v6, v6}, [I

    move-result-object v0

    .line 133
    new-instance v1, Lorg/rabochaya/projects/KmlProject$1;

    invoke-direct {v1, v0}, Lorg/rabochaya/projects/KmlProject$1;-><init>([I)V

    .line 142
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljavax/xml/parsers/SAXParserFactory;->setNamespaceAware(Z)V

    invoke-virtual {v0, v6}, Ljavax/xml/parsers/SAXParserFactory;->setValidating(Z)V

    .line 143
    invoke-virtual {v0}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v0

    new-instance v2, Lorg/xml/sax/InputSource;

    new-instance v3, Ljava/io/StringReader;

    invoke-direct {v3, p0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-virtual {v0, v2, v1}, Ljavax/xml/parsers/SAXParser;->parse(Lorg/xml/sax/InputSource;Lorg/xml/sax/helpers/DefaultHandler;)V

    .line 144
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljavax/xml/parsers/DocumentBuilderFactory;->setNamespaceAware(Z)V

    invoke-virtual {v0, v6}, Ljavax/xml/parsers/DocumentBuilderFactory;->setValidating(Z)V

    invoke-virtual {v0, v6}, Ljavax/xml/parsers/DocumentBuilderFactory;->setExpandEntityReferences(Z)V

    .line 145
    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 146
    new-instance v2, Lorg/rabochaya/projects/KmlProject$2;

    invoke-direct {v2}, Lorg/rabochaya/projects/KmlProject$2;-><init>()V

    invoke-virtual {v0, v2}, Ljavax/xml/parsers/DocumentBuilder;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    .line 147
    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilder;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    .line 148
    new-instance v1, Lorg/xml/sax/InputSource;

    new-instance v2, Ljava/io/StringReader;

    invoke-direct {v2, p0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-virtual {v0, v1}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object p0

    .line 149
    const-string v0, "kml"

    invoke-interface {p0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v1

    invoke-static {v1}, Lorg/rabochaya/projects/KmlProject;->tag(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 150
    new-instance v0, Lorg/rabochaya/projects/KmlProject;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/KmlProject;-><init>(Lorg/w3c/dom/Document;)V

    return-object v0

    .line 149
    :cond_5
    new-instance p0, Ljava/io/IOException;

    const-string v0, "\u042d\u0442\u043e \u043d\u0435 \u0434\u043e\u043a\u0443\u043c\u0435\u043d\u0442 KML"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 131
    :cond_6
    new-instance p0, Ljava/io/IOException;

    const-string v0, "DTD \u0438 XML-\u0441\u0443\u0449\u043d\u043e\u0441\u0442\u0438 \u0437\u0430\u043f\u0440\u0435\u0449\u0435\u043d\u044b"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    :catch_0
    move-exception p0

    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u0440\u043e\u0447\u0438\u0442\u0430\u0442\u044c KML: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :catch_1
    move-exception p0

    throw p0

    .line 121
    :cond_7
    new-instance p0, Ljava/io/IOException;

    const-string v0, "KML \u0441\u043b\u0438\u0448\u043a\u043e\u043c \u0432\u0435\u043b\u0438\u043a"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static read(Ljava/io/InputStream;Z)Lorg/rabochaya/projects/KmlProject;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 69
    const-string v0, "doc.kml"

    const/high16 v1, 0x400000

    if-nez p1, :cond_0

    invoke-static {p0, v1}, Lorg/rabochaya/projects/KmlProject;->readBounded(Ljava/io/InputStream;I)[B

    move-result-object p0

    invoke-static {p0}, Lorg/rabochaya/projects/KmlProject;->parse([B)Lorg/rabochaya/projects/KmlProject;

    move-result-object p0

    return-object p0

    .line 70
    :cond_0
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 71
    new-instance v2, Ljava/util/zip/ZipInputStream;

    new-instance v3, Lorg/rabochaya/projects/KmlProject$LimitedInput;

    const-wide/32 v4, 0x4000000

    invoke-direct {v3, p0, v4, v5}, Lorg/rabochaya/projects/KmlProject$LimitedInput;-><init>(Ljava/io/InputStream;J)V

    invoke-direct {v2, v3}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 73
    const/4 p0, 0x0

    move v3, p0

    .line 74
    :goto_0
    :try_start_0
    invoke-virtual {v2}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 75
    add-int/lit8 p0, p0, 0x1

    const/16 v5, 0x100

    if-gt p0, v5, :cond_4

    .line 76
    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/rabochaya/projects/KmlProject;->safePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 77
    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_0

    .line 78
    :cond_1
    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->size()I

    move-result v4

    if-ge v4, v5, :cond_3

    invoke-virtual {p1, v6}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 79
    const/high16 v4, 0x800000

    const/high16 v5, 0x2000000

    sub-int v7, v5, v3

    invoke-static {v4, v7}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v2, v4}, Lorg/rabochaya/projects/KmlProject;->readBounded(Ljava/io/InputStream;I)[B

    move-result-object v4

    .line 80
    array-length v7, v4

    add-int/2addr v3, v7

    .line 81
    if-gt v3, v5, :cond_2

    .line 82
    invoke-virtual {p1, v6, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/util/zip/ZipInputStream;->closeEntry()V

    .line 83
    goto :goto_0

    .line 81
    :cond_2
    new-instance p0, Ljava/io/IOException;

    const-string p1, "KMZ \u0441\u043b\u0438\u0448\u043a\u043e\u043c \u0432\u0435\u043b\u0438\u043a"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 78
    :cond_3
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u044b\u0439 \u0441\u043e\u0441\u0442\u0430\u0432 KMZ"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 75
    :cond_4
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u043c\u043d\u043e\u0433\u043e \u0437\u0430\u043f\u0438\u0441\u0435\u0439 \u0432 KMZ"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 84
    :cond_5
    invoke-virtual {p1, v0}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6

    goto :goto_1

    :cond_6
    const/4 v0, 0x0

    .line 85
    :goto_1
    if-nez v0, :cond_9

    .line 86
    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_7
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    const-string v5, ".kml"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 87
    if-nez v0, :cond_8

    .line 88
    move-object v0, v3

    goto :goto_2

    .line 87
    :cond_8
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u0412 KMZ \u043d\u0435\u0441\u043a\u043e\u043b\u044c\u043a\u043e KML \u0431\u0435\u0437 \u043e\u0441\u043d\u043e\u0432\u043d\u043e\u0433\u043e doc.kml"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 91
    :cond_9
    if-eqz v0, :cond_b

    .line 92
    invoke-virtual {p1, v0}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [B

    .line 93
    array-length v3, p0

    if-gt v3, v1, :cond_a

    .line 94
    invoke-static {p0}, Lorg/rabochaya/projects/KmlProject;->parse([B)Lorg/rabochaya/projects/KmlProject;

    move-result-object p0

    iput-object v0, p0, Lorg/rabochaya/projects/KmlProject;->entry:Ljava/lang/String;

    iget-object v0, p0, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->putAll(Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    invoke-virtual {v2}, Ljava/util/zip/ZipInputStream;->close()V

    .line 94
    return-object p0

    .line 93
    :cond_a
    :try_start_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "KML \u0441\u043b\u0438\u0448\u043a\u043e\u043c \u0432\u0435\u043b\u0438\u043a"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 91
    :cond_b
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u0412 KMZ \u043d\u0435\u0442 KML"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 95
    :catchall_0
    move-exception p0

    invoke-virtual {v2}, Ljava/util/zip/ZipInputStream;->close()V

    throw p0
.end method

.method public static readBounded(Ljava/io/InputStream;I)[B
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 104
    if-ltz p1, :cond_2

    .line 105
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v1, 0x4000

    new-array v1, v1, [B

    const/4 v2, 0x0

    move v3, v2

    .line 106
    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_1

    .line 107
    add-int/2addr v3, v4

    if-gt v3, p1, :cond_0

    .line 108
    invoke-virtual {v0, v1, v2, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 107
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u0424\u0430\u0439\u043b \u043f\u0440\u0435\u0432\u044b\u0448\u0430\u0435\u0442 \u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 110
    :cond_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0

    .line 104
    :cond_2
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041f\u0440\u0435\u0432\u044b\u0448\u0435\u043d \u043f\u0440\u0435\u0434\u0435\u043b \u0440\u0430\u0437\u043c\u0435\u0440\u0430"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private ring(Lorg/w3c/dom/Element;Z)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "Z)",
            "Ljava/util/List<",
            "[D>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 218
    const-string p2, "LinearRing"

    invoke-static {p1, p2}, Lorg/rabochaya/projects/KmlProject;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 219
    const-string p2, "coordinates"

    invoke-static {p1, p2}, Lorg/rabochaya/projects/KmlProject;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/rabochaya/projects/KmlProject;->coordinates(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    .line 220
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p2

    const/4 v0, 0x4

    if-lt p2, v0, :cond_1

    .line 221
    const/4 p2, 0x0

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [D

    .line 222
    aget-wide v3, v0, p2

    aget-wide v5, v1, p2

    cmpl-double p2, v3, v5

    if-nez p2, :cond_0

    aget-wide v3, v0, v2

    aget-wide v0, v1, v2

    cmpl-double p2, v3, v0

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u041a\u043e\u043d\u0442\u0443\u0440 \u043e\u0431\u043b\u0430\u0441\u0442\u0438 \u043d\u0435 \u0437\u0430\u043c\u043a\u043d\u0443\u0442"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 220
    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u0423 \u043a\u043e\u043d\u0442\u0443\u0440\u0430 \u043c\u0435\u043d\u044c\u0448\u0435 \u0447\u0435\u0442\u044b\u0440\u0451\u0445 \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 218
    :cond_2
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u041d\u0435\u0442 LinearRing"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static safePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 113
    const-string v0, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u043f\u0443\u0442\u044c \u0432 KMZ"

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x200

    if-gt v1, v2, :cond_3

    const-string v1, "/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    const/16 v2, 0x5c

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_3

    const/16 v2, 0x3a

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_3

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-gez v3, :cond_3

    .line 115
    const/4 v3, -0x1

    invoke-virtual {p0, v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 116
    nop

    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_2

    const-string v3, ".."

    aget-object v4, v1, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, "."

    aget-object v4, v1, v2

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    aget-object v3, v1, v2

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    array-length v3, v1

    add-int/lit8 v3, v3, -0x1

    if-ne v2, v3, :cond_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 117
    :cond_1
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 118
    :cond_2
    return-object p0

    .line 114
    :cond_3
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static tag(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 1

    .line 172
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    const/16 p0, 0x3a

    invoke-virtual {v0, p0}, Ljava/lang/String;->indexOf(I)I

    move-result p0

    if-ltz p0, :cond_0

    add-int/lit8 p0, p0, 0x1

    invoke-virtual {v0, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public static text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 175
    invoke-static {p0, p1}, Lorg/rabochaya/projects/KmlProject;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    if-nez p0, :cond_0

    const-string p0, ""

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method


# virtual methods
.method public byId(Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 1

    .line 178
    iget-object v0, p0, Lorg/rabochaya/projects/KmlProject;->ids:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/w3c/dom/Element;

    return-object p1
.end method

.method public children(Lorg/w3c/dom/Element;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            ")",
            "Ljava/util/List<",
            "Lorg/w3c/dom/Element;",
            ">;"
        }
    .end annotation

    .line 180
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 181
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_2

    instance-of v1, p1, Lorg/w3c/dom/Element;

    if-eqz v1, :cond_1

    move-object v1, p1

    check-cast v1, Lorg/w3c/dom/Element;

    invoke-static {v1}, Lorg/rabochaya/projects/KmlProject;->isContainer(Lorg/w3c/dom/Element;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "Placemark"

    invoke-static {p1}, Lorg/rabochaya/projects/KmlProject;->tag(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p1

    goto :goto_0

    .line 182
    :cond_2
    return-object v0
.end method

.method public effectivelyVisible(Lorg/w3c/dom/Element;)Z
    .locals 1

    .line 185
    nop

    :goto_0
    instance-of v0, p1, Lorg/w3c/dom/Element;

    if-eqz v0, :cond_1

    move-object v0, p1

    check-cast v0, Lorg/w3c/dom/Element;

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/KmlProject;->visible(Lorg/w3c/dom/Element;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public features(Z)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/KmlProject$Feature;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 190
    iget-object v0, p0, Lorg/rabochaya/projects/KmlProject;->cached:Ljava/util/List;

    if-eqz v0, :cond_3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lorg/rabochaya/projects/KmlProject;->cached:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/KmlProject$Feature;

    if-eqz p1, :cond_1

    iget-object v3, v2, Lorg/rabochaya/projects/KmlProject$Feature;->element:Lorg/w3c/dom/Element;

    invoke-virtual {p0, v3}, Lorg/rabochaya/projects/KmlProject;->effectivelyVisible(Lorg/w3c/dom/Element;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_1
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v0

    .line 191
    :cond_3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lorg/rabochaya/projects/KmlProject;->document:Lorg/w3c/dom/Document;

    const-string v2, "*"

    const-string v3, "Placemark"

    invoke-interface {v1, v2, v3}, Lorg/w3c/dom/Document;->getElementsByTagNameNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 192
    const/4 v2, 0x0

    :goto_1
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v2, v3, :cond_6

    .line 193
    invoke-interface {v1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    check-cast v3, Lorg/w3c/dom/Element;

    if-eqz p1, :cond_4

    invoke-virtual {p0, v3}, Lorg/rabochaya/projects/KmlProject;->effectivelyVisible(Lorg/w3c/dom/Element;)Z

    move-result v4

    if-nez v4, :cond_4

    goto :goto_2

    .line 194
    :cond_4
    new-instance v4, Lorg/rabochaya/projects/KmlProject$Feature;

    invoke-direct {v4}, Lorg/rabochaya/projects/KmlProject$Feature;-><init>()V

    iput-object v3, v4, Lorg/rabochaya/projects/KmlProject$Feature;->element:Lorg/w3c/dom/Element;

    invoke-static {v3}, Lorg/rabochaya/projects/KmlProject;->name(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lorg/rabochaya/projects/KmlProject$Feature;->name:Ljava/lang/String;

    iget-object v5, v4, Lorg/rabochaya/projects/KmlProject$Feature;->shapes:Ljava/util/List;

    invoke-direct {p0, v3, v5}, Lorg/rabochaya/projects/KmlProject;->geometry(Lorg/w3c/dom/Element;Ljava/util/List;)V

    invoke-direct {p0, v3}, Lorg/rabochaya/projects/KmlProject;->color(Lorg/w3c/dom/Element;)I

    move-result v3

    iput v3, v4, Lorg/rabochaya/projects/KmlProject$Feature;->color:I

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    const/16 v4, 0x1388

    if-gt v3, v4, :cond_5

    .line 192
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 195
    :cond_5
    new-instance p1, Ljava/io/IOException;

    const-string v0, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u043c\u043d\u043e\u0433\u043e \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 197
    :cond_6
    return-object v0
.end method

.method public kmz(Ljava/io/OutputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 162
    new-instance v0, Ljava/util/zip/ZipOutputStream;

    invoke-direct {v0, p1}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 164
    :try_start_0
    new-instance p1, Ljava/util/zip/ZipEntry;

    iget-object v1, p0, Lorg/rabochaya/projects/KmlProject;->entry:Ljava/lang/String;

    invoke-static {v1}, Lorg/rabochaya/projects/KmlProject;->safePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v1}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/KmlProject;->xml()[B

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/zip/ZipOutputStream;->write([B)V

    invoke-virtual {v0}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    .line 165
    iget-object p1, p0, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 166
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lorg/rabochaya/projects/KmlProject;->entry:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 167
    new-instance v2, Ljava/util/zip/ZipEntry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lorg/rabochaya/projects/KmlProject;->safePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    invoke-virtual {v0, v1}, Ljava/util/zip/ZipOutputStream;->write([B)V

    invoke-virtual {v0}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    .line 168
    goto :goto_0

    .line 166
    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v1, "\u041a\u043e\u043b\u043b\u0438\u0437\u0438\u044f \u043e\u0441\u043d\u043e\u0432\u043d\u043e\u0433\u043e KML \u0438 \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u044f"

    invoke-direct {p1, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 169
    :cond_1
    invoke-virtual {v0}, Ljava/util/zip/ZipOutputStream;->finish()V

    invoke-virtual {v0}, Ljava/util/zip/ZipOutputStream;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    invoke-virtual {v0}, Ljava/util/zip/ZipOutputStream;->close()V

    .line 171
    return-void

    .line 170
    :catchall_0
    move-exception p1

    invoke-virtual {v0}, Ljava/util/zip/ZipOutputStream;->close()V

    throw p1
.end method

.method public root()Lorg/w3c/dom/Element;
    .locals 2

    .line 177
    iget-object v0, p0, Lorg/rabochaya/projects/KmlProject;->document:Lorg/w3c/dom/Document;

    invoke-interface {v0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v0

    const-string v1, "Document"

    invoke-static {v0, v1}, Lorg/rabochaya/projects/KmlProject;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/KmlProject;->document:Lorg/w3c/dom/Document;

    invoke-interface {v0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public setVisible(Lorg/w3c/dom/Element;Z)V
    .locals 3

    .line 187
    const-string v0, "visibility"

    invoke-static {p1, v0}, Lorg/rabochaya/projects/KmlProject;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lorg/rabochaya/projects/KmlProject;->document:Lorg/w3c/dom/Document;

    const-string v2, "http://www.opengis.net/kml/2.2"

    invoke-interface {v1, v2, v0}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    const-string v0, "name"

    invoke-static {p1, v0}, Lorg/rabochaya/projects/KmlProject;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Lorg/w3c/dom/Element;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v0

    :goto_0
    invoke-interface {p1, v1, v0}, Lorg/w3c/dom/Element;->insertBefore(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    :cond_1
    if-eqz p2, :cond_2

    const-string p1, "1"

    goto :goto_1

    :cond_2
    const-string p1, "0"

    :goto_1
    invoke-interface {v1, p1}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 188
    return-void
.end method

.method public visible(Lorg/w3c/dom/Element;)Z
    .locals 1
    invoke-static {p1}, Lorg/rabochaya/projects/ObjectVisibility;->own(Lorg/w3c/dom/Element;)Z
    move-result v0
    return v0
.end method

.method public xml()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = { Ljava/io/IOException; }
    .end annotation
    iget-object v0, p0, Lorg/rabochaya/projects/KmlProject;->document:Lorg/w3c/dom/Document;
    invoke-static {v0}, Lorg/rabochaya/projects/KmlXml;->write(Lorg/w3c/dom/Document;)[B
    move-result-object v0
    return-object v0
.end method
