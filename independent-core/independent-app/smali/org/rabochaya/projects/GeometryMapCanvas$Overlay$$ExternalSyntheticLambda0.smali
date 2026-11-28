.class public final synthetic Lorg/rabochaya/projects/GeometryMapCanvas$Overlay$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

.field public final synthetic f$1:[D


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;[D)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay$$ExternalSyntheticLambda0;->f$0:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay$$ExternalSyntheticLambda0;->f$1:[D

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay$$ExternalSyntheticLambda0;->f$0:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay$$ExternalSyntheticLambda0;->f$1:[D

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->lambda$onTouchEvent$0$org-rabochaya-projects-GeometryMapCanvas$Overlay([D)V

    return-void
.end method
