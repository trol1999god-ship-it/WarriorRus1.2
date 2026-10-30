.class public final synthetic Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/GeometryMapCanvas;

.field public final synthetic f$1:Lorg/rabochaya/projects/GeometryMapState;

.field public final synthetic f$2:Lorg/rabochaya/projects/GeometryMapCanvas$Listener;

.field public final synthetic f$3:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/GeometryMapCanvas;Lorg/rabochaya/projects/GeometryMapState;Lorg/rabochaya/projects/GeometryMapCanvas$Listener;Landroid/app/Activity;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda7;->f$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda7;->f$1:Lorg/rabochaya/projects/GeometryMapState;

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda7;->f$2:Lorg/rabochaya/projects/GeometryMapCanvas$Listener;

    iput-object p4, p0, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda7;->f$3:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda7;->f$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda7;->f$1:Lorg/rabochaya/projects/GeometryMapState;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda7;->f$2:Lorg/rabochaya/projects/GeometryMapCanvas$Listener;

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda7;->f$3:Landroid/app/Activity;

    invoke-virtual {v0, v1, v2, v3}, Lorg/rabochaya/projects/GeometryMapCanvas;->lambda$new$5$org-rabochaya-projects-GeometryMapCanvas(Lorg/rabochaya/projects/GeometryMapState;Lorg/rabochaya/projects/GeometryMapCanvas$Listener;Landroid/app/Activity;)V

    return-void
.end method
