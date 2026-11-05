.class public final Lorg/rabochaya/projects/ObjectClipboardWrites;
.super Ljava/lang/Object;
.source "ObjectClipboardWrites.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static capture(Lorg/rabochaya/projects/ProjectStore;JZLjava/util/List;Ljava/lang/String;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/rabochaya/projects/ProjectStore;",
            "JZ",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    invoke-virtual {p0}, Lorg/rabochaya/projects/ProjectStore;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object p0

    invoke-virtual {p0}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p0

    invoke-static {p0, p4, p5}, Lorg/rabochaya/projects/ObjectTree;->selection(Lorg/w3c/dom/Element;Ljava/util/Collection;Ljava/lang/String;)Ljava/util/List;

    move-result-object v6

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectClipboardWrites;->table(Landroid/database/sqlite/SQLiteDatabase;)V

    new-instance p0, Lorg/rabochaya/projects/ObjectClipboard;

    move-object v1, p0

    move-wide v2, p1

    move v4, p3

    move-object v5, p5

    invoke-direct/range {v1 .. v6}, Lorg/rabochaya/projects/ObjectClipboard;-><init>(JZLjava/lang/String;Ljava/util/Collection;)V

    invoke-static {v0, p0}, Lorg/rabochaya/projects/ObjectClipboardWrites;->put(Landroid/database/sqlite/SQLiteDatabase;Lorg/rabochaya/projects/ObjectClipboard;)V

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 14
    return-void

    .line 13
    :catchall_0
    move-exception p0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p0
.end method

