.class Lorg/rabochaya/projects/ObjectManagerActivity$3;
.super Ljava/lang/Object;
.source "ObjectManagerActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ObjectManagerActivity;->dateOptions(Lorg/rabochaya/projects/ObjectFormDraft;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

.field final synthetic val$error:Landroid/widget/TextView;

.field final synthetic val$from:Landroid/widget/EditText;

.field final synthetic val$lastMode:[I

.field final synthetic val$mode:Landroid/widget/Spinner;

.field final synthetic val$to:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;[ILandroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 178
    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$mode:Landroid/widget/Spinner;

    iput-object p3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$from:Landroid/widget/EditText;

    iput-object p4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$to:Landroid/widget/EditText;

    iput-object p5, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$lastMode:[I

    iput-object p6, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$error:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 178
    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$mode:Landroid/widget/Spinner;

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$from:Landroid/widget/EditText;

    const/4 p3, 0x1

    const/4 p4, 0x0

    const/4 p5, 0x2

    if-ne p1, p5, :cond_0

    move v0, p3

    goto :goto_0

    :cond_0
    move v0, p4

    :goto_0
    invoke-virtual {p2, v0}, Landroid/widget/EditText;->setEnabled(Z)V

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$to:Landroid/widget/EditText;

    if-ne p1, p5, :cond_1

    goto :goto_1

    :cond_1
    move p3, p4

    :goto_1
    invoke-virtual {p2, p3}, Landroid/widget/EditText;->setEnabled(Z)V

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$lastMode:[I

    aget p2, p2, p4

    if-eq p1, p2, :cond_2

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$error:Landroid/widget/TextView;

    const-string p3, ""

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$lastMode:[I

    aput p1, p2, p4

    :cond_2
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    .line 178
    return-void
.end method
