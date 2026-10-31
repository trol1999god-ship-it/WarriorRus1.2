.class public final synthetic Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/AttachmentsActivity;

.field public final synthetic f$1:Ljava/util/List;

.field public final synthetic f$2:Ljava/util/HashMap;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/AttachmentsActivity;Ljava/util/List;Ljava/util/HashMap;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda2;->f$0:Lorg/rabochaya/projects/AttachmentsActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda2;->f$1:Ljava/util/List;

    iput-object p3, p0, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda2;->f$2:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda2;->f$0:Lorg/rabochaya/projects/AttachmentsActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda2;->f$1:Ljava/util/List;

    iget-object v2, p0, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda2;->f$2:Ljava/util/HashMap;

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/AttachmentsActivity;->lambda$load$1$org-rabochaya-projects-AttachmentsActivity(Ljava/util/List;Ljava/util/HashMap;)V

    return-void
.end method
