.class public final Lorg/rabochaya/projects/GeometryCoordinates;
.super Ljava/lang/Object;
.source "GeometryCoordinates.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static finite(D)Z
    .locals 1

    .line 27
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

.method public static kml(Ljava/util/List;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[D>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [D

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_0

    const/16 v2, 0x20

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_0
    const/4 v2, 0x0

    aget-wide v2, v1, v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x2c

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v4, 0x1

    aget-wide v4, v1, v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x2

    aget-wide v3, v1, v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static parse(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 26
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "[D>;"
        }
    .end annotation

    .line 7
    move-object/from16 v0, p1

    if-eqz p0, :cond_13

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v1

    const v2, 0x7a120

    if-gt v1, v2, :cond_13

    .line 8
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    const-string v3, "[\\r\\n]+"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    const-wide v6, -0x3f99800000000000L    # -180.0

    const-wide v8, 0x4056800000000000L    # 90.0

    const/4 v12, 0x3

    const/4 v15, 0x2

    const/4 v13, 0x1

    if-ge v5, v3, :cond_4

    aget-object v14, v2, v5

    .line 10
    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    const-string v10, "\\s+"

    invoke-virtual {v14, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    array-length v11, v10

    if-lt v11, v15, :cond_3

    array-length v11, v10

    if-gt v11, v12, :cond_3

    .line 11
    nop

    .line 12
    :try_start_0
    aget-object v11, v10, v4

    invoke-static {v11}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v20

    aget-object v11, v10, v13

    invoke-static {v11}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v22

    array-length v11, v10

    if-ne v11, v12, :cond_0

    aget-object v10, v10, v15

    invoke-static {v10}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v10
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-wide/from16 v16, v10

    goto :goto_1

    :cond_0
    const-wide/16 v16, 0x0

    .line 13
    :goto_1
    invoke-static/range {v20 .. v21}, Lorg/rabochaya/projects/GeometryCoordinates;->finite(D)Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-static/range {v22 .. v23}, Lorg/rabochaya/projects/GeometryCoordinates;->finite(D)Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-static/range {v16 .. v17}, Lorg/rabochaya/projects/GeometryCoordinates;->finite(D)Z

    move-result v10

    if-eqz v10, :cond_2

    const-wide v10, -0x3fa9800000000000L    # -90.0

    cmpg-double v10, v20, v10

    if-ltz v10, :cond_2

    cmpl-double v8, v20, v8

    if-gtz v8, :cond_2

    cmpg-double v6, v22, v6

    if-ltz v6, :cond_2

    const-wide v6, 0x4066800000000000L    # 180.0

    cmpl-double v6, v22, v6

    if-gtz v6, :cond_2

    .line 14
    new-array v6, v12, [D

    aput-wide v22, v6, v4

    aput-wide v20, v6, v13

    aput-wide v16, v6, v15

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/16 v7, 0x2710

    if-gt v6, v7, :cond_1

    .line 9
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 14
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u041f\u0440\u0435\u0434\u0435\u043b \u2014 10 000 \u0432\u0435\u0440\u0448\u0438\u043d"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 13
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u0428\u0438\u0440\u043e\u0442\u0430 \u043e\u0442 \u221290 \u0434\u043e 90, \u0434\u043e\u043b\u0433\u043e\u0442\u0430 \u043e\u0442 \u2212180 \u0434\u043e 180; \u0447\u0438\u0441\u043b\u0430 \u0434\u043e\u043b\u0436\u043d\u044b \u0431\u044b\u0442\u044c \u043a\u043e\u043d\u0435\u0447\u043d\u044b\u043c\u0438"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 12
    :catch_0
    move-exception v0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u041d\u0435\u0432\u0435\u0440\u043d\u043e\u0435 \u0447\u0438\u0441\u043b\u043e \u0432 \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u0430\u0445"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 10
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u041a\u0430\u0436\u0434\u0430\u044f \u0441\u0442\u0440\u043e\u043a\u0430: \u0448\u0438\u0440\u043e\u0442\u0430 \u0434\u043e\u043b\u0433\u043e\u0442\u0430 [\u0432\u044b\u0441\u043e\u0442\u0430]. \u0414\u0435\u0441\u044f\u0442\u0438\u0447\u043d\u044b\u0439 \u0440\u0430\u0437\u0434\u0435\u043b\u0438\u0442\u0435\u043b\u044c \u2014 \u0442\u043e\u0447\u043a\u0430"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 16
    :cond_4
    const-string v2, "Point"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v3, v13, :cond_5

    goto :goto_2

    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u0414\u043b\u044f \u043c\u0435\u0442\u043a\u0438 \u043d\u0443\u0436\u043d\u0430 \u043e\u0434\u043d\u0430 \u0441\u0442\u0440\u043e\u043a\u0430 \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 17
    :cond_6
    :goto_2
    const-string v3, "LineString"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lt v5, v15, :cond_7

    goto :goto_3

    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u0414\u043b\u044f \u043c\u0430\u0440\u0448\u0440\u0443\u0442\u0430 \u043d\u0443\u0436\u043d\u044b \u043c\u0438\u043d\u0438\u043c\u0443\u043c \u0434\u0432\u0435 \u0432\u0435\u0440\u0448\u0438\u043d\u044b"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 18
    :cond_8
    :goto_3
    const-string v5, "Polygon"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_11

    .line 19
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-lt v10, v12, :cond_10

    .line 20
    new-instance v10, Ljava/util/HashSet;

    invoke-direct {v10}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_4
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_d

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, [D

    aget-wide v20, v14, v13

    const-wide/16 v16, 0x0

    cmpl-double v20, v20, v16

    if-nez v20, :cond_9

    move-wide/from16 v22, v16

    goto :goto_5

    :cond_9
    aget-wide v20, v14, v13

    move-wide/from16 v22, v20

    :goto_5
    aget-wide v20, v14, v4

    cmpl-double v20, v20, v16

    if-nez v20, :cond_a

    move-wide/from16 v20, v16

    goto :goto_6

    :cond_a
    aget-wide v20, v14, v4

    :goto_6
    const-wide v18, 0x4066800000000000L    # 180.0

    cmpl-double v14, v20, v18

    if-nez v14, :cond_b

    move-wide/from16 v20, v6

    :cond_b
    invoke-static/range {v22 .. v23}, Ljava/lang/Math;->abs(D)D

    move-result-wide v24

    cmpl-double v14, v24, v8

    if-nez v14, :cond_c

    move-wide/from16 v6, v16

    goto :goto_7

    :cond_c
    move-wide/from16 v6, v20

    :goto_7
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-wide/from16 v8, v22

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-wide v6, -0x3f99800000000000L    # -180.0

    const-wide v8, 0x4056800000000000L    # 90.0

    goto :goto_4

    .line 21
    :cond_d
    invoke-virtual {v10}, Ljava/util/HashSet;->size()I

    move-result v6

    if-lt v6, v12, :cond_f

    .line 22
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [D

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v7

    sub-int/2addr v7, v13

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [D

    aget-wide v8, v6, v4

    aget-wide v10, v7, v4

    cmpl-double v4, v8, v10

    if-nez v4, :cond_e

    aget-wide v8, v6, v13

    aget-wide v10, v7, v13

    cmpl-double v4, v8, v10

    if-nez v4, :cond_e

    aget-wide v8, v6, v15

    aget-wide v10, v7, v15

    cmpl-double v4, v8, v10

    if-eqz v4, :cond_11

    :cond_e
    invoke-virtual {v6}, [D->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [D

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 21
    :cond_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u0414\u043b\u044f \u043e\u0431\u043b\u0430\u0441\u0442\u0438 \u043d\u0443\u0436\u043d\u044b \u0442\u0440\u0438 \u0440\u0430\u0437\u043d\u044b\u0435 \u0432\u0435\u0440\u0448\u0438\u043d\u044b"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 19
    :cond_10
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u0414\u043b\u044f \u043e\u0431\u043b\u0430\u0441\u0442\u0438 \u043d\u0443\u0436\u043d\u044b \u043c\u0438\u043d\u0438\u043c\u0443\u043c \u0442\u0440\u0438 \u0432\u0435\u0440\u0448\u0438\u043d\u044b"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 24
    :cond_11
    :goto_8
    filled-new-array {v2, v3, v5}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 25
    return-object v1

    .line 24
    :cond_12
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u041d\u0435\u0438\u0437\u0432\u0435\u0441\u0442\u043d\u044b\u0439 \u0442\u0438\u043f \u043e\u0431\u044a\u0435\u043a\u0442\u0430"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 7
    :cond_13
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0434\u043b\u0438\u043d\u043d\u044b\u0439 \u0441\u043f\u0438\u0441\u043e\u043a \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
