.class public final Lorg/rabochaya/projects/GeometryDraft;
.super Ljava/lang/Object;
.source "GeometryDraft.java"


# static fields
.field private static final MAGIC:I = 0x524b4744

.field private static final MAX_BYTES:I = 0x1e8480

.field private static final UTF8:Ljava/nio/charset/Charset;


# instance fields
.field public final addingHole:Z

.field public final key:Ljava/lang/String;

.field public final text:Ljava/lang/String;

.field public final token:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 9
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/GeometryDraft;->UTF8:Ljava/nio/charset/Charset;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x200

    if-gt v0, v1, :cond_0

    const-string v0, "\\d+(?:\\.\\d+)*(?:/(?:outer|inner/\\d+))?"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, v1, :cond_0

    if-eqz p2, :cond_0

    const-string v0, "[0-9a-f]{64}"

    invoke-virtual {p2, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    const v1, 0x7a120

    if-gt v0, v1, :cond_0

    .line 16
    iput-object p1, p0, Lorg/rabochaya/projects/GeometryDraft;->key:Ljava/lang/String;

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryDraft;->token:Ljava/lang/String;

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryDraft;->text:Ljava/lang/String;

    iput-boolean p4, p0, Lorg/rabochaya/projects/GeometryDraft;->addingHole:Z

    .line 17
    return-void

    .line 15
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u0438"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static declared-synchronized delete(Ljava/io/File;JLjava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v0, Lorg/rabochaya/projects/GeometryDraft;

    monitor-enter v0

    .line 63
    :try_start_0
    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/GeometryDraft;->path(Ljava/io/File;JLjava/lang/String;)Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0443\u0434\u0430\u043b\u0438\u0442\u044c \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    :cond_1
    :goto_0
    monitor-exit v0

    return-void

    .line 62
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static digest([B)[B
    .locals 1

    .line 19
    :try_start_0
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 20
    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public static declared-synchronized discardIfMatches(Ljava/io/File;JLjava/lang/String;Lorg/rabochaya/projects/GeometryDraft;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v0, Lorg/rabochaya/projects/GeometryDraft;

    monitor-enter v0

    .line 67
    if-eqz p4, :cond_3

    .line 68
    :try_start_0
    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/GeometryDraft;->load(Ljava/io/File;JLjava/lang/String;)Lorg/rabochaya/projects/GeometryDraft;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v2, 0x1

    if-nez v1, :cond_0

    monitor-exit v0

    return v2

    .line 69
    :cond_0
    :try_start_1
    iget-object v3, v1, Lorg/rabochaya/projects/GeometryDraft;->key:Ljava/lang/String;

    iget-object v4, p4, Lorg/rabochaya/projects/GeometryDraft;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, v1, Lorg/rabochaya/projects/GeometryDraft;->token:Ljava/lang/String;

    iget-object v4, p4, Lorg/rabochaya/projects/GeometryDraft;->token:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, v1, Lorg/rabochaya/projects/GeometryDraft;->text:Ljava/lang/String;

    iget-object v4, p4, Lorg/rabochaya/projects/GeometryDraft;->text:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-boolean v1, v1, Lorg/rabochaya/projects/GeometryDraft;->addingHole:Z

    iget-boolean p4, p4, Lorg/rabochaya/projects/GeometryDraft;->addingHole:Z

    if-eq v1, p4, :cond_1

    goto :goto_0

    .line 70
    :cond_1
    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/GeometryDraft;->delete(Ljava/io/File;JLjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    return v2

    .line 69
    :cond_2
    :goto_0
    monitor-exit v0

    const/4 p0, 0x0

    return p0

    .line 66
    :catchall_0
    move-exception p0

    goto :goto_1

    .line 67
    :cond_3
    :try_start_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u041d\u0435 \u0443\u043a\u0430\u0437\u0430\u043d \u0441\u043e\u0431\u0441\u0442\u0432\u0435\u043d\u043d\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 66
    :goto_1
    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized load(Ljava/io/File;JLjava/lang/String;)Lorg/rabochaya/projects/GeometryDraft;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v0, Lorg/rabochaya/projects/GeometryDraft;

    monitor-enter v0

    .line 47
    :try_start_0
    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/GeometryDraft;->path(Ljava/io/File;JLjava/lang/String;)Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    if-nez v1, :cond_0

    monitor-exit v0

    const/4 p0, 0x0

    return-object p0

    .line 48
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v1

    const-wide/16 v3, 0x20

    cmp-long v1, v1, v3

    if-ltz v1, :cond_7

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v1

    const-wide/32 v3, 0x1f0480

    cmp-long v1, v1, v3

    if-gtz v1, :cond_7

    .line 49
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 50
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    const/16 p0, 0x2000

    :try_start_2
    new-array p0, p0, [B

    :goto_0
    invoke-virtual {v2, p0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_2

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v4

    add-int/2addr v4, v3

    const v5, 0x1f0480

    if-gt v4, v5, :cond_1

    const/4 v4, 0x0

    invoke-virtual {v1, p0, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u0427\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u0441\u043b\u0438\u0448\u043a\u043e\u043c \u0432\u0435\u043b\u0438\u043a"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :cond_2
    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 51
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    array-length v1, p0

    const/16 v2, 0x20

    if-lt v1, v2, :cond_6

    array-length v1, p0

    sub-int/2addr v1, v2

    invoke-static {p0, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v1

    array-length v3, p0

    sub-int/2addr v3, v2

    array-length v2, p0

    invoke-static {p0, v3, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p0

    .line 52
    invoke-static {v1}, Lorg/rabochaya/projects/GeometryDraft;->digest([B)[B

    move-result-object v2

    invoke-static {v2, p0}, Ljava/security/MessageDigest;->isEqual([B[B)Z

    move-result p0

    if-eqz p0, :cond_5

    .line 53
    new-instance p0, Ljava/io/DataInputStream;

    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v2}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    .line 54
    :try_start_4
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    const v2, 0x524b4744    # 2.182685E11f

    if-ne v1, v2, :cond_4

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_4

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v1

    cmp-long p1, v1, p1

    if-nez p1, :cond_4

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 55
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readBoolean()Z

    move-result p3

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    .line 56
    if-ltz v1, :cond_3

    const v2, 0x1e8480

    if-gt v1, v2, :cond_3

    invoke-virtual {p0}, Ljava/io/DataInputStream;->available()I

    move-result v2

    if-ne v1, v2, :cond_3

    .line 57
    new-array v1, v1, [B

    invoke-virtual {p0, v1}, Ljava/io/DataInputStream;->readFully([B)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 58
    :try_start_5
    new-instance v2, Lorg/rabochaya/projects/GeometryDraft;

    sget-object v3, Lorg/rabochaya/projects/GeometryDraft;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {v3}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v3

    sget-object v4, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v3, v4}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v3

    sget-object v4, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v3, v4}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v3

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, p1, p2, v1, p3}, Lorg/rabochaya/projects/GeometryDraft;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 60
    :try_start_6
    invoke-virtual {p0}, Ljava/io/DataInputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 58
    monitor-exit v0

    return-object v2

    .line 59
    :catch_0
    move-exception p1

    :try_start_7
    new-instance p2, Ljava/io/IOException;

    const-string p3, "\u041d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a"

    invoke-direct {p2, p3, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    .line 56
    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u0430\u044f \u0434\u043b\u0438\u043d\u0430 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a\u0430"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 54
    :cond_4
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u0427\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u043e\u0442\u043d\u043e\u0441\u0438\u0442\u0441\u044f \u043a \u0434\u0440\u0443\u0433\u043e\u043c\u0443 \u043e\u0431\u044a\u0435\u043a\u0442\u0443 \u0438\u043b\u0438 \u0432\u0435\u0440\u0441\u0438\u0438"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 53
    :catchall_0
    move-exception p1

    :try_start_8
    invoke-virtual {p0}, Ljava/io/DataInputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p0

    :try_start_9
    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw p1

    .line 52
    :cond_5
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u0427\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u043f\u043e\u0432\u0440\u0435\u0436\u0434\u0451\u043d; \u0444\u0430\u0439\u043b \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d \u0434\u043b\u044f \u0432\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d\u0438\u044f"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 51
    :cond_6
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u0427\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u043e\u0431\u0440\u0435\u0437\u0430\u043d"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 50
    :catchall_2
    move-exception p0

    :try_start_a
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception p1

    :try_start_b
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_2
    throw p0

    .line 48
    :cond_7
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a\u0430"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 46
    :catchall_4
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static path(Ljava/io/File;JLjava/lang/String;)Ljava/io/File;
    .locals 7

    .line 23
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_1

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1000

    if-gt v0, v1, :cond_1

    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lorg/rabochaya/projects/GeometryDraft;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {p3, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p3

    invoke-static {p3}, Lorg/rabochaya/projects/GeometryDraft;->digest([B)[B

    move-result-object p3

    array-length v1, p3

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_0

    aget-byte v4, p3, v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v4, v6, v2

    const-string v4, "%02x"

    invoke-static {v5, v4, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 25
    :cond_0
    new-instance p3, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "g_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "_"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ".draft"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object p3

    .line 23
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u041d\u0443\u0436\u0435\u043d \u0441\u0443\u0449\u0435\u0441\u0442\u0432\u0443\u044e\u0449\u0438\u0439 \u043e\u0431\u044a\u0435\u043a\u0442 \u043f\u0440\u043e\u0435\u043a\u0442\u0430"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private saveUnlocked(Ljava/io/File;JLjava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 31
    invoke-static {p1, p2, p3, p4}, Lorg/rabochaya/projects/GeometryDraft;->path(Ljava/io/File;JLjava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 32
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0441\u043e\u0437\u0434\u0430\u0442\u044c \u043a\u0430\u0442\u0430\u043b\u043e\u0433 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a\u043e\u0432"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 33
    :cond_1
    :goto_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 34
    new-instance v2, Ljava/io/DataOutputStream;

    invoke-direct {v2, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 35
    const v3, 0x524b4744    # 2.182685E11f

    :try_start_0
    invoke-virtual {v2, v3}, Ljava/io/DataOutputStream;->writeInt(I)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {v2, p2, p3}, Ljava/io/DataOutputStream;->writeLong(J)V

    invoke-virtual {v2, p4}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 36
    iget-object p2, p0, Lorg/rabochaya/projects/GeometryDraft;->key:Ljava/lang/String;

    invoke-virtual {v2, p2}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    iget-object p2, p0, Lorg/rabochaya/projects/GeometryDraft;->token:Ljava/lang/String;

    invoke-virtual {v2, p2}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    iget-boolean p2, p0, Lorg/rabochaya/projects/GeometryDraft;->addingHole:Z

    invoke-virtual {v2, p2}, Ljava/io/DataOutputStream;->writeBoolean(Z)V

    .line 37
    iget-object p2, p0, Lorg/rabochaya/projects/GeometryDraft;->text:Ljava/lang/String;

    sget-object p3, Lorg/rabochaya/projects/GeometryDraft;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, p3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    array-length p3, p2

    const p4, 0x1e8480

    if-gt p3, p4, :cond_5

    .line 38
    array-length p3, p2

    invoke-virtual {v2, p3}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {v2, p2}, Ljava/io/DataOutputStream;->write([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 39
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->close()V

    .line 40
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p2

    const-string p3, "geometry-"

    const-string p4, ".tmp"

    invoke-static {p3, p4, p1}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object p1

    .line 42
    :try_start_1
    new-instance p3, Ljava/io/FileOutputStream;

    invoke-direct {p3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    :try_start_2
    invoke-virtual {p3, p2}, Ljava/io/FileOutputStream;->write([B)V

    invoke-static {p2}, Lorg/rabochaya/projects/GeometryDraft;->digest([B)[B

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/io/FileOutputStream;->write([B)V

    invoke-virtual {p3}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object p2

    invoke-virtual {p2}, Ljava/io/FileDescriptor;->sync()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-virtual {p3}, Ljava/io/FileOutputStream;->close()V

    .line 43
    invoke-virtual {p1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-eqz p2, :cond_3

    .line 44
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 45
    :cond_2
    return-void

    .line 43
    :cond_3
    :try_start_4
    new-instance p2, Ljava/io/IOException;

    const-string p3, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0441\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a; \u043f\u0440\u043e\u0435\u043a\u0442 \u043d\u0435 \u0438\u0437\u043c\u0435\u043d\u0451\u043d"

    invoke-direct {p2, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 42
    :catchall_0
    move-exception p2

    :try_start_5
    invoke-virtual {p3}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p3

    :try_start_6
    invoke-virtual {p2, p3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw p2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 44
    :catchall_2
    move-exception p2

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p3

    if-eqz p3, :cond_4

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    :cond_4
    throw p2

    .line 37
    :cond_5
    :try_start_7
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0434\u043b\u0438\u043d\u043d\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 34
    :catchall_3
    move-exception p1

    :try_start_8
    invoke-virtual {v2}, Ljava/io/DataOutputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    goto :goto_2

    :catchall_4
    move-exception p2

    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_2
    throw p1
.end method


# virtual methods
.method public save(Ljava/io/File;JLjava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 28
    const-class v0, Lorg/rabochaya/projects/GeometryDraft;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/rabochaya/projects/GeometryDraft;->saveUnlocked(Ljava/io/File;JLjava/lang/String;)V

    monitor-exit v0

    .line 29
    return-void

    .line 28
    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
