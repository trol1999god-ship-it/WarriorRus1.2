.class Lorg/rabochaya/projects/LocalMapView$1$1;
.super Ljava/lang/Object;
.source "LocalMapView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/LocalMapView$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/rabochaya/projects/LocalMapView$1;

.field final synthetic val$decoded:Ljava/util/IdentityHashMap;

.field final synthetic val$warning:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/LocalMapView$1;Ljava/util/IdentityHashMap;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 10
    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView$1$1;->this$1:Lorg/rabochaya/projects/LocalMapView$1;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapView$1$1;->val$decoded:Ljava/util/IdentityHashMap;

    iput-object p3, p0, Lorg/rabochaya/projects/LocalMapView$1$1;->val$warning:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 10
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$1$1;->this$1:Lorg/rabochaya/projects/LocalMapView$1;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$1;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$200(Lorg/rabochaya/projects/LocalMapView;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$1$1;->val$decoded:Ljava/util/IdentityHashMap;

    invoke-virtual {v0}, Ljava/util/IdentityHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/LocalMapView$SymbolImage;

    iget-object v1, v1, Lorg/rabochaya/projects/LocalMapView$SymbolImage;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_0

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$1$1;->this$1:Lorg/rabochaya/projects/LocalMapView$1;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$1;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$400(Lorg/rabochaya/projects/LocalMapView;)Ljava/util/IdentityHashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/IdentityHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/LocalMapView$SymbolImage;

    iget-object v1, v1, Lorg/rabochaya/projects/LocalMapView$SymbolImage;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$1$1;->this$1:Lorg/rabochaya/projects/LocalMapView$1;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$1;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$400(Lorg/rabochaya/projects/LocalMapView;)Ljava/util/IdentityHashMap;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/IdentityHashMap;->clear()V

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$1$1;->this$1:Lorg/rabochaya/projects/LocalMapView$1;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$1;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$400(Lorg/rabochaya/projects/LocalMapView;)Ljava/util/IdentityHashMap;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$1$1;->val$decoded:Ljava/util/IdentityHashMap;

    invoke-virtual {v0, v1}, Ljava/util/IdentityHashMap;->putAll(Ljava/util/Map;)V

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$1$1;->this$1:Lorg/rabochaya/projects/LocalMapView$1;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$1;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->invalidate()V

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$1$1;->val$warning:Ljava/lang/String;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$1$1;->this$1:Lorg/rabochaya/projects/LocalMapView$1;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$1;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$500(Lorg/rabochaya/projects/LocalMapView;)Lorg/rabochaya/projects/LocalMapView$Listener;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041d\u0435 \u043f\u043e\u043a\u0430\u0437\u0430\u043d\u044b \u043d\u0435\u043a\u043e\u0442\u043e\u0440\u044b\u0435 \u0437\u043d\u0430\u0447\u043a\u0438: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/LocalMapView$1$1;->val$warning:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/rabochaya/projects/LocalMapView$Listener;->error(Ljava/lang/String;)V

    :cond_3
    return-void
.end method
