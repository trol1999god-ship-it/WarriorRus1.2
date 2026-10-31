.class public final synthetic Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda27;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Ljava/util/List;

.field public final synthetic f$3:Lorg/rabochaya/projects/ObjectMoveDraft;

.field public final synthetic f$4:Landroid/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity;ZLjava/util/List;Lorg/rabochaya/projects/ObjectMoveDraft;Landroid/app/AlertDialog;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda27;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iput-boolean p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda27;->f$1:Z

    iput-object p3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda27;->f$2:Ljava/util/List;

    iput-object p4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda27;->f$3:Lorg/rabochaya/projects/ObjectMoveDraft;

    iput-object p5, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda27;->f$4:Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda27;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iget-boolean v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda27;->f$1:Z

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda27;->f$2:Ljava/util/List;

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda27;->f$3:Lorg/rabochaya/projects/ObjectMoveDraft;

    iget-object v4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda27;->f$4:Landroid/app/AlertDialog;

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lorg/rabochaya/projects/ObjectManagerActivity;->lambda$openMove$39$org-rabochaya-projects-ObjectManagerActivity(ZLjava/util/List;Lorg/rabochaya/projects/ObjectMoveDraft;Landroid/app/AlertDialog;Landroid/view/View;)V

    return-void
.end method
