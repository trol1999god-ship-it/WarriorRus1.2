.class public final synthetic Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

.field public final synthetic f$1:Landroid/app/AlertDialog;

.field public final synthetic f$2:Z

.field public final synthetic f$3:I

.field public final synthetic f$4:I

.field public final synthetic f$5:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/app/AlertDialog;ZIILjava/util/List;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$1:Landroid/app/AlertDialog;

    iput-boolean p3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$2:Z

    iput p4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$3:I

    iput p5, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$4:I

    iput-object p6, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$5:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 7

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$1:Landroid/app/AlertDialog;

    iget-boolean v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$2:Z

    iget v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$3:I

    iget v4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$4:I

    iget-object v5, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;->f$5:Ljava/util/List;

    move-object v6, p1

    invoke-virtual/range {v0 .. v6}, Lorg/rabochaya/projects/ObjectManagerActivity;->lambda$openChooser$38$org-rabochaya-projects-ObjectManagerActivity(Landroid/app/AlertDialog;ZIILjava/util/List;Landroid/content/DialogInterface;)V

    return-void
.end method