.method public static clear(Lorg/rabochaya/projects/ProjectStore;)V
    .locals 3

    .line 11
    invoke-virtual {p0}, Lorg/rabochaya/projects/ProjectStore;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectClipboardWrites;->table(Landroid/database/sqlite/SQLiteDatabase;)V

    const-string v0, "slot=1"

    const/4 v1, 0x0

    const-string v2, "object_clipboard"

    invoke-virtual {p0, v2, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method

.method public static get(Lorg/rabochaya/projects/ProjectStore;)Lorg/rabochaya/projects/ObjectClipboard;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    invoke-virtual {p0}, Lorg/rabochaya/projects/ProjectStore;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    invoke-static {p0}, Lorg/rabochaya/projects/ObjectClipboardWrites;->read(Landroid/database/sqlite/SQLiteDatabase;)Lorg/rabochaya/projects/ObjectClipboard;

    move-result-object p0

    return-object p0
.end method

.method public static paste(Lorg/rabochaya/projects/ProjectStore;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/rabochaya/projects/KmlProject;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    invoke-virtual {p0}, Lorg/rabochaya/projects/ProjectStore;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v1

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectClipboardWrites;->read(Landroid/database/sqlite/SQLiteDatabase;)Lorg/rabochaya/projects/ObjectClipboard;

    move-result-object v2

    if-eqz v2, :cond_a

    invoke-virtual {v2}, Lorg/rabochaya/projects/ObjectClipboard;->fingerprint()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_9

    iget-wide v3, v2, Lorg/rabochaya/projects/ObjectClipboard;->project:J

    cmp-long p5, v3, p1

    if-nez p5, :cond_8

    iget-object p5, v2, Lorg/rabochaya/projects/ObjectClipboard;->token:Ljava/lang/String;

    invoke-virtual {p5, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_7

    invoke-virtual {v1}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p5

    invoke-static {p5}, Lorg/rabochaya/projects/ObjectTree;->token(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p4, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p5

    if-eqz p5, :cond_7

    .line 17
    new-instance p5, Ljava/util/ArrayList;

    invoke-direct {p5}, Ljava/util/ArrayList;-><init>()V

    iget-object v3, v2, Lorg/rabochaya/projects/ObjectClipboard;->keys:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v1}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object v5

    invoke-static {v5, v4}, Lorg/rabochaya/projects/ObjectTree;->resolve(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    invoke-interface {p5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 18
    :cond_0
    iget-boolean v3, v2, Lorg/rabochaya/projects/ObjectClipboard;->cut:Z

    if-eqz v3, :cond_1

    invoke-virtual {v1}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object v3

    iget-object v4, v2, Lorg/rabochaya/projects/ObjectClipboard;->keys:Ljava/util/List;

    invoke-static {v3, v4, p3, p4}, Lorg/rabochaya/projects/ObjectTree;->move(Lorg/w3c/dom/Element;Ljava/util/Collection;Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_1
    invoke-virtual {v1}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object v3

    iget-object v4, v2, Lorg/rabochaya/projects/ObjectClipboard;->keys:Ljava/util/List;

    invoke-static {v3, v4, p3, p4}, Lorg/rabochaya/projects/ObjectTree;->copy(Lorg/w3c/dom/Element;Ljava/util/Collection;Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    :goto_1
    invoke-virtual {v1}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p3

    invoke-static {p3}, Lorg/rabochaya/projects/ObjectTree;->normalizeRoot(Lorg/w3c/dom/Element;)V

    invoke-static {p0, p1, p2, v1}, Lorg/rabochaya/projects/ProjectWrites;->savePreservingAssets(Lorg/rabochaya/projects/ProjectStore;JLorg/rabochaya/projects/KmlProject;)V

    .line 20
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    iget-boolean p3, v2, Lorg/rabochaya/projects/ObjectClipboard;->cut:Z

    if-nez p3, :cond_5

    invoke-virtual {v1}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p3

    invoke-static {p3}, Lorg/rabochaya/projects/ObjectTree;->rows(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_2
    :goto_2
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_3

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lorg/rabochaya/projects/ObjectTree$Row;

    invoke-virtual {v1}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object v3

    iget-object v4, p4, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-static {v3, v4}, Lorg/rabochaya/projects/ObjectTree;->resolve(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    invoke-interface {p5, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object p4, p4, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-interface {v8, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_3
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result p3

    invoke-interface {p5}, Ljava/util/List;->size()I

    move-result p4

    if-ne p3, p4, :cond_4

    goto :goto_3

    :cond_4
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0441\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c \u0432\u044b\u0431\u043e\u0440 \u0431\u0443\u0444\u0435\u0440\u0430"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 22
    :cond_5
    :goto_3
    invoke-virtual {p0, p1, p2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object p0

    iget-boolean p3, v2, Lorg/rabochaya/projects/ObjectClipboard;->cut:Z

    if-eqz p3, :cond_6

    const-string p1, "object_clipboard"

    const-string p2, "slot=1"

    const/4 p3, 0x0

    invoke-virtual {v0, p1, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_4

    :cond_6
    new-instance p3, Lorg/rabochaya/projects/ObjectClipboard;

    invoke-virtual {p0}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p4

    invoke-static {p4}, Lorg/rabochaya/projects/ObjectTree;->token(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v7

    const/4 v6, 0x0

    move-object v3, p3

    move-wide v4, p1

    invoke-direct/range {v3 .. v8}, Lorg/rabochaya/projects/ObjectClipboard;-><init>(JZLjava/lang/String;Ljava/util/Collection;)V

    invoke-static {v0, p3}, Lorg/rabochaya/projects/ObjectClipboardWrites;->put(Landroid/database/sqlite/SQLiteDatabase;Lorg/rabochaya/projects/ObjectClipboard;)V

    .line 23
    :goto_4
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 23
    return-object p0

    .line 16
    :cond_7
    :try_start_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "\u041f\u0440\u043e\u0435\u043a\u0442 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f \u043f\u043e\u0441\u043b\u0435 \u0437\u0430\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u044f \u0431\u0443\u0444\u0435\u0440\u0430. \u041f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u0435 \u0432\u044b\u0431\u043e\u0440 \u0438 \u043a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u0435 \u0438\u043b\u0438 \u0432\u044b\u0440\u0435\u0437\u0430\u043d\u0438\u0435"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    :goto_5
    throw p0

    :cond_8
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "\u0411\u0443\u0444\u0435\u0440 \u043e\u0442\u043d\u043e\u0441\u0438\u0442\u0441\u044f \u043a \u0434\u0440\u0443\u0433\u043e\u043c\u0443 \u043f\u0440\u043e\u0435\u043a\u0442\u0443"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :cond_9
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "\u0411\u0443\u0444\u0435\u0440 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f. \u041e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0432\u0441\u0442\u0430\u0432\u043a\u0443 \u043f\u043e\u0432\u0442\u043e\u0440\u043d\u043e"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_5

    :cond_a
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "\u0411\u0443\u0444\u0435\u0440 \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432 \u043f\u0443\u0441\u0442"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_5

    .line 24
    :catchall_0
    move-exception p0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p0
.end method

.method private static put(Landroid/database/sqlite/SQLiteDatabase;Lorg/rabochaya/projects/ObjectClipboard;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 9
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "slot"

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "data"

    invoke-virtual {p1}, Lorg/rabochaya/projects/ObjectClipboard;->encode()[B

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const/4 p1, 0x0

    const/4 v1, 0x5

    const-string v2, "object_clipboard"

    invoke-virtual {p0, v2, p1, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide p0

    const-wide/16 v0, 0x0

    cmp-long p0, p0, v0

    if-ltz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u0411\u0443\u0444\u0435\u0440 \u043d\u0435 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static read(Landroid/database/sqlite/SQLiteDatabase;)Lorg/rabochaya/projects/ObjectClipboard;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8
    invoke-static {p0}, Lorg/rabochaya/projects/ObjectClipboardWrites;->table(Landroid/database/sqlite/SQLiteDatabase;)V

    const-string v0, "SELECT data FROM object_clipboard WHERE slot=1"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectClipboard;->decode([B)Lorg/rabochaya/projects/ObjectClipboard;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    if-eqz p0, :cond_1

    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    :cond_1
    return-object v1

    :catchall_0
    move-exception v0

    if-eqz p0, :cond_2

    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p0

    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    throw v0
.end method

.method private static table(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    .line 7
    const-string v0, "CREATE TABLE IF NOT EXISTS object_clipboard(slot INTEGER PRIMARY KEY CHECK(slot=1),data BLOB NOT NULL)"

    invoke-virtual {p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method
