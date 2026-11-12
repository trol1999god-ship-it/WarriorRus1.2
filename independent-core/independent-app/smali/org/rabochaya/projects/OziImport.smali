.class public final Lorg/rabochaya/projects/OziImport;
.super Ljava/lang/Object;
.source "OziImport.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static write(Ljava/io/File;Ljava/io/File;Ljava/lang/String;Ljava/io/File;Lorg/rabochaya/projects/CacheExport$Progress;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 7
    invoke-virtual {p3}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 8
    new-instance v0, Lorg/rabochaya/projects/OziRaster;

    invoke-direct {v0, p0, p1, p2}, Lorg/rabochaya/projects/OziRaster;-><init>(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V

    :try_start_0
    const-string p0, "\u041b\u043e\u043a\u0430\u043b\u044c\u043d\u0430\u044f Ozi \u043a\u0430\u0440\u0442\u0430"

    const/4 p1, 0x1

    invoke-static {v0, p3, p4, p0, p1}, Lorg/rabochaya/projects/RasterMapImport;->write(Lorg/rabochaya/projects/RasterMapImport$Source;Ljava/io/File;Lorg/rabochaya/projects/CacheExport$Progress;Ljava/lang/String;Z)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v0}, Lorg/rabochaya/projects/OziRaster;->close()V

    return p0

    :catchall_0
    move-exception p0

    :try_start_1
    invoke-virtual {v0}, Lorg/rabochaya/projects/OziRaster;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw p0

    .line 7
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Ozi: \u0438\u0441\u0445\u043e\u0434\u043d\u044b\u0435 \u0444\u0430\u0439\u043b\u044b \u043d\u0435\u043b\u044c\u0437\u044f \u043f\u0435\u0440\u0435\u0437\u0430\u043f\u0438\u0441\u044b\u0432\u0430\u0442\u044c"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
