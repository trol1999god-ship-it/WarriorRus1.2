.class public final Lorg/rabochaya/projects/CacheExportActivity;
.super Landroid/app/Activity;
.source "CacheExportActivity.java"


# instance fields
.field private volatile cancelled:Z

.field private volatile disposed:Z

.field private progress:Landroid/widget/ProgressBar;

.field private volatile running:Z

.field private save:Landroid/widget/Button;

.field private source:Lorg/rabochaya/projects/TileSource;

.field private status:Landroid/widget/TextView;

.field private final worker:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 4
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 5
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->worker:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private checkCancelled()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 18
    iget-boolean v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->cancelled:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->disposed:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u042d\u043a\u0441\u043f\u043e\u0440\u0442 \u043e\u0442\u043c\u0435\u043d\u0451\u043d"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private export(Landroid/net/Uri;)V
    .locals 2

    .line 12
    iget-boolean v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->running:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->running:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->cancelled:Z

    iget-object v1, p0, Lorg/rabochaya/projects/CacheExportActivity;->save:Landroid/widget/Button;

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u043a\u0430 \u0441\u043d\u0438\u043c\u043a\u0430 \u043a\u0435\u0448\u0430\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/rabochaya/projects/CacheExportActivity$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1}, Lorg/rabochaya/projects/CacheExportActivity$$ExternalSyntheticLambda5;-><init>(Lorg/rabochaya/projects/CacheExportActivity;Landroid/net/Uri;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 17
    return-void
.end method


# virtual methods
.method synthetic lambda$export$2$org-rabochaya-projects-CacheExportActivity(II)V
    .locals 3

    .line 13
    iget-boolean v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->disposed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setMax(I)V

    iget-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p2}, Landroid/widget/ProgressBar;->setProgress(I)V

    iget-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u042d\u043a\u0441\u043f\u043e\u0440\u0442 \u0442\u0430\u0439\u043b\u043e\u0432: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v1, " / "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$export$3$org-rabochaya-projects-CacheExportActivity(II)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    invoke-direct {p0}, Lorg/rabochaya/projects/CacheExportActivity;->checkCancelled()V

    rem-int/lit8 v0, p1, 0xa

    if-eqz v0, :cond_0

    if-ne p1, p2, :cond_1

    :cond_0
    new-instance v0, Lorg/rabochaya/projects/CacheExportActivity$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, p2, p1}, Lorg/rabochaya/projects/CacheExportActivity$$ExternalSyntheticLambda2;-><init>(Lorg/rabochaya/projects/CacheExportActivity;II)V

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/CacheExportActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_1
    return-void
.end method

.method synthetic lambda$export$4$org-rabochaya-projects-CacheExportActivity(Ljava/lang/String;)V
    .locals 1

    .line 16
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->running:Z

    iget-boolean v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->disposed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lorg/rabochaya/projects/CacheExportActivity;->save:Landroid/widget/Button;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_0
    return-void
.end method

