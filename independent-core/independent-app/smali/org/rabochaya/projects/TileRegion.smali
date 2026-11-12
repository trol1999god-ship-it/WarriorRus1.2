.class public final Lorg/rabochaya/projects/TileRegion;
.super Ljava/lang/Object;
.source "TileRegion.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "[I>;"
    }
.end annotation


# static fields
.field public static final MAX_TILES:J = 0x4e20L


# instance fields
.field public final count:J

.field private final ranges:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "[I>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(DDDDII)V
    .locals 12

    .line 6
    const/4 v11, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-wide v3, p3

    move-wide/from16 v5, p5

    move-wide/from16 v7, p7

    move/from16 v9, p9

    move/from16 v10, p10

    invoke-direct/range {v0 .. v11}, Lorg/rabochaya/projects/TileRegion;-><init>(DDDDIIZ)V

    return-void
.end method

.method public constructor <init>(DDDDIIZ)V
    .locals 18

    .line 7
    move-object/from16 v0, p0

    move-wide/from16 v1, p3

    move-wide/from16 v3, p7

    move/from16 v5, p9

    move/from16 v6, p10

    move/from16 v7, p11

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 5
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iput-object v8, v0, Lorg/rabochaya/projects/TileRegion;->ranges:Ljava/util/ArrayList;

    .line 8
    invoke-static/range {p1 .. p2}, Lorg/rabochaya/projects/TileRegion;->finite(D)Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-static/range {p5 .. p6}, Lorg/rabochaya/projects/TileRegion;->finite(D)Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-static/range {p3 .. p4}, Lorg/rabochaya/projects/TileRegion;->finite(D)Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-static/range {p7 .. p8}, Lorg/rabochaya/projects/TileRegion;->finite(D)Z

    move-result v8

    if-eqz v8, :cond_4

    const-wide v8, -0x3f99800000000000L    # -180.0

    cmpg-double v10, p1, v8

    if-ltz v10, :cond_4

    const-wide v10, 0x4066800000000000L    # 180.0

    cmpl-double v12, p1, v10

    if-gtz v12, :cond_4

    cmpg-double v8, p5, v8

    if-ltz v8, :cond_4

    cmpl-double v8, p5, v10

    if-gtz v8, :cond_4

    const-wide v8, -0x3faabcba4e5a8100L    # -85.05112878

    cmpg-double v8, v1, v8

    if-ltz v8, :cond_4

    const-wide v8, 0x40554345b1a57f00L    # 85.05112878

    cmpl-double v8, v3, v8

    if-gtz v8, :cond_4

    cmpl-double v8, v1, v3

    if-gez v8, :cond_4

    cmpl-double v8, p1, p5

    if-eqz v8, :cond_4

    if-ltz v5, :cond_4

    const/16 v8, 0x17

    if-gt v6, v8, :cond_4

    if-gt v5, v6, :cond_4

    .line 9
    const-wide/16 v8, 0x0

    :goto_0
    if-gt v5, v6, :cond_3

    const/4 v10, 0x1

    shl-int v11, v10, v5

    invoke-static {v3, v4, v7}, Lorg/rabochaya/projects/TileProjection;->y(DZ)D

    move-result-wide v12

    int-to-double v14, v11

    mul-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->floor(D)D

    move-result-wide v12

    double-to-int v12, v12

    invoke-static {v12, v11}, Lorg/rabochaya/projects/TileRegion;->clip(II)I

    move-result v12

    invoke-static {v1, v2, v7}, Lorg/rabochaya/projects/TileProjection;->y(DZ)D

    move-result-wide v16

    mul-double v16, v16, v14

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    sub-int/2addr v1, v10

    invoke-static {v1, v11}, Lorg/rabochaya/projects/TileRegion;->clip(II)I

    move-result v1

    invoke-static {v12, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 10
    invoke-static/range {p1 .. p2}, Lorg/rabochaya/projects/MapMath;->x(D)D

    move-result-wide v16

    mul-double v16, v16, v14

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int v2, v2

    invoke-static {v2, v11}, Lorg/rabochaya/projects/TileRegion;->clip(II)I

    move-result v2

    invoke-static/range {p5 .. p6}, Lorg/rabochaya/projects/MapMath;->x(D)D

    move-result-wide v3

    mul-double/2addr v3, v14

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v3, v3

    sub-int/2addr v3, v10

    invoke-static {v3, v11}, Lorg/rabochaya/projects/TileRegion;->clip(II)I

    move-result v3

    .line 11
    cmpg-double v4, p1, p5

    if-gez v4, :cond_0

    iget-object v4, v0, Lorg/rabochaya/projects/TileRegion;->ranges:Ljava/util/ArrayList;

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v11

    filled-new-array {v5, v2, v11, v12, v1}, [I

    move-result-object v11

    invoke-virtual {v4, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    sub-int/2addr v3, v2

    add-int/2addr v3, v10

    int-to-long v2, v3

    sub-int/2addr v1, v12

    add-int/2addr v1, v10

    int-to-long v10, v1

    mul-long/2addr v2, v10

    add-long/2addr v8, v2

    goto :goto_1

    .line 12
    :cond_0
    iget-object v4, v0, Lorg/rabochaya/projects/TileRegion;->ranges:Ljava/util/ArrayList;

    add-int/lit8 v13, v11, -0x1

    filled-new-array {v5, v2, v13, v12, v1}, [I

    move-result-object v13

    invoke-virtual {v4, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sub-int/2addr v11, v2

    int-to-long v13, v11

    sub-int v4, v1, v12

    add-int/2addr v4, v10

    int-to-long v10, v4

    mul-long/2addr v13, v10

    add-long/2addr v8, v13

    if-lez v2, :cond_1

    add-int/lit8 v2, v2, -0x1

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    iget-object v3, v0, Lorg/rabochaya/projects/TileRegion;->ranges:Ljava/util/ArrayList;

    const/4 v4, 0x0

    filled-new-array {v5, v4, v2, v12, v1}, [I

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x1

    add-int/2addr v2, v1

    int-to-long v1, v2

    mul-long/2addr v1, v10

    add-long/2addr v8, v1

    .line 13
    :cond_1
    :goto_1
    const-wide/16 v1, 0x4e20

    cmp-long v1, v8, v1

    if-gtz v1, :cond_2

    .line 9
    add-int/lit8 v5, v5, 0x1

    move-wide/from16 v1, p3

    move-wide/from16 v3, p7

    goto/16 :goto_0

    .line 13
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u0412 \u043e\u0431\u043b\u0430\u0441\u0442\u0438 \u0431\u043e\u043b\u044c\u0448\u0435 20 000 \u0442\u0430\u0439\u043b\u043e\u0432; \u0443\u043c\u0435\u043d\u044c\u0448\u0438\u0442\u0435 \u0435\u0451 \u0438\u043b\u0438 \u043c\u0430\u0441\u0448\u0442\u0430\u0431"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 14
    :cond_3
    iput-wide v8, v0, Lorg/rabochaya/projects/TileRegion;->count:J

    .line 15
    return-void

    .line 8
    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u041f\u0440\u043e\u0432\u0435\u0440\u044c\u0442\u0435 \u0433\u0440\u0430\u043d\u0438\u0446\u044b \u0438 \u043c\u0430\u0441\u0448\u0442\u0430\u0431\u044b \u043e\u0431\u043b\u0430\u0441\u0442\u0438 (\u0448\u0438\u0440\u043e\u0442\u044b \u00b185.05112878)"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static synthetic access$000(Lorg/rabochaya/projects/TileRegion;)Ljava/util/ArrayList;
    .locals 0

    .line 4
    iget-object p0, p0, Lorg/rabochaya/projects/TileRegion;->ranges:Ljava/util/ArrayList;

    return-object p0
.end method

.method private static clip(II)I
    .locals 0

    .line 16
    add-int/lit8 p1, p1, -0x1

    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 p1, 0x0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method private static finite(D)Z
    .locals 1

    .line 16
    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0, p1}, Ljava/lang/Double;->isInfinite(D)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "[I>;"
        }
    .end annotation

    .line 17
    new-instance v0, Lorg/rabochaya/projects/TileRegion$1;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/TileRegion$1;-><init>(Lorg/rabochaya/projects/TileRegion;)V

    return-object v0
.end method
