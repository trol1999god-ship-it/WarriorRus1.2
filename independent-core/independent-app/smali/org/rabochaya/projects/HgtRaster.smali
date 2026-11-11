.class public final Lorg/rabochaya/projects/HgtRaster;
.super Ljava/lang/Object;
.source "HgtRaster.java"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field private static final HEADER:I = 0x20

.field private static final MAGIC:I = 0x524b4847

.field public static final MAX_RAW:J = 0x18bba42L


# instance fields
.field private final file:Ljava/io/RandomAccessFile;

.field public final name:Ljava/lang/String;

.field private final offset:I

.field private final rows:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/Integer;",
            "[S>;"
        }
    .end annotation
.end field

.field public final samples:I

.field public final south:I

.field public final west:I


# direct methods
.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8
    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/HgtRaster;-><init>(Ljava/io/File;Ljava/lang/String;JZ)V

    return-void
.end method

.method private constructor <init>(Ljava/io/File;Ljava/lang/String;JZ)V
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    move-object/from16 v1, p0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 7
    new-instance v0, Lorg/rabochaya/projects/HgtRaster$1;

    const/16 v2, 0x10

    const/high16 v3, 0x3f400000    # 0.75f

    const/4 v4, 0x1

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/rabochaya/projects/HgtRaster$1;-><init>(Lorg/rabochaya/projects/HgtRaster;IFZ)V

    iput-object v0, v1, Lorg/rabochaya/projects/HgtRaster;->rows:Ljava/util/LinkedHashMap;

    .line 10
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v2, "r"

    move-object/from16 v3, p1

    invoke-direct {v0, v3, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, v1, Lorg/rabochaya/projects/HgtRaster;->file:Ljava/io/RandomAccessFile;

    const/16 v0, 0xe11

    const/16 v2, 0x4b1

    const-string v3, "W"

    const/4 v5, 0x3

    const/4 v6, 0x4

    const-string v7, "S"

    const/4 v8, 0x0

    const/4 v9, 0x2

    if-eqz p5, :cond_2

    const-wide/16 v10, 0x0

    cmp-long v10, p3, v10

    if-lez v10, :cond_1

    :try_start_0
    iget-object v10, v1, Lorg/rabochaya/projects/HgtRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v10}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v10

    const v11, 0x524b4847

    if-ne v10, v11, :cond_1

    iget-object v10, v1, Lorg/rabochaya/projects/HgtRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v10}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v10

    if-ne v10, v4, :cond_1

    iget-object v10, v1, Lorg/rabochaya/projects/HgtRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v10}, Ljava/io/RandomAccessFile;->readLong()J

    move-result-wide v10

    cmp-long v10, v10, p3

    if-nez v10, :cond_1

    iget-object v10, v1, Lorg/rabochaya/projects/HgtRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v10}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v10

    iput v10, v1, Lorg/rabochaya/projects/HgtRaster;->west:I

    iget-object v10, v1, Lorg/rabochaya/projects/HgtRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v10}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v10

    iput v10, v1, Lorg/rabochaya/projects/HgtRaster;->south:I

    iget-object v10, v1, Lorg/rabochaya/projects/HgtRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v10}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v10

    iput v10, v1, Lorg/rabochaya/projects/HgtRaster;->samples:I

    iget-object v10, v1, Lorg/rabochaya/projects/HgtRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v10}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v10

    if-nez v10, :cond_0

    const/16 v10, 0x20

    iput v10, v1, Lorg/rabochaya/projects/HgtRaster;->offset:I

    goto/16 :goto_5

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u041d\u0435\u0438\u0437\u0432\u0435\u0441\u0442\u043d\u044b\u0439 private DEM header"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_0
    throw v0

    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v2, "DEM \u043f\u0440\u0438\u043d\u0430\u0434\u043b\u0435\u0436\u0438\u0442 \u0434\u0440\u0443\u0433\u043e\u043c\u0443 \u043f\u0440\u043e\u0435\u043a\u0442\u0443 \u0438\u043b\u0438 \u043f\u043e\u0432\u0440\u0435\u0436\u0434\u0451\u043d"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const-string v10, "([NS])(\\d{2})([EW])(\\d{3})\\.hgt"

    invoke-static {v10, v9}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v10

    if-nez p2, :cond_3

    const-string v11, ""

    goto :goto_1

    :cond_3
    move-object/from16 v11, p2

    :goto_1
    invoke-virtual {v10, v11}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/regex/Matcher;->matches()Z

    move-result v11

    if-eqz v11, :cond_c

    invoke-virtual {v10, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    invoke-virtual {v10, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    const/4 v13, -0x1

    if-eqz v12, :cond_4

    move v12, v13

    goto :goto_2

    :cond_4
    move v12, v4

    :goto_2
    mul-int/2addr v11, v12

    iput v11, v1, Lorg/rabochaya/projects/HgtRaster;->south:I

    invoke-virtual {v10, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    invoke-virtual {v10, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_5

    goto :goto_3

    :cond_5
    move v13, v4

    :goto_3
    mul-int/2addr v11, v13

    iput v11, v1, Lorg/rabochaya/projects/HgtRaster;->west:I

    iget-object v10, v1, Lorg/rabochaya/projects/HgtRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v10}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v10

    const-wide/32 v12, 0x2c04c2

    cmp-long v12, v10, v12

    if-nez v12, :cond_6

    move v10, v2

    goto :goto_4

    :cond_6
    const-wide/32 v12, 0x18bba42

    cmp-long v10, v10, v12

    if-nez v10, :cond_7

    move v10, v0

    goto :goto_4

    :cond_7
    move v10, v8

    :goto_4
    iput v10, v1, Lorg/rabochaya/projects/HgtRaster;->samples:I

    iput v8, v1, Lorg/rabochaya/projects/HgtRaster;->offset:I

    .line 11
    :goto_5
    iget v10, v1, Lorg/rabochaya/projects/HgtRaster;->west:I

    const/16 v11, -0xb4

    if-lt v10, v11, :cond_b

    iget v10, v1, Lorg/rabochaya/projects/HgtRaster;->west:I

    const/16 v11, 0xb3

    if-gt v10, v11, :cond_b

    iget v10, v1, Lorg/rabochaya/projects/HgtRaster;->south:I

    const/16 v11, -0x5a

    if-lt v10, v11, :cond_b

    iget v10, v1, Lorg/rabochaya/projects/HgtRaster;->south:I

    const/16 v11, 0x59

    if-gt v10, v11, :cond_b

    iget v10, v1, Lorg/rabochaya/projects/HgtRaster;->samples:I

    if-eq v10, v2, :cond_8

    iget v2, v1, Lorg/rabochaya/projects/HgtRaster;->samples:I

    if-ne v2, v0, :cond_b

    :cond_8
    iget-object v0, v1, Lorg/rabochaya/projects/HgtRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v10

    iget v0, v1, Lorg/rabochaya/projects/HgtRaster;->offset:I

    int-to-long v12, v0

    iget v0, v1, Lorg/rabochaya/projects/HgtRaster;->samples:I

    int-to-long v14, v0

    iget v0, v1, Lorg/rabochaya/projects/HgtRaster;->samples:I

    int-to-long v4, v0

    mul-long/2addr v14, v4

    const-wide/16 v4, 0x2

    mul-long/2addr v14, v4

    add-long/2addr v12, v14

    cmp-long v0, v10, v12

    if-nez v0, :cond_b

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "%s%02d%s%03d.hgt"

    new-array v5, v6, [Ljava/lang/Object;

    iget v6, v1, Lorg/rabochaya/projects/HgtRaster;->south:I

    if-gez v6, :cond_9

    goto :goto_6

    :cond_9
    const-string v7, "N"

    :goto_6
    aput-object v7, v5, v8

    iget v6, v1, Lorg/rabochaya/projects/HgtRaster;->south:I

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v2, 0x1

    aput-object v6, v5, v2

    iget v2, v1, Lorg/rabochaya/projects/HgtRaster;->west:I

    if-gez v2, :cond_a

    goto :goto_7

    :cond_a
    const-string v3, "E"

    :goto_7
    aput-object v3, v5, v9

    iget v2, v1, Lorg/rabochaya/projects/HgtRaster;->west:I

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x3

    aput-object v2, v5, v3

    invoke-static {v0, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lorg/rabochaya/projects/HgtRaster;->name:Ljava/lang/String;

    .line 12
    return-void

    .line 11
    :cond_b
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u041d\u0443\u0436\u0435\u043d \u043e\u0434\u043d\u043e\u0433\u0440\u0430\u0434\u0443\u0441\u043d\u044b\u0439 SRTM HGT1201\u00b2/3601\u00b2 int16; \u0440\u0430\u0437\u043c\u0435\u0440/\u0433\u0440\u0430\u043d\u0438\u0446\u044b \u043d\u0435 \u0441\u043e\u0432\u043f\u0430\u043b\u0438"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 10
    :cond_c
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u041d\u0443\u0436\u043d\u043e \u0438\u043c\u044f HGT \u0432\u0438\u0434\u0430 N55E037.hgt"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 12
    :catch_0
    move-exception v0

    iget-object v2, v1, Lorg/rabochaya/projects/HgtRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V

    instance-of v2, v0, Ljava/io/IOException;

    if-eqz v2, :cond_d

    check-cast v0, Ljava/io/IOException;

    throw v0

    :cond_d
    new-instance v2, Ljava/io/IOException;

    const-string v3, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043e\u0442\u043a\u0440\u044b\u0442\u044c HGT"

    invoke-direct {v2, v3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static owned(Ljava/io/File;J)Lorg/rabochaya/projects/HgtRaster;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 9
    new-instance v6, Lorg/rabochaya/projects/HgtRaster;

    const/4 v2, 0x0

    const/4 v5, 0x1

    move-object v0, v6

    move-object v1, p0

    move-wide v3, p1

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/HgtRaster;-><init>(Ljava/io/File;Ljava/lang/String;JZ)V

    return-object v6
.end method

.method public static prepare(Ljava/io/File;Ljava/lang/String;Ljava/io/File;J)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 17
    const-wide/16 v0, 0x0

    cmp-long v2, p3, v0

    if-lez v2, :cond_3

    invoke-virtual {p0}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {p2}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    new-instance v2, Lorg/rabochaya/projects/HgtRaster;

    invoke-direct {v2, p0, p1}, Lorg/rabochaya/projects/HgtRaster;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_0
    new-instance p1, Ljava/io/FileOutputStream;

    invoke-direct {p1, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_6

    :try_start_1
    new-instance p2, Ljava/io/DataOutputStream;

    invoke-direct {p2, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    :try_start_2
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    const p0, 0x524b4847

    :try_start_3
    invoke-virtual {p2, p0}, Ljava/io/DataOutputStream;->writeInt(I)V

    const/4 p0, 0x1

    invoke-virtual {p2, p0}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {p2, p3, p4}, Ljava/io/DataOutputStream;->writeLong(J)V

    iget p0, v2, Lorg/rabochaya/projects/HgtRaster;->west:I

    invoke-virtual {p2, p0}, Ljava/io/DataOutputStream;->writeInt(I)V

    iget p0, v2, Lorg/rabochaya/projects/HgtRaster;->south:I

    invoke-virtual {p2, p0}, Ljava/io/DataOutputStream;->writeInt(I)V

    iget p0, v2, Lorg/rabochaya/projects/HgtRaster;->samples:I

    invoke-virtual {p2, p0}, Ljava/io/DataOutputStream;->writeInt(I)V

    const/4 p0, 0x0

    invoke-virtual {p2, p0}, Ljava/io/DataOutputStream;->writeInt(I)V

    const/high16 p3, 0x10000

    new-array p3, p3, [B

    :goto_0
    invoke-virtual {v3, p3}, Ljava/io/InputStream;->read([B)I

    move-result p4

    const/4 v4, -0x1

    if-eq p4, v4, :cond_1

    int-to-long v4, p4

    add-long/2addr v0, v4

    const-wide/32 v4, 0x18bba42

    cmp-long v4, v0, v4

    if-gtz v4, :cond_0

    invoke-virtual {p2, p3, p0, p4}, Ljava/io/DataOutputStream;->write([BII)V

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p3, "HGT \u043f\u0440\u0435\u0432\u044b\u0448\u0430\u0435\u0442 \u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440"

    invoke-direct {p0, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_1
    throw p0

    :cond_1
    iget p0, v2, Lorg/rabochaya/projects/HgtRaster;->samples:I

    int-to-long p3, p0

    iget p0, v2, Lorg/rabochaya/projects/HgtRaster;->samples:I

    int-to-long v4, p0

    mul-long/2addr p3, v4

    const-wide/16 v4, 0x2

    mul-long/2addr p3, v4

    cmp-long p0, v0, p3

    if-nez p0, :cond_2

    invoke-virtual {p2}, Ljava/io/DataOutputStream;->flush()V

    invoke-virtual {p1}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/FileDescriptor;->sync()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :try_start_5
    invoke-virtual {p2}, Ljava/io/DataOutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    :try_start_6
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_6

    invoke-virtual {v2}, Lorg/rabochaya/projects/HgtRaster;->close()V

    return-void

    :cond_2
    :try_start_7
    new-instance p0, Ljava/io/IOException;

    const-string p3, "\u0418\u0441\u0445\u043e\u0434\u043d\u044b\u0439 HGT \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f \u043f\u0440\u0438 \u043a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u0438"

    invoke-direct {p0, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    :try_start_8
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p3

    :try_start_9
    invoke-virtual {p0, p3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_2
    throw p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :catchall_2
    move-exception p0

    :try_start_a
    invoke-virtual {p2}, Ljava/io/DataOutputStream;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    goto :goto_3

    :catchall_3
    move-exception p2

    :try_start_b
    invoke-virtual {p0, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_3
    throw p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    :catchall_4
    move-exception p0

    :try_start_c
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    goto :goto_4

    :catchall_5
    move-exception p1

    :try_start_d
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_4
    throw p0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_6

    :catchall_6
    move-exception p0

    :try_start_e
    invoke-virtual {v2}, Lorg/rabochaya/projects/HgtRaster;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_7

    goto :goto_5

    :catchall_7
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_5
    throw p0

    :cond_3
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041d\u0443\u0436\u0435\u043d \u0441\u043e\u0431\u0441\u0442\u0432\u0435\u043d\u043d\u044b\u0439 \u0432\u0440\u0435\u043c\u0435\u043d\u043d\u044b\u0439 DEM"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private sample(II)S
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    iget-object v0, p0, Lorg/rabochaya/projects/HgtRaster;->rows:Ljava/util/LinkedHashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [S

    if-nez v0, :cond_1

    iget v0, p0, Lorg/rabochaya/projects/HgtRaster;->samples:I

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [B

    iget-object v1, p0, Lorg/rabochaya/projects/HgtRaster;->file:Ljava/io/RandomAccessFile;

    iget v2, p0, Lorg/rabochaya/projects/HgtRaster;->offset:I

    int-to-long v2, v2

    int-to-long v4, p2

    iget v6, p0, Lorg/rabochaya/projects/HgtRaster;->samples:I

    int-to-long v6, v6

    mul-long/2addr v4, v6

    const-wide/16 v6, 0x2

    mul-long/2addr v4, v6

    add-long/2addr v2, v4

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object v1, p0, Lorg/rabochaya/projects/HgtRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v1, v0}, Ljava/io/RandomAccessFile;->readFully([B)V

    iget v1, p0, Lorg/rabochaya/projects/HgtRaster;->samples:I

    new-array v1, v1, [S

    const/4 v2, 0x0

    :goto_0
    iget v3, p0, Lorg/rabochaya/projects/HgtRaster;->samples:I

    if-ge v2, v3, :cond_0

    mul-int/lit8 v3, v2, 0x2

    aget-byte v4, v0, v3

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x8

    add-int/lit8 v3, v3, 0x1

    aget-byte v3, v0, v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v3, v4

    int-to-short v3, v3

    aput-short v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/HgtRaster;->rows:Ljava/util/LinkedHashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v0, p2, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v1

    :cond_1
    aget-short p1, v0, p1

    return p1
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 18
    :try_start_0
    iget-object v0, p0, Lorg/rabochaya/projects/HgtRaster;->rows:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->clear()V

    iget-object v0, p0, Lorg/rabochaya/projects/HgtRaster;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 18
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized height(DD)D
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v1, p0

    monitor-enter p0

    .line 15
    :try_start_0
    invoke-static/range {p1 .. p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    const-wide/high16 v2, 0x7ff8000000000000L    # Double.NaN

    if-nez v0, :cond_a

    invoke-static/range {p1 .. p2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-nez v0, :cond_a

    invoke-static/range {p3 .. p4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_a

    invoke-static/range {p3 .. p4}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_6

    :cond_0
    iget v0, v1, Lorg/rabochaya/projects/HgtRaster;->west:I

    const/16 v4, 0xb3

    const-wide v5, 0x4066800000000000L    # 180.0

    const-wide v7, -0x3f99800000000000L    # -180.0

    if-ne v0, v4, :cond_1

    cmpl-double v0, p1, v7

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    iget v0, v1, Lorg/rabochaya/projects/HgtRaster;->west:I

    const/16 v4, -0xb4

    if-ne v0, v4, :cond_2

    cmpl-double v0, p1, v5

    if-nez v0, :cond_2

    move-wide v5, v7

    goto :goto_0

    :cond_2
    move-wide/from16 v5, p1

    :goto_0
    iget v0, v1, Lorg/rabochaya/projects/HgtRaster;->west:I

    int-to-double v7, v0

    cmpg-double v0, v5, v7

    if-ltz v0, :cond_a

    iget v0, v1, Lorg/rabochaya/projects/HgtRaster;->west:I

    add-int/lit8 v0, v0, 0x1

    int-to-double v7, v0

    cmpl-double v0, v5, v7

    if-gtz v0, :cond_a

    iget v0, v1, Lorg/rabochaya/projects/HgtRaster;->south:I

    int-to-double v7, v0

    cmpg-double v0, p3, v7

    if-ltz v0, :cond_a

    iget v0, v1, Lorg/rabochaya/projects/HgtRaster;->south:I

    add-int/lit8 v0, v0, 0x1

    int-to-double v7, v0

    cmpl-double v0, p3, v7

    if-lez v0, :cond_3

    goto/16 :goto_6

    :cond_3
    iget v0, v1, Lorg/rabochaya/projects/HgtRaster;->west:I

    int-to-double v7, v0

    sub-double/2addr v5, v7

    iget v0, v1, Lorg/rabochaya/projects/HgtRaster;->samples:I

    add-int/lit8 v0, v0, -0x1

    int-to-double v7, v0

    mul-double/2addr v5, v7

    iget v0, v1, Lorg/rabochaya/projects/HgtRaster;->south:I

    add-int/lit8 v0, v0, 0x1

    int-to-double v7, v0

    sub-double v7, v7, p3

    iget v0, v1, Lorg/rabochaya/projects/HgtRaster;->samples:I

    add-int/lit8 v0, v0, -0x1

    int-to-double v9, v0

    mul-double/2addr v7, v9

    iget v0, v1, Lorg/rabochaya/projects/HgtRaster;->samples:I

    add-int/lit8 v0, v0, -0x1

    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    move-result-wide v9

    double-to-int v4, v9

    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget v4, v1, Lorg/rabochaya/projects/HgtRaster;->samples:I

    add-int/lit8 v4, v4, -0x1

    invoke-static {v7, v8}, Ljava/lang/Math;->floor(D)D

    move-result-wide v9

    double-to-int v9, v9

    invoke-static {v4, v9}, Ljava/lang/Math;->min(II)I

    move-result v4

    int-to-double v9, v0

    sub-double/2addr v5, v9

    int-to-double v9, v4

    sub-double/2addr v7, v9

    const-wide/16 v10, 0x0

    move-wide v13, v10

    const/4 v12, 0x0

    :goto_1
    const/4 v15, 0x2

    if-ge v12, v15, :cond_9

    const/4 v9, 0x0

    :goto_2
    if-ge v9, v15, :cond_8

    const-wide/high16 v16, 0x3ff0000000000000L    # 1.0

    if-nez v9, :cond_4

    sub-double v18, v16, v5

    goto :goto_3

    :cond_4
    move-wide/from16 v18, v5

    :goto_3
    if-nez v12, :cond_5

    sub-double v16, v16, v7

    goto :goto_4

    :cond_5
    move-wide/from16 v16, v7

    :goto_4
    mul-double v18, v18, v16

    cmpl-double v16, v18, v10

    if-nez v16, :cond_6

    goto :goto_5

    :cond_6
    iget v10, v1, Lorg/rabochaya/projects/HgtRaster;->samples:I

    add-int/lit8 v10, v10, -0x1

    add-int v11, v0, v9

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v10

    iget v11, v1, Lorg/rabochaya/projects/HgtRaster;->samples:I

    add-int/lit8 v11, v11, -0x1

    add-int v15, v4, v12

    invoke-static {v11, v15}, Ljava/lang/Math;->min(II)I

    move-result v11

    invoke-direct {v1, v10, v11}, Lorg/rabochaya/projects/HgtRaster;->sample(II)S

    move-result v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v11, -0x8000

    if-ne v10, v11, :cond_7

    monitor-exit p0

    return-wide v2

    :cond_7
    int-to-double v10, v10

    mul-double v10, v10, v18

    add-double/2addr v13, v10

    :goto_5
    add-int/lit8 v9, v9, 0x1

    const-wide/16 v10, 0x0

    const/4 v15, 0x2

    goto :goto_2

    :cond_8
    add-int/lit8 v12, v12, 0x1

    const-wide/16 v10, 0x0

    goto :goto_1

    :cond_9
    monitor-exit p0

    return-wide v13

    :cond_a
    :goto_6
    monitor-exit p0

    return-wide v2

    .line 15
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
