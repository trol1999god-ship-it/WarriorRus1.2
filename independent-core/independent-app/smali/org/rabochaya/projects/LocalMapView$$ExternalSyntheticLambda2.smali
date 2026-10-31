.class public final synthetic Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/LocalMapView;

.field public final synthetic f$1:Lorg/rabochaya/projects/TileSource;

.field public final synthetic f$2:Landroid/content/Context;

.field public final synthetic f$3:Lorg/rabochaya/projects/LocalMapView$Listener;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/LocalMapView;Lorg/rabochaya/projects/TileSource;Landroid/content/Context;Lorg/rabochaya/projects/LocalMapView$Listener;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda2;->f$0:Lorg/rabochaya/projects/LocalMapView;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda2;->f$1:Lorg/rabochaya/projects/TileSource;

    iput-object p3, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda2;->f$2:Landroid/content/Context;

    iput-object p4, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda2;->f$3:Lorg/rabochaya/projects/LocalMapView$Listener;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda2;->f$0:Lorg/rabochaya/projects/LocalMapView;

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda2;->f$1:Lorg/rabochaya/projects/TileSource;

    iget-object v2, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda2;->f$2:Landroid/content/Context;

    iget-object v3, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda2;->f$3:Lorg/rabochaya/projects/LocalMapView$Listener;

    invoke-virtual {v0, v1, v2, v3}, Lorg/rabochaya/projects/LocalMapView;->lambda$new$2$org-rabochaya-projects-LocalMapView(Lorg/rabochaya/projects/TileSource;Landroid/content/Context;Lorg/rabochaya/projects/LocalMapView$Listener;)V

    return-void
.end method
