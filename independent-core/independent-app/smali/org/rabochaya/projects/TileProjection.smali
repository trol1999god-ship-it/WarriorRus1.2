.class public final Lorg/rabochaya/projects/TileProjection;
.super Ljava/lang/Object;
.source "TileProjection.java"


# static fields
.field private static final E:D = 0.08181919084262149


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bbox(III)Ljava/lang/String;
    .locals 11

    .line 8
    const/4 v0, 0x1

    shl-int p0, v0, p0

    int-to-double v1, p0

    const-wide v3, 0x41831bf8457c1093L    # 4.007501668557849E7

    div-double/2addr v3, v1

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    int-to-double v1, p1

    mul-double/2addr v1, v3

    const-wide v5, -0x3e8ce407ba83ef6dL    # -2.0037508342789244E7

    add-double/2addr v1, v5

    invoke-static {v1, v2}, Lorg/rabochaya/projects/TileProjection;->decimal(D)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v1, ","

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    add-int/lit8 v2, p2, 0x1

    int-to-double v7, v2

    mul-double/2addr v7, v3

    const-wide v9, 0x41731bf8457c1093L    # 2.0037508342789244E7

    sub-double v7, v9, v7

    invoke-static {v7, v8}, Lorg/rabochaya/projects/TileProjection;->decimal(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    add-int/2addr p1, v0

    int-to-double v7, p1

    mul-double/2addr v7, v3

    add-double/2addr v5, v7

    invoke-static {v5, v6}, Lorg/rabochaya/projects/TileProjection;->decimal(D)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    int-to-double p1, p2

    mul-double/2addr p1, v3

    sub-double/2addr v9, p1

    invoke-static {v9, v10}, Lorg/rabochaya/projects/TileProjection;->decimal(D)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static decimal(D)Ljava/lang/String;
    .locals 2

    .line 9
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, p1, v1

    const-string p0, "%.8f"

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static latitude(DZ)D
    .locals 10

    .line 6
    if-nez p2, :cond_0

    invoke-static {p0, p1}, Lorg/rabochaya/projects/MapMath;->lat(D)D

    move-result-wide p0

    return-wide p0

    :cond_0
    const-wide/high16 v0, 0x4000000000000000L    # 2.0

    mul-double/2addr p0, v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    sub-double p0, v2, p0

    const-wide v4, 0x400921fb54442d18L    # Math.PI

    mul-double/2addr p0, v4

    invoke-static {p0, p1}, Ljava/lang/Math;->exp(D)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Math;->atan(D)D

    move-result-wide v4

    mul-double/2addr v4, v0

    const-wide v6, 0x3ff921fb54442d18L    # 1.5707963267948966

    sub-double/2addr v4, v6

    const/4 p2, 0x0

    :goto_0
    const/16 v8, 0xc

    if-ge p2, v8, :cond_1

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    const-wide v8, 0x3fb4f21a3cdaaf9aL    # 0.08181919084262149

    mul-double/2addr v4, v8

    add-double v8, v4, v2

    sub-double v4, v2, v4

    div-double/2addr v8, v4

    const-wide v4, 0x3fa4f21a3cdaaf9aL    # 0.04090959542131074

    invoke-static {v8, v9, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    mul-double/2addr v4, p0

    invoke-static {v4, v5}, Ljava/lang/Math;->atan(D)D

    move-result-wide v4

    mul-double/2addr v4, v0

    sub-double/2addr v4, v6

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    invoke-static {v4, v5}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide p0

    return-wide p0
.end method

.method public static quadkey(III)Ljava/lang/String;
    .locals 3

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 p0, p0, -0x1

    :goto_0
    if-ltz p0, :cond_0

    shr-int v1, p1, p0

    and-int/lit8 v1, v1, 0x1

    shr-int v2, p2, p0

    and-int/lit8 v2, v2, 0x1

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    add-int/lit8 p0, p0, -0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static y(DZ)D
    .locals 8

    .line 5
    if-nez p2, :cond_0

    invoke-static {p0, p1}, Lorg/rabochaya/projects/MapMath;->y(D)D

    move-result-wide p0

    return-wide p0

    :cond_0
    const-wide v2, -0x3faabcba4e5a8100L    # -85.05112878

    const-wide v4, 0x40554345b1a57f00L    # 85.05112878

    move-wide v0, p0

    invoke-static/range {v0 .. v5}, Lorg/rabochaya/projects/MapMath;->clamp(DDD)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    const-wide v2, 0x3fe921fb54442d18L    # 0.7853981633974483

    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    div-double/2addr p0, v4

    add-double/2addr p0, v2

    invoke-static {p0, p1}, Ljava/lang/Math;->tan(D)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Math;->log(D)D

    move-result-wide p0

    const-wide v2, 0x3fb4f21a3cdaaf9aL    # 0.08181919084262149

    mul-double/2addr v0, v2

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    add-double v6, v0, v2

    sub-double v0, v2, v0

    div-double/2addr v6, v0

    invoke-static {v6, v7}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    const-wide v6, 0x3fa4f21a3cdaaf9aL    # 0.04090959542131074

    mul-double/2addr v0, v6

    sub-double/2addr p0, v0

    const-wide v0, 0x400921fb54442d18L    # Math.PI

    div-double/2addr p0, v0

    sub-double/2addr v2, p0

    div-double/2addr v2, v4

    return-wide v2
.end method
