.class public final Lorg/rabochaya/projects/AttachmentsActivity;
.super Landroid/app/Activity;
.source "AttachmentsActivity.java"


# static fields
.field private static final PICK:I = 0x1131


# instance fields
.field private busy:Z

.field private volatile disposed:Z

.field private featureId:Ljava/lang/String;

.field private projectId:J

.field private queued:Landroid/net/Uri;

.field private root:Landroid/widget/LinearLayout;

.field private status:Landroid/widget/TextView;

.field private final worker:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 5
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 7
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->worker:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 3

    .line 10
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 p2, 0x0

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setAllCaps(Z)V

    const p2, -0xdfdfe0

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setTextColor(I)V

    const p2, -0x17131d

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setBackgroundColor(I)V

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {p2, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda5;

    invoke-direct {p1, p0, p3}, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda5;-><init>(Lorg/rabochaya/projects/AttachmentsActivity;Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private importFile(Landroid/net/Uri;)V
    .locals 2

    .line 16
    const-string v0, "content"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/AttachmentsActivity;->status:Landroid/widget/TextView;

    const-string v0, "\u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 \u0444\u0430\u0439\u043b"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 17
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->busy:Z

    iget-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u0421\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u0438\u0435 \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u044f\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, p1}, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda7;-><init>(Lorg/rabochaya/projects/AttachmentsActivity;Landroid/net/Uri;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 23
    return-void
.end method

.method private load()V
    .locals 2

    .line 11
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->busy:Z

    iget-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    const-string v0, "\u041e\u0442\u043a\u0440\u044b\u0442\u0438\u0435 \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u0439\u2026"

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/AttachmentsActivity;->text(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->status:Landroid/widget/TextView;

    iget-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->root:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lorg/rabochaya/projects/AttachmentsActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda4;-><init>(Lorg/rabochaya/projects/AttachmentsActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private pick()V
    .locals 4

    .line 13
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "*/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "audio/*"

    const-string v2, "video/*"

    const-string v3, "image/*"

    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.intent.extra.MIME_TYPES"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.LOCAL_ONLY"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/16 v1, 0x1131

    :try_start_0
    invoke-virtual {p0, v0, v1}, Lorg/rabochaya/projects/AttachmentsActivity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041d\u0430 \u0443\u0441\u0442\u0440\u043e\u0439\u0441\u0442\u0432\u0435 \u043d\u0435\u0442 \u0441\u0438\u0441\u0442\u0435\u043c\u043d\u043e\u0433\u043e \u0432\u044b\u0431\u043e\u0440\u0430 \u0444\u0430\u0439\u043b\u043e\u0432"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method private remove(Ljava/lang/String;)V
    .locals 2

    .line 24
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->busy:Z

    iget-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u0423\u0434\u0430\u043b\u0435\u043d\u0438\u0435 \u0441\u0441\u044b\u043b\u043a\u0438 \u043d\u0430 \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u0435\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda12;

    invoke-direct {v1, p0, p1}, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda12;-><init>(Lorg/rabochaya/projects/AttachmentsActivity;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private show(Ljava/util/List;Ljava/util/Map;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/MediaLinks$Item;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 12
    iget-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u0412\u043b\u043e\u0436\u0435\u043d\u0438\u0439: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/AttachmentsActivity;->text(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->status:Landroid/widget/TextView;

    iget-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->root:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lorg/rabochaya/projects/AttachmentsActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->root:Landroid/widget/LinearLayout;

    new-instance v1, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda13;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda13;-><init>(Lorg/rabochaya/projects/AttachmentsActivity;)V

    const-string v2, "\u0414\u043e\u0431\u0430\u0432\u0438\u0442\u044c \u0444\u043e\u0442\u043e, \u0430\u0443\u0434\u0438\u043e \u0438\u043b\u0438 \u0432\u0438\u0434\u0435\u043e"

    invoke-direct {p0, v0, v2, v1}, Lorg/rabochaya/projects/AttachmentsActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V

    iget-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->root:Landroid/widget/LinearLayout;

    new-instance v1, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda14;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda14;-><init>(Lorg/rabochaya/projects/AttachmentsActivity;)V

    const-string v2, "\u041d\u0430\u0437\u0430\u0434"

    invoke-direct {p0, v0, v2, v1}, Lorg/rabochaya/projects/AttachmentsActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V

    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    iget-object v2, p0, Lorg/rabochaya/projects/AttachmentsActivity;->root:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, -0x1

    invoke-direct {v3, v6, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/rabochaya/projects/MediaLinks$Item;

    iget-object v2, v0, Lorg/rabochaya/projects/MediaLinks$Item;->id:Ljava/lang/String;

    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v0, Lorg/rabochaya/projects/MediaLinks$Item;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " \u00b7 "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, v0, Lorg/rabochaya/projects/MediaLinks$Item;->mime:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-gez v4, :cond_0

    goto :goto_1

    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " \u0431\u0430\u0439\u0442"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    :cond_1
    :goto_1
    const-string v2, "\u0444\u0430\u0439\u043b \u043e\u0442\u0441\u0443\u0442\u0441\u0442\u0432\u0443\u0435\u0442"

    :goto_2
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda15;

    invoke-direct {v3, p0, v0}, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda15;-><init>(Lorg/rabochaya/projects/AttachmentsActivity;Lorg/rabochaya/projects/MediaLinks$Item;)V

    invoke-direct {p0, v1, v2, v3}, Lorg/rabochaya/projects/AttachmentsActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_2
    return-void
.end method

.method private text(Ljava/lang/String;)Landroid/widget/TextView;
    .locals 2

    .line 9
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, -0x1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 p1, 0x41800000    # 16.0f

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 p1, 0xa

    const/16 v1, 0xc

    invoke-virtual {v0, p1, v1, p1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object v0
.end method


# virtual methods
.method synthetic lambda$button$0$org-rabochaya-projects-AttachmentsActivity(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 10
    iget-boolean p2, p0, Lorg/rabochaya/projects/AttachmentsActivity;->busy:Z

    if-nez p2, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method synthetic lambda$importFile$10$org-rabochaya-projects-AttachmentsActivity()V
    .locals 1

    .line 21
    iget-boolean v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->disposed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->busy:Z

    invoke-direct {p0}, Lorg/rabochaya/projects/AttachmentsActivity;->load()V

    :cond_0
    return-void
.end method

.method synthetic lambda$importFile$11$org-rabochaya-projects-AttachmentsActivity(Ljava/lang/Exception;)V
    .locals 3

    .line 22
    iget-boolean v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->disposed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->busy:Z

    iget-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u0412\u043b\u043e\u0436\u0435\u043d\u0438\u0435 \u043d\u0435 \u0434\u043e\u0431\u0430\u0432\u043b\u0435\u043d\u043e: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$importFile$12$org-rabochaya-projects-AttachmentsActivity(Landroid/net/Uri;)V
    .locals 12

    .line 17
    nop

    .line 18
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/rabochaya/projects/AttachmentsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "content"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_2

    invoke-virtual {p0}, Lorg/rabochaya/projects/AttachmentsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const/4 v3, 0x1

    new-array v7, v3, [Ljava/lang/String;

    const-string v3, "_display_name"

    aput-object v3, v7, v4

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v8, 0x0

    move-object v6, p1

    invoke-virtual/range {v5 .. v10}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    if-eqz v3, :cond_1

    :try_start_1
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    if-eqz v3, :cond_0

    :try_start_2
    invoke-interface {v3}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v1

    :try_start_3
    invoke-virtual {p1, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    throw p1

    :cond_1
    :goto_1
    if-eqz v3, :cond_2

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 19
    :cond_2
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-virtual {p0}, Lorg/rabochaya/projects/AttachmentsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {v5, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_5

    if-eqz p1, :cond_9

    const/16 v5, 0x4000

    :try_start_4
    new-array v5, v5, [B

    :goto_2
    invoke-virtual {p1, v5}, Ljava/io/InputStream;->read([B)I

    move-result v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    const/4 v7, -0x1

    const-string v8, "\u0418\u043c\u043f\u043e\u0440\u0442 \u043e\u0442\u043c\u0435\u043d\u0451\u043d"

    if-eq v6, v7, :cond_5

    :try_start_5
    iget-boolean v7, p0, Lorg/rabochaya/projects/AttachmentsActivity;->disposed:Z

    if-nez v7, :cond_4

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v7

    add-int/2addr v7, v6

    const/high16 v8, 0x800000

    if-gt v7, v8, :cond_3

    invoke-virtual {v3, v5, v4, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_2

    :cond_3
    new-instance v1, Ljava/io/IOException;

    const-string v2, "\u041f\u0440\u0435\u0434\u0435\u043b \u043e\u0434\u043d\u043e\u0433\u043e \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u044f \u2014 8 \u041c\u0438\u0411"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_3
    throw v1

    :cond_4
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_3

    :cond_5
    if-eqz p1, :cond_6

    :try_start_6
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 20
    :cond_6
    iget-boolean p1, p0, Lorg/rabochaya/projects/AttachmentsActivity;->disposed:Z

    if-nez p1, :cond_8

    new-instance p1, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    :try_start_7
    iget-wide v4, p0, Lorg/rabochaya/projects/AttachmentsActivity;->projectId:J

    invoke-virtual {p1, v4, v5}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v0

    iget-object v4, p0, Lorg/rabochaya/projects/AttachmentsActivity;->featureId:Ljava/lang/String;

    invoke-virtual {v0, v4}, Lorg/rabochaya/projects/KmlProject;->byId(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    if-eqz v4, :cond_7

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-static {v0, v4, v1, v2, v3}, Lorg/rabochaya/projects/MediaLinks;->add(Lorg/rabochaya/projects/KmlProject;Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;[B)Lorg/rabochaya/projects/MediaLinks$Item;

    iget-wide v1, p0, Lorg/rabochaya/projects/AttachmentsActivity;->projectId:J

    invoke-static {p1, v1, v2, v0}, Lorg/rabochaya/projects/ProjectWrites;->save(Lorg/rabochaya/projects/ProjectStore;JLorg/rabochaya/projects/KmlProject;)V

    .line 21
    new-instance v0, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda8;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda8;-><init>(Lorg/rabochaya/projects/AttachmentsActivity;)V

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/AttachmentsActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 22
    invoke-virtual {p1}, Lorg/rabochaya/projects/ProjectStore;->close()V

    goto :goto_7

    .line 20
    :cond_7
    :try_start_8
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u041e\u0431\u044a\u0435\u043a\u0442 \u0443\u0434\u0430\u043b\u0451\u043d"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 22
    :catchall_2
    move-exception v0

    move-object v11, v0

    move-object v0, p1

    move-object p1, v11

    goto :goto_8

    :catch_0
    move-exception v0

    move-object v11, v0

    move-object v0, p1

    move-object p1, v11

    goto :goto_6

    .line 20
    :cond_8
    :try_start_9
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    .line 19
    :catchall_3
    move-exception v1

    goto :goto_4

    :cond_9
    :try_start_a
    new-instance v1, Ljava/io/IOException;

    const-string v2, "\u0424\u0430\u0439\u043b \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u0435\u043d"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    goto :goto_3

    :goto_4
    if-eqz p1, :cond_a

    :try_start_b
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    goto :goto_5

    :catchall_4
    move-exception p1

    :try_start_c
    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_a
    :goto_5
    throw v1
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    .line 22
    :catchall_5
    move-exception p1

    goto :goto_8

    :catch_1
    move-exception p1

    :goto_6
    :try_start_d
    new-instance v1, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda9;

    invoke-direct {v1, p0, p1}, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda9;-><init>(Lorg/rabochaya/projects/AttachmentsActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, v1}, Lorg/rabochaya/projects/AttachmentsActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    :cond_b
    :goto_7
    return-void

    :goto_8
    if-eqz v0, :cond_c

    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    :cond_c
    throw p1
.end method

.method synthetic lambda$load$1$org-rabochaya-projects-AttachmentsActivity(Ljava/util/List;Ljava/util/HashMap;)V
    .locals 1

    .line 11
    iget-boolean v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->disposed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->busy:Z

    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/AttachmentsActivity;->show(Ljava/util/List;Ljava/util/Map;)V

    iget-object p1, p0, Lorg/rabochaya/projects/AttachmentsActivity;->queued:Landroid/net/Uri;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/AttachmentsActivity;->queued:Landroid/net/Uri;

    const/4 p2, 0x0

    iput-object p2, p0, Lorg/rabochaya/projects/AttachmentsActivity;->queued:Landroid/net/Uri;

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/AttachmentsActivity;->importFile(Landroid/net/Uri;)V

    :cond_1
    return-void
.end method

.method synthetic lambda$load$2$org-rabochaya-projects-AttachmentsActivity()V
    .locals 0

    .line 11
    invoke-virtual {p0}, Lorg/rabochaya/projects/AttachmentsActivity;->finish()V

    return-void
.end method

.method synthetic lambda$load$3$org-rabochaya-projects-AttachmentsActivity(Ljava/lang/Exception;)V
    .locals 3

    .line 11
    iget-boolean v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->disposed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->busy:Z

    iget-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043e\u0442\u043a\u0440\u044b\u0442\u044c \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u044f: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lorg/rabochaya/projects/AttachmentsActivity;->root:Landroid/widget/LinearLayout;

    new-instance v0, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda11;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda11;-><init>(Lorg/rabochaya/projects/AttachmentsActivity;)V

    const-string v1, "\u041d\u0430\u0437\u0430\u0434"

    invoke-direct {p0, p1, v1, v0}, Lorg/rabochaya/projects/AttachmentsActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$load$4$org-rabochaya-projects-AttachmentsActivity()V
    .locals 9

    .line 11
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-wide v2, p0, Lorg/rabochaya/projects/AttachmentsActivity;->projectId:J

    invoke-virtual {v1, v2, v3}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v0

    iget-object v2, p0, Lorg/rabochaya/projects/AttachmentsActivity;->featureId:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lorg/rabochaya/projects/KmlProject;->byId(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-static {v2}, Lorg/rabochaya/projects/MediaLinks;->list(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v2

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/rabochaya/projects/MediaLinks$Item;

    iget-object v6, v0, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    iget-object v7, v5, Lorg/rabochaya/projects/MediaLinks$Item;->href:Ljava/lang/String;

    invoke-static {v0, v7}, Lorg/rabochaya/projects/MediaLinks;->path(Lorg/rabochaya/projects/KmlProject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [B

    iget-object v5, v5, Lorg/rabochaya/projects/MediaLinks$Item;->id:Ljava/lang/String;

    if-nez v6, :cond_0

    const/4 v6, -0x1

    goto :goto_1

    :cond_0
    array-length v6, v6

    :goto_1
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    new-instance v0, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0, v2, v3}, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda2;-><init>(Lorg/rabochaya/projects/AttachmentsActivity;Ljava/util/List;Ljava/util/HashMap;)V

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/AttachmentsActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_3

    :cond_2
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u041e\u0431\u044a\u0435\u043a\u0442 \u0443\u0434\u0430\u043b\u0451\u043d"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catch_0
    move-exception v0

    goto :goto_2

    :catchall_0
    move-exception v1

    move-object v8, v1

    move-object v1, v0

    move-object v0, v8

    goto :goto_4

    :catch_1
    move-exception v1

    move-object v8, v1

    move-object v1, v0

    move-object v0, v8

    :goto_2
    :try_start_2
    new-instance v2, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda3;

    invoke-direct {v2, p0, v0}, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda3;-><init>(Lorg/rabochaya/projects/AttachmentsActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, v2}, Lorg/rabochaya/projects/AttachmentsActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v1, :cond_3

    :goto_3
    invoke-virtual {v1}, Lorg/rabochaya/projects/ProjectStore;->close()V

    :cond_3
    return-void

    :catchall_1
    move-exception v0

    :goto_4
    if-eqz v1, :cond_4

    invoke-virtual {v1}, Lorg/rabochaya/projects/ProjectStore;->close()V

    :cond_4
    throw v0
.end method

.method synthetic lambda$remove$13$org-rabochaya-projects-AttachmentsActivity()V
    .locals 1

    .line 24
    iget-boolean v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->disposed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->busy:Z

    invoke-direct {p0}, Lorg/rabochaya/projects/AttachmentsActivity;->load()V

    :cond_0
    return-void
.end method

.method synthetic lambda$remove$14$org-rabochaya-projects-AttachmentsActivity(Ljava/lang/Exception;)V
    .locals 3

    .line 24
    iget-boolean v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->disposed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->busy:Z

    iget-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0443\u0431\u0440\u0430\u0442\u044c \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u0435: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$remove$15$org-rabochaya-projects-AttachmentsActivity(Ljava/lang/String;)V
    .locals 4

    .line 24
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-wide v2, p0, Lorg/rabochaya/projects/AttachmentsActivity;->projectId:J

    invoke-virtual {v1, v2, v3}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v0

    iget-object v2, p0, Lorg/rabochaya/projects/AttachmentsActivity;->featureId:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lorg/rabochaya/projects/KmlProject;->byId(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-static {v0, v2, p1}, Lorg/rabochaya/projects/MediaLinks;->remove(Lorg/rabochaya/projects/KmlProject;Lorg/w3c/dom/Element;Ljava/lang/String;)V

    iget-wide v2, p0, Lorg/rabochaya/projects/AttachmentsActivity;->projectId:J

    invoke-static {v1, v2, v3, v0}, Lorg/rabochaya/projects/ProjectWrites;->save(Lorg/rabochaya/projects/ProjectStore;JLorg/rabochaya/projects/KmlProject;)V

    new-instance p1, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/AttachmentsActivity;)V

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/AttachmentsActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-virtual {v1}, Lorg/rabochaya/projects/ProjectStore;->close()V

    goto :goto_1

    :cond_0
    :try_start_2
    new-instance p1, Ljava/io/IOException;

    const-string v0, "\u041e\u0431\u044a\u0435\u043a\u0442 \u0443\u0434\u0430\u043b\u0451\u043d"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception p1

    move-object v0, v1

    goto :goto_2

    :catch_0
    move-exception p1

    move-object v0, v1

    goto :goto_0

    :catchall_1
    move-exception p1

    goto :goto_2

    :catch_1
    move-exception p1

    :goto_0
    :try_start_3
    new-instance v1, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda1;-><init>(Lorg/rabochaya/projects/AttachmentsActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, v1}, Lorg/rabochaya/projects/AttachmentsActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    :cond_1
    :goto_1
    return-void

    :goto_2
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    :cond_2
    throw p1
.end method

.method synthetic lambda$show$5$org-rabochaya-projects-AttachmentsActivity()V
    .locals 0

    .line 12
    invoke-direct {p0}, Lorg/rabochaya/projects/AttachmentsActivity;->pick()V

    return-void
.end method

.method synthetic lambda$show$6$org-rabochaya-projects-AttachmentsActivity()V
    .locals 0

    .line 12
    invoke-virtual {p0}, Lorg/rabochaya/projects/AttachmentsActivity;->finish()V

    return-void
.end method

.method synthetic lambda$show$7$org-rabochaya-projects-AttachmentsActivity(Lorg/rabochaya/projects/MediaLinks$Item;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 12
    iget-object p1, p1, Lorg/rabochaya/projects/MediaLinks$Item;->id:Ljava/lang/String;

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/AttachmentsActivity;->remove(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$show$8$org-rabochaya-projects-AttachmentsActivity(Lorg/rabochaya/projects/MediaLinks$Item;Landroid/content/DialogInterface;I)V
    .locals 2

    .line 12
    if-nez p3, :cond_0

    new-instance p2, Landroid/content/Intent;

    const-class p3, Lorg/rabochaya/projects/MediaPlaybackActivity;

    invoke-direct {p2, p0, p3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p3, "project"

    iget-wide v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->projectId:J

    invoke-virtual {p2, p3, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object p3

    const-string v0, "feature"

    iget-object v1, p0, Lorg/rabochaya/projects/AttachmentsActivity;->featureId:Ljava/lang/String;

    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p3

    const-string v0, "attachment"

    iget-object p1, p1, Lorg/rabochaya/projects/MediaLinks$Item;->id:Ljava/lang/String;

    invoke-virtual {p3, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p2}, Lorg/rabochaya/projects/AttachmentsActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :cond_0
    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string p3, "\u0423\u0431\u0440\u0430\u0442\u044c \u044d\u0442\u043e \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u0435 \u0438\u0437 \u043e\u0431\u044a\u0435\u043a\u0442\u0430? \u041e\u0431\u0449\u0438\u0439 \u0444\u0430\u0439\u043b \u0441\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u0441\u044f, \u0435\u0441\u043b\u0438 \u043e\u043d \u043d\u0443\u0436\u0435\u043d \u0434\u0440\u0443\u0433\u043e\u043c\u0443 \u043e\u0431\u044a\u0435\u043a\u0442\u0443."

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance p3, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda10;

    invoke-direct {p3, p0, p1}, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda10;-><init>(Lorg/rabochaya/projects/AttachmentsActivity;Lorg/rabochaya/projects/MediaLinks$Item;)V

    const-string p1, "\u0423\u0431\u0440\u0430\u0442\u044c"

    invoke-virtual {p2, p1, p3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    :goto_0
    return-void
.end method

.method synthetic lambda$show$9$org-rabochaya-projects-AttachmentsActivity(Lorg/rabochaya/projects/MediaLinks$Item;)V
    .locals 3

    .line 12
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p1, Lorg/rabochaya/projects/MediaLinks$Item;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043a\u0440\u044b\u0442\u044c"

    const-string v2, "\u0423\u0431\u0440\u0430\u0442\u044c \u0438\u0437 \u043e\u0431\u044a\u0435\u043a\u0442\u0430"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda6;

    invoke-direct {v2, p0, p1}, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda6;-><init>(Lorg/rabochaya/projects/AttachmentsActivity;Lorg/rabochaya/projects/MediaLinks$Item;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 14
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 v0, 0x1131

    if-ne p1, v0, :cond_1

    const/4 p1, -0x1

    if-ne p2, p1, :cond_1

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lorg/rabochaya/projects/AttachmentsActivity;->busy:Z

    if-eqz p1, :cond_0

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/AttachmentsActivity;->queued:Landroid/net/Uri;

    goto :goto_0

    :cond_0
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/AttachmentsActivity;->importFile(Landroid/net/Uri;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 8
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/AttachmentsActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "project"

    const-wide/16 v1, -0x1

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->projectId:J

    invoke-virtual {p0}, Lorg/rabochaya/projects/AttachmentsActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "feature"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/AttachmentsActivity;->featureId:Ljava/lang/String;

    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lorg/rabochaya/projects/AttachmentsActivity;->root:Landroid/widget/LinearLayout;

    iget-object p1, p0, Lorg/rabochaya/projects/AttachmentsActivity;->root:Landroid/widget/LinearLayout;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object p1, p0, Lorg/rabochaya/projects/AttachmentsActivity;->root:Landroid/widget/LinearLayout;

    const/16 v0, 0xc

    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object p1, p0, Lorg/rabochaya/projects/AttachmentsActivity;->root:Landroid/widget/LinearLayout;

    const v0, -0xdcd2e3

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object p1, p0, Lorg/rabochaya/projects/AttachmentsActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/AttachmentsActivity;->setContentView(Landroid/view/View;)V

    invoke-direct {p0}, Lorg/rabochaya/projects/AttachmentsActivity;->load()V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->disposed:Z

    iget-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity;->worker:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method
