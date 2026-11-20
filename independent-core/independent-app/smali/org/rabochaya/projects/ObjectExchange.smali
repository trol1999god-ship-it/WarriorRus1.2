.class public final Lorg/rabochaya/projects/ObjectExchange;
.super Ljava/lang/Object;
.source "ObjectExchange.java"


# static fields
.field static final DEPTH:I = 0x40

.field static final EXT:Ljava/lang/String; = "urn:rabochaya-karta:exchange:1"

.field static final GEO:Ljava/lang/String; = "rk-exchange-geojson"

.field static final GPX:Ljava/lang/String; = "http://www.topografix.com/GPX/1/1"

.field static final GPX_DATA:Ljava/lang/String; = "rk-exchange-gpx-data"

.field static final KIND:Ljava/lang/String; = "rk-exchange-gpx-kind"

.field static final KML:Ljava/lang/String; = "http://www.opengis.net/kml/2.2"

.field static final LIMIT:I = 0x400000

.field private static final UTF8:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 23
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/ObjectExchange;->UTF8:Ljava/nio/charset/Charset;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 2

    .line 139
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p1

    .line 140
    invoke-interface {p0, p1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 141
    if-eqz p2, :cond_0

    invoke-interface {p1, p2}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 142
    :cond_0
    return-object p1
.end method

.method static bounded(Ljava/io/InputStream;)[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 71
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 72
    const/16 v1, 0x4000

    new-array v1, v1, [B

    .line 73
    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 74
    const/high16 v3, 0x400000

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v4

    sub-int/2addr v3, v4

    if-gt v2, v3, :cond_0

    .line 75
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 74
    :cond_0
    const-string p0, "\u0424\u0430\u0439\u043b \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432 \u0431\u043e\u043b\u044c\u0448\u0435 4 \u041c\u0438\u0411"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 77
    :cond_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0
.end method

.method static child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 0

    .line 152
    invoke-static {p0, p1}, Lorg/rabochaya/projects/ObjectExchange;->children(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/w3c/dom/Element;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method static children(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lorg/w3c/dom/Element;",
            ">;"
        }
    .end annotation

    .line 147
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 148
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p0

    :goto_0
    if-eqz p0, :cond_2

    .line 149
    instance-of v1, p0, Lorg/w3c/dom/Element;

    if-eqz v1, :cond_1

    if-eqz p1, :cond_0

    move-object v1, p0

    check-cast v1, Lorg/w3c/dom/Element;

    invoke-static {v1}, Lorg/rabochaya/projects/ObjectExchange;->tag(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    move-object v1, p0

    check-cast v1, Lorg/w3c/dom/Element;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 148
    :cond_1
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p0

    goto :goto_0

    .line 150
    :cond_2
    return-object v0
.end method

.method private static collect(Lorg/w3c/dom/Element;Ljava/util/List;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "Ljava/util/List<",
            "Lorg/w3c/dom/Element;",
            ">;I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 158
    const/16 v0, 0x40

    if-gt p2, v0, :cond_5

    .line 159
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/rabochaya/projects/ObjectExchange;->children(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    .line 160
    invoke-static {v0}, Lorg/rabochaya/projects/ObjectExchange;->tag(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v1

    .line 161
    const-string v2, "Placemark"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 162
    :cond_0
    const-string v2, "Folder"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "Document"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "kml"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    add-int/lit8 v1, p2, 0x1

    invoke-static {v0, p1, v1}, Lorg/rabochaya/projects/ObjectExchange;->collect(Lorg/w3c/dom/Element;Ljava/util/List;I)V

    .line 163
    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x2710

    if-gt v0, v1, :cond_3

    .line 164
    goto :goto_0

    .line 163
    :cond_3
    const-string p0, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u043c\u043d\u043e\u0433\u043e \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 165
    :cond_4
    return-void

    .line 158
    :cond_5
    const-string p0, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0433\u043b\u0443\u0431\u043e\u043a\u0438\u0439 \u043f\u0440\u043e\u0435\u043a\u0442"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method static data(Lorg/w3c/dom/Element;)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 178
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 179
    const-string v1, "ExtendedData"

    invoke-static {p0, v1}, Lorg/rabochaya/projects/ObjectExchange;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    .line 180
    if-eqz p0, :cond_0

    const-string v1, "Data"

    invoke-static {p0, v1}, Lorg/rabochaya/projects/ObjectExchange;->children(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    const-string v2, "name"

    invoke-interface {v1, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "value"

    invoke-static {v1, v3}, Lorg/rabochaya/projects/ObjectExchange;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 181
    :cond_0
    return-object v0
.end method

.method static data(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 173
    const-string v0, "ExtendedData"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/ObjectExchange;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 174
    const/4 v2, 0x0

    if-nez v1, :cond_0

    invoke-static {p0, v0, v2}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 175
    :cond_0
    const-string p0, "Data"

    invoke-static {v1, p0, v2}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    const-string v0, "name"

    invoke-interface {p0, v0, p1}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "value"

    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 176
    return-void
.end method

.method static decimal(D)Ljava/lang/String;
    .locals 0

    .line 251
    invoke-static {p0, p1}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object p0

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange$$ExternalSyntheticBackportWithForwarding0;->m(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object p0

    invoke-virtual {p0}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static description(Lorg/w3c/dom/Element;)Ljava/lang/String;
    .locals 2

    .line 184
    const-string v0, "description"

    invoke-static {p0, v0}, Lorg/rabochaya/projects/ObjectExchange;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "(?s)<!--rk-media-([a-f0-9-]+)-->.*?<!--/rk-media-\\1-->"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static features(Lorg/w3c/dom/Element;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            ")",
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

    .line 155
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/ObjectExchange;->collect(Lorg/w3c/dom/Element;Ljava/util/List;I)V

    return-object v0
.end method

.method static geometries(Lorg/w3c/dom/Element;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            ")",
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

    .line 187
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 188
    const/4 v1, 0x0

    invoke-static {p0, v1}, Lorg/rabochaya/projects/ObjectExchange;->children(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 189
    invoke-static {v1}, Lorg/rabochaya/projects/ObjectExchange;->tag(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    :cond_0
    goto :goto_1

    :sswitch_0
    const-string v3, "LineString"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_2

    :sswitch_1
    const-string v3, "Polygon"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x2

    goto :goto_2

    :sswitch_2
    const-string v3, "MultiGeometry"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x3

    goto :goto_2

    :sswitch_3
    const-string v3, "Track"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x4

    goto :goto_2

    :sswitch_4
    const-string v3, "Point"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    goto :goto_2

    :sswitch_5
    const-string v3, "Model"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x6

    goto :goto_2

    :sswitch_6
    const-string v3, "MultiTrack"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x5

    goto :goto_2

    :goto_1
    const/4 v2, -0x1

    :goto_2
    packed-switch v2, :pswitch_data_0

    goto :goto_3

    .line 191
    :pswitch_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u0413\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f "

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {v1}, Lorg/rabochaya/projects/ObjectExchange;->tag(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u0442\u0441\u044f \u0432 \u044d\u0442\u043e\u043c \u044d\u043a\u0441\u043f\u043e\u0440\u0442\u0435"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 190
    :pswitch_1
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 193
    :goto_3
    goto/16 :goto_0

    .line 194
    :cond_1
    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x3f4e9c4e -> :sswitch_6
        0x4710b09 -> :sswitch_5
        0x49b6570 -> :sswitch_4
        0x4d5012b -> :sswitch_3
        0x55028ab -> :sswitch_2
        0x4b86ed1a -> :sswitch_1
        0x6bb01145 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method static geometry(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "[D>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 197
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 198
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [D

    .line 199
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_0

    const/16 v4, 0x20

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 200
    :cond_0
    aget-wide v4, v3, v1

    invoke-static {v4, v5}, Lorg/rabochaya/projects/ObjectExchange;->decimal(D)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x2c

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v6, 0x1

    aget-wide v7, v3, v6

    invoke-static {v7, v8}, Lorg/rabochaya/projects/ObjectExchange;->decimal(D)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    array-length v4, v3

    const/4 v7, 0x3

    if-ne v4, v7, :cond_1

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v4, 0x2

    aget-wide v4, v3, v4

    invoke-static {v4, v5}, Lorg/rabochaya/projects/ObjectExchange;->decimal(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v2, v6

    .line 202
    :cond_1
    goto :goto_0

    .line 203
    :cond_2
    const/4 p2, 0x0

    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    .line 204
    if-eqz v2, :cond_3

    const-string p2, "LinearRing"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    const-string p1, "altitudeMode"

    const-string p2, "absolute"

    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 205
    :cond_3
    const-string p1, "coordinates"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 206
    return-void
.end method

.method private static imported(Landroid/app/Activity;Lorg/w3c/dom/Document;)Lorg/rabochaya/projects/KmlProject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 62
    invoke-interface {p1}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v0

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectExchange;->features(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 63
    invoke-static {p1}, Lorg/rabochaya/projects/KmlXml;->write(Lorg/w3c/dom/Document;)[B

    move-result-object p1

    invoke-static {p1}, Lorg/rabochaya/projects/KmlProject;->parse([B)Lorg/rabochaya/projects/KmlProject;

    move-result-object p1

    .line 64
    if-eqz p0, :cond_0

    new-instance v0, Lorg/rabochaya/projects/ObjectExchange$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ObjectExchange$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 67
    :cond_0
    return-object p1

    .line 62
    :cond_1
    const-string p0, "\u0412 \u0444\u0430\u0439\u043b\u0435 \u043d\u0435\u0442 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u043c\u044b\u0445 \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method static invalid(Ljava/lang/String;)Ljava/io/IOException;
    .locals 1

    .line 252
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private static jsonText([BI)Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 81
    sget-object v0, Lorg/rabochaya/projects/ObjectExchange;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v1}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    .line 82
    invoke-virtual {v0, v1}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    array-length v1, p0

    sub-int/2addr v1, p1

    invoke-static {p0, p1, v1}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 83
    nop

    .line 84
    const/4 p1, 0x0

    move v0, p1

    move v1, v0

    move v2, v1

    move v3, v2

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v0, v4, :cond_9

    .line 85
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 86
    const/16 v5, 0x22

    const/4 v6, 0x1

    if-eqz v1, :cond_2

    if-eqz v2, :cond_0

    move v2, p1

    goto :goto_1

    :cond_0
    const/16 v7, 0x5c

    if-ne v4, v7, :cond_1

    move v2, v6

    goto :goto_1

    :cond_1
    if-ne v4, v5, :cond_7

    move v1, p1

    goto :goto_1

    .line 87
    :cond_2
    if-ne v4, v5, :cond_3

    move v1, v6

    goto :goto_1

    .line 88
    :cond_3
    const/16 v5, 0x5b

    if-eq v4, v5, :cond_4

    const/16 v5, 0x7b

    if-ne v4, v5, :cond_5

    :cond_4
    add-int/lit8 v3, v3, 0x1

    const/16 v5, 0x40

    if-gt v3, v5, :cond_8

    .line 89
    :cond_5
    const/16 v5, 0x5d

    if-eq v4, v5, :cond_6

    const/16 v5, 0x7d

    if-ne v4, v5, :cond_7

    :cond_6
    add-int/lit8 v3, v3, -0x1

    .line 84
    :cond_7
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 88
    :cond_8
    const-string p0, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0433\u043b\u0443\u0431\u043e\u043a\u0438\u0439 GeoJSON"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 91
    :cond_9
    return-object p0
.end method

.method static kml(Lorg/w3c/dom/Document;)Lorg/w3c/dom/Element;
    .locals 2

    .line 133
    const-string v0, "http://www.opengis.net/kml/2.2"

    const-string v1, "kml"

    invoke-interface {p0, v0, v1}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 134
    invoke-interface {p0, v0}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 135
    const-string p0, "Document"

    const/4 v1, 0x0

    invoke-static {v0, p0, v1}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$imported$0(Landroid/app/Activity;)V
    .locals 2

    .line 64
    const-string v0, "\u0418\u043c\u043f\u043e\u0440\u0442\u0438\u0440\u0443\u044e\u0442\u0441\u044f \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f \u0438 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u043c\u044b\u0435 \u0430\u0442\u0440\u0438\u0431\u0443\u0442\u044b. \u0421\u0432\u043e\u0439\u0441\u0442\u0432\u0430 \u0432\u043d\u0435 \u0444\u043e\u0440\u043c\u0430\u0442\u0430 \u0438 \u0441\u0442\u043e\u0440\u043e\u043d\u043d\u0438\u0435 \u0440\u0430\u0441\u0448\u0438\u0440\u0435\u043d\u0438\u044f \u043c\u043e\u0433\u0443\u0442 \u0431\u044b\u0442\u044c \u043f\u043e\u0442\u0435\u0440\u044f\u043d\u044b."

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    .line 66
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 64
    return-void
.end method

.method static newDocument()Lorg/w3c/dom/Document;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 129
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    return-object v0
.end method

.method private static parser([B)Lorg/xmlpull/v1/XmlPullParser;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 95
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    .line 96
    const-string v1, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->setFeature(Ljava/lang/String;Z)V

    .line 97
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    const/4 p0, 0x0

    invoke-interface {v0, v1, p0}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 98
    return-object v0
.end method

.method static place(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 2

    .line 167
    const-string v0, "Placemark"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    .line 168
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "name"

    invoke-static {p0, v0, p1}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 169
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "description"

    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 170
    :cond_1
    return-object p0
.end method

.method static polygon(Lorg/w3c/dom/Element;Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "[D>;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 208
    const-string v0, "Polygon"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    .line 209
    nop

    .line 210
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v2, 0x0

    move v3, v2

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [D

    array-length v5, v5

    const/4 v6, 0x3

    if-ne v5, v6, :cond_1

    const/4 v5, 0x1

    goto :goto_1

    :cond_1
    move v5, v2

    :goto_1
    or-int/2addr v3, v5

    goto :goto_0

    .line 211
    :cond_2
    if-eqz v3, :cond_3

    const-string v0, "altitudeMode"

    const-string v3, "absolute"

    invoke-static {p0, v0, v3}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    .line 212
    :cond_3
    nop

    :goto_2
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-ge v2, v0, :cond_5

    if-nez v2, :cond_4

    const-string v0, "outerBoundaryIs"

    goto :goto_3

    :cond_4
    const-string v0, "innerBoundaryIs"

    :goto_3
    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/ObjectExchange;->add(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    const-string v4, "LinearRing"

    invoke-static {v0, v4, v3}, Lorg/rabochaya/projects/ObjectExchange;->geometry(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/util/List;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 213
    :cond_5
    return-void
.end method

.method static position(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[D
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 243
    :try_start_0
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p0

    .line 244
    const-wide v2, -0x3f99800000000000L    # -180.0

    cmpl-double v2, v0, v2

    if-ltz v2, :cond_2

    const-wide v2, 0x4066800000000000L    # 180.0

    cmpg-double v2, v0, v2

    if-gtz v2, :cond_2

    const-wide v2, -0x3fa9800000000000L    # -90.0

    cmpl-double v2, p0, v2

    if-ltz v2, :cond_2

    const-wide v2, 0x4056800000000000L    # 90.0

    cmpg-double v2, p0, v2

    if-gtz v2, :cond_2

    .line 245
    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x2

    if-nez p2, :cond_0

    new-array p2, v4, [D

    aput-wide v0, p2, v3

    aput-wide p0, p2, v2

    return-object p2

    .line 246
    :cond_0
    invoke-static {p2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v5

    .line 247
    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    move-result p2

    if-nez p2, :cond_1

    invoke-static {v5, v6}, Ljava/lang/Double;->isInfinite(D)Z

    move-result p2

    if-nez p2, :cond_1

    .line 248
    const/4 p2, 0x3

    new-array p2, p2, [D

    aput-wide v0, p2, v3

    aput-wide p0, p2, v2

    aput-wide v5, p2, v4

    return-object p2

    .line 247
    :cond_1
    const-string p0, "\u041d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u0430\u044f \u0432\u044b\u0441\u043e\u0442\u0430"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 244
    :cond_2
    const-string p0, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b \u0432\u043d\u0435 WGS 84"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 249
    :catch_0
    move-exception p0

    const-string p0, "\u041d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u044b\u0435 \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method static positions(Lorg/w3c/dom/Element;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            ")",
            "Ljava/util/List<",
            "[D>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 215
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 216
    const-string v1, "coordinates"

    invoke-static {p0, v1}, Lorg/rabochaya/projects/ObjectExchange;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 217
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 218
    const-string v1, "\\s+"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_2

    aget-object v4, p0, v3

    .line 219
    const-string v5, ","

    const/4 v6, -0x1

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v4

    .line 220
    array-length v5, v4

    const/4 v6, 0x2

    if-lt v5, v6, :cond_1

    array-length v5, v4

    const/4 v7, 0x3

    if-gt v5, v7, :cond_1

    .line 221
    aget-object v5, v4, v2

    const/4 v8, 0x1

    aget-object v8, v4, v8

    array-length v9, v4

    if-ne v9, v7, :cond_0

    aget-object v4, v4, v6

    goto :goto_1

    :cond_0
    const/4 v4, 0x0

    :goto_1
    invoke-static {v5, v8, v4}, Lorg/rabochaya/projects/ObjectExchange;->position(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[D

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 218
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 220
    :cond_1
    const-string p0, "\u041d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u044b\u0435 \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 223
    :cond_2
    return-object v0

    .line 217
    :cond_3
    const-string p0, "\u041f\u0443\u0441\u0442\u0430\u044f \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method public static read(Ljava/io/InputStream;Z)Lorg/rabochaya/projects/KmlProject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 28
    const/4 v0, 0x0

    invoke-static {v0, p0, p1}, Lorg/rabochaya/projects/ObjectExchange;->readForImport(Landroid/app/Activity;Ljava/io/InputStream;Z)Lorg/rabochaya/projects/KmlProject;

    move-result-object p0

    return-object p0
.end method

.method public static readForImport(Landroid/app/Activity;Ljava/io/InputStream;Z)Lorg/rabochaya/projects/KmlProject;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 32
    const/4 v0, 0x1

    if-eqz p2, :cond_0

    invoke-static {p1, v0}, Lorg/rabochaya/projects/KmlProject;->read(Ljava/io/InputStream;Z)Lorg/rabochaya/projects/KmlProject;

    move-result-object p0

    return-object p0

    .line 33
    :cond_0
    invoke-static {p1}, Lorg/rabochaya/projects/ObjectExchange;->bounded(Ljava/io/InputStream;)[B

    move-result-object p1

    .line 34
    array-length p2, p1

    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x0

    if-lt p2, v1, :cond_1

    aget-byte p2, p1, v3

    and-int/lit16 p2, p2, 0xff

    const/16 v4, 0xef

    if-ne p2, v4, :cond_1

    aget-byte p2, p1, v0

    and-int/lit16 p2, p2, 0xff

    const/16 v4, 0xbb

    if-ne p2, v4, :cond_1

    aget-byte p2, p1, v2

    and-int/lit16 p2, p2, 0xff

    const/16 v4, 0xbf

    if-ne p2, v4, :cond_1

    goto :goto_0

    :cond_1
    move v1, v3

    .line 35
    :goto_0
    array-length p2, p1

    const/16 v4, 0xa

    if-ge v1, p2, :cond_3

    aget-byte p2, p1, v1

    const/16 v5, 0x20

    if-eq p2, v5, :cond_2

    aget-byte p2, p1, v1

    if-eq p2, v4, :cond_2

    aget-byte p2, p1, v1

    const/16 v5, 0xd

    if-eq p2, v5, :cond_2

    aget-byte p2, p1, v1

    const/16 v5, 0x9

    if-ne p2, v5, :cond_3

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 37
    :cond_3
    :try_start_0
    array-length p2, p1

    if-ge v1, p2, :cond_4

    aget-byte p2, p1, v1

    const/16 v5, 0x7b

    if-ne p2, v5, :cond_4

    invoke-static {p1, v1}, Lorg/rabochaya/projects/ObjectExchange;->jsonText([BI)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/rabochaya/projects/GeoJsonExchange;->read(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object p1

    invoke-static {p0, p1}, Lorg/rabochaya/projects/ObjectExchange;->imported(Landroid/app/Activity;Lorg/w3c/dom/Document;)Lorg/rabochaya/projects/KmlProject;

    move-result-object p0

    return-object p0

    .line 38
    :cond_4
    invoke-static {p1}, Lorg/rabochaya/projects/ObjectExchange;->parser([B)Lorg/xmlpull/v1/XmlPullParser;

    move-result-object p2

    .line 40
    :cond_5
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->nextToken()I

    move-result v1

    if-eq v1, v4, :cond_8

    .line 41
    if-eq v1, v2, :cond_6

    if-ne v1, v0, :cond_5

    .line 42
    :cond_6
    if-ne v1, v2, :cond_7

    const-string v0, "gpx"

    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_7

    .line 43
    invoke-static {p1}, Lorg/rabochaya/projects/ObjectExchange;->xml([B)Lorg/w3c/dom/Document;

    move-result-object p1

    invoke-static {p1}, Lorg/rabochaya/projects/GpxExchange;->read(Lorg/w3c/dom/Document;)Lorg/w3c/dom/Document;

    move-result-object p1

    invoke-static {p0, p1}, Lorg/rabochaya/projects/ObjectExchange;->imported(Landroid/app/Activity;Lorg/w3c/dom/Document;)Lorg/rabochaya/projects/KmlProject;

    move-result-object p0

    return-object p0

    .line 44
    :cond_7
    new-instance p0, Ljava/io/ByteArrayInputStream;

    invoke-direct {p0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-static {p0, v3}, Lorg/rabochaya/projects/KmlProject;->read(Ljava/io/InputStream;Z)Lorg/rabochaya/projects/KmlProject;

    move-result-object p0

    return-object p0

    .line 40
    :cond_8
    const-string p0, "DTD \u0437\u0430\u043f\u0440\u0435\u0449\u0451\u043d"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    :catch_0
    move-exception p0

    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u0440\u043e\u0447\u0438\u0442\u0430\u0442\u044c \u0444\u0430\u0439\u043b \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432"

    invoke-direct {p1, p2, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    .line 45
    :catch_1
    move-exception p0

    throw p0
.end method

.method static requireRing(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[D>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 239
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x4

    if-lt v0, v1, :cond_0

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [D

    invoke-static {v0, p0}, Ljava/util/Arrays;->equals([D[D)Z

    move-result p0

    if-eqz p0, :cond_0

    .line 240
    return-void

    .line 239
    :cond_0
    const-string p0, "\u041a\u043e\u043d\u0442\u0443\u0440 \u043e\u0431\u043b\u0430\u0441\u0442\u0438 \u0434\u043e\u043b\u0436\u0435\u043d \u0431\u044b\u0442\u044c \u0437\u0430\u043c\u043a\u043d\u0443\u0442"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method static rings(Lorg/w3c/dom/Element;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            ")",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "[D>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 226
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 227
    const-string v1, "innerBoundaryIs"

    const-string v2, "outerBoundaryIs"

    filled-new-array {v2, v1}, [Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    :goto_0
    const/4 v4, 0x2

    if-ge v3, v4, :cond_4

    aget-object v4, v1, v3

    .line 228
    invoke-static {p0, v4}, Lorg/rabochaya/projects/ObjectExchange;->children(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    .line 229
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v4

    const/4 v6, 0x1

    if-ne v4, v6, :cond_0

    goto :goto_1

    :cond_0
    const-string p0, "\u0422\u0440\u0435\u0431\u0443\u0435\u0442\u0441\u044f \u043e\u0434\u0438\u043d \u0432\u043d\u0435\u0448\u043d\u0438\u0439 \u043a\u043e\u043d\u0442\u0443\u0440"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 230
    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/w3c/dom/Element;

    .line 231
    const-string v6, "LinearRing"

    invoke-static {v5, v6}, Lorg/rabochaya/projects/ObjectExchange;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v5

    .line 232
    if-eqz v5, :cond_2

    .line 233
    invoke-static {v5}, Lorg/rabochaya/projects/ObjectExchange;->positions(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v5

    invoke-static {v5}, Lorg/rabochaya/projects/ObjectExchange;->requireRing(Ljava/util/List;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 234
    goto :goto_2

    .line 232
    :cond_2
    const-string p0, "\u041d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u044b\u0439 \u043a\u043e\u043d\u0442\u0443\u0440"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 227
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 236
    :cond_4
    return-object v0
.end method

.method static tag(Lorg/w3c/dom/Element;)Ljava/lang/String;
    .locals 1

    .line 145
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method static text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 153
    invoke-static {p0, p1}, Lorg/rabochaya/projects/ObjectExchange;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p0

    if-nez p0, :cond_0

    const-string p0, ""

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method public static write(Lorg/rabochaya/projects/KmlProject;Ljava/lang/String;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 52
    :try_start_0
    const-string v0, "gpx"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p0

    invoke-static {p0}, Lorg/rabochaya/projects/GpxExchange;->write(Lorg/w3c/dom/Element;)Lorg/w3c/dom/Document;

    move-result-object p0

    invoke-static {p0}, Lorg/rabochaya/projects/KmlXml;->write(Lorg/w3c/dom/Document;)[B

    move-result-object p0

    goto :goto_0

    .line 53
    :cond_0
    const-string v0, "geojson"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p0

    invoke-static {p0}, Lorg/rabochaya/projects/GeoJsonExchange;->write(Lorg/w3c/dom/Element;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object p1, Lorg/rabochaya/projects/ObjectExchange;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    .line 55
    :goto_0
    array-length p1, p0

    const/high16 v0, 0x400000

    if-gt p1, v0, :cond_1

    .line 56
    return-object p0

    .line 55
    :cond_1
    const-string p0, "\u0424\u0430\u0439\u043b \u043e\u0431\u043c\u0435\u043d\u0430 \u0431\u043e\u043b\u044c\u0448\u0435 4 \u041c\u0438\u0411"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 54
    :cond_2
    const-string p0, "\u041d\u0435\u0438\u0437\u0432\u0435\u0441\u0442\u043d\u044b\u0439 \u0444\u043e\u0440\u043c\u0430\u0442 \u043e\u0431\u043c\u0435\u043d\u0430"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    :catch_0
    move-exception p0

    new-instance p1, Ljava/io/IOException;

    const-string v0, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u044d\u043a\u0441\u043f\u043e\u0440\u0442\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u043e\u0431\u044a\u0435\u043a\u0442\u044b"

    invoke-direct {p1, v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    .line 57
    :catch_1
    move-exception p0

    throw p0
.end method

.method private static xml([B)Lorg/w3c/dom/Document;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 102
    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->parser([B)Lorg/xmlpull/v1/XmlPullParser;

    move-result-object p0

    .line 103
    invoke-static {}, Lorg/rabochaya/projects/ObjectExchange;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    .line 104
    nop

    .line 105
    const/4 v1, 0x0

    move-object v2, v0

    move v3, v1

    .line 106
    :goto_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextToken()I

    move-result v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_6

    .line 107
    packed-switch v4, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_2

    .line 108
    :pswitch_1
    const-string p0, "DTD \u0437\u0430\u043f\u0440\u0435\u0449\u0451\u043d"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 119
    :pswitch_2
    if-eq v2, v0, :cond_5

    .line 120
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 121
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v4

    invoke-interface {v2, v4}, Lorg/w3c/dom/Node;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_2

    .line 120
    :cond_0
    const-string p0, "\u041d\u0435\u0438\u0437\u0432\u0435\u0441\u0442\u043d\u0430\u044f \u0441\u0443\u0449\u043d\u043e\u0441\u0442\u044c XML"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 117
    :pswitch_3
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v2

    goto :goto_2

    .line 110
    :pswitch_4
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v4

    const/16 v5, 0x40

    if-gt v4, v5, :cond_4

    add-int/lit8 v3, v3, 0x1

    const v4, 0x1d4c0

    if-gt v3, v4, :cond_4

    .line 111
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v4, v5}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    .line 112
    move v5, v1

    :goto_1
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 113
    invoke-interface {p0, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeNamespace(I)Ljava/lang/String;

    move-result-object v6

    .line 114
    if-eqz v6, :cond_1

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_2

    :cond_1
    invoke-interface {p0, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {p0, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v6, v7}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 116
    :cond_3
    invoke-interface {v2, v4}, Lorg/w3c/dom/Node;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    move-object v2, v4

    goto :goto_2

    .line 110
    :cond_4
    const-string p0, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0441\u043b\u043e\u0436\u043d\u044b\u0439 GPX"

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectExchange;->invalid(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    .line 121
    :cond_5
    :goto_2
    goto :goto_0

    .line 125
    :cond_6
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
