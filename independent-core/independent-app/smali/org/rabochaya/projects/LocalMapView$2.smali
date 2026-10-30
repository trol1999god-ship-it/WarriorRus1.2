.class Lorg/rabochaya/projects/LocalMapView$2;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "LocalMapView.java"


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


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/LocalMapView;Lorg/rabochaya/projects/LocalMapView$Listener;)V
    .locals 0

    .line 13
    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView$2;->this$0:Lorg/rabochaya/projects/LocalMapView;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapView$2;->val$listener:Lorg/rabochaya/projects/LocalMapView$Listener;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 13
    const/4 p1, 0x1

    return p1
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 11

    .line 13
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$2;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$000(Lorg/rabochaya/projects/LocalMapView;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$2;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$100(Lorg/rabochaya/projects/LocalMapView;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$2;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$200(Lorg/rabochaya/projects/LocalMapView;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$2;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0}, Lorg/rabochaya/projects/LocalMapView;->access$300(Lorg/rabochaya/projects/LocalMapView;)Ljava/util/ArrayList;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$2;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v0, v1}, Lorg/rabochaya/projects/LocalMapView;->access$402(Lorg/rabochaya/projects/LocalMapView;Z)Z

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$2;->val$listener:Lorg/rabochaya/projects/LocalMapView$Listener;

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$2;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v1}, Lorg/rabochaya/projects/LocalMapView;->access$500(Lorg/rabochaya/projects/LocalMapView;)D

    move-result-wide v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    float-to-double v3, v3

    iget-object v5, p0, Lorg/rabochaya/projects/LocalMapView$2;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v5}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v5

    int-to-double v5, v5

    const-wide/high16 v7, 0x4000000000000000L    # 2.0

    div-double/2addr v5, v7

    sub-double/2addr v3, v5

    iget-object v5, p0, Lorg/rabochaya/projects/LocalMapView$2;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v5}, Lorg/rabochaya/projects/LocalMapView;->access$600(Lorg/rabochaya/projects/LocalMapView;)D

    move-result-wide v5

    div-double/2addr v3, v5

    add-double/2addr v1, v3

    invoke-static {v1, v2}, Lorg/rabochaya/projects/MapMath;->lat(D)D

    move-result-wide v1

    iget-object v3, p0, Lorg/rabochaya/projects/LocalMapView$2;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v3}, Lorg/rabochaya/projects/LocalMapView;->access$700(Lorg/rabochaya/projects/LocalMapView;)D

    move-result-wide v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    float-to-double v5, p1

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapView$2;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {p1}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result p1

    int-to-double v9, p1

    div-double/2addr v9, v7

    sub-double/2addr v5, v9

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapView$2;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {p1}, Lorg/rabochaya/projects/LocalMapView;->access$600(Lorg/rabochaya/projects/LocalMapView;)D

    move-result-wide v7

    div-double/2addr v5, v7

    add-double/2addr v3, v5

    invoke-static {v3, v4}, Lorg/rabochaya/projects/MapMath;->lon(D)D

    move-result-wide v3

    invoke-interface {v0, v1, v2, v3, v4}, Lorg/rabochaya/projects/LocalMapView$Listener;->longPressed(DD)V

    :cond_0
    return-void
.end method
