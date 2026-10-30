.class public final synthetic Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda26;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/LocalMapActivity;

.field public final synthetic f$1:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/net/Uri;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda26;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda26;->f$1:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda26;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda26;->f$1:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/LocalMapActivity;->lambda$importMap$51$org-rabochaya-projects-LocalMapActivity(Landroid/net/Uri;)V

    return-void
.end method
