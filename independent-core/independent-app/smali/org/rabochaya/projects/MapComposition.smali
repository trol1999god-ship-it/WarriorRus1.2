.class public final Lorg/rabochaya/projects/MapComposition;
.super Ljava/lang/Object;
.source "MapComposition.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/MapComposition$Layer;
    }
.end annotation


# static fields
.field private static final MAGIC:I = 0x524b4c59

.field private static final MAX_BYTES:I = 0x20000

.field public static final MAX_LAYERS:I = 0x10


# instance fields
.field public final layers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/MapComposition$Layer;",
            ">;"
        }
    .end annotation
.end field

.field public final project:J


# direct methods
.method public constructor <init>(JLjava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/MapComposition$Layer;",
            ">;)V"
        }
    .end annotation

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_2

    if-eqz p3, :cond_2

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x10

    if-gt v0, v1, :cond_2

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/MapComposition$Layer;

    if-eqz v2, :cond_0

    iget-object v3, v2, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041f\u043e\u0432\u0442\u043e\u0440\u044f\u044e\u0449\u0438\u0439\u0441\u044f \u0441\u043b\u043e\u0439 \u043a\u0430\u0440\u0442\u044b"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    iput-wide p1, p0, Lorg/rabochaya/projects/MapComposition;->project:J

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    return-void

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u0430\u044f \u043a\u043e\u043c\u043f\u043e\u0437\u0438\u0446\u0438\u044f \u043a\u0430\u0440\u0442"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static decode([BJ)Lorg/rabochaya/projects/MapComposition;
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 34
    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    if-eqz v0, :cond_5

    array-length v3, v0

    const/16 v4, 0x34

    if-lt v3, v4, :cond_5

    array-length v3, v0

    const/high16 v4, 0x20000

    if-gt v3, v4, :cond_5

    array-length v3, v0

    add-int/lit8 v3, v3, -0x20

    invoke-static {v0, v3}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v3

    invoke-static {v3}, Lorg/rabochaya/projects/MapComposition;->digest([B)[B

    move-result-object v4

    array-length v5, v0

    add-int/lit8 v5, v5, -0x20

    array-length v6, v0

    invoke-static {v0, v5, v6}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    invoke-static {v4, v0}, Ljava/security/MessageDigest;->isEqual([B[B)Z

    move-result v0

    if-eqz v0, :cond_4

    :try_start_0
    new-instance v4, Ljava/io/DataInputStream;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v4, v0}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    const v3, 0x524b4c59

    if-ne v0, v3, :cond_3

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    const/4 v3, 0x1

    if-ne v0, v3, :cond_3

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v5

    cmp-long v0, v5, v1

    if-nez v0, :cond_3

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    if-ltz v0, :cond_2

    const/16 v3, 0x10

    if-gt v0, v3, :cond_2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v0, :cond_0

    new-instance v15, Lorg/rabochaya/projects/MapComposition$Layer;

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v13

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v14

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readBoolean()Z

    move-result v16

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readBoolean()Z

    move-result v17

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v18

    const/16 v19, 0x0

    move-object v6, v15

    move/from16 p0, v0

    move-object v0, v15

    move/from16 v15, v16

    move/from16 v16, v17

    move/from16 v17, v18

    move-object/from16 v18, v19

    invoke-direct/range {v6 .. v18}, Lorg/rabochaya/projects/MapComposition$Layer;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZZILorg/rabochaya/projects/MapComposition$1;)V

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    move/from16 v0, p0

    goto :goto_0

    :cond_0
    invoke-virtual {v4}, Ljava/io/DataInputStream;->available()I

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lorg/rabochaya/projects/MapComposition;

    invoke-direct {v0, v1, v2, v3}, Lorg/rabochaya/projects/MapComposition;-><init>(JLjava/util/List;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-virtual {v4}, Ljava/io/DataInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0

    return-object v0

    :cond_1
    :try_start_3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041b\u0438\u0448\u043d\u0438\u0435 \u0434\u0430\u043d\u043d\u044b\u0435 \u0441\u043e\u0441\u0442\u0430\u0432\u0430 \u043a\u0430\u0440\u0442"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_1
    throw v0

    :cond_2
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u043e\u0435 \u0447\u0438\u0441\u043b\u043e \u0441\u043b\u043e\u0451\u0432"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0421\u043e\u0441\u0442\u0430\u0432 \u043e\u0442\u043d\u043e\u0441\u0438\u0442\u0441\u044f \u043a \u0434\u0440\u0443\u0433\u043e\u043c\u0443 \u043f\u0440\u043e\u0435\u043a\u0442\u0443 \u0438\u043b\u0438 \u0432\u0435\u0440\u0441\u0438\u0438"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object v1, v0

    :try_start_4
    invoke-virtual {v4}, Ljava/io/DataInputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v0

    move-object v2, v0

    :try_start_5
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_2
    throw v1
    :try_end_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_5} :catch_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/io/IOException;

    const-string v2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0441\u043e\u0441\u0442\u0430\u0432 \u043a\u0430\u0440\u0442"

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :cond_4
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0421\u043e\u0441\u0442\u0430\u0432 \u043a\u0430\u0440\u0442 \u043f\u043e\u0432\u0440\u0435\u0436\u0434\u0451\u043d; \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u0435 \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438 \u043d\u0435 \u0438\u0437\u043c\u0435\u043d\u0435\u043d\u044b"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0440\u0430\u0437\u043c\u0435\u0440 \u0441\u043e\u0441\u0442\u0430\u0432\u0430 \u043a\u0430\u0440\u0442"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static digest([B)[B
    .locals 1

    .line 32
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

.method private index(Ljava/lang/String;)I
    .locals 2

    .line 26
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/MapComposition$Layer;

    iget-object v1, v1, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u0421\u043b\u043e\u0439 \u0431\u043e\u043b\u044c\u0448\u0435 \u043d\u0435 \u043d\u0430\u0439\u0434\u0435\u043d"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public add(Lorg/rabochaya/projects/MapComposition$Layer;)Lorg/rabochaya/projects/MapComposition;
    .locals 3

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p1, Lorg/rabochaya/projects/MapComposition;

    iget-wide v1, p0, Lorg/rabochaya/projects/MapComposition;->project:J

    invoke-direct {p1, v1, v2, v0}, Lorg/rabochaya/projects/MapComposition;-><init>(JLjava/util/List;)V

    return-object p1
.end method

.method public attributions()Ljava/lang/String;
    .locals 5

    .line 25
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iget-object v1, p0, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/MapComposition$Layer;

    iget-boolean v3, v2, Lorg/rabochaya/projects/MapComposition$Layer;->visible:Z

    if-eqz v3, :cond_0

    iget v3, v2, Lorg/rabochaya/projects/MapComposition$Layer;->opacity:I

    if-lez v3, :cond_0

    invoke-virtual {v2}, Lorg/rabochaya/projects/MapComposition$Layer;->source()Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    if-eqz v3, :cond_1

    iget-object v2, v3, Lorg/rabochaya/projects/TileSource;->attribution:Ljava/lang/String;

    :goto_1
    invoke-virtual {v0, v2}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const-string v3, "local"

    iget-object v4, v2, Lorg/rabochaya/projects/MapComposition$Layer;->kind:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "bundled"

    iget-object v4, v2, Lorg/rabochaya/projects/MapComposition$Layer;->kind:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_2
    iget-object v2, v2, Lorg/rabochaya/projects/MapComposition$Layer;->name:Ljava/lang/String;

    goto :goto_1

    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_4

    const-string v3, " \u00b7 "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_4
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_5
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encode()[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 33
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    const v2, 0x524b4c59

    :try_start_0
    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    iget-wide v2, p0, Lorg/rabochaya/projects/MapComposition;->project:J

    invoke-virtual {v1, v2, v3}, Ljava/io/DataOutputStream;->writeLong(J)V

    iget-object v2, p0, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    iget-object v2, p0, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/rabochaya/projects/MapComposition$Layer;

    iget-object v4, v3, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    iget-object v4, v3, Lorg/rabochaya/projects/MapComposition$Layer;->kind:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    iget-object v4, v3, Lorg/rabochaya/projects/MapComposition$Layer;->key:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    iget-object v4, v3, Lorg/rabochaya/projects/MapComposition$Layer;->name:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    iget-object v4, v3, Lorg/rabochaya/projects/MapComposition$Layer;->template:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    iget-object v4, v3, Lorg/rabochaya/projects/MapComposition$Layer;->attribution:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    iget v4, v3, Lorg/rabochaya/projects/MapComposition$Layer;->minZoom:I

    invoke-virtual {v1, v4}, Ljava/io/DataOutputStream;->writeInt(I)V

    iget v4, v3, Lorg/rabochaya/projects/MapComposition$Layer;->maxZoom:I

    invoke-virtual {v1, v4}, Ljava/io/DataOutputStream;->writeInt(I)V

    iget-boolean v4, v3, Lorg/rabochaya/projects/MapComposition$Layer;->downloads:Z

    invoke-virtual {v1, v4}, Ljava/io/DataOutputStream;->writeBoolean(Z)V

    iget-boolean v4, v3, Lorg/rabochaya/projects/MapComposition$Layer;->visible:Z

    invoke-virtual {v1, v4}, Ljava/io/DataOutputStream;->writeBoolean(Z)V

    iget v3, v3, Lorg/rabochaya/projects/MapComposition$Layer;->opacity:I

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeInt(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    array-length v2, v1

    add-int/lit8 v2, v2, 0x20

    const/high16 v3, 0x20000

    if-gt v2, v3, :cond_1

    invoke-static {v1}, Lorg/rabochaya/projects/MapComposition;->digest([B)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write([B)V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0

    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0431\u043e\u043b\u044c\u0448\u043e\u0439 \u0441\u043e\u0441\u0442\u0430\u0432 \u043a\u0430\u0440\u0442"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v0

    :try_start_1
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v1

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw v0
.end method

.method public move(Ljava/lang/String;I)Lorg/rabochaya/projects/MapComposition;
    .locals 3

    .line 29
    if-ltz p2, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p2, v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapComposition;->index(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/rabochaya/projects/MapComposition$Layer;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    new-instance p1, Lorg/rabochaya/projects/MapComposition;

    iget-wide v1, p0, Lorg/rabochaya/projects/MapComposition;->project:J

    invoke-direct {p1, v1, v2, v0}, Lorg/rabochaya/projects/MapComposition;-><init>(JLjava/util/List;)V

    return-object p1

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041f\u043e\u0437\u0438\u0446\u0438\u044f \u0441\u043b\u043e\u044f \u0432\u043d\u0435 \u0441\u043e\u0441\u0442\u0430\u0432\u0430"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public opacity(Ljava/lang/String;I)Lorg/rabochaya/projects/MapComposition;
    .locals 3

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapComposition;->index(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/MapComposition$Layer;

    invoke-virtual {v1, p2}, Lorg/rabochaya/projects/MapComposition$Layer;->opacity(I)Lorg/rabochaya/projects/MapComposition$Layer;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lorg/rabochaya/projects/MapComposition;

    iget-wide v1, p0, Lorg/rabochaya/projects/MapComposition;->project:J

    invoke-direct {p1, v1, v2, v0}, Lorg/rabochaya/projects/MapComposition;-><init>(JLjava/util/List;)V

    return-object p1
.end method

.method public remove(Ljava/lang/String;)Lorg/rabochaya/projects/MapComposition;
    .locals 3

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapComposition;->index(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    new-instance p1, Lorg/rabochaya/projects/MapComposition;

    iget-wide v1, p0, Lorg/rabochaya/projects/MapComposition;->project:J

    invoke-direct {p1, v1, v2, v0}, Lorg/rabochaya/projects/MapComposition;-><init>(JLjava/util/List;)V

    return-object p1
.end method

.method public visible(Ljava/lang/String;Z)Lorg/rabochaya/projects/MapComposition;
    .locals 3

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapComposition;->index(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/MapComposition$Layer;

    invoke-virtual {v1, p2}, Lorg/rabochaya/projects/MapComposition$Layer;->visible(Z)Lorg/rabochaya/projects/MapComposition$Layer;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lorg/rabochaya/projects/MapComposition;

    iget-wide v1, p0, Lorg/rabochaya/projects/MapComposition;->project:J

    invoke-direct {p1, v1, v2, v0}, Lorg/rabochaya/projects/MapComposition;-><init>(JLjava/util/List;)V

    return-object p1
.end method
