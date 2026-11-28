.class public final Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;
.super Ljava/lang/Object;
.source "CompositionDownloadSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/CompositionDownloadSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Snapshot"
.end annotation


# instance fields
.field public final job:Lorg/rabochaya/projects/CompositionDownloadJob;

.field final raw:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/CompositionDownloadJob;Ljava/lang/String;)V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iput-object p2, p0, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->raw:Ljava/lang/String;

    return-void
.end method
