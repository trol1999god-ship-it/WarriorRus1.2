.class final Lorg/rabochaya/projects/LocalMapView$RasterLayer;
.super Ljava/lang/Object;
.source "LocalMapView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/LocalMapView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RasterLayer"
.end annotation


# instance fields
.field bundled:Lorg/rabochaya/projects/BundledTiles;

.field final model:Lorg/rabochaya/projects/MapComposition$Layer;

.field offline:Lorg/rabochaya/projects/OfflineTiles;

.field online:[Lorg/rabochaya/projects/OnlineTiles;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/MapComposition$Layer;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView$RasterLayer;->model:Lorg/rabochaya/projects/MapComposition$Layer;

    return-void
.end method


# virtual methods
.method cancel()V
    .locals 4

    .line 11
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$RasterLayer;->online:[Lorg/rabochaya/projects/OnlineTiles;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$RasterLayer;->online:[Lorg/rabochaya/projects/OnlineTiles;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    invoke-virtual {v3}, Lorg/rabochaya/projects/OnlineTiles;->cancel()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method close()V
    .locals 4

    .line 11
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$RasterLayer;->offline:Lorg/rabochaya/projects/OfflineTiles;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$RasterLayer;->offline:Lorg/rabochaya/projects/OfflineTiles;

    invoke-virtual {v0}, Lorg/rabochaya/projects/OfflineTiles;->close()V

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$RasterLayer;->online:[Lorg/rabochaya/projects/OnlineTiles;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$RasterLayer;->online:[Lorg/rabochaya/projects/OnlineTiles;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, v0, v2

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lorg/rabochaya/projects/OnlineTiles;->close()V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method interrupt()V
    .locals 4

    .line 11
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$RasterLayer;->online:[Lorg/rabochaya/projects/OnlineTiles;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$RasterLayer;->online:[Lorg/rabochaya/projects/OnlineTiles;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    invoke-virtual {v3}, Lorg/rabochaya/projects/OnlineTiles;->interrupt()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method tile(IIIIZ)Landroid/graphics/Bitmap;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 11
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$RasterLayer;->online:[Lorg/rabochaya/projects/OnlineTiles;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$RasterLayer;->online:[Lorg/rabochaya/projects/OnlineTiles;

    aget-object p4, v0, p4

    invoke-virtual {p4, p1, p2, p3, p5}, Lorg/rabochaya/projects/OnlineTiles;->tile(IIIZ)Landroid/graphics/Bitmap;

    move-result-object p1

    goto :goto_0

    :cond_0
    iget-object p4, p0, Lorg/rabochaya/projects/LocalMapView$RasterLayer;->offline:Lorg/rabochaya/projects/OfflineTiles;

    if-eqz p4, :cond_1

    iget-object p4, p0, Lorg/rabochaya/projects/LocalMapView$RasterLayer;->offline:Lorg/rabochaya/projects/OfflineTiles;

    invoke-virtual {p4, p1, p2, p3}, Lorg/rabochaya/projects/OfflineTiles;->tile(III)Landroid/graphics/Bitmap;

    move-result-object p1

    goto :goto_0

    :cond_1
    iget-object p4, p0, Lorg/rabochaya/projects/LocalMapView$RasterLayer;->bundled:Lorg/rabochaya/projects/BundledTiles;

    invoke-virtual {p4, p1, p2, p3}, Lorg/rabochaya/projects/BundledTiles;->tile(III)Landroid/graphics/Bitmap;

    move-result-object p1

    :goto_0
    return-object p1
.end method
