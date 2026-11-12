.class public final synthetic Lorg/rabochaya/projects/RasterMapImport$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lorg/rabochaya/projects/RasterExportFile$Writer;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/RasterMapImport$Source;

.field public final synthetic f$1:Lorg/rabochaya/projects/CacheExport$Progress;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Z


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/RasterMapImport$Source;Lorg/rabochaya/projects/CacheExport$Progress;Ljava/lang/String;Z)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/RasterMapImport$$ExternalSyntheticLambda0;->f$0:Lorg/rabochaya/projects/RasterMapImport$Source;

    iput-object p2, p0, Lorg/rabochaya/projects/RasterMapImport$$ExternalSyntheticLambda0;->f$1:Lorg/rabochaya/projects/CacheExport$Progress;

    iput-object p3, p0, Lorg/rabochaya/projects/RasterMapImport$$ExternalSyntheticLambda0;->f$2:Ljava/lang/String;

    iput-boolean p4, p0, Lorg/rabochaya/projects/RasterMapImport$$ExternalSyntheticLambda0;->f$3:Z

    return-void
.end method


# virtual methods
.method public final write(Ljava/io/File;)I
    .locals 4

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/RasterMapImport$$ExternalSyntheticLambda0;->f$0:Lorg/rabochaya/projects/RasterMapImport$Source;

    iget-object v1, p0, Lorg/rabochaya/projects/RasterMapImport$$ExternalSyntheticLambda0;->f$1:Lorg/rabochaya/projects/CacheExport$Progress;

    iget-object v2, p0, Lorg/rabochaya/projects/RasterMapImport$$ExternalSyntheticLambda0;->f$2:Ljava/lang/String;

    iget-boolean v3, p0, Lorg/rabochaya/projects/RasterMapImport$$ExternalSyntheticLambda0;->f$3:Z

    invoke-static {v0, v1, v2, v3, p1}, Lorg/rabochaya/projects/RasterMapImport;->lambda$write$0(Lorg/rabochaya/projects/RasterMapImport$Source;Lorg/rabochaya/projects/CacheExport$Progress;Ljava/lang/String;ZLjava/io/File;)I

    move-result p1

    return p1
.end method
