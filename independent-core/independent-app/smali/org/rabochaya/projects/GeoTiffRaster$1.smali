.class Lorg/rabochaya/projects/GeoTiffRaster$1;
.super Ljava/util/LinkedHashMap;
.source "GeoTiffRaster.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/GeoTiffRaster;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedHashMap<",
        "Ljava/lang/Integer;",
        "[B>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/GeoTiffRaster;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/GeoTiffRaster;IFZ)V
    .locals 0

    .line 6
    iput-object p1, p0, Lorg/rabochaya/projects/GeoTiffRaster$1;->this$0:Lorg/rabochaya/projects/GeoTiffRaster;

    invoke-direct {p0, p2, p3, p4}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    return-void
.end method


# virtual methods
.method protected removeEldestEntry(Ljava/util/Map$Entry;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/Integer;",
            "[B>;)Z"
        }
    .end annotation

    .line 6
    invoke-virtual {p0}, Lorg/rabochaya/projects/GeoTiffRaster$1;->size()I

    move-result p1

    const/16 v0, 0x8

    if-le p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
