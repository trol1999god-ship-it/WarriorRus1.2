.class public final Lorg/rabochaya/projects/ProjectWrites;
.super Ljava/lang/Object;
.source "ProjectWrites.java"


# static fields
.field public static final MAX_FILE:I = 0x800000

.field public static final MAX_PROJECT:I = 0x2000000


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static put(Landroid/database/sqlite/SQLiteDatabase;JLjava/lang/String;[B)V
    .locals 6

    .line 34
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    array-length v2, p4

    const/high16 v3, 0x20000

    add-int/2addr v3, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    const-string v4, "project"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v4, "name"

    invoke-virtual {v3, v4, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v4, v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v5, "part"

    invoke-virtual {v3, v5, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "data"

    invoke-static {p4, v0, v2}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    invoke-virtual {v3, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v0, "payloads"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v3}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    array-length v0, p4

    if-lt v2, v0, :cond_0

    .line 35
    return-void

    .line 34
    :cond_0
    move v0, v2

    move v1, v4

    goto :goto_0
.end method

.method public static save(Lorg/rabochaya/projects/ProjectStore;JLorg/rabochaya/projects/KmlProject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 9
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, p3, v0}, Lorg/rabochaya/projects/ProjectWrites;->save(Lorg/rabochaya/projects/ProjectStore;JLorg/rabochaya/projects/KmlProject;Z)V

    .line 10
    return-void
.end method

.method private static save(Lorg/rabochaya/projects/ProjectStore;JLorg/rabochaya/projects/KmlProject;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    if-eqz p4, :cond_0

    invoke-static {p3}, Lorg/rabochaya/projects/MediaLinks;->collectUnused(Lorg/rabochaya/projects/KmlProject;)V

    .line 17
    :cond_0
    invoke-virtual {p3}, Lorg/rabochaya/projects/KmlProject;->xml()[B

    move-result-object p4

    array-length v0, p4

    const/high16 v1, 0x400000

    if-gt v0, v1, :cond_9

    .line 18
    iget-object v0, p3, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->size()I

    move-result v0

    const/16 v1, 0xff

    if-gt v0, v1, :cond_8

    .line 19
    array-length v0, p4

    int-to-long v0, v0

    iget-object v2, p3, Lorg/rabochaya/projects/KmlProject;->entry:Ljava/lang/String;

    invoke-static {v2}, Lorg/rabochaya/projects/KmlProject;->safePath(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    iget-object v2, p3, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 21
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lorg/rabochaya/projects/KmlProject;->safePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    .line 22
    iget-object v5, p3, Lorg/rabochaya/projects/KmlProject;->entry:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    if-eqz v3, :cond_2

    array-length v4, v3

    const/high16 v5, 0x800000

    if-gt v4, v5, :cond_2

    .line 23
    array-length v3, v3

    int-to-long v3, v3

    add-long/2addr v0, v3

    const-wide/32 v3, 0x2000000

    cmp-long v3, v0, v3

    if-gtz v3, :cond_1

    .line 24
    goto :goto_0

    .line 23
    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041f\u0440\u0435\u0434\u0435\u043b \u043f\u0440\u043e\u0435\u043a\u0442\u0430 \u0441 \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u044f\u043c\u0438 \u2014 32 \u041c\u0438\u0411"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 22
    :cond_2
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u043e\u0435 \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u0435 \u0438\u043b\u0438 \u043f\u0440\u0435\u0432\u044b\u0448\u0435\u043d\u0438\u0435 8 \u041c\u0438\u0411"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 25
    :cond_3
    invoke-virtual {p0}, Lorg/rabochaya/projects/ProjectStore;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 27
    :try_start_0
    const-string v0, "SELECT id FROM projects WHERE id=?"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p0, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    :try_start_1
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_6

    if-eqz v0, :cond_4

    :try_start_2
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 28
    :cond_4
    const-string v0, "payloads"

    const-string v2, "project=?"

    new-array v1, v1, [Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v4

    invoke-virtual {p0, v0, v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    const-string v0, ""

    invoke-static {p0, p1, p2, v0, p4}, Lorg/rabochaya/projects/ProjectWrites;->put(Landroid/database/sqlite/SQLiteDatabase;JLjava/lang/String;[B)V

    .line 29
    iget-object p3, p3, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    invoke-virtual {p3}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_5

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/util/Map$Entry;

    invoke-interface {p4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, [B

    invoke-static {p0, p1, p2, v0, p4}, Lorg/rabochaya/projects/ProjectWrites;->put(Landroid/database/sqlite/SQLiteDatabase;JLjava/lang/String;[B)V

    goto :goto_1

    .line 30
    :cond_5
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 31
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 32
    return-void

    .line 27
    :cond_6
    :try_start_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u041f\u0440\u043e\u0435\u043a\u0442 \u0443\u0434\u0430\u043b\u0451\u043d"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception p1

    if-eqz v0, :cond_7

    :try_start_4
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p2

    :try_start_5
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_7
    :goto_2
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 31
    :catchall_2
    move-exception p1

    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p1

    .line 18
    :cond_8
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041f\u0440\u0435\u0434\u0435\u043b \u043f\u0440\u043e\u0435\u043a\u0442\u0430 \u2014 255 \u0432\u043b\u043e\u0436\u0435\u043d\u043d\u044b\u0445 \u0444\u0430\u0439\u043b\u043e\u0432"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 17
    :cond_9
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041f\u0440\u0435\u0434\u0435\u043b KML \u2014 4 \u041c\u0438\u0411"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static savePreservingAssets(Lorg/rabochaya/projects/ProjectStore;JLorg/rabochaya/projects/KmlProject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lorg/rabochaya/projects/ProjectWrites;->save(Lorg/rabochaya/projects/ProjectStore;JLorg/rabochaya/projects/KmlProject;Z)V

    .line 14
    return-void
.end method
