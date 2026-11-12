.class public final Lorg/rabochaya/projects/KmlTimeFilter;
.super Ljava/lang/Object;
.source "KmlTimeFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/KmlTimeFilter$Value;,
        Lorg/rabochaya/projects/KmlTimeFilter$Entry;,
        Lorg/rabochaya/projects/KmlTimeFilter$Query;
    }
.end annotation


# static fields
.field public static final ABSENT:I = 0x0

.field public static final MODES:[Ljava/lang/String;

.field public static final UNRECOGNIZED:I = 0x2

.field public static final VALID:I = 0x1

.field private static final VALUE:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 11
    const-string v0, "\u0411\u0435\u0437 \u0434\u0430\u0442\u044b KML"

    const-string v1, "\u0414\u0430\u0442\u0430 KML \u043d\u0435 \u0440\u0430\u0441\u043f\u043e\u0437\u043d\u0430\u043d\u0430"

    const-string v2, "\u041b\u044e\u0431\u044b\u0435 \u0434\u0430\u0442\u044b"

    const-string v3, "\u0415\u0441\u0442\u044c \u0434\u0430\u0442\u0430 KML"

    const-string v4, "\u041f\u0435\u0440\u0435\u0441\u0435\u043a\u0430\u0435\u0442\u0441\u044f \u0441 \u043f\u0435\u0440\u0438\u043e\u0434\u043e\u043c"

    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/KmlTimeFilter;->MODES:[Ljava/lang/String;

    .line 12
    const-string v0, "([0-9]{4})(?:-([0-9]{2})(?:-([0-9]{2})(?:T([0-9]{2}):([0-9]{2}):([0-9]{2})(\\.[0-9]+)?)?)?)?(Z|[+-][0-9]{2}:[0-9]{2})?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/KmlTimeFilter;->VALUE:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Lorg/rabochaya/projects/KmlTimeFilter$Value;
    .locals 0

    .line 9
    invoke-static {p0}, Lorg/rabochaya/projects/KmlTimeFilter;->day(Ljava/lang/String;)Lorg/rabochaya/projects/KmlTimeFilter$Value;

    move-result-object p0

    return-object p0
.end method

.method private static day(Ljava/lang/String;)Lorg/rabochaya/projects/KmlTimeFilter$Value;
    .locals 3

    .line 52
    const-string v0, "[0-9]{4}-[0-9]{2}-[0-9]{2}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    :try_start_0
    invoke-static {p0}, Lorg/rabochaya/projects/KmlTimeFilter;->parse(Ljava/lang/String;)Lorg/rabochaya/projects/KmlTimeFilter$Value;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception v0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041d\u0435\u0441\u0443\u0449\u0435\u0441\u0442\u0432\u0443\u044e\u0449\u0430\u044f \u0434\u0430\u0442\u0430: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u0414\u0430\u0442\u0430: \u0413\u0413\u0413\u0413-\u041c\u041c-\u0414\u0414, \u043d\u0430\u043f\u0440\u0438\u043c\u0435\u0440 2026-10-28"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z
    .locals 2

    .line 67
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object p0

    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_1

    const-string p0, "http://www.opengis.net/kml/2.2"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    const-string p0, "http://earth\\.google\\.com/kml/2\\.[012]"

    invoke-virtual {v0, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    const/4 p0, 0x1

    goto :goto_1

    :cond_2
    const/4 p0, 0x0

    :goto_1
    return p0
.end method

.method private static number(Ljava/util/regex/Matcher;II)I
    .locals 1

    .line 66
    invoke-virtual {p0, p1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    :goto_0
    return p2
.end method

.method private static parse(Ljava/lang/String;)Lorg/rabochaya/projects/KmlTimeFilter$Value;
    .locals 19

    .line 54
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x100

    if-gt v0, v1, :cond_e

    sget-object v0, Lorg/rabochaya/projects/KmlTimeFilter;->VALUE:Ljava/util/regex/Pattern;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 55
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lorg/rabochaya/projects/KmlTimeFilter;->number(Ljava/util/regex/Matcher;II)I

    move-result v4

    const/4 v10, 0x2

    invoke-static {v0, v10, v1}, Lorg/rabochaya/projects/KmlTimeFilter;->number(Ljava/util/regex/Matcher;II)I

    move-result v3

    const/4 v11, 0x3

    invoke-static {v0, v11, v1}, Lorg/rabochaya/projects/KmlTimeFilter;->number(Ljava/util/regex/Matcher;II)I

    move-result v6

    const/4 v12, 0x4

    invoke-static {v0, v12, v2}, Lorg/rabochaya/projects/KmlTimeFilter;->number(Ljava/util/regex/Matcher;II)I

    move-result v13

    const/4 v14, 0x5

    invoke-static {v0, v14, v2}, Lorg/rabochaya/projects/KmlTimeFilter;->number(Ljava/util/regex/Matcher;II)I

    move-result v8

    const/4 v15, 0x6

    invoke-static {v0, v15, v2}, Lorg/rabochaya/projects/KmlTimeFilter;->number(Ljava/util/regex/Matcher;II)I

    move-result v9

    .line 56
    invoke-virtual {v0, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    move/from16 v16, v1

    goto :goto_0

    :cond_0
    move/from16 v16, v2

    :goto_0
    const/4 v5, 0x7

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_1

    sget-object v5, Ljava/math/BigDecimal;->ZERO:Ljava/math/BigDecimal;

    move-object v7, v5

    goto :goto_1

    :cond_1
    new-instance v7, Ljava/math/BigDecimal;

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v7, v5}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    .line 57
    :goto_1
    if-lt v4, v1, :cond_c

    if-lt v3, v1, :cond_c

    const/16 v5, 0xc

    if-gt v3, v5, :cond_c

    if-lt v6, v1, :cond_c

    const/16 v5, 0x1f

    if-gt v6, v5, :cond_c

    const/16 v5, 0x18

    if-gt v13, v5, :cond_c

    const/16 v10, 0x3b

    if-gt v8, v10, :cond_c

    if-gt v9, v10, :cond_c

    if-ne v13, v5, :cond_2

    if-nez v8, :cond_c

    if-nez v9, :cond_c

    invoke-virtual {v7}, Ljava/math/BigDecimal;->signum()I

    move-result v17

    if-nez v17, :cond_c

    .line 58
    :cond_2
    new-instance v10, Ljava/util/GregorianCalendar;

    const-string v18, "UTC"

    invoke-static/range {v18 .. v18}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v12

    sget-object v15, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-direct {v10, v12, v15}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;Ljava/util/Locale;)V

    new-instance v12, Ljava/util/Date;

    const-wide/high16 v14, -0x8000000000000000L

    invoke-direct {v12, v14, v15}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v10, v12}, Ljava/util/GregorianCalendar;->setGregorianChange(Ljava/util/Date;)V

    invoke-virtual {v10, v2}, Ljava/util/GregorianCalendar;->setLenient(Z)V

    invoke-virtual {v10}, Ljava/util/GregorianCalendar;->clear()V

    .line 59
    add-int/lit8 v12, v3, -0x1

    if-ne v13, v5, :cond_3

    move v14, v2

    goto :goto_2

    :cond_3
    move v14, v13

    :goto_2
    move-object v3, v10

    move v15, v5

    move v5, v12

    move-object v12, v7

    move v7, v14

    invoke-virtual/range {v3 .. v9}, Ljava/util/GregorianCalendar;->set(IIIIII)V

    invoke-virtual {v10}, Ljava/util/GregorianCalendar;->getTimeInMillis()J

    move-result-wide v3

    if-ne v13, v15, :cond_4

    const/4 v5, 0x5

    invoke-virtual {v10, v5, v1}, Ljava/util/GregorianCalendar;->add(II)V

    invoke-virtual {v10}, Ljava/util/GregorianCalendar;->getTimeInMillis()J

    move-result-wide v3

    goto :goto_3

    :cond_4
    const/4 v5, 0x5

    .line 60
    :goto_3
    const/16 v6, 0x8

    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_8

    const-string v7, "Z"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_8

    invoke-virtual {v6, v1, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x6

    const/4 v9, 0x4

    invoke-virtual {v6, v9, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    const/16 v9, 0xe

    if-gt v7, v9, :cond_7

    const/16 v13, 0x3b

    if-gt v8, v13, :cond_7

    if-ne v7, v9, :cond_5

    if-nez v8, :cond_7

    :cond_5
    mul-int/lit16 v7, v7, 0xe10

    mul-int/lit8 v8, v8, 0x3c

    add-int/2addr v7, v8

    invoke-virtual {v6, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v8, 0x2d

    if-ne v6, v8, :cond_6

    const/4 v6, -0x1

    goto :goto_4

    :cond_6
    move v6, v1

    :goto_4
    mul-int/2addr v7, v6

    goto :goto_5

    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 61
    :cond_8
    move v7, v2

    :goto_5
    invoke-static {v3, v4, v11}, Ljava/math/BigDecimal;->valueOf(JI)Ljava/math/BigDecimal;

    move-result-object v3

    int-to-long v6, v7

    invoke-static {v6, v7}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v3

    invoke-virtual {v3, v12}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v3

    .line 62
    if-eqz v16, :cond_9

    new-instance v0, Lorg/rabochaya/projects/KmlTimeFilter$Value;

    invoke-direct {v0, v3, v3, v1}, Lorg/rabochaya/projects/KmlTimeFilter$Value;-><init>(Ljava/math/BigDecimal;Ljava/math/BigDecimal;Z)V

    return-object v0

    .line 63
    :cond_9
    invoke-virtual {v0, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_a

    move v4, v5

    goto :goto_6

    :cond_a
    const/4 v4, 0x2

    invoke-virtual {v0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_b

    goto :goto_6

    :cond_b
    move v4, v1

    :goto_6
    invoke-virtual {v10, v4, v1}, Ljava/util/GregorianCalendar;->add(II)V

    .line 64
    invoke-virtual {v10}, Ljava/util/GregorianCalendar;->getTimeInMillis()J

    move-result-wide v0

    invoke-static {v0, v1, v11}, Ljava/math/BigDecimal;->valueOf(JI)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-static {v6, v7}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/KmlTimeFilter$Value;

    invoke-direct {v1, v3, v0, v2}, Lorg/rabochaya/projects/KmlTimeFilter$Value;-><init>(Ljava/math/BigDecimal;Ljava/math/BigDecimal;Z)V

    return-object v1

    .line 57
    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 54
    :cond_d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public static read(Lorg/w3c/dom/Element;)Lorg/rabochaya/projects/KmlTimeFilter$Entry;
    .locals 8

    .line 39
    nop

    .line 40
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p0

    const/4 v0, 0x0

    move-object v1, v0

    :goto_0
    const-string v2, "TimeStamp"

    if-eqz p0, :cond_3

    instance-of v3, p0, Lorg/w3c/dom/Element;

    if-eqz v3, :cond_2

    move-object v3, p0

    check-cast v3, Lorg/w3c/dom/Element;

    invoke-static {v3, v2}, Lorg/rabochaya/projects/KmlTimeFilter;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "TimeSpan"

    invoke-static {v3, v2}, Lorg/rabochaya/projects/KmlTimeFilter;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_0
    if-eqz v1, :cond_1

    invoke-static {}, Lorg/rabochaya/projects/KmlTimeFilter;->unknown()Lorg/rabochaya/projects/KmlTimeFilter$Entry;

    move-result-object p0

    return-object p0

    :cond_1
    move-object v1, v3

    :cond_2
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p0

    goto :goto_0

    .line 41
    :cond_3
    if-nez v1, :cond_4

    new-instance p0, Lorg/rabochaya/projects/KmlTimeFilter$Entry;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v2, p0

    invoke-direct/range {v2 .. v7}, Lorg/rabochaya/projects/KmlTimeFilter$Entry;-><init>(ILjava/math/BigDecimal;Ljava/math/BigDecimal;ZLorg/rabochaya/projects/KmlTimeFilter$1;)V

    return-object p0

    .line 43
    :cond_4
    :try_start_0
    invoke-static {v1, v2}, Lorg/rabochaya/projects/KmlTimeFilter;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_6

    const-string p0, "when"

    invoke-static {v1, p0}, Lorg/rabochaya/projects/KmlTimeFilter;->scalar(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_5

    invoke-static {p0}, Lorg/rabochaya/projects/KmlTimeFilter;->parse(Ljava/lang/String;)Lorg/rabochaya/projects/KmlTimeFilter$Value;

    move-result-object p0

    new-instance v6, Lorg/rabochaya/projects/KmlTimeFilter$Entry;

    iget-object v2, p0, Lorg/rabochaya/projects/KmlTimeFilter$Value;->begin:Ljava/math/BigDecimal;

    iget-object v3, p0, Lorg/rabochaya/projects/KmlTimeFilter$Value;->end:Ljava/math/BigDecimal;

    iget-boolean v4, p0, Lorg/rabochaya/projects/KmlTimeFilter$Value;->point:Z

    const/4 v5, 0x0

    const/4 v1, 0x1

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/KmlTimeFilter$Entry;-><init>(ILjava/math/BigDecimal;Ljava/math/BigDecimal;ZLorg/rabochaya/projects/KmlTimeFilter$1;)V

    return-object v6

    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0

    .line 44
    :cond_6
    const-string p0, "begin"

    invoke-static {v1, p0}, Lorg/rabochaya/projects/KmlTimeFilter;->scalar(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v2, "end"

    invoke-static {v1, v2}, Lorg/rabochaya/projects/KmlTimeFilter;->scalar(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez p0, :cond_8

    if-eqz v1, :cond_7

    goto :goto_1

    :cond_7
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0

    .line 45
    :cond_8
    :goto_1
    if-nez p0, :cond_9

    move-object p0, v0

    goto :goto_2

    :cond_9
    invoke-static {p0}, Lorg/rabochaya/projects/KmlTimeFilter;->parse(Ljava/lang/String;)Lorg/rabochaya/projects/KmlTimeFilter$Value;

    move-result-object p0

    :goto_2
    if-nez v1, :cond_a

    move-object v1, v0

    goto :goto_3

    :cond_a
    invoke-static {v1}, Lorg/rabochaya/projects/KmlTimeFilter;->parse(Ljava/lang/String;)Lorg/rabochaya/projects/KmlTimeFilter$Value;

    move-result-object v1

    :goto_3
    if-nez p0, :cond_b

    move-object v4, v0

    goto :goto_4

    :cond_b
    iget-object p0, p0, Lorg/rabochaya/projects/KmlTimeFilter$Value;->begin:Ljava/math/BigDecimal;

    move-object v4, p0

    :goto_4
    if-nez v1, :cond_c

    goto :goto_5

    :cond_c
    iget-object v0, v1, Lorg/rabochaya/projects/KmlTimeFilter$Value;->end:Ljava/math/BigDecimal;

    :goto_5
    move-object v5, v0

    if-eqz v1, :cond_d

    iget-boolean p0, v1, Lorg/rabochaya/projects/KmlTimeFilter$Value;->point:Z

    if-eqz p0, :cond_d

    const/4 p0, 0x1

    goto :goto_6

    :cond_d
    const/4 p0, 0x0

    :goto_6
    move v6, p0

    .line 46
    if-eqz v4, :cond_f

    if-eqz v5, :cond_f

    invoke-virtual {v4, v5}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result p0

    if-gtz p0, :cond_e

    if-nez p0, :cond_f

    if-eqz v6, :cond_e

    goto :goto_7

    :cond_e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0

    .line 47
    :cond_f
    :goto_7
    new-instance p0, Lorg/rabochaya/projects/KmlTimeFilter$Entry;

    const/4 v3, 0x1

    const/4 v7, 0x0

    move-object v2, p0

    invoke-direct/range {v2 .. v7}, Lorg/rabochaya/projects/KmlTimeFilter$Entry;-><init>(ILjava/math/BigDecimal;Ljava/math/BigDecimal;ZLorg/rabochaya/projects/KmlTimeFilter$1;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 48
    :catch_0
    move-exception p0

    invoke-static {}, Lorg/rabochaya/projects/KmlTimeFilter;->unknown()Lorg/rabochaya/projects/KmlTimeFilter$Entry;

    move-result-object p0

    return-object p0
.end method

.method private static scalar(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 51
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object p0

    const/4 v0, 0x0

    :goto_0
    if-eqz p0, :cond_4

    instance-of v1, p0, Lorg/w3c/dom/Element;

    if-eqz v1, :cond_3

    move-object v1, p0

    check-cast v1, Lorg/w3c/dom/Element;

    invoke-static {v1, p1}, Lorg/rabochaya/projects/KmlTimeFilter;->is(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    if-nez v0, :cond_2

    invoke-interface {p0}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v0

    :goto_1
    if-eqz v0, :cond_1

    instance-of v1, v0, Lorg/w3c/dom/Element;

    if-nez v1, :cond_0

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object v0

    goto :goto_1

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0

    :cond_1
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0

    :cond_3
    :goto_2
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNextSibling()Lorg/w3c/dom/Node;

    move-result-object p0

    goto :goto_0

    :cond_4
    return-object v0
.end method

.method private static unknown()Lorg/rabochaya/projects/KmlTimeFilter$Entry;
    .locals 7

    .line 50
    new-instance v6, Lorg/rabochaya/projects/KmlTimeFilter$Entry;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/KmlTimeFilter$Entry;-><init>(ILjava/math/BigDecimal;Ljava/math/BigDecimal;ZLorg/rabochaya/projects/KmlTimeFilter$1;)V

    return-object v6
.end method
