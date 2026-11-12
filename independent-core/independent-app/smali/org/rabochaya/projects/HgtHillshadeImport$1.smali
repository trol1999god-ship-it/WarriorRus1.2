.class Lorg/rabochaya/projects/HgtHillshadeImport$1;
.super Ljava/lang/Object;
.source "HgtHillshadeImport.java"

# interfaces
.implements Lorg/rabochaya/projects/RasterMapImport$Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/HgtHillshadeImport;->write(Ljava/io/File;JLjava/io/File;Lorg/rabochaya/projects/CacheExport$Progress;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$shade:Lorg/rabochaya/projects/HgtHillshade;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/HgtHillshade;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 9
    iput-object p1, p0, Lorg/rabochaya/projects/HgtHillshadeImport$1;->val$shade:Lorg/rabochaya/projects/HgtHillshade;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public color(DD)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 9
    iget-object v0, p0, Lorg/rabochaya/projects/HgtHillshadeImport$1;->val$shade:Lorg/rabochaya/projects/HgtHillshade;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/rabochaya/projects/HgtHillshade;->color(DD)I

    move-result p1

    return p1
.end method

.method public transform()Lorg/rabochaya/projects/GeoRasterTransform;
    .locals 1

    .line 9
    iget-object v0, p0, Lorg/rabochaya/projects/HgtHillshadeImport$1;->val$shade:Lorg/rabochaya/projects/HgtHillshade;

    invoke-virtual {v0}, Lorg/rabochaya/projects/HgtHillshade;->transform()Lorg/rabochaya/projects/GeoRasterTransform;

    move-result-object v0

    return-object v0
.end method
