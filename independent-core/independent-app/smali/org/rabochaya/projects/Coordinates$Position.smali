.class public final Lorg/rabochaya/projects/Coordinates$Position;
.super Ljava/lang/Object;
.source "Coordinates.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/Coordinates;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Position"
.end annotation


# instance fields
.field public final lat:D

.field public final lon:D


# direct methods
.method public constructor <init>(DD)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1, p2, p3, p4}, Lorg/rabochaya/projects/Coordinates;->access$000(DD)V

    iput-wide p1, p0, Lorg/rabochaya/projects/Coordinates$Position;->lat:D

    iput-wide p3, p0, Lorg/rabochaya/projects/Coordinates$Position;->lon:D

    return-void
.end method
