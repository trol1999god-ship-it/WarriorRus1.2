.class public interface abstract Lorg/rabochaya/projects/RasterMapImport$Source;
.super Ljava/lang/Object;
.source "RasterMapImport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/RasterMapImport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Source"
.end annotation


# virtual methods
.method public abstract color(DD)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract transform()Lorg/rabochaya/projects/GeoRasterTransform;
.end method
