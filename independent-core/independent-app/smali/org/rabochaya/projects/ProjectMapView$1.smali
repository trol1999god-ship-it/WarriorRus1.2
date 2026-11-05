.class Lorg/rabochaya/projects/ProjectMapView$1;
.super Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;
.source "ProjectMapView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectMapView;-><init>(Landroid/content/Context;Ljava/util/List;Lorg/rabochaya/projects/ProjectMapView$Pick;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ProjectMapView;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectMapView;)V
    .locals 0

    .line 26
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectMapView$1;->this$0:Lorg/rabochaya/projects/ProjectMapView;

    invoke-direct {p0}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 6

    .line 27
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectMapView$1;->this$0:Lorg/rabochaya/projects/ProjectMapView;

    iget v0, v0, Lorg/rabochaya/projects/ProjectMapView;->zoom:F

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectMapView$1;->this$0:Lorg/rabochaya/projects/ProjectMapView;

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectMapView$1;->this$0:Lorg/rabochaya/projects/ProjectMapView;

    iget v2, v2, Lorg/rabochaya/projects/ProjectMapView;->zoom:F

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v3

    mul-float/2addr v2, v3

    const v3, 0x461c4000    # 10000.0f

    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    const/high16 v3, 0x3e800000    # 0.25f

    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, v1, Lorg/rabochaya/projects/ProjectMapView;->zoom:F

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectMapView$1;->this$0:Lorg/rabochaya/projects/ProjectMapView;

    iget v1, v1, Lorg/rabochaya/projects/ProjectMapView;->zoom:F

    div-float/2addr v1, v0

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectMapView$1;->this$0:Lorg/rabochaya/projects/ProjectMapView;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v3

    iget-object v4, p0, Lorg/rabochaya/projects/ProjectMapView$1;->this$0:Lorg/rabochaya/projects/ProjectMapView;

    iget v4, v4, Lorg/rabochaya/projects/ProjectMapView;->dx:F

    sub-float/2addr v3, v4

    iget-object v4, p0, Lorg/rabochaya/projects/ProjectMapView$1;->this$0:Lorg/rabochaya/projects/ProjectMapView;

    invoke-virtual {v4}, Lorg/rabochaya/projects/ProjectMapView;->getWidth()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    sub-float/2addr v3, v4

    mul-float/2addr v3, v1

    sub-float/2addr v2, v3

    iget-object v3, p0, Lorg/rabochaya/projects/ProjectMapView$1;->this$0:Lorg/rabochaya/projects/ProjectMapView;

    invoke-virtual {v3}, Lorg/rabochaya/projects/ProjectMapView;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v5

    sub-float/2addr v2, v3

    iput v2, v0, Lorg/rabochaya/projects/ProjectMapView;->dx:F

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectMapView$1;->this$0:Lorg/rabochaya/projects/ProjectMapView;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result p1

    iget-object v3, p0, Lorg/rabochaya/projects/ProjectMapView$1;->this$0:Lorg/rabochaya/projects/ProjectMapView;

    iget v3, v3, Lorg/rabochaya/projects/ProjectMapView;->dy:F

    sub-float/2addr p1, v3

    iget-object v3, p0, Lorg/rabochaya/projects/ProjectMapView$1;->this$0:Lorg/rabochaya/projects/ProjectMapView;

    invoke-virtual {v3}, Lorg/rabochaya/projects/ProjectMapView;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v5

    sub-float/2addr p1, v3

    mul-float/2addr p1, v1

    sub-float/2addr v2, p1

    iget-object p1, p0, Lorg/rabochaya/projects/ProjectMapView$1;->this$0:Lorg/rabochaya/projects/ProjectMapView;

    invoke-virtual {p1}, Lorg/rabochaya/projects/ProjectMapView;->getHeight()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p1, v5

    sub-float/2addr v2, p1

    iput v2, v0, Lorg/rabochaya/projects/ProjectMapView;->dy:F

    iget-object p1, p0, Lorg/rabochaya/projects/ProjectMapView$1;->this$0:Lorg/rabochaya/projects/ProjectMapView;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lorg/rabochaya/projects/ProjectMapView;->moved:Z

    iget-object p1, p0, Lorg/rabochaya/projects/ProjectMapView$1;->this$0:Lorg/rabochaya/projects/ProjectMapView;

    invoke-virtual {p1}, Lorg/rabochaya/projects/ProjectMapView;->invalidate()V

    return v0
.end method
