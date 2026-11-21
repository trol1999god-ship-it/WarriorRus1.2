.class public final synthetic Lorg/rabochaya/projects/CacheExport$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lorg/rabochaya/projects/RasterExportFile$Writer;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:Lorg/rabochaya/projects/TileSource;

.field public final synthetic f$2:Lorg/rabochaya/projects/CacheExport$Progress;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Lorg/rabochaya/projects/TileSource;Lorg/rabochaya/projects/CacheExport$Progress;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/CacheExport$$ExternalSyntheticLambda0;->f$0:Landroid/content/Context;

    iput-object p2, p0, Lorg/rabochaya/projects/CacheExport$$ExternalSyntheticLambda0;->f$1:Lorg/rabochaya/projects/TileSource;

    iput-object p3, p0, Lorg/rabochaya/projects/CacheExport$$ExternalSyntheticLambda0;->f$2:Lorg/rabochaya/projects/CacheExport$Progress;

    return-void
.end method


# virtual methods
.method public final write(Ljava/io/File;)I
    .locals 3

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/CacheExport$$ExternalSyntheticLambda0;->f$0:Landroid/content/Context;

    iget-object v1, p0, Lorg/rabochaya/projects/CacheExport$$ExternalSyntheticLambda0;->f$1:Lorg/rabochaya/projects/TileSource;

    iget-object v2, p0, Lorg/rabochaya/projects/CacheExport$$ExternalSyntheticLambda0;->f$2:Lorg/rabochaya/projects/CacheExport$Progress;

    invoke-static {v0, v1, v2, p1}, Lorg/rabochaya/projects/CacheExport;->lambda$write$0(Landroid/content/Context;Lorg/rabochaya/projects/TileSource;Lorg/rabochaya/projects/CacheExport$Progress;Ljava/io/File;)I

    move-result p1

    return p1
.end method
