.class public final synthetic Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;
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

.field public final synthetic f$6:Z


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/app/AlertDialog;ZLandroid/widget/EditText;ZLorg/rabochaya/projects/ObjectEditorDraft;Z)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$1:Landroid/app/AlertDialog;

    iput-boolean p3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$2:Z

    iput-object p4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$3:Landroid/widget/EditText;

    iput-boolean p5, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$4:Z

    iput-object p6, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$5:Lorg/rabochaya/projects/ObjectEditorDraft;

    iput-boolean p7, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$6:Z

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 8

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$1:Landroid/app/AlertDialog;

    iget-boolean v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$2:Z

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$3:Landroid/widget/EditText;

    iget-boolean v4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$4:Z

    iget-object v5, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$5:Lorg/rabochaya/projects/ObjectEditorDraft;

    iget-boolean v6, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$6:Z

    move-object v7, p1

    invoke-virtual/range {v0 .. v7}, Lorg/rabochaya/projects/ObjectManagerActivity;->lambda$openEditor$36$org-rabochaya-projects-ObjectManagerActivity(Landroid/app/AlertDialog;ZLandroid/widget/EditText;ZLorg/rabochaya/projects/ObjectEditorDraft;ZLandroid/content/DialogInterface;)V

    return-void
.end method
