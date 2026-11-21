.class public final Lorg/rabochaya/projects/ProjectSession;
.super Ljava/lang/Object;
.source "ProjectSession.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized create(Landroid/content/Context;Ljava/lang/String;)J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v0, Lorg/rabochaya/projects/ProjectSession;

    monitor-enter v0

    .line 19
    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x3e8

    if-gt v1, v2, :cond_0

    .line 20
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 22
    :try_start_1
    const-string v2, "<kml xmlns=\'http://www.opengis.net/kml/2.2\'><Document><name>\u041f\u0440\u043e\u0435\u043a\u0442</name></Document></kml>"

    const-string v3, "UTF-8"

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-static {v2}, Lorg/rabochaya/projects/KmlProject;->parse([B)Lorg/rabochaya/projects/KmlProject;

    move-result-object v2

    .line 23
    invoke-virtual {v2}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object v3

    const-string v4, ""

    invoke-static {v3, p1, v4}, Lorg/rabochaya/projects/FeatureEdits;->metadata(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2, p1}, Lorg/rabochaya/projects/ProjectStore;->insert(Lorg/rabochaya/projects/KmlProject;Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {p0, v2, v3}, Lorg/rabochaya/projects/ProjectSession;->remember(Landroid/content/Context;J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    :try_start_2
    invoke-virtual {v1}, Lorg/rabochaya/projects/ProjectStore;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 23
    monitor-exit v0

    return-wide v2

    .line 24
    :catchall_0
    move-exception p0

    :try_start_3
    invoke-virtual {v1}, Lorg/rabochaya/projects/ProjectStore;->close()V

    throw p0

    .line 19
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435: \u043e\u0442 1 \u0434\u043e 1000 \u0441\u0438\u043c\u0432\u043e\u043b\u043e\u0432"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 18
    :catchall_1
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized current(Landroid/content/Context;)J
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v0, Lorg/rabochaya/projects/ProjectSession;

    monitor-enter v0

    .line 8
    :try_start_0
    new-instance v1, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 10
    :try_start_1
    const-string v2, "workspace-session"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v4, "last_project"

    const-wide/16 v5, -0x1

    invoke-interface {v2, v4, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v7

    .line 11
    const-wide/16 v9, 0x0

    cmp-long v2, v7, v9

    if-lez v2, :cond_0

    invoke-virtual {v1, v7, v8}, Lorg/rabochaya/projects/ProjectStore;->exists(J)Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_0

    .line 16
    :try_start_2
    invoke-virtual {v1}, Lorg/rabochaya/projects/ProjectStore;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 11
    monitor-exit v0

    return-wide v7

    .line 12
    :cond_0
    :try_start_3
    const-class v2, Lorg/rabochaya/projects/OwnedHomeActivity;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "last_project"

    invoke-interface {v2, v3, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 13
    cmp-long v4, v2, v9

    if-lez v4, :cond_1

    invoke-virtual {v1, v2, v3}, Lorg/rabochaya/projects/ProjectStore;->exists(J)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-static {p0, v2, v3}, Lorg/rabochaya/projects/ProjectSession;->remember(Landroid/content/Context;J)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 16
    :try_start_4
    invoke-virtual {v1}, Lorg/rabochaya/projects/ProjectStore;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 13
    monitor-exit v0

    return-wide v2

    .line 14
    :cond_1
    :try_start_5
    invoke-virtual {v1}, Lorg/rabochaya/projects/ProjectStore;->list()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/rabochaya/projects/ProjectStore$Summary;

    iget-wide v4, v3, Lorg/rabochaya/projects/ProjectStore$Summary;->id:J

    cmp-long v4, v4, v9

    if-lez v4, :cond_2

    iget-wide v4, v3, Lorg/rabochaya/projects/ProjectStore$Summary;->id:J

    invoke-virtual {v1, v4, v5}, Lorg/rabochaya/projects/ProjectStore;->exists(J)Z

    move-result v4

    if-eqz v4, :cond_2

    iget-wide v4, v3, Lorg/rabochaya/projects/ProjectStore$Summary;->id:J

    invoke-static {p0, v4, v5}, Lorg/rabochaya/projects/ProjectSession;->remember(Landroid/content/Context;J)V

    iget-wide v2, v3, Lorg/rabochaya/projects/ProjectStore$Summary;->id:J
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 16
    :try_start_6
    invoke-virtual {v1}, Lorg/rabochaya/projects/ProjectStore;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 14
    monitor-exit v0

    return-wide v2

    .line 15
    :cond_3
    :try_start_7
    const-string v2, "\u0420\u0430\u0431\u043e\u0447\u0430\u044f \u043a\u0430\u0440\u0442\u0430"

    invoke-static {p0, v2}, Lorg/rabochaya/projects/ProjectSession;->create(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 16
    :try_start_8
    invoke-virtual {v1}, Lorg/rabochaya/projects/ProjectStore;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 15
    monitor-exit v0

    return-wide v2

    .line 16
    :catchall_0
    move-exception p0

    :try_start_9
    invoke-virtual {v1}, Lorg/rabochaya/projects/ProjectStore;->close()V

    throw p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 7
    :catchall_1
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static remember(Landroid/content/Context;J)V
    .locals 2

    .line 26
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    const-string v0, "workspace-session"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "last_project"

    invoke-interface {p0, v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_0
    return-void
.end method
