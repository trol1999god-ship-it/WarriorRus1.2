.class public final synthetic Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda67;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/LocalMapActivity;

.field public final synthetic f$1:D

.field public final synthetic f$2:D


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/LocalMapActivity;DD)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda67;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iput-wide p2, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda67;->f$1:D

    iput-wide p4, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda67;->f$2:D

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda67;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iget-wide v1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda67;->f$1:D

    iget-wide v3, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda67;->f$2:D

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/rabochaya/projects/LocalMapActivity;->lambda$longPressed$19$org-rabochaya-projects-LocalMapActivity(DD)V

    return-void
.end method
