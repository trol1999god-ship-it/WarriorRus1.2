.class public final synthetic Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

.field public final synthetic f$1:Lorg/rabochaya/projects/ObjectFormDraft;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;Lorg/rabochaya/projects/ObjectFormDraft;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda4;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

    iput-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda4;->f$1:Lorg/rabochaya/projects/ObjectFormDraft;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda4;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda4;->f$1:Lorg/rabochaya/projects/ObjectFormDraft;

    invoke-static {v0, v1, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->lambda$searchOptions$45(Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;Lorg/rabochaya/projects/ObjectFormDraft;Landroid/content/DialogInterface;)V

    return-void
.end method
