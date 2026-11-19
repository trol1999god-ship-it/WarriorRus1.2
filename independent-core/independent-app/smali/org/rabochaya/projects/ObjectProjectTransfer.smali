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

    .line 23
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

    .line 24
    iput-object p1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->source:Lorg/rabochaya/projects/KmlProject;

    .line 25
    iput-object p2, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->destination:Lorg/rabochaya/projects/KmlProject;

    .line 26
    iget-object p1, p1, Lorg/rabochaya/projects/KmlProject;->entry:Ljava/lang/String;

    invoke-static {p1}, Lorg/rabochaya/projects/ObjectProjectTransfer;->directory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->sourceDirectory:Ljava/lang/String;

    .line 27
    iget-object p1, p2, Lorg/rabochaya/projects/KmlProject;->entry:Ljava/lang/String;

    invoke-static {p1}, Lorg/rabochaya/projects/ObjectProjectTransfer;->directory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->destinationDirectory:Ljava/lang/String;

    .line 28
    return-void
.end method

.method private append(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
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

    .line 36
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->source:Lorg/rabochaya/projects/KmlProject;

    invoke-virtual {v0}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->destination:Lorg/rabochaya/projects/KmlProject;

    invoke-virtual {v1}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object v1

    .line 37
    invoke-static {v1, p3}, Lorg/rabochaya/projects/ObjectTree;->resolve(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p3

    .line 38
    invoke-static {p3}, Lorg/rabochaya/projects/ObjectTree;->container(Lorg/w3c/dom/Element;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 39
    invoke-static {p3}, Lorg/rabochaya/projects/ObjectProjectTransfer;->verifyBase(Lorg/w3c/dom/Element;)V

    .line 40
    invoke-interface {v0}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v2

    .line 41
    iget-object v3, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->sourceIds:Ljava/util/Map;

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Lorg/rabochaya/projects/ObjectTree;->countIds(Lorg/w3c/dom/Element;Ljava/util/Map;I)V

    .line 42
    const-string v3, "*"

    invoke-interface {v2, v3}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v3

    .line 43
    invoke-direct {p0, v2}, Lorg/rabochaya/projects/ObjectProjectTransfer;->index(Lorg/w3c/dom/Element;)V

    .line 44
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

    .line 46
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 47
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

    .line 48
    invoke-static {v0, p2}, Lorg/rabochaya/projects/ObjectTree;->resolve(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p2

    .line 49
    invoke-static {p2}, Lorg/rabochaya/projects/ObjectProjectTransfer;->verifyBase(Lorg/w3c/dom/Element;)V

    .line 50
    invoke-interface {v2, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    invoke-direct {p0, p2, v4}, Lorg/rabochaya/projects/ObjectProjectTransfer;->scan(Lorg/w3c/dom/Element;I)V

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 54
    :goto_2
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result p2

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->references:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    if-ge p2, v0, :cond_7

    .line 55
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

    .line 56
    invoke-interface {p1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->included:Ljava/util/Set;

    invoke-interface {v5, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    goto :goto_3

    .line 57
    :cond_3
    iget-object v5, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->originals:Ljava/util/Map;

    invoke-interface {v5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/w3c/dom/Element;

    .line 58
    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget-object v7, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->sourceIds:Ljava/util/Map;

    invoke-interface {v7, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    if-eqz v5, :cond_5

    .line 59
    const-string v6, "Style"

    invoke-static {v5, v6}, Lorg/rabochaya/projects/ObjectTree;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_4

    const-string v6, "StyleMap"

    invoke-static {v5, v6}, Lorg/rabochaya/projects/ObjectTree;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 60
    const-string v6, "Schema"

    invoke-static {v5, v6}, Lorg/rabochaya/projects/ObjectTree;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 63
    :cond_4
    invoke-static {v5}, Lorg/rabochaya/projects/ObjectProjectTransfer;->verifyBase(Lorg/w3c/dom/Element;)V

    .line 64
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    invoke-direct {p0, v5, v4}, Lorg/rabochaya/projects/ObjectProjectTransfer;->scan(Lorg/w3c/dom/Element;I)V

    .line 66
    goto :goto_3

    .line 61
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

    .line 66
    :cond_6
    goto/16 :goto_2

    .line 69
    :cond_7
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 70
    invoke-interface {v1}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object p2

    invoke-interface {p2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object p2

    invoke-static {p2, p1, v4}, Lorg/rabochaya/projects/ObjectTree;->countIds(Lorg/w3c/dom/Element;Ljava/util/Map;I)V

    .line 71
    new-instance p2, Ljava/util/HashSet;

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 72
    iget-object p1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->sourceIds:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 73
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 74
    invoke-direct {p0, p3, v2, p2, p1}, Lorg/rabochaya/projects/ObjectProjectTransfer;->cloneInto(Lorg/w3c/dom/Element;Ljava/util/List;Ljava/util/Set;Ljava/util/Map;)Ljava/util/List;

    move-result-object v0

    .line 75
    invoke-direct {p0, p3, v3, p2, p1}, Lorg/rabochaya/projects/ObjectProjectTransfer;->cloneInto(Lorg/w3c/dom/Element;Ljava/util/List;Ljava/util/Set;Ljava/util/Map;)Ljava/util/List;

    move-result-object p2

    .line 76
    move-object v2, p3

    .line 77
    :goto_4
    const-string v3, "Document"

    invoke-static {v2, v3}, Lorg/rabochaya/projects/ObjectTree;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_8

    if-eq v2, v1, :cond_8

    .line 78
    invoke-interface {v2}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v2

    check-cast v2, Lorg/w3c/dom/Element;

    goto :goto_4

    .line 80
    :cond_8
    invoke-static {v2}, Lorg/rabochaya/projects/ObjectProjectTransfer;->firstFeature(Lorg/w3c/dom/Element;)Lorg/w3c/dom/Node;

    move-result-object v3

    .line 81
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_5
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/w3c/dom/Element;

    .line 82
    invoke-static {v5, p1, v4}, Lorg/rabochaya/projects/ObjectTree;->rewrite(Lorg/w3c/dom/Element;Ljava/util/Map;I)V

    .line 84
    invoke-interface {v2, v5, v3}, Lorg/w3c/dom/Element;->insertBefore(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 85
    goto :goto_5

    .line 86
    :cond_9
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_6
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    .line 87
    invoke-static {v0, p1, v4}, Lorg/rabochaya/projects/ObjectTree;->rewrite(Lorg/w3c/dom/Element;Ljava/util/Map;I)V

    .line 88
    invoke-interface {p3, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 89
    goto :goto_6

    .line 90
    :cond_a
    invoke-static {v1}, Lorg/rabochaya/projects/ObjectTree;->rows(Lorg/w3c/dom/Element;)Ljava/util/List;

    .line 91
    iget-object p1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->destination:Lorg/rabochaya/projects/KmlProject;

    iget-object p1, p1, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->files:Ljava/util/Map;

    invoke-virtual {p1, p2}, Ljava/util/LinkedHashMap;->putAll(Ljava/util/Map;)V

    .line 92
    return-void

    .line 38
    :cond_b
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

    .line 32
    new-instance v0, Lorg/rabochaya/projects/ObjectProjectTransfer;

    invoke-direct {v0, p0, p1}, Lorg/rabochaya/projects/ObjectProjectTransfer;-><init>(Lorg/rabochaya/projects/KmlProject;Lorg/rabochaya/projects/KmlProject;)V

    invoke-direct {v0, p2, p3, p4}, Lorg/rabochaya/projects/ObjectProjectTransfer;->append(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 33
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

    .line 96
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 97
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 98
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v2

    const/4 v3, 0x1

    invoke-interface {v2, v1, v3}, Lorg/w3c/dom/Document;->importNode(Lorg/w3c/dom/Node;Z)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 99
    iget-object v2, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->sourceIds:Ljava/util/Map;

    const/4 v3, 0x0

    invoke-static {v1, v2, p3, p4, v3}, Lorg/rabochaya/projects/ObjectTree;->newIds(Lorg/w3c/dom/Element;Ljava/util/Map;Ljava/util/Set;Ljava/util/Map;I)V

    .line 100
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    goto :goto_0

    .line 102
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

    .line 184
    invoke-static {p0}, Lorg/rabochaya/projects/KmlProject;->safePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 185
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

    .line 106
    invoke-static {p0}, Lorg/rabochaya/projects/ObjectTree;->rows(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object p0

    .line 107
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

    .line 111
    const-string v0, "id"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 112
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->originals:Ljava/util/Map;

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    :cond_0
    return-void
.end method

.method private reference(Ljava/lang/String;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 153
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 154
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 155
    :cond_0
    const-string v0, "#"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 156
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->references:Ljava/util/Set;

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 157
    return-void

    .line 159
    :cond_1
    const-string v0, "//"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_8

    const-string v0, "(?is)[a-z][a-z0-9+.-]*:.*"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto/16 :goto_0

    .line 165
    :cond_2
    :try_start_0
    const-string v0, "[?#]"

    const/4 v1, 0x2

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    aget-object p1, p1, v0

    const-string v0, "+"

    const-string v1, "%2B"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "UTF-8"

    invoke-static {p1, v0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/rabochaya/projects/KmlProject;->safePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    nop

    .line 169
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->source:Lorg/rabochaya/projects/KmlProject;

    iget-object v0, v0, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->sourceDirectory:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 170
    const-string v1, "\u00bb"

    if-eqz v0, :cond_7

    .line 171
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    .line 172
    const-string v3, ".kml"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    const-string v3, ".kmz"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    const-string v3, ".dae"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 175
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->destinationDirectory:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/rabochaya/projects/KmlProject;->safePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 176
    iget-object v3, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->destination:Lorg/rabochaya/projects/KmlProject;

    iget-object v3, v3, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    .line 177
    iget-object v4, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->destination:Lorg/rabochaya/projects/KmlProject;

    iget-object v4, v4, Lorg/rabochaya/projects/KmlProject;->entry:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    if-eqz v3, :cond_3

    invoke-static {v3, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 180
    :cond_3
    if-nez v3, :cond_4

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->files:Ljava/util/Map;

    invoke-interface {p1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    :cond_4
    return-void

    .line 178
    :cond_5
    new-instance v0, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u0412 \u043f\u0440\u043e\u0435\u043a\u0442\u0435 \u043d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f \u0443\u0436\u0435 \u0435\u0441\u0442\u044c \u0434\u0440\u0443\u0433\u043e\u0439 \u0444\u0430\u0439\u043b \u00ab"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 173
    :cond_6
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u0424\u0430\u0439\u043b \u00ab"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, "\u00bb \u0441\u043e\u0434\u0435\u0440\u0436\u0438\u0442 \u0441\u043e\u0431\u0441\u0442\u0432\u0435\u043d\u043d\u044b\u0435 \u0441\u0441\u044b\u043b\u043a\u0438. \u041f\u0435\u0440\u0435\u043d\u0435\u0441\u0438\u0442\u0435 \u0435\u0433\u043e \u0447\u0435\u0440\u0435\u0437 KMZ"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 170
    :cond_7
    new-instance v0, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u0412 \u0438\u0441\u0445\u043e\u0434\u043d\u043e\u043c \u043f\u0440\u043e\u0435\u043a\u0442\u0435 \u043e\u0442\u0441\u0443\u0442\u0441\u0442\u0432\u0443\u0435\u0442 \u0444\u0430\u0439\u043b \u00ab"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 166
    :catch_0
    move-exception p1

    .line 167
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u0430\u044f \u0441\u0441\u044b\u043b\u043a\u0430 \u043d\u0430 \u0444\u0430\u0439\u043b \u0432 \u043f\u0440\u043e\u0435\u043a\u0442\u0435"

    invoke-direct {v0, v1, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 161
    :cond_8
    :goto_0
    return-void
.end method

.method private scan(Lorg/w3c/dom/Element;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 124
    const/16 v0, 0x80

    if-gt p2, v0, :cond_d

    const-string v0, "http://www.w3.org/XML/1998/namespace"

    const-string v1, "base"

    invoke-interface {p1, v0, v1}, Lorg/w3c/dom/Element;->hasAttributeNS(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 127
    const-string v0, "id"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 128
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->included:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 129
    :cond_0
    const-string v0, "styleUrl"

    invoke-static {p1, v0}, Lorg/rabochaya/projects/ObjectTree;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    const-string v1, "href"

    if-nez v0, :cond_1

    invoke-static {p1, v1}, Lorg/rabochaya/projects/ObjectTree;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 130
    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectProjectTransfer;->reference(Ljava/lang/String;)V

    .line 132
    :cond_2
    const-string v0, "schemaUrl"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->hasAttribute(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectProjectTransfer;->reference(Ljava/lang/String;)V

    .line 133
    :cond_3
    const-string v0, "targetId"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->hasAttribute(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectProjectTransfer;->references:Ljava/util/Set;

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 134
    :cond_4
    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->hasAttribute(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p1, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectProjectTransfer;->reference(Ljava/lang/String;)V

    .line 135
    :cond_5
    const-string v0, "value"

    invoke-static {p1, v0}, Lorg/rabochaya/projects/ObjectTree;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {p1}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v0

    instance-of v0, v0, Lorg/w3c/dom/Element;

    if-eqz v0, :cond_6

    .line 136
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    const-string v1, "name"

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "rk-media-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 137
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectProjectTransfer;->reference(Ljava/lang/String;)V

    .line 139
    :cond_6
    const-string v0, "description"

    invoke-static {p1, v0}, Lorg/rabochaya/projects/ObjectTree;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_a

    .line 140
    sget-object v0, Lorg/rabochaya/projects/ObjectProjectTransfer;->HTML_LINK:Ljava/util/regex/Pattern;

    invoke-interface {p1}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 141
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 142
    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_7

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    .line 143
    :cond_7
    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_8

    goto :goto_1

    :cond_8
    const/4 v2, 0x3

    :goto_1
    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 144
    :goto_2
    const-string v3, "#"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_9

    const-string v3, "&amp;"

    const-string v4, "&"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/ObjectProjectTransfer;->reference(Ljava/lang/String;)V

    .line 145
    :cond_9
    goto :goto_0

    .line 147
    :cond_a
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p1

    :goto_3
    if-eqz p1, :cond_c

    .line 148
    instance-of v0, p1, Lorg/w3c/dom/Element;

    if-eqz v0, :cond_b

    move-object v0, p1

    check-cast v0, Lorg/w3c/dom/Element;

    add-int/lit8 v2, p2, 0x1

    invoke-direct {p0, v0, v2}, Lorg/rabochaya/projects/ObjectProjectTransfer;->scan(Lorg/w3c/dom/Element;I)V

    .line 147
    :cond_b
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p1

    goto :goto_3

    .line 150
    :cond_c
    return-void

    .line 125
    :cond_d
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u0430\u044f \u0432\u043b\u043e\u0436\u0435\u043d\u043d\u043e\u0441\u0442\u044c \u0438\u043b\u0438 \u0431\u0430\u0437\u0430 \u0441\u0441\u044b\u043b\u043e\u043a \u0432 KML"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static verifyBase(Lorg/w3c/dom/Element;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 116
    nop

    :goto_0
    instance-of v0, p0, Lorg/w3c/dom/Element;

    if-eqz v0, :cond_1

    .line 117
    move-object v0, p0

    check-cast v0, Lorg/w3c/dom/Element;

    const-string v1, "http://www.w3.org/XML/1998/namespace"

    const-string v2, "base"

    invoke-interface {v0, v1, v2}, Lorg/w3c/dom/Element;->hasAttributeNS(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 116
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object p0

    goto :goto_0

    .line 118
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string v0, "\u041f\u0435\u0440\u0435\u043d\u043e\u0441 KML \u0441 \u0438\u0437\u043c\u0435\u043d\u0451\u043d\u043d\u043e\u0439 \u0431\u0430\u0437\u043e\u0439 \u0441\u0441\u044b\u043b\u043e\u043a \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u0442\u0441\u044f"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 121
    :cond_1
    return-void
.end method
