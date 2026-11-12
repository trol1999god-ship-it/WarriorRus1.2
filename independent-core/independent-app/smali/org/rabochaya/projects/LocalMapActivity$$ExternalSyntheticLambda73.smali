.class public final synthetic Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda73;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/LocalMapActivity;

.field public final synthetic f$1:Landroid/net/Uri;

.field public final synthetic f$2:Z

.field public final synthetic f$3:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/net/Uri;ZLjava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda73;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda73;->f$1:Landroid/net/Uri;

    iput-boolean p3, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda73;->f$2:Z

    iput-object p4, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda73;->f$3:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda73;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda73;->f$1:Landroid/net/Uri;

    iget-boolean v2, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda73;->f$2:Z

    iget-object v3, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda73;->f$3:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lorg/rabochaya/projects/LocalMapActivity;->lambda$importMap$64$org-rabochaya-projects-LocalMapActivity(Landroid/net/Uri;ZLjava/lang/String;)V

    return-void
.end method
