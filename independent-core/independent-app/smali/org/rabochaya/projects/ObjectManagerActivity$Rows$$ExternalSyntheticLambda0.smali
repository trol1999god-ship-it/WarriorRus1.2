.class public final synthetic Lorg/rabochaya/projects/ObjectManagerActivity$Rows$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/ObjectManagerActivity$Rows;

.field public final synthetic f$1:Lorg/rabochaya/projects/ObjectTree$Row;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity$Rows;Lorg/rabochaya/projects/ObjectTree$Row;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows$$ExternalSyntheticLambda0;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity$Rows;

    iput-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows$$ExternalSyntheticLambda0;->f$1:Lorg/rabochaya/projects/ObjectTree$Row;

    return-void
.end method


# virtual methods
.method public final onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows$$ExternalSyntheticLambda0;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity$Rows;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows$$ExternalSyntheticLambda0;->f$1:Lorg/rabochaya/projects/ObjectTree$Row;

    invoke-virtual {v0, v1, p1, p2}, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->lambda$getView$0$org-rabochaya-projects-ObjectManagerActivity$Rows(Lorg/rabochaya/projects/ObjectTree$Row;Landroid/widget/CompoundButton;Z)V

    return-void
.end method
