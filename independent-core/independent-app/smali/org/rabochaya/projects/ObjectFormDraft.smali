.class public final Lorg/rabochaya/projects/ObjectFormDraft;
.super Ljava/lang/Object;
.source "ObjectFormDraft.java"


# instance fields
.field private final checks:[Z

.field private final choices:[I

.field private final ends:[I

.field public final error:Ljava/lang/String;

.field public final focus:I

.field public final kind:Ljava/lang/String;

.field public final project:J

.field private final starts:[I

.field private final texts:[Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;[Ljava/lang/String;[I[II[I[ZLjava/lang/String;)V
    .locals 18

    .line 6
    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const-string v11, "search"

    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    const-string v12, "dates"

    invoke-virtual {v12, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    const/4 v14, 0x1

    if-eqz v11, :cond_0

    move v15, v14

    goto :goto_0

    :cond_0
    const/4 v15, 0x2

    .line 8
    :goto_0
    const-wide/16 v16, 0x0

    cmp-long v16, v1, v16

    if-lez v16, :cond_a

    if-nez v11, :cond_1

    if-eqz v12, :cond_a

    :cond_1
    if-eqz v4, :cond_a

    if-eqz v5, :cond_a

    if-eqz v6, :cond_a

    if-eqz v8, :cond_a

    if-eqz v9, :cond_a

    if-eqz v10, :cond_a

    invoke-virtual/range {p10 .. p10}, Ljava/lang/String;->length()I

    move-result v12

    const/16 v13, 0x400

    if-gt v12, v13, :cond_a

    array-length v12, v4

    if-ne v12, v15, :cond_a

    array-length v12, v5

    if-ne v12, v15, :cond_a

    array-length v12, v6

    if-ne v12, v15, :cond_a

    array-length v12, v8

    if-eqz v11, :cond_2

    const/4 v14, 0x4

    :cond_2
    if-ne v12, v14, :cond_a

    array-length v12, v9

    const/4 v13, 0x0

    if-eqz v11, :cond_3

    const/4 v14, 0x2

    goto :goto_1

    :cond_3
    move v14, v13

    :goto_1
    if-ne v12, v14, :cond_a

    const/4 v12, -0x1

    if-lt v7, v12, :cond_a

    if-ge v7, v15, :cond_a

    .line 9
    iput-wide v1, v0, Lorg/rabochaya/projects/ObjectFormDraft;->project:J

    iput-object v3, v0, Lorg/rabochaya/projects/ObjectFormDraft;->kind:Ljava/lang/String;

    iput-object v10, v0, Lorg/rabochaya/projects/ObjectFormDraft;->error:Ljava/lang/String;

    iput v7, v0, Lorg/rabochaya/projects/ObjectFormDraft;->focus:I

    invoke-virtual/range {p4 .. p4}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    iput-object v1, v0, Lorg/rabochaya/projects/ObjectFormDraft;->texts:[Ljava/lang/String;

    invoke-virtual/range {p5 .. p5}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, v0, Lorg/rabochaya/projects/ObjectFormDraft;->starts:[I

    invoke-virtual/range {p6 .. p6}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, v0, Lorg/rabochaya/projects/ObjectFormDraft;->ends:[I

    invoke-virtual/range {p8 .. p8}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, v0, Lorg/rabochaya/projects/ObjectFormDraft;->choices:[I

    invoke-virtual/range {p9 .. p9}, [Z->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Z

    iput-object v1, v0, Lorg/rabochaya/projects/ObjectFormDraft;->checks:[Z

    .line 10
    move v1, v13

    :goto_2
    if-ge v1, v15, :cond_6

    aget-object v2, v4, v1

    if-eqz v2, :cond_5

    aget-object v2, v4, v1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v11, :cond_4

    const/16 v3, 0x100

    goto :goto_3

    :cond_4
    const/16 v3, 0xa

    :goto_3
    if-gt v2, v3, :cond_5

    iget-object v2, v0, Lorg/rabochaya/projects/ObjectFormDraft;->starts:[I

    aget v3, v5, v1

    aget-object v7, v4, v1

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v13, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    aput v3, v2, v1

    iget-object v2, v0, Lorg/rabochaya/projects/ObjectFormDraft;->ends:[I

    aget v3, v6, v1

    aget-object v7, v4, v1

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v13, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    aput v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_5
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0431\u043e\u043b\u044c\u0448\u043e\u0435 \u043f\u043e\u043b\u0435 \u0444\u043e\u0440\u043c\u044b"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 11
    :cond_6
    if-eqz v11, :cond_7

    sget-object v1, Lorg/rabochaya/projects/ObjectListing;->SEARCH_FIELDS:[Ljava/lang/String;

    array-length v1, v1

    sget-object v2, Lorg/rabochaya/projects/ObjectListing;->KINDS:[Ljava/lang/String;

    array-length v2, v2

    sget-object v3, Lorg/rabochaya/projects/ObjectListing;->VISIBILITY:[Ljava/lang/String;

    array-length v3, v3

    sget-object v4, Lorg/rabochaya/projects/ObjectListing;->SORTS:[Ljava/lang/String;

    array-length v4, v4

    filled-new-array {v1, v2, v3, v4}, [I

    move-result-object v1

    goto :goto_4

    :cond_7
    sget-object v1, Lorg/rabochaya/projects/KmlTimeFilter;->MODES:[Ljava/lang/String;

    array-length v1, v1

    filled-new-array {v1}, [I

    move-result-object v1

    :goto_4
    array-length v2, v1

    if-ge v13, v2, :cond_9

    aget v2, v8, v13

    if-ltz v2, :cond_8

    aget v2, v8, v13

    aget v3, v1, v13

    if-ge v2, v3, :cond_8

    add-int/lit8 v13, v13, 0x1

    goto :goto_4

    :cond_8
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0432\u0430\u0440\u0438\u0430\u043d\u0442 \u0444\u043e\u0440\u043c\u044b"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 12
    :cond_9
    return-void

    .line 8
    :cond_a
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u0444\u043e\u0440\u043c\u044b"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public appliesTo(J)Z
    .locals 2

    .line 13
    iget-wide v0, p0, Lorg/rabochaya/projects/ObjectFormDraft;->project:J

    cmp-long p1, p1, v0

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public checks()[Z
    .locals 1

    .line 14
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectFormDraft;->checks:[Z

    invoke-virtual {v0}, [Z->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Z

    return-object v0
.end method

.method public choices()[I
    .locals 1

    .line 14
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectFormDraft;->choices:[I

    invoke-virtual {v0}, [I->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public ends()[I
    .locals 1

    .line 14
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectFormDraft;->ends:[I

    invoke-virtual {v0}, [I->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public starts()[I
    .locals 1

    .line 14
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectFormDraft;->starts:[I

    invoke-virtual {v0}, [I->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public texts()[Ljava/lang/String;
    .locals 1

    .line 14
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectFormDraft;->texts:[Ljava/lang/String;

    invoke-virtual {v0}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method
