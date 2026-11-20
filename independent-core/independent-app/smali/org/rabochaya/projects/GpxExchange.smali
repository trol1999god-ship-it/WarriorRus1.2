.class final Lorg/rabochaya/projects/GpxExchange;
.super Ljava/lang/Object;
.source "GpxExchange.java"


# static fields
.field private static final COMMON:[Ljava/lang/String;

.field private static final POINT:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 18

    .line 10
    const-string v5, "number"

    const-string v6, "type"

    const-string v0, "name"

    const-string v1, "cmt"

    const-string v2, "desc"

    const-string v3, "src"

    const-string v4, "link"

    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/GpxExchange;->COMMON:[Ljava/lang/String;

    .line 11
    const-string v16, "ageofdgpsdata"

    const-string v17, "dgpsid"

    const-string v1, "time"

    const-string v2, "magvar"

    const-string v3, "geoidheight"

    const-string v4, "name"

    const-string v5, "cmt"

    const-string v6, "desc"

    const-string v7, "src"

    const-string v8, "link"

    const-string v9, "sym"

    const-string v10, "type"

    const-string v11, "fix"

    const-string v12, "sat"

    const-string v13, "hdop"

    const-string v14, "vdop"

    const-string v15, "pdop"

    filled-new-array/range {v1 .. v17}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/GpxExchange;->POINT:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static coordinate(Lorg/w3c/dom/Element;)[D
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 49
    const-string v0, "ele"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/ObjectExchange;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 50
    const-string v1, "lon"

    invoke-interface {p0, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "lat"

    invoke-interface {p0, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x0

    :cond_0
    invoke-static {v1, p0, v0}, Lorg/rabochaya/projects/ObjectExchange;->position(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[D

    move-result-object p0

    return-object p0
.end method

.method private static detached(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 1

    .line 151
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object p0

    const-string v0, "http://www.topografix.com/GPX/1/1"

    invoke-interface {p0, v0, p1}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    return-object p0
.end method

.method private static fields(Lorg/w3c/dom/Element;[Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 67
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 68
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_3

    aget-object v3, p1, v2

    .line 69
    const-string v4, "link"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 70
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 71
    invoke-static {p0, v3}, Lorg/rabochaya/projects/ObjectExchange;->children(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/w3c/dom/Element;

    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    const-string v8, "href"

    invoke-interface {v6, v8}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v7

    .line 72
    const-string v8, "text"

    invoke-static {v6, v8}, Lorg/rabochaya/projects/ObjectExchange;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "type"

    invoke-static {v6, v8}, Lorg/rabochaya/projects/ObjectExchange;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v6

    .line 71
    invoke-virtual {v4, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 73
    :cond_0
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-lez v5, :cond_2

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_2

    .line 74
    :cond_1
    invoke-static {p0, v3}, Lorg/rabochaya/projects/ObjectExchange;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-static {p0, v3}, Lorg/rabochaya/projects/ObjectExchange;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3

    :cond_2
    :goto_2
    nop

    .line 68
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 76
    :cond_3
    return-object v0
.end method

.method private static flatten(Ljava/util/List;I)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/w3c/dom/Element;",
            ">;I)",
            "Ljava/util/List<",
            "Lorg/w3c/dom/Element;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 125
    const/16 v0, 0x40

    if-gt p1, v0, :cond_2

    .line 126
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 127
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 128
    const-string v2, "MultiGeometry"

    invoke-static {v1}, Lorg/rabochaya/projects/ObjectExchange;->tag(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {v1}, Lorg/rabochaya/projects/ObjectExchange;->geometries(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v1

    add-int/lit8 v2, p1, 0x1

    invoke-static {v1, v2}, Lorg/rabochaya/projects/GpxExchange;->flatten(Ljava/util/List;I)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    .line 129
    :cond_0
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    :goto_1
    goto :goto_0

    .line 131
    :cond_1
    return-object v0

    .line 125
    :cond_2
    const-string p0, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0433\u043b\u0443\u0431\u043e\u043a\u0430\u044f \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method private static header(Lorg/w3c/dom/Element;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 154
    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 155
    const-string p1, "name"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    const-string v1, "desc"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 156
    invoke-static {p0, p1}, Lorg/rabochaya/projects/ObjectExchange;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->description(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object p0

    .line 157
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v0, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 158
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 159
    :cond_1
    return-object v0
.end method

.method private static onlyTrackParts(Ljava/util/List;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/w3c/dom/Element;",
            ">;)Z"
        }
    .end annotation

    .line 134
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    const-string v1, "LineString"

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectExchange;->tag(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "Point"

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectExchange;->tag(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 135
    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method private static optFields(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 1

    .line 152
    const-string v0, "fields"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-nez p0, :cond_0

    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    :cond_0
    return-object p0
.end method

.method static read(Lorg/w3c/dom/Document;)Lorg/w3c/dom/Document;
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 15
    invoke-interface/range {p0 .. p0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v0

    .line 16
    invoke-interface {v0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    const-string v2, "http://www.topografix.com/GPX/1/1"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    const-string v1, "version"

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "1.1"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 18
    invoke-static {}, Lorg/rabochaya/projects/ObjectExchange;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v1

    .line 19
    invoke-static {v1}, Lorg/rabochaya/projects/ObjectExchange;->kml(Lorg/w3c/dom/Document;)Lorg/w3c/dom/Element;

    move-result-object v3

    .line 20
    const/4 v4, 0x0

    invoke-static {v0, v4}, Lorg/rabochaya/projects/ObjectExchange;->children(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/w3c/dom/Element;

    .line 21
    invoke-static {v5}, Lorg/rabochaya/projects/ObjectExchange;->tag(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v6

    .line 22
    invoke-interface {v5}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_e

    const-string v7, "wpt"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    const-string v9, "rte"

    const-string v10, "trk"

    if-nez v8, :cond_0

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    goto :goto_0

    .line 23
    :cond_0
    const-string v8, "name"

    invoke-static {v5, v8}, Lorg/rabochaya/projects/ObjectExchange;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v11, "desc"

    invoke-static {v5, v11}, Lorg/rabochaya/projects/ObjectExchange;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v3, v8, v11}, Lorg/rabochaya/projects/ObjectExchange;->place(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v8

    .line 24
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1

    sget-object v12, Lorg/rabochaya/projects/GpxExchange;->POINT:[Ljava/lang/String;

    goto :goto_1

    :cond_1
    sget-object v12, Lorg/rabochaya/projects/GpxExchange;->COMMON:[Ljava/lang/String;

    :goto_1
    invoke-static {v5, v12}, Lorg/rabochaya/projects/GpxExchange;->fields(Lorg/w3c/dom/Element;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    const-string v13, "fields"

    invoke-virtual {v11, v13, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v11

    .line 25
    const-string v12, "extensions"

    invoke-static {v5, v12}, Lorg/rabochaya/projects/ObjectExchange;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v12

    .line 26
    nop

    .line 27
    const-string v13, "area"

    const/4 v14, 0x0

    if-eqz v12, :cond_2

    invoke-static {v12, v13}, Lorg/rabochaya/projects/ObjectExchange;->children(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_2

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/w3c/dom/Element;

    const-string v4, "urn:rabochaya-karta:exchange:1"

    invoke-interface {v15}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v4, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    or-int/2addr v14, v4

    const/4 v4, 0x0

    goto :goto_2

    .line 28
    :cond_2
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 29
    new-instance v12, Lorg/json/JSONArray;

    invoke-direct {v12}, Lorg/json/JSONArray;-><init>()V

    .line 30
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_3

    invoke-static {v5}, Lorg/rabochaya/projects/GpxExchange;->coordinate(Lorg/w3c/dom/Element;)[D

    move-result-object v9

    invoke-static {v9}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v4, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v16, v0

    goto :goto_4

    .line 31
    :cond_3
    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    const-string v9, "rtept"

    invoke-static {v5, v9, v12}, Lorg/rabochaya/projects/GpxExchange;->segment(Lorg/w3c/dom/Element;Ljava/lang/String;Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v4, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v16, v0

    goto :goto_4

    .line 32
    :cond_4
    const-string v9, "trkseg"

    invoke-static {v5, v9}, Lorg/rabochaya/projects/ObjectExchange;->children(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_5

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/w3c/dom/Element;

    move-object/from16 v16, v0

    const-string v0, "trkpt"

    invoke-static {v15, v0, v12}, Lorg/rabochaya/projects/GpxExchange;->segment(Lorg/w3c/dom/Element;Ljava/lang/String;Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v0, v16

    goto :goto_3

    :cond_5
    move-object/from16 v16, v0

    .line 33
    :goto_4
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_d

    .line 34
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "time"

    invoke-static {v5, v0}, Lorg/rabochaya/projects/ObjectExchange;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_6

    const-string v7, "TimeStamp"

    const/4 v9, 0x0

    invoke-static {v8, v7, v9}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v7

    const-string v9, "when"

    invoke-static {v5, v0}, Lorg/rabochaya/projects/ObjectExchange;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v9, v0}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 35
    :cond_6
    if-eqz v14, :cond_7

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    goto :goto_5

    :cond_7
    move-object v13, v6

    :goto_5
    const-string v0, "rk-exchange-gpx-kind"

    invoke-static {v8, v0, v13}, Lorg/rabochaya/projects/ObjectExchange;->data(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    if-eqz v14, :cond_9

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 37
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-static {v5}, Lorg/rabochaya/projects/ObjectExchange;->requireRing(Ljava/util/List;)V

    goto :goto_6

    .line 38
    :cond_8
    invoke-static {v8, v4}, Lorg/rabochaya/projects/ObjectExchange;->polygon(Lorg/w3c/dom/Element;Ljava/util/List;)V

    const/4 v6, 0x0

    goto :goto_a

    .line 40
    :cond_9
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v0

    const/4 v5, 0x1

    if-le v0, v5, :cond_a

    const-string v0, "MultiGeometry"

    const/4 v6, 0x0

    invoke-static {v8, v0, v6}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    goto :goto_7

    :cond_a
    const/4 v6, 0x0

    move-object v0, v8

    .line 41
    :goto_7
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_8
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v9

    if-ne v9, v5, :cond_b

    const-string v9, "Point"

    goto :goto_9

    :cond_b
    const-string v9, "LineString"

    :goto_9
    invoke-static {v0, v9, v7}, Lorg/rabochaya/projects/ObjectExchange;->geometry(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/util/List;)V

    goto :goto_8

    .line 43
    :cond_c
    :goto_a
    const-string v0, "points"

    invoke-virtual {v11, v0, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v4, "rk-exchange-gpx-data"

    invoke-static {v8, v4, v0}, Lorg/rabochaya/projects/ObjectExchange;->data(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    move-object v4, v6

    move-object/from16 v0, v16

    goto/16 :goto_0

    .line 33
    :cond_d
    const-string v0, "\u041f\u0443\u0441\u0442\u043e\u0439 \u0442\u0440\u0435\u043a GPX"

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 22
    :cond_e
    move-object/from16 v16, v0

    move-object v6, v4

    goto/16 :goto_0

    .line 45
    :cond_f
    return-object v1

    .line 17
    :cond_10
    const-string v0, "\u0422\u0440\u0435\u0431\u0443\u0435\u0442\u0441\u044f GPX 1.1"

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0
.end method

.method private static segment(Lorg/w3c/dom/Element;Ljava/lang/String;Lorg/json/JSONArray;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "Ljava/lang/String;",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/List<",
            "[D>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 55
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 56
    invoke-static {p0, p1}, Lorg/rabochaya/projects/ObjectExchange;->children(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/w3c/dom/Element;

    .line 57
    invoke-static {p1}, Lorg/rabochaya/projects/GpxExchange;->coordinate(Lorg/w3c/dom/Element;)[D

    move-result-object v2

    .line 58
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    sget-object v3, Lorg/rabochaya/projects/GpxExchange;->POINT:[Ljava/lang/String;

    invoke-static {p1, v3}, Lorg/rabochaya/projects/GpxExchange;->fields(Lorg/w3c/dom/Element;[Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const/4 v3, 0x0

    aget-wide v3, v2, v3

    const-string v5, "_lon"

    invoke-virtual {p1, v5, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    move-result-object p1

    const/4 v3, 0x1

    aget-wide v3, v2, v3

    const-string v2, "_lat"

    invoke-virtual {p1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {v1, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 60
    goto :goto_0

    .line 61
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_1

    .line 62
    invoke-virtual {p2, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 63
    return-object v0

    .line 61
    :cond_1
    const-string p0, "\u041f\u0443\u0441\u0442\u043e\u0439 \u043c\u0430\u0440\u0448\u0440\u0443\u0442 \u0438\u043b\u0438 \u0441\u0435\u0433\u043c\u0435\u043d\u0442 GPX"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method private static segmentMeta(Lorg/json/JSONObject;I)Lorg/json/JSONArray;
    .locals 1

    .line 161
    const-string v0, "points"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->optJSONArray(I)Lorg/json/JSONArray;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method private static track(Lorg/w3c/dom/Element;Lorg/w3c/dom/Element;Ljava/util/List;ZLorg/json/JSONObject;)Lorg/w3c/dom/Element;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "Lorg/w3c/dom/Element;",
            "Ljava/util/List<",
            "Lorg/w3c/dom/Element;",
            ">;Z",
            "Lorg/json/JSONObject;",
            ")",
            "Lorg/w3c/dom/Element;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 138
    const-string v0, "trk"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/GpxExchange;->detached(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 139
    invoke-static {p4}, Lorg/rabochaya/projects/GpxExchange;->optFields(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {p1, v1}, Lorg/rabochaya/projects/GpxExchange;->header(Lorg/w3c/dom/Element;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    sget-object v1, Lorg/rabochaya/projects/GpxExchange;->COMMON:[Ljava/lang/String;

    invoke-static {v0, p1, v1}, Lorg/rabochaya/projects/GpxExchange;->writeFields(Lorg/w3c/dom/Element;Lorg/json/JSONObject;[Ljava/lang/String;)V

    .line 140
    const/4 p1, 0x0

    if-eqz p3, :cond_0

    .line 141
    const-string v1, "extensions"

    invoke-static {v0, v1, p1}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 142
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object p0

    const-string v2, "urn:rabochaya-karta:exchange:1"

    const-string v3, "rk:area"

    invoke-interface {p0, v2, v3}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    invoke-interface {v1, p0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 144
    :cond_0
    nop

    .line 145
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 p2, 0x0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 146
    if-eqz p3, :cond_1

    invoke-static {v1}, Lorg/rabochaya/projects/ObjectExchange;->rings(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v1

    goto :goto_1

    :cond_1
    invoke-static {v1}, Lorg/rabochaya/projects/ObjectExchange;->positions(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 147
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    const-string v3, "trkseg"

    invoke-static {v0, v3, p1}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    add-int/lit8 v4, p2, 0x1

    invoke-static {p4, p2}, Lorg/rabochaya/projects/GpxExchange;->segmentMeta(Lorg/json/JSONObject;I)Lorg/json/JSONArray;

    move-result-object p2

    const-string v5, "trkpt"

    invoke-static {v3, v5, v2, p2}, Lorg/rabochaya/projects/GpxExchange;->writeSegment(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/util/List;Lorg/json/JSONArray;)V

    move p2, v4

    goto :goto_2

    .line 148
    :cond_2
    goto :goto_0

    .line 149
    :cond_3
    return-object v0
.end method

.method static write(Lorg/w3c/dom/Element;)Lorg/w3c/dom/Document;
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 80
    invoke-static {}, Lorg/rabochaya/projects/ObjectExchange;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    .line 81
    const-string v1, "http://www.topografix.com/GPX/1/1"

    const-string v2, "gpx"

    invoke-interface {v0, v1, v2}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 82
    const-string v2, "version"

    const-string v3, "1.1"

    invoke-interface {v1, v2, v3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "creator"

    const-string v3, "\u0420\u0430\u0431\u043e\u0447\u0430\u044f \u043a\u0430\u0440\u0442\u0430"

    invoke-interface {v1, v2, v3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    invoke-interface {v0, v1}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 84
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 85
    invoke-static/range {p0 .. p0}, Lorg/rabochaya/projects/ObjectExchange;->features(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-eqz v6, :cond_8

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/w3c/dom/Element;

    .line 86
    invoke-static {v6}, Lorg/rabochaya/projects/ObjectExchange;->data(Lorg/w3c/dom/Element;)Ljava/util/Map;

    move-result-object v10

    .line 87
    const-string v11, "rk-exchange-gpx-kind"

    invoke-interface {v10, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 88
    const-string v12, "rk-exchange-gpx-data"

    invoke-interface {v10, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    new-instance v13, Lorg/json/JSONObject;

    invoke-interface {v10, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-direct {v13, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :cond_0
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    .line 89
    :goto_1
    invoke-static {v6}, Lorg/rabochaya/projects/ObjectExchange;->geometries(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v10

    invoke-static {v10, v9}, Lorg/rabochaya/projects/GpxExchange;->flatten(Ljava/util/List;I)Ljava/util/List;

    move-result-object v10

    .line 90
    const-string v12, "trk"

    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1

    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_1

    invoke-static {v10}, Lorg/rabochaya/projects/GpxExchange;->onlyTrackParts(Ljava/util/List;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 91
    invoke-static {v1, v6, v10, v9, v13}, Lorg/rabochaya/projects/GpxExchange;->track(Lorg/w3c/dom/Element;Lorg/w3c/dom/Element;Ljava/util/List;ZLorg/json/JSONObject;)Lorg/w3c/dom/Element;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    goto :goto_0

    .line 94
    :cond_1
    const-string v12, "rte"

    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v11

    if-ne v11, v8, :cond_2

    invoke-static {v10}, Lorg/rabochaya/projects/GpxExchange;->onlyTrackParts(Ljava/util/List;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 95
    invoke-static {v1, v12}, Lorg/rabochaya/projects/GpxExchange;->detached(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v7

    invoke-static {v13}, Lorg/rabochaya/projects/GpxExchange;->optFields(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v8

    invoke-static {v6, v8}, Lorg/rabochaya/projects/GpxExchange;->header(Lorg/w3c/dom/Element;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v6

    sget-object v8, Lorg/rabochaya/projects/GpxExchange;->COMMON:[Ljava/lang/String;

    invoke-static {v7, v6, v8}, Lorg/rabochaya/projects/GpxExchange;->writeFields(Lorg/w3c/dom/Element;Lorg/json/JSONObject;[Ljava/lang/String;)V

    .line 96
    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/w3c/dom/Element;

    invoke-static {v6}, Lorg/rabochaya/projects/ObjectExchange;->positions(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v6

    invoke-static {v13, v9}, Lorg/rabochaya/projects/GpxExchange;->segmentMeta(Lorg/json/JSONObject;I)Lorg/json/JSONArray;

    move-result-object v8

    const-string v9, "rtept"

    invoke-static {v7, v9, v6, v8}, Lorg/rabochaya/projects/GpxExchange;->writeSegment(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/util/List;Lorg/json/JSONArray;)V

    .line 97
    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 99
    :cond_2
    move v11, v9

    :goto_2
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v12

    if-ge v11, v12, :cond_7

    .line 100
    invoke-interface {v10, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/w3c/dom/Element;

    .line 101
    invoke-static {v12}, Lorg/rabochaya/projects/ObjectExchange;->tag(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->hashCode()I

    move-result v15

    sparse-switch v15, :sswitch_data_0

    :cond_3
    goto :goto_3

    :sswitch_0
    const-string v15, "LineString"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3

    move v14, v8

    goto :goto_4

    :sswitch_1
    const-string v15, "Polygon"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3

    const/4 v14, 0x2

    goto :goto_4

    :sswitch_2
    const-string v15, "Point"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3

    move v14, v9

    goto :goto_4

    :goto_3
    const/4 v14, -0x1

    :goto_4
    packed-switch v14, :pswitch_data_0

    goto :goto_7

    .line 115
    :pswitch_0
    invoke-static {v12}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    invoke-static {v1, v6, v12, v8, v13}, Lorg/rabochaya/projects/GpxExchange;->track(Lorg/w3c/dom/Element;Lorg/w3c/dom/Element;Ljava/util/List;ZLorg/json/JSONObject;)Lorg/w3c/dom/Element;

    move-result-object v12

    invoke-interface {v4, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_7

    .line 113
    :pswitch_1
    invoke-static {v12}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    new-instance v14, Lorg/json/JSONObject;

    invoke-direct {v14}, Lorg/json/JSONObject;-><init>()V

    invoke-static {v1, v6, v12, v9, v14}, Lorg/rabochaya/projects/GpxExchange;->track(Lorg/w3c/dom/Element;Lorg/w3c/dom/Element;Ljava/util/List;ZLorg/json/JSONObject;)Lorg/w3c/dom/Element;

    move-result-object v12

    invoke-interface {v4, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    goto :goto_7

    .line 103
    :pswitch_2
    invoke-static {v12}, Lorg/rabochaya/projects/ObjectExchange;->positions(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v12

    .line 104
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v14

    if-ne v14, v8, :cond_6

    .line 105
    const-string v14, "wpt"

    invoke-static {v1, v14}, Lorg/rabochaya/projects/GpxExchange;->detached(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v14

    .line 106
    invoke-static {v13}, Lorg/rabochaya/projects/GpxExchange;->optFields(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v15

    invoke-static {v6, v15}, Lorg/rabochaya/projects/GpxExchange;->header(Lorg/w3c/dom/Element;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v15

    .line 107
    const-string v7, "TimeStamp"

    invoke-static {v6, v7}, Lorg/rabochaya/projects/ObjectExchange;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v7

    .line 108
    if-nez v7, :cond_4

    const-string v7, ""

    goto :goto_5

    :cond_4
    const-string v8, "when"

    invoke-static {v7, v8}, Lorg/rabochaya/projects/ObjectExchange;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 109
    :goto_5
    const-string v8, "-?[0-9]{4,}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}(?:\\.[0-9]+)?(?:Z|[+-][0-9]{2}:[0-9]{2})?"

    invoke-virtual {v7, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v8

    const-string v9, "time"

    if-eqz v8, :cond_5

    invoke-virtual {v15, v9, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_6

    .line 110
    :cond_5
    invoke-virtual {v15, v9}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 111
    :goto_6
    const/4 v7, 0x0

    invoke-interface {v12, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [D

    invoke-static {v14, v8, v15}, Lorg/rabochaya/projects/GpxExchange;->writePoint(Lorg/w3c/dom/Element;[DLorg/json/JSONObject;)V

    invoke-interface {v2, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_7

    .line 104
    :cond_6
    const-string v0, "\u041e\u0436\u0438\u0434\u0430\u043b\u0430\u0441\u044c \u043e\u0434\u043d\u0430 \u0442\u043e\u0447\u043a\u0430"

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 99
    :goto_7
    add-int/lit8 v11, v11, 0x1

    const/4 v8, 0x1

    const/4 v9, 0x0

    goto/16 :goto_2

    .line 118
    :cond_7
    goto/16 :goto_0

    .line 119
    :cond_8
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_a

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_a

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_9

    goto :goto_8

    :cond_9
    const-string v0, "\u041d\u0435\u0442 \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432 \u0434\u043b\u044f GPX"

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 120
    :cond_a
    :goto_8
    const/4 v5, 0x3

    new-array v5, v5, [Ljava/util/List;

    const/4 v6, 0x0

    aput-object v2, v5, v6

    const/4 v2, 0x1

    aput-object v3, v5, v2

    const/4 v2, 0x2

    aput-object v4, v5, v2

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/w3c/dom/Element;

    invoke-interface {v1, v4}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_9

    .line 121
    :cond_c
    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x49b6570 -> :sswitch_2
        0x4b86ed1a -> :sswitch_1
        0x6bb01145 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static writeFields(Lorg/w3c/dom/Element;Lorg/json/JSONObject;[Ljava/lang/String;)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 176
    array-length v0, p2

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_4

    aget-object v3, p2, v2

    .line 177
    const-string v4, "link"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 178
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 179
    move v5, v1

    :goto_1
    if-eqz v4, :cond_3

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 180
    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 181
    const/4 v7, 0x0

    invoke-static {p0, v3, v7}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v7

    const-string v8, "href"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    const-string v8, "text"

    const-string v9, "type"

    filled-new-array {v8, v9}, [Ljava/lang/String;

    move-result-object v8

    move v9, v1

    :goto_2
    const/4 v10, 0x2

    if-ge v9, v10, :cond_1

    aget-object v10, v8, v9

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_0

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v7, v10, v11}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    :cond_0
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 179
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 184
    :cond_2
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v3, v4}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    goto :goto_3

    :cond_3
    nop

    .line 176
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 186
    :cond_4
    return-void
.end method

.method private static writePoint(Lorg/w3c/dom/Element;[DLorg/json/JSONObject;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 171
    const/4 v0, 0x1

    aget-wide v0, p1, v0

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ObjectExchange;->decimal(D)Ljava/lang/String;

    move-result-object v0

    const-string v1, "lat"

    invoke-interface {p0, v1, v0}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    aget-wide v1, p1, v0

    const-wide v3, 0x4066800000000000L    # 180.0

    cmpl-double v1, v1, v3

    if-nez v1, :cond_0

    const-wide v0, -0x3f99800000000000L    # -180.0

    goto :goto_0

    :cond_0
    aget-wide v0, p1, v0

    :goto_0
    invoke-static {v0, v1}, Lorg/rabochaya/projects/ObjectExchange;->decimal(D)Ljava/lang/String;

    move-result-object v0

    const-string v1, "lon"

    invoke-interface {p0, v1, v0}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    array-length v0, p1

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    const/4 v0, 0x2

    aget-wide v0, p1, v0

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ObjectExchange;->decimal(D)Ljava/lang/String;

    move-result-object p1

    const-string v0, "ele"

    invoke-static {p0, v0, p1}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 173
    :cond_1
    sget-object p1, Lorg/rabochaya/projects/GpxExchange;->POINT:[Ljava/lang/String;

    invoke-static {p0, p2, p1}, Lorg/rabochaya/projects/GpxExchange;->writeFields(Lorg/w3c/dom/Element;Lorg/json/JSONObject;[Ljava/lang/String;)V

    .line 174
    return-void
.end method

.method private static writeSegment(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/util/List;Lorg/json/JSONArray;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "[D>;",
            "Lorg/json/JSONArray;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 163
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 164
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [D

    .line 165
    const/4 v3, 0x0

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Lorg/json/JSONArray;->length()I

    move-result v4

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v5

    if-ne v4, v5, :cond_0

    invoke-virtual {p3, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    goto :goto_1

    :cond_0
    move-object v4, v3

    .line 166
    :goto_1
    if-eqz v4, :cond_1

    const-string v5, "_lon"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    move-result-wide v5

    aget-wide v7, v2, v0

    cmpl-double v5, v5, v7

    if-nez v5, :cond_1

    const-string v5, "_lat"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;)D

    move-result-wide v5

    const/4 v7, 0x1

    aget-wide v7, v2, v7

    cmpl-double v5, v5, v7

    if-eqz v5, :cond_2

    :cond_1
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 167
    :cond_2
    invoke-static {p0, p1, v3}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    invoke-static {v3, v2, v4}, Lorg/rabochaya/projects/GpxExchange;->writePoint(Lorg/w3c/dom/Element;[DLorg/json/JSONObject;)V

    .line 163
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 169
    :cond_3
    return-void
.end method
