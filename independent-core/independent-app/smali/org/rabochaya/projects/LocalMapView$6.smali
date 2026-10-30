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

    .line 87
    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView$6;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 87
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$6;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$1000(Lorg/rabochaya/projects/LocalMapView;)Lorg/rabochaya/projects/OfflineTiles;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$6;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$1000(Lorg/rabochaya/projects/LocalMapView;)Lorg/rabochaya/projects/OfflineTiles;

    move-result-object v0

    invoke-virtual {v0}, Lorg/rabochaya/projects/OfflineTiles;->close()V

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$6;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$1400(Lorg/rabochaya/projects/LocalMapView;)[Lorg/rabochaya/projects/OnlineTiles;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$6;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$1400(Lorg/rabochaya/projects/LocalMapView;)[Lorg/rabochaya/projects/OnlineTiles;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    invoke-virtual {v3}, Lorg/rabochaya/projects/OnlineTiles;->close()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method
