.class public final synthetic Lorg/rabochaya/projects/ObjectManagerActivity$3$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/ObjectManagerActivity$3;

.field public final synthetic f$1:I

.field public final synthetic f$2:I

.field public final synthetic f$3:Landroid/widget/ListView;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity$3;IILandroid/widget/ListView;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3$$ExternalSyntheticLambda0;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity$3;

    iput p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3$$ExternalSyntheticLambda0;->f$1:I

    iput p3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3$$ExternalSyntheticLambda0;->f$2:I

    iput-object p4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3$$ExternalSyntheticLambda0;->f$3:Landroid/widget/ListView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3$$ExternalSyntheticLambda0;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity$3;

    iget v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3$$ExternalSyntheticLambda0;->f$1:I

    iget v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3$$ExternalSyntheticLambda0;->f$2:I

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$3$$ExternalSyntheticLambda0;->f$3:Landroid/widget/ListView;

    invoke-virtual {v0, v1, v2, v3}, Lorg/rabochaya/projects/ObjectManagerActivity$3;->lambda$onPreDraw$0$org-rabochaya-projects-ObjectManagerActivity$3(IILandroid/widget/ListView;)V

    return-void
.end method
