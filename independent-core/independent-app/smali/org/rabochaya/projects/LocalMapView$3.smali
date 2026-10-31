.class Lorg/rabochaya/projects/LocalMapView$3;
.super Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;
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


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/LocalMapView;)V
    .locals 0

    .line 14
    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView$3;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-direct {p0}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 5

    .line 14
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$3;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v1

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->log(D)D

    move-result-wide v1

    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    invoke-static {v3, v4}, Ljava/lang/Math;->log(D)D

    move-result-wide v3

    div-double/2addr v1, v3

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result p1

    invoke-static {v0, v1, v2, v3, p1}, Lorg/rabochaya/projects/LocalMapView;->access$800(Lorg/rabochaya/projects/LocalMapView;DFF)V

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapView$3;->this$0:Lorg/rabochaya/projects/LocalMapView;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lorg/rabochaya/projects/LocalMapView;->access$202(Lorg/rabochaya/projects/LocalMapView;Z)Z

    return v0
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 0

    .line 14
    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapView$3;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {p1}, Lorg/rabochaya/projects/LocalMapView;->access$900(Lorg/rabochaya/projects/LocalMapView;)V

    return-void
.end method
