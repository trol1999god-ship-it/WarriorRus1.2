.class public final synthetic Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/LocalMapView;

.field public final synthetic f$1:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/LocalMapView;Ljava/util/ArrayList;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda2;->f$0:Lorg/rabochaya/projects/LocalMapView;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda2;->f$1:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda2;->f$0:Lorg/rabochaya/projects/LocalMapView;

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda2;->f$1:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/LocalMapView;->lambda$openComposition$3$org-rabochaya-projects-LocalMapView(Ljava/util/ArrayList;)V

    return-void
.end method
