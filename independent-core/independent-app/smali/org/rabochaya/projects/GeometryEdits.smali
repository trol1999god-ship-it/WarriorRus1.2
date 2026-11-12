.class public final Lorg/rabochaya/projects/GeometryEdits;
.super Ljava/lang/Object;
.source "GeometryEdits.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/GeometryEdits$Target;,
        Lorg/rabochaya/projects/GeometryEdits$Part;
    }
.end annotation


# static fields
.field private static final UTF8:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 12
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/GeometryEdits;->UTF8:Ljava/nio/charset/Charset;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 11
    invoke-static {p0, p1}, Lorg/rabochaya/projects/GeometryEdits;->editorText(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static addHole(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 55
    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/GeometryEdits;->checked(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/rabochaya/projects/GeometryEdits$Target;

    move-result-object p0

    .line 56
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->polygon:Lorg/w3c/dom/Element;

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->hole:Z

    if-nez p1, :cond_0

    .line 58
    const-string p1, "Polygon"

    invoke-static {p3, p1}, Lorg/rabochaya/projects/GeometryCoordinates;->parse(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    .line 59
    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->polygon:Lorg/w3c/dom/Element;

    const-string p3, "innerBoundaryIs"

    invoke-static {p2, p3}, Lorg/rabochaya/projects/GeometryEdits;->element(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p2

    .line 60
    iget-object p3, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->polygon:Lorg/w3c/dom/Element;

    const-string v0, "LinearRing"

    invoke-static {p3, v0}, Lorg/rabochaya/projects/GeometryEdits;->element(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p3

    .line 61
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->polygon:Lorg/w3c/dom/Element;

    const-string v1, "coordinates"

    invoke-static {v0, v1}, Lorg/rabochaya/projects/GeometryEdits;->element(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 62
    invoke-static {p1}, Lorg/rabochaya/projects/GeometryCoordinates;->kml(Ljava/util/List;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 63
    invoke-interface {p3, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 64
    invoke-interface {p2, p3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 65
    iget-object p0, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->polygon:Lorg/w3c/dom/Element;

    invoke-interface {p0, p2}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 66
    return-void

    .line 57
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u0432\u043d\u0435\u0448\u043d\u0438\u0439 \u043a\u043e\u043d\u0442\u0443\u0440 \u043e\u0431\u043b\u0430\u0441\u0442\u0438"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static checked(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/rabochaya/projects/GeometryEdits$Target;
    .locals 1

    .line 76
    if-eqz p2, :cond_2

    invoke-static {p0}, Lorg/rabochaya/projects/GeometryEdits;->token(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 78
    invoke-static {p0}, Lorg/rabochaya/projects/GeometryEdits;->targets(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/rabochaya/projects/GeometryEdits$Target;

    iget-object v0, p2, Lorg/rabochaya/projects/GeometryEdits$Target;->key:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p2

    .line 79
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "\u0412\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0439 \u043a\u043e\u043d\u0442\u0443\u0440 \u0431\u043e\u043b\u044c\u0448\u0435 \u043d\u0435 \u0441\u0443\u0449\u0435\u0441\u0442\u0432\u0443\u0435\u0442"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 77
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "\u0413\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0430\u0441\u044c. \u0417\u0430\u043a\u0440\u043e\u0439\u0442\u0435 \u0440\u0435\u0434\u0430\u043a\u0442\u043e\u0440 \u0438 \u043e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0430\u043a\u0442\u0443\u0430\u043b\u044c\u043d\u044b\u0439 \u043e\u0431\u044a\u0435\u043a\u0442; \u0432\u0432\u043e\u0434 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d \u0432 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a\u0435"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 2

    .line 164
    invoke-static {p0}, Lorg/rabochaya/projects/GeometryEdits;->children(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    invoke-static {v0, p1}, Lorg/rabochaya/projects/GeometryEdits;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method private static children(Lorg/w3c/dom/Element;)Ljava/util/List;
    .locals 2
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

    .line 165
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p0

    :goto_0
    if-eqz p0, :cond_1

    instance-of v1, p0, Lorg/w3c/dom/Element;

    if-eqz v1, :cond_0

    move-object v1, p0

    check-cast v1, Lorg/w3c/dom/Element;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p0

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private static editorText(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10

    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string v1, "\\s+"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_3

    aget-object v4, p0, v3

    .line 121
    const-string v5, ","

    const/4 v6, -0x1

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v4

    .line 122
    array-length v5, v4

    const/4 v6, 0x2

    if-lt v5, v6, :cond_2

    array-length v5, v4

    const/4 v7, 0x3

    if-gt v5, v7, :cond_2

    .line 124
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_0

    const/16 v5, 0xa

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 125
    :cond_0
    const/4 v5, 0x1

    aget-object v5, v4, v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v8, 0x20

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v9, v4, v2

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    array-length v5, v4

    if-ne v5, v7, :cond_1

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v4, v4, v6

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 123
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b \u044d\u0442\u043e\u0433\u043e \u043a\u043e\u043d\u0442\u0443\u0440\u0430 \u043d\u0435\u043b\u044c\u0437\u044f \u0431\u0435\u0437\u043e\u043f\u0430\u0441\u043d\u043e \u043e\u0442\u043a\u0440\u044b\u0442\u044c \u0432 \u0440\u0435\u0434\u0430\u043a\u0442\u043e\u0440\u0435"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 129
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1}, Lorg/rabochaya/projects/GeometryCoordinates;->parse(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static element(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 3

    .line 166
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getPrefix()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object p0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    const/4 v1, 0x0

    :cond_1
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_0

    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_3
    :goto_0
    invoke-interface {p0, v1, p1}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    return-object p0
.end method

.method private static hash(Lorg/w3c/dom/Node;Ljava/security/MessageDigest;I)V
    .locals 5

    .line 149
    const/16 v0, 0x40

    if-gt p2, v0, :cond_5

    .line 150
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lorg/rabochaya/projects/GeometryEdits;->part(Ljava/security/MessageDigest;Ljava/lang/String;)V

    .line 151
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lorg/rabochaya/projects/GeometryEdits;->part(Ljava/security/MessageDigest;Ljava/lang/String;)V

    .line 152
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {p1, v0}, Lorg/rabochaya/projects/GeometryEdits;->part(Ljava/security/MessageDigest;Ljava/lang/String;)V

    .line 153
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lorg/rabochaya/projects/GeometryEdits;->part(Ljava/security/MessageDigest;Ljava/lang/String;)V

    .line 154
    :cond_1
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v0

    .line 155
    if-eqz v0, :cond_3

    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    const/4 v2, 0x0

    :goto_1
    invoke-interface {v0}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v3

    if-ge v2, v3, :cond_2

    invoke-interface {v0, v2}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v4, v3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    invoke-virtual {v1}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {p1, v2}, Lorg/rabochaya/projects/GeometryEdits;->part(Ljava/security/MessageDigest;Ljava/lang/String;)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {p1, v1}, Lorg/rabochaya/projects/GeometryEdits;->part(Ljava/security/MessageDigest;Ljava/lang/String;)V

    goto :goto_2

    .line 156
    :cond_3
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p0

    :goto_3
    if-eqz p0, :cond_4

    add-int/lit8 v0, p2, 0x1

    invoke-static {p0, p1, v0}, Lorg/rabochaya/projects/GeometryEdits;->hash(Lorg/w3c/dom/Node;Ljava/security/MessageDigest;I)V

    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p0

    goto :goto_3

    .line 157
    :cond_4
    const-string p0, "/end"

    invoke-static {p1, p0}, Lorg/rabochaya/projects/GeometryEdits;->part(Ljava/security/MessageDigest;Ljava/lang/String;)V

    .line 158
    return-void

    .line 149
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0433\u043b\u0443\u0431\u043e\u043a\u043e \u0432\u043b\u043e\u0436\u0435\u043d\u0430 \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z
    .locals 1

    .line 163
    invoke-static {p0}, Lorg/rabochaya/projects/GeometryEdits;->kml(Lorg/w3c/dom/Element;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lorg/rabochaya/projects/GeometryEdits;->local(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static kml(Lorg/w3c/dom/Element;)Z
    .locals 1

    .line 160
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "http://www.opengis.net/kml/2.2"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "http://earth\\.google\\.com/kml/2\\.[012]"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

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

.method private static local(Lorg/w3c/dom/Element;)Ljava/lang/String;
    .locals 1

    .line 162
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method private static part(Ljava/security/MessageDigest;Ljava/lang/String;)V
    .locals 2

    .line 143
    sget-object v0, Lorg/rabochaya/projects/GeometryEdits;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    .line 144
    array-length v0, p1

    .line 145
    ushr-int/lit8 v1, v0, 0x18

    int-to-byte v1, v1

    invoke-virtual {p0, v1}, Ljava/security/MessageDigest;->update(B)V

    ushr-int/lit8 v1, v0, 0x10

    int-to-byte v1, v1

    invoke-virtual {p0, v1}, Ljava/security/MessageDigest;->update(B)V

    .line 146
    ushr-int/lit8 v1, v0, 0x8

    int-to-byte v1, v1

    invoke-virtual {p0, v1}, Ljava/security/MessageDigest;->update(B)V

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Ljava/security/MessageDigest;->update(B)V

    invoke-virtual {p0, p1}, Ljava/security/MessageDigest;->update([B)V

    .line 147
    return-void
.end method

.method public static parts(Lorg/w3c/dom/Element;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            ")",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/GeometryEdits$Part;",
            ">;"
        }
    .end annotation

    .line 40
    invoke-static {p0}, Lorg/rabochaya/projects/GeometryEdits;->targets(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v0

    .line 41
    invoke-static {p0}, Lorg/rabochaya/projects/GeometryEdits;->token(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object p0

    .line 42
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 43
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/GeometryEdits$Target;

    new-instance v3, Lorg/rabochaya/projects/GeometryEdits$Part;

    const/4 v4, 0x0

    invoke-direct {v3, v2, p0, v4}, Lorg/rabochaya/projects/GeometryEdits$Part;-><init>(Lorg/rabochaya/projects/GeometryEdits$Target;Ljava/lang/String;Lorg/rabochaya/projects/GeometryEdits$1;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 44
    :cond_0
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static removeHole(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 69
    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/GeometryEdits;->checked(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/rabochaya/projects/GeometryEdits$Target;

    move-result-object p0

    .line 70
    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->hole:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->boundary:Lorg/w3c/dom/Element;

    if-eqz p1, :cond_0

    .line 72
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->polygon:Lorg/w3c/dom/Element;

    iget-object p0, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->boundary:Lorg/w3c/dom/Element;

    invoke-interface {p1, p0}, Lorg/w3c/dom/Element;->removeChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 73
    return-void

    .line 71
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u041c\u043e\u0436\u043d\u043e \u0443\u0434\u0430\u043b\u0438\u0442\u044c \u0442\u043e\u043b\u044c\u043a\u043e \u0432\u043d\u0443\u0442\u0440\u0435\u043d\u043d\u0438\u0439 \u043a\u043e\u043d\u0442\u0443\u0440"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static replace(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 48
    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/GeometryEdits;->checked(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/rabochaya/projects/GeometryEdits$Target;

    move-result-object p0

    .line 49
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->type:Ljava/lang/String;

    invoke-static {p3, p1}, Lorg/rabochaya/projects/GeometryCoordinates;->parse(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    .line 51
    iget-object p0, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->coordinates:Lorg/w3c/dom/Element;

    invoke-static {p1}, Lorg/rabochaya/projects/GeometryCoordinates;->kml(Ljava/util/List;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 52
    return-void
.end method

.method private static targets(Lorg/w3c/dom/Element;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            ")",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/GeometryEdits$Target;",
            ">;"
        }
    .end annotation

    .line 83
    const-string v0, "Placemark"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/GeometryEdits;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 85
    const-string v1, ""

    const/4 v2, 0x0

    invoke-static {p0, v1, v2, v0}, Lorg/rabochaya/projects/GeometryEdits;->walk(Lorg/w3c/dom/Element;Ljava/lang/String;ILjava/util/List;)V

    .line 86
    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/GeometryEdits$Target;

    iget-object v2, v2, Lorg/rabochaya/projects/GeometryEdits$Target;->key:Ljava/lang/String;

    invoke-interface {p0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u041f\u043e\u0432\u0442\u043e\u0440\u044f\u044e\u0449\u0438\u0439\u0441\u044f \u0432\u043d\u0435\u0448\u043d\u0438\u0439 \u043a\u043e\u043d\u0442\u0443\u0440 \u043d\u0435\u043b\u044c\u0437\u044f \u0431\u0435\u0437\u043e\u043f\u0430\u0441\u043d\u043e \u0430\u0434\u0440\u0435\u0441\u043e\u0432\u0430\u0442\u044c"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 87
    :cond_1
    return-object v0

    .line 83
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u041d\u0443\u0436\u043d\u0430 \u043e\u0442\u0434\u0435\u043b\u044c\u043d\u0430\u044f \u043c\u0435\u0442\u043a\u0430 KML"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static token(Lorg/w3c/dom/Element;)Ljava/lang/String;
    .locals 9

    .line 135
    :try_start_0
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 136
    invoke-static {p0}, Lorg/rabochaya/projects/GeometryEdits;->children(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    invoke-static {v1}, Lorg/rabochaya/projects/GeometryEdits;->kml(Lorg/w3c/dom/Element;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x6

    new-array v4, v4, [Ljava/lang/String;

    const-string v5, "Point"

    aput-object v5, v4, v3

    const-string v5, "LineString"

    aput-object v5, v4, v2

    const-string v2, "Polygon"

    const/4 v5, 0x2

    aput-object v2, v4, v5

    const-string v2, "MultiGeometry"

    const/4 v5, 0x3

    aput-object v2, v4, v5

    const-string v2, "LinearRing"

    const/4 v5, 0x4

    aput-object v2, v4, v5

    const-string v2, "Model"

    const/4 v5, 0x5

    aput-object v2, v4, v5

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-static {v1}, Lorg/rabochaya/projects/GeometryEdits;->local(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {v1, v0, v3}, Lorg/rabochaya/projects/GeometryEdits;->hash(Lorg/w3c/dom/Node;Ljava/security/MessageDigest;I)V

    goto :goto_0

    .line 137
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 138
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    array-length v1, v0

    move v4, v3

    :goto_1
    if-ge v4, v1, :cond_2

    aget-byte v5, v0, v4

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "%02x"

    new-array v8, v2, [Ljava/lang/Object;

    and-int/lit16 v5, v5, 0xff

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v8, v3

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 139
    :cond_2
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 140
    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method private static walk(Lorg/w3c/dom/Element;Ljava/lang/String;ILjava/util/List;)V
    .locals 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/GeometryEdits$Target;",
            ">;)V"
        }
    .end annotation

    .line 91
    move/from16 v0, p2

    move-object/from16 v1, p3

    const/16 v2, 0x20

    if-gt v0, v2, :cond_10

    .line 92
    nop

    .line 93
    invoke-static/range {p0 .. p0}, Lorg/rabochaya/projects/GeometryEdits;->children(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v4, 0x0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/w3c/dom/Element;

    .line 94
    invoke-static {v5}, Lorg/rabochaya/projects/GeometryEdits;->local(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v6

    .line 95
    invoke-static {v5}, Lorg/rabochaya/projects/GeometryEdits;->kml(Lorg/w3c/dom/Element;)Z

    move-result v7

    if-eqz v7, :cond_e

    const-string v12, "LinearRing"

    const-string v13, "Model"

    const-string v8, "Point"

    const-string v9, "LineString"

    const-string v10, "Polygon"

    const-string v11, "MultiGeometry"

    filled-new-array/range {v8 .. v13}, [Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    move-object/from16 v24, v2

    goto/16 :goto_a

    .line 96
    :cond_0
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_1

    add-int/lit8 v7, v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v14, p1

    move/from16 v23, v7

    goto :goto_1

    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v14, p1

    invoke-virtual {v7, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    add-int/lit8 v8, v4, 0x1

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move/from16 v23, v8

    .line 97
    :goto_1
    const-string v7, "MultiGeometry"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    add-int/lit8 v6, v0, 0x1

    invoke-static {v5, v4, v6, v1}, Lorg/rabochaya/projects/GeometryEdits;->walk(Lorg/w3c/dom/Element;Ljava/lang/String;ILjava/util/List;)V

    move-object/from16 v24, v2

    goto/16 :goto_9

    .line 98
    :cond_2
    const-string v7, "Polygon"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    const-string v15, " \u00b7 "

    const-string v13, "\u0413\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f "

    const-string v12, "coordinates"

    const-string v11, "LinearRing"

    if-eqz v8, :cond_9

    .line 99
    nop

    .line 100
    invoke-static {v5}, Lorg/rabochaya/projects/GeometryEdits;->children(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v16

    const/4 v6, 0x0

    :goto_2
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    move-object v10, v7

    check-cast v10, Lorg/w3c/dom/Element;

    .line 101
    const-string v7, "innerBoundaryIs"

    invoke-static {v10, v7}, Lorg/rabochaya/projects/GeometryEdits;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v17

    .line 102
    if-nez v17, :cond_3

    const-string v7, "outerBoundaryIs"

    invoke-static {v10, v7}, Lorg/rabochaya/projects/GeometryEdits;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_3

    goto :goto_2

    .line 103
    :cond_3
    invoke-static {v10, v11}, Lorg/rabochaya/projects/GeometryEdits;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v7

    .line 104
    if-nez v7, :cond_4

    const/4 v7, 0x0

    goto :goto_3

    :cond_4
    invoke-static {v7, v12}, Lorg/rabochaya/projects/GeometryEdits;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v7

    :goto_3
    move-object/from16 v18, v7

    .line 105
    if-eqz v18, :cond_7

    new-instance v9, Lorg/rabochaya/projects/GeometryEdits$Target;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-eqz v17, :cond_5

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/inner/"

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v8, v6, 0x1

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_4

    :cond_5
    const-string v3, "/outer"

    move v8, v6

    :goto_4
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 106
    if-eqz v17, :cond_6

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u0432\u043d\u0443\u0442\u0440\u0435\u043d\u043d\u0438\u0439 \u043a\u043e\u043d\u0442\u0443\u0440 "

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    :cond_6
    const-string v0, "\u0432\u043d\u0435\u0448\u043d\u0438\u0439 \u043a\u043e\u043d\u0442\u0443\u0440"

    :goto_5
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v3, "Polygon"

    move-object v6, v9

    move/from16 v19, v8

    move-object v8, v0

    move-object v0, v9

    move-object v9, v3

    move-object v3, v10

    move-object/from16 v10, v18

    move-object/from16 v24, v2

    move-object v2, v11

    move-object v11, v5

    move-object v14, v12

    move-object v12, v3

    move-object v3, v13

    move/from16 v13, v17

    invoke-direct/range {v6 .. v13}, Lorg/rabochaya/projects/GeometryEdits$Target;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/w3c/dom/Element;Lorg/w3c/dom/Element;Lorg/w3c/dom/Element;Z)V

    .line 105
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move/from16 v6, v19

    goto :goto_6

    :cond_7
    move-object/from16 v24, v2

    move-object v2, v11

    move-object v14, v12

    move-object v3, v13

    .line 108
    :goto_6
    move/from16 v0, p2

    move-object v11, v2

    move-object v13, v3

    move-object v12, v14

    move-object/from16 v2, v24

    move-object/from16 v14, p1

    goto/16 :goto_2

    .line 109
    :cond_8
    move-object/from16 v24, v2

    goto :goto_8

    :cond_9
    move-object/from16 v24, v2

    move-object v2, v11

    move-object v14, v12

    move-object v3, v13

    const-string v0, "Point"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    const-string v0, "LineString"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 110
    :cond_a
    invoke-static {v5, v14}, Lorg/rabochaya/projects/GeometryEdits;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v19

    .line 111
    if-eqz v19, :cond_c

    new-instance v0, Lorg/rabochaya/projects/GeometryEdits$Target;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 112
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    move-object/from16 v18, v7

    goto :goto_7

    :cond_b
    move-object/from16 v18, v6

    :goto_7
    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v20, 0x0

    move-object v15, v0

    move-object/from16 v16, v4

    invoke-direct/range {v15 .. v22}, Lorg/rabochaya/projects/GeometryEdits$Target;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/w3c/dom/Element;Lorg/w3c/dom/Element;Lorg/w3c/dom/Element;Z)V

    .line 111
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    :cond_c
    :goto_8
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v0

    const/16 v2, 0x2710

    if-gt v0, v2, :cond_d

    .line 115
    nop

    .line 93
    :goto_9
    move/from16 v0, p2

    move/from16 v4, v23

    goto :goto_b

    .line 114
    :cond_d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u043c\u043d\u043e\u0433\u043e \u043a\u043e\u043d\u0442\u0443\u0440\u043e\u0432"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 95
    :cond_e
    move-object/from16 v24, v2

    .line 93
    :goto_a
    move/from16 v0, p2

    :goto_b
    move-object/from16 v2, v24

    goto/16 :goto_0

    .line 116
    :cond_f
    return-void

    .line 91
    :cond_10
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0433\u043b\u0443\u0431\u043e\u043a\u043e \u0432\u043b\u043e\u0436\u0435\u043d\u0430 \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
