.class Lorg/rabochaya/projects/ObjectManagerActivity$3;
.super Ljava/lang/Object;
.source "ObjectManagerActivity.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ObjectManagerActivity;->restoreChooserAnchor(Landroid/widget/ListView;IILandroid/os/Parcelable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

.field final synthetic val$first:I

.field final synthetic val$nativeState:Landroid/os/Parcelable;

.field final synthetic val$options:Landroid/widget/ListView;

.field final synthetic val$top:I


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/widget/ListView;IILandroid/os/Parcelable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 132
    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$options:Landroid/widget/ListView;

    iput p3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$first:I

    iput p4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$top:I

    iput-object p5, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$nativeState:Landroid/os/Parcelable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onPreDraw$0$org-rabochaya-projects-ObjectManagerActivity$3(IILandroid/widget/ListView;)V
    .locals 2

    .line 132
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    const-string v1, "restore-after-layout-post"

    invoke-static {v0, v1, p1, p2, p3}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$1400(Lorg/rabochaya/projects/ObjectManagerActivity;Ljava/lang/String;IILandroid/widget/ListView;)V

    return-void
.end method

.method public onPreDraw()Z
    .locals 5

    .line 132
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$options:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getChildCount()I

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$options:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->isLayoutRequested()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$options:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iget v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$first:I

    iget v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$top:I

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$options:Landroid/widget/ListView;

    const-string v4, "restore-after-layout-before"

    invoke-static {v0, v4, v1, v2, v3}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$1400(Lorg/rabochaya/projects/ObjectManagerActivity;Ljava/lang/String;IILandroid/widget/ListView;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$nativeState:Landroid/os/Parcelable;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$options:Landroid/widget/ListView;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$nativeState:Landroid/os/Parcelable;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$options:Landroid/widget/ListView;

    iget v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$first:I

    iget v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$top:I

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$options:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getListPaddingTop()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    :goto_0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iget v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$first:I

    iget v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$top:I

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$options:Landroid/widget/ListView;

    const-string v4, "restore-after-layout-request"

    invoke-static {v0, v4, v1, v2, v3}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$1400(Lorg/rabochaya/projects/ObjectManagerActivity;Ljava/lang/String;IILandroid/widget/ListView;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$options:Landroid/widget/ListView;

    iget v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$first:I

    iget v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$top:I

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3;->val$options:Landroid/widget/ListView;

    new-instance v4, Lorg/rabochaya/projects/ObjectManagerActivity$3$$ExternalSyntheticLambda0;

    invoke-direct {v4, p0, v1, v2, v3}, Lorg/rabochaya/projects/ObjectManagerActivity$3$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity$3;IILandroid/widget/ListView;)V

    invoke-virtual {v0, v4}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    return v0

    :cond_2
    :goto_1
    const/4 v0, 0x1

    return v0
.end method
