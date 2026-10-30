.class public final synthetic Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/OnlineMapActivity;

.field public final synthetic f$1:Lorg/rabochaya/projects/TileSource;

.field public final synthetic f$2:[Ljava/lang/String;

.field public final synthetic f$3:Lorg/rabochaya/projects/TileDownloadPlan;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/OnlineMapActivity;Lorg/rabochaya/projects/TileSource;[Ljava/lang/String;Lorg/rabochaya/projects/TileDownloadPlan;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda2;->f$0:Lorg/rabochaya/projects/OnlineMapActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda2;->f$1:Lorg/rabochaya/projects/TileSource;

    iput-object p3, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda2;->f$2:[Ljava/lang/String;

    iput-object p4, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda2;->f$3:Lorg/rabochaya/projects/TileDownloadPlan;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 6

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda2;->f$0:Lorg/rabochaya/projects/OnlineMapActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda2;->f$1:Lorg/rabochaya/projects/TileSource;

    iget-object v2, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda2;->f$2:[Ljava/lang/String;

    iget-object v3, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda2;->f$3:Lorg/rabochaya/projects/TileDownloadPlan;

    move-object v4, p1

    move v5, p2

    invoke-virtual/range {v0 .. v5}, Lorg/rabochaya/projects/OnlineMapActivity;->lambda$region$18$org-rabochaya-projects-OnlineMapActivity(Lorg/rabochaya/projects/TileSource;[Ljava/lang/String;Lorg/rabochaya/projects/TileDownloadPlan;Landroid/content/DialogInterface;I)V

    return-void
.end method
