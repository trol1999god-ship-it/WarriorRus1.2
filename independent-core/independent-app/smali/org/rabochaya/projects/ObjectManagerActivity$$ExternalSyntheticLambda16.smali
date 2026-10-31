.class public final synthetic Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

.field public final synthetic f$1:Landroid/app/AlertDialog;

.field public final synthetic f$2:Z

.field public final synthetic f$3:Landroid/widget/EditText;

.field public final synthetic f$4:Z

.field public final synthetic f$5:Lorg/rabochaya/projects/ObjectEditorDraft;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/app/AlertDialog;ZLandroid/widget/EditText;ZLorg/rabochaya/projects/ObjectEditorDraft;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;->f$1:Landroid/app/AlertDialog;

    iput-boolean p3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;->f$2:Z

    iput-object p4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;->f$3:Landroid/widget/EditText;

    iput-boolean p5, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;->f$4:Z

    iput-object p6, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;->f$5:Lorg/rabochaya/projects/ObjectEditorDraft;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 7

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;->f$1:Landroid/app/AlertDialog;

    iget-boolean v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;->f$2:Z

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;->f$3:Landroid/widget/EditText;

    iget-boolean v4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;->f$4:Z

    iget-object v5, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;->f$5:Lorg/rabochaya/projects/ObjectEditorDraft;

    move-object v6, p1

    invoke-virtual/range {v0 .. v6}, Lorg/rabochaya/projects/ObjectManagerActivity;->lambda$openEditor$34$org-rabochaya-projects-ObjectManagerActivity(Landroid/app/AlertDialog;ZLandroid/widget/EditText;ZLorg/rabochaya/projects/ObjectEditorDraft;Landroid/content/DialogInterface;)V

    return-void
.end method
