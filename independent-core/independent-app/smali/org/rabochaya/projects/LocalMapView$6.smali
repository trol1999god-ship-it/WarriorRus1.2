.class Lorg/rabochaya/projects/LocalMapView$6;
.super Ljava/lang/Object;
.source "LocalMapView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/LocalMapView;->close()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/LocalMapView;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/LocalMapView;)V
    .locals 0

    .line 98
    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView$6;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 98
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$6;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$2100(Lorg/rabochaya/projects/LocalMapView;)[Lorg/rabochaya/projects/LocalMapView$RasterLayer;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$6;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$2100(Lorg/rabochaya/projects/LocalMapView;)[Lorg/rabochaya/projects/LocalMapView$RasterLayer;

    move-result-object v0

    array-length v2, v0

    move v3, v1

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v0, v3

    invoke-virtual {v4}, Lorg/rabochaya/projects/LocalMapView$RasterLayer;->close()V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$6;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$1000(Lorg/rabochaya/projects/LocalMapView;)Lorg/rabochaya/projects/OfflineTiles;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$6;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$1000(Lorg/rabochaya/projects/LocalMapView;)Lorg/rabochaya/projects/OfflineTiles;

    move-result-object v0

    invoke-virtual {v0}, Lorg/rabochaya/projects/OfflineTiles;->close()V

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$6;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$1500(Lorg/rabochaya/projects/LocalMapView;)[Lorg/rabochaya/projects/OnlineTiles;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$6;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$1500(Lorg/rabochaya/projects/LocalMapView;)[Lorg/rabochaya/projects/OnlineTiles;

    move-result-object v0

    array-length v2, v0

    :goto_1
    if-ge v1, v2, :cond_2

    aget-object v3, v0, v1

    invoke-virtual {v3}, Lorg/rabochaya/projects/OnlineTiles;->close()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method
