.class public final synthetic Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

.field public final synthetic f$1:Lorg/rabochaya/projects/GeometryPartChoiceDraft;

.field public final synthetic f$2:Landroid/app/AlertDialog;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Lorg/rabochaya/projects/GeometryDraft;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/GeometryEditorActivity;Lorg/rabochaya/projects/GeometryPartChoiceDraft;Landroid/app/AlertDialog;Ljava/lang/String;Lorg/rabochaya/projects/GeometryDraft;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda4;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda4;->f$1:Lorg/rabochaya/projects/GeometryPartChoiceDraft;

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda4;->f$2:Landroid/app/AlertDialog;

    iput-object p4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda4;->f$3:Ljava/lang/String;

    iput-object p5, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda4;->f$4:Lorg/rabochaya/projects/GeometryDraft;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda4;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda4;->f$1:Lorg/rabochaya/projects/GeometryPartChoiceDraft;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda4;->f$2:Landroid/app/AlertDialog;

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda4;->f$3:Ljava/lang/String;

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda4;->f$4:Lorg/rabochaya/projects/GeometryDraft;

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/rabochaya/projects/GeometryEditorActivity;->lambda$confirmPartChoice$12$org-rabochaya-projects-GeometryEditorActivity(Lorg/rabochaya/projects/GeometryPartChoiceDraft;Landroid/app/AlertDialog;Ljava/lang/String;Lorg/rabochaya/projects/GeometryDraft;)V

    return-void
.end method
