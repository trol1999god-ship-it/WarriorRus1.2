.class final Lorg/rabochaya/projects/GifRaster$Bits;
.super Ljava/lang/Object;
.source "GifRaster.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/GifRaster;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Bits"
.end annotation


# instance fields
.field at:I

.field bits:I

.field final block:[B

.field final budget:[I

.field buffer:I

.field final deadline:J

.field final in:Ljava/io/RandomAccessFile;

.field final length:J

.field size:I


# direct methods
.method constructor <init>(Ljava/io/RandomAccessFile;J[IJ)V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const/16 v0, 0xff

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/rabochaya/projects/GifRaster$Bits;->block:[B

    .line 15
    iput-object p1, p0, Lorg/rabochaya/projects/GifRaster$Bits;->in:Ljava/io/RandomAccessFile;

    iput-wide p2, p0, Lorg/rabochaya/projects/GifRaster$Bits;->length:J

    iput-object p4, p0, Lorg/rabochaya/projects/GifRaster$Bits;->budget:[I

    iput-wide p5, p0, Lorg/rabochaya/projects/GifRaster$Bits;->deadline:J

    return-void
.end method


# virtual methods
.method code(I)I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    nop

    :goto_0
    iget v0, p0, Lorg/rabochaya/projects/GifRaster$Bits;->bits:I

    const/4 v1, 0x1

    if-ge v0, p1, :cond_4

    iget v0, p0, Lorg/rabochaya/projects/GifRaster$Bits;->at:I

    iget v2, p0, Lorg/rabochaya/projects/GifRaster$Bits;->size:I

    if-ne v0, v2, :cond_3

    iget-wide v2, p0, Lorg/rabochaya/projects/GifRaster$Bits;->deadline:J

    invoke-static {v2, v3}, Lorg/rabochaya/projects/GifRaster;->access$000(J)V

    iget-object v0, p0, Lorg/rabochaya/projects/GifRaster$Bits;->in:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->readUnsignedByte()I

    move-result v0

    if-eqz v0, :cond_2

    iget-object v2, p0, Lorg/rabochaya/projects/GifRaster$Bits;->budget:[I

    const/4 v3, 0x0

    aget v4, v2, v3

    add-int/2addr v4, v1

    aput v4, v2, v3

    const/high16 v1, 0x10000

    if-gt v4, v1, :cond_1

    iget-object v1, p0, Lorg/rabochaya/projects/GifRaster$Bits;->in:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v1

    iget-wide v4, p0, Lorg/rabochaya/projects/GifRaster$Bits;->length:J

    int-to-long v6, v0

    sub-long/2addr v4, v6

    cmp-long v1, v1, v4

    if-gtz v1, :cond_0

    iget-object v1, p0, Lorg/rabochaya/projects/GifRaster$Bits;->in:Ljava/io/RandomAccessFile;

    iget-object v2, p0, Lorg/rabochaya/projects/GifRaster$Bits;->block:[B

    invoke-virtual {v1, v2, v3, v0}, Ljava/io/RandomAccessFile;->readFully([BII)V

    iput v3, p0, Lorg/rabochaya/projects/GifRaster$Bits;->at:I

    iput v0, p0, Lorg/rabochaya/projects/GifRaster$Bits;->size:I

    goto :goto_1

    :cond_0
    const-string p1, "\u043e\u0431\u0440\u0435\u0437\u0430\u043d\u043d\u044b\u0435 LZW \u0434\u0430\u043d\u043d\u044b\u0435"

    invoke-static {p1}, Lorg/rabochaya/projects/GifRaster;->access$100(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p1

    throw p1

    :cond_1
    const-string p1, "\u0431\u043e\u043b\u044c\u0448\u0435 65 536 subblocks"

    invoke-static {p1}, Lorg/rabochaya/projects/GifRaster;->access$100(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p1

    throw p1

    :cond_2
    const-string p1, "\u043d\u0435\u0442 LZW end-of-information"

    invoke-static {p1}, Lorg/rabochaya/projects/GifRaster;->access$100(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object p1

    throw p1

    :cond_3
    :goto_1
    iget v0, p0, Lorg/rabochaya/projects/GifRaster$Bits;->buffer:I

    iget-object v1, p0, Lorg/rabochaya/projects/GifRaster$Bits;->block:[B

    iget v2, p0, Lorg/rabochaya/projects/GifRaster$Bits;->at:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/rabochaya/projects/GifRaster$Bits;->at:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    iget v2, p0, Lorg/rabochaya/projects/GifRaster$Bits;->bits:I

    shl-int/2addr v1, v2

    or-int/2addr v0, v1

    iput v0, p0, Lorg/rabochaya/projects/GifRaster$Bits;->buffer:I

    iget v0, p0, Lorg/rabochaya/projects/GifRaster$Bits;->bits:I

    add-int/lit8 v0, v0, 0x8

    iput v0, p0, Lorg/rabochaya/projects/GifRaster$Bits;->bits:I

    goto :goto_0

    :cond_4
    iget v0, p0, Lorg/rabochaya/projects/GifRaster$Bits;->buffer:I

    shl-int v2, v1, p1

    sub-int/2addr v2, v1

    and-int/2addr v0, v2

    iget v1, p0, Lorg/rabochaya/projects/GifRaster$Bits;->buffer:I

    ushr-int/2addr v1, p1

    iput v1, p0, Lorg/rabochaya/projects/GifRaster$Bits;->buffer:I

    iget v1, p0, Lorg/rabochaya/projects/GifRaster$Bits;->bits:I

    sub-int/2addr v1, p1

    iput v1, p0, Lorg/rabochaya/projects/GifRaster$Bits;->bits:I

    return v0
.end method

.method finish()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 17
    iget v0, p0, Lorg/rabochaya/projects/GifRaster$Bits;->size:I

    iput v0, p0, Lorg/rabochaya/projects/GifRaster$Bits;->at:I

    iget-object v1, p0, Lorg/rabochaya/projects/GifRaster$Bits;->in:Ljava/io/RandomAccessFile;

    iget-wide v2, p0, Lorg/rabochaya/projects/GifRaster$Bits;->length:J

    iget-object v4, p0, Lorg/rabochaya/projects/GifRaster$Bits;->budget:[I

    iget-wide v5, p0, Lorg/rabochaya/projects/GifRaster$Bits;->deadline:J

    invoke-static/range {v1 .. v6}, Lorg/rabochaya/projects/GifRaster;->access$200(Ljava/io/RandomAccessFile;J[IJ)I

    return-void
.end method
