.class public final Lorg/rabochaya/projects/Coordinates$Grid;
.super Ljava/lang/Object;
.source "Coordinates.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/Coordinates;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Grid"
.end annotation


# instance fields
.field public final easting:D

.field public final north:Z

.field public final northing:D

.field public final zone:I


# direct methods
.method public constructor <init>(IZDD)V
    .locals 2

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    if-lt p1, v0, :cond_0

    const/16 v0, 0x3c

    if-gt p1, v0, :cond_0

    invoke-static {p3, p4}, Lorg/rabochaya/projects/Coordinates;->access$100(D)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p5, p6}, Lorg/rabochaya/projects/Coordinates;->access$100(D)Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide v0, 0x40f86a0000000000L    # 100000.0

    cmpg-double v0, p3, v0

    if-ltz v0, :cond_0

    const-wide v0, 0x412b774000000000L    # 900000.0

    cmpl-double v0, p3, v0

    if-gez v0, :cond_0

    const-wide/16 v0, 0x0

    cmpg-double v0, p5, v0

    if-ltz v0, :cond_0

    const-wide v0, 0x416312d000000000L    # 1.0E7

    cmpl-double v0, p5, v0

    if-gtz v0, :cond_0

    iput p1, p0, Lorg/rabochaya/projects/Coordinates$Grid;->zone:I

    iput-boolean p2, p0, Lorg/rabochaya/projects/Coordinates$Grid;->north:Z

    iput-wide p3, p0, Lorg/rabochaya/projects/Coordinates$Grid;->easting:D

    iput-wide p5, p0, Lorg/rabochaya/projects/Coordinates$Grid;->northing:D

    return-void

    :cond_0
    const-string p1, "\u041d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u0430\u044f \u0437\u043e\u043d\u0430 \u0438\u043b\u0438 \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b UTM"

    invoke-static {p1}, Lorg/rabochaya/projects/Coordinates;->access$200(Ljava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1
.end method
