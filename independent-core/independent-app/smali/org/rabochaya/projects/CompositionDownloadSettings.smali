.class public final Lorg/rabochaya/projects/CompositionDownloadSettings;
.super Ljava/lang/Object;
.source "CompositionDownloadSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;
    }
.end annotation


# static fields
.field private static final running:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 5
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/rabochaya/projects/CompositionDownloadSettings;->running:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized begin(Landroid/content/Context;JLorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;Lorg/rabochaya/projects/CompositionDownloadJob;)Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v0, Lorg/rabochaya/projects/CompositionDownloadSettings;

    monitor-enter v0

    .line 9
    :try_start_0
    sget-object v1, Lorg/rabochaya/projects/CompositionDownloadSettings;->running:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p0, p1, p2, p3, p4}, Lorg/rabochaya/projects/CompositionDownloadSettings;->write(Landroid/content/Context;JLorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;Lorg/rabochaya/projects/CompositionDownloadJob;)Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    move-result-object p0

    sget-object p3, Lorg/rabochaya/projects/CompositionDownloadSettings;->running:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iget-object p2, p4, Lorg/rabochaya/projects/CompositionDownloadJob;->generation:Ljava/lang/String;

    invoke-interface {p3, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :cond_0
    :try_start_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041f\u0440\u0435\u0434\u044b\u0434\u0443\u0449\u0430\u044f \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0430 \u0435\u0449\u0451 \u043e\u0441\u0442\u0430\u043d\u0430\u0432\u043b\u0438\u0432\u0430\u0435\u0442\u0441\u044f"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized end(JLjava/lang/String;)V
    .locals 3

    const-class v0, Lorg/rabochaya/projects/CompositionDownloadSettings;

    monitor-enter v0

    .line 11
    :try_start_0
    sget-object v1, Lorg/rabochaya/projects/CompositionDownloadSettings;->running:Ljava/util/Map;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1, p2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    sget-object p2, Lorg/rabochaya/projects/CompositionDownloadSettings;->running:Ljava/util/Map;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-interface {p2, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v0

    return-void

    .line 11
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static key(J)Ljava/lang/String;
    .locals 2

    .line 5
    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-lez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "job_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u041d\u0443\u0436\u0435\u043d \u043f\u0440\u043e\u0435\u043a\u0442"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static declared-synchronized load(Landroid/content/Context;J)Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v0, Lorg/rabochaya/projects/CompositionDownloadSettings;

    monitor-enter v0

    .line 7
    :try_start_0
    invoke-static {p0}, Lorg/rabochaya/projects/CompositionDownloadSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/CompositionDownloadSettings;->key(J)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_0

    new-instance p0, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    invoke-direct {p0, v2, v2}, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;-><init>(Lorg/rabochaya/projects/CompositionDownloadJob;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :cond_0
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const v2, 0x2af80

    if-gt v1, v2, :cond_1

    new-instance v1, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    const/4 v2, 0x2

    invoke-static {p0, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v2

    invoke-static {v2, p1, p2}, Lorg/rabochaya/projects/CompositionDownloadJob;->decode([BJ)Lorg/rabochaya/projects/CompositionDownloadJob;

    move-result-object p1

    invoke-direct {v1, p1, p0}, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;-><init>(Lorg/rabochaya/projects/CompositionDownloadJob;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    return-object v1

    :cond_1
    :try_start_2
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u0417\u0430\u0434\u0430\u043d\u0438\u0435 \u0441\u043b\u0438\u0448\u043a\u043e\u043c \u0432\u0435\u043b\u0438\u043a\u043e"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catch_0
    move-exception p0

    :try_start_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u0421\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u043e\u0435 \u0437\u0430\u0434\u0430\u043d\u0438\u0435 \u043f\u043e\u0432\u0440\u0435\u0436\u0434\u0435\u043d\u043e; \u043a\u0435\u0448 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d"

    invoke-direct {p1, p2, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 7
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2

    .line 5
    const-string v0, "composition-downloads"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static declared-synchronized progress(Landroid/content/Context;JLorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;I)Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v0, Lorg/rabochaya/projects/CompositionDownloadSettings;

    monitor-enter v0

    .line 10
    :try_start_0
    sget-object v1, Lorg/rabochaya/projects/CompositionDownloadSettings;->running:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p3, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    iget-object v2, v2, Lorg/rabochaya/projects/CompositionDownloadJob;->generation:Ljava/lang/String;

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p3, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->job:Lorg/rabochaya/projects/CompositionDownloadJob;

    invoke-virtual {v1, p4}, Lorg/rabochaya/projects/CompositionDownloadJob;->progress(I)Lorg/rabochaya/projects/CompositionDownloadJob;

    move-result-object p4

    invoke-static {p0, p1, p2, p3, p4}, Lorg/rabochaya/projects/CompositionDownloadSettings;->write(Landroid/content/Context;JLorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;Lorg/rabochaya/projects/CompositionDownloadJob;)Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :cond_0
    :try_start_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u0417\u0430\u0434\u0430\u043d\u0438\u0435 \u0431\u043e\u043b\u044c\u0448\u0435 \u043d\u0435 \u043f\u0440\u0438\u043d\u0430\u0434\u043b\u0435\u0436\u0438\u0442 \u044d\u0442\u043e\u043c\u0443 \u044d\u043a\u0440\u0430\u043d\u0443"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized removeDeletedProject(Landroid/content/Context;J)V
    .locals 3

    const-class v0, Lorg/rabochaya/projects/CompositionDownloadSettings;

    monitor-enter v0

    .line 12
    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-lez v1, :cond_0

    :try_start_0
    invoke-static {p0}, Lorg/rabochaya/projects/CompositionDownloadSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/CompositionDownloadSettings;->key(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 12
    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0

    .line 12
    :cond_0
    :goto_0
    monitor-exit v0

    return-void
.end method

.method private static write(Landroid/content/Context;JLorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;Lorg/rabochaya/projects/CompositionDownloadJob;)Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8
    iget-object v0, p4, Lorg/rabochaya/projects/CompositionDownloadJob;->composition:Lorg/rabochaya/projects/MapComposition;

    iget-wide v0, v0, Lorg/rabochaya/projects/MapComposition;->project:J

    cmp-long v0, v0, p1

    if-nez v0, :cond_1

    invoke-static {p0}, Lorg/rabochaya/projects/CompositionDownloadSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/CompositionDownloadSettings;->key(J)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object p3, p3, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;->raw:Ljava/lang/String;

    invoke-static {v0, p3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-virtual {p4}, Lorg/rabochaya/projects/CompositionDownloadJob;->encode()[B

    move-result-object p3

    const/4 v0, 0x2

    invoke-static {p3, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p3

    invoke-static {p0}, Lorg/rabochaya/projects/CompositionDownloadSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/CompositionDownloadSettings;->key(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result p0

    if-eqz p0, :cond_0

    new-instance p0, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;

    invoke-direct {p0, p4, p3}, Lorg/rabochaya/projects/CompositionDownloadSettings$Snapshot;-><init>(Lorg/rabochaya/projects/CompositionDownloadJob;Ljava/lang/String;)V

    return-object p0

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0441\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c \u0437\u0430\u0434\u0430\u043d\u0438\u0435; \u043a\u0435\u0448 \u043d\u0435 \u0443\u0434\u0430\u043b\u0451\u043d"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u0417\u0430\u0434\u0430\u043d\u0438\u0435 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u043e\u0441\u044c \u0432 \u0434\u0440\u0443\u0433\u043e\u043c \u043e\u043a\u043d\u0435"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
