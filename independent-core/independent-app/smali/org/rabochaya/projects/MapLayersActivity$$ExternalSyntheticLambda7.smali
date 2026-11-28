.class public final synthetic Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/MapLayersActivity;

.field public final synthetic f$1:Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

.field public final synthetic f$2:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

.field public final synthetic f$3:Lorg/rabochaya/projects/MapCompositionPresets$Entry;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/MapLayersActivity;Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Lorg/rabochaya/projects/MapCompositionPresets$Entry;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda7;->f$0:Lorg/rabochaya/projects/MapLayersActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda7;->f$1:Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

    iput-object p3, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda7;->f$2:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    iput-object p4, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda7;->f$3:Lorg/rabochaya/projects/MapCompositionPresets$Entry;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 6

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda7;->f$0:Lorg/rabochaya/projects/MapLayersActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda7;->f$1:Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

    iget-object v2, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda7;->f$2:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    iget-object v3, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda7;->f$3:Lorg/rabochaya/projects/MapCompositionPresets$Entry;

    move-object v4, p1

    move v5, p2

    invoke-virtual/range {v0 .. v5}, Lorg/rabochaya/projects/MapLayersActivity;->lambda$presetActions$11$org-rabochaya-projects-MapLayersActivity(Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Lorg/rabochaya/projects/MapCompositionPresets$Entry;Landroid/content/DialogInterface;I)V

    return-void
.end method
