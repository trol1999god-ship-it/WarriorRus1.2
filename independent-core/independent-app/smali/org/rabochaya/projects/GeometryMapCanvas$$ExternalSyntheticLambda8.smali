.class public final synthetic Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/GeometryMapCanvas;

.field public final synthetic f$1:Lorg/rabochaya/projects/GeometryMapState;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/GeometryMapCanvas;Lorg/rabochaya/projects/GeometryMapState;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda8;->f$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda8;->f$1:Lorg/rabochaya/projects/GeometryMapState;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda8;->f$0:Lorg/rabochaya/projects/GeometryMapCanvas;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda8;->f$1:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/GeometryMapCanvas;->lambda$new$7$org-rabochaya-projects-GeometryMapCanvas(Lorg/rabochaya/projects/GeometryMapState;)V

    return-void
.end method
