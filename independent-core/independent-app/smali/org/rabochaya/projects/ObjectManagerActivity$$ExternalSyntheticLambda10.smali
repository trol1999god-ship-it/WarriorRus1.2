.class public final synthetic Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

.field public final synthetic f$1:Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

.field public final synthetic f$2:Lorg/rabochaya/projects/ObjectFormDraft;

.field public final synthetic f$3:Landroid/app/AlertDialog;

.field public final synthetic f$4:Landroid/widget/Spinner;

.field public final synthetic f$5:Landroid/widget/EditText;

.field public final synthetic f$6:Landroid/widget/EditText;

.field public final synthetic f$7:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity;Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;Lorg/rabochaya/projects/ObjectFormDraft;Landroid/app/AlertDialog;Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/TextView;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;->f$1:Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

    iput-object p3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;->f$2:Lorg/rabochaya/projects/ObjectFormDraft;

    iput-object p4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;->f$3:Landroid/app/AlertDialog;

    iput-object p5, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;->f$4:Landroid/widget/Spinner;

    iput-object p6, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;->f$5:Landroid/widget/EditText;

    iput-object p7, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;->f$6:Landroid/widget/EditText;

    iput-object p8, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;->f$7:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 9

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;->f$1:Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;->f$2:Lorg/rabochaya/projects/ObjectFormDraft;

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;->f$3:Landroid/app/AlertDialog;

    iget-object v4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;->f$4:Landroid/widget/Spinner;

    iget-object v5, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;->f$5:Landroid/widget/EditText;

    iget-object v6, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;->f$6:Landroid/widget/EditText;

    iget-object v7, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;->f$7:Landroid/widget/TextView;

    move-object v8, p1

    invoke-virtual/range {v0 .. v8}, Lorg/rabochaya/projects/ObjectManagerActivity;->lambda$dateOptions$50$org-rabochaya-projects-ObjectManagerActivity(Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;Lorg/rabochaya/projects/ObjectFormDraft;Landroid/app/AlertDialog;Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/TextView;Landroid/content/DialogInterface;)V

    return-void
.end method
