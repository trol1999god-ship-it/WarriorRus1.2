.class public final synthetic Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda47;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

.field public final synthetic f$1:Landroid/app/AlertDialog;

.field public final synthetic f$2:Z

.field public final synthetic f$3:Ljava/util/List;

.field public final synthetic f$4:Lorg/rabochaya/projects/ObjectMoveDraft;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/app/AlertDialog;ZLjava/util/List;Lorg/rabochaya/projects/ObjectMoveDraft;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda47;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda47;->f$1:Landroid/app/AlertDialog;

    iput-boolean p3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda47;->f$2:Z

    iput-object p4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda47;->f$3:Ljava/util/List;

    iput-object p5, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda47;->f$4:Lorg/rabochaya/projects/ObjectMoveDraft;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 6

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda47;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda47;->f$1:Landroid/app/AlertDialog;

    iget-boolean v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda47;->f$2:Z

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda47;->f$3:Ljava/util/List;

    iget-object v4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda47;->f$4:Lorg/rabochaya/projects/ObjectMoveDraft;

    move-object v5, p1

    invoke-virtual/range {v0 .. v5}, Lorg/rabochaya/projects/ObjectManagerActivity;->lambda$openMove$40$org-rabochaya-projects-ObjectManagerActivity(Landroid/app/AlertDialog;ZLjava/util/List;Lorg/rabochaya/projects/ObjectMoveDraft;Landroid/content/DialogInterface;)V

    return-void
.end method
