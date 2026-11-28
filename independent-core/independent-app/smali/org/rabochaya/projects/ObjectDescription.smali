.class public final Lorg/rabochaya/projects/ObjectDescription;
.super Ljava/lang/Object;
.source "ObjectDescription.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/ObjectDescription$Content;
    }
.end annotation


# static fields
.field public static final MAX_NOTE:I = 0x186a0


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .line 21
    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/ObjectDescription;->target(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectDescription;->content(Lorg/w3c/dom/Element;)Lorg/rabochaya/projects/ObjectDescription$Content;

    move-result-object p1

    invoke-static {p3}, Lorg/rabochaya/projects/ObjectDescription;->validate(Ljava/lang/String;)V

    iget-object p2, p1, Lorg/rabochaya/projects/ObjectDescription$Content;->note:Ljava/lang/String;

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    return v0

    .line 22
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p3, p1, Lorg/rabochaya/projects/ObjectDescription$Content;->blocks:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 23
    :cond_1
    iget-object p1, p1, Lorg/rabochaya/projects/ObjectDescription$Content;->property:Lorg/w3c/dom/Element;

    .line 24
    if-nez p1, :cond_7

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-nez p1, :cond_2

    return v0

    :cond_2
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getPrefix()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object p3

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_1

    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ":description"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    :cond_4
    :goto_1
    const-string p1, "description"

    :goto_2
    invoke-interface {p3, v0, p1}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p1

    .line 26
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p3

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v0

    :goto_3
    if-eqz v0, :cond_6

    instance-of v1, v0, Lorg/w3c/dom/Element;

    if-eqz v1, :cond_5

    move-object v1, v0

    check-cast v1, Lorg/w3c/dom/Element;

    invoke-static {v1}, Lorg/rabochaya/projects/ObjectDescription;->isMetadata(Lorg/w3c/dom/Element;)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p3

    :cond_5
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v0

    goto :goto_3

    :cond_6
    invoke-interface {p0, p1, p3}, Lorg/w3c/dom/Element;->insertBefore(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 28
    :cond_7
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0
.end method

.method private static content(Lorg/w3c/dom/Element;)Lorg/rabochaya/projects/ObjectDescription$Content;
    .locals 10

    .line 33
    new-instance v0, Lorg/rabochaya/projects/ObjectDescription$Content;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/rabochaya/projects/ObjectDescription$Content;-><init>(Lorg/rabochaya/projects/ObjectDescription$1;)V

    const-string v1, "description"

    invoke-static {p0, v1}, Lorg/rabochaya/projects/ObjectDescription;->single(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    iput-object v1, v0, Lorg/rabochaya/projects/ObjectDescription$Content;->property:Lorg/w3c/dom/Element;

    iget-object v1, v0, Lorg/rabochaya/projects/ObjectDescription$Content;->property:Lorg/w3c/dom/Element;

    if-nez v1, :cond_0

    const-string v1, ""

    goto :goto_0

    :cond_0
    iget-object v1, v0, Lorg/rabochaya/projects/ObjectDescription$Content;->property:Lorg/w3c/dom/Element;

    invoke-interface {v1}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v1

    .line 34
    :goto_0
    iget-object v2, v0, Lorg/rabochaya/projects/ObjectDescription$Content;->property:Lorg/w3c/dom/Element;

    if-eqz v2, :cond_3

    iget-object v2, v0, Lorg/rabochaya/projects/ObjectDescription$Content;->property:Lorg/w3c/dom/Element;

    invoke-interface {v2}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v2

    :goto_1
    if-eqz v2, :cond_3

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_2

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v3

    const/4 v4, 0x4

    if-ne v3, v4, :cond_1

    goto :goto_2

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435 \u0441\u043e\u0434\u0435\u0440\u0436\u0438\u0442 XML-\u0440\u0430\u0437\u043c\u0435\u0442\u043a\u0443; \u0438\u0441\u043f\u043e\u043b\u044c\u0437\u0443\u0439\u0442\u0435 \u044d\u043a\u0441\u043f\u043e\u0440\u0442 \u0434\u043b\u044f \u0440\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u044f \u0431\u0435\u0437 \u043f\u043e\u0442\u0435\u0440\u044c"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    :goto_2
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v2

    goto :goto_1

    .line 35
    :cond_3
    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    const-string v3, "ExtendedData"

    invoke-static {p0, v3}, Lorg/rabochaya/projects/ObjectDescription;->single(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    if-eqz p0, :cond_6

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p0

    :goto_3
    if-eqz p0, :cond_6

    instance-of v3, p0, Lorg/w3c/dom/Element;

    if-eqz v3, :cond_5

    move-object v3, p0

    check-cast v3, Lorg/w3c/dom/Element;

    const-string v4, "Data"

    invoke-static {v3, v4}, Lorg/rabochaya/projects/ObjectDescription;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    const-string v4, "name"

    invoke-interface {v3, v4}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "rk-media-[a-f0-9-]{36}"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    goto :goto_4

    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u041f\u043e\u0432\u0442\u043e\u0440 \u0438\u0434\u0435\u043d\u0442\u0438\u0444\u0438\u043a\u0430\u0442\u043e\u0440\u0430 \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u044f; \u0437\u0430\u043f\u0438\u0441\u044c \u043e\u0442\u043c\u0435\u043d\u0435\u043d\u0430"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_5
    :goto_4
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p0

    goto :goto_3

    .line 36
    :cond_6
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    move-object v2, v1

    :goto_5
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "<!--"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "-->"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "<!--/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    if-gez v5, :cond_7

    if-gez v6, :cond_7

    goto :goto_5

    :cond_7
    if-ltz v5, :cond_9

    if-lt v6, v5, :cond_9

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v7, v5

    invoke-virtual {v2, v4, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v7

    if-gez v7, :cond_9

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v7, v6

    invoke-virtual {v2, v3, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v7

    if-gez v7, :cond_9

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v7, v6

    invoke-virtual {v2, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v8, v9

    invoke-virtual {v7, v4, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    const-string v8, "<!--rk-media-"

    invoke-virtual {v4, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_8

    iget-object v4, v0, Lorg/rabochaya/projects/ObjectDescription$Content;->blocks:Ljava/util/List;

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v7, 0x0

    invoke-virtual {v2, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v6, v3

    invoke-virtual {v2, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_5

    :cond_8
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u0412\u043b\u043e\u0436\u0435\u043d\u043d\u044b\u0435 \u0441\u043b\u0443\u0436\u0435\u0431\u043d\u044b\u0435 \u0431\u043b\u043e\u043a\u0438; \u0437\u0430\u043f\u0438\u0441\u044c \u043e\u0442\u043c\u0435\u043d\u0435\u043d\u0430"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_9
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u041f\u043e\u0432\u0440\u0435\u0436\u0434\u0451\u043d \u0441\u043b\u0443\u0436\u0435\u0431\u043d\u044b\u0439 \u0431\u043b\u043e\u043a \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u044f; \u0437\u0430\u043f\u0438\u0441\u044c \u043e\u0442\u043c\u0435\u043d\u0435\u043d\u0430"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 37
    :cond_a
    iget-object p0, v0, Lorg/rabochaya/projects/ObjectDescription$Content;->blocks:Ljava/util/List;

    new-instance v3, Lorg/rabochaya/projects/ObjectDescription$$ExternalSyntheticLambda0;

    invoke-direct {v3, v1}, Lorg/rabochaya/projects/ObjectDescription$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    iput-object v2, v0, Lorg/rabochaya/projects/ObjectDescription$Content;->note:Ljava/lang/String;

    return-object v0
.end method

.method private static is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z
    .locals 2

    .line 40
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
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method private static isMetadata(Lorg/w3c/dom/Element;)Z
    .locals 1

    .line 30
    const-string v0, "name"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/ObjectDescription;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "visibility"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/ObjectDescription;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "open"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/ObjectDescription;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "address"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/ObjectDescription;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "phoneNumber"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/ObjectDescription;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "Snippet"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/ObjectDescription;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "snippet"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/ObjectDescription;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "AddressDetails"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/ObjectDescription;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

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

.method static synthetic lambda$content$0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 37
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Integer;->compare(II)I

    move-result p0

    return p0
.end method

.method public static read(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 13
    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/ObjectDescription;->target(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectDescription;->content(Lorg/w3c/dom/Element;)Lorg/rabochaya/projects/ObjectDescription$Content;

    move-result-object p0

    iget-object p0, p0, Lorg/rabochaya/projects/ObjectDescription$Content;->note:Ljava/lang/String;

    return-object p0
.end method

.method private static single(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 3

    .line 39
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p0

    const/4 v0, 0x0

    :goto_0
    if-eqz p0, :cond_2

    instance-of v1, p0, Lorg/w3c/dom/Element;

    if-eqz v1, :cond_1

    move-object v1, p0

    check-cast v1, Lorg/w3c/dom/Element;

    invoke-static {v1, p1}, Lorg/rabochaya/projects/ObjectDescription;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    if-nez v0, :cond_0

    move-object v0, v1

    goto :goto_1

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u041d\u0435\u0441\u043a\u043e\u043b\u044c\u043a\u043e \u0441\u0432\u043e\u0439\u0441\u0442\u0432 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "; \u0437\u0430\u043f\u0438\u0441\u044c \u043e\u0442\u043c\u0435\u043d\u0435\u043d\u0430"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_1
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p0

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method private static target(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 1

    .line 31
    if-eqz p2, :cond_1

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectTree;->token(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_0

    invoke-static {p0, p1}, Lorg/rabochaya/projects/ObjectTree;->resolve(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    return-object p0

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u043e\u0434\u0438\u043d \u043e\u0431\u044a\u0435\u043a\u0442 \u0438\u043b\u0438 \u043f\u0430\u043f\u043a\u0443"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "\u041f\u0440\u043e\u0435\u043a\u0442 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f. \u041f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0439\u0442\u0435 \u0441\u043f\u0438\u0441\u043e\u043a \u0438 \u043f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u0435 \u0432\u044b\u0431\u043e\u0440"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static validate(Ljava/lang/String;)V
    .locals 3

    .line 15
    if-eqz p0, :cond_6

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const v1, 0x186a0

    if-gt v0, v1, :cond_6

    .line 16
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_4

    invoke-virtual {p0, v0}, Ljava/lang/String;->codePointAt(I)I

    move-result v1

    const/16 v2, 0x9

    if-eq v1, v2, :cond_3

    const/16 v2, 0xa

    if-eq v1, v2, :cond_3

    const/16 v2, 0xd

    if-eq v1, v2, :cond_3

    const/16 v2, 0x20

    if-lt v1, v2, :cond_0

    const v2, 0xd7ff

    if-le v1, v2, :cond_3

    :cond_0
    const v2, 0xe000

    if-lt v1, v2, :cond_1

    const v2, 0xfffd

    if-le v1, v2, :cond_3

    :cond_1
    const/high16 v2, 0x10000

    if-lt v1, v2, :cond_2

    const v2, 0x10ffff

    if-gt v1, v2, :cond_2

    goto :goto_1

    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435 \u0441\u043e\u0434\u0435\u0440\u0436\u0438\u0442 \u043d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0441\u0438\u043c\u0432\u043e\u043b XML"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3
    :goto_1
    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_0

    .line 17
    :cond_4
    const-string v0, "<!--rk-media-"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "<!--/rk-media-"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_5

    .line 18
    return-void

    .line 17
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u0421\u043b\u0443\u0436\u0435\u0431\u043d\u044b\u0435 \u0431\u043b\u043e\u043a\u0438 \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u0439 \u043c\u0435\u043d\u044f\u044e\u0442\u0441\u044f \u0432 \u043c\u0435\u043d\u0435\u0434\u0436\u0435\u0440\u0435 \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u0439"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 15
    :cond_6
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435: \u043d\u0435 \u0431\u043e\u043b\u0435\u0435 100 000 \u0441\u0438\u043c\u0432\u043e\u043b\u043e\u0432"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
