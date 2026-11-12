.class Lorg/rabochaya/projects/KmlXml$1;
.super Ljava/io/FilterOutputStream;
.source "KmlXml.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/KmlXml;->write(Lorg/w3c/dom/Document;)[B
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field count:I


# direct methods
.method constructor <init>(Ljava/io/OutputStream;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    return-void
.end method


# virtual methods
.method public write(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 22
    iget v0, p0, Lorg/rabochaya/projects/KmlXml$1;->count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/rabochaya/projects/KmlXml$1;->count:I

    const/high16 v1, 0x2000000

    if-gt v0, v1, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/KmlXml$1;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    return-void

    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0431\u043e\u043b\u044c\u0448\u043e\u0439 XML"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public write([BII)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 22
    const/high16 v0, 0x2000000

    iget v1, p0, Lorg/rabochaya/projects/KmlXml$1;->count:I

    sub-int/2addr v0, v1

    if-gt p3, v0, :cond_0

    iget v0, p0, Lorg/rabochaya/projects/KmlXml$1;->count:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/rabochaya/projects/KmlXml$1;->count:I

    iget-object v0, p0, Lorg/rabochaya/projects/KmlXml$1;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    return-void

    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0431\u043e\u043b\u044c\u0448\u043e\u0439 XML"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
