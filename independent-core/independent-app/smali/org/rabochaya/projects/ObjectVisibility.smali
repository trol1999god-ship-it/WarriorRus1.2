.class public final Lorg/rabochaya/projects/ObjectVisibility;
.super Ljava/lang/Object;
.source "ObjectVisibility.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/ObjectVisibility$Plan;,
        Lorg/rabochaya/projects/ObjectVisibility$Preview;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Lorg/w3c/dom/Element;Ljava/util/Collection;ZLjava/lang/String;)Lorg/rabochaya/projects/ObjectVisibility$Preview;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;Z",
            "Ljava/lang/String;",
            ")",
            "Lorg/rabochaya/projects/ObjectVisibility$Preview;"
        }
    .end annotation

    .line 26
    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/ObjectVisibility;->plan(Lorg/w3c/dom/Element;Ljava/util/Collection;ZLjava/lang/String;)Lorg/rabochaya/projects/ObjectVisibility$Plan;

    move-result-object p0

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectVisibility$Plan;->changes:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lorg/w3c/dom/Element;

    invoke-static {p3, p2}, Lorg/rabochaya/projects/ObjectVisibility;->set(Lorg/w3c/dom/Element;Z)V

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lorg/rabochaya/projects/ObjectVisibility$Plan;->preview:Lorg/rabochaya/projects/ObjectVisibility$Preview;

    return-object p0
.end method

