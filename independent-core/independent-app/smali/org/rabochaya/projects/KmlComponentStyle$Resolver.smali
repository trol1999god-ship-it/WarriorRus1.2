.class public final Lorg/rabochaya/projects/KmlComponentStyle$Resolver;
.super Ljava/lang/Object;
.source "KmlComponentStyle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/KmlComponentStyle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Resolver"
.end annotation


# static fields
.field public static final MAX_DEPTH:I = 0x8

.field public static final MAX_NODES:I = 0x30d40

.field public static final MAX_STYLES:I = 0x1000


# instance fields
.field public final complete:Z

.field private final document:Lorg/w3c/dom/Document;

.field private final duplicates:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final styles:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lorg/w3c/dom/Element;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Document;)V
    .locals 9

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/KmlComponentStyle$Resolver;->styles:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/KmlComponentStyle$Resolver;->duplicates:Ljava/util/HashSet;

    .line 21
    iput-object p1, p0, Lorg/rabochaya/projects/KmlComponentStyle$Resolver;->document:Lorg/w3c/dom/Document;

    const/4 v0, 0x0

    if-nez p1, :cond_0

    move-object p1, v0

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object p1

    :goto_0
    const/4 v1, 0x0

    move-object v2, p1

    move v3, v1

    move v4, v3

    .line 22
    :goto_1
    const/4 v5, 0x1

    if-eqz v2, :cond_a

    add-int/2addr v3, v5

    const v5, 0x30d40

    if-le v3, v5, :cond_1

    :goto_2
    goto/16 :goto_6

    :cond_1
    const-string v5, "Style"

    invoke-static {v2, v5}, Lorg/rabochaya/projects/KmlComponentStyle;->access$000(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v5, "StyleMap"

    invoke-static {v2, v5}, Lorg/rabochaya/projects/KmlComponentStyle;->access$000(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    :cond_2
    move-object v5, v2

    check-cast v5, Lorg/w3c/dom/Element;

    const-string v6, "id"

    invoke-interface {v5, v6}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    const/16 v8, 0x100

    if-gt v7, v8, :cond_6

    add-int/lit8 v4, v4, 0x1

    const/16 v7, 0x1000

    if-le v4, v7, :cond_3

    goto :goto_2

    :cond_3
    iget-object v7, p0, Lorg/rabochaya/projects/KmlComponentStyle$Resolver;->styles:Ljava/util/HashMap;

    invoke-virtual {v7, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_5

    iget-object v7, p0, Lorg/rabochaya/projects/KmlComponentStyle$Resolver;->duplicates:Ljava/util/HashSet;

    invoke-virtual {v7, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    goto :goto_3

    :cond_4
    iget-object v7, p0, Lorg/rabochaya/projects/KmlComponentStyle$Resolver;->styles:Ljava/util/HashMap;

    invoke-virtual {v7, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    :cond_5
    :goto_3
    iget-object v5, p0, Lorg/rabochaya/projects/KmlComponentStyle$Resolver;->styles:Ljava/util/HashMap;

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v5, p0, Lorg/rabochaya/projects/KmlComponentStyle$Resolver;->duplicates:Ljava/util/HashSet;

    invoke-virtual {v5, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 23
    :cond_6
    :goto_4
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v5

    if-eqz v5, :cond_7

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v2

    goto :goto_1

    :cond_7
    :goto_5
    if-eq v2, p1, :cond_8

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v5

    if-nez v5, :cond_8

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v2

    goto :goto_5

    :cond_8
    if-ne v2, p1, :cond_9

    move-object v2, v0

    goto :goto_1

    :cond_9
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v2

    goto :goto_1

    .line 22
    :cond_a
    move v1, v5

    .line 24
    :goto_6
    if-nez v1, :cond_b

    iget-object p1, p0, Lorg/rabochaya/projects/KmlComponentStyle$Resolver;->styles:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    iget-object p1, p0, Lorg/rabochaya/projects/KmlComponentStyle$Resolver;->duplicates:Ljava/util/HashSet;

    invoke-virtual {p1}, Ljava/util/HashSet;->clear()V

    :cond_b
    iput-boolean v1, p0, Lorg/rabochaya/projects/KmlComponentStyle$Resolver;->complete:Z

    .line 25
    return-void
.end method

.method private reference(Ljava/lang/String;ILjava/util/Set;)Lorg/rabochaya/projects/KmlComponentStyle;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/rabochaya/projects/KmlComponentStyle;"
        }
    .end annotation

    .line 27
    const/16 v0, 0x8

    if-ge p2, v0, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x2

    if-lt v0, v1, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x101

    if-gt v0, v1, :cond_3

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x23

    if-eq v0, v1, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object p1, Lorg/rabochaya/projects/KmlComponentStyle;->EMPTY:Lorg/rabochaya/projects/KmlComponentStyle;

    return-object p1

    :cond_1
    iget-object v1, p0, Lorg/rabochaya/projects/KmlComponentStyle$Resolver;->styles:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/w3c/dom/Element;

    if-nez p1, :cond_2

    sget-object p1, Lorg/rabochaya/projects/KmlComponentStyle;->EMPTY:Lorg/rabochaya/projects/KmlComponentStyle;

    goto :goto_0

    :cond_2
    add-int/2addr p2, v0

    invoke-direct {p0, p1, p2, p3}, Lorg/rabochaya/projects/KmlComponentStyle$Resolver;->selector(Lorg/w3c/dom/Element;ILjava/util/Set;)Lorg/rabochaya/projects/KmlComponentStyle;

    move-result-object p1

    :goto_0
    return-object p1

    :cond_3
    :goto_1
    sget-object p1, Lorg/rabochaya/projects/KmlComponentStyle;->EMPTY:Lorg/rabochaya/projects/KmlComponentStyle;

    return-object p1
.end method

.method private selector(Lorg/w3c/dom/Element;ILjava/util/Set;)Lorg/rabochaya/projects/KmlComponentStyle;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "I",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/rabochaya/projects/KmlComponentStyle;"
        }
    .end annotation

    .line 28
    const-string v0, "Style"

    invoke-static {p1, v0}, Lorg/rabochaya/projects/KmlComponentStyle;->access$000(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p1}, Lorg/rabochaya/projects/KmlComponentStyle;->access$200(Lorg/w3c/dom/Element;)Lorg/rabochaya/projects/KmlComponentStyle;

    move-result-object p1

    return-object p1

    :cond_0
    const-string v1, "StyleMap"

    invoke-static {p1, v1}, Lorg/rabochaya/projects/KmlComponentStyle;->access$000(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    const/16 v1, 0x8

    if-le p2, v1, :cond_1

    goto :goto_2

    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p1

    const/4 v1, 0x0

    :goto_0
    if-eqz p1, :cond_4

    const-string v2, "Pair"

    invoke-static {p1, v2}, Lorg/rabochaya/projects/KmlComponentStyle;->access$000(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    move-object v2, p1

    check-cast v2, Lorg/w3c/dom/Element;

    const-string v3, "key"

    invoke-static {v2, v3}, Lorg/rabochaya/projects/KmlComponentStyle;->access$100(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "normal"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    if-eqz v1, :cond_2

    sget-object p1, Lorg/rabochaya/projects/KmlComponentStyle;->EMPTY:Lorg/rabochaya/projects/KmlComponentStyle;

    return-object p1

    :cond_2
    move-object v1, v2

    :cond_3
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p1

    goto :goto_0

    :cond_4
    if-nez v1, :cond_5

    sget-object p1, Lorg/rabochaya/projects/KmlComponentStyle;->EMPTY:Lorg/rabochaya/projects/KmlComponentStyle;

    return-object p1

    :cond_5
    const-string p1, "styleUrl"

    invoke-static {v1, p1}, Lorg/rabochaya/projects/KmlComponentStyle;->access$100(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Lorg/rabochaya/projects/KmlComponentStyle$Resolver;->reference(Ljava/lang/String;ILjava/util/Set;)Lorg/rabochaya/projects/KmlComponentStyle;

    move-result-object p1

    invoke-static {v1, v0}, Lorg/rabochaya/projects/KmlComponentStyle;->access$400(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p2

    if-nez p2, :cond_6

    goto :goto_1

    :cond_6
    invoke-static {p2}, Lorg/rabochaya/projects/KmlComponentStyle;->access$200(Lorg/w3c/dom/Element;)Lorg/rabochaya/projects/KmlComponentStyle;

    move-result-object p2

    invoke-static {p2, p1}, Lorg/rabochaya/projects/KmlComponentStyle;->access$300(Lorg/rabochaya/projects/KmlComponentStyle;Lorg/rabochaya/projects/KmlComponentStyle;)Lorg/rabochaya/projects/KmlComponentStyle;

    move-result-object p1

    :goto_1
    return-object p1

    :cond_7
    :goto_2
    sget-object p1, Lorg/rabochaya/projects/KmlComponentStyle;->EMPTY:Lorg/rabochaya/projects/KmlComponentStyle;

    return-object p1
.end method


# virtual methods
.method public resolve(Lorg/w3c/dom/Element;)Lorg/rabochaya/projects/KmlComponentStyle;
    .locals 3

    .line 26
    if-eqz p1, :cond_3

    invoke-interface {p1}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/KmlComponentStyle$Resolver;->document:Lorg/w3c/dom/Document;

    if-eq v0, v1, :cond_0

    goto :goto_1

    :cond_0
    const-string v0, "styleUrl"

    invoke-static {p1, v0}, Lorg/rabochaya/projects/KmlComponentStyle;->access$100(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    const/4 v2, 0x0

    invoke-direct {p0, v0, v2, v1}, Lorg/rabochaya/projects/KmlComponentStyle$Resolver;->reference(Ljava/lang/String;ILjava/util/Set;)Lorg/rabochaya/projects/KmlComponentStyle;

    move-result-object v0

    invoke-interface {p1}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p1

    :goto_0
    if-eqz p1, :cond_2

    const-string v1, "Style"

    invoke-static {p1, v1}, Lorg/rabochaya/projects/KmlComponentStyle;->access$000(Lorg/w3c/dom/Node;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    move-object v1, p1

    check-cast v1, Lorg/w3c/dom/Element;

    invoke-static {v1}, Lorg/rabochaya/projects/KmlComponentStyle;->access$200(Lorg/w3c/dom/Element;)Lorg/rabochaya/projects/KmlComponentStyle;

    move-result-object v1

    invoke-static {v1, v0}, Lorg/rabochaya/projects/KmlComponentStyle;->access$300(Lorg/rabochaya/projects/KmlComponentStyle;Lorg/rabochaya/projects/KmlComponentStyle;)Lorg/rabochaya/projects/KmlComponentStyle;

    move-result-object v0

    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p1

    goto :goto_0

    :cond_2
    return-object v0

    :cond_3
    :goto_1
    sget-object p1, Lorg/rabochaya/projects/KmlComponentStyle;->EMPTY:Lorg/rabochaya/projects/KmlComponentStyle;

    return-object p1
.end method
