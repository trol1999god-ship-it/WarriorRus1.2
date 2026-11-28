.class public final Lorg/rabochaya/projects/FormatExportActivity;
.super Landroid/app/Activity;
.source "FormatExportActivity.java"


# static fields
.field private static final SAVE:I = 0x125a


# instance fields
.field private volatile disposed:Z

.field private format:Ljava/lang/String;

.field private prepared:[B

.field private projectId:J

.field private final worker:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 17
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/FormatExportActivity;->worker:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private confirm(Ljava/lang/String;)V
    .locals 5

    .line 38
    nop

    .line 41
    const-string v0, "gpx"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "\u0421\u043e\u0445\u0440\u0430\u043d\u044f\u044e\u0442\u0441\u044f \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f, \u0432\u044b\u0441\u043e\u0442\u044b \u043a\u0430\u043a \u0437\u0430\u043f\u0438\u0441\u0430\u043d\u043d\u044b\u0435 \u0447\u0438\u0441\u043b\u0430 \u0438 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u043c\u044b\u0435 \u0430\u0442\u0440\u0438\u0431\u0443\u0442\u044b. \u0424\u0430\u0439\u043b\u044b \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u0439, SVG, \u043e\u0444\u043e\u0440\u043c\u043b\u0435\u043d\u0438\u0435 \u0438 \u0441\u0442\u0440\u0443\u043a\u0442\u0443\u0440\u0430 \u043f\u0430\u043f\u043e\u043a \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u044e\u0442\u0441\u044f \u0432 KMZ. \u0421\u043f\u043e\u0441\u043e\u0431 \u043e\u0442\u0441\u0447\u0451\u0442\u0430 \u0432\u044b\u0441\u043e\u0442\u044b \u043c\u043e\u0436\u0435\u0442 \u043e\u0442\u043b\u0438\u0447\u0430\u0442\u044c\u0441\u044f \u043c\u0435\u0436\u0434\u0443 \u043f\u0440\u0438\u043b\u043e\u0436\u0435\u043d\u0438\u044f\u043c\u0438."

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u041e\u0431\u043b\u0430\u0441\u0442\u0438 \u043f\u0435\u0440\u0435\u0434\u0430\u044e\u0442\u0441\u044f \u0437\u0430\u043c\u043a\u043d\u0443\u0442\u044b\u043c\u0438 \u0442\u0440\u0435\u043a\u0430\u043c\u0438. \u0421\u0442\u043e\u0440\u043e\u043d\u043d\u0438\u0435 \u043d\u0430\u0432\u0438\u0433\u0430\u0442\u043e\u0440\u044b \u0432\u0438\u0434\u044f\u0442 \u0438\u0445 \u043a\u043e\u043d\u0442\u0443\u0440\u044b. \u041f\u0440\u043e\u0438\u0437\u0432\u043e\u043b\u044c\u043d\u044b\u0435 \u0430\u0442\u0440\u0438\u0431\u0443\u0442\u044b \u0438 \u0440\u0430\u0441\u0448\u0438\u0440\u0435\u043d\u0438\u044f \u043c\u043e\u0433\u0443\u0442 \u0431\u044b\u0442\u044c \u043f\u043e\u0442\u0435\u0440\u044f\u043d\u044b."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 42
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u0412\u0440\u0435\u043c\u0435\u043d\u043d\u044b\u0435 \u0440\u044f\u0434\u044b GPX \u0438 \u0441\u043b\u0443\u0436\u0435\u0431\u043d\u044b\u0435 \u0434\u0430\u043d\u043d\u044b\u0435 KML \u043d\u0435 \u0432\u0445\u043e\u0434\u044f\u0442 \u0432 GeoJSON."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 43
    :goto_0
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u042d\u043a\u0441\u043f\u043e\u0440\u0442 "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "GPX 1.1"

    goto :goto_1

    :cond_1
    const-string v0, "GeoJSON"

    :goto_1
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 44
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1}, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda4;-><init>(Lorg/rabochaya/projects/FormatExportActivity;Ljava/lang/String;)V

    const-string p1, "\u0412\u044b\u0431\u0440\u0430\u0442\u044c \u0444\u0430\u0439\u043b"

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda5;-><init>(Lorg/rabochaya/projects/FormatExportActivity;)V

    .line 45
    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda6;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda6;-><init>(Lorg/rabochaya/projects/FormatExportActivity;)V

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 46
    return-void
.end method

.method private failure(Ljava/lang/Exception;)V
    .locals 2

    .line 92
    iget-boolean v0, p0, Lorg/rabochaya/projects/FormatExportActivity;->disposed:Z

    if-nez v0, :cond_0

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u042d\u043a\u0441\u043f\u043e\u0440\u0442 \u043d\u0435 \u0437\u0430\u0432\u0435\u0440\u0448\u0451\u043d"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda2;-><init>(Lorg/rabochaya/projects/FormatExportActivity;)V

    .line 93
    const-string v1, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda3;-><init>(Lorg/rabochaya/projects/FormatExportActivity;)V

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 94
    :cond_0
    return-void
