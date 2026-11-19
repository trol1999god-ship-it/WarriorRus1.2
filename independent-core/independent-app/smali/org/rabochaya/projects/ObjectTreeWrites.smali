.class public final Lorg/rabochaya/projects/ObjectTreeWrites;
.super Ljava/lang/Object;
.source "ObjectTreeWrites.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/ObjectTreeWrites$EditResult;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Lorg/rabochaya/projects/ProjectStore;JLjava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Lorg/rabochaya/projects/KmlProject;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/rabochaya/projects/ProjectStore;",
            "J",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lorg/rabochaya/projects/KmlProject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 17
    const-string v7, ""

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-static/range {v0 .. v7}, Lorg/rabochaya/projects/ObjectTreeWrites;->apply(Lorg/rabochaya/projects/ProjectStore;JLjava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/rabochaya/projects/ObjectTreeWrites$EditResult;

    move-result-object p0

    iget-object p0, p0, Lorg/rabochaya/projects/ObjectTreeWrites$EditResult;->project:Lorg/rabochaya/projects/KmlProject;

    return-object p0
.end method

.method static apply(Lorg/rabochaya/projects/ProjectStore;JLjava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/rabochaya/projects/ObjectTreeWrites$EditResult;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/rabochaya/projects/ProjectStore;",
            "J",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lorg/rabochaya/projects/ObjectTreeWrites$EditResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 20
    const-string v0, "show"

    invoke-virtual {p0}, Lorg/rabochaya/projects/ProjectStore;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 21
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v2

    .line 22
    invoke-virtual {p7}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v2}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object v3

    invoke-static {v3}, Lorg/rabochaya/projects/ObjectTree;->token(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    .line 23
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "\u041f\u0440\u043e\u0435\u043a\u0442 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f. \u041f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0439\u0442\u0435 \u0441\u043f\u0438\u0441\u043e\u043a \u0438 \u043f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u0435 \u0432\u044b\u0431\u043e\u0440"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 25
    :cond_1
    :goto_0
    invoke-virtual {v2}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object v3

    invoke-static {v3, p7}, Lorg/rabochaya/projects/ObjectTree;->folderTrail(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 26
    const-string v4, "create"

    invoke-virtual {v4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_2

    invoke-virtual {v2}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p3

    invoke-interface {p4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    invoke-static {p3, p4, p6, p5}, Lorg/rabochaya/projects/ObjectTree;->createFolder(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 27
    :cond_2
    const-string v4, "rename"

    invoke-virtual {v4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {v2}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p3

    invoke-interface {p4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    invoke-static {p3, p4, p6, p5}, Lorg/rabochaya/projects/ObjectTree;->rename(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 28
    :cond_3
    const-string v4, "description"

    invoke-virtual {v4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v6, 0x1

    const-string v7, "\u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u043e\u0434\u0438\u043d \u043e\u0431\u044a\u0435\u043a\u0442"

    if-eqz v4, :cond_5

    if-eqz p4, :cond_4

    :try_start_1
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result p3

    if-ne p3, v6, :cond_4

    invoke-virtual {v2}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p3

    invoke-interface {p4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    invoke-static {p3, p4, p6, p5}, Lorg/rabochaya/projects/ObjectDescription;->apply(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p3

    if-nez p3, :cond_c

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    new-instance p0, Lorg/rabochaya/projects/ObjectTreeWrites$EditResult;

    invoke-direct {p0, v2, p7}, Lorg/rabochaya/projects/ObjectTreeWrites$EditResult;-><init>(Lorg/rabochaya/projects/KmlProject;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 28
    return-object p0

    :cond_4
    :try_start_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 29
    :cond_5
    invoke-static {p3}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->operation(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    if-eqz p4, :cond_6

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result p7

    if-ne p7, v6, :cond_6

    invoke-virtual {v2}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p7

    invoke-interface {p4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    invoke-static {p7, p4, p6, p3, p5}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->apply(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_6
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 30
    :cond_7
    const-string v4, "move"

    invoke-virtual {v4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-virtual {v2}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p3

    invoke-static {p3, p4, p5, p6}, Lorg/rabochaya/projects/ObjectTree;->move(Lorg/w3c/dom/Element;Ljava/util/Collection;Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 31
    :cond_8
    const-string p5, "delete"

    invoke-virtual {p5, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_9

    invoke-virtual {v2}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p3

    invoke-static {p3, p4, p6}, Lorg/rabochaya/projects/ObjectTree;->delete(Lorg/w3c/dom/Element;Ljava/util/Collection;Ljava/lang/String;)I

    goto :goto_2

    .line 32
    :cond_9
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-nez p5, :cond_b

    const-string p5, "hide"

    invoke-virtual {p5, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_a

    goto :goto_1

    .line 33
    :cond_a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u041d\u0435\u0438\u0437\u0432\u0435\u0441\u0442\u043d\u043e\u0435 \u0434\u0435\u0439\u0441\u0442\u0432\u0438\u0435"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 32
    :cond_b
    :goto_1
    invoke-virtual {v2}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p5

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    invoke-static {p5, p4, p3, p6}, Lorg/rabochaya/projects/ObjectVisibility;->apply(Lorg/w3c/dom/Element;Ljava/util/Collection;ZLjava/lang/String;)Lorg/rabochaya/projects/ObjectVisibility$Preview;

    move-result-object p3

    iget p3, p3, Lorg/rabochaya/projects/ObjectVisibility$Preview;->changed:I

    if-nez p3, :cond_c

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    new-instance p0, Lorg/rabochaya/projects/ObjectTreeWrites$EditResult;

    invoke-direct {p0, v2, p7}, Lorg/rabochaya/projects/ObjectTreeWrites$EditResult;-><init>(Lorg/rabochaya/projects/KmlProject;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 40
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 32
    return-object p0

    .line 34
    :cond_c
    :goto_2
    :try_start_3
    invoke-virtual {v2}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p3

    invoke-static {p3}, Lorg/rabochaya/projects/ObjectTree;->normalizeRoot(Lorg/w3c/dom/Element;)V

    .line 35
    invoke-virtual {v2}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p3

    invoke-static {p3, v3}, Lorg/rabochaya/projects/ObjectTree;->survivingFolder(Lorg/w3c/dom/Element;Ljava/util/List;)Ljava/lang/String;

    move-result-object p3

    .line 36
    invoke-static {p0, p1, p2, v2}, Lorg/rabochaya/projects/ProjectWrites;->savePreservingAssets(Lorg/rabochaya/projects/ProjectStore;JLorg/rabochaya/projects/KmlProject;)V

    .line 37
    invoke-virtual {p0, p1, p2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object p0

    .line 38
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 39
    new-instance p1, Lorg/rabochaya/projects/ObjectTreeWrites$EditResult;

    invoke-direct {p1, p0, p3}, Lorg/rabochaya/projects/ObjectTreeWrites$EditResult;-><init>(Lorg/rabochaya/projects/KmlProject;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 40
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 39
    return-object p1

    .line 40
    :catchall_0
    move-exception p0

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p0
.end method

.method public static assignSvg(Lorg/rabochaya/projects/ProjectStore;JLjava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Lorg/rabochaya/projects/KmlProject;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 73
    nop

    .line 74
    :try_start_0
    invoke-static {p5}, Lorg/rabochaya/projects/ObjectTreeWrites;->readSvg(Ljava/io/InputStream;)[B

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 75
    if-eqz p5, :cond_0

    invoke-virtual {p5}, Ljava/io/InputStream;->close()V

    .line 76
    :cond_0
    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "icons/rk-"

    invoke-virtual {p5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p5

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectTreeWrites;->digest([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p5

    const-string v1, ".svg"

    invoke-virtual {p5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    .line 77
    invoke-virtual {p0}, Lorg/rabochaya/projects/ProjectStore;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 78
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 80
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v2

    .line 81
    invoke-virtual {v2}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object v3

    invoke-static {v3, p3, p4}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->marker(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p3

    .line 82
    iget-object p4, v2, Lorg/rabochaya/projects/KmlProject;->entry:Ljava/lang/String;

    invoke-static {p4}, Lorg/rabochaya/projects/KmlProject;->safePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    .line 83
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v4, 0x2f

    invoke-virtual {p4, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    const/4 v5, 0x0

    invoke-virtual {p4, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 84
    iget-object v4, v2, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    invoke-virtual {v4, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    .line 85
    invoke-virtual {v3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-nez p4, :cond_3

    if-eqz v4, :cond_1

    invoke-static {v4, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result p4

    if-eqz p4, :cond_3

    .line 88
    :cond_1
    if-nez v4, :cond_2

    iget-object p4, v2, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    invoke-virtual {p4, v3, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    :cond_2
    invoke-static {p3, p5}, Lorg/rabochaya/projects/KmlComponentStyleEdit;->assignIcon(Lorg/w3c/dom/Element;Ljava/lang/String;)V

    .line 90
    invoke-static {p0, p1, p2, v2}, Lorg/rabochaya/projects/ProjectWrites;->savePreservingAssets(Lorg/rabochaya/projects/ProjectStore;JLorg/rabochaya/projects/KmlProject;)V

    .line 91
    invoke-virtual {p0, p1, p2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object p0

    .line 92
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    nop

    .line 95
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 93
    return-object p0

    .line 86
    :cond_3
    :try_start_2
    new-instance p0, Ljava/io/IOException;

    const-string p1, "SVG: \u043f\u0443\u0442\u044c \u0437\u043d\u0430\u0447\u043a\u0430 \u0443\u0436\u0435 \u0437\u0430\u043d\u044f\u0442"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 95
    :catchall_0
    move-exception p0

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 96
    throw p0

    .line 73
    :catchall_1
    move-exception p0

    if-eqz p5, :cond_4

    :try_start_3
    invoke-virtual {p5}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_0

    :catchall_2
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_4
    :goto_0
    throw p0
.end method

.method private static digest([B)Ljava/lang/String;
    .locals 8

    .line 117
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 118
    const-string v1, "SHA-256"

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_0

    aget-byte v4, p0, v3

    .line 119
    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v6, "%02x"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v7, v2

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 121
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 122
    :catch_0
    move-exception p0

    .line 123
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method private static readSvg(Ljava/io/InputStream;)[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 100
    if-eqz p0, :cond_3

    .line 101
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 102
    const/16 v1, 0x1000

    new-array v1, v1, [B

    .line 103
    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 104
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v3

    add-int/2addr v3, v2

    const/high16 v4, 0x10000

    if-gt v3, v4, :cond_0

    .line 105
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 104
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string v0, "SVG: \u0444\u0430\u0439\u043b \u0431\u043e\u043b\u044c\u0448\u0435 64 \u041a\u0438\u0411"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 107
    :cond_1
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    .line 108
    invoke-static {p0}, Lorg/rabochaya/projects/SvgIcon;->parse([B)Lorg/rabochaya/projects/SvgIcon;

    move-result-object v0

    .line 109
    iget-wide v1, v0, Lorg/rabochaya/projects/SvgIcon;->pixelWidth:D

    const-wide/high16 v3, 0x4070000000000000L    # 256.0

    cmpl-double v1, v1, v3

    if-gtz v1, :cond_2

    iget-wide v0, v0, Lorg/rabochaya/projects/SvgIcon;->pixelHeight:D

    cmpl-double v0, v0, v3

    if-gtz v0, :cond_2

    .line 112
    return-object p0

    .line 110
    :cond_2
    new-instance p0, Ljava/io/IOException;

    const-string v0, "SVG: \u0440\u0430\u0437\u043c\u0435\u0440 \u0437\u043d\u0430\u0447\u043a\u0430 \u0431\u043e\u043b\u044c\u0448\u0435 256 \u00d7 256 px"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 100
    :cond_3
    new-instance p0, Ljava/io/IOException;

    const-string v0, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043e\u0442\u043a\u0440\u044b\u0442\u044c SVG"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static saveMapFeature(Lorg/rabochaya/projects/ProjectStore;JLorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lorg/rabochaya/projects/KmlProject;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/rabochaya/projects/ProjectStore;",
            "J",
            "Lorg/w3c/dom/Element;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "[D>;)",
            "Lorg/rabochaya/projects/KmlProject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 47
    invoke-virtual {p0}, Lorg/rabochaya/projects/ProjectStore;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 48
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 50
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v1

    .line 51
    if-nez p3, :cond_0

    .line 52
    invoke-virtual {v1}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p3

    invoke-static {p3, p4, p5, p6, p7}, Lorg/rabochaya/projects/FeatureEdits;->create(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lorg/w3c/dom/Element;

    goto :goto_0

    .line 54
    :cond_0
    const-string p4, "id"

    invoke-interface {p3, p4}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {v1, p4}, Lorg/rabochaya/projects/KmlProject;->byId(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p4

    .line 55
    if-eqz p4, :cond_2

    invoke-interface {p4, p3}, Lorg/w3c/dom/Element;->isEqualNode(Lorg/w3c/dom/Node;)Z

    move-result p3

    if-eqz p3, :cond_2

    .line 58
    invoke-static {p4, p5, p6}, Lorg/rabochaya/projects/FeatureEdits;->metadata(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    if-eqz p7, :cond_1

    invoke-static {p4, p7}, Lorg/rabochaya/projects/FeatureEdits;->movePoint(Lorg/w3c/dom/Element;Ljava/util/List;)V

    .line 61
    :cond_1
    :goto_0
    invoke-static {p0, p1, p2, v1}, Lorg/rabochaya/projects/ProjectWrites;->savePreservingAssets(Lorg/rabochaya/projects/ProjectStore;JLorg/rabochaya/projects/KmlProject;)V

    .line 62
    invoke-virtual {p0, p1, p2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object p0

    .line 63
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    nop

    .line 66
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 64
    return-object p0

    .line 56
    :cond_2
    :try_start_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "\u041e\u0431\u044a\u0435\u043a\u0442 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f. \u041e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0435\u0433\u043e \u0437\u0430\u043d\u043e\u0432\u043e"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    :catchall_0
    move-exception p0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 67
    throw p0
.end method
