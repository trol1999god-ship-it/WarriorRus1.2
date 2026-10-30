.class public final synthetic Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda8;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/MediaPlaybackActivity;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/MediaPlaybackActivity;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda8;->f$0:Lorg/rabochaya/projects/MediaPlaybackActivity;

    return-void
.end method


# virtual methods
.method public final onError(Landroid/media/MediaPlayer;II)Z
    .locals 1

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda8;->f$0:Lorg/rabochaya/projects/MediaPlaybackActivity;

    invoke-virtual {v0, p1, p2, p3}, Lorg/rabochaya/projects/MediaPlaybackActivity;->lambda$play$8$org-rabochaya-projects-MediaPlaybackActivity(Landroid/media/MediaPlayer;II)Z

    move-result p1

    return p1
.end method
