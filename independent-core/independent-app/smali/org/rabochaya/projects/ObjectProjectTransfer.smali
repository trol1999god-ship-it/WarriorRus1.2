.class final Lorg/rabochaya/projects/ObjectProjectTransfer;
.super Ljava/lang/Object;
.source "ObjectProjectTransfer.java"


# static fields
.field private static final HTML_LINK:Ljava/util/regex/Pattern;

.field private static final XML:Ljava/lang/String; = "http://www.w3.org/XML/1998/namespace"


# instance fields
.field private final destination:Lorg/rabochaya/projects/KmlProject;

.field private final destinationDirectory:Ljava/lang/String;

.field private final files:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation
.end field

.field private final included:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final originals:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/w3c/dom/Element;",
            ">;"
        }
    .end annotation
.end field

.field private final references:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final relocated:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final source:Lorg/rabochaya/projects/KmlProject;

.field private final sourceDirectory:Ljava/lang/String;

.field private final sourceIds:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 12
    const-string v0, "(?i)\\b(?:href|src)\\s*=\\s*(?:\"([^\"]*)\"|\'([^\']*)\'|([^\\s>]+))"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/ObjectProjectTransfer;->HTML_LINK:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>(Lorg/rabochaya/projects/KmlProject;Lorg/rabochaya/projects/KmlProject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->sourceIds:Ljava/util/Map;

    .line 19
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->originals:Ljava/util/Map;

    .line 20
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->included:Ljava/util/Set;

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->references:Ljava/util/Set;

    .line 21
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->files:Ljava/util/Map;

    .line 22
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->relocated:Ljava/util/Map;

    .line 25
    iput-object p1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->source:Lorg/rabochaya/projects/KmlProject;

    .line 26
    iput-object p2, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->destination:Lorg/rabochaya/projects/KmlProject;

    .line 27
    iget-object p1, p1, Lorg/rabochaya/projects/KmlProject;->entry:Ljava/lang/String;

    invoke-static {p1}, Lorg/rabochaya/projects/ObjectProjectTransfer;->directory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->sourceDirectory:Ljava/lang/String;

    .line 28
    iget-object p1, p2, Lorg/rabochaya/projects/KmlProject;->entry:Ljava/lang/String;

    invoke-static {p1}, Lorg/rabochaya/projects/ObjectProjectTransfer;->directory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->destinationDirectory:Ljava/lang/String;

    .line 29
    return-void
.end method

.method private append(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 37
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->source:Lorg/rabochaya/projects/KmlProject;

    invoke-virtual {v0}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->destination:Lorg/rabochaya/projects/KmlProject;

    invoke-virtual {v1}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object v1

    .line 38
    invoke-static {v1, p3}, Lorg/rabochaya/projects/ObjectTree;->resolve(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p3

    .line 39
    invoke-static {p3}, Lorg/rabochaya/projects/ObjectTree;->container(Lorg/w3c/dom/Element;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 40
    invoke-static {p3}, Lorg/rabochaya/projects/ObjectProjectTransfer;->verifyBase(Lorg/w3c/dom/Element;)V

    .line 41
    invoke-interface {v0}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v2

    .line 42
    iget-object v3, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->sourceIds:Ljava/util/Map;

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Lorg/rabochaya/projects/ObjectTree;->countIds(Lorg/w3c/dom/Element;Ljava/util/Map;I)V

    .line 43
    const-string v3, "*"

    invoke-interface {v2, v3}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 44
    invoke-direct {p0, v2}, Lorg/rabochaya/projects/ObjectProjectTransfer;->index(Lorg/w3c/dom/Element;)V

    .line 45
    move v2, v4

    :goto_0
    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    if-ge v2, v5, :cond_0

    invoke-interface {v3, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    check-cast v5, Lorg/w3c/dom/Element;

    invoke-direct {p0, v5}, Lorg/rabochaya/projects/ObjectProjectTransfer;->index(Lorg/w3c/dom/Element;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 47
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 48
    invoke-static {v0, p1, p2}, Lorg/rabochaya/projects/ObjectTree;->selection(Lorg/w3c/dom/Element;Ljava/util/Collection;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 49
    invoke-static {v0, p2}, Lorg/rabochaya/projects/ObjectTree;->resolve(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p2

    .line 50
    invoke-static {p2}, Lorg/rabochaya/projects/ObjectProjectTransfer;->verifyBase(Lorg/w3c/dom/Element;)V

    .line 51
    invoke-interface {v2, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    invoke-direct {p0, p2, v4, v4}, Lorg/rabochaya/projects/ObjectProjectTransfer;->scan(Lorg/w3c/dom/Element;IZ)V

    .line 53
    goto :goto_1

    .line 54
    :cond_1
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 55
    :goto_2
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result p2

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->references:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    const/4 v5, 0x1

    if-ge p2, v0, :cond_7

    .line 56
    new-instance p2, Ljava/util/ArrayList;

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->references:Ljava/util/Set;

    invoke-direct {p2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_2
    :goto_3
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 57
    invoke-interface {p1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    iget-object v6, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->included:Ljava/util/Set;

    invoke-interface {v6, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    goto :goto_3

    .line 58
    :cond_3
    iget-object v6, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->originals:Ljava/util/Map;

    invoke-interface {v6, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/w3c/dom/Element;

    .line 59
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iget-object v8, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->sourceIds:Ljava/util/Map;

    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    if-eqz v6, :cond_5

    .line 60
    const-string v7, "Style"

    invoke-static {v6, v7}, Lorg/rabochaya/projects/ObjectTree;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_4

    const-string v7, "StyleMap"

    invoke-static {v6, v7}, Lorg/rabochaya/projects/ObjectTree;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 61
    const-string v7, "Schema"

    invoke-static {v6, v7}, Lorg/rabochaya/projects/ObjectTree;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 64
    :cond_4
    invoke-static {v6}, Lorg/rabochaya/projects/ObjectProjectTransfer;->verifyBase(Lorg/w3c/dom/Element;)V

    .line 65
    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    invoke-direct {p0, v6, v4, v4}, Lorg/rabochaya/projects/ObjectProjectTransfer;->scan(Lorg/w3c/dom/Element;IZ)V

    .line 67
    goto :goto_3

    .line 62
    :cond_5
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "\u0412 \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0445 \u043e\u0431\u044a\u0435\u043a\u0442\u0430\u0445 \u0435\u0441\u0442\u044c \u043d\u0435\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u043c\u0430\u044f \u0441\u0441\u044b\u043b\u043a\u0430 #"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 67
    :cond_6
    goto/16 :goto_2

    .line 70
    :cond_7
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 71
    invoke-interface {v1}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object p2

    invoke-interface {p2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object p2

    invoke-static {p2, p1, v4}, Lorg/rabochaya/projects/ObjectTree;->countIds(Lorg/w3c/dom/Element;Ljava/util/Map;I)V

    .line 72
    new-instance p2, Ljava/util/HashSet;

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 73
    iget-object p1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->sourceIds:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 74
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 75
    invoke-direct {p0, p3, v2, p2, p1}, Lorg/rabochaya/projects/ObjectProjectTransfer;->cloneInto(Lorg/w3c/dom/Element;Ljava/util/List;Ljava/util/Set;Ljava/util/Map;)Ljava/util/List;

    move-result-object v0

    .line 76
    invoke-direct {p0, p3, v3, p2, p1}, Lorg/rabochaya/projects/ObjectProjectTransfer;->cloneInto(Lorg/w3c/dom/Element;Ljava/util/List;Ljava/util/Set;Ljava/util/Map;)Ljava/util/List;

    move-result-object p2

    .line 77
    move-object v2, p3

    .line 78
    :goto_4
    const-string v3, "Document"

    invoke-static {v2, v3}, Lorg/rabochaya/projects/ObjectTree;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_8

    if-eq v2, v1, :cond_8

    .line 79
    invoke-interface {v2}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v2

    check-cast v2, Lorg/w3c/dom/Element;

    goto :goto_4

    .line 81
    :cond_8
    invoke-static {v2}, Lorg/rabochaya/projects/ObjectProjectTransfer;->firstFeature(Lorg/w3c/dom/Element;)Lorg/w3c/dom/Node;

    move-result-object v3

    .line 82
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_5
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_a

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/w3c/dom/Element;

    .line 83
    invoke-static {v6, p1, v4}, Lorg/rabochaya/projects/ObjectTree;->rewrite(Lorg/w3c/dom/Element;Ljava/util/Map;I)V

    .line 84
    iget-object v7, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->relocated:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_9

    invoke-direct {p0, v6, v4, v5}, Lorg/rabochaya/projects/ObjectProjectTransfer;->scan(Lorg/w3c/dom/Element;IZ)V

    .line 86
    :cond_9
    invoke-interface {v2, v6, v3}, Lorg/w3c/dom/Element;->insertBefore(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 87
    goto :goto_5

    .line 88
    :cond_a
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_6
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    .line 89
    invoke-static {v0, p1, v4}, Lorg/rabochaya/projects/ObjectTree;->rewrite(Lorg/w3c/dom/Element;Ljava/util/Map;I)V

    .line 90
    iget-object v2, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->relocated:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_b

    invoke-direct {p0, v0, v4, v5}, Lorg/rabochaya/projects/ObjectProjectTransfer;->scan(Lorg/w3c/dom/Element;IZ)V

    .line 91
    :cond_b
    invoke-interface {p3, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 92
    goto :goto_6

    .line 93
    :cond_c
    invoke-static {v1}, Lorg/rabochaya/projects/ObjectTree;->rows(Lorg/w3c/dom/Element;)Ljava/util/List;

    .line 94
    iget-object p1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->destination:Lorg/rabochaya/projects/KmlProject;

    iget-object p1, p1, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->files:Ljava/util/Map;

    invoke-virtual {p1, p2}, Ljava/util/LinkedHashMap;->putAll(Ljava/util/Map;)V

    .line 95
    return-void

    .line 39
    :cond_d
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u043f\u0430\u043f\u043a\u0443 \u043d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static append(Lorg/rabochaya/projects/KmlProject;Lorg/rabochaya/projects/KmlProject;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/rabochaya/projects/KmlProject;",
            "Lorg/rabochaya/projects/KmlProject;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 33
    new-instance v0, Lorg/rabochaya/projects/ObjectProjectTransfer;

    invoke-direct {v0, p0, p1}, Lorg/rabochaya/projects/ObjectProjectTransfer;-><init>(Lorg/rabochaya/projects/KmlProject;Lorg/rabochaya/projects/KmlProject;)V

    invoke-direct {v0, p2, p3, p4}, Lorg/rabochaya/projects/ObjectProjectTransfer;->append(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    return-void
.end method

.method private attributeReference(Lorg/w3c/dom/Element;Ljava/lang/String;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 170
    invoke-interface {p1, p2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p3}, Lorg/rabochaya/projects/ObjectProjectTransfer;->reference(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p3

    .line 171
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1, p2, p3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    :cond_0
    return-void
.end method

.method private cloneInto(Lorg/w3c/dom/Element;Ljava/util/List;Ljava/util/Set;Ljava/util/Map;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "Ljava/util/List<",
            "Lorg/w3c/dom/Element;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Lorg/w3c/dom/Element;",
            ">;"
        }
    .end annotation

    .line 99
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 100
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 101
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v2, v1, v3}, Lorg/w3c/dom/Document;->importNode(Lorg/w3c/dom/Node;Z)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 102
    iget-object v2, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->sourceIds:Ljava/util/Map;

    const/4 v3, 0x0

    invoke-static {v1, v2, p3, p4, v3}, Lorg/rabochaya/projects/ObjectTree;->newIds(Lorg/w3c/dom/Element;Ljava/util/Map;Ljava/util/Set;Ljava/util/Map;I)V

    .line 103
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    goto :goto_0

    .line 105
    :cond_0
    return-object v0
.end method

.method private static directory(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 228
    invoke-static {p0}, Lorg/rabochaya/projects/KmlProject;->safePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 229
    const/16 v0, 0x2f

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static firstFeature(Lorg/w3c/dom/Element;)Lorg/w3c/dom/Node;
    .locals 1

    .line 109
    invoke-static {p0}, Lorg/rabochaya/projects/ObjectTree;->rows(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object p0

    .line 110
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/rabochaya/projects/ObjectTree$Row;

    iget-object p0, p0, Lorg/rabochaya/projects/ObjectTree$Row;->element:Lorg/w3c/dom/Element;

    :goto_0
    return-object p0
.end method

.method private index(Lorg/w3c/dom/Element;)V
    .locals 2

    .line 114
    const-string v0, "id"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 115
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->originals:Ljava/util/Map;

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    :cond_0
    return-void
.end method

.method private occupied(Ljava/lang/String;[B)Z
    .locals 2

    .line 223
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->files:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->files:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->destination:Lorg/rabochaya/projects/KmlProject;

    iget-object v0, v0, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    check-cast v0, [B

    .line 224
    iget-object v1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->destination:Lorg/rabochaya/projects/KmlProject;

    iget-object v1, v1, Lorg/rabochaya/projects/KmlProject;->entry:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    if-eqz v0, :cond_1

    invoke-static {v0, p2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    const/4 p1, 0x1

    :goto_2
    return p1
.end method

.method private reference(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 175
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 176
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    return-object p1

    .line 177
    :cond_0
    const-string v1, "#"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 178
    if-nez p2, :cond_1

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->references:Ljava/util/Set;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 179
    :cond_1
    return-object p1

    .line 181
    :cond_2
    const-string v1, "//"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_f

    const-string v1, "(?is)[a-z][a-z0-9+.-]*:.*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto/16 :goto_5

    .line 185
    :cond_3
    const-string v1, "[?#]"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    .line 188
    :try_start_0
    const-string v2, "+"

    const-string v3, "%2B"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/rabochaya/projects/KmlProject;->safePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    nop

    .line 192
    if-eqz p2, :cond_5

    .line 193
    iget-object p2, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->relocated:Ljava/util/Map;

    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 194
    if-nez p2, :cond_4

    goto :goto_0

    :cond_4
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result p2

    invoke-virtual {v0, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_0
    return-object p1

    .line 196
    :cond_5
    iget-object p2, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->relocated:Ljava/util/Map;

    invoke-interface {p2, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6

    return-object p1

    .line 197
    :cond_6
    iget-object p2, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->source:Lorg/rabochaya/projects/KmlProject;

    iget-object p2, p2, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->sourceDirectory:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [B

    .line 198
    if-eqz p2, :cond_e

    .line 199
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v2, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 200
    const-string v1, ".kml"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_d

    const-string v1, ".kmz"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_d

    const-string v1, ".dae"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 203
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->destinationDirectory:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/rabochaya/projects/KmlProject;->safePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 204
    invoke-direct {p0, v0, p2}, Lorg/rabochaya/projects/ObjectProjectTransfer;->occupied(Ljava/lang/String;[B)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 205
    const/16 v0, 0x2f

    invoke-virtual {v2, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    const/16 v1, 0x2e

    invoke-virtual {v2, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 206
    const-string v3, "attachments/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    goto :goto_1

    :cond_7
    const-string v3, "rk-transfer/"

    .line 207
    :goto_1
    const-string v4, ""

    if-le v1, v0, :cond_8

    invoke-virtual {v2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_8
    move-object v0, v4

    .line 208
    :goto_2
    const-string v1, "\\.[a-zA-Z0-9]{1,16}"

    invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_9

    goto :goto_3

    :cond_9
    move-object v4, v0

    .line 210
    :goto_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "rk-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Ljava/util/UUID;->nameUUIDFromBytes([B)Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 211
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->destinationDirectory:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/rabochaya/projects/KmlProject;->safePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object v7, v5

    move-object v5, v0

    move-object v0, v7

    .line 212
    :goto_4
    invoke-direct {p0, v0, p2}, Lorg/rabochaya/projects/ObjectProjectTransfer;->occupied(Ljava/lang/String;[B)Z

    move-result v6

    if-eqz v6, :cond_a

    .line 213
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 214
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->destinationDirectory:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/rabochaya/projects/KmlProject;->safePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    .line 216
    :cond_a
    iget-object v1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->relocated:Ljava/util/Map;

    invoke-interface {v1, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    :cond_b
    iget-object v1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->destination:Lorg/rabochaya/projects/KmlProject;

    iget-object v1, v1, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v0}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->files:Ljava/util/Map;

    invoke-interface {v1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    :cond_c
    return-object p1

    .line 201
    :cond_d
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u0424\u0430\u0439\u043b \u00ab"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "\u00bb \u0441\u043e\u0434\u0435\u0440\u0436\u0438\u0442 \u0441\u043e\u0431\u0441\u0442\u0432\u0435\u043d\u043d\u044b\u0435 \u0441\u0441\u044b\u043b\u043a\u0438. \u041f\u0435\u0440\u0435\u043d\u0435\u0441\u0438\u0442\u0435 \u0435\u0433\u043e \u0447\u0435\u0440\u0435\u0437 KMZ"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 198
    :cond_e
    new-instance p1, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u0412 \u0438\u0441\u0445\u043e\u0434\u043d\u043e\u043c \u043f\u0440\u043e\u0435\u043a\u0442\u0435 \u043e\u0442\u0441\u0443\u0442\u0441\u0442\u0432\u0443\u0435\u0442 \u0444\u0430\u0439\u043b \u00ab"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "\u00bb"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 189
    :catch_0
    move-exception p1

    .line 190
    new-instance p2, Ljava/io/IOException;

    const-string v0, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u0430\u044f \u0441\u0441\u044b\u043b\u043a\u0430 \u043d\u0430 \u0444\u0430\u0439\u043b \u0432 \u043f\u0440\u043e\u0435\u043a\u0442\u0435"

    invoke-direct {p2, v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    .line 183
    :cond_f
    :goto_5
    return-object p1
.end method

.method private scan(Lorg/w3c/dom/Element;IZ)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 127
    const/16 v0, 0x80

    if-gt p2, v0, :cond_d

    const-string v0, "http://www.w3.org/XML/1998/namespace"

    const-string v1, "base"

    invoke-interface {p1, v0, v1}, Lorg/w3c/dom/Element;->hasAttributeNS(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 130
    const-string v0, "id"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 131
    if-nez p3, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->included:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 132
    :cond_0
    const-string v0, "styleUrl"

    invoke-static {p1, v0}, Lorg/rabochaya/projects/ObjectTree;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    const-string v1, "href"

    if-nez v0, :cond_1

    invoke-static {p1, v1}, Lorg/rabochaya/projects/ObjectTree;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 133
    :cond_1
    invoke-direct {p0, p1, p3}, Lorg/rabochaya/projects/ObjectProjectTransfer;->textReference(Lorg/w3c/dom/Element;Z)V

    .line 135
    :cond_2
    const-string v0, "schemaUrl"

    invoke-direct {p0, p1, v0, p3}, Lorg/rabochaya/projects/ObjectProjectTransfer;->attributeReference(Lorg/w3c/dom/Element;Ljava/lang/String;Z)V

    .line 136
    if-nez p3, :cond_3

    const-string v0, "targetId"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->hasAttribute(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->references:Ljava/util/Set;

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 137
    :cond_3
    invoke-direct {p0, p1, v1, p3}, Lorg/rabochaya/projects/ObjectProjectTransfer;->attributeReference(Lorg/w3c/dom/Element;Ljava/lang/String;Z)V

    .line 138
    const-string v0, "value"

    invoke-static {p1, v0}, Lorg/rabochaya/projects/ObjectTree;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p1}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v0

    instance-of v0, v0, Lorg/w3c/dom/Element;

    if-eqz v0, :cond_4

    .line 139
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    const-string v1, "name"

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "rk-media-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 140
    invoke-direct {p0, p1, p3}, Lorg/rabochaya/projects/ObjectProjectTransfer;->textReference(Lorg/w3c/dom/Element;Z)V

    .line 142
    :cond_4
    const-string v0, "description"

    invoke-static {p1, v0}, Lorg/rabochaya/projects/ObjectTree;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_a

    .line 143
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v0

    .line 144
    sget-object v2, Lorg/rabochaya/projects/ObjectProjectTransfer;->HTML_LINK:Ljava/util/regex/Pattern;

    invoke-virtual {v2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 145
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    const/4 v4, 0x0

    .line 147
    :goto_0
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_9

    .line 148
    invoke-virtual {v2, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_5

    move v5, v1

    goto :goto_1

    :cond_5
    const/4 v5, 0x2

    invoke-virtual {v2, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_6

    goto :goto_1

    :cond_6
    const/4 v5, 0x3

    .line 149
    :goto_1
    invoke-virtual {v2, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, "&amp;"

    const-string v8, "&"

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    .line 150
    const-string v9, "#"

    invoke-virtual {v6, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_7

    goto :goto_0

    .line 151
    :cond_7
    invoke-direct {p0, v6, p3}, Lorg/rabochaya/projects/ObjectProjectTransfer;->reference(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v9

    .line 152
    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_8

    .line 153
    invoke-virtual {v2, v5}, Ljava/util/regex/Matcher;->start(I)I

    move-result v6

    invoke-virtual {v3, v0, v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v9, v8, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    invoke-virtual {v2, v5}, Ljava/util/regex/Matcher;->end(I)I

    move-result v4

    .line 156
    :cond_8
    goto :goto_0

    .line 157
    :cond_9
    if-eqz v4, :cond_a

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v3, v0, v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 159
    :cond_a
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p1

    :goto_2
    if-eqz p1, :cond_c

    .line 160
    instance-of v0, p1, Lorg/w3c/dom/Element;

    if-eqz v0, :cond_b

    move-object v0, p1

    check-cast v0, Lorg/w3c/dom/Element;

    add-int/lit8 v2, p2, 0x1

    invoke-direct {p0, v0, v2, p3}, Lorg/rabochaya/projects/ObjectProjectTransfer;->scan(Lorg/w3c/dom/Element;IZ)V

    .line 159
    :cond_b
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p1

    goto :goto_2

    .line 162
    :cond_c
    return-void

    .line 128
    :cond_d
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u0430\u044f \u0432\u043b\u043e\u0436\u0435\u043d\u043d\u043e\u0441\u0442\u044c \u0438\u043b\u0438 \u0431\u0430\u0437\u0430 \u0441\u0441\u044b\u043b\u043e\u043a \u0432 KML"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private textReference(Lorg/w3c/dom/Element;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 165
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/rabochaya/projects/ObjectProjectTransfer;->reference(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p2

    .line 166
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1, p2}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 167
    :cond_0
    return-void
.end method

.method private static verifyBase(Lorg/w3c/dom/Element;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 119
    nop

    :goto_0
    instance-of v0, p0, Lorg/w3c/dom/Element;

    if-eqz v0, :cond_1

    .line 120
    move-object v0, p0

    check-cast v0, Lorg/w3c/dom/Element;

    const-string v1, "http://www.w3.org/XML/1998/namespace"

    const-string v2, "base"

    invoke-interface {v0, v1, v2}, Lorg/w3c/dom/Element;->hasAttributeNS(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 119
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object p0

    goto :goto_0

    .line 121
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string v0, "\u041f\u0435\u0440\u0435\u043d\u043e\u0441 KML \u0441 \u0438\u0437\u043c\u0435\u043d\u0451\u043d\u043d\u043e\u0439 \u0431\u0430\u0437\u043e\u0439 \u0441\u0441\u044b\u043b\u043e\u043a \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u0442\u0441\u044f"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 124
    :cond_1
    return-void
.end method
