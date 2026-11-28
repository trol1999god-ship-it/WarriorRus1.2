.class public final synthetic Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/MapLayersActivity;

.field public final synthetic f$1:Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

.field public final synthetic f$2:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/MapLayersActivity;Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda0;->f$0:Lorg/rabochaya/projects/MapLayersActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda0;->f$1:Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

    iput-object p3, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda0;->f$2:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda0;->f$0:Lorg/rabochaya/projects/MapLayersActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda0;->f$1:Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

    iget-object v2, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda0;->f$2:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    invoke-virtual {v0, v1, v2, p1, p2}, Lorg/rabochaya/projects/MapLayersActivity;->lambda$presets$8$org-rabochaya-projects-MapLayersActivity(Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Landroid/content/DialogInterface;I)V

    return-void
.end method
