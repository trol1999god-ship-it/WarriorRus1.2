.class public final synthetic Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/LocalMapView;

.field public final synthetic f$1:Lorg/rabochaya/projects/LocalMapView$Listener;

.field public final synthetic f$2:Ljava/lang/Exception;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/LocalMapView;Lorg/rabochaya/projects/LocalMapView$Listener;Ljava/lang/Exception;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda1;->f$0:Lorg/rabochaya/projects/LocalMapView;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda1;->f$1:Lorg/rabochaya/projects/LocalMapView$Listener;

    iput-object p3, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda1;->f$2:Ljava/lang/Exception;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda1;->f$0:Lorg/rabochaya/projects/LocalMapView;

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda1;->f$1:Lorg/rabochaya/projects/LocalMapView$Listener;

    iget-object v2, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda1;->f$2:Ljava/lang/Exception;

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/LocalMapView;->lambda$new$1$org-rabochaya-projects-LocalMapView(Lorg/rabochaya/projects/LocalMapView$Listener;Ljava/lang/Exception;)V

    return-void
.end method
