.class public final synthetic Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Lorg/rabochaya/projects/GeometryEdits$Part;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Z

.field public final synthetic f$5:Ljava/lang/String;

.field public final synthetic f$6:Lorg/rabochaya/projects/GeometryDraft;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/GeometryEditorActivity;ZLorg/rabochaya/projects/GeometryEdits$Part;Ljava/lang/String;ZLjava/lang/String;Lorg/rabochaya/projects/GeometryDraft;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iput-boolean p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$1:Z

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$2:Lorg/rabochaya/projects/GeometryEdits$Part;

    iput-object p4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$3:Ljava/lang/String;

    iput-boolean p5, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$4:Z

    iput-object p6, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$5:Ljava/lang/String;

    iput-object p7, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$6:Lorg/rabochaya/projects/GeometryDraft;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iget-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$1:Z

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$2:Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$3:Ljava/lang/String;

    iget-boolean v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$4:Z

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$5:Ljava/lang/String;

    iget-object v6, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$6:Lorg/rabochaya/projects/GeometryDraft;

    invoke-virtual/range {v0 .. v6}, Lorg/rabochaya/projects/GeometryEditorActivity;->lambda$write$19$org-rabochaya-projects-GeometryEditorActivity(ZLorg/rabochaya/projects/GeometryEdits$Part;Ljava/lang/String;ZLjava/lang/String;Lorg/rabochaya/projects/GeometryDraft;)V

    return-void
.end method