.end method

.method public static open(Landroid/app/Activity;J)V
    .locals 2

    .line 24
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/rabochaya/projects/FormatExportActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "project"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 25
    return-void
.end method

.method private prepare(Ljava/lang/String;)V
    .locals 2

    .line 55
    iget-object v0, p0, Lorg/rabochaya/projects/FormatExportActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, p1}, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda7;-><init>(Lorg/rabochaya/projects/FormatExportActivity;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 69
    return-void
.end method

.method private snapshot(Ljava/lang/String;)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 49
    new-instance v0, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V

    .line 50
    :try_start_0
    iget-wide v1, p0, Lorg/rabochaya/projects/FormatExportActivity;->projectId:J

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v1

    invoke-static {v1, p1}, Lorg/rabochaya/projects/ObjectExchange;->write(Lorg/rabochaya/projects/KmlProject;Ljava/lang/String;)[B

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    .line 50
    return-object p1

    .line 51
    :catchall_0
    move-exception p1

    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    throw p1
.end method


# virtual methods
.method synthetic lambda$confirm$2$org-rabochaya-projects-FormatExportActivity(Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 44
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/FormatExportActivity;->prepare(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$confirm$3$org-rabochaya-projects-FormatExportActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 45
    invoke-virtual {p0}, Lorg/rabochaya/projects/FormatExportActivity;->finish()V

    return-void
.end method

.method synthetic lambda$confirm$4$org-rabochaya-projects-FormatExportActivity(Landroid/content/DialogInterface;)V
    .locals 0

    .line 45
    invoke-virtual {p0}, Lorg/rabochaya/projects/FormatExportActivity;->finish()V

    return-void
.end method

.method synthetic lambda$failure$11$org-rabochaya-projects-FormatExportActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 93
    invoke-virtual {p0}, Lorg/rabochaya/projects/FormatExportActivity;->finish()V

    return-void
.end method

.method synthetic lambda$failure$12$org-rabochaya-projects-FormatExportActivity(Landroid/content/DialogInterface;)V
    .locals 0

    .line 93
    invoke-virtual {p0}, Lorg/rabochaya/projects/FormatExportActivity;->finish()V

    return-void
.end method

.method synthetic lambda$onActivityResult$10$org-rabochaya-projects-FormatExportActivity(Landroid/net/Uri;)V
    .locals 3

    .line 81
    :try_start_0
    iget-object v0, p0, Lorg/rabochaya/projects/FormatExportActivity;->prepared:[B

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/FormatExportActivity;->prepared:[B

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/FormatExportActivity;->format:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/FormatExportActivity;->snapshot(Ljava/lang/String;)[B

    move-result-object v0

    .line 82
    :goto_0
    invoke-virtual {p0}, Lorg/rabochaya/projects/FormatExportActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "wt"

    invoke-virtual {v1, p1, v2}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    if-eqz p1, :cond_2

    .line 84
    :try_start_1
    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 85
    if-eqz p1, :cond_1

    :try_start_2
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    .line 86
    :cond_1
    new-instance p1, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda8;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda8;-><init>(Lorg/rabochaya/projects/FormatExportActivity;)V

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/FormatExportActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 87
    goto :goto_3

    .line 82
    :catchall_0
    move-exception v0

    goto :goto_1

    .line 83
    :cond_2
    :try_start_3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043e\u0442\u043a\u0440\u044b\u0442\u044c \u0444\u0430\u0439\u043b"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 82
    :goto_1
    if-eqz p1, :cond_3

    :try_start_4
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p1

    :try_start_5
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_2
    throw v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 87
    :catch_0
    move-exception p1

    new-instance v0, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda9;

    invoke-direct {v0, p0, p1}, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda9;-><init>(Lorg/rabochaya/projects/FormatExportActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/FormatExportActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 88
    :goto_3
    return-void
.end method

.method synthetic lambda$onActivityResult$8$org-rabochaya-projects-FormatExportActivity()V
    .locals 2

    .line 86
    iget-boolean v0, p0, Lorg/rabochaya/projects/FormatExportActivity;->disposed:Z

    if-nez v0, :cond_0

    const-string v0, "\u041e\u0431\u044a\u0435\u043a\u0442\u044b \u044d\u043a\u0441\u043f\u043e\u0440\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u044b"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    invoke-virtual {p0}, Lorg/rabochaya/projects/FormatExportActivity;->finish()V

    :cond_0
    return-void
.end method

.method synthetic lambda$onActivityResult$9$org-rabochaya-projects-FormatExportActivity(Ljava/lang/Exception;)V
    .locals 0

    .line 87
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/FormatExportActivity;->failure(Ljava/lang/Exception;)V

    return-void
.end method

.method synthetic lambda$onCreate$0$org-rabochaya-projects-FormatExportActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 33
    if-nez p2, :cond_0

    const-string p1, "gpx"

    goto :goto_0

    :cond_0
    const-string p1, "geojson"

    :goto_0
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/FormatExportActivity;->confirm(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$onCreate$1$org-rabochaya-projects-FormatExportActivity(Landroid/content/DialogInterface;)V
    .locals 0

    .line 34
    invoke-virtual {p0}, Lorg/rabochaya/projects/FormatExportActivity;->finish()V

    return-void
.end method

.method synthetic lambda$prepare$5$org-rabochaya-projects-FormatExportActivity([BLjava/lang/String;)V
    .locals 2

    .line 59
    iget-boolean v0, p0, Lorg/rabochaya/projects/FormatExportActivity;->disposed:Z

    if-eqz v0, :cond_0

    return-void

    .line 60
    :cond_0
    iput-object p1, p0, Lorg/rabochaya/projects/FormatExportActivity;->prepared:[B

    iput-object p2, p0, Lorg/rabochaya/projects/FormatExportActivity;->format:Ljava/lang/String;

    .line 61
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "android.intent.category.OPENABLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 62
    const-string v0, "gpx"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "application/gpx+xml"

    goto :goto_0

    :cond_1
    const-string v0, "application/geo+json"

    :goto_0
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "project."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 63
    const-string v0, "android.intent.extra.TITLE"

    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "android.intent.extra.LOCAL_ONLY"

    const/4 v0, 0x1

    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p1

    .line 64
    const/16 p2, 0x125a

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/rabochaya/projects/FormatExportActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    goto :goto_1

    :catch_0
    move-exception p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/FormatExportActivity;->failure(Ljava/lang/Exception;)V

    .line 66
    :goto_1
    return-void
.end method

.method synthetic lambda$prepare$6$org-rabochaya-projects-FormatExportActivity(Ljava/lang/Exception;)V
    .locals 0

    .line 67
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/FormatExportActivity;->failure(Ljava/lang/Exception;)V

    return-void
.end method

.method synthetic lambda$prepare$7$org-rabochaya-projects-FormatExportActivity(Ljava/lang/String;)V
    .locals 2

    .line 57
    :try_start_0
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/FormatExportActivity;->snapshot(Ljava/lang/String;)[B

    move-result-object v0

    .line 58
    new-instance v1, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, v0, p1}, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/FormatExportActivity;[BLjava/lang/String;)V

    invoke-virtual {p0, v1}, Lorg/rabochaya/projects/FormatExportActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    goto :goto_0

    :catch_0
    move-exception p1

    new-instance v0, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1}, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda1;-><init>(Lorg/rabochaya/projects/FormatExportActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/FormatExportActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 68
    :goto_0
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 72
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 73
    const/16 v0, 0x125a

    if-eq p1, v0, :cond_0

    return-void

    .line 74
    :cond_0
    const/4 p1, -0x1

    if-ne p2, p1, :cond_3

    if-eqz p3, :cond_3

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lorg/rabochaya/projects/FormatExportActivity;->format:Ljava/lang/String;

    if-nez p1, :cond_1

    goto :goto_0

    .line 75
    :cond_1
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    .line 76
    const-string p2, "content"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    const-string p2, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2

    .line 77
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 \u0444\u0430\u0439\u043b"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/FormatExportActivity;->failure(Ljava/lang/Exception;)V

    return-void

    .line 79
    :cond_2
    iget-object p2, p0, Lorg/rabochaya/projects/FormatExportActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance p3, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda10;

    invoke-direct {p3, p0, p1}, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda10;-><init>(Lorg/rabochaya/projects/FormatExportActivity;Landroid/net/Uri;)V

    invoke-interface {p2, p3}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 89
    return-void

    .line 74
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lorg/rabochaya/projects/FormatExportActivity;->finish()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 28
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 29
    invoke-virtual {p0}, Lorg/rabochaya/projects/FormatExportActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "project"

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/rabochaya/projects/FormatExportActivity;->projectId:J

    .line 30
    if-eqz p1, :cond_0

    const-string v0, "format"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/FormatExportActivity;->format:Ljava/lang/String;

    .line 31
    :cond_0
    iget-object p1, p0, Lorg/rabochaya/projects/FormatExportActivity;->format:Ljava/lang/String;

    if-eqz p1, :cond_1

    return-void

    .line 32
    :cond_1
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v0, "\u042d\u043a\u0441\u043f\u043e\u0440\u0442 \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432"

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "GPX 1.1"

    const-string v1, "GeoJSON"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda11;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda11;-><init>(Lorg/rabochaya/projects/FormatExportActivity;)V

    .line 33
    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda12;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/FormatExportActivity$$ExternalSyntheticLambda12;-><init>(Lorg/rabochaya/projects/FormatExportActivity;)V

    .line 34
    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 35
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 101
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/FormatExportActivity;->disposed:Z

    iget-object v0, p0, Lorg/rabochaya/projects/FormatExportActivity;->worker:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 97
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 98
    const-string v0, "format"

    iget-object v1, p0, Lorg/rabochaya/projects/FormatExportActivity;->format:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    return-void
.end method