.method synthetic lambda$export$5$org-rabochaya-projects-CacheExportActivity(Landroid/net/Uri;)V
    .locals 8

    .line 12
    nop

    .line 13
    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_0
    const-string v2, "map-cache-export-"

    const-string v3, ".mbtiles"

    invoke-virtual {p0}, Lorg/rabochaya/projects/CacheExportActivity;->getCacheDir()Ljava/io/File;

    move-result-object v4

    invoke-static {v2, v3, v4}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    iget-object v2, p0, Lorg/rabochaya/projects/CacheExportActivity;->source:Lorg/rabochaya/projects/TileSource;

    new-instance v3, Lorg/rabochaya/projects/CacheExportActivity$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0}, Lorg/rabochaya/projects/CacheExportActivity$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/CacheExportActivity;)V

    invoke-static {p0, v2, v0, v3}, Lorg/rabochaya/projects/CacheExport;->write(Landroid/content/Context;Lorg/rabochaya/projects/TileSource;Ljava/io/File;Lorg/rabochaya/projects/CacheExport$Progress;)I

    move-result v2

    .line 14
    invoke-direct {p0}, Lorg/rabochaya/projects/CacheExportActivity;->checkCancelled()V

    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    :try_start_1
    invoke-virtual {p0}, Lorg/rabochaya/projects/CacheExportActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "wt"

    invoke-virtual {v4, p1, v5}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    if-eqz v4, :cond_2

    const/high16 v5, 0x10000

    :try_start_2
    new-array v5, v5, [B

    :goto_0
    invoke-virtual {v3, v5}, Ljava/io/InputStream;->read([B)I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_0

    invoke-direct {p0}, Lorg/rabochaya/projects/CacheExportActivity;->checkCancelled()V

    invoke-virtual {v4, v5, v1, v6}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    :cond_0
    invoke-virtual {v4}, Ljava/io/OutputStream;->flush()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v4, :cond_1

    :try_start_3
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :cond_1
    :try_start_4
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    invoke-direct {p0}, Lorg/rabochaya/projects/CacheExportActivity;->checkCancelled()V

    const/4 v1, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u0421\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u043e: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \u0442\u0430\u0439\u043b\u043e\u0432 \u0432 \u043e\u0434\u043d\u043e\u043c MBTiles. \u0418\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u043a\u0435\u0448 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 15
    if-eqz v0, :cond_7

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_6

    .line 14
    :catchall_0
    move-exception v2

    goto :goto_1

    :cond_2
    :try_start_5
    new-instance v2, Ljava/io/IOException;

    const-string v5, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043e\u0442\u043a\u0440\u044b\u0442\u044c \u0444\u0430\u0439\u043b \u043d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f"

    invoke-direct {v2, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :goto_1
    if-eqz v4, :cond_3

    :try_start_6
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v4

    :try_start_7
    invoke-virtual {v2, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_2
    throw v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :catchall_2
    move-exception v2

    :try_start_8
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    goto :goto_3

    :catchall_3
    move-exception v3

    :try_start_9
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_3
    throw v2
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 15
    :catchall_4
    move-exception v2

    goto :goto_7

    :catch_0
    move-exception v2

    :try_start_a
    iget-boolean v3, p0, Lorg/rabochaya/projects/CacheExportActivity;->cancelled:Z

    if-eqz v3, :cond_4

    const-string v2, "\u042d\u043a\u0441\u043f\u043e\u0440\u0442 \u043e\u0442\u043c\u0435\u043d\u0451\u043d. \u0418\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u043a\u0435\u0448 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d."

    goto :goto_4

    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u042d\u043a\u0441\u043f\u043e\u0440\u0442 \u043d\u0435 \u0437\u0430\u0432\u0435\u0440\u0448\u0451\u043d: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    :goto_4
    if-eqz v0, :cond_5

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_5
    if-nez v1, :cond_6

    :try_start_b
    invoke-virtual {p0}, Lorg/rabochaya/projects/CacheExportActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/provider/DocumentsContract;->deleteDocument(Landroid/content/ContentResolver;Landroid/net/Uri;)Z
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_1

    goto :goto_5

    :catch_1
    move-exception p1

    .line 16
    :cond_6
    :goto_5
    move-object p1, v2

    :cond_7
    :goto_6
    new-instance v0, Lorg/rabochaya/projects/CacheExportActivity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1}, Lorg/rabochaya/projects/CacheExportActivity$$ExternalSyntheticLambda1;-><init>(Lorg/rabochaya/projects/CacheExportActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/CacheExportActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 17
    return-void

    .line 15
    :goto_7
    if-eqz v0, :cond_8

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_8
    if-nez v1, :cond_9

    :try_start_c
    invoke-virtual {p0}, Lorg/rabochaya/projects/CacheExportActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/provider/DocumentsContract;->deleteDocument(Landroid/content/ContentResolver;Landroid/net/Uri;)Z
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_2

    goto :goto_8

    :catch_2
    move-exception p1

    :cond_9
    :goto_8
    throw v2
.end method

.method synthetic lambda$onCreate$0$org-rabochaya-projects-CacheExportActivity(Landroid/view/View;)V
    .locals 2

    .line 8
    iget-boolean p1, p0, Lorg/rabochaya/projects/CacheExportActivity;->running:Z

    if-eqz p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "application/octet-stream"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "android.intent.category.OPENABLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "android.intent.extra.TITLE"

    const-string v1, "\u0420\u0430\u0431\u043e\u0447\u0430\u044f-\u043a\u0430\u0440\u0442\u0430-\u043a\u0435\u0448.mbtiles"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "android.intent.extra.LOCAL_ONLY"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p1

    const/16 v0, 0x1131

    :try_start_0
    invoke-virtual {p0, p1, v0}, Lorg/rabochaya/projects/CacheExportActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object p1, p0, Lorg/rabochaya/projects/CacheExportActivity;->status:Landroid/widget/TextView;

    const-string v0, "\u041d\u0430 \u0443\u0441\u0442\u0440\u043e\u0439\u0441\u0442\u0432\u0435 \u043d\u0435\u0442 \u0444\u0430\u0439\u043b\u043e\u0432\u043e\u0433\u043e \u0434\u0438\u0430\u043b\u043e\u0433\u0430 Android"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$onCreate$1$org-rabochaya-projects-CacheExportActivity(Landroid/view/View;)V
    .locals 0

    .line 9
    invoke-virtual {p0}, Lorg/rabochaya/projects/CacheExportActivity;->onBackPressed()V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 11
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 v0, 0x1131

    if-ne p1, v0, :cond_0

    const/4 p1, -0x1

    if-ne p2, p1, :cond_0

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/CacheExportActivity;->export(Landroid/net/Uri;)V

    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .line 19
    iget-boolean v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->running:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->cancelled:Z

    iget-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430 \u044d\u043a\u0441\u043f\u043e\u0440\u0442\u0430\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 6
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->source(Landroid/content/Context;)Lorg/rabochaya/projects/TileSource;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/CacheExportActivity;->source:Lorg/rabochaya/projects/TileSource;

    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v0, 0x14

    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const v0, -0xdcd2e3

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/CacheExportActivity;->setContentView(Landroid/view/View;)V

    .line 7
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->status:Landroid/widget/TextView;

    iget-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->status:Landroid/widget/TextView;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->status:Landroid/widget/TextView;

    const/high16 v2, 0x41880000    # 17.0f

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->status:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u042d\u043a\u0441\u043f\u043e\u0440\u0442 \u043a\u0435\u0448\u0430 \u00b7 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/CacheExportActivity;->source:Lorg/rabochaya/projects/TileSource;

    iget-object v3, v3, Lorg/rabochaya/projects/TileSource;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n\n\u0421\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u0435 \u0442\u0430\u0439\u043b\u044b \u0432\u0441\u0435\u0445 \u0441\u043b\u043e\u0451\u0432 \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u043e\u0439 \u043a\u0430\u0440\u0442\u044b \u043e\u0431\u044a\u0435\u0434\u0438\u043d\u044f\u044e\u0442\u0441\u044f \u0432 \u043e\u0434\u0438\u043d \u0440\u0430\u0441\u0442\u0440\u043e\u0432\u044b\u0439 MBTiles/TMS. \u042f\u043d\u0434\u0435\u043a\u0441 \u043f\u0440\u0435\u043e\u0431\u0440\u0430\u0437\u0443\u0435\u0442\u0441\u044f \u0432 EPSG:3857. \u0422\u043e\u043b\u044c\u043a\u043e \u0438\u043c\u0435\u044e\u0449\u0438\u0439\u0441\u044f \u043a\u0435\u0448: \u043d\u043e\u0432\u044b\u0435 \u0442\u0430\u0439\u043b\u044b \u0438\u0437 \u0438\u043d\u0442\u0435\u0440\u043d\u0435\u0442\u0430 \u043d\u0435 \u0437\u0430\u0433\u0440\u0443\u0436\u0430\u044e\u0442\u0441\u044f.\n\n\u0414\u043e 20 000 \u0442\u0430\u0439\u043b\u043e\u0432 \u0438 512 \u041c\u0438\u0411. \u041c\u0435\u0442\u043a\u0438 \u0438 \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u044f \u0432 \u0444\u0430\u0439\u043b \u043a\u0430\u0440\u0442\u044b \u043d\u0435 \u0432\u0445\u043e\u0434\u044f\u0442. \u0421\u043e\u0432\u043c\u0435\u0441\u0442\u0438\u043c\u043e\u0441\u0442\u044c \u0441 \u043a\u043e\u043d\u043a\u0440\u0435\u0442\u043d\u043e\u0439 \u0441\u0442\u043e\u0440\u043e\u043d\u043d\u0435\u0439 \u043f\u0440\u043e\u0433\u0440\u0430\u043c\u043c\u043e\u0439 \u043d\u0443\u0436\u043d\u043e \u043f\u0440\u043e\u0432\u0435\u0440\u0438\u0442\u044c."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/ProgressBar;

    const/4 v2, 0x0

    const v3, 0x1010078

    invoke-direct {v0, p0, v2, v3}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->progress:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->progress:Landroid/widget/ProgressBar;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v1, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 8
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->save:Landroid/widget/Button;

    iget-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->save:Landroid/widget/Button;

    const-string v1, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c MBTiles"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->save:Landroid/widget/Button;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->save:Landroid/widget/Button;

    new-instance v1, Lorg/rabochaya/projects/CacheExportActivity$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/CacheExportActivity$$ExternalSyntheticLambda3;-><init>(Lorg/rabochaya/projects/CacheExportActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430 / \u043d\u0430\u0437\u0430\u0434"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance p1, Lorg/rabochaya/projects/CacheExportActivity$$ExternalSyntheticLambda4;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/CacheExportActivity$$ExternalSyntheticLambda4;-><init>(Lorg/rabochaya/projects/CacheExportActivity;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 10
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 21
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->disposed:Z

    iput-boolean v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->cancelled:Z

    iget-object v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->worker:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onStop()V
    .locals 1

    .line 20
    iget-boolean v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->running:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/CacheExportActivity;->cancelled:Z

    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    return-void
.end method
