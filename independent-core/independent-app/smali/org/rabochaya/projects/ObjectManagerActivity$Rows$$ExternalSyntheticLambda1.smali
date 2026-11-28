.class public final synthetic Lorg/rabochaya/projects/ObjectManagerActivity$Rows$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/ObjectManagerActivity$Rows;

.field public final synthetic f$1:Lorg/rabochaya/projects/ObjectTree$Row;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity$Rows;Lorg/rabochaya/projects/ObjectTree$Row;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows$$ExternalSyntheticLambda1;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity$Rows;

    iput-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows$$ExternalSyntheticLambda1;->f$1:Lorg/rabochaya/projects/ObjectTree$Row;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows$$ExternalSyntheticLambda1;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity$Rows;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows$$ExternalSyntheticLambda1;->f$1:Lorg/rabochaya/projects/ObjectTree$Row;

    invoke-virtual {v0, v1, p1}, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->lambda$getView$1$org-rabochaya-projects-ObjectManagerActivity$Rows(Lorg/rabochaya/projects/ObjectTree$Row;Landroid/view/View;)Z

    move-result p1

    return p1
.end method
