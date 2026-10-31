.class public final synthetic Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Lorg/rabochaya/projects/ObjectConfirmationDraft;

.field public final synthetic f$3:Landroid/app/AlertDialog;

.field public final synthetic f$4:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity;ZLorg/rabochaya/projects/ObjectConfirmationDraft;Landroid/app/AlertDialog;Ljava/util/List;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iput-boolean p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$1:Z

    iput-object p3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$2:Lorg/rabochaya/projects/ObjectConfirmationDraft;

    iput-object p4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$3:Landroid/app/AlertDialog;

    iput-object p5, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$4:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iget-boolean v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$1:Z

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$2:Lorg/rabochaya/projects/ObjectConfirmationDraft;

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$3:Landroid/app/AlertDialog;

    iget-object v4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;->f$4:Ljava/util/List;

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lorg/rabochaya/projects/ObjectManagerActivity;->lambda$openConfirmation$42$org-rabochaya-projects-ObjectManagerActivity(ZLorg/rabochaya/projects/ObjectConfirmationDraft;Landroid/app/AlertDialog;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method
