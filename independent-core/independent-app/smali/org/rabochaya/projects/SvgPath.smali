.class public final Lorg/rabochaya/projects/SvgPath;
.super Ljava/lang/Object;
.source "SvgPath.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/SvgPath$Segment;
    }
.end annotation


# static fields
.field private static final LIMIT:D = 1000000.0

.field public static final MAX_SEGMENTS:I = 0x1000

.field public static final MAX_TEXT:I = 0x10000


# instance fields
.field private at:I

.field private controlX:D

.field private controlY:D

.field private previous:C

.field private final result:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lorg/rabochaya/projects/SvgPath$Segment;",
            ">;"
        }
    .end annotation
.end field

.field private startX:D

.field private startY:D

.field private final text:Ljava/lang/String;

.field private x:D

.field private y:D


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/SvgPath;->result:Ljava/util/ArrayList;

    .line 8
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/high16 v1, 0x10000

    if-gt v0, v1, :cond_0

    iput-object p1, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    return-void

    :cond_0
    invoke-static {}, Lorg/rabochaya/projects/SvgPath;->invalid()Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1
.end method

.method private arc(DDDIIDD)V
    .locals 49

    .line 38
    move-object/from16 v0, p0

    move/from16 v1, p8

    invoke-static/range {p9 .. p10}, Lorg/rabochaya/projects/SvgPath;->bounded(D)D

    invoke-static/range {p11 .. p12}, Lorg/rabochaya/projects/SvgPath;->bounded(D)D

    iget-wide v2, v0, Lorg/rabochaya/projects/SvgPath;->x:D

    cmpl-double v2, v2, p9

    if-nez v2, :cond_0

    iget-wide v2, v0, Lorg/rabochaya/projects/SvgPath;->y:D

    cmpl-double v2, v2, p11

    if-nez v2, :cond_0

    return-void

    :cond_0
    const-wide/16 v2, 0x0

    cmpl-double v4, p1, v2

    if-eqz v4, :cond_c

    cmpl-double v4, p3, v2

    if-nez v4, :cond_1

    goto/16 :goto_3

    .line 39
    :cond_1
    const-wide v8, 0x4076800000000000L    # 360.0

    rem-double v8, p5, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Math;->cos(D)D

    move-result-wide v10

    invoke-static {v8, v9}, Ljava/lang/Math;->sin(D)D

    move-result-wide v8

    iget-wide v12, v0, Lorg/rabochaya/projects/SvgPath;->x:D

    sub-double v12, v12, p9

    const-wide/high16 v14, 0x4000000000000000L    # 2.0

    div-double/2addr v12, v14

    iget-wide v5, v0, Lorg/rabochaya/projects/SvgPath;->y:D

    sub-double v5, v5, p11

    div-double/2addr v5, v14

    mul-double v16, v10, v12

    mul-double v18, v8, v5

    add-double v14, v16, v18

    neg-double v2, v8

    mul-double/2addr v12, v2

    mul-double/2addr v5, v10

    add-double/2addr v12, v5

    .line 40
    div-double v5, v14, p1

    move-wide/from16 v19, v8

    div-double v7, v12, p3

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    move-result v7

    if-nez v7, :cond_b

    invoke-static {v5, v6}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v7

    if-nez v7, :cond_b

    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    cmpl-double v7, v5, v7

    if-lez v7, :cond_2

    mul-double v7, p1, v5

    mul-double v5, v5, p3

    goto :goto_0

    :cond_2
    move-wide/from16 v7, p1

    move-wide/from16 v5, p3

    .line 41
    :goto_0
    mul-double v21, v7, v7

    mul-double v23, v5, v5

    mul-double v25, v14, v14

    mul-double v27, v12, v12

    mul-double v27, v27, v21

    mul-double v25, v25, v23

    add-double v27, v27, v25

    const-wide/16 v16, 0x0

    cmpl-double v9, v27, v16

    if-lez v9, :cond_a

    invoke-static/range {v27 .. v28}, Ljava/lang/Double;->isNaN(D)Z

    move-result v9

    if-nez v9, :cond_a

    invoke-static/range {v27 .. v28}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v9

    if-nez v9, :cond_a

    mul-double v21, v21, v23

    sub-double v21, v21, v27

    move-wide/from16 p1, v5

    div-double v4, v21, v27

    move-wide/from16 v21, v10

    const-wide/16 v9, 0x0

    invoke-static {v9, v10, v4, v5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    move/from16 v6, p7

    if-ne v6, v1, :cond_3

    const/4 v6, -0x1

    goto :goto_1

    :cond_3
    const/4 v6, 0x1

    :goto_1
    int-to-double v9, v6

    mul-double/2addr v4, v9

    mul-double v9, v4, v7

    mul-double/2addr v9, v12

    move-wide/from16 v23, p1

    div-double v9, v9, v23

    neg-double v4, v4

    mul-double v4, v4, v23

    mul-double/2addr v4, v14

    div-double/2addr v4, v7

    .line 42
    mul-double v25, v21, v9

    mul-double v27, v19, v4

    sub-double v25, v25, v27

    move-wide/from16 v27, v2

    iget-wide v2, v0, Lorg/rabochaya/projects/SvgPath;->x:D

    add-double v2, v2, p9

    const-wide/high16 v29, 0x4000000000000000L    # 2.0

    div-double v2, v2, v29

    add-double v25, v25, v2

    mul-double v2, v19, v9

    mul-double v31, v21, v4

    add-double v2, v2, v31

    move-wide/from16 p1, v7

    iget-wide v6, v0, Lorg/rabochaya/projects/SvgPath;->y:D

    add-double v6, v6, p11

    div-double v6, v6, v29

    add-double/2addr v2, v6

    .line 43
    sub-double v6, v12, v4

    div-double v6, v6, v23

    sub-double v29, v14, v9

    move-wide/from16 v31, p1

    move-wide/from16 p1, v2

    div-double v2, v29, v31

    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v2

    neg-double v6, v12

    sub-double/2addr v6, v4

    div-double v6, v6, v23

    neg-double v4, v14

    sub-double/2addr v4, v9

    div-double v4, v4, v31

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v4

    sub-double/2addr v4, v2

    const-wide v6, 0x401921fb54442d18L    # 6.283185307179586

    const/4 v8, 0x1

    if-ne v1, v8, :cond_4

    const-wide/16 v8, 0x0

    cmpg-double v10, v4, v8

    if-gez v10, :cond_4

    add-double/2addr v4, v6

    :cond_4
    if-nez v1, :cond_5

    const-wide/16 v8, 0x0

    cmpl-double v1, v4, v8

    if-lez v1, :cond_5

    sub-double/2addr v4, v6

    .line 44
    :cond_5
    invoke-static {v4, v5}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    const-wide v8, 0x3ff921fb54442d18L    # 1.5707963267948966

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v1, v6

    const/4 v6, 0x1

    if-lt v1, v6, :cond_9

    const/4 v6, 0x4

    if-gt v1, v6, :cond_9

    int-to-double v7, v1

    div-double v7, v4, v7

    .line 45
    const/4 v5, 0x0

    :goto_2
    if-ge v5, v1, :cond_8

    int-to-double v9, v5

    mul-double/2addr v9, v7

    add-double/2addr v9, v2

    add-double v11, v9, v7

    const-wide/high16 v13, 0x4010000000000000L    # 4.0

    div-double v13, v7, v13

    invoke-static {v13, v14}, Ljava/lang/Math;->tan(D)D

    move-result-wide v13

    const-wide v16, 0x3ff5555555555555L    # 1.3333333333333333

    mul-double v13, v13, v16

    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    move-result-wide v16

    invoke-static {v9, v10}, Ljava/lang/Math;->sin(D)D

    move-result-wide v9

    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    move-result-wide v29

    invoke-static {v11, v12}, Ljava/lang/Math;->sin(D)D

    move-result-wide v11

    mul-double v33, v21, v31

    mul-double v35, v33, v16

    add-double v35, v25, v35

    mul-double v37, v19, v23

    mul-double v39, v37, v9

    sub-double v35, v35, v39

    mul-double v39, v19, v31

    mul-double v41, v39, v16

    move-wide/from16 v43, p1

    add-double v41, v43, v41

    mul-double v45, v21, v23

    mul-double v47, v45, v9

    add-double v41, v41, v47

    mul-double v33, v33, v29

    add-double v33, v25, v33

    mul-double v47, v37, v11

    sub-double v33, v33, v47

    mul-double v39, v39, v29

    add-double v39, v43, v39

    mul-double v47, v45, v11

    add-double v39, v39, v47

    .line 46
    const/4 v4, 0x6

    new-array v15, v4, [D

    move-wide/from16 p6, v2

    move-wide/from16 p4, v7

    move-wide/from16 v6, v21

    neg-double v2, v6

    mul-double v2, v2, v31

    mul-double v21, v2, v9

    mul-double v47, v37, v16

    sub-double v21, v21, v47

    mul-double v21, v21, v13

    add-double v35, v35, v21

    const/4 v4, 0x0

    aput-wide v35, v15, v4

    mul-double v21, v27, v31

    mul-double v9, v9, v21

    mul-double v16, v16, v45

    add-double v9, v9, v16

    mul-double/2addr v9, v13

    add-double v41, v41, v9

    const/4 v4, 0x1

    aput-wide v41, v15, v4

    mul-double/2addr v2, v11

    mul-double v37, v37, v29

    sub-double v2, v2, v37

    mul-double/2addr v2, v13

    sub-double v2, v33, v2

    const/4 v4, 0x2

    aput-wide v2, v15, v4

    mul-double v21, v21, v11

    mul-double v45, v45, v29

    add-double v21, v21, v45

    mul-double v13, v13, v21

    sub-double v2, v39, v13

    const/4 v8, 0x3

    aput-wide v2, v15, v8

    add-int/lit8 v2, v1, -0x1

    if-ne v5, v2, :cond_6

    move-wide/from16 v33, p9

    :cond_6
    const/4 v3, 0x4

    aput-wide v33, v15, v3

    if-ne v5, v2, :cond_7

    move-wide/from16 v39, p11

    :cond_7
    const/4 v2, 0x5

    aput-wide v39, v15, v2

    const/16 v2, 0x43

    invoke-direct {v0, v2, v15}, Lorg/rabochaya/projects/SvgPath;->emit(C[D)V

    .line 45
    add-int/lit8 v5, v5, 0x1

    move-wide/from16 v21, v6

    move-wide/from16 p1, v43

    move-wide/from16 v7, p4

    move v6, v3

    move-wide/from16 v2, p6

    goto/16 :goto_2

    .line 48
    :cond_8
    return-void

    .line 44
    :cond_9
    invoke-static {}, Lorg/rabochaya/projects/SvgPath;->invalid()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1

    .line 41
    :cond_a
    invoke-static {}, Lorg/rabochaya/projects/SvgPath;->invalid()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1

    .line 40
    :cond_b
    invoke-static {}, Lorg/rabochaya/projects/SvgPath;->invalid()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1

    .line 38
    :cond_c
    :goto_3
    const/4 v1, 0x2

    new-array v1, v1, [D

    const/4 v2, 0x0

    aput-wide p9, v1, v2

    const/4 v2, 0x1

    aput-wide p11, v1, v2

    const/16 v2, 0x4c

    invoke-direct {v0, v2, v1}, Lorg/rabochaya/projects/SvgPath;->emit(C[D)V

    return-void
.end method

.method private static bounded(D)D
    .locals 4

    .line 16
    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0, p1}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    const-wide v2, 0x412e848000000000L    # 1000000.0

    cmpl-double v0, v0, v2

    if-gtz v0, :cond_0

    return-wide p0

    :cond_0
    invoke-static {}, Lorg/rabochaya/projects/SvgPath;->invalid()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method private varargs emit(C[D)V
    .locals 4

    .line 17
    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->result:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0x1000

    if-ge v0, v1, :cond_1

    array-length v0, p2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-wide v2, p2, v1

    invoke-static {v2, v3}, Lorg/rabochaya/projects/SvgPath;->bounded(D)D

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->result:Ljava/util/ArrayList;

    new-instance v1, Lorg/rabochaya/projects/SvgPath$Segment;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2}, Lorg/rabochaya/projects/SvgPath$Segment;-><init>(C[DLorg/rabochaya/projects/SvgPath$1;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_1
    invoke-static {}, Lorg/rabochaya/projects/SvgPath;->invalid()Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1
.end method

.method private flag()I
    .locals 4

    .line 15
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/SvgPath;->separator(Z)V

    iget v0, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    iget-object v1, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x30

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v2, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x31

    if-ne v0, v2, :cond_1

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v2, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    sub-int/2addr v0, v1

    return v0

    :cond_1
    invoke-static {}, Lorg/rabochaya/projects/SvgPath;->invalid()Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0
.end method

.method private static invalid()Ljava/lang/IllegalArgumentException;
    .locals 2

    .line 10
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u041d\u0435\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u043d\u044b\u0439 \u0438\u043b\u0438 \u043d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u044b\u0439 SVG path"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private letter()Z
    .locals 2

    .line 12
    iget v0, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    iget-object v1, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isLetter(C)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private number(Z)D
    .locals 7

    .line 14
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/SvgPath;->separator(Z)V

    iget p1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    iget v0, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    iget-object v1, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x2d

    const/16 v3, 0x2b

    if-ge v0, v1, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-eq v0, v3, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v2, :cond_1

    :cond_0
    iget v0, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    iget-object v4, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x39

    const/16 v6, 0x30

    if-ge v1, v4, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v4, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-lt v1, v6, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v4, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-gt v1, v5, :cond_2

    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    iget-object v4, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_3

    iget-object v1, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v4, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v4, 0x2e

    if-ne v1, v4, :cond_3

    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    :goto_1
    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    iget-object v4, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_3

    iget-object v1, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v4, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-lt v1, v6, :cond_3

    iget-object v1, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v4, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-gt v1, v5, :cond_3

    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    if-eqz v0, :cond_b

    iget v0, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    iget-object v1, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_9

    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x65

    if-eq v0, v1, :cond_4

    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x45

    if-ne v0, v1, :cond_9

    :cond_4
    iget v0, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    iget v0, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    iget-object v1, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_6

    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-eq v0, v3, :cond_5

    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v2, :cond_6

    :cond_5
    iget v0, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    :cond_6
    iget v0, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    :goto_2
    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    iget-object v2, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_7

    iget-object v1, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v2, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-lt v1, v6, :cond_7

    iget-object v1, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v2, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-gt v1, v5, :cond_7

    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    goto :goto_2

    :cond_7
    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    if-eq v0, v1, :cond_8

    goto :goto_3

    :cond_8
    invoke-static {}, Lorg/rabochaya/projects/SvgPath;->invalid()Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1

    :cond_9
    :goto_3
    iget v0, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    sub-int/2addr v0, p1

    const/16 v1, 0x40

    if-gt v0, v1, :cond_a

    :try_start_0
    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, p1, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/rabochaya/projects/SvgPath;->bounded(D)D

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    move-exception p1

    invoke-static {}, Lorg/rabochaya/projects/SvgPath;->invalid()Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1

    :cond_a
    invoke-static {}, Lorg/rabochaya/projects/SvgPath;->invalid()Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1

    :cond_b
    invoke-static {}, Lorg/rabochaya/projects/SvgPath;->invalid()Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1
.end method

.method public static parse(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/SvgPath$Segment;",
            ">;"
        }
    .end annotation

    .line 9
    new-instance v0, Lorg/rabochaya/projects/SvgPath;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/SvgPath;-><init>(Ljava/lang/String;)V

    invoke-direct {v0}, Lorg/rabochaya/projects/SvgPath;->read()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private read()Ljava/util/List;
    .locals 32
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/SvgPath$Segment;",
            ">;"
        }
    .end annotation

    .line 18
    move-object/from16 v13, p0

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/SvgPath;->space()V

    iget v0, v13, Lorg/rabochaya/projects/SvgPath;->at:I

    iget-object v1, v13, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eq v0, v1, :cond_13

    iget-object v0, v13, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v1, v13, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v14, 0x4d

    if-eq v0, v14, :cond_0

    iget-object v0, v13, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v1, v13, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x6d

    if-ne v0, v1, :cond_13

    :cond_0
    const/4 v15, 0x0

    move v0, v15

    .line 19
    :goto_0
    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/SvgPath;->space()V

    iget v1, v13, Lorg/rabochaya/projects/SvgPath;->at:I

    iget-object v2, v13, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 35
    iget-object v0, v13, Lorg/rabochaya/projects/SvgPath;->result:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 19
    :cond_1
    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/SvgPath;->letter()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    iget-object v0, v13, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v1, v13, Lorg/rabochaya/projects/SvgPath;->at:I

    add-int/lit8 v3, v1, 0x1

    iput v3, v13, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    move v11, v0

    move v0, v2

    goto :goto_1

    :cond_2
    move v11, v0

    move v0, v15

    .line 20
    :goto_1
    const/16 v1, 0x61

    if-lt v11, v1, :cond_3

    const/16 v1, 0x7a

    if-gt v11, v1, :cond_3

    move v1, v2

    goto :goto_2

    :cond_3
    move v1, v15

    :goto_2
    invoke-static {v11}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v12

    const-string v3, "MLHVCSQTAZ"

    invoke-virtual {v3, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-ltz v3, :cond_12

    .line 21
    const/16 v3, 0x5a

    if-ne v12, v3, :cond_5

    if-eqz v0, :cond_4

    new-array v0, v15, [D

    invoke-direct {v13, v3, v0}, Lorg/rabochaya/projects/SvgPath;->emit(C[D)V

    iget-wide v0, v13, Lorg/rabochaya/projects/SvgPath;->startX:D

    iput-wide v0, v13, Lorg/rabochaya/projects/SvgPath;->x:D

    iget-wide v0, v13, Lorg/rabochaya/projects/SvgPath;->startY:D

    iput-wide v0, v13, Lorg/rabochaya/projects/SvgPath;->y:D

    iput-char v12, v13, Lorg/rabochaya/projects/SvgPath;->previous:C

    move v0, v15

    goto :goto_0

    :cond_4
    invoke-static {}, Lorg/rabochaya/projects/SvgPath;->invalid()Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    .line 22
    :cond_5
    const-wide/16 v3, 0x0

    if-eqz v1, :cond_6

    iget-wide v5, v13, Lorg/rabochaya/projects/SvgPath;->x:D

    goto :goto_3

    :cond_6
    move-wide v5, v3

    :goto_3
    if-eqz v1, :cond_7

    iget-wide v3, v13, Lorg/rabochaya/projects/SvgPath;->y:D

    :cond_7
    invoke-direct {v13, v0}, Lorg/rabochaya/projects/SvgPath;->number(Z)D

    move-result-wide v7

    .line 23
    const/16 v10, 0x4c

    const-wide/high16 v16, 0x4000000000000000L    # 2.0

    const/16 v14, 0x51

    const/16 v19, 0x3

    const/4 v9, 0x2

    sparse-switch v12, :sswitch_data_0

    .line 32
    invoke-static {}, Lorg/rabochaya/projects/SvgPath;->invalid()Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    .line 26
    :sswitch_0
    add-double/2addr v7, v3

    invoke-static {v7, v8}, Lorg/rabochaya/projects/SvgPath;->bounded(D)D

    move-result-wide v0

    iput-wide v0, v13, Lorg/rabochaya/projects/SvgPath;->y:D

    iget-wide v0, v13, Lorg/rabochaya/projects/SvgPath;->x:D

    iget-wide v3, v13, Lorg/rabochaya/projects/SvgPath;->y:D

    new-array v5, v9, [D

    aput-wide v0, v5, v15

    aput-wide v3, v5, v2

    invoke-direct {v13, v10, v5}, Lorg/rabochaya/projects/SvgPath;->emit(C[D)V

    move v15, v11

    move v14, v12

    goto/16 :goto_c

    .line 30
    :sswitch_1
    invoke-direct {v13, v15}, Lorg/rabochaya/projects/SvgPath;->number(Z)D

    move-result-wide v20

    iget-char v1, v13, Lorg/rabochaya/projects/SvgPath;->previous:C

    const/16 v10, 0x54

    if-eq v1, v14, :cond_9

    iget-char v1, v13, Lorg/rabochaya/projects/SvgPath;->previous:C

    if-ne v1, v10, :cond_8

    goto :goto_4

    :cond_8
    iget-wide v0, v13, Lorg/rabochaya/projects/SvgPath;->x:D

    move-wide/from16 v24, v3

    goto :goto_5

    :cond_9
    :goto_4
    iget-wide v0, v13, Lorg/rabochaya/projects/SvgPath;->x:D

    mul-double v0, v0, v16

    move-wide/from16 v24, v3

    iget-wide v2, v13, Lorg/rabochaya/projects/SvgPath;->controlX:D

    sub-double/2addr v0, v2

    :goto_5
    iget-char v2, v13, Lorg/rabochaya/projects/SvgPath;->previous:C

    if-eq v2, v14, :cond_b

    iget-char v2, v13, Lorg/rabochaya/projects/SvgPath;->previous:C

    if-ne v2, v10, :cond_a

    goto :goto_6

    :cond_a
    iget-wide v2, v13, Lorg/rabochaya/projects/SvgPath;->y:D

    goto :goto_7

    :cond_b
    :goto_6
    iget-wide v2, v13, Lorg/rabochaya/projects/SvgPath;->y:D

    mul-double v2, v2, v16

    iget-wide v9, v13, Lorg/rabochaya/projects/SvgPath;->controlY:D

    sub-double/2addr v2, v9

    :goto_7
    add-double/2addr v7, v5

    add-double v5, v20, v24

    const/4 v9, 0x4

    new-array v9, v9, [D

    aput-wide v0, v9, v15

    const/4 v10, 0x1

    aput-wide v2, v9, v10

    const/4 v4, 0x2

    aput-wide v7, v9, v4

    aput-wide v5, v9, v19

    invoke-direct {v13, v14, v9}, Lorg/rabochaya/projects/SvgPath;->emit(C[D)V

    iput-wide v0, v13, Lorg/rabochaya/projects/SvgPath;->controlX:D

    iput-wide v2, v13, Lorg/rabochaya/projects/SvgPath;->controlY:D

    iput-wide v7, v13, Lorg/rabochaya/projects/SvgPath;->x:D

    iput-wide v5, v13, Lorg/rabochaya/projects/SvgPath;->y:D

    move v15, v11

    move v14, v12

    goto/16 :goto_c

    .line 28
    :sswitch_2
    move-wide/from16 v24, v3

    invoke-direct {v13, v15}, Lorg/rabochaya/projects/SvgPath;->number(Z)D

    move-result-wide v0

    invoke-direct {v13, v15}, Lorg/rabochaya/projects/SvgPath;->number(Z)D

    move-result-wide v2

    invoke-direct {v13, v15}, Lorg/rabochaya/projects/SvgPath;->number(Z)D

    move-result-wide v9

    const/4 v14, 0x6

    new-array v14, v14, [D

    iget-char v4, v13, Lorg/rabochaya/projects/SvgPath;->previous:C

    const/16 v15, 0x43

    if-eq v4, v15, :cond_d

    iget-char v4, v13, Lorg/rabochaya/projects/SvgPath;->previous:C

    const/16 v15, 0x53

    if-ne v4, v15, :cond_c

    move v15, v11

    move/from16 v28, v12

    goto :goto_8

    :cond_c
    move v15, v11

    move/from16 v28, v12

    iget-wide v11, v13, Lorg/rabochaya/projects/SvgPath;->x:D

    move-wide/from16 v29, v9

    goto :goto_9

    :cond_d
    move v15, v11

    move/from16 v28, v12

    :goto_8
    iget-wide v11, v13, Lorg/rabochaya/projects/SvgPath;->x:D

    mul-double v11, v11, v16

    move-wide/from16 v29, v9

    iget-wide v9, v13, Lorg/rabochaya/projects/SvgPath;->controlX:D

    sub-double/2addr v11, v9

    :goto_9
    const/4 v4, 0x0

    aput-wide v11, v14, v4

    iget-char v4, v13, Lorg/rabochaya/projects/SvgPath;->previous:C

    const/16 v9, 0x43

    if-eq v4, v9, :cond_f

    iget-char v4, v13, Lorg/rabochaya/projects/SvgPath;->previous:C

    const/16 v9, 0x53

    if-ne v4, v9, :cond_e

    goto :goto_a

    :cond_e
    iget-wide v9, v13, Lorg/rabochaya/projects/SvgPath;->y:D

    goto :goto_b

    :cond_f
    :goto_a
    iget-wide v9, v13, Lorg/rabochaya/projects/SvgPath;->y:D

    mul-double v9, v9, v16

    iget-wide v11, v13, Lorg/rabochaya/projects/SvgPath;->controlY:D

    sub-double/2addr v9, v11

    :goto_b
    const/4 v4, 0x1

    aput-wide v9, v14, v4

    add-double/2addr v7, v5

    const/4 v4, 0x2

    aput-wide v7, v14, v4

    add-double v0, v0, v24

    aput-wide v0, v14, v19

    add-double/2addr v2, v5

    const/4 v4, 0x4

    aput-wide v2, v14, v4

    add-double v9, v29, v24

    const/4 v4, 0x5

    aput-wide v9, v14, v4

    const/16 v4, 0x43

    invoke-direct {v13, v4, v14}, Lorg/rabochaya/projects/SvgPath;->emit(C[D)V

    iput-wide v7, v13, Lorg/rabochaya/projects/SvgPath;->controlX:D

    iput-wide v0, v13, Lorg/rabochaya/projects/SvgPath;->controlY:D

    iput-wide v2, v13, Lorg/rabochaya/projects/SvgPath;->x:D

    iput-wide v9, v13, Lorg/rabochaya/projects/SvgPath;->y:D

    move/from16 v14, v28

    goto/16 :goto_c

    .line 29
    :sswitch_3
    move-wide/from16 v24, v3

    move v15, v11

    move/from16 v28, v12

    const/4 v0, 0x0

    invoke-direct {v13, v0}, Lorg/rabochaya/projects/SvgPath;->number(Z)D

    move-result-wide v1

    invoke-direct {v13, v0}, Lorg/rabochaya/projects/SvgPath;->number(Z)D

    move-result-wide v9

    invoke-direct {v13, v0}, Lorg/rabochaya/projects/SvgPath;->number(Z)D

    move-result-wide v11

    add-double/2addr v7, v5

    add-double v1, v1, v24

    add-double/2addr v9, v5

    add-double v11, v11, v24

    const/4 v3, 0x4

    new-array v3, v3, [D

    aput-wide v7, v3, v0

    const/4 v5, 0x1

    aput-wide v1, v3, v5

    const/4 v4, 0x2

    aput-wide v9, v3, v4

    aput-wide v11, v3, v19

    invoke-direct {v13, v14, v3}, Lorg/rabochaya/projects/SvgPath;->emit(C[D)V

    iput-wide v7, v13, Lorg/rabochaya/projects/SvgPath;->controlX:D

    iput-wide v1, v13, Lorg/rabochaya/projects/SvgPath;->controlY:D

    iput-wide v9, v13, Lorg/rabochaya/projects/SvgPath;->x:D

    iput-wide v11, v13, Lorg/rabochaya/projects/SvgPath;->y:D

    move/from16 v14, v28

    goto/16 :goto_c

    .line 24
    :sswitch_4
    move-wide/from16 v24, v3

    move/from16 v28, v12

    move v0, v15

    move v15, v11

    invoke-direct {v13, v0}, Lorg/rabochaya/projects/SvgPath;->number(Z)D

    move-result-wide v2

    add-double/2addr v7, v5

    invoke-static {v7, v8}, Lorg/rabochaya/projects/SvgPath;->bounded(D)D

    move-result-wide v5

    iput-wide v5, v13, Lorg/rabochaya/projects/SvgPath;->x:D

    add-double v2, v2, v24

    invoke-static {v2, v3}, Lorg/rabochaya/projects/SvgPath;->bounded(D)D

    move-result-wide v2

    iput-wide v2, v13, Lorg/rabochaya/projects/SvgPath;->y:D

    iget-wide v2, v13, Lorg/rabochaya/projects/SvgPath;->x:D

    iget-wide v5, v13, Lorg/rabochaya/projects/SvgPath;->y:D

    const/4 v4, 0x2

    new-array v4, v4, [D

    aput-wide v2, v4, v0

    const/4 v0, 0x1

    aput-wide v5, v4, v0

    move/from16 v11, v28

    invoke-direct {v13, v11, v4}, Lorg/rabochaya/projects/SvgPath;->emit(C[D)V

    const/16 v14, 0x4d

    if-ne v11, v14, :cond_11

    iget-wide v2, v13, Lorg/rabochaya/projects/SvgPath;->x:D

    iput-wide v2, v13, Lorg/rabochaya/projects/SvgPath;->startX:D

    iget-wide v2, v13, Lorg/rabochaya/projects/SvgPath;->y:D

    iput-wide v2, v13, Lorg/rabochaya/projects/SvgPath;->startY:D

    if-eqz v1, :cond_10

    const/16 v10, 0x6c

    :cond_10
    move v0, v10

    move v14, v11

    goto/16 :goto_d

    :cond_11
    move v14, v11

    goto/16 :goto_c

    .line 25
    :sswitch_5
    move v15, v11

    move v11, v12

    const/16 v14, 0x4d

    add-double/2addr v7, v5

    invoke-static {v7, v8}, Lorg/rabochaya/projects/SvgPath;->bounded(D)D

    move-result-wide v0

    iput-wide v0, v13, Lorg/rabochaya/projects/SvgPath;->x:D

    iget-wide v0, v13, Lorg/rabochaya/projects/SvgPath;->x:D

    iget-wide v2, v13, Lorg/rabochaya/projects/SvgPath;->y:D

    const/4 v4, 0x2

    new-array v4, v4, [D

    const/4 v9, 0x0

    aput-wide v0, v4, v9

    const/4 v0, 0x1

    aput-wide v2, v4, v0

    invoke-direct {v13, v10, v4}, Lorg/rabochaya/projects/SvgPath;->emit(C[D)V

    move v14, v11

    goto/16 :goto_c

    .line 27
    :sswitch_6
    move-wide/from16 v24, v3

    move v9, v15

    const/16 v14, 0x4d

    move v15, v11

    move v11, v12

    invoke-direct {v13, v9}, Lorg/rabochaya/projects/SvgPath;->number(Z)D

    move-result-wide v0

    invoke-direct {v13, v9}, Lorg/rabochaya/projects/SvgPath;->number(Z)D

    move-result-wide v2

    invoke-direct {v13, v9}, Lorg/rabochaya/projects/SvgPath;->number(Z)D

    move-result-wide v16

    invoke-direct {v13, v9}, Lorg/rabochaya/projects/SvgPath;->number(Z)D

    move-result-wide v26

    invoke-direct {v13, v9}, Lorg/rabochaya/projects/SvgPath;->number(Z)D

    move-result-wide v28

    add-double/2addr v7, v5

    add-double v0, v0, v24

    add-double/2addr v2, v5

    move v12, v15

    add-double v14, v16, v24

    add-double v5, v26, v5

    move-wide/from16 v16, v5

    add-double v4, v28, v24

    const/4 v6, 0x6

    new-array v6, v6, [D

    aput-wide v7, v6, v9

    const/4 v7, 0x1

    aput-wide v0, v6, v7

    const/4 v0, 0x2

    aput-wide v2, v6, v0

    aput-wide v14, v6, v19

    const/4 v0, 0x4

    aput-wide v16, v6, v0

    const/4 v0, 0x5

    aput-wide v4, v6, v0

    const/16 v0, 0x43

    invoke-direct {v13, v0, v6}, Lorg/rabochaya/projects/SvgPath;->emit(C[D)V

    iput-wide v2, v13, Lorg/rabochaya/projects/SvgPath;->controlX:D

    iput-wide v14, v13, Lorg/rabochaya/projects/SvgPath;->controlY:D

    move-wide/from16 v0, v16

    iput-wide v0, v13, Lorg/rabochaya/projects/SvgPath;->x:D

    iput-wide v4, v13, Lorg/rabochaya/projects/SvgPath;->y:D

    move v14, v11

    move v15, v12

    goto :goto_c

    .line 31
    :sswitch_7
    move-wide/from16 v24, v3

    move/from16 v31, v12

    move v12, v11

    move/from16 v11, v31

    const/4 v14, 0x0

    invoke-direct {v13, v14}, Lorg/rabochaya/projects/SvgPath;->number(Z)D

    move-result-wide v0

    invoke-direct {v13, v14}, Lorg/rabochaya/projects/SvgPath;->number(Z)D

    move-result-wide v9

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/SvgPath;->flag()I

    move-result v15

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/SvgPath;->flag()I

    move-result v16

    invoke-direct {v13, v14}, Lorg/rabochaya/projects/SvgPath;->number(Z)D

    move-result-wide v2

    invoke-direct {v13, v14}, Lorg/rabochaya/projects/SvgPath;->number(Z)D

    move-result-wide v18

    invoke-static {v7, v8}, Ljava/lang/Math;->abs(D)D

    move-result-wide v7

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v20

    add-double v22, v2, v5

    add-double v18, v18, v24

    move-object/from16 v0, p0

    move-wide v1, v7

    move-wide/from16 v3, v20

    move-wide v5, v9

    move v7, v15

    move/from16 v8, v16

    move-wide/from16 v9, v22

    move v14, v11

    move v15, v12

    move-wide/from16 v11, v18

    invoke-direct/range {v0 .. v12}, Lorg/rabochaya/projects/SvgPath;->arc(DDDIIDD)V

    invoke-static/range {v22 .. v23}, Lorg/rabochaya/projects/SvgPath;->bounded(D)D

    move-result-wide v0

    iput-wide v0, v13, Lorg/rabochaya/projects/SvgPath;->x:D

    invoke-static/range {v18 .. v19}, Lorg/rabochaya/projects/SvgPath;->bounded(D)D

    move-result-wide v0

    iput-wide v0, v13, Lorg/rabochaya/projects/SvgPath;->y:D

    .line 33
    :goto_c
    move v0, v15

    :goto_d
    iput-char v14, v13, Lorg/rabochaya/projects/SvgPath;->previous:C

    .line 34
    const/16 v14, 0x4d

    const/4 v15, 0x0

    goto/16 :goto_0

    .line 20
    :cond_12
    invoke-static {}, Lorg/rabochaya/projects/SvgPath;->invalid()Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    .line 18
    :cond_13
    invoke-static {}, Lorg/rabochaya/projects/SvgPath;->invalid()Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    :sswitch_data_0
    .sparse-switch
        0x41 -> :sswitch_7
        0x43 -> :sswitch_6
        0x48 -> :sswitch_5
        0x4c -> :sswitch_4
        0x4d -> :sswitch_4
        0x51 -> :sswitch_3
        0x53 -> :sswitch_2
        0x54 -> :sswitch_1
        0x56 -> :sswitch_0
    .end sparse-switch
.end method

.method private separator(Z)V
    .locals 2

    .line 13
    invoke-direct {p0}, Lorg/rabochaya/projects/SvgPath;->space()V

    iget v0, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    iget-object v1, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2c

    if-ne v0, v1, :cond_2

    if-nez p1, :cond_1

    iget p1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-direct {p0}, Lorg/rabochaya/projects/SvgPath;->space()V

    iget p1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eq p1, v0, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v0, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result p1

    if-eq p1, v1, :cond_0

    invoke-direct {p0}, Lorg/rabochaya/projects/SvgPath;->letter()Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lorg/rabochaya/projects/SvgPath;->invalid()Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1

    :cond_1
    invoke-static {}, Lorg/rabochaya/projects/SvgPath;->invalid()Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1

    :cond_2
    :goto_0
    return-void
.end method

.method private space()V
    .locals 2

    .line 11
    nop

    :goto_0
    iget v0, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    iget-object v1, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x20

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x9

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0xd

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/SvgPath;->text:Ljava/lang/String;

    iget v1, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_1

    :cond_0
    iget v0, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/rabochaya/projects/SvgPath;->at:I

    goto :goto_0

    :cond_1
    return-void
.end method
