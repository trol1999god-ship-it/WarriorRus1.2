.class public final synthetic Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda11;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/MapCatalogActivity;

.field public final synthetic f$1:Lorg/rabochaya/projects/MapCatalog$Entry;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/MapCatalogActivity;Lorg/rabochaya/projects/MapCatalog$Entry;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda11;->f$0:Lorg/rabochaya/projects/MapCatalogActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda11;->f$1:Lorg/rabochaya/projects/MapCatalog$Entry;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda11;->f$0:Lorg/rabochaya/projects/MapCatalogActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda11;->f$1:Lorg/rabochaya/projects/MapCatalog$Entry;

    invoke-virtual {v0, v1, p1}, Lorg/rabochaya/projects/MapCatalogActivity;->lambda$card$7$org-rabochaya-projects-MapCatalogActivity(Lorg/rabochaya/projects/MapCatalog$Entry;Landroid/view/View;)V

    return-void
.end method
