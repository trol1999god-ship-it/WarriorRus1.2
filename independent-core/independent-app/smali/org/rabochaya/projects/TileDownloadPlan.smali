.class public final Lorg/rabochaya/projects/TileDownloadPlan;
.super Ljava/lang/Object;
.source "TileDownloadPlan.java"


# instance fields
.field public final count:J

.field public final regions:[Lorg/rabochaya/projects/TileRegion;

.field public final sources:[Lorg/rabochaya/projects/TileSource;


# direct methods
.method public constructor <init>(Lorg/rabochaya/projects/TileSource;DDDDII)V
    .locals 25

    .line 6
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p10

    move/from16 v3, p11

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 7
    iget v4, v1, Lorg/rabochaya/projects/TileSource;->minZoom:I

    if-lt v2, v4, :cond_6

    iget v4, v1, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    if-gt v3, v4, :cond_6

    if-gt v2, v3, :cond_6

    .line 8
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 9
    invoke-virtual/range {p1 .. p1}, Lorg/rabochaya/projects/TileSource;->leafs()[Lorg/rabochaya/projects/TileSource;

    move-result-object v1

    array-length v6, v1

    const-wide/16 v8, 0x0

    const/4 v10, 0x0

    :goto_0
    if-ge v10, v6, :cond_4

    aget-object v11, v1, v10

    iget v12, v11, Lorg/rabochaya/projects/TileSource;->minZoom:I

    invoke-static {v2, v12}, Ljava/lang/Math;->max(II)I

    move-result v12

    iget v13, v11, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    invoke-static {v3, v13}, Ljava/lang/Math;->min(II)I

    move-result v14

    if-le v12, v14, :cond_0

    goto :goto_2

    :cond_0
    move v13, v12

    :goto_1
    if-gt v13, v14, :cond_2

    invoke-virtual {v11, v13}, Lorg/rabochaya/projects/TileSource;->canDownload(I)Z

    move-result v15

    if-eqz v15, :cond_1

    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u0418\u0441\u0442\u043e\u0447\u043d\u0438\u043a \u00ab"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v11, Lorg/rabochaya/projects/TileSource;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\u00bb \u043d\u0435 \u0440\u0430\u0437\u0440\u0435\u0448\u0430\u0435\u0442 \u0441\u043a\u0430\u0447\u0438\u0432\u0430\u043d\u0438\u0435 \u043e\u0431\u043b\u0430\u0441\u0442\u0438 \u043d\u0430 z"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; \u043f\u0440\u043e\u0441\u043c\u043e\u0442\u0440\u0435\u043d\u043d\u044b\u0439 \u043a\u0435\u0448 \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u0435\u0442\u0441\u044f \u0430\u0432\u0442\u043e\u043c\u0430\u0442\u0438\u0447\u0435\u0441\u043a\u0438"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_2
    new-instance v15, Lorg/rabochaya/projects/TileRegion;

    iget-boolean v13, v11, Lorg/rabochaya/projects/TileSource;->ellipsoid:Z

    move/from16 v24, v13

    move-object v13, v15

    move/from16 v23, v14

    move-object v7, v15

    move-wide/from16 v14, p2

    move-wide/from16 v16, p4

    move-wide/from16 v18, p6

    move-wide/from16 v20, p8

    move/from16 v22, v12

    invoke-direct/range {v13 .. v24}, Lorg/rabochaya/projects/TileRegion;-><init>(DDDDIIZ)V

    iget-wide v12, v7, Lorg/rabochaya/projects/TileRegion;->count:J

    add-long/2addr v8, v12

    const-wide/16 v12, 0x4e20

    cmp-long v12, v8, v12

    if-gtz v12, :cond_3

    invoke-virtual {v4, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_2
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    :cond_3
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u0421\u0443\u043c\u043c\u0430\u0440\u043d\u043e \u0432\u043e \u0432\u0441\u0435\u0445 \u0441\u043b\u043e\u044f\u0445 \u0431\u043e\u043b\u044c\u0448\u0435 20 000 \u0442\u0430\u0439\u043b\u043e\u0432"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 10
    :cond_4
    const-wide/16 v1, 0x1

    cmp-long v1, v8, v1

    if-ltz v1, :cond_5

    iput-wide v8, v0, Lorg/rabochaya/projects/TileDownloadPlan;->count:J

    const/4 v1, 0x0

    new-array v2, v1, [Lorg/rabochaya/projects/TileSource;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lorg/rabochaya/projects/TileSource;

    iput-object v2, v0, Lorg/rabochaya/projects/TileDownloadPlan;->sources:[Lorg/rabochaya/projects/TileSource;

    new-array v1, v1, [Lorg/rabochaya/projects/TileRegion;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lorg/rabochaya/projects/TileRegion;

    iput-object v1, v0, Lorg/rabochaya/projects/TileDownloadPlan;->regions:[Lorg/rabochaya/projects/TileRegion;

    .line 11
    return-void

    .line 10
    :cond_5
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u0412 \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0445 \u043c\u0430\u0441\u0448\u0442\u0430\u0431\u0430\u0445 \u043d\u0435\u0442 \u0442\u0430\u0439\u043b\u043e\u0432"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 7
    :cond_6
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u041c\u0430\u0441\u0448\u0442\u0430\u0431\u044b \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a\u0430: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v1, Lorg/rabochaya/projects/TileSource;->minZoom:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\u2013"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v1, v1, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
