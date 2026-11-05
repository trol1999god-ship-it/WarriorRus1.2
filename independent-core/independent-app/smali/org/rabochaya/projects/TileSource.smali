.class public final Lorg/rabochaya/projects/TileSource;
.super Ljava/lang/Object;
.source "TileSource.java"


# instance fields
.field public final attribution:Ljava/lang/String;

.field private final declaredDownloads:Z

.field public final downloads:Z

.field public final ellipsoid:Z

.field public final id:Ljava/lang/String;

.field public final layers:[Lorg/rabochaya/projects/TileSource;

.field private final levelTemplates:[Ljava/lang/String;

.field public final maxZoom:I

.field public final minZoom:I

.field public final name:Ljava/lang/String;

.field public final template:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZ)V
    .locals 4

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/TileSource;->ellipsoid:Z

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/rabochaya/projects/TileSource;->layers:[Lorg/rabochaya/projects/TileSource;

    iput-object v1, p0, Lorg/rabochaya/projects/TileSource;->levelTemplates:[Ljava/lang/String;

    iput-boolean p6, p0, Lorg/rabochaya/projects/TileSource;->declaredDownloads:Z

    const/16 v1, 0x64

    invoke-static {p1, v1}, Lorg/rabochaya/projects/TileSource;->clean(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/TileSource;->name:Ljava/lang/String;

    const/16 p1, 0x800

    invoke-static {p2, p1}, Lorg/rabochaya/projects/TileSource;->clean(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/TileSource;->template:Ljava/lang/String;

    const/16 p1, 0x1f4

    invoke-static {p3, p1}, Lorg/rabochaya/projects/TileSource;->clean(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/TileSource;->attribution:Ljava/lang/String;

    .line 8
    if-ltz p4, :cond_6

    const/16 p1, 0x17

    if-gt p5, p1, :cond_6

    if-gt p4, p5, :cond_6

    iput p4, p0, Lorg/rabochaya/projects/TileSource;->minZoom:I

    iput p5, p0, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    .line 9
    const-string p1, "{z}"

    invoke-virtual {p2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_5

    const-string p3, "{x}"

    invoke-virtual {p2, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p4

    if-eqz p4, :cond_5

    const-string p4, "{y}"

    invoke-virtual {p2, p4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p5

    if-eqz p5, :cond_5

    .line 10
    const-string p5, "0"

    invoke-virtual {p2, p1, p5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p3, p5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p4, p5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 11
    :try_start_0
    new-instance p3, Ljava/net/URI;

    invoke-direct {p3, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p4

    const-string p5, "https"

    invoke-virtual {p3}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_4

    if-eqz p4, :cond_4

    invoke-virtual {p3}, Ljava/net/URI;->getRawUserInfo()Ljava/lang/String;

    move-result-object p5

    if-nez p5, :cond_4

    invoke-virtual {p3}, Ljava/net/URI;->getRawFragment()Ljava/lang/String;

    move-result-object p5

    if-nez p5, :cond_4

    invoke-virtual {p3}, Ljava/net/URI;->getPort()I

    move-result p5

    const/4 v1, -0x1

    if-eq p5, v1, :cond_0

    invoke-virtual {p3}, Ljava/net/URI;->getPort()I

    move-result p3

    const/16 p5, 0x1bb

    if-ne p3, p5, :cond_4

    :cond_0
    const-string p3, "{"

    invoke-virtual {p1, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_4

    const-string p3, "}"

    invoke-virtual {p1, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_4

    .line 12
    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p4, p1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    const-string p3, "localhost"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_3

    const-string p3, ".localhost"

    invoke-virtual {p1, p3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p3

    if-nez p3, :cond_3

    const-string p3, ".local"

    invoke-virtual {p1, p3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p3

    if-nez p3, :cond_3

    const/16 p3, 0x3a

    invoke-virtual {p1, p3}, Ljava/lang/String;->indexOf(I)I

    move-result p3

    if-gez p3, :cond_3

    const-string p3, "[0-9.]+"

    invoke-virtual {p1, p3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p3

    if-nez p3, :cond_3

    .line 13
    const/4 p3, 0x1

    if-eqz p6, :cond_1

    const-string p4, "openstreetmap.org"

    invoke-virtual {p1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-nez p4, :cond_1

    const-string p4, ".openstreetmap.org"

    invoke-virtual {p1, p4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    move p1, p3

    goto :goto_0

    :cond_1
    move p1, v0

    :goto_0
    iput-boolean p1, p0, Lorg/rabochaya/projects/TileSource;->downloads:Z

    .line 14
    const-string p1, "SHA-256"

    invoke-static {p1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p1

    const-string p4, "UTF-8"

    invoke-virtual {p2, p4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    array-length p4, p1

    move p5, v0

    :goto_1
    if-ge p5, p4, :cond_2

    aget-byte p6, p1, p5

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "%02x"

    new-array v3, p3, [Ljava/lang/Object;

    and-int/lit16 p6, p6, 0xff

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p6

    aput-object p6, v3, v0

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p6

    invoke-virtual {p2, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 p5, p5, 0x1

    goto :goto_1

    :cond_2
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/TileSource;->id:Ljava/lang/String;

    .line 15
    nop

    .line 16
    return-void

    .line 12
    :cond_3
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1}, Ljava/lang/Exception;-><init>()V

    throw p1

    .line 11
    :cond_4
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1}, Ljava/lang/Exception;-><init>()V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    :catch_0
    move-exception p1

    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041d\u0443\u0436\u0435\u043d HTTPS XYZ-\u0430\u0434\u0440\u0435\u0441 \u0431\u0435\u0437 \u043b\u043e\u0433\u0438\u043d\u0430, \u0444\u0440\u0430\u0433\u043c\u0435\u043d\u0442\u0430 \u0438 \u043d\u0435\u0441\u0442\u0430\u043d\u0434\u0430\u0440\u0442\u043d\u043e\u0433\u043e \u043f\u043e\u0440\u0442\u0430"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 9
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u0412 \u0430\u0434\u0440\u0435\u0441\u0435 \u043d\u0443\u0436\u043d\u044b {z}, {x} \u0438 {y}"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 8
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041c\u0430\u0441\u0448\u0442\u0430\u0431\u044b: 0\u201323, \u043c\u0438\u043d\u0438\u043c\u0443\u043c \u043d\u0435 \u0431\u043e\u043b\u044c\u0448\u0435 \u043c\u0430\u043a\u0441\u0438\u043c\u0443\u043c\u0430"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ[Lorg/rabochaya/projects/TileSource;)V
    .locals 18

    .line 26
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v0, p3

    move/from16 v3, p4

    move/from16 v4, p5

    move-object/from16 v5, p6

    const-string v6, "0"

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    iput-object v2, v1, Lorg/rabochaya/projects/TileSource;->name:Ljava/lang/String;

    move-object/from16 v7, p2

    iput-object v7, v1, Lorg/rabochaya/projects/TileSource;->attribution:Ljava/lang/String;

    iput-boolean v3, v1, Lorg/rabochaya/projects/TileSource;->ellipsoid:Z

    iput-boolean v4, v1, Lorg/rabochaya/projects/TileSource;->declaredDownloads:Z

    iput-object v5, v1, Lorg/rabochaya/projects/TileSource;->layers:[Lorg/rabochaya/projects/TileSource;

    iput-object v0, v1, Lorg/rabochaya/projects/TileSource;->levelTemplates:[Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v5, :cond_0

    const/4 v10, 0x1

    goto :goto_0

    :cond_0
    const/4 v10, 0x0

    .line 27
    :goto_0
    const/16 v11, 0xa

    const-string v12, ""

    const/16 v13, 0x17

    if-eqz v5, :cond_2

    array-length v0, v5

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_1
    if-ge v2, v0, :cond_1

    aget-object v4, v5, v2

    iget-object v6, v4, Lorg/rabochaya/projects/TileSource;->id:Ljava/lang/String;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v6, v4, Lorg/rabochaya/projects/TileSource;->minZoom:I

    invoke-static {v13, v6}, Ljava/lang/Math;->min(II)I

    move-result v13

    iget v6, v4, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget-boolean v4, v4, Lorg/rabochaya/projects/TileSource;->downloads:Z

    and-int/2addr v10, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    iput-object v12, v1, Lorg/rabochaya/projects/TileSource;->template:Ljava/lang/String;

    const/16 v16, 0x0

    goto/16 :goto_4

    .line 28
    :cond_2
    move v14, v13

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object v13, v12

    const/4 v12, 0x0

    :goto_2
    array-length v9, v0

    if-ge v15, v9, :cond_7

    aget-object v9, v0, v15

    if-eqz v9, :cond_6

    aget-object v9, v0, v15

    :try_start_0
    new-instance v8, Ljava/net/URI;

    const-string v11, "{z}"

    const-string v0, "1"

    invoke-virtual {v9, v11, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v11, "{x}"

    invoke-virtual {v0, v11, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v11, "{y}"

    invoke-virtual {v0, v11, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v11, "{q}"

    invoke-virtual {v0, v11, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v11, "{s}"

    move-object/from16 v17, v6

    const-string v6, "Gal"

    invoke-virtual {v0, v11, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v6, "{bbox}"

    const-string v11, "0,0,1,1"

    invoke-virtual {v0, v6, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v8, v0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    const-string v0, "https"

    invoke-virtual {v8}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {v8}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {v8}, Ljava/net/URI;->getRawUserInfo()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_5

    invoke-virtual {v8}, Ljava/net/URI;->getRawFragment()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_5

    invoke-virtual {v8}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    const-string v6, "tile.openstreetmap.org"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v0, :cond_3

    or-int v0, v16, v4

    move/from16 v16, v0

    :cond_3
    invoke-static {v14, v15}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v12, v15}, Ljava/lang/Math;->max(II)I

    move-result v12

    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_4

    move-object v13, v9

    :cond_4
    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v8, 0x3a

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v8, 0xa

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v14, v0

    goto :goto_3

    :cond_5
    :try_start_1
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    throw v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception v0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u041d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u044b\u0439 \u0432\u0441\u0442\u0440\u043e\u0435\u043d\u043d\u044b\u0439 \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    :cond_6
    move-object/from16 v17, v6

    move v8, v11

    :goto_3
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v0, p3

    move v11, v8

    move-object/from16 v6, v17

    goto/16 :goto_2

    :cond_7
    iput-object v13, v1, Lorg/rabochaya/projects/TileSource;->template:Ljava/lang/String;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move v3, v12

    move v13, v14

    .line 29
    :goto_4
    iput v13, v1, Lorg/rabochaya/projects/TileSource;->minZoom:I

    iput v3, v1, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    if-nez v5, :cond_8

    move/from16 v10, v16

    :cond_8
    iput-boolean v10, v1, Lorg/rabochaya/projects/TileSource;->downloads:Z

    :try_start_2
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    array-length v3, v0

    const/4 v4, 0x0

    :goto_5
    if-ge v4, v3, :cond_9

    aget-byte v5, v0, v4

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "%02x"

    const/4 v8, 0x1

    new-array v9, v8, [Ljava/lang/Object;

    and-int/lit16 v5, v5, 0xff

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v10, 0x0

    aput-object v5, v9, v10

    invoke-static {v6, v7, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    :cond_9
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lorg/rabochaya/projects/TileSource;->id:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 30
    return-void

    .line 29
    :catch_1
    move-exception v0

    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method static builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;
    .locals 8

    .line 24
    new-instance v7, Lorg/rabochaya/projects/TileSource;

    const/4 v6, 0x0

    move-object v0, v7

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v6}, Lorg/rabochaya/projects/TileSource;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ[Lorg/rabochaya/projects/TileSource;)V

    return-object v7
.end method

.method private static clean(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2

    .line 17
    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, p1, :cond_3

    const/4 p1, 0x0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p1, v0, :cond_2

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x20

    if-ne v0, v1, :cond_0

    goto :goto_1

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0441\u0438\u043c\u0432\u043e\u043b \u0432 \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0430\u0445"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    :goto_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u0417\u0430\u043f\u043e\u043b\u043d\u0438\u0442\u0435 \u043d\u0430\u0437\u0432\u0430\u043d\u0438\u0435, \u0430\u0434\u0440\u0435\u0441 \u0438 \u043f\u043e\u0434\u043f\u0438\u0441\u044c \u043a\u0430\u0440\u0442\u044b"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static composite(Ljava/lang/String;[Lorg/rabochaya/projects/TileSource;)Lorg/rabochaya/projects/TileSource;
    .locals 10

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_0

    const-string v4, " \u00b7 "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    iget-object v3, v3, Lorg/rabochaya/projects/TileSource;->attribution:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    new-instance v1, Lorg/rabochaya/projects/TileSource;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v6, 0x0

    move-object v3, v1

    move-object v4, p0

    move-object v9, p1

    invoke-direct/range {v3 .. v9}, Lorg/rabochaya/projects/TileSource;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ[Lorg/rabochaya/projects/TileSource;)V

    return-object v1
.end method

.method public static osm()Lorg/rabochaya/projects/TileSource;
    .locals 8

    .line 31
    new-instance v7, Lorg/rabochaya/projects/TileSource;

    const/16 v5, 0x13

    const/4 v6, 0x0

    const-string v1, "OpenStreetMap"

    const-string v2, "https://tile.openstreetmap.org/{z}/{x}/{y}.png"

    const-string v3, "\u00a9 OpenStreetMap contributors \u00b7 openstreetmap.org/copyright"

    const/4 v4, 0x0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lorg/rabochaya/projects/TileSource;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZ)V

    return-object v7
.end method


# virtual methods
.method public canDownload(I)Z
    .locals 2

    .line 20
    iget-boolean v0, p0, Lorg/rabochaya/projects/TileSource;->declaredDownloads:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/TileSource;->hasZoom(I)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    new-instance v0, Ljava/net/URI;

    invoke-virtual {p0, p1, v1, v1}, Lorg/rabochaya/projects/TileSource;->url(III)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p1

    const-string v0, "openstreetmap.org"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, ".openstreetmap.org"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1

    :catch_0
    move-exception p1

    :cond_2
    :goto_0
    return v1
.end method

.method public hasZoom(I)Z
    .locals 1

    .line 19
    iget v0, p0, Lorg/rabochaya/projects/TileSource;->minZoom:I

    if-lt p1, v0, :cond_1

    iget v0, p0, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    if-gt p1, v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/TileSource;->levelTemplates:[Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/TileSource;->levelTemplates:[Ljava/lang/String;

    aget-object p1, v0, p1

    if-eqz p1, :cond_1

    :cond_0
    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public leafs()[Lorg/rabochaya/projects/TileSource;
    .locals 2

    .line 22
    iget-object v0, p0, Lorg/rabochaya/projects/TileSource;->layers:[Lorg/rabochaya/projects/TileSource;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Lorg/rabochaya/projects/TileSource;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/TileSource;->layers:[Lorg/rabochaya/projects/TileSource;

    invoke-virtual {v0}, [Lorg/rabochaya/projects/TileSource;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/rabochaya/projects/TileSource;

    :goto_0
    return-object v0
.end method

.method public url(III)Ljava/lang/String;
    .locals 4

    .line 18
    const/4 v0, 0x1

    shl-int/2addr v0, p1

    iget v1, p0, Lorg/rabochaya/projects/TileSource;->minZoom:I

    if-lt p1, v1, :cond_2

    iget v1, p0, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    if-gt p1, v1, :cond_2

    if-ltz p2, :cond_2

    if-ltz p3, :cond_2

    if-ge p2, v0, :cond_2

    if-ge p3, v0, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/TileSource;->levelTemplates:[Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/TileSource;->template:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/TileSource;->levelTemplates:[Ljava/lang/String;

    aget-object v0, v0, p1

    :goto_0
    if-eqz v0, :cond_1

    const-string v1, "{z}"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "{x}"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "{y}"

    invoke-static {p3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "{q}"

    invoke-static {p1, p2, p3}, Lorg/rabochaya/projects/TileProjection;->quadkey(III)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    mul-int/lit8 v1, p2, 0x3

    add-int/2addr v1, p3

    rem-int/lit8 v1, v1, 0x8

    const-string v2, "Galileo"

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    const-string v2, "{s}"

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "{bbox}"

    invoke-static {p1, p2, p3}, Lorg/rabochaya/projects/TileProjection;->bbox(III)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041c\u0430\u0441\u0448\u0442\u0430\u0431 \u043e\u0442\u0441\u0443\u0442\u0441\u0442\u0432\u0443\u0435\u0442 \u0432 \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a\u0435"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u0422\u0430\u0439\u043b \u0432\u043d\u0435 \u0434\u0438\u0430\u043f\u0430\u0437\u043e\u043d\u0430"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public zoomFor(I)I
    .locals 2

    .line 21
    iget v0, p0, Lorg/rabochaya/projects/TileSource;->minZoom:I

    iget v1, p0, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    move v0, p1

    :goto_0
    iget v1, p0, Lorg/rabochaya/projects/TileSource;->minZoom:I

    if-lt v0, v1, :cond_1

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/TileSource;->hasZoom(I)Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    add-int/lit8 p1, p1, 0x1

    iget v0, p0, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    if-gt p1, v0, :cond_2

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/TileSource;->hasZoom(I)Z

    move-result v0

    if-eqz v0, :cond_1

    return p1

    :cond_2
    iget p1, p0, Lorg/rabochaya/projects/TileSource;->minZoom:I

    return p1
.end method
