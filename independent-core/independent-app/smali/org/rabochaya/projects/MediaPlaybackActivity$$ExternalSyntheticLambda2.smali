.class public final synthetic Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/MediaPlaybackActivity;

.field public final synthetic f$1:Landroid/graphics/Bitmap;

.field public final synthetic f$2:Lorg/rabochaya/projects/MediaLinks$Item;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/MediaPlaybackActivity;Landroid/graphics/Bitmap;Lorg/rabochaya/projects/MediaLinks$Item;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda2;->f$0:Lorg/rabochaya/projects/MediaPlaybackActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda2;->f$1:Landroid/graphics/Bitmap;

    iput-object p3, p0, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda2;->f$2:Lorg/rabochaya/projects/MediaLinks$Item;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda2;->f$0:Lorg/rabochaya/projects/MediaPlaybackActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda2;->f$1:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda2;->f$2:Lorg/rabochaya/projects/MediaLinks$Item;

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/MediaPlaybackActivity;->lambda$load$1$org-rabochaya-projects-MediaPlaybackActivity(Landroid/graphics/Bitmap;Lorg/rabochaya/projects/MediaLinks$Item;)V

    return-void
.end method
