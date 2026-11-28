.class public final Lorg/rabochaya/projects/MapComposition$Layer;
.super Ljava/lang/Object;
.source "MapComposition.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/MapComposition;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Layer"
.end annotation


# instance fields
.field public final attribution:Ljava/lang/String;

.field public final downloads:Z

.field public final id:Ljava/lang/String;

.field public final key:Ljava/lang/String;

.field public final kind:Ljava/lang/String;

.field public final maxZoom:I

.field public final minZoom:I

.field public final name:Ljava/lang/String;

.field public final opacity:I

.field public final template:Ljava/lang/String;

.field public final visible:Z


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZZI)V
    .locals 16

    .line 9
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v11, p4

    move-object/from16 v12, p5

    move-object/from16 v13, p6

    move/from16 v14, p7

    move/from16 v15, p8

    move/from16 v10, p9

    move/from16 v9, p11

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 10
    if-eqz v1, :cond_5

    const-string v4, "[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}"

    invoke-virtual {v1, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    const-string v4, "local"

    const-string v5, "bundled"

    const-string v6, "catalog"

    const-string v7, "custom"

    filled-new-array {v6, v7, v4, v5}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    if-eqz v3, :cond_5

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x80

    if-gt v4, v5, :cond_5

    if-eqz v11, :cond_5

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_5

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x64

    if-gt v4, v5, :cond_5

    if-eqz v12, :cond_5

    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v8, 0x800

    if-gt v4, v8, :cond_5

    if-eqz v13, :cond_5

    invoke-virtual/range {p6 .. p6}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v8, 0x1f4

    if-gt v4, v8, :cond_5

    if-ltz v9, :cond_5

    if-gt v9, v5, :cond_5

    .line 11
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string v4, "[A-Z0-9_]+"

    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual/range {p6 .. p6}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    if-nez v14, :cond_0

    if-nez v15, :cond_0

    if-nez v10, :cond_0

    move v13, v10

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a \u043a\u0430\u0442\u0430\u043b\u043e\u0433\u0430"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 12
    :cond_1
    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    new-instance v4, Lorg/rabochaya/projects/TileSource;

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move v13, v10

    move/from16 v10, p9

    invoke-direct/range {v4 .. v10}, Lorg/rabochaya/projects/TileSource;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZ)V

    goto :goto_0

    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0441\u043e\u0431\u0441\u0442\u0432\u0435\u043d\u043d\u044b\u0439 \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 13
    :cond_3
    move v13, v10

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual/range {p6 .. p6}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_4

    if-nez v14, :cond_4

    if-nez v15, :cond_4

    if-nez v13, :cond_4

    .line 14
    :goto_0
    iput-object v1, v0, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    iput-object v2, v0, Lorg/rabochaya/projects/MapComposition$Layer;->kind:Ljava/lang/String;

    iput-object v3, v0, Lorg/rabochaya/projects/MapComposition$Layer;->key:Ljava/lang/String;

    iput-object v11, v0, Lorg/rabochaya/projects/MapComposition$Layer;->name:Ljava/lang/String;

    iput-object v12, v0, Lorg/rabochaya/projects/MapComposition$Layer;->template:Ljava/lang/String;

    move-object/from16 v1, p6

    move v2, v13

    iput-object v1, v0, Lorg/rabochaya/projects/MapComposition$Layer;->attribution:Ljava/lang/String;

    iput v14, v0, Lorg/rabochaya/projects/MapComposition$Layer;->minZoom:I

    iput v15, v0, Lorg/rabochaya/projects/MapComposition$Layer;->maxZoom:I

    iput-boolean v2, v0, Lorg/rabochaya/projects/MapComposition$Layer;->downloads:Z

    move/from16 v1, p10

    iput-boolean v1, v0, Lorg/rabochaya/projects/MapComposition$Layer;->visible:Z

    move/from16 v1, p11

    iput v1, v0, Lorg/rabochaya/projects/MapComposition$Layer;->opacity:I

    .line 15
    return-void

    .line 13
    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u0430\u044f \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u0430\u044f \u043f\u043e\u0434\u043b\u043e\u0436\u043a\u0430"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 10
    :cond_5
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0441\u043b\u043e\u0439 \u043a\u0430\u0440\u0442\u044b"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZZILorg/rabochaya/projects/MapComposition$1;)V
    .locals 0

    .line 7
    invoke-direct/range {p0 .. p11}, Lorg/rabochaya/projects/MapComposition$Layer;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZZI)V

    return-void
