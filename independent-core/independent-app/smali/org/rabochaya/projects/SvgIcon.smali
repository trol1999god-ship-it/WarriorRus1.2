.class public final Lorg/rabochaya/projects/SvgIcon;
.super Ljava/lang/Object;
.source "SvgIcon.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/SvgIcon$Reader;,
        Lorg/rabochaya/projects/SvgIcon$Paint;,
        Lorg/rabochaya/projects/SvgIcon$Shape;
    }
.end annotation


# instance fields
.field public final height:D

.field public final left:D

.field public final pixelHeight:D

.field public final pixelWidth:D

.field public final shapes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/SvgIcon$Shape;",
            ">;"
        }
    .end annotation
.end field

.field public final top:D

.field public final width:D


# direct methods
.method private constructor <init>(Lorg/rabochaya/projects/SvgIcon$Reader;)V
    .locals 3

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lorg/rabochaya/projects/SvgIcon$Reader;->view:[D

    const/4 v1, 0x0

    aget-wide v1, v0, v1

    iput-wide v1, p0, Lorg/rabochaya/projects/SvgIcon;->left:D

    iget-object v0, p1, Lorg/rabochaya/projects/SvgIcon$Reader;->view:[D

    const/4 v1, 0x1

    aget-wide v1, v0, v1

    iput-wide v1, p0, Lorg/rabochaya/projects/SvgIcon;->top:D

    iget-object v0, p1, Lorg/rabochaya/projects/SvgIcon$Reader;->view:[D

    const/4 v1, 0x2

    aget-wide v1, v0, v1

    iput-wide v1, p0, Lorg/rabochaya/projects/SvgIcon;->width:D

    iget-object v0, p1, Lorg/rabochaya/projects/SvgIcon$Reader;->view:[D

    const/4 v1, 0x3

    aget-wide v1, v0, v1

    iput-wide v1, p0, Lorg/rabochaya/projects/SvgIcon;->height:D

    iget-wide v0, p1, Lorg/rabochaya/projects/SvgIcon$Reader;->pixelWidth:D

    iput-wide v0, p0, Lorg/rabochaya/projects/SvgIcon;->pixelWidth:D

    iget-wide v0, p1, Lorg/rabochaya/projects/SvgIcon$Reader;->pixelHeight:D

    iput-wide v0, p0, Lorg/rabochaya/projects/SvgIcon;->pixelHeight:D

    iget-object p1, p1, Lorg/rabochaya/projects/SvgIcon$Reader;->shapes:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/SvgIcon;->shapes:Ljava/util/List;

    return-void
.end method

.method static synthetic access$100()Ljava/lang/IllegalArgumentException;
    .locals 1

    .line 4
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 0

    .line 4
    invoke-static {p0}, Lorg/rabochaya/projects/SvgIcon;->color(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Ljava/util/Map;Ljava/lang/String;D)D
    .locals 0

    .line 4
    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/SvgIcon;->value(Ljava/util/Map;Ljava/lang/String;D)D

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$400(D)D
    .locals 0

    .line 4
    invoke-static {p0, p1}, Lorg/rabochaya/projects/SvgIcon;->positive(D)D

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$500(Ljava/lang/String;)D
    .locals 2

    .line 4
    invoke-static {p0}, Lorg/rabochaya/projects/SvgIcon;->length(Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$600(Ljava/lang/String;I)[D
    .locals 0

    .line 4
    invoke-static {p0, p1}, Lorg/rabochaya/projects/SvgIcon;->points(Ljava/lang/String;I)[D

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(Ljava/util/Map;Ljava/lang/String;)D
    .locals 0

    .line 4
    invoke-static {p0, p1}, Lorg/rabochaya/projects/SvgIcon;->opacity(Ljava/util/Map;Ljava/lang/String;)D

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$800(Ljava/lang/Integer;D)Ljava/lang/Integer;
    .locals 0

    .line 4
    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/SvgIcon;->alpha(Ljava/lang/Integer;D)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method private static alpha(Ljava/lang/Integer;D)Ljava/lang/Integer;
    .locals 3

    .line 20
    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const v1, 0xffffff

    and-int/2addr v0, v1

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    ushr-int/lit8 p0, p0, 0x18

    and-int/lit16 p0, p0, 0xff

    int-to-double v1, p0

    mul-double/2addr v1, p1

    invoke-static {v1, v2}, Ljava/lang/Math;->round(D)J

    move-result-wide p0

    long-to-int p0, p0

    shl-int/lit8 p0, p0, 0x18

    or-int/2addr p0, v0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method private static bad()Ljava/lang/IllegalArgumentException;
    .locals 2

    .line 8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "SVG: \u043d\u0435\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u043d\u0430\u044f \u0444\u0443\u043d\u043a\u0446\u0438\u044f \u0438\u043b\u0438 \u043d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u044b\u0435 \u0434\u0430\u043d\u043d\u044b\u0435"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private static color(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 4

    .line 18
    const-string v0, "none"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, "#[0-9a-fA-F]{3}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "#"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_1
    const-string v0, "#[0-9a-fA-F]{6}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x10

    invoke-static {p0, v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p0

    const/high16 v0, -0x1000000

    or-int/2addr p0, v0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :cond_2
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method private static length(Ljava/lang/String;)D
    .locals 4

    .line 16
    if-eqz p0, :cond_2

    const-string v0, "px"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x2

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_0
    invoke-static {p0}, Lorg/rabochaya/projects/SvgIcon;->number(Ljava/lang/String;)D

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmpg-double p0, v0, v2

    if-lez p0, :cond_1

    const-wide/high16 v2, 0x40b0000000000000L    # 4096.0

    cmpl-double p0, v0, v2

    if-gtz p0, :cond_1

    return-wide v0

    :cond_1
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    :cond_2
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method private static number(Ljava/lang/String;)D
    .locals 6

    .line 14
    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x40

    if-gt v0, v1, :cond_1

    const-string v0, "[+-]?(?:[0-9]+(?:\\.[0-9]*)?|\\.[0-9]+)(?:[eE][+-]?[0-9]+)?"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result p0

    if-nez p0, :cond_0

    invoke-static {v0, v1}, Ljava/lang/Double;->isInfinite(D)Z

    move-result p0

    if-nez p0, :cond_0

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    const-wide v4, 0x412e848000000000L    # 1000000.0

    cmpl-double p0, v2, v4

    if-gtz p0, :cond_0

    return-wide v0

    :cond_0
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    :cond_1
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method private static opacity(Ljava/util/Map;Ljava/lang/String;)D
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")D"
        }
    .end annotation

    .line 19
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    invoke-static {p0, p1, v0, v1}, Lorg/rabochaya/projects/SvgIcon;->value(Ljava/util/Map;Ljava/lang/String;D)D

    move-result-wide p0

    const-wide/16 v2, 0x0

    cmpg-double v2, p0, v2

    if-ltz v2, :cond_0

    cmpl-double v0, p0, v0

    if-gtz v0, :cond_0

    return-wide p0

    :cond_0
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method public static parse([B)Lorg/rabochaya/projects/SvgIcon;
    .locals 4

    .line 9
    if-eqz p0, :cond_1

    array-length v0, p0

    if-eqz v0, :cond_1

    array-length v0, p0

    const/high16 v1, 0x10000

    if-gt v0, v1, :cond_1

    .line 10
    :try_start_0
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v1}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v1}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 11
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljavax/xml/parsers/SAXParserFactory;->setNamespaceAware(Z)V

    const-string v1, "http://xml.org/sax/features/external-general-entities"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljavax/xml/parsers/SAXParserFactory;->setFeature(Ljava/lang/String;Z)V

    const-string v1, "http://xml.org/sax/features/external-parameter-entities"

    invoke-virtual {v0, v1, v2}, Ljavax/xml/parsers/SAXParserFactory;->setFeature(Ljava/lang/String;Z)V

    .line 12
    invoke-virtual {v0}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/SvgIcon$Reader;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lorg/rabochaya/projects/SvgIcon$Reader;-><init>(Lorg/rabochaya/projects/SvgIcon$1;)V

    const-string v2, "http://xml.org/sax/properties/lexical-handler"

    invoke-interface {v0, v2, v1}, Lorg/xml/sax/XMLReader;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    invoke-interface {v0, v1}, Lorg/xml/sax/XMLReader;->setErrorHandler(Lorg/xml/sax/ErrorHandler;)V

    new-instance v2, Lorg/rabochaya/projects/SvgIcon$1;

    invoke-direct {v2}, Lorg/rabochaya/projects/SvgIcon$1;-><init>()V

    invoke-interface {v0, v2}, Lorg/xml/sax/XMLReader;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    new-instance v2, Lorg/xml/sax/InputSource;

    new-instance v3, Ljava/io/StringReader;

    invoke-direct {v3, p0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-interface {v0, v2}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    iget-object p0, v1, Lorg/rabochaya/projects/SvgIcon$Reader;->view:[D

    if-eqz p0, :cond_0

    iget p0, v1, Lorg/rabochaya/projects/SvgIcon$Reader;->depth:I

    if-nez p0, :cond_0

    iget-object p0, v1, Lorg/rabochaya/projects/SvgIcon$Reader;->shapes:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_0

    new-instance p0, Lorg/rabochaya/projects/SvgIcon;

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/SvgIcon;-><init>(Lorg/rabochaya/projects/SvgIcon$Reader;)V

    return-object p0

    :cond_0
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    :catch_0
    move-exception p0

    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    .line 9
    :cond_1
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method private static points(Ljava/lang/String;I)[D
    .locals 3

    .line 47
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/high16 v1, 0x10000

    if-gt v0, v1, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "(?s).*,\\s*,.*"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string v0, "[ \\t\\r\\n,]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    if-gt v0, p1, :cond_1

    array-length p1, p0

    new-array p1, p1, [D

    const/4 v0, 0x0

    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    aget-object v1, p0, v0

    invoke-static {v1}, Lorg/rabochaya/projects/SvgIcon;->number(Ljava/lang/String;)D

    move-result-wide v1

    aput-wide v1, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object p1

    :cond_1
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    :cond_2
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method private static positive(D)D
    .locals 2

    .line 17
    const-wide/16 v0, 0x0

    cmpg-double v0, p0, v0

    if-ltz v0, :cond_0

    return-wide p0

    :cond_0
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->bad()Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method private static value(Ljava/util/Map;Ljava/lang/String;D)D
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "D)D"
        }
    .end annotation

    .line 15
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lorg/rabochaya/projects/SvgIcon;->number(Ljava/lang/String;)D

    move-result-wide p2

    :goto_0
    return-wide p2
.end method
