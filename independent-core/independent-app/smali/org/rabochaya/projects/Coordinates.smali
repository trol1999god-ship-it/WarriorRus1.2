.class public final Lorg/rabochaya/projects/Coordinates;
.super Ljava/lang/Object;
.source "Coordinates.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/Coordinates$Grid;,
        Lorg/rabochaya/projects/Coordinates$Position;
    }
.end annotation


# static fields
.field private static final A:D = 6378137.0

.field private static final ALPHA:[D

.field private static final BANDS:Ljava/lang/String; = "CDEFGHJKLMNPQRSTUVWX"

.field private static final BETA:[D

.field private static final COLS:[Ljava/lang/String;

.field public static final DD:I = 0x0

.field public static final DM:I = 0x1

.field public static final DMS:I = 0x2

.field private static final E:D

.field private static final F:D = 0.0033528106647474805

.field private static final K:D = 0.9996

.field public static final MGRS:I = 0x4

.field private static final N:D = 0.0016792203863837047

.field private static final N2:D = 2.8197811060466384E-6

.field private static final N3:D = 4.7350339184131065E-9

.field private static final N4:D = 7.951165486017604E-12

.field private static final N5:D = 1.3351759179631258E-14

.field private static final N6:D = 2.2420546208522578E-17

.field private static final NAMES:[Ljava/lang/String;

.field private static final ROWS:Ljava/lang/String; = "ABCDEFGHJKLMNPQRSTUV"

.field private static final SCALE:D = 6364902.166165087

.field public static final UTM:I = 0x3


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 8
    const-string v0, "UTM \u00b7 WGS 84"

    const-string v1, "MGRS \u00b7 WGS 84"

    const-string v2, "WGS 84 \u00b7 \u0433\u0440\u0430\u0434\u0443\u0441\u044b"

    const-string v3, "WGS 84 \u00b7 \u0433\u0440\u0430\u0434\u0443\u0441\u044b \u0438 \u043c\u0438\u043d\u0443\u0442\u044b"

    const-string v4, "WGS 84 \u00b7 \u0433\u0440\u0430\u0434\u0443\u0441\u044b, \u043c\u0438\u043d\u0443\u0442\u044b, \u0441\u0435\u043a\u0443\u043d\u0434\u044b"

    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/Coordinates;->NAMES:[Ljava/lang/String;

    .line 10
    const-string v0, "JKLMNPQR"

    const-string v1, "STUVWXYZ"

    const-string v2, "ABCDEFGH"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/Coordinates;->COLS:[Ljava/lang/String;

    .line 11
    const-wide v0, 0x3f7b6b90f1fe94f0L    # 0.0066943799901413165

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    sput-wide v0, Lorg/rabochaya/projects/Coordinates;->E:D

    .line 14
    const/4 v0, 0x7

    new-array v1, v0, [D

    fill-array-data v1, :array_0

    sput-object v1, Lorg/rabochaya/projects/Coordinates;->ALPHA:[D

    .line 15
    new-array v0, v0, [D

    fill-array-data v0, :array_1

    sput-object v0, Lorg/rabochaya/projects/Coordinates;->BETA:[D

    return-void

    nop

    :array_0
    .array-data 8
        0x0
        0x3f4b736762de0628L    # 8.377318206244698E-4
        0x3ea987acf392dfe6L    # 7.608527773572307E-7
        0x3e14934cf5ebca37L    # 1.1976455033294527E-9
        0x3d855e018404f55aL
        0x3cf9b93550427710L    # 5.711757677865804E-15
        0x3c713100b4108688L    # 1.4911177312583895E-17
    .end array-data

    :array_1
    .array-data 8
        0x0
        0x3f4b73681fabfd42L    # 8.377321640579488E-4
        0x3e6fb4f75456352cL    # 5.905870152220203E-8
        0x3de7000b2e7a81a1L    # 1.673482665283997E-10
        0x3d4e7781c55425c0L    # 2.1647980400627056E-13
        0x3cbb4b960e6a272cL
        0x3c2abe3ff05366e7L    # 7.2487488906941545E-19
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(DD)V
    .locals 0

    .line 6
    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/Coordinates;->geographic(DD)V

    return-void
.end method

.method static synthetic access$100(D)Z
    .locals 0

    .line 6
    invoke-static {p0, p1}, Lorg/rabochaya/projects/Coordinates;->finite(D)Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;
    .locals 0

    .line 6
    invoke-static {p0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    return-object p0
.end method

.method private static angle(DZI)Ljava/lang/String;
    .locals 9

    .line 37
    invoke-static {p0, p1}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-gez v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-eqz p2, :cond_2

    if-eqz v0, :cond_1

    const/16 p2, 0x53

    goto :goto_1

    :cond_1
    const/16 p2, 0x4e

    goto :goto_1

    :cond_2
    if-eqz v0, :cond_3

    const/16 p2, 0x57

    goto :goto_1

    :cond_3
    const/16 p2, 0x45

    :goto_1
    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide p0

    const v0, 0x927c0

    const v3, 0x57e40

    if-ne p3, v2, :cond_4

    move v4, v0

    goto :goto_2

    :cond_4
    move v4, v3

    :goto_2
    int-to-double v4, v4

    mul-double/2addr p0, v4

    invoke-static {p0, p1}, Ljava/lang/Math;->round(D)J

    move-result-wide p0

    if-ne p3, v2, :cond_5

    move v4, v0

    goto :goto_3

    :cond_5
    move v4, v3

    :goto_3
    int-to-long v4, v4

    div-long v4, p0, v4

    long-to-int v4, v4

    if-ne p3, v2, :cond_6

    goto :goto_4

    :cond_6
    move v0, v3

    :goto_4
    int-to-long v5, v0

    rem-long/2addr p0, v5

    const/4 v0, 0x3

    const/4 v3, 0x2

    if-ne p3, v2, :cond_7

    sget-object p3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    long-to-double p0, p0

    const-wide v5, 0x40c3880000000000L    # 10000.0

    div-double/2addr p0, v5

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-static {p2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p1

    new-array p2, v0, [Ljava/lang/Object;

    aput-object v4, p2, v1

    aput-object p0, p2, v2

    aput-object p1, p2, v3

    const-string p0, "%d\u00b0%07.4f\u2032 %c"

    invoke-static {p3, p0, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_7
    sget-object p3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-wide/16 v5, 0x1770

    div-long v7, p0, v5

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    rem-long/2addr p0, v5

    long-to-double p0, p0

    const-wide/high16 v5, 0x4059000000000000L    # 100.0

    div-double/2addr p0, v5

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-static {p2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p1

    const/4 p2, 0x4

    new-array p2, p2, [Ljava/lang/Object;

    aput-object v4, p2, v1

    aput-object v7, p2, v2

    aput-object p0, p2, v3

    aput-object p1, p2, v0

    const-string p0, "%d\u00b0%02d\u2032%05.2f\u2033 %c"

    invoke-static {p3, p0, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static asinh(D)D
    .locals 4

    .line 27
    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    invoke-static {v2, v3, p0, p1}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v2

    add-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->copySign(DD)D

    move-result-wide p0

    return-wide p0
.end method

.method private static atanh(D)D
    .locals 4

    .line 28
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    add-double v2, p0, v0

    sub-double/2addr v0, p0

    div-double/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide p0

    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    mul-double/2addr p0, v0

    return-wide p0
.end method

.method private static bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;
    .locals 1

    .line 22
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private static checkFormat(I)V
    .locals 1

    .line 23
    if-ltz p0, :cond_0

    const/4 v0, 0x4

    if-gt p0, v0, :cond_0

    return-void

    :cond_0
    const-string p0, "\u041d\u0435\u0438\u0437\u0432\u0435\u0441\u0442\u043d\u044b\u0439 \u0444\u043e\u0440\u043c\u0430\u0442 \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442"

    invoke-static {p0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method private static clean(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 38
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x200

    if-gt v0, v1, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x2212

    const/16 v1, 0x2d

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const-string p0, "\u0412\u0432\u0435\u0434\u0438\u0442\u0435 \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b (\u0434\u043e 512 \u0441\u0438\u043c\u0432\u043e\u043b\u043e\u0432)"

    invoke-static {p0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method private static delta(D)D
    .locals 4

    .line 29
    const-wide v0, 0x4076800000000000L    # 360.0

    rem-double/2addr p0, v0

    const-wide v2, 0x4066800000000000L    # 180.0

    cmpl-double v2, p0, v2

    if-lez v2, :cond_0

    sub-double/2addr p0, v0

    goto :goto_0

    :cond_0
    const-wide v2, -0x3f99800000000000L    # -180.0

    cmpg-double v2, p0, v2

    if-gez v2, :cond_1

    add-double/2addr p0, v0

    :cond_1
    :goto_0
    return-wide p0
.end method

.method private static finite(D)Z
    .locals 1

    .line 21
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

.method public static format(DDI)Ljava/lang/String;
    .locals 4

    .line 36
    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/Coordinates;->geographic(DD)V

    invoke-static {p4}, Lorg/rabochaya/projects/Coordinates;->checkFormat(I)V

    const/4 v0, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-nez p4, :cond_0

    sget-object p4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    new-array p2, v1, [Ljava/lang/Object;

    aput-object p0, p2, v0

    aput-object p1, p2, v2

    const-string p0, "%.6f, %.6f"

    invoke-static {p4, p0, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    if-eq p4, v2, :cond_4

    if-ne p4, v1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v3, 0x4

    if-ne p4, v3, :cond_2

    const/4 p4, 0x5

    invoke-static {p0, p1, p2, p3, p4}, Lorg/rabochaya/projects/Coordinates;->mgrs(DDI)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/Coordinates;->toUtm(DD)Lorg/rabochaya/projects/Coordinates$Grid;

    move-result-object p0

    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-array p2, v3, [Ljava/lang/Object;

    iget p3, p0, Lorg/rabochaya/projects/Coordinates$Grid;->zone:I

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, p2, v0

    iget-boolean p3, p0, Lorg/rabochaya/projects/Coordinates$Grid;->north:Z

    if-eqz p3, :cond_3

    const-string p3, "N"

    goto :goto_0

    :cond_3
    const-string p3, "S"

    :goto_0
    aput-object p3, p2, v2

    iget-wide p3, p0, Lorg/rabochaya/projects/Coordinates$Grid;->easting:D

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p3

    aput-object p3, p2, v1

    iget-wide p3, p0, Lorg/rabochaya/projects/Coordinates$Grid;->northing:D

    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    const/4 p3, 0x3

    aput-object p0, p2, p3

    const-string p0, "%02d %s %.3f %.3f"

    invoke-static {p1, p0, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_4
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0, p1, v2, p4}, Lorg/rabochaya/projects/Coordinates;->angle(DZI)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "; "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {p2, p3, v0, p4}, Lorg/rabochaya/projects/Coordinates;->angle(DZI)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static forward(DD)[D
    .locals 19

    .line 31
    invoke-static/range {p0 .. p1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v0

    invoke-static/range {p2 .. p3}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v2

    invoke-static {v0, v1}, Ljava/lang/Math;->tan(D)D

    move-result-wide v0

    sget-wide v4, Lorg/rabochaya/projects/Coordinates;->E:D

    sget-wide v6, Lorg/rabochaya/projects/Coordinates;->E:D

    mul-double/2addr v6, v0

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    invoke-static {v8, v9, v0, v1}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v10

    div-double/2addr v6, v10

    invoke-static {v6, v7}, Lorg/rabochaya/projects/Coordinates;->atanh(D)D

    move-result-wide v6

    mul-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->sinh(D)D

    move-result-wide v4

    invoke-static {v8, v9, v4, v5}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v6

    mul-double/2addr v6, v0

    invoke-static {v8, v9, v0, v1}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v0

    mul-double/2addr v4, v0

    sub-double/2addr v6, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v0

    invoke-static {v6, v7, v0, v1}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v2

    div-double/2addr v4, v2

    invoke-static {v4, v5}, Lorg/rabochaya/projects/Coordinates;->asinh(D)D

    move-result-wide v2

    const/4 v4, 0x1

    move-wide v8, v0

    move-wide v6, v2

    move v5, v4

    :goto_0
    const/4 v10, 0x6

    if-gt v5, v10, :cond_0

    sget-object v10, Lorg/rabochaya/projects/Coordinates;->ALPHA:[D

    aget-wide v11, v10, v5

    mul-int/lit8 v10, v5, 0x2

    int-to-double v13, v10

    mul-double v15, v13, v0

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->sin(D)D

    move-result-wide v17

    mul-double v11, v11, v17

    mul-double/2addr v13, v2

    invoke-static {v13, v14}, Ljava/lang/Math;->cosh(D)D

    move-result-wide v17

    mul-double v11, v11, v17

    add-double/2addr v8, v11

    sget-object v10, Lorg/rabochaya/projects/Coordinates;->ALPHA:[D

    aget-wide v11, v10, v5

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->cos(D)D

    move-result-wide v15

    mul-double/2addr v11, v15

    invoke-static {v13, v14}, Ljava/lang/Math;->sinh(D)D

    move-result-wide v13

    mul-double/2addr v11, v13

    add-double/2addr v6, v11

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_0
    const-wide v0, 0x415847b98aa272e4L    # 6364902.166165087

    mul-double/2addr v6, v0

    mul-double/2addr v8, v0

    const/4 v0, 0x2

    new-array v0, v0, [D

    const/4 v1, 0x0

    aput-wide v6, v0, v1

    aput-wide v8, v0, v4

    return-object v0
.end method

.method public static fromMgrs(Ljava/lang/String;)Lorg/rabochaya/projects/Coordinates$Position;
    .locals 39

    .line 35
    invoke-static/range {p0 .. p0}, Lorg/rabochaya/projects/Coordinates;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\s+"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "^(\\d{1,2})([C-HJ-NP-X])([A-HJ-NP-Z])([A-HJ-NP-V])(\\d{2,10})$"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_15

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x2

    rem-int/2addr v2, v3

    if-nez v2, :cond_15

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    if-lt v4, v2, :cond_14

    const/16 v5, 0x3c

    if-gt v4, v5, :cond_14

    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    const/4 v11, 0x0

    invoke-virtual {v5, v11}, Ljava/lang/String;->charAt(I)C

    move-result v12

    const/16 v13, 0x20

    const/16 v14, 0x58

    if-ne v12, v14, :cond_1

    if-eq v4, v13, :cond_0

    const/16 v5, 0x22

    if-eq v4, v5, :cond_0

    const/16 v5, 0x24

    if-eq v4, v5, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "\u0417\u043e\u043d\u0430 MGRS \u043d\u0435 \u0441\u0443\u0449\u0435\u0441\u0442\u0432\u0443\u0435\u0442 \u0432 \u043f\u043e\u044f\u0441\u0435 X"

    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    :cond_1
    :goto_0
    const-string v5, "CDEFGHJKLMNPQRSTUVWX"

    invoke-virtual {v5, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    sget-object v6, Lorg/rabochaya/projects/Coordinates;->COLS:[Ljava/lang/String;

    add-int/lit8 v7, v4, -0x1

    const/4 v15, 0x3

    rem-int/2addr v7, v15

    aget-object v6, v6, v7

    invoke-virtual {v0, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    const/4 v7, 0x4

    invoke-virtual {v0, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    const-string v8, "ABCDEFGHJKLMNPQRSTUV"

    invoke-virtual {v8, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    if-ltz v6, :cond_13

    if-ltz v7, :cond_13

    rem-int/lit8 v8, v4, 0x2

    if-nez v8, :cond_2

    move v8, v1

    goto :goto_1

    :cond_2
    move v8, v11

    :goto_1
    sub-int/2addr v7, v8

    add-int/lit8 v7, v7, 0x14

    rem-int/lit8 v7, v7, 0x14

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    div-int/2addr v8, v3

    rsub-int/lit8 v9, v8, 0x5

    int-to-double v9, v9

    const-wide/high16 v13, 0x4024000000000000L    # 10.0

    invoke-static {v13, v14, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v13

    add-int/2addr v6, v2

    const v9, 0x186a0

    mul-int/2addr v6, v9

    move/from16 v17, v4

    int-to-double v3, v6

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v11, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    move/from16 v19, v12

    int-to-double v11, v6

    mul-double/2addr v11, v13

    add-double/2addr v3, v11

    mul-int/2addr v7, v9

    int-to-double v6, v7

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    int-to-double v0, v0

    mul-double/2addr v0, v13

    add-double/2addr v6, v0

    mul-int/lit8 v0, v5, 0x8

    add-int/lit8 v0, v0, -0x50

    int-to-double v0, v0

    const/16 v8, 0x13

    if-ne v5, v8, :cond_3

    const-wide/high16 v8, 0x4055000000000000L    # 84.0

    goto :goto_2

    :cond_3
    const-wide/high16 v8, 0x4020000000000000L    # 8.0

    add-double/2addr v8, v0

    :goto_2
    move-wide v11, v8

    const/16 v5, 0x4e

    move/from16 v9, v19

    if-lt v9, v5, :cond_4

    move/from16 v19, v2

    goto :goto_3

    :cond_4
    const/16 v19, 0x0

    :goto_3
    move-wide/from16 v20, v6

    const-wide/16 v5, 0x0

    invoke-static {v0, v1, v5, v6}, Lorg/rabochaya/projects/Coordinates;->forward(DD)[D

    move-result-object v5

    aget-wide v6, v5, v2

    if-eqz v19, :cond_5

    const/4 v5, 0x0

    goto :goto_4

    :cond_5
    const v5, 0x989680

    :goto_4
    move-wide/from16 v23, v3

    int-to-double v2, v5

    add-double/2addr v6, v2

    const-wide v2, 0x40f86a0000000000L    # 100000.0

    div-double/2addr v6, v2

    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    mul-double/2addr v4, v2

    :goto_5
    cmpg-double v2, v20, v4

    if-gez v2, :cond_6

    const-wide v2, 0x413e848000000000L    # 2000000.0

    add-double v20, v20, v2

    goto :goto_5

    :cond_6
    add-double v2, v20, v13

    const-wide v4, 0x416312d000000005L    # 1.000000000000001E7

    cmpl-double v4, v2, v4

    if-gtz v4, :cond_12

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    div-double v4, v13, v4

    add-double v7, v23, v4

    add-double v25, v20, v4

    move/from16 v5, v17

    move/from16 v6, v19

    move v4, v9

    move-wide/from16 v9, v25

    invoke-static/range {v5 .. v10}, Lorg/rabochaya/projects/Coordinates;->inverse(IZDD)Lorg/rabochaya/projects/Coordinates$Position;

    move-result-object v25

    add-double v5, v23, v13

    const-wide v7, 0x411e848000000000L    # 500000.0

    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(DD)D

    move-result-wide v7

    move-wide/from16 v9, v23

    invoke-static {v9, v10, v7, v8}, Ljava/lang/Math;->max(DD)D

    move-result-wide v7

    new-array v13, v15, [D

    const/4 v14, 0x0

    aput-wide v9, v13, v14

    const/4 v9, 0x1

    aput-wide v5, v13, v9

    const/4 v14, 0x2

    aput-wide v7, v13, v14

    const-wide v5, 0x4056800000000000L    # 90.0

    const-wide v7, -0x3fa9800000000000L    # -90.0

    const-wide v9, 0x408f400000000000L    # 1000.0

    const-wide v23, -0x3f70c00000000000L    # -1000.0

    const/4 v14, 0x0

    :goto_6
    if-ge v14, v15, :cond_8

    aget-wide v26, v13, v14

    move-object/from16 v16, v13

    const/4 v15, 0x2

    new-array v13, v15, [D

    const/16 v18, 0x0

    aput-wide v20, v13, v18

    const/16 v22, 0x1

    aput-wide v2, v13, v22

    move-wide/from16 v28, v2

    move/from16 v30, v4

    move/from16 v2, v18

    move-wide/from16 v3, v23

    move-wide/from16 v37, v5

    move-wide v5, v9

    move-wide/from16 v9, v37

    :goto_7
    if-ge v2, v15, :cond_7

    aget-wide v23, v13, v2

    move-wide/from16 v31, v11

    move-wide v11, v5

    move/from16 v5, v17

    move/from16 v6, v19

    move-wide/from16 v33, v0

    move-wide v0, v7

    move-wide/from16 v7, v26

    move-object/from16 v36, v13

    move/from16 v35, v14

    move-wide v13, v9

    move-wide/from16 v9, v23

    invoke-static/range {v5 .. v10}, Lorg/rabochaya/projects/Coordinates;->inverse(IZDD)Lorg/rabochaya/projects/Coordinates$Position;

    move-result-object v5

    iget-wide v6, v5, Lorg/rabochaya/projects/Coordinates$Position;->lat:D

    invoke-static {v13, v14, v6, v7}, Ljava/lang/Math;->min(DD)D

    move-result-wide v9

    iget-wide v6, v5, Lorg/rabochaya/projects/Coordinates$Position;->lat:D

    invoke-static {v0, v1, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v7

    mul-int/lit8 v0, v17, 0x6

    add-int/lit16 v0, v0, -0xb7

    int-to-double v0, v0

    iget-wide v5, v5, Lorg/rabochaya/projects/Coordinates$Position;->lon:D

    sub-double/2addr v5, v0

    invoke-static {v5, v6}, Lorg/rabochaya/projects/Coordinates;->delta(D)D

    move-result-wide v5

    add-double/2addr v0, v5

    invoke-static {v11, v12, v0, v1}, Ljava/lang/Math;->min(DD)D

    move-result-wide v5

    invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->max(DD)D

    move-result-wide v3

    add-int/lit8 v2, v2, 0x1

    move-wide/from16 v11, v31

    move-wide/from16 v0, v33

    move/from16 v14, v35

    move-object/from16 v13, v36

    goto :goto_7

    :cond_7
    move-wide/from16 v33, v0

    move-wide v0, v7

    move-wide/from16 v31, v11

    move/from16 v35, v14

    move-wide v11, v5

    move-wide v13, v9

    add-int/lit8 v2, v35, 0x1

    move-wide/from16 v23, v3

    move-wide v9, v11

    move-wide v5, v13

    move-object/from16 v13, v16

    move/from16 v4, v30

    move-wide/from16 v11, v31

    move-wide/from16 v0, v33

    const/4 v15, 0x3

    move v14, v2

    move-wide/from16 v2, v28

    goto/16 :goto_6

    :cond_8
    move-wide/from16 v33, v0

    move/from16 v30, v4

    move-wide/from16 v31, v11

    const-wide v0, 0x3e45798ee2308c3aL    # 1.0E-8

    sub-double v2, v33, v0

    cmpg-double v2, v7, v2

    if-ltz v2, :cond_11

    add-double v11, v31, v0

    cmpl-double v2, v5, v11

    if-gtz v2, :cond_11

    mul-int/lit8 v4, v17, 0x6

    add-int/lit16 v4, v4, -0xba

    int-to-double v2, v4

    const-wide/high16 v4, 0x4018000000000000L    # 6.0

    add-double/2addr v4, v2

    const/16 v6, 0x56

    const/16 v7, 0x1f

    move/from16 v8, v30

    if-ne v8, v6, :cond_a

    const-wide/high16 v11, 0x4008000000000000L    # 3.0

    move/from16 v6, v17

    if-ne v6, v7, :cond_9

    move-wide v4, v11

    goto :goto_8

    :cond_9
    const/16 v13, 0x20

    if-ne v6, v13, :cond_b

    move-wide v2, v11

    goto :goto_8

    :cond_a
    move/from16 v6, v17

    :cond_b
    :goto_8
    const/16 v11, 0x58

    if-ne v8, v11, :cond_f

    const-wide/high16 v11, 0x4022000000000000L    # 9.0

    if-ne v6, v7, :cond_c

    move-wide v4, v11

    goto :goto_9

    :cond_c
    const/16 v7, 0x21

    const-wide/high16 v13, 0x4035000000000000L    # 21.0

    if-ne v6, v7, :cond_d

    move-wide v2, v11

    move-wide v4, v13

    goto :goto_9

    :cond_d
    const/16 v7, 0x23

    const-wide v11, 0x4040800000000000L    # 33.0

    if-ne v6, v7, :cond_e

    move-wide v4, v11

    move-wide v2, v13

    goto :goto_9

    :cond_e
    const/16 v7, 0x25

    if-ne v6, v7, :cond_f

    const-wide/high16 v4, 0x4045000000000000L    # 42.0

    move-wide v2, v11

    :cond_f
    :goto_9
    sub-double/2addr v2, v0

    cmpg-double v2, v23, v2

    if-ltz v2, :cond_10

    add-double/2addr v4, v0

    cmpl-double v0, v9, v4

    if-gtz v0, :cond_10

    return-object v25

    :cond_10
    const-string v0, "\u041a\u0432\u0430\u0434\u0440\u0430\u0442 \u0432\u043d\u0435 \u0434\u043e\u043b\u0433\u043e\u0442\u043d\u043e\u0439 \u0437\u043e\u043d\u044b MGRS"

    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    :cond_11
    const-string v0, "\u041a\u0432\u0430\u0434\u0440\u0430\u0442 \u043d\u0435 \u0441\u043e\u043e\u0442\u0432\u0435\u0442\u0441\u0442\u0432\u0443\u0435\u0442 \u0448\u0438\u0440\u043e\u0442\u043d\u043e\u043c\u0443 \u043f\u043e\u044f\u0441\u0443 MGRS"

    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    :cond_12
    const-string v0, "\u041a\u0432\u0430\u0434\u0440\u0430\u0442 \u0432\u043d\u0435 \u043f\u043e\u044f\u0441\u0430 MGRS"

    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    :cond_13
    const-string v0, "\u041a\u0432\u0430\u0434\u0440\u0430\u0442 \u043d\u0435 \u0441\u043e\u043e\u0442\u0432\u0435\u0442\u0441\u0442\u0432\u0443\u0435\u0442 \u0437\u043e\u043d\u0435 MGRS"

    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    :cond_14
    const-string v0, "\u0417\u043e\u043d\u0430 MGRS: \u043e\u0442 1 \u0434\u043e 60"

    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    :cond_15
    const-string v0, "MGRS: \u0437\u043e\u043d\u0430, \u043f\u043e\u044f\u0441, \u043a\u0432\u0430\u0434\u0440\u0430\u0442 \u0438 \u043e\u0442 1 \u0434\u043e 5 \u0446\u0438\u0444\u0440 E/N"

    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0
.end method

.method public static fromUtm(Lorg/rabochaya/projects/Coordinates$Grid;)Lorg/rabochaya/projects/Coordinates$Position;
    .locals 6

    .line 32
    iget v0, p0, Lorg/rabochaya/projects/Coordinates$Grid;->zone:I

    iget-boolean v1, p0, Lorg/rabochaya/projects/Coordinates$Grid;->north:Z

    iget-wide v2, p0, Lorg/rabochaya/projects/Coordinates$Grid;->easting:D

    iget-wide v4, p0, Lorg/rabochaya/projects/Coordinates$Grid;->northing:D

    invoke-static/range {v0 .. v5}, Lorg/rabochaya/projects/Coordinates;->inverse(IZDD)Lorg/rabochaya/projects/Coordinates$Position;

    move-result-object p0

    iget-wide v0, p0, Lorg/rabochaya/projects/Coordinates$Position;->lat:D

    const-wide v2, -0x3fabfffffff54339L    # -80.00000001

    cmpg-double v0, v0, v2

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lorg/rabochaya/projects/Coordinates$Position;->lat:D

    const-wide v2, 0x40550000000abcc7L    # 84.00000001

    cmpl-double v0, v0, v2

    if-gez v0, :cond_0

    return-object p0

    :cond_0
    const-string p0, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b \u0432\u043d\u0435 \u043e\u0431\u043b\u0430\u0441\u0442\u0438 UTM"

    invoke-static {p0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method private static geographic(DD)V
    .locals 2

    .line 24
    invoke-static {p0, p1}, Lorg/rabochaya/projects/Coordinates;->finite(D)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p2, p3}, Lorg/rabochaya/projects/Coordinates;->finite(D)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0, p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide p0

    const-wide v0, 0x4056800000000000L    # 90.0

    cmpl-double p0, p0, v0

    if-gtz p0, :cond_0

    invoke-static {p2, p3}, Ljava/lang/Math;->abs(D)D

    move-result-wide p0

    const-wide p2, 0x4066800000000000L    # 180.0

    cmpl-double p0, p0, p2

    if-gtz p0, :cond_0

    return-void

    :cond_0
    const-string p0, "\u0428\u0438\u0440\u043e\u0442\u0430: \u043e\u0442 \u221290 \u0434\u043e 90; \u0434\u043e\u043b\u0433\u043e\u0442\u0430: \u043e\u0442 \u2212180 \u0434\u043e 180"

    invoke-static {p0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method private static inverse(IZDD)Lorg/rabochaya/projects/Coordinates$Position;
    .locals 19

    .line 33
    const-wide v0, 0x411e848000000000L    # 500000.0

    sub-double v0, p2, v0

    const-wide v2, 0x415847b98aa272e4L    # 6364902.166165087

    div-double/2addr v0, v2

    const/4 v4, 0x0

    if-eqz p1, :cond_0

    move v5, v4

    goto :goto_0

    :cond_0
    const v5, 0x989680

    :goto_0
    int-to-double v5, v5

    sub-double v5, p4, v5

    div-double/2addr v5, v2

    const/4 v2, 0x1

    move-wide v7, v0

    move-wide v9, v5

    :goto_1
    const/4 v3, 0x6

    if-gt v2, v3, :cond_1

    sget-object v3, Lorg/rabochaya/projects/Coordinates;->BETA:[D

    aget-wide v11, v3, v2

    mul-int/lit8 v3, v2, 0x2

    int-to-double v13, v3

    mul-double v15, v13, v5

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->sin(D)D

    move-result-wide v17

    mul-double v11, v11, v17

    mul-double/2addr v13, v0

    invoke-static {v13, v14}, Ljava/lang/Math;->cosh(D)D

    move-result-wide v17

    mul-double v11, v11, v17

    sub-double/2addr v9, v11

    sget-object v3, Lorg/rabochaya/projects/Coordinates;->BETA:[D

    aget-wide v11, v3, v2

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->cos(D)D

    move-result-wide v15

    mul-double/2addr v11, v15

    invoke-static {v13, v14}, Ljava/lang/Math;->sinh(D)D

    move-result-wide v13

    mul-double/2addr v11, v13

    sub-double/2addr v7, v11

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    invoke-static {v7, v8}, Ljava/lang/Math;->sinh(D)D

    move-result-wide v0

    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    invoke-static {v9, v10}, Ljava/lang/Math;->sin(D)D

    move-result-wide v7

    invoke-static {v0, v1, v5, v6}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v9

    div-double/2addr v7, v9

    move-wide v9, v7

    :goto_2
    const/16 v2, 0xa

    if-ge v4, v2, :cond_3

    sget-wide v11, Lorg/rabochaya/projects/Coordinates;->E:D

    sget-wide v13, Lorg/rabochaya/projects/Coordinates;->E:D

    mul-double/2addr v13, v9

    move v2, v4

    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    invoke-static {v3, v4, v9, v10}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v15

    div-double/2addr v13, v15

    invoke-static {v13, v14}, Lorg/rabochaya/projects/Coordinates;->atanh(D)D

    move-result-wide v13

    mul-double/2addr v11, v13

    invoke-static {v11, v12}, Ljava/lang/Math;->sinh(D)D

    move-result-wide v11

    invoke-static {v3, v4, v11, v12}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v13

    mul-double/2addr v13, v9

    invoke-static {v3, v4, v9, v10}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v15

    mul-double/2addr v11, v15

    sub-double/2addr v13, v11

    sub-double v11, v7, v13

    invoke-static {v3, v4, v13, v14}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v13

    div-double/2addr v11, v13

    sget-wide v13, Lorg/rabochaya/projects/Coordinates;->E:D

    sget-wide v15, Lorg/rabochaya/projects/Coordinates;->E:D

    mul-double/2addr v13, v15

    sub-double v13, v3, v13

    mul-double/2addr v13, v9

    mul-double/2addr v13, v9

    add-double/2addr v13, v3

    mul-double/2addr v11, v13

    sget-wide v13, Lorg/rabochaya/projects/Coordinates;->E:D

    sget-wide v15, Lorg/rabochaya/projects/Coordinates;->E:D

    mul-double/2addr v13, v15

    sub-double v13, v3, v13

    invoke-static {v3, v4, v9, v10}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v15

    mul-double/2addr v13, v15

    div-double/2addr v11, v13

    add-double/2addr v9, v11

    invoke-static {v11, v12}, Ljava/lang/Math;->abs(D)D

    move-result-wide v11

    invoke-static {v9, v10}, Ljava/lang/Math;->abs(D)D

    move-result-wide v13

    invoke-static {v3, v4, v13, v14}, Ljava/lang/Math;->max(DD)D

    move-result-wide v3

    const-wide v13, 0x3d3c25c268497682L    # 1.0E-13

    mul-double/2addr v3, v13

    cmpg-double v3, v11, v3

    if-gez v3, :cond_2

    goto :goto_3

    :cond_2
    add-int/lit8 v4, v2, 0x1

    const/4 v3, 0x6

    goto :goto_2

    :cond_3
    :goto_3
    new-instance v2, Lorg/rabochaya/projects/Coordinates$Position;

    invoke-static {v9, v10}, Ljava/lang/Math;->atan(D)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v3

    const/4 v7, 0x6

    mul-int/lit8 v7, p0, 0x6

    add-int/lit16 v7, v7, -0xb7

    int-to-double v7, v7

    invoke-static {v0, v1, v5, v6}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v0

    add-double/2addr v7, v0

    invoke-static {v7, v8}, Lorg/rabochaya/projects/Coordinates;->delta(D)D

    move-result-wide v0

    invoke-direct {v2, v3, v4, v0, v1}, Lorg/rabochaya/projects/Coordinates$Position;-><init>(DD)V

    return-object v2
.end method

.method public static mgrs(DDI)Ljava/lang/String;
    .locals 10

    .line 34
    const/4 v0, 0x1

    if-lt p4, v0, :cond_2

    const/4 v1, 0x5

    if-gt p4, v1, :cond_2

    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/Coordinates;->toUtm(DD)Lorg/rabochaya/projects/Coordinates$Grid;

    move-result-object p2

    const-wide/high16 v2, 0x4054000000000000L    # 80.0

    add-double/2addr p0, v2

    const-wide/high16 v2, 0x4020000000000000L    # 8.0

    div-double/2addr p0, v2

    invoke-static {p0, p1}, Ljava/lang/Math;->floor(D)D

    move-result-wide p0

    double-to-int p0, p0

    const/16 p1, 0x13

    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const-string p1, "CDEFGHJKLMNPQRSTUVWX"

    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    iget-wide v2, p2, Lorg/rabochaya/projects/Coordinates$Grid;->easting:D

    const-wide v4, 0x40f86a0000000000L    # 100000.0

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int p1, v2

    sub-int/2addr p1, v0

    iget-wide v2, p2, Lorg/rabochaya/projects/Coordinates$Grid;->northing:D

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    double-to-int p3, v2

    rem-int/lit8 p3, p3, 0x14

    if-ltz p1, :cond_1

    const/16 v2, 0x8

    if-ge p1, v2, :cond_1

    sget-object v2, Lorg/rabochaya/projects/Coordinates;->COLS:[Ljava/lang/String;

    iget v3, p2, Lorg/rabochaya/projects/Coordinates$Grid;->zone:I

    sub-int/2addr v3, v0

    const/4 v4, 0x3

    rem-int/2addr v3, v4

    aget-object v2, v2, v3

    invoke-virtual {v2, p1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    iget v2, p2, Lorg/rabochaya/projects/Coordinates$Grid;->zone:I

    const/4 v3, 0x2

    rem-int/2addr v2, v3

    const/4 v5, 0x0

    if-nez v2, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    move v2, v5

    :goto_0
    add-int/2addr p3, v2

    rem-int/lit8 p3, p3, 0x14

    const-string v2, "ABCDEFGHJKLMNPQRSTUV"

    invoke-virtual {v2, p3}, Ljava/lang/String;->charAt(I)C

    move-result p3

    rsub-int/lit8 v2, p4, 0x5

    int-to-double v6, v2

    const-wide/high16 v8, 0x4024000000000000L    # 10.0

    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v6

    double-to-int v2, v6

    iget-wide v6, p2, Lorg/rabochaya/projects/Coordinates$Grid;->easting:D

    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    move-result-wide v6

    double-to-int v6, v6

    const v7, 0x186a0

    rem-int/2addr v6, v7

    div-int/2addr v6, v2

    iget-wide v8, p2, Lorg/rabochaya/projects/Coordinates$Grid;->northing:D

    invoke-static {v8, v9}, Ljava/lang/Math;->floor(D)D

    move-result-wide v8

    double-to-int v8, v8

    rem-int/2addr v8, v7

    div-int/2addr v8, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "%02d%c %c%c %0"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, "d %0"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p4

    const-string v7, "d"

    invoke-virtual {p4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    iget p2, p2, Lorg/rabochaya/projects/Coordinates$Grid;->zone:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p0

    invoke-static {p1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p1

    invoke-static {p3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p3

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x6

    new-array v8, v8, [Ljava/lang/Object;

    aput-object p2, v8, v5

    aput-object p0, v8, v0

    aput-object p1, v8, v3

    aput-object p3, v8, v4

    const/4 p0, 0x4

    aput-object v6, v8, p0

    aput-object v7, v8, v1

    invoke-static {v2, p4, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    const-string p0, "\u041a\u0432\u0430\u0434\u0440\u0430\u0442 \u0432\u043d\u0435 \u043e\u0431\u043b\u0430\u0441\u0442\u0438 MGRS"

    invoke-static {p0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    :cond_2
    const-string p0, "\u0423\u0442\u043e\u0447\u043d\u0435\u043d\u0438\u0435 MGRS: \u043e\u0442 1 \u0434\u043e 5 \u0446\u0438\u0444\u0440"

    invoke-static {p0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method public static name(I)Ljava/lang/String;
    .locals 1

    .line 18
    invoke-static {p0}, Lorg/rabochaya/projects/Coordinates;->checkFormat(I)V

    sget-object v0, Lorg/rabochaya/projects/Coordinates;->NAMES:[Ljava/lang/String;

    aget-object p0, v0, p0

    return-object p0
.end method

.method public static names()[Ljava/lang/String;
    .locals 1

    .line 17
    sget-object v0, Lorg/rabochaya/projects/Coordinates;->NAMES:[Ljava/lang/String;

    invoke-virtual {v0}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method private static number(Ljava/lang/String;)D
    .locals 3

    .line 39
    const-string v0, "[+-]?(?:\\d+(?:[.,]\\d*)?|[.,]\\d+)(?:[eE][+-]?\\d+)?"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x2c

    const/16 v1, 0x2e

    :try_start_0
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/rabochaya/projects/Coordinates;->finite(D)Z

    move-result v2

    if-eqz v2, :cond_0

    return-wide v0

    :cond_0
    const-string v0, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b \u0434\u043e\u043b\u0436\u043d\u044b \u0431\u044b\u0442\u044c \u043a\u043e\u043d\u0435\u0447\u043d\u044b\u043c\u0438 \u0447\u0438\u0441\u043b\u0430\u043c\u0438"

    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u0440\u043e\u0447\u0438\u0442\u0430\u0442\u044c \u0447\u0438\u0441\u043b\u043e: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    :cond_1
    const-string p0, "\u041e\u0436\u0438\u0434\u0430\u0435\u0442\u0441\u044f \u0434\u0435\u0441\u044f\u0442\u0438\u0447\u043d\u043e\u0435 \u0447\u0438\u0441\u043b\u043e"

    invoke-static {p0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method public static parse(Ljava/lang/String;I)Lorg/rabochaya/projects/Coordinates$Position;
    .locals 11

    .line 40
    invoke-static {p1}, Lorg/rabochaya/projects/Coordinates;->checkFormat(I)V

    invoke-static {p0}, Lorg/rabochaya/projects/Coordinates;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    invoke-static {p0}, Lorg/rabochaya/projects/Coordinates;->fromMgrs(Ljava/lang/String;)Lorg/rabochaya/projects/Coordinates$Position;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-ne p1, v1, :cond_2

    const-string p1, "^(\\d{1,2})\\s*([NSns])\\s+([^\\s]+)\\s+([^\\s]+)$"

    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result p1

    if-eqz p1, :cond_1

    new-instance p1, Lorg/rabochaya/projects/Coordinates$Grid;

    invoke-virtual {p0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "N"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    invoke-virtual {p0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/rabochaya/projects/Coordinates;->number(Ljava/lang/String;)D

    move-result-wide v7

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lorg/rabochaya/projects/Coordinates;->number(Ljava/lang/String;)D

    move-result-wide v9

    move-object v4, p1

    invoke-direct/range {v4 .. v10}, Lorg/rabochaya/projects/Coordinates$Grid;-><init>(IZDD)V

    invoke-static {p1}, Lorg/rabochaya/projects/Coordinates;->fromUtm(Lorg/rabochaya/projects/Coordinates$Grid;)Lorg/rabochaya/projects/Coordinates$Position;

    move-result-object p0

    return-object p0

    :cond_1
    const-string p0, "UTM: \u0437\u043e\u043d\u0430, \u043f\u043e\u043b\u0443\u0448\u0430\u0440\u0438\u0435 N/S, Easting, Northing; \u043f\u0440\u0438\u043c\u0435\u0440: 37 N 410000 6170000"

    invoke-static {p0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    :cond_2
    const/4 v0, 0x0

    if-nez p1, :cond_4

    const-string p1, ",\\s+"

    const-string v1, " "

    invoke-virtual {p0, p1, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string p1, "[;\\s]+"

    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length p1, p0

    if-ne p1, v2, :cond_3

    new-instance p1, Lorg/rabochaya/projects/Coordinates$Position;

    aget-object v0, p0, v0

    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->number(Ljava/lang/String;)D

    move-result-wide v0

    aget-object p0, p0, v3

    invoke-static {p0}, Lorg/rabochaya/projects/Coordinates;->number(Ljava/lang/String;)D

    move-result-wide v2

    invoke-direct {p1, v0, v1, v2, v3}, Lorg/rabochaya/projects/Coordinates$Position;-><init>(DD)V

    return-object p1

    :cond_3
    const-string p0, "\u0412\u0432\u0435\u0434\u0438\u0442\u0435 \u0448\u0438\u0440\u043e\u0442\u0443 \u0438 \u0434\u043e\u043b\u0433\u043e\u0442\u0443 \u0447\u0435\u0440\u0435\u0437 \u043f\u0440\u043e\u0431\u0435\u043b"

    invoke-static {p0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    :cond_4
    const-string v1, "[;\\n]+"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v1, p0

    if-ne v1, v2, :cond_5

    new-instance v1, Lorg/rabochaya/projects/Coordinates$Position;

    aget-object v2, p0, v0

    invoke-static {v2, v3, p1}, Lorg/rabochaya/projects/Coordinates;->parseAngle(Ljava/lang/String;ZI)D

    move-result-wide v4

    aget-object p0, p0, v3

    invoke-static {p0, v0, p1}, Lorg/rabochaya/projects/Coordinates;->parseAngle(Ljava/lang/String;ZI)D

    move-result-wide p0

    invoke-direct {v1, v4, v5, p0, p1}, Lorg/rabochaya/projects/Coordinates$Position;-><init>(DD)V

    return-object v1

    :cond_5
    const-string p0, "\u0428\u0438\u0440\u043e\u0442\u0430 \u0438 \u0434\u043e\u043b\u0433\u043e\u0442\u0430 \u2014 \u043e\u0442\u0434\u0435\u043b\u044c\u043d\u044b\u043c\u0438 \u0441\u0442\u0440\u043e\u043a\u0430\u043c\u0438 \u0438\u043b\u0438 \u0447\u0435\u0440\u0435\u0437 \u0442\u043e\u0447\u043a\u0443 \u0441 \u0437\u0430\u043f\u044f\u0442\u043e\u0439"

    invoke-static {p0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method private static parseAngle(Ljava/lang/String;ZI)D
    .locals 20

    .line 41
    move/from16 v0, p2

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "[NSEW\u0421\u042e\u0412\u0417]"

    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, -0x1

    move v5, v3

    move v6, v4

    :goto_0
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v7

    if-eqz v7, :cond_1

    if-nez v5, :cond_0

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->start()I

    move-result v6

    goto :goto_0

    :cond_0
    const-string v0, "\u041e\u0434\u0438\u043d \u0443\u043a\u0430\u0437\u0430\u0442\u0435\u043b\u044c \u043f\u043e\u043b\u0443\u0448\u0430\u0440\u0438\u044f \u043d\u0430 \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u0443"

    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    :cond_1
    const/4 v2, 0x1

    if-eqz v5, :cond_6

    if-eqz v6, :cond_3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    sub-int/2addr v7, v2

    if-ne v6, v7, :cond_2

    goto :goto_1

    :cond_2
    const-string v0, "\u041f\u043e\u043b\u0443\u0448\u0430\u0440\u0438\u0435 \u0443\u043a\u0430\u0436\u0438\u0442\u0435 \u043f\u0435\u0440\u0435\u0434 \u0438\u043b\u0438 \u043f\u043e\u0441\u043b\u0435 \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b"

    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    :cond_3
    :goto_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    add-int/2addr v6, v2

    invoke-virtual {v1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz p1, :cond_4

    const-string v6, "NS\u0421\u042e"

    invoke-virtual {v6, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-ltz v6, :cond_5

    :cond_4
    if-nez p1, :cond_6

    const-string v6, "EW\u0412\u0417"

    invoke-virtual {v6, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-ltz v6, :cond_5

    goto :goto_2

    :cond_5
    const-string v0, "\u041d\u0435\u0432\u0435\u0440\u043d\u043e\u0435 \u043f\u043e\u043b\u0443\u0448\u0430\u0440\u0438\u0435 \u0434\u043b\u044f \u0448\u0438\u0440\u043e\u0442\u044b/\u0434\u043e\u043b\u0433\u043e\u0442\u044b"

    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    :cond_6
    :goto_2
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v6, "-"

    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v5, :cond_8

    if-nez v6, :cond_7

    const-string v7, "+"

    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_7

    goto :goto_3

    :cond_7
    const-string v0, "\u0418\u0441\u043f\u043e\u043b\u044c\u0437\u0443\u0439\u0442\u0435 \u0437\u043d\u0430\u043a \u043b\u0438\u0431\u043e \u0431\u0443\u043a\u0432\u0443 \u043f\u043e\u043b\u0443\u0448\u0430\u0440\u0438\u044f"

    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    :cond_8
    :goto_3
    const-string v7, "[\u00b0\u00ba\u2032\u2019\'\u2033\"\u201c\u201d]"

    const-string v8, " "

    invoke-virtual {v1, v7, v8}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v7, "\\s+"

    invoke-virtual {v1, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v7, 0x2

    const/4 v8, 0x3

    if-ne v0, v2, :cond_9

    move v9, v7

    goto :goto_4

    :cond_9
    move v9, v8

    :goto_4
    array-length v10, v1

    if-eq v10, v9, :cond_b

    if-ne v0, v2, :cond_a

    const-string v0, "\u041d\u0443\u0436\u043d\u044b \u0433\u0440\u0430\u0434\u0443\u0441\u044b \u0438 \u043c\u0438\u043d\u0443\u0442\u044b"

    goto :goto_5

    :cond_a
    const-string v0, "\u041d\u0443\u0436\u043d\u044b \u0433\u0440\u0430\u0434\u0443\u0441\u044b, \u043c\u0438\u043d\u0443\u0442\u044b \u0438 \u0441\u0435\u043a\u0443\u043d\u0434\u044b"

    :goto_5
    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    :cond_b
    aget-object v0, v1, v3

    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->number(Ljava/lang/String;)D

    move-result-wide v10

    aget-object v0, v1, v2

    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->number(Ljava/lang/String;)D

    move-result-wide v12

    const-wide/16 v14, 0x0

    if-ne v9, v8, :cond_c

    aget-object v0, v1, v7

    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->number(Ljava/lang/String;)D

    move-result-wide v0

    goto :goto_6

    :cond_c
    move-wide v0, v14

    :goto_6
    invoke-static {v10, v11}, Ljava/lang/Math;->abs(D)D

    move-result-wide v16

    invoke-static {v10, v11}, Ljava/lang/Math;->abs(D)D

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->floor(D)D

    move-result-wide v18

    cmpl-double v7, v16, v18

    if-nez v7, :cond_14

    cmpg-double v7, v12, v14

    if-ltz v7, :cond_14

    const-wide/high16 v16, 0x404e000000000000L    # 60.0

    cmpl-double v7, v12, v16

    if-gez v7, :cond_14

    cmpg-double v7, v0, v14

    if-ltz v7, :cond_14

    cmpl-double v7, v0, v16

    if-gez v7, :cond_14

    if-ne v9, v8, :cond_d

    invoke-static {v12, v13}, Ljava/lang/Math;->floor(D)D

    move-result-wide v7

    cmpl-double v7, v12, v7

    if-nez v7, :cond_14

    :cond_d
    invoke-static {v10, v11}, Ljava/lang/Math;->abs(D)D

    move-result-wide v7

    div-double v12, v12, v16

    add-double/2addr v7, v12

    const-wide v9, 0x40ac200000000000L    # 3600.0

    div-double/2addr v0, v9

    add-double/2addr v7, v0

    if-eqz p1, :cond_e

    const/16 v0, 0x5a

    goto :goto_7

    :cond_e
    const/16 v0, 0xb4

    :goto_7
    int-to-double v0, v0

    cmpl-double v0, v7, v0

    if-gtz v0, :cond_13

    const/16 v0, 0x53

    if-eq v5, v0, :cond_f

    const/16 v0, 0x57

    if-eq v5, v0, :cond_f

    const/16 v0, 0x42e

    if-eq v5, v0, :cond_f

    const/16 v0, 0x417

    if-ne v5, v0, :cond_10

    :cond_f
    move v3, v2

    :cond_10
    if-nez v6, :cond_12

    if-eqz v3, :cond_11

    goto :goto_8

    :cond_11
    move v4, v2

    :cond_12
    :goto_8
    int-to-double v0, v4

    mul-double/2addr v0, v7

    return-wide v0

    :cond_13
    const-string v0, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u0430 \u0432\u043d\u0435 \u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u043e\u0433\u043e \u0434\u0438\u0430\u043f\u0430\u0437\u043e\u043d\u0430"

    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0

    :cond_14
    const-string v0, "\u0413\u0440\u0430\u0434\u0443\u0441\u044b \u0446\u0435\u043b\u044b\u0435; \u043c\u0438\u043d\u0443\u0442\u044b/\u0441\u0435\u043a\u0443\u043d\u0434\u044b \u043e\u0442 0 \u0434\u043e 60"

    invoke-static {v0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v0

    throw v0
.end method

.method public static toUtm(DD)Lorg/rabochaya/projects/Coordinates$Grid;
    .locals 11

    .line 30
    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/Coordinates;->zone(DD)I

    move-result v1

    mul-int/lit8 v0, v1, 0x6

    add-int/lit16 v0, v0, -0xb7

    int-to-double v2, v0

    sub-double/2addr p2, v2

    invoke-static {p2, p3}, Lorg/rabochaya/projects/Coordinates;->delta(D)D

    move-result-wide p2

    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/Coordinates;->forward(DD)[D

    move-result-object p2

    new-instance p3, Lorg/rabochaya/projects/Coordinates$Grid;

    const-wide/16 v2, 0x0

    cmpl-double v0, p0, v2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-ltz v0, :cond_0

    move v6, v4

    goto :goto_0

    :cond_0
    move v6, v5

    :goto_0
    aget-wide v7, p2, v5

    const-wide v9, 0x411e848000000000L    # 500000.0

    add-double/2addr v7, v9

    aget-wide v9, p2, v4

    cmpg-double p0, p0, v2

    if-gez p0, :cond_1

    const v5, 0x989680

    :cond_1
    int-to-double p0, v5

    add-double/2addr p0, v9

    move-object v0, p3

    move v2, v6

    move-wide v3, v7

    move-wide v5, p0

    invoke-direct/range {v0 .. v6}, Lorg/rabochaya/projects/Coordinates$Grid;-><init>(IZDD)V

    return-object p3
.end method

.method private static utmLatitude(D)V
    .locals 2

    .line 25
    const-wide/high16 v0, -0x3fac000000000000L    # -80.0

    cmpg-double v0, p0, v0

    if-ltz v0, :cond_0

    const-wide/high16 v0, 0x4055000000000000L    # 84.0

    cmpl-double p0, p0, v0

    if-gez p0, :cond_0

    return-void

    :cond_0
    const-string p0, "UTM/MGRS: \u0448\u0438\u0440\u043e\u0442\u0430 \u043e\u0442 \u221280 \u0434\u043e 84\u00b0; \u043f\u043e\u043b\u044f\u0440\u043d\u0430\u044f UPS \u0435\u0449\u0451 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u0442\u0441\u044f"

    invoke-static {p0}, Lorg/rabochaya/projects/Coordinates;->bad(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method public static zone(DD)I
    .locals 4

    .line 26
    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/Coordinates;->geographic(DD)V

    invoke-static {p0, p1}, Lorg/rabochaya/projects/Coordinates;->utmLatitude(D)V

    const-wide v0, 0x4066800000000000L    # 180.0

    add-double/2addr v0, p2

    const-wide/high16 v2, 0x4018000000000000L    # 6.0

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    add-int/lit8 v0, v0, 0x1

    const/16 v1, 0x3c

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    const-wide/high16 v1, 0x404c000000000000L    # 56.0

    cmpl-double v1, p0, v1

    if-ltz v1, :cond_0

    const-wide/high16 v1, 0x4050000000000000L    # 64.0

    cmpg-double v1, p0, v1

    if-gez v1, :cond_0

    const-wide/high16 v1, 0x4008000000000000L    # 3.0

    cmpl-double v1, p2, v1

    if-ltz v1, :cond_0

    const-wide/high16 v1, 0x4028000000000000L    # 12.0

    cmpg-double v1, p2, v1

    if-gez v1, :cond_0

    const/16 v0, 0x20

    :cond_0
    const-wide/high16 v1, 0x4052000000000000L    # 72.0

    cmpl-double p0, p0, v1

    if-ltz p0, :cond_4

    const-wide/16 p0, 0x0

    cmpl-double p0, p2, p0

    if-ltz p0, :cond_4

    const-wide/high16 p0, 0x4045000000000000L    # 42.0

    cmpg-double p0, p2, p0

    if-gez p0, :cond_4

    const-wide/high16 p0, 0x4022000000000000L    # 9.0

    cmpg-double p0, p2, p0

    if-gez p0, :cond_1

    const/16 p0, 0x1f

    :goto_0
    move v0, p0

    goto :goto_1

    :cond_1
    const-wide/high16 p0, 0x4035000000000000L    # 21.0

    cmpg-double p0, p2, p0

    if-gez p0, :cond_2

    const/16 p0, 0x21

    goto :goto_0

    :cond_2
    const-wide p0, 0x4040800000000000L    # 33.0

    cmpg-double p0, p2, p0

    if-gez p0, :cond_3

    const/16 p0, 0x23

    goto :goto_0

    :cond_3
    const/16 p0, 0x25

    goto :goto_0

    :cond_4
    :goto_1
    return v0
.end method
