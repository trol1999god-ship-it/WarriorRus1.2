.class Lorg/rabochaya/projects/LocalMapView$4$2;
.super Ljava/lang/Object;
.source "LocalMapView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/LocalMapView$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/rabochaya/projects/LocalMapView$4;

.field final synthetic val$e:Ljava/lang/Exception;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/LocalMapView$4;Ljava/lang/Exception;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 16
    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView$4$2;->this$1:Lorg/rabochaya/projects/LocalMapView$4;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapView$4$2;->val$e:Ljava/lang/Exception;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 16
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$4$2;->this$1:Lorg/rabochaya/projects/LocalMapView$4;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$4;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$000(Lorg/rabochaya/projects/LocalMapView;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$4$2;->this$1:Lorg/rabochaya/projects/LocalMapView$4;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$4;->val$listener:Lorg/rabochaya/projects/LocalMapView$Listener;

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$4$2;->val$e:Ljava/lang/Exception;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/rabochaya/projects/LocalMapView$Listener;->error(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
