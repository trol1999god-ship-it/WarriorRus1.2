.class public final Lorg/rabochaya/projects/MapCompositionSettings;
.super Ljava/lang/Object;
.source "MapCompositionSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;,
        Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized active(Landroid/content/Context;J)Z
    .locals 3

    const-class v0, Lorg/rabochaya/projects/MapCompositionSettings;

    monitor-enter v0

    .line 10
    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    const/4 v2, 0x0

    if-lez v1, :cond_0

    :try_start_0
    invoke-static {p0}, Lorg/rabochaya/projects/MapCompositionSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->activeKey(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    .line 10
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0

    .line 10
    :cond_0
    :goto_0
    monitor-exit v0

    return v2
.end method

.method private static activeKey(J)Ljava/lang/String;
    .locals 2

    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "enabled_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static declared-synchronized applyPreset(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionSettings$Snapshot;Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Ljava/lang/String;)Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v0, Lorg/rabochaya/projects/MapCompositionSettings;

    monitor-enter v0

    .line 22
    :try_start_0
    invoke-static {p0, p1, p2, p4}, Lorg/rabochaya/projects/MapCompositionSettings;->presetsMatch(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;)V

    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/MapCompositionSettings;->compositionMatch(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionSettings$Snapshot;)V

    iget-object p4, p4, Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;->presets:Lorg/rabochaya/projects/MapCompositionPresets;

    invoke-virtual {p4, p5}, Lorg/rabochaya/projects/MapCompositionPresets;->find(Ljava/lang/String;)Lorg/rabochaya/projects/MapCompositionPresets$Entry;

    move-result-object p4

    if-eqz p4, :cond_0

    iget-object v5, p4, Lorg/rabochaya/projects/MapCompositionPresets$Entry;->composition:Lorg/rabochaya/projects/MapComposition;

    const/4 v6, 0x1

    move-object v1, p0

    move-wide v2, p1

    move-object v4, p3

    invoke-static/range {v1 .. v6}, Lorg/rabochaya/projects/MapCompositionSettings;->save(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionSettings$Snapshot;Lorg/rabochaya/projects/MapComposition;Z)Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :cond_0
    :try_start_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041d\u0430\u0431\u043e\u0440 \u0431\u043e\u043b\u044c\u0448\u0435 \u043d\u0435 \u043d\u0430\u0439\u0434\u0435\u043d"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static compositionMatch(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionSettings$Snapshot;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 18
    if-eqz p3, :cond_1

    iget-object v0, p3, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;

    iget-wide v0, v0, Lorg/rabochaya/projects/MapComposition;->project:J

    cmp-long v0, v0, p1

    if-nez v0, :cond_1

    invoke-static {p0}, Lorg/rabochaya/projects/MapCompositionSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->key(J)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p3}, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->access$100(Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->activeKey(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    iget-boolean p1, p3, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->enabled:Z

    if-ne p0, p1, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u0421\u043e\u0441\u0442\u0430\u0432 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f \u0432 \u0434\u0440\u0443\u0433\u043e\u043c \u043e\u043a\u043d\u0435. \u041e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u043c\u0435\u043d\u0435\u0434\u0436\u0435\u0440 \u043f\u043e\u0432\u0442\u043e\u0440\u043d\u043e"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u0421\u043e\u0441\u0442\u0430\u0432 \u043e\u0442\u043d\u043e\u0441\u0438\u0442\u0441\u044f \u043a \u0434\u0440\u0443\u0433\u043e\u043c\u0443 \u043f\u0440\u043e\u0435\u043a\u0442\u0443"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static declared-synchronized deletePreset(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Ljava/lang/String;)Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v0, Lorg/rabochaya/projects/MapCompositionSettings;

    monitor-enter v0

    .line 21
    :try_start_0
    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/MapCompositionSettings;->presetsMatch(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;)V

    iget-object p3, p3, Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;->presets:Lorg/rabochaya/projects/MapCompositionPresets;

    invoke-virtual {p3, p4}, Lorg/rabochaya/projects/MapCompositionPresets;->remove(Ljava/lang/String;)Lorg/rabochaya/projects/MapCompositionPresets;

    move-result-object p3

    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/MapCompositionSettings;->writePresets(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionPresets;)Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    .line 21
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static existing(Landroid/content/Context;J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    new-instance v0, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V

    :try_start_0
    invoke-virtual {v0, p1, p2}, Lorg/rabochaya/projects/ProjectStore;->exists(J)Z

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_0

    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    return-void

    :cond_0
    :try_start_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041f\u0440\u043e\u0435\u043a\u0442 \u0431\u043e\u043b\u044c\u0448\u0435 \u043d\u0435 \u0441\u0443\u0449\u0435\u0441\u0442\u0432\u0443\u0435\u0442"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p0

    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    throw p0
.end method

.method private static key(J)Ljava/lang/String;
    .locals 2

    .line 8
    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-lez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "composition_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u041d\u0443\u0436\u0435\u043d \u0441\u0443\u0449\u0435\u0441\u0442\u0432\u0443\u044e\u0449\u0438\u0439 \u043f\u0440\u043e\u0435\u043a\u0442"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static declared-synchronized load(Landroid/content/Context;J)Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v0, Lorg/rabochaya/projects/MapCompositionSettings;

    monitor-enter v0

    .line 11
    :try_start_0
    invoke-static {p0}, Lorg/rabochaya/projects/MapCompositionSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->key(J)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->active(Landroid/content/Context;J)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    :try_start_1
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result p0

    const v4, 0x2bf20

    if-gt p0, v4, :cond_0

    new-instance p0, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    const/4 v4, 0x2

    invoke-static {v1, v4}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v4

    invoke-static {v4, p1, p2}, Lorg/rabochaya/projects/MapComposition;->decode([BJ)Lorg/rabochaya/projects/MapComposition;

    move-result-object p1

    invoke-direct {p0, p1, v2, v1, v3}, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;-><init>(Lorg/rabochaya/projects/MapComposition;ZLjava/lang/String;Lorg/rabochaya/projects/MapCompositionSettings$1;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    monitor-exit v0

    return-object p0

    :cond_0
    :try_start_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catch_0
    move-exception p0

    :try_start_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u0421\u043e\u0441\u0442\u0430\u0432 \u043a\u0430\u0440\u0442 \u043f\u043e\u0432\u0440\u0435\u0436\u0434\u0451\u043d; \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438 \u0441\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u044b \u0434\u043b\u044f \u0432\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d\u0438\u044f"

    invoke-direct {p1, p2, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    :cond_1
    if-nez v2, :cond_5

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/OnlineMapSettings;->active(Landroid/content/Context;J)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v4, "catalog"

    const-string v5, ""

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-static {v2}, Lorg/rabochaya/projects/MapCatalog;->find(Ljava/lang/String;)Lorg/rabochaya/projects/TileSource;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-static {v2}, Lorg/rabochaya/projects/MapComposition$Layer;->catalog(Ljava/lang/String;)Lorg/rabochaya/projects/MapComposition$Layer;

    move-result-object p0

    goto :goto_1

    :cond_2
    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->source(Landroid/content/Context;)Lorg/rabochaya/projects/TileSource;

    move-result-object p0

    invoke-static {p0}, Lorg/rabochaya/projects/MapComposition$Layer;->custom(Lorg/rabochaya/projects/TileSource;)Lorg/rabochaya/projects/MapComposition$Layer;

    move-result-object p0

    :goto_1
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_3
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "local_basemap_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".mbtiles"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, p0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result p0

    if-eqz p0, :cond_4

    invoke-static {}, Lorg/rabochaya/projects/MapComposition$Layer;->local()Lorg/rabochaya/projects/MapComposition$Layer;

    move-result-object p0

    goto :goto_1

    :cond_4
    invoke-static {}, Lorg/rabochaya/projects/MapComposition$Layer;->bundled()Lorg/rabochaya/projects/MapComposition$Layer;

    move-result-object p0

    goto :goto_1

    :goto_2
    new-instance p0, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    new-instance v2, Lorg/rabochaya/projects/MapComposition;

    invoke-direct {v2, p1, p2, v1}, Lorg/rabochaya/projects/MapComposition;-><init>(JLjava/util/List;)V

    const/4 p1, 0x0

    invoke-direct {p0, v2, p1, v3, v3}, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;-><init>(Lorg/rabochaya/projects/MapComposition;ZLjava/lang/String;Lorg/rabochaya/projects/MapCompositionSettings$1;)V

    goto/16 :goto_0

    :cond_5
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u0421\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u0439 \u0441\u043e\u0441\u0442\u0430\u0432 \u043a\u0430\u0440\u0442 \u043d\u0435 \u043d\u0430\u0439\u0434\u0435\u043d"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 11
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized loadPresets(Landroid/content/Context;J)Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v0, Lorg/rabochaya/projects/MapCompositionSettings;

    monitor-enter v0

    .line 16
    :try_start_0
    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->existing(Landroid/content/Context;J)V

    invoke-static {p0}, Lorg/rabochaya/projects/MapCompositionSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->presetsKey(J)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_0

    new-instance p0, Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

    new-instance v1, Lorg/rabochaya/projects/MapCompositionPresets;

    invoke-direct {v1, p1, p2}, Lorg/rabochaya/projects/MapCompositionPresets;-><init>(J)V

    invoke-direct {p0, v1, v2, v2}, Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;-><init>(Lorg/rabochaya/projects/MapCompositionPresets;Ljava/lang/String;Lorg/rabochaya/projects/MapCompositionSettings$1;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :cond_0
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const v3, 0xaae60

    if-gt v1, v3, :cond_1

    new-instance v1, Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

    const/4 v3, 0x2

    invoke-static {p0, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v3

    invoke-static {v3, p1, p2}, Lorg/rabochaya/projects/MapCompositionPresets;->decode([BJ)Lorg/rabochaya/projects/MapCompositionPresets;

    move-result-object p1

    invoke-direct {v1, p1, p0, v2}, Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;-><init>(Lorg/rabochaya/projects/MapCompositionPresets;Ljava/lang/String;Lorg/rabochaya/projects/MapCompositionSettings$1;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    return-object v1

    :cond_1
    :try_start_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catch_0
    move-exception p0

    :try_start_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u0411\u0438\u0431\u043b\u0438\u043e\u0442\u0435\u043a\u0430 \u043d\u0430\u0431\u043e\u0440\u043e\u0432 \u043f\u043e\u0432\u0440\u0435\u0436\u0434\u0435\u043d\u0430; \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u0435 \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438 \u043d\u0435 \u0438\u0437\u043c\u0435\u043d\u0435\u043d\u044b"

    invoke-direct {p1, p2, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 16
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2

    .line 6
    const-string v0, "map-compositions"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method private static presetsKey(J)Ljava/lang/String;
    .locals 2

    .line 14
    invoke-static {p0, p1}, Lorg/rabochaya/projects/MapCompositionSettings;->key(J)Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "presets_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static presetsMatch(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 17
    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->existing(Landroid/content/Context;J)V

    if-eqz p3, :cond_1

    iget-object v0, p3, Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;->presets:Lorg/rabochaya/projects/MapCompositionPresets;

    iget-wide v0, v0, Lorg/rabochaya/projects/MapCompositionPresets;->project:J

    cmp-long v0, v0, p1

    if-nez v0, :cond_1

    invoke-static {p0}, Lorg/rabochaya/projects/MapCompositionSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->presetsKey(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p3}, Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;->access$300(Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041d\u0430\u0431\u043e\u0440\u044b \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0438\u0441\u044c \u0432 \u0434\u0440\u0443\u0433\u043e\u043c \u043e\u043a\u043d\u0435. \u041e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u0441\u043f\u0438\u0441\u043e\u043a \u043f\u043e\u0432\u0442\u043e\u0440\u043d\u043e"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u0411\u0438\u0431\u043b\u0438\u043e\u0442\u0435\u043a\u0430 \u043e\u0442\u043d\u043e\u0441\u0438\u0442\u0441\u044f \u043a \u0434\u0440\u0443\u0433\u043e\u043c\u0443 \u043f\u0440\u043e\u0435\u043a\u0442\u0443"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static declared-synchronized removeDeletedProject(Landroid/content/Context;J)V
    .locals 3

    const-class v0, Lorg/rabochaya/projects/MapCompositionSettings;

    monitor-enter v0

    .line 25
    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-lez v1, :cond_0

    :try_start_0
    invoke-static {p0}, Lorg/rabochaya/projects/MapCompositionSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->key(J)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->activeKey(J)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->presetsKey(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0

    .line 25
    :cond_0
    :goto_0
    monitor-exit v0

    return-void
.end method

.method public static declared-synchronized save(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionSettings$Snapshot;Lorg/rabochaya/projects/MapComposition;Z)Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v0, Lorg/rabochaya/projects/MapCompositionSettings;

    monitor-enter v0

    .line 12
    if-eqz p3, :cond_2

    :try_start_0
    iget-object v1, p3, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;

    iget-wide v1, v1, Lorg/rabochaya/projects/MapComposition;->project:J

    cmp-long v1, v1, p1

    if-nez v1, :cond_2

    iget-wide v1, p4, Lorg/rabochaya/projects/MapComposition;->project:J

    cmp-long v1, v1, p1

    if-nez v1, :cond_2

    invoke-static {p0}, Lorg/rabochaya/projects/MapCompositionSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->key(J)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p3}, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->access$100(Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->activeKey(J)Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    invoke-interface {p0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iget-boolean p3, p3, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->enabled:Z

    if-ne v1, p3, :cond_1

    invoke-virtual {p4}, Lorg/rabochaya/projects/MapComposition;->encode()[B

    move-result-object p3

    const/4 v1, 0x2

    invoke-static {p3, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->key(J)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v1, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->activeKey(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1, p5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result p0

    if-eqz p0, :cond_0

    new-instance p0, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    invoke-direct {p0, p4, p5, p3, v2}, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;-><init>(Lorg/rabochaya/projects/MapComposition;ZLjava/lang/String;Lorg/rabochaya/projects/MapCompositionSettings$1;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :cond_0
    :try_start_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0441\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c \u0441\u043e\u0441\u0442\u0430\u0432 \u043a\u0430\u0440\u0442"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_0
    throw p0

    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u0421\u043e\u0441\u0442\u0430\u0432 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f \u0432 \u0434\u0440\u0443\u0433\u043e\u043c \u043e\u043a\u043d\u0435. \u041e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u043c\u0435\u043d\u0435\u0434\u0436\u0435\u0440 \u043f\u043e\u0432\u0442\u043e\u0440\u043d\u043e"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u0421\u043e\u0441\u0442\u0430\u0432 \u043e\u0442\u043d\u043e\u0441\u0438\u0442\u0441\u044f \u043a \u0434\u0440\u0443\u0433\u043e\u043c\u0443 \u043f\u0440\u043e\u0435\u043a\u0442\u0443"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized savePreset(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Ljava/lang/String;)Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v0, Lorg/rabochaya/projects/MapCompositionSettings;

    monitor-enter v0

    .line 20
    :try_start_0
    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/MapCompositionSettings;->presetsMatch(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;)V

    invoke-static {p0, p1, p2, p4}, Lorg/rabochaya/projects/MapCompositionSettings;->compositionMatch(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionSettings$Snapshot;)V

    iget-object p3, p3, Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;->presets:Lorg/rabochaya/projects/MapCompositionPresets;

    iget-object p4, p4, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;

    invoke-virtual {p3, p5, p4}, Lorg/rabochaya/projects/MapCompositionPresets;->add(Ljava/lang/String;Lorg/rabochaya/projects/MapComposition;)Lorg/rabochaya/projects/MapCompositionPresets;

    move-result-object p3

    invoke-static {p0, p1, p2, p3}, Lorg/rabochaya/projects/MapCompositionSettings;->writePresets(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionPresets;)Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    .line 20
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized suspend(Landroid/content/Context;J)V
    .locals 3

    const-class v0, Lorg/rabochaya/projects/MapCompositionSettings;

    monitor-enter v0

    .line 24
    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-lez v1, :cond_1

    :try_start_0
    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->active(Landroid/content/Context;J)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p0}, Lorg/rabochaya/projects/MapCompositionSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->activeKey(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u0435\u0440\u0435\u043a\u043b\u044e\u0447\u0438\u0442\u044c \u043f\u043e\u0434\u043b\u043e\u0436\u043a\u0443 \u043a\u0430\u0440\u0442\u044b"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0

    .line 24
    :cond_1
    :goto_0
    monitor-exit v0

    return-void
.end method

.method private static writePresets(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionPresets;)Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 19
    invoke-virtual {p3}, Lorg/rabochaya/projects/MapCompositionPresets;->encode()[B

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Lorg/rabochaya/projects/MapCompositionSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->presetsKey(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result p0

    if-eqz p0, :cond_0

    new-instance p0, Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

    const/4 p1, 0x0

    invoke-direct {p0, p3, v0, p1}, Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;-><init>(Lorg/rabochaya/projects/MapCompositionPresets;Ljava/lang/String;Lorg/rabochaya/projects/MapCompositionSettings$1;)V

    return-object p0

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0441\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c \u0431\u0438\u0431\u043b\u0438\u043e\u0442\u0435\u043a\u0443 \u043d\u0430\u0431\u043e\u0440\u043e\u0432"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
