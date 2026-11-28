.class public final synthetic Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/MapCatalogActivity;

.field public final synthetic f$1:Landroid/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/MapCatalogActivity;Landroid/app/AlertDialog;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda4;->f$0:Lorg/rabochaya/projects/MapCatalogActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda4;->f$1:Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda4;->f$0:Lorg/rabochaya/projects/MapCatalogActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/MapCatalogActivity$$ExternalSyntheticLambda4;->f$1:Landroid/app/AlertDialog;

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/MapCatalogActivity;->lambda$layerDialog$11$org-rabochaya-projects-MapCatalogActivity(Landroid/app/AlertDialog;)V

    return-void
.end method
