.class public final synthetic Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/CompositionDownloadActivity;

.field public final synthetic f$1:I

.field public final synthetic f$2:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/CompositionDownloadActivity;ILorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda6;->f$0:Lorg/rabochaya/projects/CompositionDownloadActivity;

    iput p2, p0, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda6;->f$1:I

    iput-object p3, p0, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda6;->f$2:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda6;->f$0:Lorg/rabochaya/projects/CompositionDownloadActivity;

    iget v1, p0, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda6;->f$1:I

    iget-object v2, p0, Lorg/rabochaya/projects/CompositionDownloadActivity$$ExternalSyntheticLambda6;->f$2:Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/CompositionDownloadActivity;->lambda$download$8$org-rabochaya-projects-CompositionDownloadActivity(ILorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;)V

    return-void
.end method
