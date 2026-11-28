.class public final Lorg/rabochaya/projects/ObjectConfirmationDraft;
.super Ljava/lang/Object;
.source "ObjectConfirmationDraft.java"


# instance fields
.field public final action:Ljava/lang/String;

.field public final destination:Ljava/lang/String;

.field public final destinationLabel:Ljava/lang/String;

.field public final fingerprint:Ljava/lang/String;

.field private final indices:[I

.field public final message:Ljava/lang/String;

.field public final outside:I

.field public final project:J

.field public final session:Ljava/lang/String;

.field public final title:Ljava/lang/String;

.field public final token:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;[ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 17

    .line 6
    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v11, p11

    move/from16 v12, p12

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const-string v13, "pastecopy"

    invoke-virtual {v13, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_1

    const-string v13, "pastecut"

    invoke-virtual {v13, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    goto :goto_0

    :cond_0
    const/4 v13, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v13, 0x1

    .line 8
    :goto_1
    if-nez v13, :cond_2

    const-string v15, "delete"

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_2

    const-string v15, "show"

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_2

    const-string v15, "hide"

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_8

    :cond_2
    const-wide/16 v15, 0x0

    cmp-long v15, v1, v15

    if-lez v15, :cond_8

    if-eqz v4, :cond_8

    const-string v15, "[a-f0-9]{64}"

    invoke-virtual {v4, v15}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_8

    if-eqz v5, :cond_8

    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->isEmpty()Z

    move-result v16

    if-nez v16, :cond_8

    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->length()I

    move-result v14

    const/16 v5, 0x80

    if-gt v14, v5, :cond_8

    if-eqz v6, :cond_8

    array-length v14, v6

    if-eqz v14, :cond_8

    array-length v14, v6

    const/16 v5, 0x2710

    if-gt v14, v5, :cond_8

    if-eqz v7, :cond_8

    if-eqz v8, :cond_8

    if-eqz v9, :cond_8

    if-eqz v10, :cond_8

    invoke-virtual/range {p10 .. p10}, Ljava/lang/String;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_8

    invoke-virtual/range {p10 .. p10}, Ljava/lang/String;->length()I

    move-result v14

    const/16 v5, 0x80

    if-gt v14, v5, :cond_8

    if-eqz v11, :cond_8

    invoke-virtual/range {p11 .. p11}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_8

    invoke-virtual/range {p11 .. p11}, Ljava/lang/String;->length()I

    move-result v5

    const v14, 0xafc8

    if-gt v5, v14, :cond_8

    if-ltz v12, :cond_8

    array-length v5, v6

    if-gt v12, v5, :cond_8

    .line 9
    if-eqz v13, :cond_4

    invoke-virtual/range {p7 .. p7}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v13, 0x16b

    if-gt v5, v13, :cond_3

    const-string v5, "|(?:0|[1-9][0-9]*)(/(?:0|[1-9][0-9]*))*"

    invoke-virtual {v7, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    const-string v5, "/"

    invoke-virtual {v7, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    array-length v5, v5

    const/16 v13, 0x21

    if-gt v5, v13, :cond_3

    invoke-virtual/range {p8 .. p8}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3

    invoke-virtual/range {p8 .. p8}, Ljava/lang/String;->length()I

    move-result v5

    const v13, 0x9c40

    if-gt v5, v13, :cond_3

    invoke-virtual {v9, v15}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    goto :goto_2

    :cond_3
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u043e\u0435 \u043d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u0435 \u0432\u0441\u0442\u0430\u0432\u043a\u0438"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_4
    invoke-virtual/range {p7 .. p7}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-virtual/range {p8 .. p8}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-virtual/range {p9 .. p9}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 10
    :goto_2
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    array-length v13, v6

    const/4 v14, 0x0

    :goto_3
    if-ge v14, v13, :cond_6

    aget v15, v6, v14

    if-ltz v15, :cond_5

    const/16 v6, 0x2710

    if-ge v15, v6, :cond_5

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-interface {v5, v15}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_5

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v6, p6

    goto :goto_3

    :cond_5
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0432\u044b\u0431\u043e\u0440 \u043f\u043e\u0434\u0442\u0432\u0435\u0440\u0436\u0434\u0435\u043d\u0438\u044f"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 11
    :cond_6
    iput-wide v1, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->project:J

    iput-object v3, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->action:Ljava/lang/String;

    iput-object v4, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->token:Ljava/lang/String;

    move-object/from16 v1, p5

    iput-object v1, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->session:Ljava/lang/String;

    invoke-virtual/range {p6 .. p6}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->indices:[I

    iput-object v7, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->destination:Ljava/lang/String;

    iput-object v8, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->destinationLabel:Ljava/lang/String;

    iput-object v9, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->fingerprint:Ljava/lang/String;

    iput-object v10, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->title:Ljava/lang/String;

    iput-object v11, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->message:Ljava/lang/String;

    iput v12, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->outside:I

    .line 12
    return-void

    .line 9
    :cond_7
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041b\u0438\u0448\u043d\u0435\u0435 \u043d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u0435 \u043f\u043e\u0434\u0442\u0432\u0435\u0440\u0436\u0434\u0435\u043d\u0438\u044f"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 8
    :cond_8
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u043e\u0435 \u043f\u043e\u0434\u0442\u0432\u0435\u0440\u0436\u0434\u0435\u043d\u0438\u0435"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static capture(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/Collection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lorg/rabochaya/projects/ObjectConfirmationDraft;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/lang/String;",
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
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I)",
            "Lorg/rabochaya/projects/ObjectConfirmationDraft;"
        }
    .end annotation

    .line 15
    new-instance v13, Lorg/rabochaya/projects/ObjectConfirmationDraft;

    move-wide v0, p0

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    invoke-static/range {v0 .. v5}, Lorg/rabochaya/projects/ObjectSelectionState;->capture(JLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/Collection;)Lorg/rabochaya/projects/ObjectSelectionState;

    move-result-object v0

    invoke-virtual {v0}, Lorg/rabochaya/projects/ObjectSelectionState;->indices()[I

    move-result-object v6

    move-object v0, v13

    move-wide v1, p0

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v11, p11

    move/from16 v12, p12

    invoke-direct/range {v0 .. v12}, Lorg/rabochaya/projects/ObjectConfirmationDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;[ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v13
.end method


# virtual methods
.method public inSession(JLjava/lang/String;)Z
    .locals 2

    .line 14
    iget-wide v0, p0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->project:J

    cmp-long p1, v0, p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->session:Ljava/lang/String;

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

    .line 13
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->indices:[I

    invoke-virtual {v0}, [I->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public paste()Z
    .locals 2

    .line 13
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->action:Ljava/lang/String;

    const-string v1, "pastecopy"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->action:Ljava/lang/String;

    const-string v1, "pastecut"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public restore(JLorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Lorg/w3c/dom/Element;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 17
    invoke-virtual {p0, p1, p2, p4}, Lorg/rabochaya/projects/ObjectConfirmationDraft;->inSession(JLjava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Lorg/rabochaya/projects/ObjectConfirmationDraft;->paste()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->fingerprint:Ljava/lang/String;

    invoke-virtual {v0, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-nez p5, :cond_0

    goto/16 :goto_3

    .line 18
    :cond_0
    new-instance p5, Lorg/rabochaya/projects/ObjectSelectionState;

    iget-wide v1, p0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->project:J

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->token:Ljava/lang/String;

    iget-object v4, p0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->session:Ljava/lang/String;

    iget-object v5, p0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->indices:[I

    move-object v0, p5

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/ObjectSelectionState;-><init>(JLjava/lang/String;Ljava/lang/String;[I)V

    invoke-virtual {p5, p1, p2, p3, p4}, Lorg/rabochaya/projects/ObjectSelectionState;->restore(JLorg/w3c/dom/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_8

    invoke-virtual {p0}, Lorg/rabochaya/projects/ObjectConfirmationDraft;->paste()Z

    move-result p2

    if-nez p2, :cond_1

    goto/16 :goto_2

    .line 19
    :cond_1
    :try_start_0
    iget-object p2, p0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->destination:Ljava/lang/String;

    invoke-static {p3, p2}, Lorg/rabochaya/projects/ObjectTree;->resolve(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->destination:Ljava/lang/String;

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

    iget-object p5, p4, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->destination:Ljava/lang/String;

    invoke-virtual {p5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_2

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

    iget-object p4, p0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->destination:Ljava/lang/String;

    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-nez p4, :cond_6

    iget-object p4, p0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->destination:Ljava/lang/String;

    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string p5, "/"

    invoke-virtual {p3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

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

    .line 18
    :cond_8
    :goto_2
    return-object p1

    .line 17
    :cond_9
    :goto_3
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1
.end method
