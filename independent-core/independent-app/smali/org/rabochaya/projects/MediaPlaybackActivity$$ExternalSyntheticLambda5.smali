.class public final synthetic Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/MediaPlaybackActivity;

.field public final synthetic f$1:Lorg/rabochaya/projects/MediaLinks$Item;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/MediaPlaybackActivity;Lorg/rabochaya/projects/MediaLinks$Item;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda5;->f$0:Lorg/rabochaya/projects/MediaPlaybackActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda5;->f$1:Lorg/rabochaya/projects/MediaLinks$Item;

    return-void
.end method


# virtual methods
.method public final onPrepared(Landroid/media/MediaPlayer;)V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda5;->f$0:Lorg/rabochaya/projects/MediaPlaybackActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda5;->f$1:Lorg/rabochaya/projects/MediaLinks$Item;

    invoke-virtual {v0, v1, p1}, Lorg/rabochaya/projects/MediaPlaybackActivity;->lambda$play$5$org-rabochaya-projects-MediaPlaybackActivity(Lorg/rabochaya/projects/MediaLinks$Item;Landroid/media/MediaPlayer;)V

    return-void
.end method
