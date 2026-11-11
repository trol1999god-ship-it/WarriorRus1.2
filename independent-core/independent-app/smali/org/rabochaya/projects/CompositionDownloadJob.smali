.class public final Lorg/rabochaya/projects/CompositionDownloadJob;
.super Ljava/lang/Object;
.source "CompositionDownloadJob.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/CompositionDownloadJob$Task;
    }
.end annotation


# instance fields
.field public final completed:I

.field public final composition:Lorg/rabochaya/projects/MapComposition;

.field public final east:D

.field public final generation:Ljava/lang/String;

.field public final max:I

.field public final min:I

.field public final north:D

.field private final sourceStamp:Ljava/lang/String;

.field public final south:D

.field public final tasks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/CompositionDownloadJob$Task;",
            ">;"
        }
    .end annotation
.end field

.field public final west:D


# direct methods
.method private constructor <init>(Lorg/rabochaya/projects/CompositionDownloadJob;I)V
    .locals 2

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-ltz p2, :cond_0

    iget-object v0, p1, Lorg/rabochaya/projects/CompositionDownloadJob;->tasks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gt p2, v0, :cond_0

    iget-object v0, p1, Lorg/rabochaya/projects/CompositionDownloadJob;->composition:Lorg/rabochaya/projects/MapComposition;

    iput-object v0, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->composition:Lorg/rabochaya/projects/MapComposition;

    iget-wide v0, p1, Lorg/rabochaya/projects/CompositionDownloadJob;->west:D

    iput-wide v0, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->west:D

    iget-wide v0, p1, Lorg/rabochaya/projects/CompositionDownloadJob;->south:D

    iput-wide v0, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->south:D

    iget-wide v0, p1, Lorg/rabochaya/projects/CompositionDownloadJob;->east:D

    iput-wide v0, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->east:D

    iget-wide v0, p1, Lorg/rabochaya/projects/CompositionDownloadJob;->north:D

    iput-wide v0, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->north:D

    iget v0, p1, Lorg/rabochaya/projects/CompositionDownloadJob;->min:I

    iput v0, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->min:I

    iget v0, p1, Lorg/rabochaya/projects/CompositionDownloadJob;->max:I

    iput v0, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->max:I

    iput p2, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->completed:I

    iget-object p2, p1, Lorg/rabochaya/projects/CompositionDownloadJob;->generation:Ljava/lang/String;

    iput-object p2, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->generation:Ljava/lang/String;

    iget-object p2, p1, Lorg/rabochaya/projects/CompositionDownloadJob;->tasks:Ljava/util/List;

    iput-object p2, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->tasks:Ljava/util/List;

    iget-object p1, p1, Lorg/rabochaya/projects/CompositionDownloadJob;->sourceStamp:Ljava/lang/String;

    iput-object p1, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->sourceStamp:Ljava/lang/String;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 \u043f\u0440\u043e\u0433\u0440\u0435\u0441\u0441 \u0437\u0430\u0434\u0430\u043d\u0438\u044f"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Lorg/rabochaya/projects/MapComposition;DDDDII)V
    .locals 16

    .line 7
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    const/4 v13, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-wide/from16 v3, p2

    move-wide/from16 v5, p4

    move-wide/from16 v7, p6

    move-wide/from16 v9, p8

    move/from16 v11, p10

    move/from16 v12, p11

    invoke-direct/range {v1 .. v15}, Lorg/rabochaya/projects/CompositionDownloadJob;-><init>(Lorg/rabochaya/projects/MapComposition;DDDDIIILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private constructor <init>(Lorg/rabochaya/projects/MapComposition;DDDDIIILjava/lang/String;Ljava/lang/String;)V
    .locals 31

    .line 8
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p10

    move/from16 v3, p11

    move/from16 v4, p12

    move-object/from16 v5, p13

    move-object/from16 v6, p14

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 9
    if-eqz v1, :cond_b

    if-ltz v2, :cond_b

    const/16 v7, 0x17

    if-gt v3, v7, :cond_b

    if-gt v2, v3, :cond_b

    if-eqz v5, :cond_b

    const-string v7, "[a-f0-9-]{36}"

    invoke-virtual {v5, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_b

    new-instance v8, Lorg/rabochaya/projects/TileRegion;

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-wide/from16 v9, p2

    move-wide/from16 v11, p4

    move-wide/from16 v13, p6

    move-wide/from16 v15, p8

    invoke-direct/range {v8 .. v18}, Lorg/rabochaya/projects/TileRegion;-><init>(DDDDII)V

    .line 10
    iput-object v1, v0, Lorg/rabochaya/projects/CompositionDownloadJob;->composition:Lorg/rabochaya/projects/MapComposition;

    move-wide/from16 v7, p2

    iput-wide v7, v0, Lorg/rabochaya/projects/CompositionDownloadJob;->west:D

    move-wide/from16 v9, p4

    iput-wide v9, v0, Lorg/rabochaya/projects/CompositionDownloadJob;->south:D

    move-wide/from16 v11, p6

    iput-wide v11, v0, Lorg/rabochaya/projects/CompositionDownloadJob;->east:D

    move-wide/from16 v13, p8

    iput-wide v13, v0, Lorg/rabochaya/projects/CompositionDownloadJob;->north:D

    iput v2, v0, Lorg/rabochaya/projects/CompositionDownloadJob;->min:I

    iput v3, v0, Lorg/rabochaya/projects/CompositionDownloadJob;->max:I

    iput-object v5, v0, Lorg/rabochaya/projects/CompositionDownloadJob;->generation:Ljava/lang/String;

    .line 11
    new-instance v5, Ljava/util/LinkedHashMap;

    invoke-direct {v5}, Ljava/util/LinkedHashMap;-><init>()V

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    iget-object v1, v1, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 p1, v1

    move-object/from16 v1, v16

    check-cast v1, Lorg/rabochaya/projects/MapComposition$Layer;

    iget-boolean v7, v1, Lorg/rabochaya/projects/MapComposition$Layer;->visible:Z

    if-eqz v7, :cond_6

    iget v7, v1, Lorg/rabochaya/projects/MapComposition$Layer;->opacity:I

    if-lez v7, :cond_6

    invoke-virtual {v1}, Lorg/rabochaya/projects/MapComposition$Layer;->source()Lorg/rabochaya/projects/TileSource;

    move-result-object v7

    if-nez v7, :cond_1

    const-string v7, "catalog"

    iget-object v8, v1, Lorg/rabochaya/projects/MapComposition$Layer;->kind:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    const-string v7, "custom"

    iget-object v8, v1, Lorg/rabochaya/projects/MapComposition$Layer;->kind:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    move-object/from16 v1, p1

    move-wide/from16 v7, p2

    goto :goto_0

    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u0418\u0441\u0442\u043e\u0447\u043d\u0438\u043a \u0431\u043e\u043b\u044c\u0448\u0435 \u043d\u0435 \u043d\u0430\u0439\u0434\u0435\u043d: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v1, v1, Lorg/rabochaya/projects/MapComposition$Layer;->name:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 13
    :cond_1
    invoke-virtual {v7}, Lorg/rabochaya/projects/TileSource;->leafs()[Lorg/rabochaya/projects/TileSource;

    move-result-object v1

    array-length v7, v1

    const/4 v8, 0x0

    :goto_1
    if-ge v8, v7, :cond_6

    move/from16 v16, v7

    aget-object v7, v1, v8

    move-object/from16 v17, v1

    iget v1, v7, Lorg/rabochaya/projects/TileSource;->minZoom:I

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget v2, v7, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    if-le v1, v2, :cond_2

    const/4 v10, 0x0

    goto/16 :goto_3

    :cond_2
    iget-object v3, v7, Lorg/rabochaya/projects/TileSource;->id:Ljava/lang/String;

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v9, 0x3a

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v9, v7, Lorg/rabochaya/projects/TileSource;->ellipsoid:Z

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v9, 0xa

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    new-instance v3, Lorg/rabochaya/projects/TileDownloadPlan;

    move-object/from16 v19, v3

    move-object/from16 v20, v7

    move-wide/from16 v21, p2

    move-wide/from16 v23, p4

    move-wide/from16 v25, p6

    move-wide/from16 v27, p8

    move/from16 v29, v1

    move/from16 v30, v2

    invoke-direct/range {v19 .. v30}, Lorg/rabochaya/projects/TileDownloadPlan;-><init>(Lorg/rabochaya/projects/TileSource;DDDDII)V

    iget-object v1, v3, Lorg/rabochaya/projects/TileDownloadPlan;->regions:[Lorg/rabochaya/projects/TileRegion;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lorg/rabochaya/projects/TileRegion;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, v7, Lorg/rabochaya/projects/TileSource;->id:Ljava/lang/String;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v9, "/"

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 p13, v1

    const/4 v10, 0x0

    aget v1, v2, v10

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v3, 0x1

    aget v3, v2, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v3, 0x2

    aget v3, v2, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    new-instance v3, Lorg/rabochaya/projects/CompositionDownloadJob$Task;

    invoke-direct {v3, v7, v2}, Lorg/rabochaya/projects/CompositionDownloadJob$Task;-><init>(Lorg/rabochaya/projects/TileSource;[I)V

    invoke-virtual {v5, v1, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->size()I

    move-result v1

    int-to-long v1, v1

    const-wide/16 v18, 0x4e20

    cmp-long v1, v1, v18

    if-gtz v1, :cond_4

    move-object/from16 v1, p13

    goto :goto_2

    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u0412 \u0441\u043e\u0441\u0442\u0430\u0432\u0435 \u0431\u043e\u043b\u044c\u0448\u0435 20 000 \u0443\u043d\u0438\u043a\u0430\u043b\u044c\u043d\u044b\u0445 \u0442\u0430\u0439\u043b\u043e\u0432"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_5
    const/4 v10, 0x0

    :goto_3
    add-int/lit8 v8, v8, 0x1

    move-wide/from16 v9, p4

    move/from16 v2, p10

    move/from16 v3, p11

    move/from16 v7, v16

    move-object/from16 v1, v17

    goto/16 :goto_1

    .line 12
    :cond_6
    move-object/from16 v1, p1

    move-wide/from16 v7, p2

    move-wide/from16 v9, p4

    move/from16 v2, p10

    move/from16 v3, p11

    goto/16 :goto_0

    .line 15
    :cond_7
    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_a

    if-ltz v4, :cond_a

    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->size()I

    move-result v1

    if-gt v4, v1, :cond_a

    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lorg/rabochaya/projects/CompositionDownloadJob;->tasks:Ljava/util/List;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-static {v1}, Lorg/rabochaya/projects/CompositionDownloadJob;->hash([B)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/rabochaya/projects/CompositionDownloadJob;->sourceStamp:Ljava/lang/String;

    if-eqz v6, :cond_9

    iget-object v1, v0, Lorg/rabochaya/projects/CompositionDownloadJob;->sourceStamp:Ljava/lang/String;

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    goto :goto_4

    :cond_8
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041a\u0430\u0442\u0430\u043b\u043e\u0433 \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a\u043e\u0432 \u0438\u0437\u043c\u0435\u043d\u0451\u043d; \u0441\u043e\u0437\u0434\u0430\u0439\u0442\u0435 \u043d\u043e\u0432\u043e\u0435 \u0437\u0430\u0434\u0430\u043d\u0438\u0435"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_9
    :goto_4
    iput v4, v0, Lorg/rabochaya/projects/CompositionDownloadJob;->completed:I

    .line 16
    return-void

    .line 15
    :cond_a
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041d\u0435\u0442 \u0434\u043e\u0441\u0442\u0443\u043f\u043d\u044b\u0445 \u043e\u043d\u043b\u0430\u0439\u043d-\u0441\u043b\u043e\u0451\u0432 \u0432 \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0445 \u043c\u0430\u0441\u0448\u0442\u0430\u0431\u0430\u0445"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 9
    :cond_b
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041f\u0440\u043e\u0432\u0435\u0440\u044c\u0442\u0435 \u0441\u043e\u0441\u0442\u0430\u0432 \u0438 \u043c\u0430\u0441\u0448\u0442\u0430\u0431\u044b \u0437\u0430\u0434\u0430\u043d\u0438\u044f"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static decode([BJ)Lorg/rabochaya/projects/CompositionDownloadJob;
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 22
    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    if-eqz v0, :cond_4

    array-length v3, v0

    const/16 v4, 0x96

    if-lt v3, v4, :cond_4

    array-length v3, v0

    const v4, 0x203a0

    if-gt v3, v4, :cond_4

    array-length v3, v0

    add-int/lit8 v3, v3, -0x40

    invoke-static {v0, v3}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v3

    invoke-static {v3}, Lorg/rabochaya/projects/CompositionDownloadJob;->hash([B)Ljava/lang/String;

    move-result-object v4

    const-string v5, "US-ASCII"

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    array-length v5, v0

    add-int/lit8 v5, v5, -0x40

    array-length v6, v0

    invoke-static {v0, v5, v6}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    invoke-static {v4, v0}, Ljava/security/MessageDigest;->isEqual([B[B)Z

    move-result v0

    if-eqz v0, :cond_3

    :try_start_0
    new-instance v4, Ljava/io/DataInputStream;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v4, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    const v3, 0x524b444a

    if-ne v0, v3, :cond_2

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    const/4 v3, 0x1

    if-ne v0, v3, :cond_2

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v5

    cmp-long v0, v5, v1

    if-nez v0, :cond_2

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    const/16 v3, 0x34

    if-lt v0, v3, :cond_1

    const/high16 v3, 0x20000

    if-gt v0, v3, :cond_1

    invoke-virtual {v4}, Ljava/io/DataInputStream;->available()I

    move-result v3

    if-gt v0, v3, :cond_1

    new-array v0, v0, [B

    invoke-virtual {v4, v0}, Ljava/io/DataInputStream;->readFully([B)V

    new-instance v3, Lorg/rabochaya/projects/CompositionDownloadJob;

    invoke-static {v0, v1, v2}, Lorg/rabochaya/projects/MapComposition;->decode([BJ)Lorg/rabochaya/projects/MapComposition;

    move-result-object v6

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readDouble()D

    move-result-wide v7

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readDouble()D

    move-result-wide v9

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readDouble()D

    move-result-wide v11

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readDouble()D

    move-result-wide v13

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v15

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v16

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v17

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v18

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v19

    move-object v5, v3

    invoke-direct/range {v5 .. v19}, Lorg/rabochaya/projects/CompositionDownloadJob;-><init>(Lorg/rabochaya/projects/MapComposition;DDDDIIILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/DataInputStream;->available()I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_0

    :try_start_2
    invoke-virtual {v4}, Ljava/io/DataInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0

    return-object v3

    :cond_0
    :try_start_3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041b\u0438\u0448\u043d\u0438\u0435 \u0434\u0430\u043d\u043d\u044b\u0435 \u0437\u0430\u0434\u0430\u043d\u0438\u044f"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_0
    throw v0

    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041f\u043e\u0432\u0440\u0435\u0436\u0434\u0451\u043d \u0441\u043e\u0441\u0442\u0430\u0432 \u0437\u0430\u0434\u0430\u043d\u0438\u044f"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0417\u0430\u0434\u0430\u043d\u0438\u0435 \u0434\u0440\u0443\u0433\u043e\u0433\u043e \u043f\u0440\u043e\u0435\u043a\u0442\u0430/\u0432\u0435\u0440\u0441\u0438\u0438"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object v1, v0

    :try_start_4
    invoke-virtual {v4}, Ljava/io/DataInputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v0

    move-object v2, v0

    :try_start_5
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw v1
    :try_end_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_5} :catch_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0432\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u0438\u0442\u044c \u0437\u0430\u0434\u0430\u043d\u0438\u0435: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0417\u0430\u0434\u0430\u043d\u0438\u0435 \u043f\u043e\u0432\u0440\u0435\u0436\u0434\u0435\u043d\u043e; \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u0439 \u043a\u0435\u0448 \u043d\u0435 \u0438\u0437\u043c\u0435\u043d\u0451\u043d"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440 \u0437\u0430\u0434\u0430\u043d\u0438\u044f"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static hash([B)Ljava/lang/String;
    .locals 8

    .line 20
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SHA-256"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0

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
.end method


# virtual methods
.method public encode()[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 21
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    const v2, 0x524b444a

    :try_start_0
    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    iget-object v2, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->composition:Lorg/rabochaya/projects/MapComposition;

    iget-wide v2, v2, Lorg/rabochaya/projects/MapComposition;->project:J

    invoke-virtual {v1, v2, v3}, Ljava/io/DataOutputStream;->writeLong(J)V

    iget-object v2, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->composition:Lorg/rabochaya/projects/MapComposition;

    invoke-virtual {v2}, Lorg/rabochaya/projects/MapComposition;->encode()[B

    move-result-object v2

    array-length v3, v2

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->write([B)V

    iget-wide v2, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->west:D

    invoke-virtual {v1, v2, v3}, Ljava/io/DataOutputStream;->writeDouble(D)V

    iget-wide v2, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->south:D

    invoke-virtual {v1, v2, v3}, Ljava/io/DataOutputStream;->writeDouble(D)V

    iget-wide v2, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->east:D

    invoke-virtual {v1, v2, v3}, Ljava/io/DataOutputStream;->writeDouble(D)V

    iget-wide v2, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->north:D

    invoke-virtual {v1, v2, v3}, Ljava/io/DataOutputStream;->writeDouble(D)V

    iget v2, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->min:I

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    iget v2, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->max:I

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    iget v2, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->completed:I

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    iget-object v2, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->generation:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->sourceStamp:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-static {v1}, Lorg/rabochaya/projects/CompositionDownloadJob;->hash([B)Ljava/lang/String;

    move-result-object v1

    const-string v2, "US-ASCII"

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write([B)V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v1

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw v0
.end method

.method public matches(Lorg/rabochaya/projects/MapComposition;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 19
    if-eqz p1, :cond_4

    iget-wide v0, p1, Lorg/rabochaya/projects/MapComposition;->project:J

    iget-object v2, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->composition:Lorg/rabochaya/projects/MapComposition;

    iget-wide v2, v2, Lorg/rabochaya/projects/MapComposition;->project:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    goto :goto_2

    :cond_0
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iget-object v1, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->composition:Lorg/rabochaya/projects/MapComposition;

    iget-object v1, v1, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/MapComposition$Layer;

    iget-object v2, v2, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, p1, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/rabochaya/projects/MapComposition$Layer;

    iget-object v4, v3, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lorg/rabochaya/projects/CompositionDownloadJob;->composition:Lorg/rabochaya/projects/MapComposition;

    invoke-virtual {v0}, Lorg/rabochaya/projects/MapComposition;->encode()[B

    move-result-object v0

    new-instance v2, Lorg/rabochaya/projects/MapComposition;

    iget-wide v3, p1, Lorg/rabochaya/projects/MapComposition;->project:J

    invoke-direct {v2, v3, v4, v1}, Lorg/rabochaya/projects/MapComposition;-><init>(JLjava/util/List;)V

    invoke-virtual {v2}, Lorg/rabochaya/projects/MapComposition;->encode()[B

    move-result-object p1

    invoke-static {v0, p1}, Ljava/security/MessageDigest;->isEqual([B[B)Z

    move-result p1

    return p1

    :cond_4
    :goto_2
    const/4 p1, 0x0

    return p1
.end method

.method public progress(I)Lorg/rabochaya/projects/CompositionDownloadJob;
    .locals 1

    .line 18
    new-instance v0, Lorg/rabochaya/projects/CompositionDownloadJob;

    invoke-direct {v0, p0, p1}, Lorg/rabochaya/projects/CompositionDownloadJob;-><init>(Lorg/rabochaya/projects/CompositionDownloadJob;I)V

    return-object v0
.end method
