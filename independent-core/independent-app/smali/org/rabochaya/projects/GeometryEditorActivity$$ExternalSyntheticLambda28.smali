.class public final synthetic Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda28;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

.field public final synthetic f$1:Landroid/app/AlertDialog;

.field public final synthetic f$2:Landroid/widget/TextView;

.field public final synthetic f$3:Landroid/widget/EditText;

.field public final synthetic f$4:Lorg/rabochaya/projects/VertexEditDraft;

.field public final synthetic f$5:Landroid/widget/TextView;

.field public final synthetic f$6:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/GeometryEditorActivity;Landroid/app/AlertDialog;Landroid/widget/TextView;Landroid/widget/EditText;Lorg/rabochaya/projects/VertexEditDraft;Landroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda28;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda28;->f$1:Landroid/app/AlertDialog;

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda28;->f$2:Landroid/widget/TextView;

    iput-object p4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda28;->f$3:Landroid/widget/EditText;

    iput-object p5, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda28;->f$4:Lorg/rabochaya/projects/VertexEditDraft;

    iput-object p6, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda28;->f$5:Landroid/widget/TextView;

    iput-object p7, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda28;->f$6:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 8

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda28;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda28;->f$1:Landroid/app/AlertDialog;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda28;->f$2:Landroid/widget/TextView;

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda28;->f$3:Landroid/widget/EditText;

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda28;->f$4:Lorg/rabochaya/projects/VertexEditDraft;

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda28;->f$5:Landroid/widget/TextView;

    iget-object v6, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda28;->f$6:Landroid/widget/TextView;

    move-object v7, p1

    invoke-virtual/range {v0 .. v7}, Lorg/rabochaya/projects/GeometryEditorActivity;->lambda$openVertexEditor$25$org-rabochaya-projects-GeometryEditorActivity(Landroid/app/AlertDialog;Landroid/widget/TextView;Landroid/widget/EditText;Lorg/rabochaya/projects/VertexEditDraft;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/content/DialogInterface;)V

    return-void
.end method
