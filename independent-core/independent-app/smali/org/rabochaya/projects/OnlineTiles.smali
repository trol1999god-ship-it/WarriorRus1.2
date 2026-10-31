.class public final Lorg/rabochaya/projects/OnlineTiles;
.super Ljava/lang/Object;
.source "OnlineTiles.java"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field public static final MAX_BYTES:J = 0x10000000L

.field private static final MAX_TILE:I = 0x100000


# instance fields
.field private volatile active:Ljavax/net/ssl/HttpsURLConnection;

.field private volatile closed:Z

.field private final db:Landroid/database/sqlite/SQLiteDatabase;

.field public final source:Lorg/rabochaya/projects/TileSource;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/rabochaya/projects/TileSource;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lorg/rabochaya/projects/OnlineTiles;->source:Lorg/rabochaya/projects/TileSource;

    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p1

    const-string v1, "tile-cache"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0441\u043e\u0437\u0434\u0430\u0442\u044c \u043a\u0435\u0448"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    new-instance p1, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p2, Lorg/rabochaya/projects/TileSource;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".mbtiles"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/io/File;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 7
    iget-object p1, p0, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v0, "CREATE TABLE IF NOT EXISTS tiles(zoom_level INTEGER NOT NULL,tile_column INTEGER NOT NULL,tile_row INTEGER NOT NULL,tile_data BLOB NOT NULL,expires INTEGER NOT NULL,etag TEXT,modified TEXT,pinned INTEGER NOT NULL DEFAULT 0)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object p1, p0, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v0, "CREATE UNIQUE INDEX IF NOT EXISTS tile_index ON tiles(zoom_level,tile_column,tile_row)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-object p1, p0, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v0, "CREATE TABLE IF NOT EXISTS metadata(name TEXT PRIMARY KEY,value TEXT)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const-string p1, "name"

    iget-object v0, p2, Lorg/rabochaya/projects/TileSource;->name:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lorg/rabochaya/projects/OnlineTiles;->putMeta(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "attribution"

    iget-object p2, p2, Lorg/rabochaya/projects/TileSource;->attribution:Ljava/lang/String;

    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/OnlineTiles;->putMeta(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "scheme"

    const-string p2, "tms"

    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/OnlineTiles;->putMeta(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "type"

    const-string p2, "baselayer"

    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/OnlineTiles;->putMeta(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private args(III)[Ljava/lang/String;
    .locals 3

    .line 10
    iget-object v0, p0, Lorg/rabochaya/projects/OnlineTiles;->source:Lorg/rabochaya/projects/TileSource;

    invoke-virtual {v0, p1, p2, p3}, Lorg/rabochaya/projects/TileSource;->url(III)Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    int-to-long v1, p3

    invoke-static {p1, v1, v2}, Lorg/rabochaya/projects/MapMath;->tmsRow(IJ)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    filled-new-array {v0, p2, p1}, [Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private bytes(IIIZZ)[B
    .locals 24
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    move-object/from16 v1, p0

    move/from16 v0, p1

    move/from16 v2, p3

    iget-boolean v3, v1, Lorg/rabochaya/projects/OnlineTiles;->closed:Z

    const-string v4, "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430 \u043e\u0442\u043c\u0435\u043d\u0435\u043d\u0430"

    if-nez v3, :cond_29

    invoke-direct/range {p0 .. p3}, Lorg/rabochaya/projects/OnlineTiles;->args(III)[Ljava/lang/String;

    move-result-object v3

    .line 16
    iget-object v5, v1, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v6, "SELECT tile_data,expires,etag,modified,pinned FROM tiles WHERE zoom_level=? AND tile_column=? AND tile_row=?"

    invoke-virtual {v5, v6, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    :try_start_0
    invoke-interface {v5}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-eqz v6, :cond_0

    invoke-interface {v5, v10}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v6

    invoke-interface {v5, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    const/4 v14, 0x2

    invoke-interface {v5, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x3

    invoke-interface {v5, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    const/4 v7, 0x4

    invoke-interface {v5, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_9

    goto :goto_0

    :cond_0
    move v7, v10

    const/4 v6, 0x0

    const-wide/16 v12, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    :goto_0
    if-eqz v5, :cond_1

    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 17
    :cond_1
    const-string v5, "zoom_level=? AND tile_column=? AND tile_row=?"

    const-string v8, "pinned"

    const-string v11, "tiles"

    if-eqz v6, :cond_5

    if-eqz p4, :cond_2

    if-nez p5, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    cmp-long v12, v12, v16

    if-lez v12, :cond_5

    :cond_2
    if-eqz p5, :cond_4

    if-nez v7, :cond_4

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v8, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object v2, v1, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2, v11, v0, v5, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    if-ne v0, v9, :cond_3

    goto :goto_1

    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0437\u0430\u043a\u0440\u0435\u043f\u0438\u0442\u044c \u0442\u0430\u0439\u043b \u0432 \u043a\u0435\u0448\u0435. \u041f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u0435 \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0443"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    :goto_1
    return-object v6

    :cond_5
    if-nez p4, :cond_6

    return-object v6

    .line 19
    :cond_6
    :try_start_1
    new-instance v12, Ljava/net/URL;

    iget-object v13, v1, Lorg/rabochaya/projects/OnlineTiles;->source:Lorg/rabochaya/projects/TileSource;

    move/from16 v9, p2

    invoke-virtual {v13, v0, v9, v2}, Lorg/rabochaya/projects/TileSource;->url(III)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v12

    check-cast v12, Ljavax/net/ssl/HttpsURLConnection;

    iput-object v12, v1, Lorg/rabochaya/projects/OnlineTiles;->active:Ljavax/net/ssl/HttpsURLConnection;

    invoke-virtual {v12, v10}, Ljavax/net/ssl/HttpsURLConnection;->setInstanceFollowRedirects(Z)V

    const/16 v13, 0x2710

    invoke-virtual {v12, v13}, Ljavax/net/ssl/HttpsURLConnection;->setConnectTimeout(I)V

    const/16 v13, 0x3a98

    invoke-virtual {v12, v13}, Ljavax/net/ssl/HttpsURLConnection;->setReadTimeout(I)V

    const-string v13, "GET"

    invoke-virtual {v12, v13}, Ljavax/net/ssl/HttpsURLConnection;->setRequestMethod(Ljava/lang/String;)V

    invoke-virtual {v12, v10}, Ljavax/net/ssl/HttpsURLConnection;->setDoOutput(Z)V

    const-string v13, "User-Agent"

    const-string v10, "RabochayaKarta/26 (Android; interactive raster map)"

    invoke-virtual {v12, v13, v10}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "Accept"

    const-string v13, "image/png,image/jpeg,image/webp,image/*;q=0.8"

    invoke-virtual {v12, v10, v13}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v14, :cond_7

    const-string v10, "If-None-Match"

    invoke-virtual {v12, v10, v14}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    if-eqz v15, :cond_8

    const-string v10, "If-Modified-Since"

    invoke-virtual {v12, v10, v15}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    :cond_8
    iget-boolean v10, v1, Lorg/rabochaya/projects/OnlineTiles;->closed:Z

    if-nez v10, :cond_24

    invoke-virtual {v12}, Ljavax/net/ssl/HttpsURLConnection;->getResponseCode()I

    move-result v10

    const/16 v13, 0xc8

    move/from16 v18, v7

    const/16 v7, 0x130

    if-eq v10, v13, :cond_a

    if-ne v10, v7, :cond_9

    if-eqz v6, :cond_9

    goto :goto_2

    :cond_9
    new-instance v0, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u0421\u0435\u0440\u0432\u0435\u0440 \u043a\u0430\u0440\u0442\u044b: HTTP "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ". \u041f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u0435 \u043f\u043e\u0437\u0436\u0435 \u0438\u043b\u0438 \u043f\u0440\u043e\u0432\u0435\u0440\u044c\u0442\u0435 \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 21
    :cond_a
    :goto_2
    const-string v7, "Cache-Control"

    invoke-virtual {v12, v7}, Ljavax/net/ssl/HttpsURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_b

    sget-object v13, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v7, v13}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v13

    const-string v9, "no-store"

    invoke-virtual {v13, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_b

    const/4 v9, 0x1

    goto :goto_3

    :cond_b
    const/4 v9, 0x0

    :goto_3
    if-eqz p5, :cond_d

    if-nez v9, :cond_c

    goto :goto_4

    :cond_c
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u0421\u0435\u0440\u0432\u0435\u0440 \u0437\u0430\u043f\u0440\u0435\u0449\u0430\u0435\u0442 \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u0442\u044c \u044d\u0442\u0438 \u0442\u0430\u0439\u043b\u044b"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 22
    :cond_d
    :goto_4
    const/16 v13, 0xc8

    if-ne v10, v13, :cond_15

    invoke-virtual {v12}, Ljavax/net/ssl/HttpsURLConnection;->getContentLength()I

    move-result v13
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_8

    move-object/from16 v19, v14

    int-to-long v13, v13

    const-wide/32 v20, 0x100000

    cmp-long v13, v13, v20

    const-string v14, "\u0422\u0430\u0439\u043b \u0431\u043e\u043b\u044c\u0448\u0435 1 \u041c\u0438\u0411"

    if-gtz v13, :cond_14

    :try_start_2
    invoke-virtual {v12}, Ljavax/net/ssl/HttpsURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v13
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_8

    move-object/from16 v20, v15

    :try_start_3
    new-instance v15, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v15}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    move-object/from16 v21, v6

    const/16 v6, 0x4000

    :try_start_4
    new-array v6, v6, [B

    :goto_5
    move-object/from16 v22, v8

    invoke-virtual {v13, v6}, Ljava/io/InputStream;->read([B)I

    move-result v8

    move/from16 v23, v10

    const/4 v10, -0x1

    if-eq v8, v10, :cond_10

    iget-boolean v10, v1, Lorg/rabochaya/projects/OnlineTiles;->closed:Z

    if-nez v10, :cond_f

    invoke-virtual {v15}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v10

    add-int/2addr v10, v8

    const/high16 v0, 0x100000

    if-gt v10, v0, :cond_e

    const/4 v0, 0x0

    invoke-virtual {v15, v6, v0, v8}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    move/from16 v0, p1

    move-object/from16 v8, v22

    move/from16 v10, v23

    goto :goto_5

    :cond_e
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_6
    throw v0

    :cond_f
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_6

    :cond_10
    invoke-virtual {v15}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    invoke-virtual {v15}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    if-eqz v13, :cond_11

    :try_start_6
    invoke-virtual {v13}, Ljava/io/InputStream;->close()V

    :cond_11
    invoke-static {v0}, Lorg/rabochaya/projects/OfflineTiles;->decode([B)Landroid/graphics/Bitmap;

    move-result-object v6

    if-eqz v6, :cond_12

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_b

    :cond_12
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u0418\u0441\u0442\u043e\u0447\u043d\u0438\u043a \u0432\u0435\u0440\u043d\u0443\u043b \u043d\u0435 \u0440\u0430\u0441\u0442\u0440\u043e\u0432\u044b\u0439 \u0442\u0430\u0439\u043b PNG/JPEG/WebP"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_7
    throw v0
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_8

    :catchall_0
    move-exception v0

    move-object v2, v0

    :try_start_7
    invoke-virtual {v15}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_8

    :catchall_1
    move-exception v0

    move-object v3, v0

    :try_start_8
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_8
    throw v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :catchall_2
    move-exception v0

    goto :goto_9

    :catchall_3
    move-exception v0

    move-object/from16 v21, v6

    :goto_9
    move-object v2, v0

    if-eqz v13, :cond_13

    :try_start_9
    invoke-virtual {v13}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    goto :goto_a

    :catchall_4
    move-exception v0

    move-object v3, v0

    :try_start_a
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_13
    :goto_a
    throw v2

    :cond_14
    move-object/from16 v21, v6

    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_7

    :cond_15
    move-object/from16 v21, v6

    move-object/from16 v22, v8

    move/from16 v23, v10

    move-object/from16 v19, v14

    move-object/from16 v20, v15

    move-object/from16 v0, v21

    .line 23
    :goto_b
    iget-boolean v6, v1, Lorg/rabochaya/projects/OnlineTiles;->closed:Z

    if-nez v6, :cond_23

    if-eqz v9, :cond_17

    iget-object v2, v1, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2, v11, v5, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_8

    .line 26
    iget-object v2, v1, Lorg/rabochaya/projects/OnlineTiles;->active:Ljavax/net/ssl/HttpsURLConnection;

    const/4 v3, 0x0

    iput-object v3, v1, Lorg/rabochaya/projects/OnlineTiles;->active:Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v2, :cond_16

    invoke-virtual {v2}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    .line 23
    :cond_16
    return-object v0

    .line 24
    :cond_17
    :try_start_b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v12}, Ljavax/net/ssl/HttpsURLConnection;->getExpiration()J

    move-result-wide v8

    invoke-static {v7, v8, v9, v4, v5}, Lorg/rabochaya/projects/OnlineTiles;->expiry(Ljava/lang/String;JJ)J

    move-result-wide v4

    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    const-string v7, "zoom_level"

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v7, "tile_column"

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v7, "tile_row"

    int-to-long v8, v2

    move/from16 v2, p1

    invoke-static {v2, v8, v9}, Lorg/rabochaya/projects/MapMath;->tmsRow(IJ)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v6, v7, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v2, "tile_data"

    invoke-virtual {v6, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string v2, "expires"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v6, v2, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v2, "ETag"

    invoke-virtual {v12, v2}, Ljavax/net/ssl/HttpsURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "Last-Modified"

    invoke-virtual {v12, v4}, Ljavax/net/ssl/HttpsURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "etag"

    if-eqz v2, :cond_18

    move-object v14, v2

    move/from16 v2, v23

    goto :goto_c

    :cond_18
    move/from16 v2, v23

    const/16 v7, 0x130

    if-ne v2, v7, :cond_19

    move-object/from16 v14, v19

    goto :goto_c

    :cond_19
    const/4 v14, 0x0

    :goto_c
    invoke-virtual {v6, v5, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "modified"

    if-eqz v4, :cond_1a

    move-object v15, v4

    goto :goto_d

    :cond_1a
    const/16 v4, 0x130

    if-ne v2, v4, :cond_1b

    move-object/from16 v15, v20

    goto :goto_d

    :cond_1b
    const/4 v15, 0x0

    :goto_d
    invoke-virtual {v6, v5, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p5, :cond_1c

    const/4 v7, 0x1

    goto :goto_e

    :cond_1c
    move/from16 v7, v18

    :goto_e
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v4, v22

    invoke-virtual {v6, v4, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 25
    iget-object v2, v1, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_0
    .catchall {:try_start_b .. :try_end_b} :catchall_8

    :try_start_c
    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/OnlineTiles;->stats()[J

    move-result-object v2

    iget-object v4, v1, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v5, "SELECT length(tile_data) FROM tiles WHERE zoom_level=? AND tile_column=? AND tile_row=?"

    invoke-virtual {v4, v5, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_7

    :try_start_d
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_1d

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    goto :goto_f

    :cond_1d
    const-wide/16 v4, 0x0

    :goto_f
    if-eqz v3, :cond_1e

    :try_start_e
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    :cond_1e
    const/4 v3, 0x1

    aget-wide v7, v2, v3

    sub-long/2addr v7, v4

    array-length v2, v0

    int-to-long v2, v2

    add-long/2addr v7, v2

    const-wide/32 v2, 0x10000000

    cmp-long v2, v7, v2

    if-gtz v2, :cond_21

    iget-object v2, v1, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v3, 0x5

    const/4 v4, 0x0

    invoke-virtual {v2, v11, v4, v6, v3}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-ltz v2, :cond_20

    iget-object v2, v1, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_7

    :try_start_f
    iget-object v2, v1, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_0
    .catchall {:try_start_f .. :try_end_f} :catchall_8

    .line 26
    iget-object v2, v1, Lorg/rabochaya/projects/OnlineTiles;->active:Ljavax/net/ssl/HttpsURLConnection;

    const/4 v3, 0x0

    iput-object v3, v1, Lorg/rabochaya/projects/OnlineTiles;->active:Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v2, :cond_1f

    invoke-virtual {v2}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    .line 25
    :cond_1f
    return-object v0

    :cond_20
    :try_start_10
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0437\u0430\u043f\u0438\u0441\u0430\u0442\u044c \u0442\u0430\u0439\u043b \u0432 \u043a\u0435\u0448. \u041f\u0440\u043e\u0432\u0435\u0440\u044c\u0442\u0435 \u0441\u0432\u043e\u0431\u043e\u0434\u043d\u043e\u0435 \u043c\u0435\u0441\u0442\u043e \u0438 \u043f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u0435 \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0443"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_10
    throw v0

    :cond_21
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u041a\u0435\u0448 \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a\u0430 \u0437\u0430\u043f\u043e\u043b\u043d\u0435\u043d (256 \u041c\u0438\u0411). \u041e\u0447\u0438\u0441\u0442\u0438\u0442\u0435 \u0435\u0433\u043e \u0438\u043b\u0438 \u0443\u043c\u0435\u043d\u044c\u0448\u0438\u0442\u0435 \u043e\u0431\u043b\u0430\u0441\u0442\u044c"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_7

    goto :goto_10

    :catchall_5
    move-exception v0

    move-object v2, v0

    if-eqz v3, :cond_22

    :try_start_11
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_6

    goto :goto_11

    :catchall_6
    move-exception v0

    move-object v3, v0

    :try_start_12
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_22
    :goto_11
    throw v2
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_7

    :catchall_7
    move-exception v0

    :try_start_13
    iget-object v2, v1, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v0

    .line 23
    :cond_23
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 20
    :cond_24
    move-object/from16 v21, v6

    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_0
    .catchall {:try_start_13 .. :try_end_13} :catchall_8

    .line 26
    :catch_0
    move-exception v0

    goto :goto_12

    :catchall_8
    move-exception v0

    goto :goto_13

    :catch_1
    move-exception v0

    move-object/from16 v21, v6

    :goto_12
    if-eqz v21, :cond_26

    if-nez p5, :cond_26

    iget-object v0, v1, Lorg/rabochaya/projects/OnlineTiles;->active:Ljavax/net/ssl/HttpsURLConnection;

    const/4 v2, 0x0

    iput-object v2, v1, Lorg/rabochaya/projects/OnlineTiles;->active:Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v0, :cond_25

    invoke-virtual {v0}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    :cond_25
    return-object v21

    :cond_26
    :try_start_14
    throw v0
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_8

    :goto_13
    iget-object v2, v1, Lorg/rabochaya/projects/OnlineTiles;->active:Ljavax/net/ssl/HttpsURLConnection;

    const/4 v3, 0x0

    iput-object v3, v1, Lorg/rabochaya/projects/OnlineTiles;->active:Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v2, :cond_27

    invoke-virtual {v2}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    :cond_27
    throw v0

    .line 16
    :catchall_9
    move-exception v0

    move-object v2, v0

    if-eqz v5, :cond_28

    :try_start_15
    invoke-interface {v5}, Landroid/database/Cursor;->close()V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_a

    goto :goto_14

    :catchall_a
    move-exception v0

    move-object v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_28
    :goto_14
    throw v2

    .line 15
    :cond_29
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static expiry(Ljava/lang/String;JJ)J
    .locals 9

    .line 28
    const-wide/16 v0, 0x0

    if-eqz p0, :cond_3

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v4, v2

    const/4 v5, 0x0

    move v6, v5

    :goto_0
    if-ge v6, v4, :cond_1

    aget-object v7, v2, v6

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    const-string v8, "no-cache"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    return-wide p3

    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 29
    :cond_1
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v2, p0

    :goto_1
    if-ge v5, v2, :cond_3

    aget-object v3, p0, v5

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string v4, "max-age="

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/16 v4, 0x8

    :try_start_0
    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "\""

    const-string v6, ""

    invoke-virtual {v3, v4, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    const-wide/32 v6, 0x1e13380

    invoke-static {v6, v7, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    invoke-static {v0, v1, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    const-wide/16 v0, 0x3e8

    mul-long/2addr p0, v0

    add-long/2addr p3, p0

    return-wide p3

    :catch_0
    move-exception v3

    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 30
    :cond_3
    cmp-long p0, p1, v0

    if-lez p0, :cond_4

    goto :goto_2

    :cond_4
    const-wide/32 p0, 0x240c8400

    add-long p1, p3, p0

    :goto_2
    return-wide p1
.end method

.method private putMeta(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 8
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "name"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "value"

    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 p2, 0x0

    const/4 v1, 0x5

    const-string v2, "metadata"

    invoke-virtual {p1, v2, p2, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .line 32
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/OnlineTiles;->closed:Z

    iget-object v0, p0, Lorg/rabochaya/projects/OnlineTiles;->active:Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    :cond_0
    return-void
.end method

.method public declared-synchronized clear()V
    .locals 3

    monitor-enter p0

    .line 33
    :try_start_0
    iget-object v0, p0, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "tiles"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    iget-object v0, p0, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "VACUUM"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 33
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized close()V
    .locals 1

    monitor-enter p0

    .line 34
    :try_start_0
    invoke-virtual {p0}, Lorg/rabochaya/projects/OnlineTiles;->cancel()V

    iget-object v0, p0, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 34
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized download(III)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 13
    :try_start_0
    iget-object v0, p0, Lorg/rabochaya/projects/OnlineTiles;->source:Lorg/rabochaya/projects/TileSource;

    invoke-virtual {v0, p1}, Lorg/rabochaya/projects/TileSource;->canDownload(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v5, 0x1

    const/4 v6, 0x1

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    invoke-direct/range {v1 .. v6}, Lorg/rabochaya/projects/OnlineTiles;->bytes(IIIZZ)[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u0418\u0441\u0442\u043e\u0447\u043d\u0438\u043a \u0440\u0430\u0437\u0440\u0435\u0448\u0430\u0435\u0442 \u0442\u043e\u043b\u044c\u043a\u043e \u043f\u0440\u043e\u0441\u043c\u043e\u0442\u0440; \u0432\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a \u0441 \u0440\u0430\u0437\u0440\u0435\u0448\u0451\u043d\u043d\u044b\u043c \u0441\u043a\u0430\u0447\u0438\u0432\u0430\u043d\u0438\u0435\u043c"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public interrupt()V
    .locals 1

    .line 31
    iget-object v0, p0, Lorg/rabochaya/projects/OnlineTiles;->active:Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljavax/net/ssl/HttpsURLConnection;->disconnect()V

    :cond_0
    return-void
.end method

.method public declared-synchronized keys()Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "[I>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 11
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "SELECT zoom_level,tile_column,tile_row FROM tiles ORDER BY zoom_level,tile_column,tile_row"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    :goto_0
    :try_start_1
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/16 v3, 0x4e20

    if-ge v2, v3, :cond_1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const/4 v4, 0x1

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    const/4 v6, 0x2

    invoke-interface {v1, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    if-ltz v3, :cond_0

    const/16 v9, 0x17

    if-gt v3, v9, :cond_0

    if-ltz v5, :cond_0

    shl-int v9, v4, v3

    if-ge v5, v9, :cond_0

    const-wide/16 v9, 0x0

    cmp-long v9, v7, v9

    if-ltz v9, :cond_0

    const-wide/16 v9, 0x1

    shl-long/2addr v9, v3

    cmp-long v9, v7, v9

    if-gez v9, :cond_0

    const/4 v9, 0x3

    new-array v9, v9, [I

    aput v3, v9, v2

    aput v5, v9, v4

    invoke-static {v3, v7, v8}, Lorg/rabochaya/projects/MapMath;->tmsRow(IJ)J

    move-result-wide v2

    long-to-int v2, v2

    aput v2, v9, v6

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u041d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u044b\u0439 \u0438\u043d\u0434\u0435\u043a\u0441 \u043a\u0435\u0448\u0430"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_1
    throw v0

    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u0414\u043b\u044f \u043e\u0434\u043d\u043e\u0433\u043e \u044d\u043a\u0441\u043f\u043e\u0440\u0442\u0430 \u0432\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u043a\u0435\u0448 \u0434\u043e 20 000 \u0442\u0430\u0439\u043b\u043e\u0432"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :cond_2
    if-eqz v1, :cond_3

    :try_start_2
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :cond_3
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    if-eqz v1, :cond_4

    :try_start_3
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v1

    :try_start_4
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_4
    :goto_2
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 11
    :catchall_2
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stats()[J
    .locals 5

    monitor-enter p0

    .line 9
    :try_start_0
    iget-object v0, p0, Lorg/rabochaya/projects/OnlineTiles;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "SELECT count(*),coalesce(sum(length(tile_data)),0),coalesce(sum(pinned),0) FROM tiles"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    :try_start_1
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    const/4 v1, 0x3

    new-array v1, v1, [J

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    aput-wide v3, v1, v2

    const/4 v2, 0x1

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    aput-wide v3, v1, v2

    const/4 v2, 0x2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    aput-wide v3, v1, v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_0

    :try_start_2
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    :cond_0
    monitor-exit p0

    return-object v1

    :catchall_0
    move-exception v1

    if-eqz v0, :cond_1

    :try_start_3
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 9
    :catchall_2
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized tile(IIIZ)Landroid/graphics/Bitmap;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 12
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    :try_start_0
    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/OnlineTiles;->bytes(IIIZZ)[B

    move-result-object p1

    invoke-static {p1}, Lorg/rabochaya/projects/OfflineTiles;->decode([B)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    .line 12
    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
