.class public final Lorg/rabochaya/projects/VertexEditDraft;
.super Ljava/lang/Object;
.source "VertexEditDraft.java"


# instance fields
.field public final addingHole:Z

.field public final end:I

.field public final error:Ljava/lang/String;

.field public final feature:Ljava/lang/String;

.field public final index:I

.field public final key:Ljava/lang/String;

.field public final mainStamp:Ljava/lang/String;

.field public final operation:Ljava/lang/String;

.field public final project:J

.field public final raw:Ljava/lang/String;

.field public final session:Ljava/lang/String;

.field public final start:I

.field public final token:Ljava/lang/String;

.field public final type:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;Ljava/lang/String;IILjava/lang/String;)V
    .locals 18

    .line 6
    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    move-object/from16 v11, p11

    move-object/from16 v12, p12

    move/from16 v13, p13

    move/from16 v14, p14

    move-object/from16 v15, p15

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const-wide/16 v16, 0x0

    cmp-long v16, v1, v16

    if-lez v16, :cond_6

    if-eqz v3, :cond_6

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->isEmpty()Z

    move-result v16

    if-nez v16, :cond_6

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v0, 0x1000

    if-gt v3, v0, :cond_5

    if-eqz v4, :cond_5

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v3, 0x80

    if-gt v0, v3, :cond_5

    if-eqz v5, :cond_5

    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v3, 0x200

    if-gt v0, v3, :cond_5

    const-string v0, "\\d+(?:\\.\\d+)*(?:/(?:outer|inner/\\d+))?"

    invoke-virtual {v5, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    if-eqz v6, :cond_5

    const-string v0, "[a-f0-9]{64}"

    invoke-virtual {v6, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    if-eqz v7, :cond_5

    invoke-virtual {v7, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "Point"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const-string v7, "Polygon"

    if-nez v3, :cond_0

    const-string v3, "LineString"

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    if-eqz v9, :cond_2

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    move-object/from16 v0, p0

    goto/16 :goto_1

    :cond_2
    :goto_0
    if-ltz v10, :cond_5

    const/16 v3, 0x2710

    if-ge v10, v3, :cond_5

    const-string v3, "replace"

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    const-string v7, "before"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    const-string v7, "after"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    :cond_3
    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    if-nez v10, :cond_1

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_4
    if-eqz v12, :cond_5

    invoke-virtual/range {p12 .. p12}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v3, 0x2000

    if-gt v0, v3, :cond_5

    if-ltz v13, :cond_5

    invoke-virtual/range {p12 .. p12}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v13, v0, :cond_5

    if-ltz v14, :cond_5

    invoke-virtual/range {p12 .. p12}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v14, v0, :cond_5

    if-eqz v15, :cond_5

    invoke-virtual/range {p15 .. p15}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v3, 0x800

    if-gt v0, v3, :cond_5

    .line 8
    move-object/from16 v0, p0

    iput-wide v1, v0, Lorg/rabochaya/projects/VertexEditDraft;->project:J

    move-object/from16 v1, p3

    iput-object v1, v0, Lorg/rabochaya/projects/VertexEditDraft;->feature:Ljava/lang/String;

    iput-object v4, v0, Lorg/rabochaya/projects/VertexEditDraft;->session:Ljava/lang/String;

    iput-object v5, v0, Lorg/rabochaya/projects/VertexEditDraft;->key:Ljava/lang/String;

    iput-object v6, v0, Lorg/rabochaya/projects/VertexEditDraft;->token:Ljava/lang/String;

    move-object/from16 v1, p7

    iput-object v1, v0, Lorg/rabochaya/projects/VertexEditDraft;->mainStamp:Ljava/lang/String;

    iput-object v8, v0, Lorg/rabochaya/projects/VertexEditDraft;->type:Ljava/lang/String;

    iput-boolean v9, v0, Lorg/rabochaya/projects/VertexEditDraft;->addingHole:Z

    iput v10, v0, Lorg/rabochaya/projects/VertexEditDraft;->index:I

    iput-object v11, v0, Lorg/rabochaya/projects/VertexEditDraft;->operation:Ljava/lang/String;

    iput-object v12, v0, Lorg/rabochaya/projects/VertexEditDraft;->raw:Ljava/lang/String;

    iput v13, v0, Lorg/rabochaya/projects/VertexEditDraft;->start:I

    iput v14, v0, Lorg/rabochaya/projects/VertexEditDraft;->end:I

    iput-object v15, v0, Lorg/rabochaya/projects/VertexEditDraft;->error:Ljava/lang/String;

    .line 9
    return-void

    .line 7
    :cond_5
    move-object/from16 v0, p0

    :cond_6
    :goto_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0432\u0432\u043e\u0434 \u0432\u0435\u0440\u0448\u0438\u043d\u044b"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static stamp(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    .line 10
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const v1, 0x7a120

    if-gt v0, v1, :cond_1

    :try_start_0
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    array-length v1, p0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_0

    aget-byte v4, p0, v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "%02x"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v7, v2

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0438\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u0432\u0432\u043e\u0434"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public inSession(JLjava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .line 12
    iget-wide v0, p0, Lorg/rabochaya/projects/VertexEditDraft;->project:J

    cmp-long p1, v0, p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/VertexEditDraft;->feature:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/VertexEditDraft;->session:Ljava/lang/String;

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

.method public matches(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Z
    .locals 0

    .line 13
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/rabochaya/projects/VertexEditDraft;->inSession(JLjava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/VertexEditDraft;->key:Ljava/lang/String;

    invoke-virtual {p1, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/VertexEditDraft;->token:Ljava/lang/String;

    invoke-virtual {p1, p6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/VertexEditDraft;->type:Ljava/lang/String;

    invoke-virtual {p1, p7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lorg/rabochaya/projects/VertexEditDraft;->addingHole:Z

    if-ne p1, p8, :cond_0

    if-eqz p9, :cond_0

    invoke-virtual {p9}, Ljava/lang/String;->length()I

    move-result p1

    const p2, 0x7a120

    if-gt p1, p2, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/VertexEditDraft;->mainStamp:Ljava/lang/String;

    invoke-static {p9}, Lorg/rabochaya/projects/VertexEditDraft;->stamp(Ljava/lang/String;)Ljava/lang/String;

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

.method public withUi(Ljava/lang/String;IILjava/lang/String;)Lorg/rabochaya/projects/VertexEditDraft;
    .locals 18

    .line 11
    move-object/from16 v0, p0

    new-instance v17, Lorg/rabochaya/projects/VertexEditDraft;

    iget-wide v2, v0, Lorg/rabochaya/projects/VertexEditDraft;->project:J

    iget-object v4, v0, Lorg/rabochaya/projects/VertexEditDraft;->feature:Ljava/lang/String;

    iget-object v5, v0, Lorg/rabochaya/projects/VertexEditDraft;->session:Ljava/lang/String;

    iget-object v6, v0, Lorg/rabochaya/projects/VertexEditDraft;->key:Ljava/lang/String;

    iget-object v7, v0, Lorg/rabochaya/projects/VertexEditDraft;->token:Ljava/lang/String;

    iget-object v8, v0, Lorg/rabochaya/projects/VertexEditDraft;->mainStamp:Ljava/lang/String;

    iget-object v9, v0, Lorg/rabochaya/projects/VertexEditDraft;->type:Ljava/lang/String;

    iget-boolean v10, v0, Lorg/rabochaya/projects/VertexEditDraft;->addingHole:Z

    iget v11, v0, Lorg/rabochaya/projects/VertexEditDraft;->index:I

    iget-object v12, v0, Lorg/rabochaya/projects/VertexEditDraft;->operation:Ljava/lang/String;

    move-object/from16 v1, v17

    move-object/from16 v13, p1

    move/from16 v14, p2

    move/from16 v15, p3

    move-object/from16 v16, p4

    invoke-direct/range {v1 .. v16}, Lorg/rabochaya/projects/VertexEditDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;Ljava/lang/String;IILjava/lang/String;)V

    return-object v17
.end method
