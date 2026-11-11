.class final Lorg/rabochaya/projects/GeoTiffRaster$StripInput;
.super Ljava/io/InputStream;
.source "GeoTiffRaster.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/GeoTiffRaster;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "StripInput"
.end annotation


# instance fields
.field position:J

.field remaining:J

.field final synthetic this$0:Lorg/rabochaya/projects/GeoTiffRaster;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/GeoTiffRaster;I)V
    .locals 3

    .line 29
    iput-object p1, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->this$0:Lorg/rabochaya/projects/GeoTiffRaster;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    invoke-static {p1}, Lorg/rabochaya/projects/GeoTiffRaster;->access$000(Lorg/rabochaya/projects/GeoTiffRaster;)[J

    move-result-object v0

    aget-wide v1, v0, p2

    iput-wide v1, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->position:J

    invoke-static {p1}, Lorg/rabochaya/projects/GeoTiffRaster;->access$100(Lorg/rabochaya/projects/GeoTiffRaster;)[J

    move-result-object p1

    aget-wide v0, p1, p2

    iput-wide v0, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->remaining:J

    return-void
.end method


# virtual methods
.method public read()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 29
    iget-wide v0, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->remaining:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->this$0:Lorg/rabochaya/projects/GeoTiffRaster;

    invoke-static {v0}, Lorg/rabochaya/projects/GeoTiffRaster;->access$200(Lorg/rabochaya/projects/GeoTiffRaster;)Ljava/io/RandomAccessFile;

    move-result-object v0

    iget-wide v1, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->position:J

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->this$0:Lorg/rabochaya/projects/GeoTiffRaster;

    invoke-static {v0}, Lorg/rabochaya/projects/GeoTiffRaster;->access$200(Lorg/rabochaya/projects/GeoTiffRaster;)Ljava/io/RandomAccessFile;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->read()I

    move-result v0

    if-ltz v0, :cond_1

    iget-wide v1, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->position:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->position:J

    iget-wide v1, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->remaining:J

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->remaining:J

    :cond_1
    return v0
.end method

.method public read([BII)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 29
    if-nez p3, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-wide v0, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->remaining:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/4 p1, -0x1

    return p1

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->this$0:Lorg/rabochaya/projects/GeoTiffRaster;

    invoke-static {v0}, Lorg/rabochaya/projects/GeoTiffRaster;->access$200(Lorg/rabochaya/projects/GeoTiffRaster;)Ljava/io/RandomAccessFile;

    move-result-object v0

    iget-wide v1, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->position:J

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->this$0:Lorg/rabochaya/projects/GeoTiffRaster;

    invoke-static {v0}, Lorg/rabochaya/projects/GeoTiffRaster;->access$200(Lorg/rabochaya/projects/GeoTiffRaster;)Ljava/io/RandomAccessFile;

    move-result-object v0

    int-to-long v1, p3

    iget-wide v3, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->remaining:J

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int p3, v1

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result p1

    if-lez p1, :cond_2

    iget-wide p2, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->position:J

    int-to-long v0, p1

    add-long/2addr p2, v0

    iput-wide p2, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->position:J

    iget-wide p2, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->remaining:J

    sub-long/2addr p2, v0

    iput-wide p2, p0, Lorg/rabochaya/projects/GeoTiffRaster$StripInput;->remaining:J

    :cond_2
    return p1
.end method
