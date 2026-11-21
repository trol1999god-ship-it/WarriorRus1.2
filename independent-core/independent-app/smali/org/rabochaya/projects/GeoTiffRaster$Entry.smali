.class final Lorg/rabochaya/projects/GeoTiffRaster$Entry;
.super Ljava/lang/Object;
.source "GeoTiffRaster.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/GeoTiffRaster;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Entry"
.end annotation


# instance fields
.field final at:J

.field final count:I

.field final type:I


# direct methods
.method constructor <init>(IIJ)V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->type:I

    iput p2, p0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->count:I

    iput-wide p3, p0, Lorg/rabochaya/projects/GeoTiffRaster$Entry;->at:J

    return-void
.end method
