.class public final synthetic Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

.field public final synthetic f$1:Lorg/rabochaya/projects/GeometryCloseDraft;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Lorg/rabochaya/projects/DemProfile;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/GeometryEditorActivity;Lorg/rabochaya/projects/GeometryCloseDraft;Ljava/lang/String;Lorg/rabochaya/projects/DemProfile;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda3;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda3;->f$1:Lorg/rabochaya/projects/GeometryCloseDraft;

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda3;->f$2:Ljava/lang/String;

    iput-object p4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda3;->f$3:Lorg/rabochaya/projects/DemProfile;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda3;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda3;->f$1:Lorg/rabochaya/projects/GeometryCloseDraft;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda3;->f$2:Ljava/lang/String;

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda3;->f$3:Lorg/rabochaya/projects/DemProfile;

    invoke-virtual {v0, v1, v2, v3}, Lorg/rabochaya/projects/GeometryEditorActivity;->lambda$profile$2$org-rabochaya-projects-GeometryEditorActivity(Lorg/rabochaya/projects/GeometryCloseDraft;Ljava/lang/String;Lorg/rabochaya/projects/DemProfile;)V

    return-void
.end method
