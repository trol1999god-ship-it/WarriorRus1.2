.class Lorg/rabochaya/projects/ObjectManagerActivity$1;
.super Landroid/widget/ScrollView;
.source "ObjectManagerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ObjectManagerActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ObjectManagerActivity;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/content/Context;)V
    .locals 0

    .line 21
    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$1;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-direct {p0, p2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .locals 3

    .line 21
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$1;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    const/high16 v1, 0x42400000    # 48.0f

    invoke-static {v0, v1}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v0

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$1;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    const/high16 v2, 0x43400000    # 192.0f

    invoke-static {v1, v2}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v1

    sub-int/2addr p2, v1

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    const/high16 v0, -0x80000000

    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-super {p0, p1, p2}, Landroid/widget/ScrollView;->onMeasure(II)V

    return-void
.end method
