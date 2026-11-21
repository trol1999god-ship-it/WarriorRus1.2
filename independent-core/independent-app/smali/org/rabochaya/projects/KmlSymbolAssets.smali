.class public final Lorg/rabochaya/projects/KmlSymbolAssets;
.super Ljava/lang/Object;
.source "KmlSymbolAssets.java"


# instance fields
.field private final directory:Ljava/lang/String;

.field private final owner:Lorg/w3c/dom/Document;

.field private final svg:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Document;Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Document;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;)V"
        }
    .end annotation

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/KmlSymbolAssets;->svg:Ljava/util/Map;

    .line 6
    if-eqz p1, :cond_7

    if-eqz p3, :cond_7

    const/4 v0, 0x0

    invoke-static {p2, v0}, Lorg/rabochaya/projects/KmlSymbolAssets;->path(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p2

    iput-object p1, p0, Lorg/rabochaya/projects/KmlSymbolAssets;->owner:Lorg/w3c/dom/Document;

    const/16 p1, 0x2f

    invoke-virtual {p2, p1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result p1

    if-gez p1, :cond_0

    const-string p1, ""

    goto :goto_0

    :cond_0
    add-int/lit8 p1, p1, 0x1

    invoke-virtual {p2, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Lorg/rabochaya/projects/KmlSymbolAssets;->directory:Ljava/lang/String;

    .line 7
    invoke-interface {p3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    move p2, v0

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_6

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/Map$Entry;

    invoke-interface {p3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_3

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const-string v3, ".svg"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_2

    :cond_1
    invoke-interface {p3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, [B

    if-eqz p3, :cond_3

    array-length v2, p3

    const/high16 v3, 0x10000

    if-le v2, v3, :cond_2

    goto :goto_2

    :cond_2
    :try_start_0
    invoke-static {v1, v0}, Lorg/rabochaya/projects/KmlSymbolAssets;->path(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v2, p0, Lorg/rabochaya/projects/KmlSymbolAssets;->svg:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    const/16 v3, 0x100

    if-ge v2, v3, :cond_5

    array-length v2, p3

    const/high16 v3, 0x1000000

    sub-int/2addr v3, p2

    if-gt v2, v3, :cond_5

    array-length v2, p3

    add-int/2addr p2, v2

    iget-object v2, p0, Lorg/rabochaya/projects/KmlSymbolAssets;->svg:Ljava/util/Map;

    invoke-virtual {p3}, [B->clone()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, [B

    invoke-interface {v2, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    if-nez p3, :cond_4

    :cond_3
    :goto_2
    goto :goto_1

    :cond_4
    invoke-static {}, Lorg/rabochaya/projects/KmlSymbolAssets;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1

    :cond_5
    invoke-static {}, Lorg/rabochaya/projects/KmlSymbolAssets;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1

    :catch_0
    move-exception p3

    goto :goto_2

    .line 8
    :cond_6
    return-void

    .line 6
    :cond_7
    invoke-static {}, Lorg/rabochaya/projects/KmlSymbolAssets;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1
.end method

.method private static bad()Ljava/lang/IllegalArgumentException;
    .locals 2

    .line 21
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "SVG: \u043d\u0435\u0442 \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u043e\u0433\u043e \u0437\u043d\u0430\u0447\u043a\u0430 \u0438\u0441\u0445\u043e\u0434\u043d\u043e\u0433\u043e \u043f\u0440\u043e\u0435\u043a\u0442\u0430 \u0438\u043b\u0438 \u043f\u0440\u0435\u0432\u044b\u0448\u0435\u043d \u0431\u0435\u0437\u043e\u043f\u0430\u0441\u043d\u044b\u0439 \u043f\u0440\u0435\u0434\u0435\u043b"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private static path(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 4

    .line 20
    if-eqz p0, :cond_6

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x400

    if-gt v0, v1, :cond_6

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    if-eqz p1, :cond_0

    :goto_0
    const-string p1, "./"

    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_5

    const-string p1, "/"

    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    const/16 v0, 0x5c

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_5

    const/16 v0, 0x3a

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_5

    const/16 v0, 0x25

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_5

    const/16 v0, 0x3f

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_5

    const/16 v0, 0x23

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_5

    const/4 v0, 0x0

    move v1, v0

    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x20

    if-lt v2, v3, :cond_1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x7f

    if-eq v2, v3, :cond_1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    invoke-static {}, Lorg/rabochaya/projects/KmlSymbolAssets;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    :cond_2
    const/4 v1, -0x1

    invoke-virtual {p0, p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p1

    array-length v1, p1

    :goto_2
    if-ge v0, v1, :cond_4

    aget-object v2, p1, v0

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, ".."

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_3
    invoke-static {}, Lorg/rabochaya/projects/KmlSymbolAssets;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    :cond_4
    return-object p0

    :cond_5
    invoke-static {}, Lorg/rabochaya/projects/KmlSymbolAssets;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    :cond_6
    invoke-static {}, Lorg/rabochaya/projects/KmlSymbolAssets;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method


# virtual methods
.method key(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 10
    if-eqz p1, :cond_1

    invoke-interface {p1}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object p1

    iget-object v0, p0, Lorg/rabochaya/projects/KmlSymbolAssets;->owner:Lorg/w3c/dom/Document;

    if-ne p1, v0, :cond_1

    .line 11
    const/4 p1, 0x1

    invoke-static {p2, p1}, Lorg/rabochaya/projects/KmlSymbolAssets;->path(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    .line 12
    sget-object p2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, p2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    const-string v0, ".svg"

    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 13
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lorg/rabochaya/projects/KmlSymbolAssets;->directory:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 12
    :cond_0
    invoke-static {}, Lorg/rabochaya/projects/KmlSymbolAssets;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1

    .line 10
    :cond_1
    invoke-static {}, Lorg/rabochaya/projects/KmlSymbolAssets;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1
.end method

.method public read(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/rabochaya/projects/SvgIcon;
    .locals 1

    .line 16
    iget-object v0, p0, Lorg/rabochaya/projects/KmlSymbolAssets;->svg:Ljava/util/Map;

    invoke-virtual {p0, p1, p2}, Lorg/rabochaya/projects/KmlSymbolAssets;->key(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    .line 17
    if-eqz p1, :cond_0

    .line 18
    invoke-static {p1}, Lorg/rabochaya/projects/SvgIcon;->parse([B)Lorg/rabochaya/projects/SvgIcon;

    move-result-object p1

    return-object p1

    .line 17
    :cond_0
    invoke-static {}, Lorg/rabochaya/projects/KmlSymbolAssets;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1
.end method
