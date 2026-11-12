.class Lorg/rabochaya/projects/HgtRaster$1;
.super Ljava/util/LinkedHashMap;
.source "HgtRaster.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/HgtRaster;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedHashMap<",
        "Ljava/lang/Integer;",
        "[S>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/HgtRaster;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/HgtRaster;IFZ)V
    .locals 0

    .line 7
    iput-object p1, p0, Lorg/rabochaya/projects/HgtRaster$1;->this$0:Lorg/rabochaya/projects/HgtRaster;

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
            "[S>;)Z"
        }
    .end annotation

    .line 7
    invoke-virtual {p0}, Lorg/rabochaya/projects/HgtRaster$1;->size()I

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
