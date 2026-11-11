.class public final synthetic Lorg/rabochaya/projects/GeoTiffImport$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lorg/rabochaya/projects/RasterExportFile$Writer;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/GeoTiffRaster;

.field public final synthetic f$1:Lorg/rabochaya/projects/CacheExport$Progress;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/GeoTiffRaster;Lorg/rabochaya/projects/CacheExport$Progress;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/GeoTiffImport$$ExternalSyntheticLambda0;->f$0:Lorg/rabochaya/projects/GeoTiffRaster;

    iput-object p2, p0, Lorg/rabochaya/projects/GeoTiffImport$$ExternalSyntheticLambda0;->f$1:Lorg/rabochaya/projects/CacheExport$Progress;

    return-void
.end method


# virtual methods
.method public final write(Ljava/io/File;)I
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffImport$$ExternalSyntheticLambda0;->f$0:Lorg/rabochaya/projects/GeoTiffRaster;

    iget-object v1, p0, Lorg/rabochaya/projects/GeoTiffImport$$ExternalSyntheticLambda0;->f$1:Lorg/rabochaya/projects/CacheExport$Progress;

    invoke-static {v0, v1, p1}, Lorg/rabochaya/projects/GeoTiffImport;->lambda$write$0(Lorg/rabochaya/projects/GeoTiffRaster;Lorg/rabochaya/projects/CacheExport$Progress;Ljava/io/File;)I

    move-result p1

    return p1
.end method
