.class final Lorg/rabochaya/projects/BmpRaster$Tile;
.super Ljava/lang/Object;
.source "BmpRaster.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/BmpRaster;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Tile"
.end annotation


# instance fields
.field final pixels:[I

.field final width:I


# direct methods
.method constructor <init>(II)V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lorg/rabochaya/projects/BmpRaster$Tile;->width:I

    mul-int/2addr p1, p2

    new-array p1, p1, [I

    iput-object p1, p0, Lorg/rabochaya/projects/BmpRaster$Tile;->pixels:[I

    return-void
.end method
