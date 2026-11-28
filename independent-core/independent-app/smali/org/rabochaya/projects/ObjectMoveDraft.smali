.class public final Lorg/rabochaya/projects/ObjectMoveDraft;
.super Ljava/lang/Object;
.source "ObjectMoveDraft.java"


# instance fields
.field public final destination:Ljava/lang/String;

.field private final indices:[I

.field public final label:Ljava/lang/String;

.field public final outside:I

.field public final project:J

.field public final session:Ljava/lang/String;

.field public final token:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;[ILjava/lang/String;Ljava/lang/String;I)V
    .locals 5

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_2

    if-eqz p3, :cond_2

    const-string v0, "[0-9a-f]{64}"

    invoke-virtual {p3, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    if-eqz p4, :cond_2

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x80

    if-gt v0, v1, :cond_2

    if-eqz p5, :cond_2

    array-length v0, p5

    if-eqz v0, :cond_2

    array-length v0, p5

    const/16 v1, 0x2710

    if-gt v0, v1, :cond_2

    if-eqz p6, :cond_2

    invoke-virtual {p6}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0x16b

    if-gt v0, v2, :cond_2

    const-string v0, "|(?:0|[1-9][0-9]*)(/(?:0|[1-9][0-9]*))*"

    invoke-virtual {p6, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "/"

    invoke-virtual {p6, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v0, v0

    const/16 v2, 0x21

    if-gt v0, v2, :cond_2

    if-eqz p7, :cond_2

    invoke-virtual {p7}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p7}, Ljava/lang/String;->length()I

    move-result v0

    const v2, 0x9c40

    if-gt v0, v2, :cond_2

    if-ltz p8, :cond_2

    array-length v0, p5

    if-gt p8, v0, :cond_2

    .line 8
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    array-length v2, p5

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget v4, p5, v3

    if-ltz v4, :cond_0

    if-ge v4, v1, :cond_0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0432\u044b\u0431\u043e\u0440 \u043f\u0435\u0440\u0435\u043d\u043e\u0441\u0430"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 9
    :cond_1
    iput-wide p1, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->project:J

    iput-object p3, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->token:Ljava/lang/String;

    iput-object p4, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->session:Ljava/lang/String;

    invoke-virtual {p5}, [I->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [I

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->indices:[I

    iput-object p6, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->destination:Ljava/lang/String;

    iput-object p7, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->label:Ljava/lang/String;

    iput p8, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->outside:I

    .line 10
    return-void

    .line 7
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u043f\u043b\u0430\u043d \u043f\u0435\u0440\u0435\u043d\u043e\u0441\u0430"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static capture(JLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/Collection;Ljava/lang/String;Ljava/lang/String;I)Lorg/rabochaya/projects/ObjectMoveDraft;
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
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I)",
            "Lorg/rabochaya/projects/ObjectMoveDraft;"
        }
    .end annotation

    .line 12
    new-instance v9, Lorg/rabochaya/projects/ObjectMoveDraft;

    invoke-static/range {p0 .. p5}, Lorg/rabochaya/projects/ObjectSelectionState;->capture(JLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/Collection;)Lorg/rabochaya/projects/ObjectSelectionState;

    move-result-object v0

    invoke-virtual {v0}, Lorg/rabochaya/projects/ObjectSelectionState;->indices()[I

    move-result-object v5

    move-object v0, v9

    move-wide v1, p0

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move/from16 v8, p8

    invoke-direct/range {v0 .. v8}, Lorg/rabochaya/projects/ObjectMoveDraft;-><init>(JLjava/lang/String;Ljava/lang/String;[ILjava/lang/String;Ljava/lang/String;I)V

    return-object v9
.end method


# virtual methods
.method public inSession(JLjava/lang/String;)Z
    .locals 2

    .line 13
    iget-wide v0, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->project:J

    cmp-long p1, v0, p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->session:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public indices()[I
    .locals 1

    .line 11
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->indices:[I

    invoke-virtual {v0}, [I->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public restore(JLorg/w3c/dom/Element;Ljava/lang/String;)Ljava/util/List;
    .locals 7
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

    .line 15
    invoke-virtual {p0, p1, p2, p4}, Lorg/rabochaya/projects/ObjectMoveDraft;->inSession(JLjava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance v6, Lorg/rabochaya/projects/ObjectSelectionState;

    iget-wide v1, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->project:J

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->token:Ljava/lang/String;

    iget-object v4, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->session:Ljava/lang/String;

    iget-object v5, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->indices:[I

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/ObjectSelectionState;-><init>(JLjava/lang/String;Ljava/lang/String;[I)V

    invoke-virtual {v6, p1, p2, p3, p4}, Lorg/rabochaya/projects/ObjectSelectionState;->restore(JLorg/w3c/dom/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_1

    return-object p1

    .line 16
    :cond_1
    :try_start_0
    iget-object p2, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->token:Ljava/lang/String;

    invoke-static {p3, p1, p2}, Lorg/rabochaya/projects/ObjectTree;->selection(Lorg/w3c/dom/Element;Ljava/util/Collection;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->destination:Ljava/lang/String;

    invoke-static {p3, p2}, Lorg/rabochaya/projects/ObjectTree;->resolve(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->destination:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    invoke-static {p3}, Lorg/rabochaya/projects/ObjectTree;->rows(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_2
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_3

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lorg/rabochaya/projects/ObjectTree$Row;

    iget-object v0, p4, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->destination:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-boolean p2, p4, Lorg/rabochaya/projects/ObjectTree$Row;->folder:Z

    goto :goto_0

    :cond_3
    if-nez p2, :cond_4

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1

    :cond_4
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_5
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_7

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    iget-object p4, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->destination:Ljava/lang/String;

    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-nez p4, :cond_6

    iget-object p4, p0, Lorg/rabochaya/projects/ObjectMoveDraft;->destination:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, "/"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p4, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_5

    :cond_6
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_7
    return-object p1

    :catch_0
    move-exception p1

    goto :goto_1

    :catch_1
    move-exception p1

    :goto_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1
.end method
