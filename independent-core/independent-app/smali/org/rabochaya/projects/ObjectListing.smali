.class public final Lorg/rabochaya/projects/ObjectListing;
.super Ljava/lang/Object;
.source "ObjectListing.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/ObjectListing$Item;,
        Lorg/rabochaya/projects/ObjectListing$Options;
    }
.end annotation


# static fields
.field public static final KINDS:[Ljava/lang/String;

.field public static final SEARCH_FIELDS:[Ljava/lang/String;

.field public static final SORTS:[Ljava/lang/String;

.field public static final VISIBILITY:[Ljava/lang/String;


# instance fields
.field private final byKey:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/rabochaya/projects/ObjectListing$Item;",
            ">;"
        }
    .end annotation
.end field

.field private final items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/ObjectListing$Item;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 5
    const-string v6, "\u0421\u043c\u0435\u0448\u0430\u043d\u043d\u0430\u044f \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f"

    const-string v7, "\u041f\u0440\u043e\u0447\u0435\u0435"

    const-string v0, "\u0412\u0441\u0435 \u0442\u0438\u043f\u044b"

    const-string v1, "\u041f\u0430\u043f\u043a\u0438 \u0438 \u0433\u0440\u0443\u043f\u043f\u044b"

    const-string v2, "\u041c\u0435\u0442\u043a\u0438"

    const-string v3, "\u041b\u0438\u043d\u0438\u0438 \u0438 \u043c\u0430\u0440\u0448\u0440\u0443\u0442\u044b"

    const-string v4, "\u041e\u0431\u043b\u0430\u0441\u0442\u0438"

    const-string v5, "\u0422\u0440\u0435\u043a\u0438 gx"

    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/ObjectListing;->KINDS:[Ljava/lang/String;

    .line 6
    const-string v0, "\u0412\u0438\u0434\u0438\u043c\u044b\u0435 \u043f\u043e KML"

    const-string v1, "\u0421\u043a\u0440\u044b\u0442\u044b\u0435 \u043f\u043e KML"

    const-string v2, "\u041b\u044e\u0431\u0430\u044f \u0432\u0438\u0434\u0438\u043c\u043e\u0441\u0442\u044c"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/ObjectListing;->VISIBILITY:[Ljava/lang/String;

    .line 7
    const-string v0, "\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435"

    const-string v1, "\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435 \u0438\u043b\u0438 \u043e\u043f\u0438\u0441\u0430\u043d\u0438\u0435"

    const-string v2, "\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/ObjectListing;->SEARCH_FIELDS:[Ljava/lang/String;

    .line 8
    const-string v0, "\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435 \u042f\u2013\u0410"

    const-string v1, "\u0422\u0438\u043f \u0438 \u043d\u0430\u0437\u0432\u0430\u043d\u0438\u0435"

    const-string v2, "\u0418\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u043f\u043e\u0440\u044f\u0434\u043e\u043a"

    const-string v3, "\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435 \u0410\u2013\u042f"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/ObjectListing;->SORTS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/util/List;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/ObjectListing$Item;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/rabochaya/projects/ObjectListing$Item;",
            ">;)V"
        }
    .end annotation

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectListing;->items:Ljava/util/List;

    invoke-static {p2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectListing;->byKey:Ljava/util/Map;

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 4
    invoke-static {p0}, Lorg/rabochaya/projects/ObjectListing;->searchable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lorg/w3c/dom/Element;)Ljava/util/List;
    .locals 0

    .line 4
    invoke-static {p0}, Lorg/rabochaya/projects/ObjectListing;->children(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lorg/w3c/dom/Element;Ljava/lang/String;)Z
    .locals 0

    .line 4
    invoke-static {p0, p1}, Lorg/rabochaya/projects/ObjectListing;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static asciiLetter(C)Z
    .locals 1

    .line 65
    const/16 v0, 0x61

    if-lt p0, v0, :cond_0

    const/16 v0, 0x7a

    if-le p0, v0, :cond_1

    :cond_0
    const/16 v0, 0x41

    if-lt p0, v0, :cond_2

    const/16 v0, 0x5a

    if-gt p0, v0, :cond_2

    :cond_1
    const/4 p0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static blockTag(Ljava/lang/String;)Z
    .locals 19

    .line 67
    const-string v17, "blockquote"

    const-string v18, "pre"

    const-string v0, "br"

    const-string v1, "p"

    const-string v2, "div"

    const-string v3, "li"

    const-string v4, "ul"

    const-string v5, "ol"

    const-string v6, "table"

    const-string v7, "tr"

    const-string v8, "td"

    const-string v9, "th"

    const-string v10, "hr"

    const-string v11, "h1"

    const-string v12, "h2"

    const-string v13, "h3"

    const-string v14, "h4"

    const-string v15, "h5"

    const-string v16, "h6"

    filled-new-array/range {v0 .. v18}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    move-object/from16 v1, p0

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static breadcrumb(Lorg/rabochaya/projects/ObjectListing$Item;)Ljava/lang/String;
    .locals 4

    .line 29
    if-nez p0, :cond_0

    const-string p0, "\u041a\u043e\u0440\u0435\u043d\u044c \u043f\u0440\u043e\u0435\u043a\u0442\u0430"

    return-object p0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectListing$Item;->row:Lorg/rabochaya/projects/ObjectTree$Row;

    iget-object v0, v0, Lorg/rabochaya/projects/ObjectTree$Row;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x40

    if-le v1, v2, :cond_2

    const/16 v1, 0x3e

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    const/16 v1, 0x3f

    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\u2026"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p0, p0, Lorg/rabochaya/projects/ObjectListing$Item;->path:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, " / "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x100

    if-le v0, v1, :cond_4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit16 v0, v0, -0xfc

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isLowSurrogate(C)Z

    move-result v1

    if-eqz v1, :cond_3

    add-int/lit8 v0, v0, 0x1

    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u2026 / "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_4
    return-object p0
.end method

.method public static build(Lorg/w3c/dom/Element;Ljava/util/List;)Lorg/rabochaya/projects/ObjectListing;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/ObjectTree$Row;",
            ">;)",
            "Lorg/rabochaya/projects/ObjectListing;"
        }
    .end annotation

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const/4 v2, 0x1

    move v3, v2

    :goto_0
    instance-of v4, p0, Lorg/w3c/dom/Element;

    if-eqz v4, :cond_0

    move-object v4, p0

    check-cast v4, Lorg/w3c/dom/Element;

    invoke-static {v4}, Lorg/rabochaya/projects/ObjectListing;->ownVisible(Lorg/w3c/dom/Element;)Z

    move-result v4

    and-int/2addr v3, v4

    invoke-interface {p0}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object p0

    goto :goto_0

    .line 26
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/rabochaya/projects/ObjectTree$Row;

    iget-object v4, p1, Lorg/rabochaya/projects/ObjectTree$Row;->parent:Ljava/lang/String;

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/ObjectListing$Item;

    iget-object v5, p1, Lorg/rabochaya/projects/ObjectTree$Row;->parent:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2

    if-eqz v4, :cond_1

    goto :goto_2

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u041d\u0430\u0440\u0443\u0448\u0435\u043d \u043f\u043e\u0440\u044f\u0434\u043e\u043a \u0434\u0435\u0440\u0435\u0432\u0430"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    :goto_2
    invoke-static {v4}, Lorg/rabochaya/projects/ObjectListing;->breadcrumb(Lorg/rabochaya/projects/ObjectListing$Item;)Ljava/lang/String;

    move-result-object v6

    if-nez v4, :cond_3

    if-eqz v3, :cond_4

    goto :goto_3

    :cond_3
    iget-boolean v4, v4, Lorg/rabochaya/projects/ObjectListing$Item;->visible:Z

    if-eqz v4, :cond_4

    :goto_3
    iget-object v4, p1, Lorg/rabochaya/projects/ObjectTree$Row;->element:Lorg/w3c/dom/Element;

    invoke-static {v4}, Lorg/rabochaya/projects/ObjectListing;->ownVisible(Lorg/w3c/dom/Element;)Z

    move-result v4

    if-eqz v4, :cond_4

    move v8, v2

    goto :goto_4

    :cond_4
    const/4 v4, 0x0

    move v8, v4

    :goto_4
    new-instance v10, Lorg/rabochaya/projects/ObjectListing$Item;

    iget-object v4, p1, Lorg/rabochaya/projects/ObjectTree$Row;->element:Lorg/w3c/dom/Element;

    invoke-static {v4}, Lorg/rabochaya/projects/ObjectListing;->classify(Lorg/w3c/dom/Element;)I

    move-result v7

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v9

    move-object v4, v10

    move-object v5, p1

    invoke-direct/range {v4 .. v9}, Lorg/rabochaya/projects/ObjectListing$Item;-><init>(Lorg/rabochaya/projects/ObjectTree$Row;Ljava/lang/String;IZI)V

    invoke-interface {v0, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p1, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-interface {v1, p1, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 27
    :cond_5
    new-instance p0, Lorg/rabochaya/projects/ObjectListing;

    invoke-direct {p0, v0, v1}, Lorg/rabochaya/projects/ObjectListing;-><init>(Ljava/util/List;Ljava/util/Map;)V

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

    .line 79
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

.method private static classify(Lorg/w3c/dom/Element;)I
    .locals 4

    .line 75
    const-string v0, "Folder"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/ObjectListing;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_4

    const-string v0, "Document"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/ObjectListing;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    const-string v0, "Placemark"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/ObjectListing;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x7

    if-nez v0, :cond_1

    return v2

    :cond_1
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    const/4 v3, 0x0

    invoke-static {p0, v0, v3}, Lorg/rabochaya/projects/ObjectListing;->shapes(Lorg/w3c/dom/Element;Ljava/util/Set;I)V

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result p0

    if-ne p0, v1, :cond_2

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    goto :goto_0

    :cond_2
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v2, 0x6

    :goto_0
    return v2

    :cond_4
    :goto_1
    return v1
.end method

.method public static descriptionText(Ljava/lang/String;)Ljava/lang/String;
    .locals 14

    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v4, v1

    move v3, v2

    move v5, v3

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v3, v6, :cond_11

    .line 45
    const-string v6, "<!--"

    invoke-virtual {p0, v6, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_1

    add-int/lit8 v3, v3, 0x4

    const-string v6, "-->"

    invoke-virtual {p0, v6, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    if-gez v3, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    goto :goto_0

    :cond_0
    add-int/lit8 v3, v3, 0x3

    goto :goto_0

    .line 46
    :cond_1
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 47
    const/16 v7, 0x3c

    const/16 v8, 0x20

    if-ne v6, v7, :cond_d

    add-int/lit8 v7, v3, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v7, v9, :cond_d

    .line 48
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x2f

    if-ne v9, v10, :cond_2

    const/4 v9, 0x1

    goto :goto_1

    :cond_2
    move v9, v2

    :goto_1
    if-eqz v9, :cond_3

    add-int/lit8 v7, v7, 0x1

    .line 49
    :cond_3
    move v11, v7

    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v12

    if-ge v11, v12, :cond_4

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v12

    invoke-static {v12}, Lorg/rabochaya/projects/ObjectListing;->asciiLetter(C)Z

    move-result v12

    if-eqz v12, :cond_4

    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 50
    :cond_4
    if-le v11, v7, :cond_d

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v12

    if-eq v11, v12, :cond_5

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v12

    invoke-static {v12}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v12

    if-nez v12, :cond_5

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v12

    const/16 v13, 0x3e

    if-eq v12, v13, :cond_5

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-ne v12, v10, :cond_d

    .line 51
    :cond_5
    invoke-virtual {p0, v7, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    sget-object v7, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, v11}, Lorg/rabochaya/projects/ObjectListing;->tagEnd(Ljava/lang/String;I)I

    move-result v7

    .line 52
    if-gez v7, :cond_6

    if-nez v4, :cond_11

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_5

    .line 53
    :cond_6
    const-string v3, "template"

    if-eqz v4, :cond_9

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_c

    if-nez v9, :cond_7

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    :cond_7
    if-eqz v9, :cond_c

    if-lez v5, :cond_8

    add-int/lit8 v5, v5, -0x1

    goto :goto_3

    :cond_8
    move-object v4, v1

    goto :goto_3

    .line 54
    :cond_9
    if-nez v9, :cond_b

    const-string v9, "script"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_a

    const-string v9, "style"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_a

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    :cond_a
    move-object v4, v6

    goto :goto_3

    .line 55
    :cond_b
    invoke-static {v6}, Lorg/rabochaya/projects/ObjectListing;->blockTag(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    :cond_c
    :goto_3
    add-int/lit8 v3, v7, 0x1

    goto/16 :goto_0

    .line 59
    :cond_d
    if-eqz v4, :cond_e

    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 60
    :cond_e
    const/16 v7, 0x26

    if-ne v6, v7, :cond_10

    add-int/lit8 v7, v3, 0x1

    move v9, v7

    :goto_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v10

    const/16 v11, 0x3b

    if-ge v9, v10, :cond_f

    sub-int v10, v9, v3

    if-gt v10, v8, :cond_f

    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-eq v10, v11, :cond_f

    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    :cond_f
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v10

    if-ge v9, v10, :cond_10

    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-ne v10, v11, :cond_10

    sub-int v10, v9, v3

    if-gt v10, v8, :cond_10

    invoke-virtual {p0, v7, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/rabochaya/projects/ObjectListing;->entity(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_10

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v9, 0x1

    goto/16 :goto_0

    .line 61
    :cond_10
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    .line 62
    goto/16 :goto_0

    .line 63
    :cond_11
    :goto_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static entity(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 69
    const-string v0, "#"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x2

    const/16 v2, 0xa

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v0, :cond_c

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v5, :cond_1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v6, 0x78

    if-eq v0, v6, :cond_0

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v6, 0x58

    if-ne v0, v6, :cond_1

    :cond_0
    move v0, v5

    goto :goto_0

    :cond_1
    move v0, v3

    :goto_0
    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    move v1, v5

    :goto_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    return-object v4

    :cond_3
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v3, v1, :cond_8

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v5, 0x30

    if-lt v1, v5, :cond_4

    const/16 v5, 0x39

    if-le v1, v5, :cond_6

    :cond_4
    if-eqz v0, :cond_7

    const/16 v5, 0x61

    if-lt v1, v5, :cond_5

    const/16 v5, 0x66

    if-le v1, v5, :cond_6

    :cond_5
    const/16 v5, 0x41

    if-lt v1, v5, :cond_7

    const/16 v5, 0x46

    if-le v1, v5, :cond_6

    goto :goto_3

    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_7
    :goto_3
    return-object v4

    :cond_8
    if-eqz v0, :cond_9

    const/16 v2, 0x10

    :cond_9
    invoke-static {p0, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p0

    if-lez p0, :cond_b

    const v0, 0x10ffff

    if-gt p0, v0, :cond_b

    const v0, 0xd800

    if-lt p0, v0, :cond_a

    const v0, 0xdfff

    if-gt p0, v0, :cond_a

    goto :goto_4

    :cond_a
    new-instance v0, Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/Character;->toChars(I)[C

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([C)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :cond_b
    :goto_4
    return-object v4

    :catch_0
    move-exception p0

    return-object v4

    .line 70
    :cond_c
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :cond_d
    goto/16 :goto_5

    :sswitch_0
    const-string v0, "raquo"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    const/16 v1, 0x9

    goto/16 :goto_6

    :sswitch_1
    const-string v0, "ndash"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    const/4 v1, 0x6

    goto/16 :goto_6

    :sswitch_2
    const-string v0, "mdash"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    const/4 v1, 0x7

    goto/16 :goto_6

    :sswitch_3
    const-string v0, "laquo"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    const/16 v1, 0x8

    goto/16 :goto_6

    :sswitch_4
    const-string v0, "quot"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    const/4 v1, 0x3

    goto :goto_6

    :sswitch_5
    const-string v0, "nbsp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    const/4 v1, 0x5

    goto :goto_6

    :sswitch_6
    const-string v0, "copy"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    const/16 v1, 0xb

    goto :goto_6

    :sswitch_7
    const-string v0, "apos"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    const/4 v1, 0x4

    goto :goto_6

    :sswitch_8
    const-string v0, "reg"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    const/16 v1, 0xc

    goto :goto_6

    :sswitch_9
    const-string v0, "amp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    move v1, v3

    goto :goto_6

    :sswitch_a
    const-string v0, "lt"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    move v1, v5

    goto :goto_6

    :sswitch_b
    const-string v0, "gt"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    goto :goto_6

    :sswitch_c
    const-string v0, "hellip"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    move v1, v2

    goto :goto_6

    :goto_5
    const/4 v1, -0x1

    :goto_6
    packed-switch v1, :pswitch_data_0

    return-object v4

    :pswitch_0
    const-string p0, "\u00ae"

    return-object p0

    :pswitch_1
    const-string p0, "\u00a9"

    return-object p0

    :pswitch_2
    const-string p0, "\u2026"

    return-object p0

    :pswitch_3
    const-string p0, "\u00bb"

    return-object p0

    :pswitch_4
    const-string p0, "\u00ab"

    return-object p0

    :pswitch_5
    const-string p0, "\u2014"

    return-object p0

    :pswitch_6
    const-string p0, "\u2013"

    return-object p0

    :pswitch_7
    const-string p0, " "

    return-object p0

    :pswitch_8
    const-string p0, "\'"

    return-object p0

    :pswitch_9
    const-string p0, "\""

    return-object p0

    :pswitch_a
    const-string p0, ">"

    return-object p0

    :pswitch_b
    const-string p0, "<"

    return-object p0

    :pswitch_c
    const-string p0, "&"

    return-object p0

    :sswitch_data_0
    .sparse-switch
        -0x48c5fedc -> :sswitch_c
        0xced -> :sswitch_b
        0xd88 -> :sswitch_a
        0x179c4 -> :sswitch_9
        0x1b894 -> :sswitch_8
        0x2dca53 -> :sswitch_7
        0x2eaf75 -> :sswitch_6
        0x337f11 -> :sswitch_5
        0x352309 -> :sswitch_4
        0x61fb936 -> :sswitch_3
        0x62ef17f -> :sswitch_2
        0x63d0900 -> :sswitch_1
        0x674463c -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
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
.end method

.method private static is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z
    .locals 1

    .line 77
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectListing;->local(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "http://www.opengis.net/kml/2.2"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "http://earth\\.google\\.com/kml/2\\.[012]"

    invoke-virtual {v0, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static local(Lorg/w3c/dom/Element;)Ljava/lang/String;
    .locals 1

    .line 78
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

.method private static matches(Lorg/rabochaya/projects/ObjectListing$Item;Ljava/lang/String;I)Z
    .locals 2

    .line 37
    const/4 v0, 0x1

    if-eq p2, v0, :cond_0

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectListing$Item;->access$300(Lorg/rabochaya/projects/ObjectListing$Item;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    :cond_0
    if-eqz p2, :cond_1

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectListing$Item;->access$400(Lorg/rabochaya/projects/ObjectListing$Item;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :cond_2
    :goto_0
    return v0
.end method

.method public static normalize(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 72
    sget-object v0, Ljava/text/Normalizer$Form;->NFC:Ljava/text/Normalizer$Form;

    invoke-static {p0, v0}, Ljava/text/Normalizer;->normalize(Ljava/lang/CharSequence;Ljava/text/Normalizer$Form;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x451

    const/16 v1, 0x435

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static ownVisible(Lorg/w3c/dom/Element;)Z
    .locals 0

    .line 73
    invoke-static {p0}, Lorg/rabochaya/projects/ObjectVisibility;->own(Lorg/w3c/dom/Element;)Z

    move-result p0

    return p0
.end method

.method private static searchable(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_4

    invoke-virtual {p0, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v2, v5

    invoke-static {v4}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-static {v4}, Ljava/lang/Character;->isSpaceChar(I)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_1

    :cond_0
    if-eqz v3, :cond_1

    const/16 v3, 0x20

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_1
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    move v3, v1

    goto :goto_0

    :cond_2
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_3

    const/4 v3, 0x1

    goto :goto_0

    :cond_3
    move v3, v1

    goto :goto_0

    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectListing;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static shapes(Lorg/w3c/dom/Element;Ljava/util/Set;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;I)V"
        }
    .end annotation

    .line 76
    const/16 v0, 0x20

    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    if-le p2, v0, :cond_0

    invoke-interface {p1, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void

    :cond_0
    invoke-static {p0}, Lorg/rabochaya/projects/ObjectListing;->children(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    const-string v2, "Point"

    invoke-static {v0, v2}, Lorg/rabochaya/projects/ObjectListing;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v0, 0x2

    :goto_1
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    const-string v2, "LineString"

    invoke-static {v0, v2}, Lorg/rabochaya/projects/ObjectListing;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_8

    const-string v2, "LinearRing"

    invoke-static {v0, v2}, Lorg/rabochaya/projects/ObjectListing;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_2

    :cond_3
    const-string v2, "Polygon"

    invoke-static {v0, v2}, Lorg/rabochaya/projects/ObjectListing;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    const/4 v0, 0x4

    goto :goto_1

    :cond_4
    const-string v2, "MultiGeometry"

    invoke-static {v0, v2}, Lorg/rabochaya/projects/ObjectListing;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    add-int/lit8 v2, p2, 0x1

    invoke-static {v0, p1, v2}, Lorg/rabochaya/projects/ObjectListing;->shapes(Lorg/w3c/dom/Element;Ljava/util/Set;I)V

    goto :goto_0

    :cond_5
    const-string v2, "Model"

    invoke-static {v0, v2}, Lorg/rabochaya/projects/ObjectListing;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {p1, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_6
    const-string v2, "http://www.google.com/kml/ext/2.2"

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectListing;->local(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Track"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectListing;->local(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "MultiTrack"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_7
    const/4 v0, 0x5

    goto :goto_1

    :cond_8
    :goto_2
    const/4 v0, 0x3

    goto :goto_1

    :cond_9
    return-void
.end method

.method private static tagEnd(Ljava/lang/String;I)I
    .locals 4

    .line 66
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge p1, v2, :cond_4

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eqz v1, :cond_0

    if-ne v2, v1, :cond_3

    move v1, v0

    goto :goto_2

    :cond_0
    const/16 v3, 0x27

    if-eq v2, v3, :cond_2

    const/16 v3, 0x22

    if-ne v2, v3, :cond_1

    goto :goto_1

    :cond_1
    const/16 v3, 0x3e

    if-ne v2, v3, :cond_3

    return p1

    :cond_2
    :goto_1
    move v1, v2

    :cond_3
    :goto_2
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_4
    const/4 p0, -0x1

    return p0
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lorg/rabochaya/projects/ObjectListing$Item;
    .locals 1

    .line 30
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectListing;->byKey:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/rabochaya/projects/ObjectListing$Item;

    return-object p1
.end method

.method public select(Ljava/lang/String;Lorg/rabochaya/projects/ObjectListing$Options;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/rabochaya/projects/ObjectListing$Options;",
            ")",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/ObjectListing$Item;",
            ">;"
        }
    .end annotation

    .line 32
    if-eqz p1, :cond_a

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/ObjectListing;->get(Ljava/lang/String;)Lorg/rabochaya/projects/ObjectListing$Item;

    move-result-object v0

    if-eqz v0, :cond_a

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/ObjectListing;->get(Ljava/lang/String;)Lorg/rabochaya/projects/ObjectListing$Item;

    move-result-object v0

    iget-object v0, v0, Lorg/rabochaya/projects/ObjectListing$Item;->row:Lorg/rabochaya/projects/ObjectTree$Row;

    iget-boolean v0, v0, Lorg/rabochaya/projects/ObjectTree$Row;->folder:Z

    if-eqz v0, :cond_a

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p2, Lorg/rabochaya/projects/ObjectListing$Options;->query:Ljava/lang/String;

    invoke-static {v1}, Lorg/rabochaya/projects/ObjectListing;->searchable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 33
    iget-object v2, p0, Lorg/rabochaya/projects/ObjectListing;->items:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_9

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/rabochaya/projects/ObjectListing$Item;

    iget-boolean v5, p2, Lorg/rabochaya/projects/ObjectListing$Options;->recursive:Z

    const/4 v6, 0x1

    if-eqz v5, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2

    iget-object v5, v3, Lorg/rabochaya/projects/ObjectListing$Item;->row:Lorg/rabochaya/projects/ObjectTree$Row;

    iget-object v5, v5, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    :cond_2
    move v4, v6

    goto :goto_1

    :cond_3
    iget-object v4, v3, Lorg/rabochaya/projects/ObjectListing$Item;->row:Lorg/rabochaya/projects/ObjectTree$Row;

    iget-object v4, v4, Lorg/rabochaya/projects/ObjectTree$Row;->parent:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    :cond_4
    :goto_1
    if-eqz v4, :cond_1

    iget-object v4, p2, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget-object v5, v3, Lorg/rabochaya/projects/ObjectListing$Item;->time:Lorg/rabochaya/projects/KmlTimeFilter$Entry;

    invoke-virtual {v4, v5}, Lorg/rabochaya/projects/KmlTimeFilter$Query;->matches(Lorg/rabochaya/projects/KmlTimeFilter$Entry;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_5

    iget v4, p2, Lorg/rabochaya/projects/ObjectListing$Options;->searchField:I

    invoke-static {v3, v1, v4}, Lorg/rabochaya/projects/ObjectListing;->matches(Lorg/rabochaya/projects/ObjectListing$Item;Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_1

    :cond_5
    iget v4, p2, Lorg/rabochaya/projects/ObjectListing$Options;->kind:I

    if-eqz v4, :cond_6

    iget v4, v3, Lorg/rabochaya/projects/ObjectListing$Item;->kind:I

    iget v5, p2, Lorg/rabochaya/projects/ObjectListing$Options;->kind:I

    if-ne v4, v5, :cond_1

    :cond_6
    iget v4, p2, Lorg/rabochaya/projects/ObjectListing$Options;->visibility:I

    if-ne v4, v6, :cond_7

    iget-boolean v4, v3, Lorg/rabochaya/projects/ObjectListing$Item;->visible:Z

    if-eqz v4, :cond_1

    :cond_7
    iget v4, p2, Lorg/rabochaya/projects/ObjectListing$Options;->visibility:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_8

    iget-boolean v4, v3, Lorg/rabochaya/projects/ObjectListing$Item;->visible:Z

    if-eqz v4, :cond_8

    goto :goto_0

    :cond_8
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 34
    :cond_9
    new-instance p1, Ljava/util/Locale;

    const-string v1, "ru"

    const-string v2, "RU"

    invoke-direct {p1, v1, v2}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p1}, Ljava/text/Collator;->getInstance(Ljava/util/Locale;)Ljava/text/Collator;

    move-result-object p1

    invoke-virtual {p1, v4}, Ljava/text/Collator;->setStrength(I)V

    .line 35
    new-instance v1, Lorg/rabochaya/projects/ObjectListing$1;

    invoke-direct {v1, p0, p2, p1}, Lorg/rabochaya/projects/ObjectListing$1;-><init>(Lorg/rabochaya/projects/ObjectListing;Lorg/rabochaya/projects/ObjectListing$Options;Ljava/text/Collator;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 32
    :cond_a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041f\u0430\u043f\u043a\u0430 \u043d\u0435 \u043d\u0430\u0439\u0434\u0435\u043d\u0430"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
