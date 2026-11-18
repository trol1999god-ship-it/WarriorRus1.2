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


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/LocalMapView$5;)V
    .locals 0

    .line 28
    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->this$1:Lorg/rabochaya/projects/LocalMapView$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 28
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->this$1:Lorg/rabochaya/projects/LocalMapView$5;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$200(Lorg/rabochaya/projects/LocalMapView;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$5$1;->this$1:Lorg/rabochaya/projects/LocalMapView$5;

    iget-object v0, v0, Lorg/rabochaya/projects/LocalMapView$5;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->invalidate()V

    :cond_0
    return-void
.end method
