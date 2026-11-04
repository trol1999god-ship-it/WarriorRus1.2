.class public final synthetic Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

.field public final synthetic f$1:Lorg/rabochaya/projects/VertexEditDraft;

.field public final synthetic f$2:Landroid/widget/TextView;

.field public final synthetic f$3:Landroid/app/AlertDialog;

.field public final synthetic f$4:Landroid/widget/EditText;

.field public final synthetic f$5:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/GeometryEditorActivity;Lorg/rabochaya/projects/VertexEditDraft;Landroid/widget/TextView;Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/TextView;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$1:Lorg/rabochaya/projects/VertexEditDraft;

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$2:Landroid/widget/TextView;

    iput-object p4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$3:Landroid/app/AlertDialog;

    iput-object p5, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$4:Landroid/widget/EditText;

    iput-object p6, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$5:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 7

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$1:Lorg/rabochaya/projects/VertexEditDraft;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$2:Landroid/widget/TextView;

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$3:Landroid/app/AlertDialog;

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$4:Landroid/widget/EditText;

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$5:Landroid/widget/TextView;

    move-object v6, p1

    invoke-virtual/range {v0 .. v6}, Lorg/rabochaya/projects/GeometryEditorActivity;->lambda$openVertexEditor$14$org-rabochaya-projects-GeometryEditorActivity(Lorg/rabochaya/projects/VertexEditDraft;Landroid/widget/TextView;Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/TextView;Landroid/view/View;)V

    return-void
.end method
