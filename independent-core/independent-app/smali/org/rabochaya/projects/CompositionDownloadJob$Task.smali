.class public final Lorg/rabochaya/projects/CompositionDownloadJob$Task;
.super Ljava/lang/Object;
.source "CompositionDownloadJob.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/CompositionDownloadJob;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Task"
.end annotation


# instance fields
.field public final source:Lorg/rabochaya/projects/TileSource;

.field public final x:I

.field public final y:I

.field public final z:I


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/TileSource;[I)V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/CompositionDownloadJob$Task;->source:Lorg/rabochaya/projects/TileSource;

    const/4 p1, 0x0

    aget p1, p2, p1

    iput p1, p0, Lorg/rabochaya/projects/CompositionDownloadJob$Task;->z:I

    const/4 p1, 0x1

    aget p1, p2, p1

    iput p1, p0, Lorg/rabochaya/projects/CompositionDownloadJob$Task;->x:I

    const/4 p1, 0x2

    aget p1, p2, p1

    iput p1, p0, Lorg/rabochaya/projects/CompositionDownloadJob$Task;->y:I

    return-void
.end method