.end method

.method public static bundled()Lorg/rabochaya/projects/MapComposition$Layer;
    .locals 13

    .line 19
    new-instance v12, Lorg/rabochaya/projects/MapComposition$Layer;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v10, 0x1

    const/16 v11, 0x64

    const-string v2, "bundled"

    const-string v3, ""

    const-string v4, "\u041e\u0431\u0437\u043e\u0440\u043d\u0430\u044f \u043a\u0430\u0440\u0442\u0430"

    const-string v5, ""

    const-string v6, ""

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, v12

    invoke-direct/range {v0 .. v11}, Lorg/rabochaya/projects/MapComposition$Layer;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZZI)V

    return-object v12
.end method

.method public static catalog(Ljava/lang/String;)Lorg/rabochaya/projects/MapComposition$Layer;
    .locals 14

    .line 16
    invoke-static {p0}, Lorg/rabochaya/projects/MapCatalog;->find(Ljava/lang/String;)Lorg/rabochaya/projects/TileSource;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v13, Lorg/rabochaya/projects/MapComposition$Layer;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v5, v0, Lorg/rabochaya/projects/TileSource;->name:Ljava/lang/String;

    const/4 v11, 0x1

    const/16 v12, 0x64

    const-string v3, "catalog"

    const-string v6, ""

    const-string v7, ""

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v1, v13

    move-object v4, p0

    invoke-direct/range {v1 .. v12}, Lorg/rabochaya/projects/MapComposition$Layer;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZZI)V

    return-object v13

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u0418\u0441\u0442\u043e\u0447\u043d\u0438\u043a \u043e\u0442\u0441\u0443\u0442\u0441\u0442\u0432\u0443\u0435\u0442 \u0432 \u043a\u0430\u0442\u0430\u043b\u043e\u0433\u0435"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static custom(Lorg/rabochaya/projects/TileSource;)Lorg/rabochaya/projects/MapComposition$Layer;
    .locals 13

    .line 17
    if-eqz p0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/TileSource;->layers:[Lorg/rabochaya/projects/TileSource;

    if-nez v0, :cond_0

    new-instance v0, Lorg/rabochaya/projects/MapComposition$Layer;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v5, p0, Lorg/rabochaya/projects/TileSource;->name:Ljava/lang/String;

    iget-object v6, p0, Lorg/rabochaya/projects/TileSource;->template:Ljava/lang/String;

    iget-object v7, p0, Lorg/rabochaya/projects/TileSource;->attribution:Ljava/lang/String;

    iget v8, p0, Lorg/rabochaya/projects/TileSource;->minZoom:I

    iget v9, p0, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    iget-boolean v10, p0, Lorg/rabochaya/projects/TileSource;->downloads:Z

    const/4 v11, 0x1

    const/16 v12, 0x64

    const-string v3, "custom"

    const-string v4, ""

    move-object v1, v0

    invoke-direct/range {v1 .. v12}, Lorg/rabochaya/projects/MapComposition$Layer;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZZI)V

    return-object v0

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u043e\u0442\u0434\u0435\u043b\u044c\u043d\u044b\u0439 XYZ-\u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static local()Lorg/rabochaya/projects/MapComposition$Layer;
    .locals 13

    .line 18
    new-instance v12, Lorg/rabochaya/projects/MapComposition$Layer;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v10, 0x1

    const/16 v11, 0x64

    const-string v2, "local"

    const-string v3, ""

    const-string v4, "\u041b\u043e\u043a\u0430\u043b\u044c\u043d\u0430\u044f \u043a\u0430\u0440\u0442\u0430 MBTiles"

    const-string v5, ""

    const-string v6, ""

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, v12

    invoke-direct/range {v0 .. v11}, Lorg/rabochaya/projects/MapComposition$Layer;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZZI)V

    return-object v12
.end method


