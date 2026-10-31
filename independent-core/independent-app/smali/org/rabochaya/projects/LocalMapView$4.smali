.class Lorg/rabochaya/projects/LocalMapView$4;
.super Ljava/lang/Object;
.source "LocalMapView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/LocalMapView;-><init>(Landroid/content/Context;Ljava/util/List;Ljava/io/File;Lorg/rabochaya/projects/LocalMapView$Listener;Lorg/rabochaya/projects/TileSource;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/LocalMapView;

.field final synthetic val$listener:Lorg/rabochaya/projects/LocalMapView$Listener;

.field final synthetic val$map:Ljava/io/File;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/LocalMapView;Ljava/io/File;Lorg/rabochaya/projects/LocalMapView$Listener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 16
    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView$4;->this$0:Lorg/rabochaya/projects/LocalMapView;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapView$4;->val$map:Ljava/io/File;

    iput-object p3, p0, Lorg/rabochaya/projects/LocalMapView$4;->val$listener:Lorg/rabochaya/projects/LocalMapView$Listener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 16
    :try_start_0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$4;->this$0:Lorg/rabochaya/projects/LocalMapView;

    new-instance v1, Lorg/rabochaya/projects/OfflineTiles;

    iget-object v2, p0, Lorg/rabochaya/projects/LocalMapView$4;->val$map:Ljava/io/File;

    invoke-direct {v1, v2}, Lorg/rabochaya/projects/OfflineTiles;-><init>(Ljava/io/File;)V

    invoke-static {v0, v1}, Lorg/rabochaya/projects/LocalMapView;->access$1002(Lorg/rabochaya/projects/LocalMapView;Lorg/rabochaya/projects/OfflineTiles;)Lorg/rabochaya/projects/OfflineTiles;

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$4;->this$0:Lorg/rabochaya/projects/LocalMapView;

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$4;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v1}, Lorg/rabochaya/projects/LocalMapView;->access$1000(Lorg/rabochaya/projects/LocalMapView;)Lorg/rabochaya/projects/OfflineTiles;

    move-result-object v1

    iget v1, v1, Lorg/rabochaya/projects/OfflineTiles;->minZoom:I

    invoke-static {v0, v1}, Lorg/rabochaya/projects/LocalMapView;->access$1102(Lorg/rabochaya/projects/LocalMapView;I)I

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$4;->this$0:Lorg/rabochaya/projects/LocalMapView;

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$4;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v1}, Lorg/rabochaya/projects/LocalMapView;->access$1000(Lorg/rabochaya/projects/LocalMapView;)Lorg/rabochaya/projects/OfflineTiles;

    move-result-object v1

    iget v1, v1, Lorg/rabochaya/projects/OfflineTiles;->maxZoom:I

    invoke-static {v0, v1}, Lorg/rabochaya/projects/LocalMapView;->access$1202(Lorg/rabochaya/projects/LocalMapView;I)I

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$4;->this$0:Lorg/rabochaya/projects/LocalMapView;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/rabochaya/projects/LocalMapView;->access$1302(Lorg/rabochaya/projects/LocalMapView;Z)Z

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$4;->this$0:Lorg/rabochaya/projects/LocalMapView;

    new-instance v1, Lorg/rabochaya/projects/LocalMapView$4$1;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/LocalMapView$4$1;-><init>(Lorg/rabochaya/projects/LocalMapView$4;)V

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/LocalMapView;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$4;->this$0:Lorg/rabochaya/projects/LocalMapView;

    new-instance v2, Lorg/rabochaya/projects/LocalMapView$4$2;

    invoke-direct {v2, p0, v0}, Lorg/rabochaya/projects/LocalMapView$4$2;-><init>(Lorg/rabochaya/projects/LocalMapView$4;Ljava/lang/Exception;)V

    invoke-virtual {v1, v2}, Lorg/rabochaya/projects/LocalMapView;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void
.end method
