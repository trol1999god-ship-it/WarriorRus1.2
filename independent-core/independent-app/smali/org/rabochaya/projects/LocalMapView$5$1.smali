.class Lorg/rabochaya/projects/LocalMapView$5$1;
.super Ljava/lang/Object;
.source "LocalMapView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/LocalMapView$5;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/rabochaya/projects/LocalMapView$5;

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$result:Landroid/graphics/Bitmap;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/LocalMapView$5;Landroid/graphics/Bitmap;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 43
    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->this$1:Lorg/rabochaya/projects/LocalMapView$5;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->val$result:Landroid/graphics/Bitmap;

    iput-object p3, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->val$message:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 43
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->this$1:Lorg/rabochaya/projects/LocalMapView$5;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$1700(Lorg/rabochaya/projects/LocalMapView;)Ljava/util/Set;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->this$1:Lorg/rabochaya/projects/LocalMapView$5;

    iget-object v1, v1, Lorg/rabochaya/projects/LocalMapView$5;->val$key:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->this$1:Lorg/rabochaya/projects/LocalMapView$5;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$000(Lorg/rabochaya/projects/LocalMapView;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->val$result:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->val$result:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->val$result:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->this$1:Lorg/rabochaya/projects/LocalMapView$5;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$1800(Lorg/rabochaya/projects/LocalMapView;)Landroid/util/LruCache;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->this$1:Lorg/rabochaya/projects/LocalMapView$5;

    iget-object v1, v1, Lorg/rabochaya/projects/LocalMapView$5;->val$key:Ljava/lang/String;

    iget-object v2, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->val$result:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, v2}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->this$1:Lorg/rabochaya/projects/LocalMapView$5;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$100(Lorg/rabochaya/projects/LocalMapView;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->this$1:Lorg/rabochaya/projects/LocalMapView$5;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$1900(Lorg/rabochaya/projects/LocalMapView;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    const/16 v1, 0x200

    if-le v0, v1, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->this$1:Lorg/rabochaya/projects/LocalMapView$5;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$1900(Lorg/rabochaya/projects/LocalMapView;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    :cond_3
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->this$1:Lorg/rabochaya/projects/LocalMapView$5;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$1900(Lorg/rabochaya/projects/LocalMapView;)Ljava/util/Set;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->this$1:Lorg/rabochaya/projects/LocalMapView$5;

    iget-object v1, v1, Lorg/rabochaya/projects/LocalMapView$5;->val$key:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_4
    :goto_0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->val$message:Ljava/lang/String;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->this$1:Lorg/rabochaya/projects/LocalMapView$5;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$2000(Lorg/rabochaya/projects/LocalMapView;)Lorg/rabochaya/projects/LocalMapView$Listener;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->val$message:Ljava/lang/String;

    invoke-interface {v0, v1}, Lorg/rabochaya/projects/LocalMapView$Listener;->error(Ljava/lang/String;)V

    :cond_5
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->this$1:Lorg/rabochaya/projects/LocalMapView$5;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->invalidate()V

    return-void
.end method
