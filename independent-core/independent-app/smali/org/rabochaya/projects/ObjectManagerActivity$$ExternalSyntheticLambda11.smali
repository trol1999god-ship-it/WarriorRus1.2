.class public final synthetic Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Landroid/widget/EditText;

.field public final synthetic f$3:Z

.field public final synthetic f$4:Lorg/rabochaya/projects/ObjectEditorDraft;

.field public final synthetic f$5:Z

.field public final synthetic f$6:Landroid/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity;ZLandroid/widget/EditText;ZLorg/rabochaya/projects/ObjectEditorDraft;ZLandroid/app/AlertDialog;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iput-boolean p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$1:Z

    iput-object p3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$2:Landroid/widget/EditText;

    iput-boolean p4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$3:Z

    iput-object p5, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$4:Lorg/rabochaya/projects/ObjectEditorDraft;

    iput-boolean p6, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$5:Z

    iput-object p7, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$6:Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 8

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iget-boolean v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$1:Z

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$2:Landroid/widget/EditText;

    iget-boolean v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$3:Z

    iget-object v4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$4:Lorg/rabochaya/projects/ObjectEditorDraft;

    iget-boolean v5, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$5:Z

    iget-object v6, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$6:Landroid/app/AlertDialog;

    move-object v7, p1

    invoke-virtual/range {v0 .. v7}, Lorg/rabochaya/projects/ObjectManagerActivity;->lambda$openEditor$35$org-rabochaya-projects-ObjectManagerActivity(ZLandroid/widget/EditText;ZLorg/rabochaya/projects/ObjectEditorDraft;ZLandroid/app/AlertDialog;Landroid/view/View;)V

    return-void
.end method
