.class public final synthetic Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

.field public final synthetic f$1:Landroid/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/app/AlertDialog;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;->f$1:Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;->f$1:Landroid/app/AlertDialog;

    invoke-virtual {v0, v1, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->lambda$openEditor$32$org-rabochaya-projects-ObjectManagerActivity(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V

    return-void
.end method
