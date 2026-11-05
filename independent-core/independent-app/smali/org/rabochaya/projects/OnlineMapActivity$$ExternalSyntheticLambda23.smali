.class public final synthetic Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda23;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/OnlineMapActivity;

.field public final synthetic f$1:Lorg/rabochaya/projects/TileDownloadPlan;

.field public final synthetic f$2:Landroid/widget/ProgressBar;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/OnlineMapActivity;Lorg/rabochaya/projects/TileDownloadPlan;Landroid/widget/ProgressBar;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda23;->f$0:Lorg/rabochaya/projects/OnlineMapActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda23;->f$1:Lorg/rabochaya/projects/TileDownloadPlan;

    iput-object p3, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda23;->f$2:Landroid/widget/ProgressBar;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda23;->f$0:Lorg/rabochaya/projects/OnlineMapActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda23;->f$1:Lorg/rabochaya/projects/TileDownloadPlan;

    iget-object v2, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda23;->f$2:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/OnlineMapActivity;->lambda$download$24$org-rabochaya-projects-OnlineMapActivity(Lorg/rabochaya/projects/TileDownloadPlan;Landroid/widget/ProgressBar;)V

    return-void
.end method
