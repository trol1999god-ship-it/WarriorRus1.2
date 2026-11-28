.class public final synthetic Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda20;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/OnlineMapActivity;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:I

.field public final synthetic f$3:Lorg/rabochaya/projects/TileDownloadPlan;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/OnlineMapActivity;Ljava/lang/String;ILorg/rabochaya/projects/TileDownloadPlan;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda20;->f$0:Lorg/rabochaya/projects/OnlineMapActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda20;->f$1:Ljava/lang/String;

    iput p3, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda20;->f$2:I

    iput-object p4, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda20;->f$3:Lorg/rabochaya/projects/TileDownloadPlan;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda20;->f$0:Lorg/rabochaya/projects/OnlineMapActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda20;->f$1:Ljava/lang/String;

    iget v2, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda20;->f$2:I

    iget-object v3, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda20;->f$3:Lorg/rabochaya/projects/TileDownloadPlan;

    invoke-virtual {v0, v1, v2, v3}, Lorg/rabochaya/projects/OnlineMapActivity;->lambda$download$23$org-rabochaya-projects-OnlineMapActivity(Ljava/lang/String;ILorg/rabochaya/projects/TileDownloadPlan;)V

    return-void
.end method
