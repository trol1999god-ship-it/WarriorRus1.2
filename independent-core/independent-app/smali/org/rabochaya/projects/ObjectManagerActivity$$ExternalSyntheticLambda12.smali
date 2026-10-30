.class public final synthetic Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda12;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

.field public final synthetic f$1:Landroid/widget/Spinner;

.field public final synthetic f$2:Landroid/widget/EditText;

.field public final synthetic f$3:Landroid/widget/EditText;

.field public final synthetic f$4:Landroid/app/AlertDialog;

.field public final synthetic f$5:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/app/AlertDialog;Landroid/widget/TextView;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda12;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda12;->f$1:Landroid/widget/Spinner;

    iput-object p3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda12;->f$2:Landroid/widget/EditText;

    iput-object p4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda12;->f$3:Landroid/widget/EditText;

    iput-object p5, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda12;->f$4:Landroid/app/AlertDialog;

    iput-object p6, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda12;->f$5:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 7

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda12;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda12;->f$1:Landroid/widget/Spinner;

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda12;->f$2:Landroid/widget/EditText;

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda12;->f$3:Landroid/widget/EditText;

    iget-object v4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda12;->f$4:Landroid/app/AlertDialog;

    iget-object v5, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda12;->f$5:Landroid/widget/TextView;

    move-object v6, p1

    invoke-virtual/range {v0 .. v6}, Lorg/rabochaya/projects/ObjectManagerActivity;->lambda$dateOptions$46$org-rabochaya-projects-ObjectManagerActivity(Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/app/AlertDialog;Landroid/widget/TextView;Landroid/view/View;)V

    return-void
.end method
