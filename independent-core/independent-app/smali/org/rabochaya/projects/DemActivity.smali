.class public final Lorg/rabochaya/projects/DemActivity;
.super Landroid/app/Activity;
.source "DemActivity.java"


# instance fields
.field private busy:Z

.field private volatile disposed:Z

.field private expected:Ljava/lang/String;

.field private open:Landroid/widget/Button;

.field private project:J

.field private raw:Ljava/io/File;

.field private remove:Landroid/widget/Button;

.field private save:Landroid/widget/Button;

.field private sourceName:Ljava/lang/String;

.field private status:Landroid/widget/TextView;

.field private valid:Z

.field private final worker:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 4
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/DemActivity;->valid:Z

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/DemActivity;->worker:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .locals 3

    .line 9
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    const/4 p2, 0x0

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setAllCaps(Z)V

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v1, 0x42400000    # 48.0f

    invoke-static {p0, v1}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v1

    const/4 v2, -0x1

    invoke-direct {p2, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda7;

    invoke-direct {p1, p0, p3}, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda7;-><init>(Lorg/rabochaya/projects/DemActivity;Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method public static cleanup(Landroid/content/Context;J)Z
    .locals 2

    .line 7
    const-class v0, Lorg/rabochaya/projects/LocalRasterStore;

    monitor-enter v0

    :try_start_0
    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/DemActivity;->file(Landroid/content/Context;J)Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p0, 0x1

    return p0

    :cond_0
    :try_start_1
    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/HgtRaster;->owned(Ljava/io/File;J)Lorg/rabochaya/projects/HgtRaster;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lorg/rabochaya/projects/HgtRaster;->close()V

    :cond_1
    invoke-static {p0}, Lorg/rabochaya/projects/LocalRasterStore;->remove(Ljava/io/File;)Z

    move-result p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    monitor-exit v0

    return p0

    :catch_0
    move-exception p0

    monitor-exit v0

    const/4 p0, 0x0

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method

.method private static description(Lorg/rabochaya/projects/HgtRaster;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ": "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lorg/rabochaya/projects/HgtRaster;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "\n"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v0, p0, Lorg/rabochaya/projects/HgtRaster;->samples:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " \u00d7 "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v0, p0, Lorg/rabochaya/projects/HgtRaster;->samples:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "\n\u0413\u0440\u0430\u043d\u0438\u0446\u044b: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v0, p0, Lorg/rabochaya/projects/HgtRaster;->west:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ", "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v1, p0, Lorg/rabochaya/projects/HgtRaster;->south:I

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " \u2014 "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget v1, p0, Lorg/rabochaya/projects/HgtRaster;->west:I

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget p0, p0, Lorg/rabochaya/projects/HgtRaster;->south:I

    add-int/lit8 p0, p0, 0x1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "\n\n"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {}, Lorg/rabochaya/projects/DemActivity;->help()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static file(Landroid/content/Context;J)Ljava/io/File;
    .locals 3

    .line 6
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "project_dem_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ".rkdem"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "\u041d\u0443\u0436\u0435\u043d \u043f\u0440\u043e\u0435\u043a\u0442"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static help()Ljava/lang/String;
    .locals 1

    .line 10
    const-string v0, "\u041e\u0434\u0438\u043d \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 SRTM HGT: N55E037.hgt, 1201\u00b2 \u0438\u043b\u04383601\u00b2 signed int16 big-endian, WGS84. \u0412\u044b\u0441\u043e\u0442\u0430 \u0438\u0441\u0445\u043e\u0434\u043d\u043e\u0433\u043e SRTM \u0432 \u043c\u0435\u0442\u0440\u0430\u0445 (\u043e\u0431\u044b\u0447\u043d\u043e EGM96), \u0431\u0435\u0437 \u043f\u0440\u0435\u043e\u0431\u0440\u0430\u0437\u043e\u0432\u0430\u043d\u0438\u044f \u0432\u0435\u0440\u0442\u0438\u043a\u0430\u043b\u044c\u043d\u043e\u0433\u043e \u0434\u0430\u0442\u0443\u043c\u0430. \u0422\u043e\u043b\u044c\u043a\u043e \u0432\u044b\u0441\u043e\u0442\u0430 \u0440\u0443\u0447\u043d\u043e\u0433\u043e \u0446\u0435\u043d\u0442\u0440\u0430; GPS, \u0441\u043a\u0430\u0447\u0438\u0432\u0430\u043d\u0438\u044f \u0438 \u0438\u0437\u043c\u0435\u043d\u0435\u043d\u0438\u044f \u0432\u044b\u0441\u043e\u0442 \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432 \u043d\u0435\u0442. NoData/\u0432\u043d\u0435 \u043e\u0431\u043b\u0430\u0441\u0442\u0438 \u043f\u043e\u043a\u0430\u0437\u044b\u0432\u0430\u044e\u0442\u0441\u044f \u043a\u0430\u043a \u043e\u0442\u0441\u0443\u0442\u0441\u0442\u0432\u0438\u0435 \u0434\u0430\u043d\u043d\u044b\u0445. \u041f\u0440\u043e\u0444\u0438\u043b\u044c \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u043e\u0433\u043e \u043c\u0430\u0440\u0448\u0440\u0443\u0442\u0430/\u043a\u043e\u043d\u0442\u0443\u0440\u0430: \u0440\u0435\u0434\u0430\u043a\u0442\u043e\u0440 \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u0438 \u2192 \u0414\u0435\u0439\u0441\u0442\u0432\u0438\u044f \u2192 \u041f\u0440\u043e\u0444\u0438\u043b\u044c DEM. Hillshade \u043f\u043e\u043a\u0430 \u043d\u0435 \u0440\u0435\u0430\u043b\u0438\u0437\u043e\u0432\u0430\u043d."

    return-object v0
.end method

.method private install()V
    .locals 4

    .line 14
    iget-object v0, p0, Lorg/rabochaya/projects/DemActivity;->raw:Ljava/io/File;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lorg/rabochaya/projects/DemActivity;->valid:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/DemActivity;->busy:Z

    iget-object v0, p0, Lorg/rabochaya/projects/DemActivity;->save:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/DemActivity;->raw:Ljava/io/File;

    iget-object v1, p0, Lorg/rabochaya/projects/DemActivity;->sourceName:Ljava/lang/String;

    iget-object v2, p0, Lorg/rabochaya/projects/DemActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, v0, v1}, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/DemActivity;Ljava/io/File;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private pick()V
    .locals 3

    .line 12
    iget-boolean v0, p0, Lorg/rabochaya/projects/DemActivity;->valid:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "*/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "android.intent.extra.LOCAL_ONLY"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0x11f9

    invoke-virtual {p0, v0, v1}, Lorg/rabochaya/projects/DemActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private remove()V
    .locals 3

    .line 15
    iget-boolean v0, p0, Lorg/rabochaya/projects/DemActivity;->valid:Z

    if-eqz v0, :cond_1

    iget-wide v0, p0, Lorg/rabochaya/projects/DemActivity;->project:J

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/DemActivity;->file(Landroid/content/Context;J)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u0423\u0431\u0440\u0430\u0442\u044c \u043f\u0440\u0438\u0432\u0430\u0442\u043d\u044b\u0439 DEM \u044d\u0442\u043e\u0433\u043e \u043f\u0440\u043e\u0435\u043a\u0442\u0430? \u0418\u0441\u0445\u043e\u0434\u043d\u044b\u0439 HGT, \u043a\u0430\u0440\u0442\u044b, KML \u0438 \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u044f \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u0442\u0441\u044f."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda9;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda9;-><init>(Lorg/rabochaya/projects/DemActivity;)V

    const-string v2, "\u0423\u0431\u0440\u0430\u0442\u044c"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda10;

    invoke-direct {v1, p0, v0}, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda10;-><init>(Lorg/rabochaya/projects/DemActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method synthetic lambda$button$4$org-rabochaya-projects-DemActivity(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 9
    iget-boolean p2, p0, Lorg/rabochaya/projects/DemActivity;->busy:Z

    if-nez p2, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method synthetic lambda$install$7$org-rabochaya-projects-DemActivity(Ljava/lang/String;)V
    .locals 3

    .line 14
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/DemActivity;->busy:Z

    iget-boolean v0, p0, Lorg/rabochaya/projects/DemActivity;->disposed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/DemActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DEM \u043d\u0435 \u0438\u0437\u043c\u0435\u043d\u0451\u043d: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lorg/rabochaya/projects/DemActivity;->save:Landroid/widget/Button;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    goto :goto_1

    :cond_1
    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/DemActivity;->setResult(I)V

    :try_start_0
    iget-wide v0, p0, Lorg/rabochaya/projects/DemActivity;->project:J

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/DemActivity;->file(Landroid/content/Context;J)Ljava/io/File;

    move-result-object p1

    iget-wide v0, p0, Lorg/rabochaya/projects/DemActivity;->project:J

    invoke-static {p1, v0, v1}, Lorg/rabochaya/projects/HgtRaster;->owned(Ljava/io/File;J)Lorg/rabochaya/projects/HgtRaster;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v0, p0, Lorg/rabochaya/projects/DemActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u0423\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d DEM"

    invoke-static {p1, v1}, Lorg/rabochaya/projects/DemActivity;->description(Lorg/rabochaya/projects/HgtRaster;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p1, :cond_3

    :try_start_2
    invoke-virtual {p1}, Lorg/rabochaya/projects/HgtRaster;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :catchall_0
    move-exception v0

    if-eqz p1, :cond_2

    :try_start_3
    invoke-virtual {p1}, Lorg/rabochaya/projects/HgtRaster;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p1

    :try_start_4
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    throw v0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception p1

    iget-object v0, p0, Lorg/rabochaya/projects/DemActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_3
    :goto_1
    return-void
.end method

.method synthetic lambda$install$8$org-rabochaya-projects-DemActivity(Ljava/io/File;Ljava/lang/String;)V
    .locals 4

    .line 14
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "hgt-owned-"

    const-string v2, ".tmp"

    invoke-virtual {p0}, Lorg/rabochaya/projects/DemActivity;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-static {v1, v2, v3}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    :try_start_1
    iget-wide v2, p0, Lorg/rabochaya/projects/DemActivity;->project:J

    invoke-static {p1, p2, v1, v2, v3}, Lorg/rabochaya/projects/HgtRaster;->prepare(Ljava/io/File;Ljava/lang/String;Ljava/io/File;J)V

    iget-wide p1, p0, Lorg/rabochaya/projects/DemActivity;->project:J

    invoke-static {v1, p1, p2}, Lorg/rabochaya/projects/HgtRaster;->owned(Ljava/io/File;J)Lorg/rabochaya/projects/HgtRaster;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lorg/rabochaya/projects/HgtRaster;->close()V

    :cond_0
    const-class p1, Lorg/rabochaya/projects/LocalRasterStore;

    monitor-enter p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    :try_start_2
    iget-boolean p2, p0, Lorg/rabochaya/projects/DemActivity;->disposed:Z

    if-nez p2, :cond_2

    new-instance p2, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {p2, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :try_start_3
    iget-wide v2, p0, Lorg/rabochaya/projects/DemActivity;->project:J

    invoke-virtual {p2, v2, v3}, Lorg/rabochaya/projects/ProjectStore;->exists(J)Z

    move-result v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v2, :cond_1

    :try_start_4
    invoke-virtual {p2}, Lorg/rabochaya/projects/ProjectStore;->close()V

    iget-wide v2, p0, Lorg/rabochaya/projects/DemActivity;->project:J

    invoke-static {p0, v2, v3}, Lorg/rabochaya/projects/DemActivity;->file(Landroid/content/Context;J)Ljava/io/File;

    move-result-object p2

    iget-object v2, p0, Lorg/rabochaya/projects/DemActivity;->expected:Ljava/lang/String;

    invoke-static {v1, p2, v2}, Lorg/rabochaya/projects/LocalRasterStore;->replace(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :try_start_5
    iget-wide v1, p0, Lorg/rabochaya/projects/DemActivity;->project:J

    invoke-static {p0, v1, v2}, Lorg/rabochaya/projects/DemActivity;->file(Landroid/content/Context;J)Ljava/io/File;

    move-result-object p2

    invoke-static {p2}, Lorg/rabochaya/projects/LocalRasterStore;->stamp(Ljava/io/File;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lorg/rabochaya/projects/DemActivity;->expected:Ljava/lang/String;

    monitor-exit p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_2

    :cond_1
    :try_start_6
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u041f\u0440\u043e\u0435\u043a\u0442 \u0443\u0434\u0430\u043b\u0451\u043d"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :catchall_0
    move-exception v0

    :try_start_7
    invoke-virtual {p2}, Lorg/rabochaya/projects/ProjectStore;->close()V

    throw v0

    :cond_2
    new-instance p2, Ljava/io/IOException;

    const-string v0, "\u0418\u043c\u043f\u043e\u0440\u0442 \u043e\u0442\u043c\u0435\u043d\u0451\u043d"

    invoke-direct {p2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :catchall_1
    move-exception p2

    move-object v0, v1

    :goto_0
    :try_start_8
    monitor-exit p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :try_start_9
    throw p2
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    :catchall_2
    move-exception p2

    goto :goto_0

    :catchall_3
    move-exception p1

    move-object v0, v1

    goto :goto_3

    :catch_0
    move-exception p1

    move-object v0, v1

    goto :goto_1

    :catchall_4
    move-exception p1

    goto :goto_3

    :catch_1
    move-exception p1

    :goto_1
    :try_start_a
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_3
    move-object v0, p1

    :goto_2
    new-instance p1, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda8;

    invoke-direct {p1, p0, v0}, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda8;-><init>(Lorg/rabochaya/projects/DemActivity;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/DemActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    :goto_3
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_4
    throw p1
.end method

.method synthetic lambda$onActivityResult$5$org-rabochaya-projects-DemActivity(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 13
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/DemActivity;->busy:Z

    iget-boolean v1, p0, Lorg/rabochaya/projects/DemActivity;->disposed:Z

    if-eqz v1, :cond_1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    :cond_0
    return-void

    :cond_1
    iget-object v1, p0, Lorg/rabochaya/projects/DemActivity;->raw:Ljava/io/File;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/DemActivity;->raw:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_2
    iput-object p1, p0, Lorg/rabochaya/projects/DemActivity;->raw:Ljava/io/File;

    iput-object p2, p0, Lorg/rabochaya/projects/DemActivity;->sourceName:Ljava/lang/String;

    iget-object p1, p0, Lorg/rabochaya/projects/DemActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lorg/rabochaya/projects/DemActivity;->save:Landroid/widget/Button;

    iget-object p2, p0, Lorg/rabochaya/projects/DemActivity;->raw:Ljava/io/File;

    if-eqz p2, :cond_3

    const/4 v0, 0x1

    :cond_3
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method

.method synthetic lambda$onActivityResult$6$org-rabochaya-projects-DemActivity(Landroid/net/Uri;Ljava/lang/String;)V
    .locals 9

    .line 13
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "hgt-input-"

    const-string v2, ".tmp"

    invoke-virtual {p0}, Lorg/rabochaya/projects/DemActivity;->getCacheDir()Ljava/io/File;

    move-result-object v3

    invoke-static {v1, v2, v3}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    :try_start_1
    invoke-virtual {p0}, Lorg/rabochaya/projects/DemActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :try_start_2
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    if-eqz p1, :cond_6

    const/high16 v3, 0x10000

    :try_start_3
    new-array v3, v3, [B

    const-wide/16 v4, 0x0

    :goto_0
    invoke-virtual {p1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    const/4 v7, -0x1

    const-string v8, "\u0418\u043c\u043f\u043e\u0440\u0442 \u043e\u0442\u043c\u0435\u043d\u0451\u043d"

    if-eq v6, v7, :cond_2

    :try_start_4
    iget-boolean v7, p0, Lorg/rabochaya/projects/DemActivity;->disposed:Z

    if-nez v7, :cond_1

    int-to-long v7, v6

    add-long/2addr v4, v7

    const-wide/32 v7, 0x18bba42

    cmp-long v7, v4, v7

    if-gtz v7, :cond_0

    const/4 v7, 0x0

    invoke-virtual {v2, v3, v7, v6}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_0

    :cond_0
    new-instance v3, Ljava/io/IOException;

    const-string v4, "HGT \u043f\u0440\u0435\u0432\u044b\u0448\u0430\u0435\u0442 \u0440\u0430\u0437\u043c\u0435\u04403601\u00b2 int16"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_1
    throw v3

    :cond_1
    new-instance v3, Ljava/io/IOException;

    invoke-direct {v3, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/FileDescriptor;->sync()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :try_start_5
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    if-eqz p1, :cond_3

    :try_start_6
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    :cond_3
    new-instance p1, Lorg/rabochaya/projects/HgtRaster;

    invoke-direct {p1, v1, p2}, Lorg/rabochaya/projects/HgtRaster;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    :try_start_7
    const-string v2, "\u0413\u043e\u0442\u043e\u0432 \u043a \u0443\u0441\u0442\u0430\u043d\u043e\u0432\u043a\u0435"

    invoke-static {p1, v2}, Lorg/rabochaya/projects/DemActivity;->description(Lorg/rabochaya/projects/HgtRaster;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :try_start_8
    invoke-virtual {p1}, Lorg/rabochaya/projects/HgtRaster;->close()V

    iget-boolean p1, p0, Lorg/rabochaya/projects/DemActivity;->disposed:Z

    if-nez p1, :cond_4

    move-object p1, v0

    move-object v0, v1

    goto :goto_6

    :cond_4
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    :catch_0
    move-exception p1

    goto :goto_5

    :catchall_0
    move-exception v2

    :try_start_9
    invoke-virtual {p1}, Lorg/rabochaya/projects/HgtRaster;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p1

    :try_start_a
    invoke-virtual {v2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_5
    :goto_2
    throw v2
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1

    :catchall_2
    move-exception v3

    goto :goto_3

    :cond_6
    :try_start_b
    new-instance v3, Ljava/io/IOException;

    const-string v4, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043e\u0442\u043a\u0440\u044b\u0442\u044c HGT"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    goto :goto_1

    :goto_3
    :try_start_c
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    goto :goto_4

    :catchall_3
    move-exception v2

    :try_start_d
    invoke-virtual {v3, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_4
    throw v3
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    :catchall_4
    move-exception v2

    if-eqz p1, :cond_5

    :try_start_e
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    goto :goto_2

    :catchall_5
    move-exception p1

    :try_start_f
    invoke-virtual {v2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_1

    goto :goto_2

    :catch_1
    move-exception p1

    move-object v2, v0

    goto :goto_5

    :catch_2
    move-exception p1

    move-object v1, v0

    move-object v2, v1

    :goto_5
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    if-eqz v1, :cond_7

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_7
    :goto_6
    if-nez p1, :cond_8

    goto :goto_7

    :cond_8
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DEM \u043d\u0435 \u0438\u0437\u043c\u0435\u043d\u0451\u043d: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_7
    new-instance p1, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda6;

    invoke-direct {p1, p0, v0, p2, v2}, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda6;-><init>(Lorg/rabochaya/projects/DemActivity;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/DemActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$onCreate$0$org-rabochaya-projects-DemActivity()V
    .locals 0

    .line 8
    invoke-direct {p0}, Lorg/rabochaya/projects/DemActivity;->pick()V

    return-void
.end method

.method synthetic lambda$onCreate$1$org-rabochaya-projects-DemActivity()V
    .locals 0

    .line 8
    invoke-direct {p0}, Lorg/rabochaya/projects/DemActivity;->install()V

    return-void
.end method

.method synthetic lambda$onCreate$2$org-rabochaya-projects-DemActivity()V
    .locals 0

    .line 8
    invoke-direct {p0}, Lorg/rabochaya/projects/DemActivity;->remove()V

    return-void
.end method

.method synthetic lambda$onCreate$3$org-rabochaya-projects-DemActivity()V
    .locals 0

    .line 8
    invoke-virtual {p0}, Lorg/rabochaya/projects/DemActivity;->onBackPressed()V

    return-void
.end method

.method synthetic lambda$remove$10$org-rabochaya-projects-DemActivity(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .locals 3

    .line 15
    const p2, 0x102001a

    const v0, 0x102000b

    const v1, 0x1020019

    filled-new-array {v1, p2, v0}, [I

    move-result-object p2

    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    aget v1, p2, v0

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    instance-of v2, v1, Landroid/widget/TextView;

    if-eqz v2, :cond_0

    check-cast v1, Landroid/widget/TextView;

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method synthetic lambda$remove$9$org-rabochaya-projects-DemActivity(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 15
    :try_start_0
    const-class p1, Lorg/rabochaya/projects/LocalRasterStore;

    monitor-enter p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-wide v0, p0, Lorg/rabochaya/projects/DemActivity;->project:J

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/DemActivity;->file(Landroid/content/Context;J)Ljava/io/File;

    move-result-object p2

    iget-wide v0, p0, Lorg/rabochaya/projects/DemActivity;->project:J

    invoke-static {p2, v0, v1}, Lorg/rabochaya/projects/HgtRaster;->owned(Ljava/io/File;J)Lorg/rabochaya/projects/HgtRaster;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lorg/rabochaya/projects/HgtRaster;->close()V

    :cond_0
    iget-wide v0, p0, Lorg/rabochaya/projects/DemActivity;->project:J

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/DemActivity;->file(Landroid/content/Context;J)Ljava/io/File;

    move-result-object p2

    iget-object v0, p0, Lorg/rabochaya/projects/DemActivity;->expected:Ljava/lang/String;

    invoke-static {p2, v0}, Lorg/rabochaya/projects/LocalRasterStore;->remove(Ljava/io/File;Ljava/lang/String;)V

    iget-wide v0, p0, Lorg/rabochaya/projects/DemActivity;->project:J

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/DemActivity;->file(Landroid/content/Context;J)Ljava/io/File;

    move-result-object p2

    invoke-static {p2}, Lorg/rabochaya/projects/LocalRasterStore;->stamp(Ljava/io/File;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lorg/rabochaya/projects/DemActivity;->expected:Ljava/lang/String;

    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 p1, -0x1

    :try_start_2
    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/DemActivity;->setResult(I)V

    iget-object p1, p0, Lorg/rabochaya/projects/DemActivity;->status:Landroid/widget/TextView;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "DEM \u0443\u0431\u0440\u0430\u043d.\n\n"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-static {}, Lorg/rabochaya/projects/DemActivity;->help()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :catchall_0
    move-exception p2

    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw p2
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    :catch_0
    move-exception p1

    iget-object p2, p0, Lorg/rabochaya/projects/DemActivity;->status:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DEM \u043d\u0435 \u0438\u0437\u043c\u0435\u043d\u0451\u043d: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 7

    .line 13
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 v0, 0x11f9

    if-ne p1, v0, :cond_6

    const/4 p1, -0x1

    if-ne p2, p1, :cond_6

    if-eqz p3, :cond_6

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_6

    iget-boolean p1, p0, Lorg/rabochaya/projects/DemActivity;->busy:Z

    if-nez p1, :cond_6

    iget-boolean p1, p0, Lorg/rabochaya/projects/DemActivity;->valid:Z

    if-nez p1, :cond_0

    goto/16 :goto_3

    :cond_0
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p2

    const-string p3, "content"

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    const-string p2, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/DemActivity;->status:Landroid/widget/TextView;

    const-string p2, "\u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 HGT"

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_1
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 p3, 0x1

    const/4 v6, 0x0

    if-eqz p2, :cond_4

    :try_start_0
    invoke-virtual {p0}, Lorg/rabochaya/projects/DemActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    new-array v2, p3, [Ljava/lang/String;

    const-string p2, "_display_name"

    aput-object p2, v2, v6

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p2, :cond_3

    :try_start_1
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    if-eqz p2, :cond_2

    :try_start_2
    invoke-interface {p2}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p2

    :try_start_3
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    throw p1

    :cond_3
    const/4 v0, 0x0

    :goto_1
    if-eqz p2, :cond_5

    invoke-interface {p2}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    iget-object p2, p0, Lorg/rabochaya/projects/DemActivity;->status:Landroid/widget/TextView;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u043e\u043b\u0443\u0447\u0438\u0442\u044c \u0438\u043c\u044f HGT: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_4
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    :cond_5
    :goto_2
    iput-boolean p3, p0, Lorg/rabochaya/projects/DemActivity;->busy:Z

    iget-object p2, p0, Lorg/rabochaya/projects/DemActivity;->save:Landroid/widget/Button;

    invoke-virtual {p2, v6}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object p2, p0, Lorg/rabochaya/projects/DemActivity;->status:Landroid/widget/TextView;

    const-string p3, "\u041f\u0440\u043e\u0432\u0435\u0440\u043a\u0430 \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u043e\u0433\u043e HGT\u2026"

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Lorg/rabochaya/projects/DemActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance p3, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda1;

    invoke-direct {p3, p0, p1, v0}, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda1;-><init>(Lorg/rabochaya/projects/DemActivity;Landroid/net/Uri;Ljava/lang/String;)V

    invoke-interface {p2, p3}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :cond_6
    :goto_3
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 8
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/DemActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "project"

    const-wide/16 v1, -0x1

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/rabochaya/projects/DemActivity;->project:J

    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v0, 0xc

    const/16 v1, 0x8

    invoke-virtual {p1, v0, v1, v0, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const v0, -0xdcd2e3

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/DemActivity;->setContentView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lorg/rabochaya/projects/DemActivity;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lorg/rabochaya/projects/DemActivity;->status:Landroid/widget/TextView;

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    iget-object v1, p0, Lorg/rabochaya/projects/DemActivity;->status:Landroid/widget/TextView;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, p0, Lorg/rabochaya/projects/DemActivity;->status:Landroid/widget/TextView;

    const/high16 v3, 0x41880000    # 17.0f

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Lorg/rabochaya/projects/DemActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    invoke-direct {v1, v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda2;-><init>(Lorg/rabochaya/projects/DemActivity;)V

    const-string v1, "\u041e\u0442\u043a\u0440\u044b\u0442\u044c \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 HGT"

    invoke-direct {p0, p1, v1, v0}, Lorg/rabochaya/projects/DemActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/DemActivity;->open:Landroid/widget/Button;

    new-instance v0, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda3;-><init>(Lorg/rabochaya/projects/DemActivity;)V

    const-string v1, "\u0423\u0441\u0442\u0430\u043d\u043e\u0432\u0438\u0442\u044c DEM"

    invoke-direct {p0, p1, v1, v0}, Lorg/rabochaya/projects/DemActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/DemActivity;->save:Landroid/widget/Button;

    new-instance v0, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda4;-><init>(Lorg/rabochaya/projects/DemActivity;)V

    const-string v1, "\u0423\u0431\u0440\u0430\u0442\u044c DEM"

    invoke-direct {p0, p1, v1, v0}, Lorg/rabochaya/projects/DemActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/DemActivity;->remove:Landroid/widget/Button;

    new-instance v0, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/DemActivity$$ExternalSyntheticLambda5;-><init>(Lorg/rabochaya/projects/DemActivity;)V

    const-string v1, "\u041a \u043a\u0430\u0440\u0442\u0435"

    invoke-direct {p0, p1, v1, v0}, Lorg/rabochaya/projects/DemActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    iget-object p1, p0, Lorg/rabochaya/projects/DemActivity;->save:Landroid/widget/Button;

    invoke-virtual {p1, v4}, Landroid/widget/Button;->setEnabled(Z)V

    :try_start_0
    iget-wide v0, p0, Lorg/rabochaya/projects/DemActivity;->project:J

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/DemActivity;->file(Landroid/content/Context;J)Ljava/io/File;

    move-result-object p1

    invoke-static {p1}, Lorg/rabochaya/projects/LocalRasterStore;->stamp(Ljava/io/File;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/DemActivity;->expected:Ljava/lang/String;

    iget-wide v0, p0, Lorg/rabochaya/projects/DemActivity;->project:J

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/DemActivity;->file(Landroid/content/Context;J)Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-wide v0, p0, Lorg/rabochaya/projects/DemActivity;->project:J

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/DemActivity;->file(Landroid/content/Context;J)Ljava/io/File;

    move-result-object p1

    iget-wide v0, p0, Lorg/rabochaya/projects/DemActivity;->project:J

    invoke-static {p1, v0, v1}, Lorg/rabochaya/projects/HgtRaster;->owned(Ljava/io/File;J)Lorg/rabochaya/projects/HgtRaster;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v0, p0, Lorg/rabochaya/projects/DemActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u0423\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d DEM"

    invoke-static {p1, v1}, Lorg/rabochaya/projects/DemActivity;->description(Lorg/rabochaya/projects/HgtRaster;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p1, :cond_2

    :try_start_2
    invoke-virtual {p1}, Lorg/rabochaya/projects/HgtRaster;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :catchall_0
    move-exception v0

    if-eqz p1, :cond_0

    :try_start_3
    invoke-virtual {p1}, Lorg/rabochaya/projects/HgtRaster;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p1

    :try_start_4
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    throw v0

    :cond_1
    iget-object p1, p0, Lorg/rabochaya/projects/DemActivity;->status:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DEM \u043d\u0435 \u0443\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d.\n\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lorg/rabochaya/projects/DemActivity;->help()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    iput-boolean v4, p0, Lorg/rabochaya/projects/DemActivity;->valid:Z

    iget-object v0, p0, Lorg/rabochaya/projects/DemActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DEM \u043d\u0435 \u0438\u0437\u043c\u0435\u043d\u0451\u043d: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lorg/rabochaya/projects/DemActivity;->open:Landroid/widget/Button;

    invoke-virtual {p1, v4}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object p1, p0, Lorg/rabochaya/projects/DemActivity;->remove:Landroid/widget/Button;

    invoke-virtual {p1, v4}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_2
    :goto_1
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .line 16
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/DemActivity;->disposed:Z

    iget-object v0, p0, Lorg/rabochaya/projects/DemActivity;->raw:Ljava/io/File;

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/rabochaya/projects/DemActivity;->raw:Ljava/io/File;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/DemActivity;->worker:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method
