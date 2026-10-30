.class public final synthetic Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

.field public final synthetic f$1:Landroid/app/AlertDialog;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:I

.field public final synthetic f$5:Ljava/lang/String;

.field public final synthetic f$6:Landroid/widget/EditText;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/GeometryEditorActivity;Landroid/app/AlertDialog;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Landroid/widget/EditText;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;->f$1:Landroid/app/AlertDialog;

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;->f$2:Ljava/lang/String;

    iput-object p4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;->f$3:Ljava/lang/String;

    iput p5, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;->f$4:I

    iput-object p6, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;->f$5:Ljava/lang/String;

    iput-object p7, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;->f$6:Landroid/widget/EditText;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 8

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;->f$1:Landroid/app/AlertDialog;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;->f$2:Ljava/lang/String;

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;->f$3:Ljava/lang/String;

    iget v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;->f$4:I

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;->f$5:Ljava/lang/String;

    iget-object v6, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;->f$6:Landroid/widget/EditText;

    move-object v7, p1

    invoke-virtual/range {v0 .. v7}, Lorg/rabochaya/projects/GeometryEditorActivity;->lambda$vertices$4$org-rabochaya-projects-GeometryEditorActivity(Landroid/app/AlertDialog;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Landroid/widget/EditText;Landroid/content/DialogInterface;)V

    return-void
.end method
