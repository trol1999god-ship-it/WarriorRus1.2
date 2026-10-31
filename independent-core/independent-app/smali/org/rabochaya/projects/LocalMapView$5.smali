.class Lorg/rabochaya/projects/LocalMapView$5;
.super Ljava/lang/Object;
.source "LocalMapView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/LocalMapView;->request(Ljava/lang/String;IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/LocalMapView;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$layer:I

.field final synthetic val$x:I

.field final synthetic val$y:I

.field final synthetic val$z:I


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/LocalMapView;IIIILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 43
    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    iput p2, p0, Lorg/rabochaya/projects/LocalMapView$5;->val$layer:I

    iput p3, p0, Lorg/rabochaya/projects/LocalMapView$5;->val$z:I

    iput p4, p0, Lorg/rabochaya/projects/LocalMapView$5;->val$x:I

    iput p5, p0, Lorg/rabochaya/projects/LocalMapView$5;->val$y:I

    iput-object p6, p0, Lorg/rabochaya/projects/LocalMapView$5;->val$key:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 43
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v1}, Lorg/rabochaya/projects/LocalMapView;->access$000(Lorg/rabochaya/projects/LocalMapView;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v1}, Lorg/rabochaya/projects/LocalMapView;->access$100(Lorg/rabochaya/projects/LocalMapView;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v1}, Lorg/rabochaya/projects/LocalMapView;->access$1400(Lorg/rabochaya/projects/LocalMapView;)[Lorg/rabochaya/projects/OnlineTiles;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v1}, Lorg/rabochaya/projects/LocalMapView;->access$1400(Lorg/rabochaya/projects/LocalMapView;)[Lorg/rabochaya/projects/OnlineTiles;

    move-result-object v1

    iget v2, p0, Lorg/rabochaya/projects/LocalMapView$5;->val$layer:I

    aget-object v1, v1, v2

    iget v2, p0, Lorg/rabochaya/projects/LocalMapView$5;->val$z:I

    iget v3, p0, Lorg/rabochaya/projects/LocalMapView$5;->val$x:I

    iget v4, p0, Lorg/rabochaya/projects/LocalMapView$5;->val$y:I

    iget-object v5, p0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v5}, Lorg/rabochaya/projects/LocalMapView;->access$1500(Lorg/rabochaya/projects/LocalMapView;)Z

    move-result v5

    invoke-virtual {v1, v2, v3, v4, v5}, Lorg/rabochaya/projects/OnlineTiles;->tile(IIIZ)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v1}, Lorg/rabochaya/projects/LocalMapView;->access$1000(Lorg/rabochaya/projects/LocalMapView;)Lorg/rabochaya/projects/OfflineTiles;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v1}, Lorg/rabochaya/projects/LocalMapView;->access$1000(Lorg/rabochaya/projects/LocalMapView;)Lorg/rabochaya/projects/OfflineTiles;

    move-result-object v1

    iget v2, p0, Lorg/rabochaya/projects/LocalMapView$5;->val$z:I

    iget v3, p0, Lorg/rabochaya/projects/LocalMapView$5;->val$x:I

    iget v4, p0, Lorg/rabochaya/projects/LocalMapView$5;->val$y:I

    invoke-virtual {v1, v2, v3, v4}, Lorg/rabochaya/projects/OfflineTiles;->tile(III)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v1}, Lorg/rabochaya/projects/LocalMapView;->access$1600(Lorg/rabochaya/projects/LocalMapView;)Lorg/rabochaya/projects/BundledTiles;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v1}, Lorg/rabochaya/projects/LocalMapView;->access$1600(Lorg/rabochaya/projects/LocalMapView;)Lorg/rabochaya/projects/BundledTiles;

    move-result-object v1

    iget v2, p0, Lorg/rabochaya/projects/LocalMapView$5;->val$z:I

    iget v3, p0, Lorg/rabochaya/projects/LocalMapView$5;->val$x:I

    iget v4, p0, Lorg/rabochaya/projects/LocalMapView$5;->val$y:I

    invoke-virtual {v1, v2, v3, v4}, Lorg/rabochaya/projects/BundledTiles;->tile(III)Landroid/graphics/Bitmap;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_2
    move-object v1, v0

    :goto_0
    move-object v6, v1

    move-object v1, v0

    move-object v0, v6

    goto :goto_1

    :catch_0
    move-exception v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u041e\u0448\u0438\u0431\u043a\u0430 \u0447\u0442\u0435\u043d\u0438\u044f \u0442\u0430\u0439\u043b\u0430: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_1
    iget-object v2, p0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    new-instance v3, Lorg/rabochaya/projects/LocalMapView$5$1;

    invoke-direct {v3, p0, v0, v1}, Lorg/rabochaya/projects/LocalMapView$5$1;-><init>(Lorg/rabochaya/projects/LocalMapView$5;Landroid/graphics/Bitmap;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lorg/rabochaya/projects/LocalMapView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
