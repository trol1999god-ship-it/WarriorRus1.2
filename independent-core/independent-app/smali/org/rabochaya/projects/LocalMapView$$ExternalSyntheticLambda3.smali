.class public final synthetic Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/LocalMapView;

.field public final synthetic f$1:Lorg/rabochaya/projects/MapComposition;

.field public final synthetic f$2:Ljava/io/File;

.field public final synthetic f$3:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/LocalMapView;Lorg/rabochaya/projects/MapComposition;Ljava/io/File;Landroid/content/Context;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda3;->f$0:Lorg/rabochaya/projects/LocalMapView;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda3;->f$1:Lorg/rabochaya/projects/MapComposition;

    iput-object p3, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda3;->f$2:Ljava/io/File;

    iput-object p4, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda3;->f$3:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda3;->f$0:Lorg/rabochaya/projects/LocalMapView;

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda3;->f$1:Lorg/rabochaya/projects/MapComposition;

    iget-object v2, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda3;->f$2:Ljava/io/File;

    iget-object v3, p0, Lorg/rabochaya/projects/LocalMapView$$ExternalSyntheticLambda3;->f$3:Landroid/content/Context;

    invoke-virtual {v0, v1, v2, v3}, Lorg/rabochaya/projects/LocalMapView;->lambda$openComposition$4$org-rabochaya-projects-LocalMapView(Lorg/rabochaya/projects/MapComposition;Ljava/io/File;Landroid/content/Context;)V

    return-void
.end method
