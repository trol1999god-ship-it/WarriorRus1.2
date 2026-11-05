.class public final synthetic Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/MapLayersActivity;

.field public final synthetic f$1:Lorg/rabochaya/projects/MapComposition$Layer;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/MapLayersActivity;Lorg/rabochaya/projects/MapComposition$Layer;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda9;->f$0:Lorg/rabochaya/projects/MapLayersActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda9;->f$1:Lorg/rabochaya/projects/MapComposition$Layer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda9;->f$0:Lorg/rabochaya/projects/MapLayersActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda9;->f$1:Lorg/rabochaya/projects/MapComposition$Layer;

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/MapLayersActivity;->lambda$row$15$org-rabochaya-projects-MapLayersActivity(Lorg/rabochaya/projects/MapComposition$Layer;)V

    return-void
.end method
