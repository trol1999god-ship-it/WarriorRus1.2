.class public final synthetic Lorg/rabochaya/projects/GeometryMapCanvas$Overlay$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

.field public final synthetic f$1:I

.field public final synthetic f$2:[D


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;I[D)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay$$ExternalSyntheticLambda1;->f$0:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    iput p2, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay$$ExternalSyntheticLambda1;->f$1:I

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay$$ExternalSyntheticLambda1;->f$2:[D

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay$$ExternalSyntheticLambda1;->f$0:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    iget v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay$$ExternalSyntheticLambda1;->f$1:I

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay$$ExternalSyntheticLambda1;->f$2:[D

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->lambda$onTouchEvent$1$org-rabochaya-projects-GeometryMapCanvas$Overlay(I[D)V

    return-void
.end method