.method public static effective(Lorg/w3c/dom/Element;)Z
    .locals 1

    .line 11
    nop

    :goto_0
    instance-of v0, p0, Lorg/w3c/dom/Element;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Lorg/w3c/dom/Element;

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectVisibility;->own(Lorg/w3c/dom/Element;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object p0

    goto :goto_0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method private static is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z
    .locals 2

    .line 30
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object p0

    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_1

    const-string p0, "http://www.opengis.net/kml/2.2"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    const-string p0, "http://earth\\.google\\.com/kml/2\\.[012]"

    invoke-virtual {v0, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    const/4 p0, 0x1

    goto :goto_1

    :cond_2
    const/4 p0, 0x0

    :goto_1
    return p0
.end method

.method public static own(Lorg/w3c/dom/Element;)Z
    .locals 2

    .line 10
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p0

    :goto_0
    if-eqz p0, :cond_2

    instance-of v0, p0, Lorg/w3c/dom/Element;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Lorg/w3c/dom/Element;

    const-string v1, "visibility"

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ObjectVisibility;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "false"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p0

    goto :goto_0

    :cond_2
    const/4 p0, 0x1

    return p0
.end method

.method private static plan(Lorg/w3c/dom/Element;Ljava/util/Collection;ZLjava/lang/String;)Lorg/rabochaya/projects/ObjectVisibility$Plan;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;Z",
            "Ljava/lang/String;",
            ")",
            "Lorg/rabochaya/projects/ObjectVisibility$Plan;"
        }
    .end annotation

    .line 17
    if-eqz p3, :cond_12

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectTree;->token(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_12

    .line 18
    invoke-static {p0}, Lorg/rabochaya/projects/ObjectTree;->rows(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object p3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/ObjectTree$Row;

    iget-object v3, v2, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 19
    :cond_0
    if-eqz p1, :cond_11

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_11

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    const/16 v2, 0x2710

    if-gt v1, v2, :cond_11

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u0412\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0439 \u044d\u043b\u0435\u043c\u0435\u043d\u0442 \u043d\u0435 \u043d\u0430\u0439\u0434\u0435\u043d"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 20
    :cond_2
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v3, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/rabochaya/projects/ObjectTree$Row;

    iget-object v3, v3, Lorg/rabochaya/projects/ObjectTree$Row;->element:Lorg/w3c/dom/Element;

    invoke-interface {v3}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v6

    :goto_3
    if-eqz v6, :cond_5

    instance-of v7, v6, Lorg/w3c/dom/Element;

    if-eqz v7, :cond_4

    move-object v7, v6

    check-cast v7, Lorg/w3c/dom/Element;

    const-string v8, "visibility"

    invoke-static {v7, v8}, Lorg/rabochaya/projects/ObjectVisibility;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    add-int/lit8 v5, v5, 0x1

    :cond_4
    invoke-interface {v6}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v6

    goto :goto_3

    :cond_5
    if-gt v5, v4, :cond_6

    invoke-static {v3}, Lorg/rabochaya/projects/ObjectVisibility;->own(Lorg/w3c/dom/Element;)Z

    move-result v4

    if-eq v4, p2, :cond_3

    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_6
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u0423 \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u043e\u0433\u043e \u044d\u043b\u0435\u043c\u0435\u043d\u0442\u0430 \u043d\u0435\u0441\u043a\u043e\u043b\u044c\u043a\u043e \u0441\u0432\u043e\u0439\u0441\u0442\u0432 visibility; \u0437\u0430\u043f\u0438\u0441\u044c \u043e\u0442\u043c\u0435\u043d\u0435\u043d\u0430"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 21
    :cond_7
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectVisibility;->effective(Lorg/w3c/dom/Element;)Z

    move-result p0

    if-eqz p0, :cond_8

    const/4 p0, 0x3

    goto :goto_4

    :cond_8
    move p0, v5

    :goto_4
    const-string v2, ""

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v0, v2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    move v9, v5

    move v10, v9

    move v11, v10

    :cond_9
    :goto_5
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_10

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lorg/rabochaya/projects/ObjectTree$Row;

    iget-object v2, p3, Lorg/rabochaya/projects/ObjectTree$Row;->parent:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/lit8 v3, v2, 0x1

    if-eqz v3, :cond_a

    iget-object v3, p3, Lorg/rabochaya/projects/ObjectTree$Row;->element:Lorg/w3c/dom/Element;

    invoke-static {v3}, Lorg/rabochaya/projects/ObjectVisibility;->own(Lorg/w3c/dom/Element;)Z

    move-result v3

    if-eqz v3, :cond_a

    move v3, v4

    goto :goto_6

    :cond_a
    move v3, v5

    :goto_6
    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_c

    iget-object v2, p3, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    if-eqz p2, :cond_c

    goto :goto_7

    :cond_b
    iget-object v2, p3, Lorg/rabochaya/projects/ObjectTree$Row;->element:Lorg/w3c/dom/Element;

    invoke-static {v2}, Lorg/rabochaya/projects/ObjectVisibility;->own(Lorg/w3c/dom/Element;)Z

    move-result v2

    if-eqz v2, :cond_c

    :goto_7
    move v2, v4

    goto :goto_8

    :cond_c
    move v2, v5

    :goto_8
    iget-object v6, p3, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    if-eqz v2, :cond_d

    const/4 v7, 0x2

    goto :goto_9

    :cond_d
    move v7, v5

    :goto_9
    or-int/2addr v7, v3

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez v3, :cond_e

    if-eqz v2, :cond_e

    add-int/lit8 v9, v9, 0x1

    :cond_e
    if-eqz v3, :cond_f

    if-nez v2, :cond_f

    add-int/lit8 v10, v10, 0x1

    :cond_f
    iget-object p3, p3, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-interface {v1, p3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_9

    if-nez v2, :cond_9

    add-int/lit8 v11, v11, 0x1

    goto :goto_5

    .line 23
    :cond_10
    new-instance p0, Lorg/rabochaya/projects/ObjectVisibility$Plan;

    new-instance p2, Lorg/rabochaya/projects/ObjectVisibility$Preview;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v7

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v8

    move-object v6, p2

    invoke-direct/range {v6 .. v11}, Lorg/rabochaya/projects/ObjectVisibility$Preview;-><init>(IIIII)V

    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/ObjectVisibility$Plan;-><init>(Ljava/util/List;Lorg/rabochaya/projects/ObjectVisibility$Preview;)V

    return-object p0

    .line 19
    :cond_11
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u043e\u0442 1 \u0434\u043e 10 000 \u044d\u043b\u0435\u043c\u0435\u043d\u0442\u043e\u0432"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 17
    :cond_12
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "\u041f\u0440\u043e\u0435\u043a\u0442 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f. \u041f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0439\u0442\u0435 \u0441\u043f\u0438\u0441\u043e\u043a \u0438 \u043f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u0435 \u0432\u044b\u0431\u043e\u0440"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static preview(Lorg/w3c/dom/Element;Ljava/util/Collection;ZLjava/lang/String;)Lorg/rabochaya/projects/ObjectVisibility$Preview;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;Z",
            "Ljava/lang/String;",
            ")",
            "Lorg/rabochaya/projects/ObjectVisibility$Preview;"
        }
    .end annotation

    .line 25
    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/ObjectVisibility;->plan(Lorg/w3c/dom/Element;Ljava/util/Collection;ZLjava/lang/String;)Lorg/rabochaya/projects/ObjectVisibility$Plan;

    move-result-object p0

    iget-object p0, p0, Lorg/rabochaya/projects/ObjectVisibility$Plan;->preview:Lorg/rabochaya/projects/ObjectVisibility$Preview;

    return-object p0
.end method

.method private static set(Lorg/w3c/dom/Element;Z)V
    .locals 6

    .line 27
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v0

    const/4 v1, 0x0

    move-object v2, v1

    :goto_0
    const-string v3, "visibility"

    if-eqz v0, :cond_2

    instance-of v4, v0, Lorg/w3c/dom/Element;

    if-eqz v4, :cond_1

    move-object v4, v0

    check-cast v4, Lorg/w3c/dom/Element;

    invoke-static {v4, v3}, Lorg/rabochaya/projects/ObjectVisibility;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    move-object v1, v4

    :cond_0
    const-string v3, "name"

    invoke-static {v4, v3}, Lorg/rabochaya/projects/ObjectVisibility;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    move-object v2, v4

    :cond_1
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v0

    goto :goto_0

    .line 28
    :cond_2
    if-nez v1, :cond_6

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getPrefix()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v4

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_3

    goto :goto_1

    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ":visibility"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :cond_4
    :goto_1
    invoke-interface {v4, v1, v3}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    if-nez v2, :cond_5

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v0

    goto :goto_2

    :cond_5
    invoke-interface {v2}, Lorg/w3c/dom/Element;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v0

    :goto_2
    invoke-interface {p0, v1, v0}, Lorg/w3c/dom/Element;->insertBefore(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    :cond_6
    if-eqz p1, :cond_7

    const-string p0, "1"

    goto :goto_3

    :cond_7
    const-string p0, "0"

    :goto_3
    invoke-interface {v1, p0}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 29
    return-void
.end method
