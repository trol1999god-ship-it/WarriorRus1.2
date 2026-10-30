.class public final Lorg/rabochaya/projects/ObjectClipboard;
.super Ljava/lang/Object;
.source "ObjectClipboard.java"


# static fields
.field public static final MAX_BYTES:I = 0x100000


# instance fields
.field public final cut:Z

.field public final keys:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final project:J

.field public final token:Ljava/lang/String;


# direct methods
.method public constructor <init>(JZLjava/lang/String;Ljava/util/Collection;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JZ",
            "Ljava/lang/String;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_3

    if-eqz p4, :cond_3

    const-string v0, "[a-f0-9]{64}"

    invoke-virtual {p4, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    if-eqz p5, :cond_3

    invoke-interface {p5}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-interface {p5}, Ljava/util/Collection;->size()I

    move-result v0

    const/16 v1, 0x2710

    if-gt v0, v1, :cond_3

    .line 9
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-interface {p5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0432\u044b\u0431\u043e\u0440 \u0432 \u0431\u0443\u0444\u0435\u0440\u0435"

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x100

    if-gt v4, v5, :cond_1

    const-string v4, "(0|[1-9][0-9]*)(/(0|[1-9][0-9]*))*"

    invoke-virtual {v2, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string v4, "/"

    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    array-length v5, v5

    const/16 v6, 0x21

    if-gt v5, v6, :cond_1

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    :try_start_0
    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v4, v2

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_0

    aget-object v6, v2, v5

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 10
    :cond_2
    iput-wide p1, p0, Lorg/rabochaya/projects/ObjectClipboard;->project:J

    iput-boolean p3, p0, Lorg/rabochaya/projects/ObjectClipboard;->cut:Z

    iput-object p4, p0, Lorg/rabochaya/projects/ObjectClipboard;->token:Ljava/lang/String;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectClipboard;->keys:Ljava/util/List;

    .line 11
    return-void

    .line 8
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0431\u0443\u0444\u0435\u0440 \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static decode([B)Lorg/rabochaya/projects/ObjectClipboard;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 18
    const-string v0, "\u0411\u0443\u0444\u0435\u0440 \u043f\u043e\u0432\u0440\u0435\u0436\u0434\u0451\u043d; \u043e\u0447\u0438\u0441\u0442\u0438\u0442\u0435 \u0435\u0433\u043e \u0438 \u043f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u0435 \u0432\u044b\u0431\u043e\u0440"

    if-eqz p0, :cond_5

    array-length v1, p0

    const/16 v2, 0x20

    if-lt v1, v2, :cond_5

    array-length v1, p0

    const/high16 v3, 0x100000

    if-gt v1, v3, :cond_5

    array-length v1, p0

    sub-int/2addr v1, v2

    invoke-static {p0, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v1

    invoke-static {v1}, Lorg/rabochaya/projects/ObjectClipboard;->digest([B)[B

    move-result-object v3

    array-length v4, p0

    sub-int/2addr v4, v2

    array-length v2, p0

    invoke-static {p0, v4, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p0

    invoke-static {v3, p0}, Ljava/security/MessageDigest;->isEqual([B[B)Z

    move-result p0

    if-eqz p0, :cond_4

    .line 19
    :try_start_0
    new-instance p0, Ljava/io/DataInputStream;

    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v2}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    const v2, 0x524b4342

    if-ne v1, v2, :cond_3

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_3

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v4

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readBoolean()Z

    move-result v6

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    if-lt v1, v2, :cond_2

    const/16 v2, 0x2710

    if-gt v1, v2, :cond_2

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    invoke-virtual {p0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v8, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/io/DataInputStream;->available()I

    move-result p0

    if-nez p0, :cond_1

    new-instance p0, Lorg/rabochaya/projects/ObjectClipboard;

    move-object v3, p0

    invoke-direct/range {v3 .. v8}, Lorg/rabochaya/projects/ObjectClipboard;-><init>(JZLjava/lang/String;Ljava/util/Collection;)V

    return-object p0

    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string v1, "\u041b\u0438\u0448\u043d\u0438\u0435 \u0434\u0430\u043d\u043d\u044b\u0435 \u0432 \u0431\u0443\u0444\u0435\u0440\u0435"

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_1
    throw p0

    :cond_2
    new-instance p0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440 \u0431\u0443\u0444\u0435\u0440\u0430"

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    new-instance p0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435\u0438\u0437\u0432\u0435\u0441\u0442\u043d\u0430\u044f \u0432\u0435\u0440\u0441\u0438\u044f \u0431\u0443\u0444\u0435\u0440\u0430"

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 18
    :cond_4
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_5
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static digest([B)[B
    .locals 1

    .line 12
    :try_start_0
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method public encode()[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    const v2, 0x524b4342

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    iget-wide v2, p0, Lorg/rabochaya/projects/ObjectClipboard;->project:J

    invoke-virtual {v1, v2, v3}, Ljava/io/DataOutputStream;->writeLong(J)V

    iget-boolean v2, p0, Lorg/rabochaya/projects/ObjectClipboard;->cut:Z

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeBoolean(Z)V

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectClipboard;->token:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectClipboard;->keys:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectClipboard;->keys:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    array-length v2, v1

    add-int/lit8 v2, v2, 0x20

    const/high16 v3, 0x100000

    if-gt v2, v3, :cond_1

    invoke-static {v1}, Lorg/rabochaya/projects/ObjectClipboard;->digest([B)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write([B)V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0

    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0431\u043e\u043b\u044c\u0448\u043e\u0439 \u0432\u044b\u0431\u043e\u0440 \u0434\u043b\u044f \u0431\u0443\u0444\u0435\u0440\u0430"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public fingerprint()Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/rabochaya/projects/ObjectClipboard;->encode()[B

    move-result-object v1

    invoke-static {v1}, Lorg/rabochaya/projects/ObjectClipboard;->digest([B)[B

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_0

    aget-byte v5, v1, v4

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    and-int/lit16 v5, v5, 0xff

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v5, v7, v3

    const-string v5, "%02x"

    invoke-static {v6, v5, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
