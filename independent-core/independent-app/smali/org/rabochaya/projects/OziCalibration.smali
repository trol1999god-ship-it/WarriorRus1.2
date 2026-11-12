.class public final Lorg/rabochaya/projects/OziCalibration;
.super Ljava/lang/Object;
.source "OziCalibration.java"


# static fields
.field public static final MAX_BYTES:I = 0x20000


# instance fields
.field public final controls:I

.field public final imageName:Ljava/lang/String;

.field public final transform:Lorg/rabochaya/projects/GeoRasterTransform;


# direct methods
.method private constructor <init>(Ljava/lang/String;Lorg/rabochaya/projects/GeoRasterTransform;I)V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/OziCalibration;->imageName:Ljava/lang/String;

    iput-object p2, p0, Lorg/rabochaya/projects/OziCalibration;->transform:Lorg/rabochaya/projects/GeoRasterTransform;

    iput p3, p0, Lorg/rabochaya/projects/OziCalibration;->controls:I

    return-void
.end method

.method private static angle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)D
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 12
    invoke-static {p0}, Lorg/rabochaya/projects/OziCalibration;->number(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {p1}, Lorg/rabochaya/projects/OziCalibration;->number(Ljava/lang/String;)D

    move-result-wide p0

    if-eqz p3, :cond_0

    const-wide v2, 0x4056800000000000L    # 90.0

    goto :goto_0

    :cond_0
    const-wide v2, 0x4066800000000000L    # 180.0

    :goto_0
    const-wide/16 v4, 0x0

    cmpg-double v6, v0, v4

    if-ltz v6, :cond_7

    invoke-static {v0, v1}, Ljava/lang/Math;->rint(D)D

    move-result-wide v6

    cmpl-double v6, v0, v6

    if-nez v6, :cond_7

    cmpl-double v2, v0, v2

    if-gtz v2, :cond_7

    cmpg-double v3, p0, v4

    if-ltz v3, :cond_7

    const-wide/high16 v6, 0x404e000000000000L    # 60.0

    cmpl-double v3, p0, v6

    if-gez v3, :cond_7

    if-nez v2, :cond_1

    cmpl-double v2, p0, v4

    if-nez v2, :cond_7

    :cond_1
    const-string v2, "W"

    const-string v3, "S"

    if-eqz p3, :cond_2

    const-string p3, "N"

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_4

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_3

    goto :goto_1

    :cond_2
    const-string p3, "E"

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_4

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_3

    goto :goto_1

    :cond_3
    const-string p0, "\u043d\u0435\u0438\u0437\u0432\u0435\u0441\u0442\u043d\u043e\u0435 \u043f\u043e\u043b\u0443\u0448\u0430\u0440\u0438\u0435"

    invoke-static {p0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    :cond_4
    :goto_1
    div-double/2addr p0, v6

    add-double/2addr v0, p0

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_6

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5

    goto :goto_2

    :cond_5
    const/4 p0, 0x1

    goto :goto_3

    :cond_6
    :goto_2
    const/4 p0, -0x1

    :goto_3
    int-to-double p0, p0

    mul-double/2addr v0, p0

    return-wide v0

    :cond_7
    const-string p0, "\u043d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u044b\u0435 \u0433\u0440\u0430\u0434\u0443\u0441\u044b/\u043c\u0438\u043d\u0443\u0442\u044b"

    invoke-static {p0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method private static bad(Ljava/lang/String;)Ljava/io/IOException;
    .locals 3

    .line 7
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Ozi: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private static basename(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 11
    const/16 v0, 0x5c

    const/16 v1, 0x2f

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const-string v1, "\u043d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u043e\u0435 \u0438\u043c\u044f \u0438\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u044f"

    if-nez v0, :cond_5

    const-string v0, "//"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "/"

    const/4 v2, -0x1

    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_1

    aget-object v4, p0, v3

    const-string v5, ".."

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    const-string p0, "\u043f\u0443\u0442\u044c \u0441 .. \u0437\u0430\u043f\u0440\u0435\u0449\u0451\u043d"

    invoke-static {p0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    :cond_1
    array-length v0, p0

    add-int/lit8 v0, v0, -0x1

    aget-object p0, p0, v0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    const/16 v0, 0x3a

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_4

    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v2, v0, :cond_3

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v0

    if-nez v0, :cond_2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    invoke-static {v1}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    :cond_3
    return-object p0

    :cond_4
    invoke-static {v1}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0

    :cond_5
    invoke-static {v1}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method private static csv(Ljava/lang/String;)[Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8
    const/16 v0, 0x22

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_1

    const-string v0, ","

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    aget-object v1, p0, v0

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    aput-object v1, p0, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object p0

    :cond_1
    const-string p0, "\u043a\u0430\u0432\u044b\u0447\u043a\u0438 CSV \u043f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u044b"

    invoke-static {p0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method private static integer(Ljava/lang/String;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    invoke-static {p0}, Lorg/rabochaya/projects/OziCalibration;->number(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->rint(D)D

    move-result-wide v2

    cmpl-double p0, v0, v2

    if-nez p0, :cond_0

    const-wide/high16 v2, -0x3e20000000000000L    # -2.147483648E9

    cmpg-double p0, v0, v2

    if-ltz p0, :cond_0

    const-wide v2, 0x41dfffffffc00000L    # 2.147483647E9

    cmpl-double p0, v0, v2

    if-gtz p0, :cond_0

    double-to-int p0, v0

    return p0

    :cond_0
    const-string p0, "\u043e\u0436\u0438\u0434\u0430\u043b\u043e\u0441\u044c \u0446\u0435\u043b\u043e\u0435 \u0447\u0438\u0441\u043b\u043e"

    invoke-static {p0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method private static number(Ljava/lang/String;)D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 9
    :try_start_0
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result p0

    if-nez p0, :cond_0

    invoke-static {v0, v1}, Ljava/lang/Double;->isInfinite(D)Z

    move-result p0

    if-nez p0, :cond_0

    return-wide v0

    :cond_0
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0}, Ljava/lang/NumberFormatException;-><init>()V

    throw p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p0

    const-string p0, "\u043d\u0435\u0447\u0438\u0441\u043b\u043e\u0432\u0430\u044f \u043a\u0430\u043b\u0438\u0431\u0440\u043e\u0432\u043a\u0430"

    invoke-static {p0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p0

    throw p0
.end method

.method public static read(Ljava/io/InputStream;Ljava/lang/String;II)Lorg/rabochaya/projects/OziCalibration;
    .locals 38
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    move/from16 v0, p2

    move/from16 v3, p3

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v2, 0x1000

    new-array v4, v2, [B

    :goto_0
    move-object/from16 v5, p0

    invoke-virtual {v5, v4}, Ljava/io/InputStream;->read([B)I

    move-result v6

    const/4 v7, -0x1

    const/4 v14, 0x0

    if-eq v6, v7, :cond_1

    const/high16 v7, 0x20000

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v8

    sub-int/2addr v7, v8

    if-gt v6, v7, :cond_0

    invoke-virtual {v1, v4, v14, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    :cond_0
    const-string v0, ".map \u0431\u043e\u043b\u044c\u0448\u0435 128 \u041a\u0438\u0411"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :cond_1
    :try_start_0
    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v4}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v4

    sget-object v5, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v4, v5}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v4

    sget-object v5, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v4, v5}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_0 .. :try_end_0} :catch_1

    const-string v4, "\ufeff"

    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    const/4 v15, 0x1

    if-eqz v4, :cond_2

    invoke-virtual {v1, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    :cond_2
    invoke-virtual {v1, v14}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-gez v4, :cond_39

    const-string v4, "\\r?\\n"

    invoke-virtual {v1, v4, v7}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    array-length v4, v1

    const/4 v5, 0x5

    if-lt v4, v5, :cond_38

    array-length v4, v1

    if-gt v4, v2, :cond_38

    aget-object v4, v1, v14

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const-string v6, "OziExplorer Map Data File Version 2.2"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_38

    array-length v4, v1

    move v6, v14

    :goto_1
    if-ge v6, v4, :cond_4

    aget-object v8, v1, v6

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-gt v8, v2, :cond_3

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_3
    const-string v0, "\u0441\u043b\u0438\u0448\u043a\u043e\u043c \u0434\u043b\u0438\u043d\u043d\u0430\u044f \u0441\u0442\u0440\u043e\u043a\u0430"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 16
    :cond_4
    const/4 v12, 0x2

    aget-object v2, v1, v12

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/rabochaya/projects/OziCalibration;->basename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static/range {p1 .. p1}, Lorg/rabochaya/projects/OziCalibration;->basename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_37

    const/4 v2, 0x4

    aget-object v4, v1, v2

    invoke-static {v4}, Lorg/rabochaya/projects/OziCalibration;->csv(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    array-length v6, v4

    if-lt v6, v15, :cond_36

    aget-object v6, v4, v14

    const-string v8, "WGS 84"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_36

    move v6, v15

    :goto_2
    array-length v9, v4

    const-wide/16 v10, 0x0

    if-ge v6, v9, :cond_7

    aget-object v9, v4, v6

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_6

    aget-object v9, v4, v6

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_6

    aget-object v9, v4, v6

    invoke-static {v9}, Lorg/rabochaya/projects/OziCalibration;->number(Ljava/lang/String;)D

    move-result-wide v16

    cmpl-double v9, v16, v10

    if-nez v9, :cond_5

    goto :goto_3

    :cond_5
    const-string v0, "\u0441\u0434\u0432\u0438\u0433 \u0434\u0430\u0442\u0443\u043c\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :cond_6
    :goto_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 17
    :cond_7
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    .line 18
    move v9, v5

    move/from16 v20, v7

    move/from16 v16, v14

    move/from16 v17, v16

    move/from16 v18, v17

    move/from16 v19, v18

    :goto_4
    array-length v7, v1

    move-object/from16 p1, v6

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    if-ge v9, v7, :cond_26

    aget-object v7, v1, v9

    invoke-static {v7}, Lorg/rabochaya/projects/OziCalibration;->csv(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    aget-object v2, v7, v14

    const-string v14, "Map Projection"

    invoke-virtual {v2, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_d

    if-nez v16, :cond_c

    array-length v2, v7

    if-lt v2, v12, :cond_c

    aget-object v2, v7, v15

    const-string v5, "Latitude/Longitude"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    move v5, v12

    :goto_5
    array-length v6, v7

    if-ge v5, v6, :cond_b

    aget-object v6, v7, v5

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_8

    array-length v6, v7

    sub-int/2addr v6, v15

    if-ne v5, v6, :cond_8

    goto :goto_6

    :cond_8
    add-int/lit8 v6, v5, 0x1

    array-length v14, v7

    if-ge v6, v14, :cond_a

    aget-object v14, v7, v5

    const-string v15, "PolyCal"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_9

    aget-object v14, v7, v5

    const-string v15, "AutoCalOnly"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_9

    aget-object v14, v7, v5

    const-string v15, "BSBUseWPX"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_a

    :cond_9
    aget-object v14, v7, v5

    invoke-virtual {v2, v14}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_a

    aget-object v6, v7, v6

    const-string v14, "No"

    invoke-virtual {v6, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a

    add-int/lit8 v5, v5, 0x2

    const/4 v15, 0x1

    goto :goto_5

    :cond_a
    const-string v0, "\u0430\u043b\u044c\u0442\u0435\u0440\u043d\u0430\u0442\u0438\u0432\u043d\u0430\u044f/\u043d\u0435\u043b\u0438\u043d\u0435\u0439\u043d\u0430\u044f \u043a\u0430\u043b\u0438\u0431\u0440\u043e\u0432\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u0430"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :cond_b
    :goto_6
    move-object/from16 v14, p1

    const/16 v16, 0x1

    goto/16 :goto_d

    :cond_c
    const-string v0, "\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u0430 \u0442\u043e\u043b\u044c\u043a\u043e Latitude/Longitude"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 19
    :cond_d
    const-string v14, "Projection Setup"

    invoke-virtual {v2, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_12

    if-nez v17, :cond_11

    const/4 v2, 0x1

    :goto_7
    array-length v5, v7

    if-ge v2, v5, :cond_10

    aget-object v5, v7, v2

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_f

    aget-object v5, v7, v2

    invoke-static {v5}, Lorg/rabochaya/projects/OziCalibration;->number(Ljava/lang/String;)D

    move-result-wide v5

    cmpl-double v5, v5, v10

    if-nez v5, :cond_e

    goto :goto_8

    :cond_e
    const-string v0, "\u043f\u0430\u0440\u0430\u043c\u0435\u0442\u0440\u044b \u043f\u0440\u043e\u0435\u043a\u0446\u0438\u0438 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u044b"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :cond_f
    :goto_8
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_10
    move-object/from16 v14, p1

    const/16 v17, 0x1

    goto/16 :goto_d

    :cond_11
    const-string v0, "\u043f\u043e\u0432\u0442\u043e\u0440 Projection Setup"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 20
    :cond_12
    const-string v14, "MSF"

    invoke-virtual {v2, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_14

    if-nez v19, :cond_13

    array-length v2, v7

    if-lt v2, v12, :cond_13

    const/4 v2, 0x1

    aget-object v7, v7, v2

    invoke-static {v7}, Lorg/rabochaya/projects/OziCalibration;->number(Ljava/lang/String;)D

    move-result-wide v14

    cmpl-double v2, v14, v5

    if-nez v2, :cond_13

    move-object/from16 v14, p1

    const/16 v19, 0x1

    goto/16 :goto_d

    :cond_13
    const-string v0, "\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d \u0442\u043e\u043b\u044c\u043a\u043e MSF=1"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 21
    :cond_14
    const-string v5, "IWH"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_16

    if-nez v18, :cond_15

    array-length v2, v7

    const/4 v5, 0x4

    if-lt v2, v5, :cond_15

    aget-object v2, v7, v12

    invoke-static {v2}, Lorg/rabochaya/projects/OziCalibration;->integer(Ljava/lang/String;)I

    move-result v2

    if-ne v2, v0, :cond_15

    const/4 v2, 0x3

    aget-object v2, v7, v2

    invoke-static {v2}, Lorg/rabochaya/projects/OziCalibration;->integer(Ljava/lang/String;)I

    move-result v2

    if-ne v2, v3, :cond_15

    move-object/from16 v14, p1

    const/16 v18, 0x1

    goto/16 :goto_d

    :cond_15
    const-string v0, "\u0440\u0430\u0437\u043c\u0435\u0440\u044b IWH \u043d\u0435 \u0441\u043e\u0432\u043f\u0430\u0434\u0430\u044e\u0442 \u0441 \u0438\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435\u043c"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 22
    :cond_16
    const-string v5, "Point[0-9]+"

    invoke-virtual {v2, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1b

    array-length v5, v7

    const/4 v6, 0x4

    if-lt v5, v6, :cond_1a

    aget-object v5, v7, v12

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_17

    const/4 v5, 0x3

    aget-object v6, v7, v5

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_17

    move-object/from16 v14, p1

    :goto_9
    move/from16 v10, v20

    goto/16 :goto_c

    :cond_17
    array-length v5, v7

    const/16 v6, 0x11

    if-lt v5, v6, :cond_19

    const/4 v5, 0x1

    aget-object v6, v7, v5

    const-string v5, "xy"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_19

    const/4 v5, 0x4

    aget-object v6, v7, v5

    const-string v5, "in"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_19

    move-object/from16 v14, p1

    invoke-virtual {v14, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/16 v5, 0x1e

    if-ge v2, v5, :cond_19

    aget-object v2, v7, v12

    invoke-static {v2}, Lorg/rabochaya/projects/OziCalibration;->number(Ljava/lang/String;)D

    move-result-wide v5

    const/4 v2, 0x3

    aget-object v15, v7, v2

    invoke-static {v15}, Lorg/rabochaya/projects/OziCalibration;->number(Ljava/lang/String;)D

    move-result-wide v26

    cmpg-double v2, v5, v10

    if-ltz v2, :cond_18

    cmpg-double v2, v26, v10

    if-ltz v2, :cond_18

    int-to-double v10, v0

    cmpl-double v2, v5, v10

    if-gtz v2, :cond_18

    int-to-double v10, v3

    cmpl-double v2, v26, v10

    if-gtz v2, :cond_18

    const/4 v10, 0x5

    aget-object v2, v7, v10

    const-string v11, "deg"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    const/16 v2, 0x9

    aget-object v2, v7, v2

    const/16 v11, 0xa

    aget-object v11, v7, v11

    const/16 v15, 0xb

    aget-object v15, v7, v15

    const/4 v10, 0x0

    invoke-static {v2, v11, v15, v10}, Lorg/rabochaya/projects/OziCalibration;->angle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)D

    move-result-wide v30

    const/4 v2, 0x6

    aget-object v2, v7, v2

    const/4 v11, 0x7

    aget-object v11, v7, v11

    const/16 v15, 0x8

    aget-object v7, v7, v15

    const/4 v15, 0x1

    invoke-static {v2, v11, v7, v15}, Lorg/rabochaya/projects/OziCalibration;->angle(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)D

    move-result-wide v32

    const/4 v2, 0x4

    new-array v7, v2, [D

    aput-wide v5, v7, v10

    aput-wide v26, v7, v15

    aput-wide v30, v7, v12

    const/4 v2, 0x3

    aput-wide v32, v7, v2

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_9

    :cond_18
    const-string v0, "\u0442\u043e\u0447\u043a\u0430 \u0432\u043d\u0435 \u0438\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u044f \u0438\u043b\u0438 \u043d\u0435\u0442 degrees"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :cond_19
    const-string v0, "\u043d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u044b\u0439/\u043f\u043e\u0432\u0442\u043e\u0440\u043d\u044b\u0439 Point \u0438\u043b\u0438 \u0431\u043e\u043b\u044c\u0448\u0435 30 \u0442\u043e\u0447\u0435\u043a"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :cond_1a
    const-string v0, "\u043f\u043e\u0432\u0440\u0435\u0436\u0434\u0451\u043d Point"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 23
    :cond_1b
    move-object/from16 v14, p1

    const-string v5, "MMPNUM"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1d

    move/from16 v10, v20

    const/4 v11, -0x1

    if-ne v10, v11, :cond_1c

    array-length v2, v7

    if-ne v2, v12, :cond_1c

    const/4 v2, 0x1

    aget-object v5, v7, v2

    invoke-static {v5}, Lorg/rabochaya/projects/OziCalibration;->integer(Ljava/lang/String;)I

    move-result v2

    if-ltz v2, :cond_1c

    const/4 v5, 0x4

    if-gt v2, v5, :cond_1c

    move/from16 v20, v2

    goto/16 :goto_d

    :cond_1c
    const-string v0, "\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u0430 \u0442\u043e\u043b\u044c\u043a\u043e \u043f\u0440\u044f\u043c\u043e\u0443\u0433\u043e\u043b\u044c\u043d\u0430\u044f \u0433\u0440\u0430\u043d\u0438\u0446\u0430"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 24
    :cond_1d
    move/from16 v10, v20

    const/4 v11, -0x1

    const-string v5, "MMPXY"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    array-length v2, v7

    const/4 v5, 0x4

    if-ne v2, v5, :cond_24

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v2, v5, :cond_24

    const/4 v2, 0x1

    aget-object v5, v7, v2

    invoke-static {v5}, Lorg/rabochaya/projects/OziCalibration;->integer(Ljava/lang/String;)I

    move-result v5

    aget-object v6, v7, v12

    invoke-static {v6}, Lorg/rabochaya/projects/OziCalibration;->integer(Ljava/lang/String;)I

    move-result v6

    const/4 v15, 0x3

    aget-object v7, v7, v15

    invoke-static {v7}, Lorg/rabochaya/projects/OziCalibration;->integer(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v15

    add-int/2addr v15, v2

    if-ne v5, v15, :cond_23

    if-eqz v6, :cond_1e

    if-ne v6, v0, :cond_23

    :cond_1e
    if-eqz v7, :cond_1f

    if-ne v7, v3, :cond_23

    :cond_1f
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_22

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [I

    const/4 v15, 0x0

    aget v11, v5, v15

    if-ne v11, v6, :cond_21

    const/4 v11, 0x1

    aget v5, v5, v11

    if-eq v5, v7, :cond_20

    goto :goto_b

    :cond_20
    const-string v0, "\u043f\u043e\u0432\u0442\u043e\u0440 \u0443\u0433\u043b\u0430 \u0433\u0440\u0430\u043d\u0438\u0446\u044b"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :cond_21
    :goto_b
    const/4 v11, -0x1

    goto :goto_a

    :cond_22
    filled-new-array {v6, v7}, [I

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_c

    :cond_23
    const-string v0, "\u043e\u0431\u0440\u0435\u0437\u0430\u043d\u043d\u0430\u044f/\u043f\u0440\u043e\u0438\u0437\u0432\u043e\u043b\u044c\u043d\u0430\u044f \u0433\u0440\u0430\u043d\u0438\u0446\u0430 \u043f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u0430"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :cond_24
    const-string v0, "\u043d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u0430\u044f \u0433\u0440\u0430\u043d\u0438\u0446\u0430"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 18
    :cond_25
    :goto_c
    move/from16 v20, v10

    :goto_d
    add-int/lit8 v9, v9, 0x1

    move-object v6, v14

    const/4 v2, 0x4

    const/4 v5, 0x5

    const/4 v7, -0x1

    const-wide/16 v10, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    goto/16 :goto_4

    .line 26
    :cond_26
    move/from16 v10, v20

    if-eqz v16, :cond_35

    if-eqz v17, :cond_35

    if-eqz v18, :cond_35

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x3

    if-lt v1, v2, :cond_35

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_27

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_28

    if-ne v10, v2, :cond_28

    :cond_27
    if-lez v10, :cond_29

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne v1, v10, :cond_28

    goto :goto_e

    :cond_28
    const-string v0, "\u043d\u0435\u043f\u043e\u043b\u043d\u0430\u044f \u0433\u0440\u0430\u043d\u0438\u0446\u0430"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 27
    :cond_29
    :goto_e
    const/4 v1, 0x0

    :goto_f
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_2d

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v7

    rem-int v7, v1, v7

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [I

    const/4 v9, 0x0

    aget v10, v2, v9

    aget v11, v7, v9

    if-ne v10, v11, :cond_2a

    const/4 v9, 0x1

    goto :goto_10

    :cond_2a
    const/4 v9, 0x0

    :goto_10
    const/4 v10, 0x1

    aget v2, v2, v10

    aget v7, v7, v10

    if-ne v2, v7, :cond_2b

    const/4 v2, 0x1

    goto :goto_11

    :cond_2b
    const/4 v2, 0x0

    :goto_11
    if-eq v9, v2, :cond_2c

    goto :goto_f

    :cond_2c
    const-string v0, "\u0433\u0440\u0430\u043d\u0438\u0446\u0430 \u0434\u043e\u043b\u0436\u043d\u0430 \u0438\u0434\u0442\u0438 \u043f\u043e \u0441\u0442\u043e\u0440\u043e\u043d\u0430\u043c \u043f\u043e\u043b\u043d\u043e\u0433\u043e \u043f\u0440\u044f\u043c\u043e\u0443\u0433\u043e\u043b\u044c\u043d\u0438\u043a\u0430"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 28
    :cond_2d
    const/4 v1, 0x0

    move-object v2, v1

    move-object v4, v2

    const/4 v7, 0x0

    const-wide/16 v10, 0x0

    :goto_12
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v7, v9, :cond_31

    add-int/lit8 v9, v7, 0x1

    move v14, v9

    :goto_13
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v15

    if-ge v14, v15, :cond_30

    add-int/lit8 v15, v14, 0x1

    move v12, v15

    :goto_14
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v12, v5, :cond_2f

    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [D

    invoke-virtual {v8, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [D

    invoke-virtual {v8, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, [D

    const/16 v19, 0x0

    aget-wide v20, v6, v19

    aget-wide v26, v5, v19

    sub-double v20, v20, v26

    const/16 v22, 0x1

    aget-wide v24, v18, v22

    aget-wide v26, v5, v22

    sub-double v24, v24, v26

    mul-double v20, v20, v24

    aget-wide v25, v18, v19

    aget-wide v27, v5, v19

    sub-double v26, v25, v27

    aget-wide v28, v6, v22

    aget-wide v30, v5, v22

    sub-double v28, v28, v30

    mul-double v26, v26, v28

    sub-double v20, v20, v26

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->abs(D)D

    move-result-wide v26

    invoke-static {v10, v11}, Ljava/lang/Math;->abs(D)D

    move-result-wide v28

    cmpl-double v19, v26, v28

    if-lez v19, :cond_2e

    move-object v2, v5

    move-object v1, v6

    move-object/from16 v4, v18

    move-wide/from16 v10, v20

    :cond_2e
    add-int/lit8 v12, v12, 0x1

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    goto :goto_14

    :cond_2f
    move v14, v15

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    const/4 v12, 0x2

    goto :goto_13

    :cond_30
    move v7, v9

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    const/4 v12, 0x2

    goto :goto_12

    :cond_31
    invoke-static {v10, v11}, Ljava/lang/Math;->abs(D)D

    move-result-wide v5

    int-to-double v14, v0

    move-object/from16 p1, v8

    int-to-double v7, v3

    mul-double/2addr v14, v7

    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    invoke-static {v7, v8, v14, v15}, Ljava/lang/Math;->max(DD)D

    move-result-wide v7

    const-wide v14, 0x3ddb7cdfd9d7bdbbL    # 1.0E-10

    mul-double/2addr v7, v14

    cmpg-double v5, v5, v7

    if-ltz v5, :cond_34

    .line 29
    const/4 v12, 0x2

    aget-wide v5, v1, v12

    aget-wide v7, v2, v12

    sub-double/2addr v5, v7

    const/4 v7, 0x1

    aget-wide v8, v4, v7

    aget-wide v14, v2, v7

    sub-double/2addr v8, v14

    mul-double/2addr v5, v8

    aget-wide v8, v4, v12

    aget-wide v14, v2, v12

    sub-double/2addr v8, v14

    aget-wide v14, v1, v7

    aget-wide v16, v2, v7

    sub-double v14, v14, v16

    mul-double/2addr v8, v14

    sub-double/2addr v5, v8

    div-double v18, v5, v10

    const/4 v5, 0x0

    aget-wide v6, v1, v5

    aget-wide v8, v2, v5

    sub-double/2addr v6, v8

    aget-wide v8, v4, v12

    aget-wide v14, v2, v12

    sub-double/2addr v8, v14

    mul-double/2addr v6, v8

    aget-wide v8, v4, v5

    aget-wide v14, v2, v5

    sub-double/2addr v8, v14

    aget-wide v14, v1, v12

    aget-wide v16, v2, v12

    sub-double v14, v14, v16

    mul-double/2addr v8, v14

    sub-double/2addr v6, v8

    div-double v20, v6, v10

    aget-wide v6, v2, v12

    aget-wide v8, v2, v5

    mul-double v8, v8, v18

    sub-double/2addr v6, v8

    const/4 v5, 0x1

    aget-wide v8, v2, v5

    mul-double v8, v8, v20

    sub-double v26, v6, v8

    const/4 v6, 0x3

    aget-wide v7, v1, v6

    aget-wide v14, v2, v6

    sub-double/2addr v7, v14

    aget-wide v14, v4, v5

    aget-wide v16, v2, v5

    sub-double v14, v14, v16

    mul-double/2addr v7, v14

    aget-wide v14, v4, v6

    aget-wide v16, v2, v6

    sub-double v14, v14, v16

    aget-wide v16, v1, v5

    aget-wide v22, v2, v5

    sub-double v16, v16, v22

    mul-double v14, v14, v16

    sub-double/2addr v7, v14

    div-double v14, v7, v10

    const/16 v16, 0x0

    aget-wide v7, v1, v16

    aget-wide v22, v2, v16

    sub-double v7, v7, v22

    aget-wide v22, v4, v6

    aget-wide v28, v2, v6

    sub-double v22, v22, v28

    mul-double v7, v7, v22

    aget-wide v22, v4, v16

    aget-wide v4, v2, v16

    sub-double v22, v22, v4

    aget-wide v4, v1, v6

    aget-wide v28, v2, v6

    sub-double v4, v4, v28

    mul-double v22, v22, v4

    sub-double v7, v7, v22

    div-double v22, v7, v10

    aget-wide v4, v2, v6

    aget-wide v7, v2, v16

    mul-double/2addr v7, v14

    sub-double/2addr v4, v7

    const/16 v17, 0x1

    aget-wide v1, v2, v17

    mul-double v1, v1, v22

    sub-double v24, v4, v1

    mul-double v1, v18, v22

    mul-double v4, v20, v14

    sub-double v28, v1, v4

    :try_start_1
    new-instance v10, Lorg/rabochaya/projects/GeoRasterTransform;

    const/16 v4, 0x10e6

    const/4 v5, 0x0

    move-object v1, v10

    move/from16 v30, v6

    move/from16 v2, p2

    move/from16 v3, p3

    move-wide/from16 v6, v18

    move-object/from16 v0, p1

    move-wide/from16 v8, v20

    move-object/from16 v34, v10

    move-wide/from16 v10, v26

    move/from16 v31, v12

    move-object/from16 v35, v13

    move-wide v12, v14

    move-wide/from16 v36, v14

    move/from16 v32, v16

    move/from16 v33, v17

    move-wide/from16 v14, v22

    move-wide/from16 v16, v24

    invoke-direct/range {v1 .. v17}, Lorg/rabochaya/projects/GeoRasterTransform;-><init>(IIIZDDDDDD)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    .line 30
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_15
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_33

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [D

    aget-wide v3, v2, v32

    mul-double v3, v3, v18

    aget-wide v5, v2, v33

    mul-double v5, v5, v20

    add-double/2addr v3, v5

    add-double v3, v3, v26

    aget-wide v5, v2, v31

    sub-double/2addr v3, v5

    aget-wide v5, v2, v32

    move-wide/from16 v7, v36

    mul-double v14, v7, v5

    aget-wide v5, v2, v33

    mul-double v5, v5, v22

    add-double/2addr v14, v5

    add-double v14, v14, v24

    aget-wide v5, v2, v30

    sub-double/2addr v14, v5

    mul-double v5, v22, v3

    mul-double v9, v20, v14

    sub-double/2addr v5, v9

    div-double v5, v5, v28

    neg-double v9, v7

    mul-double/2addr v9, v3

    mul-double v14, v14, v18

    add-double/2addr v9, v14

    div-double v9, v9, v28

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    move-result v2

    if-nez v2, :cond_32

    invoke-static {v5, v6}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v2

    if-nez v2, :cond_32

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    move-result v2

    if-nez v2, :cond_32

    invoke-static {v9, v10}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v2

    if-nez v2, :cond_32

    invoke-static {v5, v6, v9, v10}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v2

    const-wide/high16 v4, 0x3fd0000000000000L    # 0.25

    cmpl-double v2, v2, v4

    if-gtz v2, :cond_32

    move-wide/from16 v36, v7

    goto :goto_15

    :cond_32
    const-string v0, "\u043a\u043e\u043d\u0442\u0440\u043e\u043b\u044c\u043d\u044b\u0435 \u0442\u043e\u0447\u043a\u0438 \u043d\u0435 \u043e\u043f\u0438\u0441\u044b\u0432\u0430\u044e\u0442 affine \u043f\u0440\u0438\u0432\u044f\u0437\u043a\u0443 (0.25 px)"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 31
    :cond_33
    new-instance v1, Lorg/rabochaya/projects/OziCalibration;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    move-object/from16 v3, v34

    move-object/from16 v2, v35

    invoke-direct {v1, v2, v3, v0}, Lorg/rabochaya/projects/OziCalibration;-><init>(Ljava/lang/String;Lorg/rabochaya/projects/GeoRasterTransform;I)V

    return-object v1

    .line 29
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 28
    :cond_34
    const-string v0, "\u043a\u043e\u043d\u0442\u0440\u043e\u043b\u044c\u043d\u044b\u0435 \u0442\u043e\u0447\u043a\u0438 \u043a\u043e\u043b\u043b\u0438\u043d\u0435\u0430\u0440\u043d\u044b/\u043d\u0435\u0443\u0441\u0442\u043e\u0439\u0447\u0438\u0432\u044b"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 26
    :cond_35
    const-string v0, "\u043d\u0443\u0436\u043d\u044b projection/setup/IWH \u0438 \u043c\u0438\u043d\u0438\u043c\u0443\u043c 3 \u043a\u043e\u043d\u0442\u0440\u043e\u043b\u044c\u043d\u044b\u0435 \u0442\u043e\u0447\u043a\u0438"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 16
    :cond_36
    const-string v0, "\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d \u0442\u043e\u043b\u044c\u043a\u043e datum WGS 84"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :cond_37
    const-string v0, "\u0438\u043c\u044f \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u043e\u0433\u043e \u0438\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u044f \u043d\u0435 \u0441\u043e\u0432\u043f\u0430\u0434\u0430\u0435\u0442 \u0441 .map"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 15
    :cond_38
    const-string v0, "\u043d\u0435\u0432\u0435\u0440\u043d\u044b\u0439 \u0437\u0430\u0433\u043e\u043b\u043e\u0432\u043e\u043a"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :cond_39
    const-string v0, "\u043d\u0443\u043b\u0435\u0432\u043e\u0439 \u0431\u0430\u0439\u0442"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :catch_1
    move-exception v0

    const-string v0, "\u043d\u0443\u0436\u0435\u043d UTF-8/ASCII .map; \u043a\u043e\u0434\u0438\u0440\u043e\u0432\u043a\u0430 \u043d\u0435 \u0443\u0433\u0430\u0434\u044b\u0432\u0430\u0435\u0442\u0441\u044f"

    invoke-static {v0}, Lorg/rabochaya/projects/OziCalibration;->bad(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0
.end method
