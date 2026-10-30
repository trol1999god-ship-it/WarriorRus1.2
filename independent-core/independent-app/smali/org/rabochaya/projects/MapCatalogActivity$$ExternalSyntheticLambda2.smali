.class public final synthetic Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/MapCatalogActivity;

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/MapCatalogActivity;I)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda2;->f$0:Lorg/rabochaya/projects/MapCatalogActivity;

    iput p2, p0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda2;->f$1:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda2;->f$0:Lorg/rabochaya/projects/MapCatalogActivity;

    iget v1, p0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda2;->f$1:I

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/MapCatalogActivity;->lambda$scan$16$org-rabochaya-projects-MapCatalogActivity(I)V

    return-void
.end method
