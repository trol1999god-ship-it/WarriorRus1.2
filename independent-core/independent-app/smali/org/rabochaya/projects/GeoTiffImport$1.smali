.class Lorg/rabochaya/projects/GeoTiffImport$1;
.super Ljava/lang/Object;
.source "GeoTiffImport.java"

# interfaces
.implements Lorg/rabochaya/projects/RasterMapImport$Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/GeoTiffImport;->write(Ljava/io/File;Ljava/io/File;Lorg/rabochaya/projects/CacheExport$Progress;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$raster:Lorg/rabochaya/projects/GeoTiffRaster;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/GeoTiffRaster;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 8
    iput-object p1, p0, Lorg/rabochaya/projects/GeoTiffImport$1;->val$raster:Lorg/rabochaya/projects/GeoTiffRaster;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public color(DD)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffImport$1;->val$raster:Lorg/rabochaya/projects/GeoTiffRaster;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/rabochaya/projects/GeoTiffRaster;->color(DD)I

    move-result p1

    return p1
.end method

.method public transform()Lorg/rabochaya/projects/GeoRasterTransform;
    .locals 1

    .line 8
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffImport$1;->val$raster:Lorg/rabochaya/projects/GeoTiffRaster;

    iget-object v0, v0, Lorg/rabochaya/projects/GeoTiffRaster;->transform:Lorg/rabochaya/projects/GeoRasterTransform;

    return-object v0
.end method
