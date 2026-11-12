.class public final synthetic Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda24;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/MapLayersActivity;

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/MapLayersActivity;I)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda24;->f$0:Lorg/rabochaya/projects/MapLayersActivity;

    iput p2, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda24;->f$1:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda24;->f$0:Lorg/rabochaya/projects/MapLayersActivity;

    iget v1, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda24;->f$1:I

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/MapLayersActivity;->lambda$show$6$org-rabochaya-projects-MapLayersActivity(I)V

    return-void
.end method
