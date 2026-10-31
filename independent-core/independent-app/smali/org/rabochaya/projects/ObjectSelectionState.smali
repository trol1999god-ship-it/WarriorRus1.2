.class public final Lorg/rabochaya/projects/ObjectSelectionState;
.super Ljava/lang/Object;
.source "ObjectSelectionState.java"


# instance fields
.field private final indices:[I

.field public final project:J

.field public final session:Ljava/lang/String;

.field public final token:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;[I)V
    .locals 2

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p5, :cond_1

    array-length v0, p5

    const/16 v1, 0x2710

    if-gt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0431\u043e\u043b\u044c\u0448\u043e\u0439 \u0432\u044b\u0431\u043e\u0440"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    iput-wide p1, p0, Lorg/rabochaya/projects/ObjectSelectionState;->project:J

    iput-object p3, p0, Lorg/rabochaya/projects/ObjectSelectionState;->token:Ljava/lang/String;

    iput-object p4, p0, Lorg/rabochaya/projects/ObjectSelectionState;->session:Ljava/lang/String;

    if-nez p5, :cond_2

    const/4 p1, 0x0

    new-array p1, p1, [I

    goto :goto_1

    :cond_2
    invoke-virtual {p5}, [I->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [I

    :goto_1
    iput-object p1, p0, Lorg/rabochaya/projects/ObjectSelectionState;->indices:[I

    return-void
.end method

.method public static capture(JLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/Collection;)Lorg/rabochaya/projects/ObjectSelectionState;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/ObjectTree$Row;",
            ">;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/rabochaya/projects/ObjectSelectionState;"
        }
    .end annotation

    .line 9
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p5}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result p5

    new-array p5, p5, [I

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    :goto_0
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_1

    invoke-interface {p4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/ObjectTree$Row;

    iget-object v4, v4, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    add-int/lit8 v4, v3, 0x1

    aput v2, p5, v3

    move v3, v4

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 10
    :cond_1
    new-instance p4, Lorg/rabochaya/projects/ObjectSelectionState;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    if-ne v3, v0, :cond_2

    goto :goto_1

    :cond_2
    new-array p5, v1, [I

    :goto_1
    move-object v9, p5

    move-object v4, p4

    move-wide v5, p0

    move-object v7, p2

    move-object v8, p3

    invoke-direct/range {v4 .. v9}, Lorg/rabochaya/projects/ObjectSelectionState;-><init>(JLjava/lang/String;Ljava/lang/String;[I)V

    return-object p4
.end method


# virtual methods
.method public indices()[I
    .locals 1

    .line 7
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectSelectionState;->indices:[I

    invoke-virtual {v0}, [I->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public restore(JLorg/w3c/dom/Element;Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lorg/w3c/dom/Element;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 13
    iget-wide v0, p0, Lorg/rabochaya/projects/ObjectSelectionState;->project:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_5

    iget-wide v0, p0, Lorg/rabochaya/projects/ObjectSelectionState;->project:J

    cmp-long p1, v0, p1

    if-nez p1, :cond_5

    if-eqz p3, :cond_5

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectSelectionState;->token:Ljava/lang/String;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectSelectionState;->session:Ljava/lang/String;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectSelectionState;->session:Ljava/lang/String;

    invoke-virtual {p1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_3

    .line 14
    :cond_0
    :try_start_0
    iget-object p1, p0, Lorg/rabochaya/projects/ObjectSelectionState;->token:Ljava/lang/String;

    invoke-static {p3}, Lorg/rabochaya/projects/ObjectTree;->token(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1

    :cond_1
    invoke-static {p3}, Lorg/rabochaya/projects/ObjectTree;->rows(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object p1

    new-instance p2, Ljava/util/HashSet;

    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 15
    iget-object p4, p0, Lorg/rabochaya/projects/ObjectSelectionState;->indices:[I

    array-length v0, p4

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_4

    aget v2, p4, v1

    if-ltz v2, :cond_3

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {p2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    goto :goto_1

    :cond_2
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/ObjectTree$Row;

    iget-object v2, v2, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-interface {p3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1

    :cond_4
    invoke-static {p3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 16
    :catch_0
    move-exception p1

    goto :goto_2

    :catch_1
    move-exception p1

    :goto_2
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 13
    :cond_5
    :goto_3
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1
.end method
