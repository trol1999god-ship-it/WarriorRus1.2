.class public final synthetic Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda14;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/MapLayersActivity;

.field public final synthetic f$1:Landroid/app/AlertDialog;

.field public final synthetic f$2:Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

.field public final synthetic f$3:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

.field public final synthetic f$4:Landroid/widget/EditText;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/MapLayersActivity;Landroid/app/AlertDialog;Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Landroid/widget/EditText;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda14;->f$0:Lorg/rabochaya/projects/MapLayersActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda14;->f$1:Landroid/app/AlertDialog;

    iput-object p3, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda14;->f$2:Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

    iput-object p4, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda14;->f$3:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    iput-object p5, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda14;->f$4:Landroid/widget/EditText;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 6

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda14;->f$0:Lorg/rabochaya/projects/MapLayersActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda14;->f$1:Landroid/app/AlertDialog;

    iget-object v2, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda14;->f$2:Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

    iget-object v3, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda14;->f$3:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    iget-object v4, p0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda14;->f$4:Landroid/widget/EditText;

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lorg/rabochaya/projects/MapLayersActivity;->lambda$savePreset$10$org-rabochaya-projects-MapLayersActivity(Landroid/app/AlertDialog;Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Landroid/widget/EditText;Landroid/content/DialogInterface;)V

    return-void
.end method
