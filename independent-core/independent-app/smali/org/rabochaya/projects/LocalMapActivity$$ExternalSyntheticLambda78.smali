.class public final synthetic Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda78;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/LocalMapActivity;

.field public final synthetic f$1:Ljava/util/List;

.field public final synthetic f$2:Lorg/rabochaya/projects/KmlSymbolAssets;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/LocalMapActivity;Ljava/util/List;Lorg/rabochaya/projects/KmlSymbolAssets;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda78;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda78;->f$1:Ljava/util/List;

    iput-object p3, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda78;->f$2:Lorg/rabochaya/projects/KmlSymbolAssets;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda78;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda78;->f$1:Ljava/util/List;

    iget-object v2, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda78;->f$2:Lorg/rabochaya/projects/KmlSymbolAssets;

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/LocalMapActivity;->lambda$editObject$82$org-rabochaya-projects-LocalMapActivity(Ljava/util/List;Lorg/rabochaya/projects/KmlSymbolAssets;)V

    return-void
.end method
