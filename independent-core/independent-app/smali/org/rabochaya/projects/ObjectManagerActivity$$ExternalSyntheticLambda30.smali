.class public final synthetic Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda30;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

.field public final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity;Z)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda30;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iput-boolean p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda30;->f$1:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda30;->f$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iget-boolean v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda30;->f$1:Z

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/ObjectManagerActivity;->lambda$load$13$org-rabochaya-projects-ObjectManagerActivity(Z)V

    return-void
.end method
