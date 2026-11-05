.class public final Lorg/rabochaya/projects/GeometryConfirmationDraft;
.super Ljava/lang/Object;
.source "GeometryConfirmationDraft.java"


# instance fields
.field public final addingHole:Z

.field public final feature:Ljava/lang/String;

.field public final hole:Z

.field public final index:I

.field public final key:Ljava/lang/String;

.field public final kind:Ljava/lang/String;

.field public final mainStamp:Ljava/lang/String;

.field public final onMap:Z

.field public final project:J

.field public final session:Ljava/lang/String;

.field public final token:Ljava/lang/String;

.field public final type:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V
    .locals 13

    .line 5
    const/4 v12, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move/from16 v10, p10

    move/from16 v11, p11

    invoke-direct/range {v0 .. v12}, Lorg/rabochaya/projects/GeometryConfirmationDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZIZ)V

    return-void
.end method

.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZIZ)V
    .locals 16

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

    move/from16 v10, p10

    move/from16 v11, p11

    move/from16 v12, p12

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const-wide/16 v13, 0x0

    cmp-long v13, v1, v13

    if-lez v13, :cond_8

    if-eqz v3, :cond_8

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_8

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v13

    const/16 v14, 0x1000

    if-gt v13, v14, :cond_8

    if-eqz v4, :cond_8

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_8

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->length()I

    move-result v13

    const/16 v14, 0x80

    if-gt v13, v14, :cond_8

    if-eqz v5, :cond_8

    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->length()I

    move-result v13

    const/16 v14, 0x200

    if-gt v13, v14, :cond_8

    const-string v13, "\\d+(?:\\.\\d+)*(?:/(?:outer|inner/\\d+))?"

    invoke-virtual {v5, v13}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_8

    if-eqz v6, :cond_8

    const-string v13, "[a-f0-9]{64}"

    invoke-virtual {v6, v13}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_8

    if-eqz v7, :cond_8

    invoke-virtual {v7, v13}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_8

    const-string v13, "LineString"

    invoke-virtual {v13, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    const-string v15, "Polygon"

    if-nez v14, :cond_0

    invoke-virtual {v15, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_8

    :cond_0
    invoke-virtual {v13, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    const-string v13, "/"

    invoke-virtual {v5, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_8

    :cond_1
    const-string v13, "vertex"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    const-string v7, "hole"

    if-nez v14, :cond_2

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_8

    :cond_2
    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3

    if-ltz v11, :cond_8

    const/16 v14, 0x2710

    if-ge v11, v14, :cond_8

    :cond_3
    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    const-string v14, "/inner/"

    if-eqz v7, :cond_4

    const/4 v7, -0x1

    if-ne v11, v7, :cond_8

    invoke-virtual {v15, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-virtual {v5, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_8

    if-nez v10, :cond_8

    :cond_4
    if-eqz v10, :cond_5

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-virtual {v15, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    const-string v7, "/outer"

    invoke-virtual {v5, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 8
    :cond_5
    if-eqz v12, :cond_7

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    goto :goto_0

    :cond_6
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041a\u0430\u0440\u0442\u0430 \u043f\u043e\u0434\u0442\u0432\u0435\u0440\u0436\u0434\u0430\u0435\u0442 \u0442\u043e\u043b\u044c\u043a\u043e \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u0443\u044e \u0432\u0435\u0440\u0448\u0438\u043d\u0443"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 9
    :cond_7
    :goto_0
    iput-boolean v12, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->onMap:Z

    iput-wide v1, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->project:J

    iput-object v3, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->feature:Ljava/lang/String;

    iput-object v4, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->session:Ljava/lang/String;

    iput-object v5, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->key:Ljava/lang/String;

    iput-object v6, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->token:Ljava/lang/String;

    move-object/from16 v1, p7

    iput-object v1, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->mainStamp:Ljava/lang/String;

    iput-object v8, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->type:Ljava/lang/String;

    iput-object v9, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->kind:Ljava/lang/String;

    iput-boolean v10, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->addingHole:Z

    invoke-virtual {v5, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    iput-boolean v1, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->hole:Z

    iput v11, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->index:I

    .line 10
    return-void

    .line 7
    :cond_8
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u043e\u0435 \u043d\u0430\u043c\u0435\u0440\u0435\u043d\u0438\u0435 \u0443\u0434\u0430\u043b\u0435\u043d\u0438\u044f \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u0438"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public inSession(JLjava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .line 11
    iget-wide v0, p0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->project:J

    cmp-long p1, v0, p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->feature:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->session:Ljava/lang/String;

    invoke-virtual {p1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public matches(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)Z
    .locals 0

    .line 12
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/rabochaya/projects/GeometryConfirmationDraft;->inSession(JLjava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->key:Ljava/lang/String;

    invoke-virtual {p1, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->token:Ljava/lang/String;

    invoke-virtual {p1, p6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->type:Ljava/lang/String;

    invoke-virtual {p1, p7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->hole:Z

    if-ne p1, p8, :cond_0

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->addingHole:Z

    if-ne p1, p9, :cond_0

    if-eqz p10, :cond_0

    invoke-virtual {p10}, Ljava/lang/String;->length()I

    move-result p1

    const p2, 0x7a120

    if-gt p1, p2, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->mainStamp:Ljava/lang/String;

    invoke-static {p10}, Lorg/rabochaya/projects/VertexEditDraft;->stamp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
