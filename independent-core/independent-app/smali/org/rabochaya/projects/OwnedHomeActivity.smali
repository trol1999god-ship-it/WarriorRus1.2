.class public final Lorg/rabochaya/projects/OwnedHomeActivity;
.super Landroid/app/Activity;
.source "OwnedHomeActivity.java"


# instance fields
.field private busy:Z

.field private disposed:Z

.field private root:Landroid/widget/LinearLayout;

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

    iput-object v0, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->worker:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private button(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 1

    .line 11
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    iget-object p1, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance p1, Lorg/rabochaya/projects/OwnedHomeActivity$$ExternalSyntheticLambda5;

    invoke-direct {p1, p0, p2}, Lorg/rabochaya/projects/OwnedHomeActivity$$ExternalSyntheticLambda5;-><init>(Lorg/rabochaya/projects/OwnedHomeActivity;Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private open()V
    .locals 2

    .line 7
    iget-boolean v0, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->busy:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->busy:Z

    iget-object v0, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041e\u0442\u043a\u0440\u044b\u0442\u0438\u0435 \u0440\u0430\u0431\u043e\u0447\u0435\u0439 \u043a\u0430\u0440\u0442\u044b\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/rabochaya/projects/OwnedHomeActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/OwnedHomeActivity$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/OwnedHomeActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 10
    return-void
.end method


# virtual methods
.method synthetic lambda$button$5$org-rabochaya-projects-OwnedHomeActivity(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 11
    iget-boolean p2, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->busy:Z

    if-nez p2, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method synthetic lambda$open$0$org-rabochaya-projects-OwnedHomeActivity(J)V
    .locals 1

    .line 8
    iget-boolean v0, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->disposed:Z

    if-nez v0, :cond_0

    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/LocalMapActivity;->open(Landroid/app/Activity;J)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/OwnedHomeActivity;->finish()V

    :cond_0
    return-void
.end method

.method synthetic lambda$open$1$org-rabochaya-projects-OwnedHomeActivity()V
    .locals 0

    .line 9
    invoke-direct {p0}, Lorg/rabochaya/projects/OwnedHomeActivity;->open()V

    return-void
.end method

.method synthetic lambda$open$2$org-rabochaya-projects-OwnedHomeActivity()V
    .locals 2

    .line 9
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "org.rabochaya.projects.ProjectsActivity"

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/OwnedHomeActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method synthetic lambda$open$3$org-rabochaya-projects-OwnedHomeActivity(Ljava/lang/Exception;)V
    .locals 3

    .line 9
    iget-boolean v0, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->disposed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->busy:Z

    iget-object v0, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043e\u0442\u043a\u0440\u044b\u0442\u044c \u043a\u0430\u0440\u0442\u0443: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    new-instance p1, Lorg/rabochaya/projects/OwnedHomeActivity$$ExternalSyntheticLambda3;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/OwnedHomeActivity$$ExternalSyntheticLambda3;-><init>(Lorg/rabochaya/projects/OwnedHomeActivity;)V

    const-string v0, "\u041f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u044c"

    invoke-direct {p0, v0, p1}, Lorg/rabochaya/projects/OwnedHomeActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;)V

    new-instance p1, Lorg/rabochaya/projects/OwnedHomeActivity$$ExternalSyntheticLambda4;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/OwnedHomeActivity$$ExternalSyntheticLambda4;-><init>(Lorg/rabochaya/projects/OwnedHomeActivity;)V

    const-string v0, "\u041f\u0440\u043e\u0435\u043a\u0442\u044b \u0438 \u0444\u0430\u0439\u043b\u044b KML/KMZ"

    invoke-direct {p0, v0, p1}, Lorg/rabochaya/projects/OwnedHomeActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$open$4$org-rabochaya-projects-OwnedHomeActivity()V
    .locals 3

    .line 8
    :try_start_0
    invoke-static {p0}, Lorg/rabochaya/projects/ProjectSession;->current(Landroid/content/Context;)J

    move-result-wide v0

    new-instance v2, Lorg/rabochaya/projects/OwnedHomeActivity$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, v0, v1}, Lorg/rabochaya/projects/OwnedHomeActivity$$ExternalSyntheticLambda1;-><init>(Lorg/rabochaya/projects/OwnedHomeActivity;J)V

    invoke-virtual {p0, v2}, Lorg/rabochaya/projects/OwnedHomeActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Lorg/rabochaya/projects/OwnedHomeActivity$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, v0}, Lorg/rabochaya/projects/OwnedHomeActivity$$ExternalSyntheticLambda2;-><init>(Lorg/rabochaya/projects/OwnedHomeActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, v1}, Lorg/rabochaya/projects/OwnedHomeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 10
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 6
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->root:Landroid/widget/LinearLayout;

    iget-object p1, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->root:Landroid/widget/LinearLayout;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object p1, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->root:Landroid/widget/LinearLayout;

    const/16 v0, 0x14

    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object p1, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->root:Landroid/widget/LinearLayout;

    const v0, -0xdcd2e3

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object p1, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/OwnedHomeActivity;->setContentView(Landroid/view/View;)V

    new-instance p1, Landroid/widget/TextView;

    invoke-direct {p1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->status:Landroid/widget/TextView;

    iget-object p1, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->status:Landroid/widget/TextView;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p1, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->root:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-direct {p0}, Lorg/rabochaya/projects/OwnedHomeActivity;->open()V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 12
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->disposed:Z

    iget-object v0, p0, Lorg/rabochaya/projects/OwnedHomeActivity;->worker:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method
