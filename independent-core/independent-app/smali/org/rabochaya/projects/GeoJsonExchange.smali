.class final Lorg/rabochaya/projects/GeoJsonExchange;
.super Ljava/lang/Object;
.source "GeoJsonExchange.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static array(Ljava/util/List;)Lorg/json/JSONArray;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[D>;)",
            "Lorg/json/JSONArray;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 203
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [D

    invoke-static {v1}, Lorg/rabochaya/projects/GeoJsonExchange;->array([D)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private static array([D)Lorg/json/JSONArray;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 206
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-wide v3, p0, v2

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private static geometry(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 200
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "type"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v0, "coordinates"

    invoke-virtual {p0, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method private static group(Ljava/util/List;Ljava/lang/Object;I)Lorg/json/JSONObject;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/w3c/dom/Element;",
            ">;",
            "Ljava/lang/Object;",
            "I)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 181
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    .line 182
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 183
    nop

    .line 184
    instance-of v2, p1, Lorg/json/JSONArray;

    .line 185
    const/4 v3, 0x0

    const/4 v4, 0x0

    move v6, v2

    move v5, v3

    move-object v7, v4

    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v8

    const-string v9, "type"

    if-ge v5, v8, :cond_4

    .line 186
    if-eqz v2, :cond_0

    move-object v8, p1

    check-cast v8, Lorg/json/JSONArray;

    invoke-virtual {v8, v5}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v8

    goto :goto_1

    :cond_0
    move-object v8, v4

    .line 187
    :goto_1
    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/w3c/dom/Element;

    invoke-static {v10, v8, p2}, Lorg/rabochaya/projects/GeoJsonExchange;->writeGeometry(Lorg/w3c/dom/Element;Ljava/lang/Object;I)Lorg/json/JSONObject;

    move-result-object v8

    .line 188
    invoke-virtual {v0, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 189
    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 190
    if-nez v7, :cond_1

    move-object v7, v9

    .line 191
    :cond_1
    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    const-string v10, "coordinates"

    if-eqz v9, :cond_3

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_2

    goto :goto_2

    :cond_2
    move v9, v3

    goto :goto_3

    :cond_3
    :goto_2
    const/4 v9, 0x1

    :goto_3
    or-int/2addr v6, v9

    .line 192
    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v1, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 185
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 194
    :cond_4
    if-nez v6, :cond_5

    const-string p0, "LineString"

    const-string p1, "Polygon"

    const-string p2, "Point"

    filled-new-array {p2, p0, p1}, [Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5

    .line 195
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "Multi"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v1}, Lorg/rabochaya/projects/GeoJsonExchange;->geometry(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    .line 196
    :cond_5
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    const-string p1, "GeometryCollection"

    invoke-virtual {p0, v9, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p1, "geometries"

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    .line 181
    :cond_6
    const-string p0, "\u041f\u0443\u0441\u0442\u0430\u044f \u043a\u043e\u043b\u043b\u0435\u043a\u0446\u0438\u044f \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u0439"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method private static line(Lorg/json/JSONArray;I)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "I)",
            "Ljava/util/List<",
            "[D>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 98
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lt v0, p1, :cond_1

    .line 99
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 100
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v1

    invoke-static {v1}, Lorg/rabochaya/projects/GeoJsonExchange;->point(Lorg/json/JSONArray;)[D

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 101
    :cond_0
    return-object p1

    .line 98
    :cond_1
    const-string p0, "\u0412 \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u0438 \u043d\u0435\u0434\u043e\u0441\u0442\u0430\u0442\u043e\u0447\u043d\u043e \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method private static named(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 54
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    .line 55
    instance-of p1, p0, Ljava/lang/String;

    if-eqz p1, :cond_0

    check-cast p0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string p0, ""

    :goto_0
    return-object p0
.end method

.method private static orientation(Ljava/util/List;)D
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[D>;)D"
        }
    .end annotation

    .line 168
    move-object/from16 v0, p0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [D

    aget-wide v3, v2, v1

    .line 169
    const-wide/16 v5, 0x0

    const/4 v2, 0x1

    move v7, v2

    :goto_0
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->size()I

    move-result v8

    if-ge v7, v8, :cond_2

    .line 170
    add-int/lit8 v8, v7, -0x1

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [D

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [D

    .line 171
    aget-wide v10, v9, v1

    aget-wide v12, v8, v1

    sub-double/2addr v10, v12

    .line 172
    const-wide v12, 0x4066800000000000L    # 180.0

    cmpl-double v12, v10, v12

    const-wide v13, 0x4076800000000000L    # 360.0

    if-lez v12, :cond_0

    sub-double/2addr v10, v13

    .line 173
    :cond_0
    const-wide v15, -0x3f99800000000000L    # -180.0

    cmpg-double v12, v10, v15

    if-gez v12, :cond_1

    add-double/2addr v10, v13

    .line 174
    :cond_1
    add-double/2addr v10, v3

    .line 175
    aget-wide v12, v9, v2

    mul-double/2addr v3, v12

    aget-wide v12, v8, v2

    mul-double/2addr v12, v10

    sub-double/2addr v3, v12

    add-double/2addr v5, v3

    .line 169
    add-int/lit8 v7, v7, 0x1

    move-wide v3, v10

    goto :goto_0

    .line 177
    :cond_2
    return-wide v5
.end method

.method private static point(Lorg/json/JSONArray;)[D
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 91
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    .line 92
    const/4 v1, 0x2

    if-lt v0, v1, :cond_3

    const/4 v2, 0x3

    if-gt v0, v2, :cond_3

    .line 93
    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v0, :cond_1

    invoke-virtual {p0, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    instance-of v5, v5, Ljava/lang/Number;

    if-eqz v5, :cond_0

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    const-string p0, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b GeoJSON \u0434\u043e\u043b\u0436\u043d\u044b \u0431\u044b\u0442\u044c \u0447\u0438\u0441\u043b\u0430\u043c\u0438"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 94
    :cond_1
    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {p0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    if-ne v0, v2, :cond_2

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    :cond_2
    const/4 p0, 0x0

    :goto_1
    invoke-static {v3, v4, p0}, Lorg/rabochaya/projects/ObjectExchange;->position(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[D

    move-result-object p0

    return-object p0

    .line 92
    :cond_3
    const-string p0, "\u041f\u043e\u0437\u0438\u0446\u0438\u044f GeoJSON \u0434\u043e\u043b\u0436\u043d\u0430 \u0438\u043c\u0435\u0442\u044c 2 \u0438\u043b\u0438 3 \u0447\u0438\u0441\u043b\u0430"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method private static polygon(Lorg/json/JSONArray;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "[D>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 105
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-eqz v0, :cond_1

    .line 106
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 107
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 108
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v2

    const/4 v3, 0x4

    invoke-static {v2, v3}, Lorg/rabochaya/projects/GeoJsonExchange;->line(Lorg/json/JSONArray;I)Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Lorg/rabochaya/projects/ObjectExchange;->requireRing(Ljava/util/List;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 110
    :cond_0
    return-object v0

    .line 105
    :cond_1
    const-string p0, "\u041d\u0435\u0442 \u0432\u043d\u0435\u0448\u043d\u0435\u0433\u043e \u043a\u043e\u043d\u0442\u0443\u0440\u0430 \u043e\u0431\u043b\u0430\u0441\u0442\u0438"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method static read(Ljava/lang/String;)Lorg/w3c/dom/Document;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 11
    new-instance v0, Lorg/json/JSONTokener;

    invoke-direct {v0, p0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 12
    invoke-virtual {v0}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/json/JSONObject;

    .line 13
    invoke-virtual {v0}, Lorg/json/JSONTokener;->nextClean()C

    move-result v0

    if-nez v0, :cond_3

    .line 14
    invoke-static {}, Lorg/rabochaya/projects/ObjectExchange;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectExchange;->kml(Lorg/w3c/dom/Document;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 15
    invoke-static {p0}, Lorg/rabochaya/projects/GeoJsonExchange;->rejectLegacyCrs(Lorg/json/JSONObject;)V

    .line 16
    const-string v2, "type"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v4, 0x0

    sparse-switch v3, :sswitch_data_0

    :cond_0
    goto :goto_0

    :sswitch_0
    const-string v3, "Feature"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_1

    :sswitch_1
    const-string v3, "FeatureCollection"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v2, v4

    goto :goto_1

    :goto_0
    const/4 v2, -0x1

    :goto_1
    packed-switch v2, :pswitch_data_0

    .line 24
    const-string v2, ""

    invoke-static {v1, v2, v2}, Lorg/rabochaya/projects/ObjectExchange;->place(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 25
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "shape"

    invoke-static {v1, p0, v4}, Lorg/rabochaya/projects/GeoJsonExchange;->readGeometry(Lorg/w3c/dom/Element;Lorg/json/JSONObject;I)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v2, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v2, "rk-exchange-geojson"

    invoke-static {v1, v2, p0}, Lorg/rabochaya/projects/ObjectExchange;->data(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 22
    :pswitch_0
    invoke-static {v1, p0}, Lorg/rabochaya/projects/GeoJsonExchange;->readFeature(Lorg/w3c/dom/Element;Lorg/json/JSONObject;)V

    goto :goto_3

    .line 18
    :pswitch_1
    const-string v2, "features"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/16 v3, 0x2710

    if-gt v2, v3, :cond_2

    .line 20
    nop

    :goto_2
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v4, v2, :cond_1

    invoke-virtual {p0, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/rabochaya/projects/GeoJsonExchange;->readFeature(Lorg/w3c/dom/Element;Lorg/json/JSONObject;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 21
    :cond_1
    goto :goto_3

    .line 19
    :cond_2
    const-string p0, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u043c\u043d\u043e\u0433\u043e \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 27
    :goto_3
    return-object v0

    .line 13
    :cond_3
    const-string p0, "\u041b\u0438\u0448\u043d\u0438\u0435 \u0434\u0430\u043d\u043d\u044b\u0435 \u043f\u043e\u0441\u043b\u0435 GeoJSON"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x521e75ec -> :sswitch_1
        0x28db12d6 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static readFeature(Lorg/w3c/dom/Element;Lorg/json/JSONObject;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 31
    invoke-static {p1}, Lorg/rabochaya/projects/GeoJsonExchange;->rejectLegacyCrs(Lorg/json/JSONObject;)V

    .line 32
    const-string v0, "type"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Feature"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 33
    const-string v0, "properties"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    goto :goto_0

    :cond_0
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 34
    :goto_0
    const-string v2, "name"

    invoke-static {v1, v2}, Lorg/rabochaya/projects/GeoJsonExchange;->named(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "description"

    invoke-static {v1, v3}, Lorg/rabochaya/projects/GeoJsonExchange;->named(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v2, v3}, Lorg/rabochaya/projects/ObjectExchange;->place(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    .line 35
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "nullProperties"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    .line 36
    const-string v2, "id"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 37
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 38
    instance-of v4, v3, Ljava/lang/String;

    if-nez v4, :cond_2

    instance-of v4, v3, Ljava/lang/Number;

    if-eqz v4, :cond_1

    goto :goto_1

    :cond_1
    const-string p0, "\u041d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u044b\u0439 \u0438\u0434\u0435\u043d\u0442\u0438\u0444\u0438\u043a\u0430\u0442\u043e\u0440 GeoJSON"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 39
    :cond_2
    :goto_1
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 41
    :cond_3
    const-string v2, "geometry"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 42
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 43
    const/4 v2, 0x0

    invoke-static {p0, p1, v2}, Lorg/rabochaya/projects/GeoJsonExchange;->readGeometry(Lorg/w3c/dom/Element;Lorg/json/JSONObject;I)Ljava/lang/Object;

    move-result-object p1

    .line 44
    const-string v2, "shape"

    invoke-virtual {v0, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "rk-exchange-geojson"

    invoke-static {p0, v0, p1}, Lorg/rabochaya/projects/ObjectExchange;->data(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    const-string p1, "rk:gpx-kind"

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 46
    const-string v0, "rte"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "trk"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    :cond_4
    const-string v0, "rk-exchange-gpx-kind"

    invoke-static {p0, v0, p1}, Lorg/rabochaya/projects/ObjectExchange;->data(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    :cond_5
    return-void

    .line 41
    :cond_6
    const-string p0, "\u041e\u0431\u044a\u0435\u043a\u0442 GeoJSON \u0431\u0435\u0437 \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u0438"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 32
    :cond_7
    const-string p0, "\u041e\u0436\u0438\u0434\u0430\u043b\u0441\u044f \u043e\u0431\u044a\u0435\u043a\u0442 GeoJSON Feature"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method private static readGeometry(Lorg/w3c/dom/Element;Lorg/json/JSONObject;I)Ljava/lang/Object;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 60
    const/16 v0, 0x40

    if-gt p2, v0, :cond_8

    .line 61
    invoke-static {p1}, Lorg/rabochaya/projects/GeoJsonExchange;->rejectLegacyCrs(Lorg/json/JSONObject;)V

    .line 62
    const-string v0, "type"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 63
    const-string v1, "GeometryCollection"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    const-string v3, "MultiGeometry"

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v1, :cond_2

    .line 64
    const-string v0, "geometries"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 65
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-eqz v1, :cond_1

    .line 66
    invoke-static {p0, v3, v2}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    .line 67
    nop

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v4, v1, :cond_0

    invoke-virtual {p1, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    add-int/lit8 v2, p2, 0x1

    invoke-static {p0, v1, v2}, Lorg/rabochaya/projects/GeoJsonExchange;->readGeometry(Lorg/w3c/dom/Element;Lorg/json/JSONObject;I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 68
    :cond_0
    return-object v0

    .line 65
    :cond_1
    const-string p0, "\u041f\u0443\u0441\u0442\u0430\u044f \u043a\u043e\u043b\u043b\u0435\u043a\u0446\u0438\u044f \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u0439"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 70
    :cond_2
    const-string p2, "coordinates"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    .line 71
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result p2

    const-string v1, "MultiLineString"

    const-string v6, "MultiPoint"

    const/4 v7, 0x2

    const-string v8, "LineString"

    const-string v9, "Point"

    sparse-switch p2, :sswitch_data_0

    :cond_3
    goto :goto_1

    :sswitch_0
    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    goto :goto_2

    :sswitch_1
    const-string p2, "Polygon"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    move v5, v7

    goto :goto_2

    :sswitch_2
    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    move v5, v4

    goto :goto_2

    :sswitch_3
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    const/4 v5, 0x4

    goto :goto_2

    :sswitch_4
    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    const/4 v5, 0x3

    goto :goto_2

    :sswitch_5
    const-string p2, "MultiPolygon"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    const/4 v5, 0x5

    goto :goto_2

    :goto_1
    const/4 v5, -0x1

    :goto_2
    packed-switch v5, :pswitch_data_0

    .line 85
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, "\u041d\u0435\u0438\u0437\u0432\u0435\u0441\u0442\u043d\u0430\u044f \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f GeoJSON "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 76
    :pswitch_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p2

    if-eqz p2, :cond_7

    .line 77
    invoke-static {p0, v3, v2}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    .line 78
    nop

    :goto_3
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p2

    if-ge v4, p2, :cond_6

    .line 79
    invoke-virtual {p1, v4}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object p2

    .line 80
    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-static {p2}, Lorg/rabochaya/projects/GeoJsonExchange;->point(Lorg/json/JSONArray;)[D

    move-result-object p2

    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-static {p0, v9, p2}, Lorg/rabochaya/projects/ObjectExchange;->geometry(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/util/List;)V

    goto :goto_4

    .line 81
    :cond_4
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-static {p2, v7}, Lorg/rabochaya/projects/GeoJsonExchange;->line(Lorg/json/JSONArray;I)Ljava/util/List;

    move-result-object p2

    invoke-static {p0, v8, p2}, Lorg/rabochaya/projects/ObjectExchange;->geometry(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/util/List;)V

    goto :goto_4

    .line 82
    :cond_5
    invoke-static {p2}, Lorg/rabochaya/projects/GeoJsonExchange;->polygon(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object p2

    invoke-static {p0, p2}, Lorg/rabochaya/projects/ObjectExchange;->polygon(Lorg/w3c/dom/Element;Ljava/util/List;)V

    .line 78
    :goto_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 84
    :cond_6
    goto :goto_5

    .line 76
    :cond_7
    const-string p0, "\u041f\u0443\u0441\u0442\u0430\u044f \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 74
    :pswitch_1
    invoke-static {p1}, Lorg/rabochaya/projects/GeoJsonExchange;->polygon(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object p1

    invoke-static {p0, p1}, Lorg/rabochaya/projects/ObjectExchange;->polygon(Lorg/w3c/dom/Element;Ljava/util/List;)V

    goto :goto_5

    .line 73
    :pswitch_2
    invoke-static {p1, v7}, Lorg/rabochaya/projects/GeoJsonExchange;->line(Lorg/json/JSONArray;I)Ljava/util/List;

    move-result-object p1

    invoke-static {p0, v8, p1}, Lorg/rabochaya/projects/ObjectExchange;->geometry(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/util/List;)V

    goto :goto_5

    .line 72
    :pswitch_3
    invoke-static {p1}, Lorg/rabochaya/projects/GeoJsonExchange;->point(Lorg/json/JSONArray;)[D

    move-result-object p1

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-static {p0, v9, p1}, Lorg/rabochaya/projects/ObjectExchange;->geometry(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/util/List;)V

    .line 87
    :goto_5
    return-object v0

    .line 60
    :cond_8
    const-string p0, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0433\u043b\u0443\u0431\u043e\u043a\u0430\u044f \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    :sswitch_data_0
    .sparse-switch
        -0x7e2b361f -> :sswitch_5
        -0x3f883809 -> :sswitch_4
        -0x2560d4e2 -> :sswitch_3
        0x49b6570 -> :sswitch_2
        0x4b86ed1a -> :sswitch_1
        0x6bb01145 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static rejectLegacyCrs(Lorg/json/JSONObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 50
    const-string v0, "crs"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    .line 51
    return-void

    .line 50
    :cond_0
    const-string p0, "\u0422\u0440\u0435\u0431\u0443\u044e\u0442\u0441\u044f \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b GeoJSON RFC 7946 \u0432 WGS 84"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method private static updateProperty(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 141
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 142
    :cond_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    instance-of p2, p2, Ljava/lang/String;

    if-eqz p2, :cond_1

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_1

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 143
    :cond_1
    :goto_0
    return-void
.end method

.method static write(Lorg/w3c/dom/Element;)Lorg/json/JSONObject;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 114
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 115
    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->features(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const-string v2, "type"

    if-eqz v1, :cond_b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 116
    invoke-static {v1}, Lorg/rabochaya/projects/ObjectExchange;->geometries(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v3

    .line 117
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    .line 118
    :cond_0
    invoke-static {v1}, Lorg/rabochaya/projects/ObjectExchange;->data(Lorg/w3c/dom/Element;)Ljava/util/Map;

    move-result-object v4

    .line 119
    const-string v5, "rk-exchange-geojson"

    invoke-interface {v4, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    new-instance v6, Lorg/json/JSONObject;

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-direct {v6, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 120
    :goto_1
    const-string v7, "properties"

    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    .line 121
    if-nez v8, :cond_2

    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 122
    :cond_2
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_4

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Map$Entry;

    .line 123
    invoke-interface {v10}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 124
    const-string v12, "rk-"

    invoke-virtual {v11, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_3

    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_3

    invoke-interface {v10}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v8, v11, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 125
    :cond_3
    goto :goto_2

    .line 126
    :cond_4
    const-string v9, "name"

    invoke-static {v1, v9}, Lorg/rabochaya/projects/ObjectExchange;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lorg/rabochaya/projects/GeoJsonExchange;->updateProperty(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    const-string v9, "description"

    invoke-static {v1}, Lorg/rabochaya/projects/ObjectExchange;->description(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lorg/rabochaya/projects/GeoJsonExchange;->updateProperty(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    const-string v10, "Feature"

    invoke-virtual {v9, v2, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    .line 129
    const-string v9, "id"

    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_5

    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v9, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3

    .line 130
    :cond_5
    invoke-interface {v1, v9}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_6

    invoke-interface {v4, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_6

    invoke-interface {v1, v9}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v9, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 131
    :cond_6
    :goto_3
    const-string v1, "rte"

    const-string v5, "rk-exchange-gpx-kind"

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    const-string v1, "trk"

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    :cond_7
    const-string v1, "rk:gpx-kind"

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v8, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 132
    :cond_8
    invoke-virtual {v8}, Lorg/json/JSONObject;->length()I

    move-result v1

    if-nez v1, :cond_9

    const-string v1, "nullProperties"

    invoke-virtual {v6, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    sget-object v8, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    :cond_9
    invoke-virtual {v2, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 133
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v1

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-ne v1, v4, :cond_a

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    const-string v3, "shape"

    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v1, v3, v5}, Lorg/rabochaya/projects/GeoJsonExchange;->writeGeometry(Lorg/w3c/dom/Element;Ljava/lang/Object;I)Lorg/json/JSONObject;

    move-result-object v1

    goto :goto_4

    :cond_a
    const/4 v1, 0x0

    invoke-static {v3, v1, v5}, Lorg/rabochaya/projects/GeoJsonExchange;->group(Ljava/util/List;Ljava/lang/Object;I)Lorg/json/JSONObject;

    move-result-object v1

    .line 134
    :goto_4
    const-string v3, "geometry"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 135
    goto/16 :goto_0

    .line 136
    :cond_b
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result p0

    if-eqz p0, :cond_c

    .line 137
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "FeatureCollection"

    invoke-virtual {p0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "features"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    .line 136
    :cond_c
    const-string p0, "\u041d\u0435\u0442 \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432 \u0434\u043b\u044f GeoJSON"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method private static writeGeometry(Lorg/w3c/dom/Element;Ljava/lang/Object;I)Lorg/json/JSONObject;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 146
    const/16 v0, 0x40

    if-gt p2, v0, :cond_6

    .line 147
    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->tag(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x2

    const-string v4, "LineString"

    const-string v5, "Polygon"

    const-string v6, "Point"

    const/4 v7, 0x1

    sparse-switch v1, :sswitch_data_0

    :cond_0
    goto :goto_0

    :sswitch_0
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v7

    goto :goto_1

    :sswitch_1
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v3

    goto :goto_1

    :sswitch_2
    const-string v1, "MultiGeometry"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    goto :goto_1

    :sswitch_3
    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v2

    goto :goto_1

    :goto_0
    const/4 v0, -0x1

    :goto_1
    packed-switch v0, :pswitch_data_0

    .line 163
    const-string p0, "\u041d\u0435\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u043c\u0430\u044f \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f KML"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 162
    :pswitch_0
    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->geometries(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object p0

    add-int/2addr p2, v7

    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/GeoJsonExchange;->group(Ljava/util/List;Ljava/lang/Object;I)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    .line 155
    :pswitch_1
    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1}, Lorg/json/JSONArray;-><init>()V

    .line 156
    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->rings(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    .line 157
    invoke-static {p2}, Lorg/rabochaya/projects/GeoJsonExchange;->orientation(Ljava/util/List;)D

    move-result-wide v0

    .line 158
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    const-wide/16 v3, 0x0

    if-nez v2, :cond_1

    cmpg-double v0, v0, v3

    if-gez v0, :cond_2

    goto :goto_3

    :cond_1
    cmpl-double v0, v0, v3

    if-lez v0, :cond_2

    :goto_3
    invoke-static {p2}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 159
    :cond_2
    invoke-static {p2}, Lorg/rabochaya/projects/GeoJsonExchange;->array(Ljava/util/List;)Lorg/json/JSONArray;

    move-result-object p2

    invoke-virtual {p1, p2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 160
    goto :goto_2

    .line 161
    :cond_3
    invoke-static {v5, p1}, Lorg/rabochaya/projects/GeoJsonExchange;->geometry(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    .line 152
    :pswitch_2
    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->positions(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p1

    if-lt p1, v3, :cond_4

    .line 153
    invoke-static {p0}, Lorg/rabochaya/projects/GeoJsonExchange;->array(Ljava/util/List;)Lorg/json/JSONArray;

    move-result-object p0

    invoke-static {v4, p0}, Lorg/rabochaya/projects/GeoJsonExchange;->geometry(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    .line 152
    :cond_4
    const-string p0, "\u041e\u0436\u0438\u0434\u0430\u043b\u0430\u0441\u044c \u043b\u0438\u043d\u0438\u044f"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 149
    :pswitch_3
    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->positions(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p1

    if-ne p1, v7, :cond_5

    .line 150
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [D

    invoke-static {p0}, Lorg/rabochaya/projects/GeoJsonExchange;->array([D)Lorg/json/JSONArray;

    move-result-object p0

    invoke-static {v6, p0}, Lorg/rabochaya/projects/GeoJsonExchange;->geometry(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0

    .line 149
    :cond_5
    const-string p0, "\u041e\u0436\u0438\u0434\u0430\u043b\u0430\u0441\u044c \u043e\u0434\u043d\u0430 \u0442\u043e\u0447\u043a\u0430"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 146
    :cond_6
    const-string p0, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0433\u043b\u0443\u0431\u043e\u043a\u0430\u044f \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    nop

    :sswitch_data_0
    .sparse-switch
        0x49b6570 -> :sswitch_3
        0x55028ab -> :sswitch_2
        0x4b86ed1a -> :sswitch_1
        0x6bb01145 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
