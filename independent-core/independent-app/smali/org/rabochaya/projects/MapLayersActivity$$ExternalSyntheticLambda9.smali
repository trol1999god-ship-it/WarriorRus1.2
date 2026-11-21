.class public final synthetic Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/MapLayersActivity;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

.field public final synthetic f$3:Lorg/rabochaya/projects/MapCompositionPresets$Entry;

.field public final synthetic f$4:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/MapLayersActivity;ZLorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionPresets$Entry;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda9;->f$0:Lorg/rabochaya/projects/MapLayersActivity;

    iput-boolean p2, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda9;->f$1:Z

    iput-object p3, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda9;->f$2:Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

    iput-object p4, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda9;->f$3:Lorg/rabochaya/projects/MapCompositionPresets$Entry;

    iput-object p5, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda9;->f$4:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 7

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda9;->f$0:Lorg/rabochaya/projects/MapLayersActivity;

    iget-boolean v1, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda9;->f$1:Z

    iget-object v2, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda9;->f$2:Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

    iget-object v3, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda9;->f$3:Lorg/rabochaya/projects/MapCompositionPresets$Entry;

    iget-object v4, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda9;->f$4:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    move-object v5, p1

    move v6, p2

    invoke-virtual/range {v0 .. v6}, Lorg/rabochaya/projects/MapLayersActivity;->lambda$confirmPreset$12$org-rabochaya-projects-MapLayersActivity(ZLorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionPresets$Entry;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Landroid/content/DialogInterface;I)V

    return-void
.end method