# virtual methods
.method public opacity(I)Lorg/rabochaya/projects/MapComposition$Layer;
    .locals 13

    .line 22
    new-instance v12, Lorg/rabochaya/projects/MapComposition$Layer;

    iget-object v1, p0, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    iget-object v2, p0, Lorg/rabochaya/projects/MapComposition$Layer;->kind:Ljava/lang/String;

    iget-object v3, p0, Lorg/rabochaya/projects/MapComposition$Layer;->key:Ljava/lang/String;

    iget-object v4, p0, Lorg/rabochaya/projects/MapComposition$Layer;->name:Ljava/lang/String;

    iget-object v5, p0, Lorg/rabochaya/projects/MapComposition$Layer;->template:Ljava/lang/String;

    iget-object v6, p0, Lorg/rabochaya/projects/MapComposition$Layer;->attribution:Ljava/lang/String;

    iget v7, p0, Lorg/rabochaya/projects/MapComposition$Layer;->minZoom:I

    iget v8, p0, Lorg/rabochaya/projects/MapComposition$Layer;->maxZoom:I

    iget-boolean v9, p0, Lorg/rabochaya/projects/MapComposition$Layer;->downloads:Z

    iget-boolean v10, p0, Lorg/rabochaya/projects/MapComposition$Layer;->visible:Z

    move-object v0, v12

    move v11, p1

    invoke-direct/range {v0 .. v11}, Lorg/rabochaya/projects/MapComposition$Layer;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZZI)V

    return-object v12
.end method

.method public source()Lorg/rabochaya/projects/TileSource;
    .locals 8

    .line 20
    const-string v0, "catalog"

    iget-object v1, p0, Lorg/rabochaya/projects/MapComposition$Layer;->kind:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/MapComposition$Layer;->key:Ljava/lang/String;

    invoke-static {v0}, Lorg/rabochaya/projects/MapCatalog;->find(Ljava/lang/String;)Lorg/rabochaya/projects/TileSource;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, "custom"

    iget-object v1, p0, Lorg/rabochaya/projects/MapComposition$Layer;->kind:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lorg/rabochaya/projects/TileSource;

    iget-object v2, p0, Lorg/rabochaya/projects/MapComposition$Layer;->name:Ljava/lang/String;

    iget-object v3, p0, Lorg/rabochaya/projects/MapComposition$Layer;->template:Ljava/lang/String;

    iget-object v4, p0, Lorg/rabochaya/projects/MapComposition$Layer;->attribution:Ljava/lang/String;

    iget v5, p0, Lorg/rabochaya/projects/MapComposition$Layer;->minZoom:I

    iget v6, p0, Lorg/rabochaya/projects/MapComposition$Layer;->maxZoom:I

    iget-boolean v7, p0, Lorg/rabochaya/projects/MapComposition$Layer;->downloads:Z

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lorg/rabochaya/projects/TileSource;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZ)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public visible(Z)Lorg/rabochaya/projects/MapComposition$Layer;
    .locals 13

    .line 21
    new-instance v12, Lorg/rabochaya/projects/MapComposition$Layer;

    iget-object v1, p0, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    iget-object v2, p0, Lorg/rabochaya/projects/MapComposition$Layer;->kind:Ljava/lang/String;

    iget-object v3, p0, Lorg/rabochaya/projects/MapComposition$Layer;->key:Ljava/lang/String;

    iget-object v4, p0, Lorg/rabochaya/projects/MapComposition$Layer;->name:Ljava/lang/String;

    iget-object v5, p0, Lorg/rabochaya/projects/MapComposition$Layer;->template:Ljava/lang/String;

    iget-object v6, p0, Lorg/rabochaya/projects/MapComposition$Layer;->attribution:Ljava/lang/String;

    iget v7, p0, Lorg/rabochaya/projects/MapComposition$Layer;->minZoom:I

    iget v8, p0, Lorg/rabochaya/projects/MapComposition$Layer;->maxZoom:I

    iget-boolean v9, p0, Lorg/rabochaya/projects/MapComposition$Layer;->downloads:Z

    iget v11, p0, Lorg/rabochaya/projects/MapComposition$Layer;->opacity:I

    move-object v0, v12

    move v10, p1

    invoke-direct/range {v0 .. v11}, Lorg/rabochaya/projects/MapComposition$Layer;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZZI)V

    return-object v12
.end method
