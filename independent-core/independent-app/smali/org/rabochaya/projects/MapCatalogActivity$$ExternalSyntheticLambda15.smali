.class public final synthetic Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda15;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/MapCatalogActivity;

.field public final synthetic f$1:I

.field public final synthetic f$2:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/MapCatalogActivity;ILjava/util/Map;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda15;->f$0:Lorg/rabochaya/projects/MapCatalogActivity;

    iput p2, p0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda15;->f$1:I

    iput-object p3, p0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda15;->f$2:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda15;->f$0:Lorg/rabochaya/projects/MapCatalogActivity;

    iget v1, p0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda15;->f$1:I

    iget-object v2, p0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda15;->f$2:Ljava/util/Map;

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/MapCatalogActivity;->lambda$scan$15$org-rabochaya-projects-MapCatalogActivity(ILjava/util/Map;)V

    return-void
.end method
