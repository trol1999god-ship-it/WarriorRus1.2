.class public final Lorg/rabochaya/projects/MediaPlaybackActivity;
.super Landroid/app/Activity;
.source "MediaPlaybackActivity.java"


# instance fields
.field private audio:Landroid/media/MediaPlayer;

.field private bitmap:Landroid/graphics/Bitmap;

.field private volatile disposed:Z

.field private foreground:Z

.field private root:Landroid/widget/LinearLayout;

.field private status:Landroid/widget/TextView;

.field private temporary:Ljava/io/File;

.field private video:Landroid/widget/VideoView;

.field private final worker:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 4
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 6
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->worker:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private load()V
    .locals 2

    .line 8
    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda1;-><init>(Lorg/rabochaya/projects/MediaPlaybackActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 16
    return-void
.end method

.method private play(Lorg/rabochaya/projects/MediaLinks$Item;)V
    .locals 6

    .line 18
    iget-object v0, p1, Lorg/rabochaya/projects/MediaLinks$Item;->mime:Ljava/lang/String;

    const-string v1, "video/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/widget/VideoView;

    invoke-direct {v0, p0}, Landroid/widget/VideoView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->video:Landroid/widget/VideoView;

    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->root:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->video:Landroid/widget/VideoView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, -0x1

    invoke-direct {v2, v5, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Landroid/widget/MediaController;

    invoke-direct {v0, p0}, Landroid/widget/MediaController;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->video:Landroid/widget/VideoView;

    invoke-virtual {v0, v1}, Landroid/widget/MediaController;->setAnchorView(Landroid/view/View;)V

    iget-object v1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->video:Landroid/widget/VideoView;

    invoke-virtual {v1, v0}, Landroid/widget/VideoView;->setMediaController(Landroid/widget/MediaController;)V

    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->video:Landroid/widget/VideoView;

    new-instance v1, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1}, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda5;-><init>(Lorg/rabochaya/projects/MediaPlaybackActivity;Lorg/rabochaya/projects/MediaLinks$Item;)V

    invoke-virtual {v0, v1}, Landroid/widget/VideoView;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->video:Landroid/widget/VideoView;

    new-instance v0, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda6;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda6;-><init>(Lorg/rabochaya/projects/MediaPlaybackActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/VideoView;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->video:Landroid/widget/VideoView;

    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->temporary:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/VideoView;->setVideoPath(Ljava/lang/String;)V

    goto :goto_0

    .line 19
    :cond_0
    :try_start_0
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->audio:Landroid/media/MediaPlayer;

    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->audio:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->temporary:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->audio:Landroid/media/MediaPlayer;

    new-instance v1, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, p1}, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda7;-><init>(Lorg/rabochaya/projects/MediaPlaybackActivity;Lorg/rabochaya/projects/MediaLinks$Item;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->audio:Landroid/media/MediaPlayer;

    new-instance v0, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda8;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda8;-><init>(Lorg/rabochaya/projects/MediaPlaybackActivity;)V

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    new-instance p1, Landroid/widget/Button;

    invoke-direct {p1, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v0, "\u0412\u043e\u0441\u043f\u0440\u043e\u0438\u0437\u0432\u0435\u0441\u0442\u0438 / \u043f\u0430\u0443\u0437\u0430"

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const v0, -0xdfdfe0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setTextColor(I)V

    const v0, -0x17131d

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setBackgroundColor(I)V

    new-instance v0, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda9;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda9;-><init>(Lorg/rabochaya/projects/MediaPlaybackActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->audio:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->prepareAsync()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043e\u0442\u043a\u0440\u044b\u0442\u044c \u0430\u0443\u0434\u0438\u043e: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    :goto_0
    return-void
.end method


# virtual methods
.method synthetic lambda$load$1$org-rabochaya-projects-MediaPlaybackActivity(Landroid/graphics/Bitmap;Lorg/rabochaya/projects/MediaLinks$Item;)V
    .locals 5

    .line 11
    iget-boolean v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->disposed:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    return-void

    :cond_0
    iput-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->bitmap:Landroid/graphics/Bitmap;

    new-instance v0, Landroid/widget/ImageView;

    invoke-direct {v0, p0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    sget-object p1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u041b\u043e\u043a\u0430\u043b\u044c\u043d\u043e\u0435 \u0444\u043e\u0442\u043e: "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v1, p2, Lorg/rabochaya/projects/MediaLinks$Item;->name:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->root:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, -0x1

    invoke-direct {v1, v4, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->status:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u0424\u043e\u0442\u043e \u0433\u043e\u0442\u043e\u0432\u043e: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object p2, p2, Lorg/rabochaya/projects/MediaLinks$Item;->name:Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$load$2$org-rabochaya-projects-MediaPlaybackActivity(Ljava/io/File;Lorg/rabochaya/projects/MediaLinks$Item;)V
    .locals 1

    .line 14
    iget-boolean v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->disposed:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    return-void

    :cond_0
    iput-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->temporary:Ljava/io/File;

    invoke-direct {p0, p2}, Lorg/rabochaya/projects/MediaPlaybackActivity;->play(Lorg/rabochaya/projects/MediaLinks$Item;)V

    return-void
.end method

.method synthetic lambda$load$3$org-rabochaya-projects-MediaPlaybackActivity(Ljava/lang/Exception;)V
    .locals 3

    .line 16
    iget-boolean v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->disposed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043e\u0442\u043a\u0440\u044b\u0442\u044c: "

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

.method synthetic lambda$load$4$org-rabochaya-projects-MediaPlaybackActivity()V
    .locals 9

    .line 8
    nop

    .line 9
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    :try_start_1
    invoke-virtual {p0}, Lorg/rabochaya/projects/MediaPlaybackActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "project"

    const-wide/16 v4, -0x1

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v2

    invoke-virtual {p0}, Lorg/rabochaya/projects/MediaPlaybackActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "feature"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/rabochaya/projects/KmlProject;->byId(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    if-eqz v3, :cond_c

    invoke-static {v3}, Lorg/rabochaya/projects/MediaLinks;->list(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/MediaLinks$Item;

    iget-object v5, v4, Lorg/rabochaya/projects/MediaLinks$Item;->id:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/rabochaya/projects/MediaPlaybackActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "attachment"

    invoke-virtual {v6, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move-object v0, v4

    goto :goto_0

    :cond_1
    if-eqz v0, :cond_b

    iget-object v3, v2, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    iget-object v4, v0, Lorg/rabochaya/projects/MediaLinks$Item;->href:Ljava/lang/String;

    invoke-static {v2, v4}, Lorg/rabochaya/projects/MediaLinks;->path(Lorg/rabochaya/projects/KmlProject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    if-eqz v2, :cond_a

    .line 10
    iget-object v3, v0, Lorg/rabochaya/projects/MediaLinks$Item;->mime:Ljava/lang/String;

    const-string v4, "image/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 11
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v4, 0x1

    iput-boolean v4, v3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    array-length v5, v2

    const/4 v6, 0x0

    invoke-static {v2, v6, v5, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    iget v5, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-lt v5, v4, :cond_5

    iget v5, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-lt v5, v4, :cond_5

    iget v5, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    const/16 v7, 0x4000

    if-gt v5, v7, :cond_5

    iget v5, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-gt v5, v7, :cond_5

    iput-boolean v6, v3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iput v4, v3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    :goto_1
    iget v4, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v5, v3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    div-int/2addr v4, v5

    const/16 v5, 0x400

    if-gt v4, v5, :cond_4

    iget v4, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget v7, v3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    div-int/2addr v4, v7

    if-le v4, v5, :cond_2

    goto :goto_3

    :cond_2
    sget-object v4, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v4, v3, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    array-length v4, v2

    invoke-static {v2, v6, v4, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2

    if-eqz v2, :cond_3

    new-instance v3, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda2;

    invoke-direct {v3, p0, v2, v0}, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda2;-><init>(Lorg/rabochaya/projects/MediaPlaybackActivity;Landroid/graphics/Bitmap;Lorg/rabochaya/projects/MediaLinks$Item;)V

    invoke-virtual {p0, v3}, Lorg/rabochaya/projects/MediaPlaybackActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 12
    goto :goto_5

    .line 11
    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0434\u0435\u043a\u043e\u0434\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u0438\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_2
    throw v0

    :cond_4
    :goto_3
    iget v4, v3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    mul-int/lit8 v4, v4, 0x2

    iput v4, v3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    goto :goto_1

    :cond_5
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u0418\u0437\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u0442\u0441\u044f \u0438\u043b\u0438 \u0441\u043b\u0438\u0448\u043a\u043e\u043c \u0432\u0435\u043b\u0438\u043a\u043e"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    .line 12
    :cond_6
    iget-object v3, v0, Lorg/rabochaya/projects/MediaLinks$Item;->mime:Ljava/lang/String;

    const-string v4, "audio/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_8

    iget-object v3, v0, Lorg/rabochaya/projects/MediaLinks$Item;->mime:Ljava/lang/String;

    const-string v4, "video/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    goto :goto_4

    .line 15
    :cond_7
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u041f\u0440\u043e\u0441\u043c\u043e\u0442\u0440 \u044d\u0442\u043e\u0433\u043e \u0444\u043e\u0440\u043c\u0430\u0442\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u0442\u0441\u044f; \u0444\u0430\u0439\u043b \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u0435\u0442\u0441\u044f \u0432 KMZ"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 13
    :cond_8
    :goto_4
    const-string v3, "rk-private-preview-"

    const-string v4, ".media"

    invoke-virtual {p0}, Lorg/rabochaya/projects/MediaPlaybackActivity;->getCacheDir()Ljava/io/File;

    move-result-object v5

    invoke-static {v3, v4, v5}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    :try_start_2
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    :try_start_3
    invoke-virtual {v4, v2}, Ljava/io/FileOutputStream;->write([B)V

    invoke-virtual {v4}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/FileDescriptor;->sync()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    iget-boolean v2, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->disposed:Z

    if-eqz v2, :cond_9

    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 16
    invoke-virtual {v1}, Lorg/rabochaya/projects/ProjectStore;->close()V

    .line 13
    return-void

    .line 14
    :cond_9
    :try_start_5
    new-instance v2, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda3;

    invoke-direct {v2, p0, v3, v0}, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda3;-><init>(Lorg/rabochaya/projects/MediaPlaybackActivity;Ljava/io/File;Lorg/rabochaya/projects/MediaLinks$Item;)V

    invoke-virtual {p0, v2}, Lorg/rabochaya/projects/MediaPlaybackActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 15
    nop

    .line 16
    :goto_5
    goto :goto_9

    .line 13
    :catchall_0
    move-exception v0

    :try_start_6
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_6

    :catchall_1
    move-exception v2

    :try_start_7
    invoke-virtual {v0, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_6
    throw v0
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    :catch_0
    move-exception v0

    :try_start_8
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    throw v0

    .line 9
    :cond_a
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u0424\u0430\u0439\u043b \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u044f \u043e\u0442\u0441\u0443\u0442\u0441\u0442\u0432\u0443\u0435\u0442"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_7
    throw v0

    :cond_b
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u0412\u043b\u043e\u0436\u0435\u043d\u0438\u0435 \u0443\u0434\u0430\u043b\u0435\u043d\u043e"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_7

    :cond_c
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u041e\u0431\u044a\u0435\u043a\u0442 \u0443\u0434\u0430\u043b\u0451\u043d"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    goto :goto_7

    .line 16
    :catch_1
    move-exception v0

    goto :goto_8

    :catchall_2
    move-exception v1

    move-object v8, v1

    move-object v1, v0

    move-object v0, v8

    goto :goto_a

    :catch_2
    move-exception v1

    move-object v8, v1

    move-object v1, v0

    move-object v0, v8

    :goto_8
    :try_start_9
    new-instance v2, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0, v0}, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda4;-><init>(Lorg/rabochaya/projects/MediaPlaybackActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, v2}, Lorg/rabochaya/projects/MediaPlaybackActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    if-eqz v1, :cond_d

    :goto_9
    invoke-virtual {v1}, Lorg/rabochaya/projects/ProjectStore;->close()V

    :cond_d
    return-void

    :catchall_3
    move-exception v0

    :goto_a
    if-eqz v1, :cond_e

    invoke-virtual {v1}, Lorg/rabochaya/projects/ProjectStore;->close()V

    :cond_e
    throw v0
.end method

.method synthetic lambda$onCreate$0$org-rabochaya-projects-MediaPlaybackActivity(Landroid/view/View;)V
    .locals 0

    .line 7
    invoke-virtual {p0}, Lorg/rabochaya/projects/MediaPlaybackActivity;->finish()V

    return-void
.end method

.method synthetic lambda$play$5$org-rabochaya-projects-MediaPlaybackActivity(Lorg/rabochaya/projects/MediaLinks$Item;Landroid/media/MediaPlayer;)V
    .locals 2

    .line 18
    iget-boolean p2, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->disposed:Z

    if-nez p2, :cond_0

    iget-object p2, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->status:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u0412\u0438\u0434\u0435\u043e \u0433\u043e\u0442\u043e\u0432\u043e: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object p1, p1, Lorg/rabochaya/projects/MediaLinks$Item;->name:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-boolean p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->foreground:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->video:Landroid/widget/VideoView;

    invoke-virtual {p1}, Landroid/widget/VideoView;->start()V

    :cond_0
    return-void
.end method

.method synthetic lambda$play$6$org-rabochaya-projects-MediaPlaybackActivity(Landroid/media/MediaPlayer;II)Z
    .locals 2

    .line 18
    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->status:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0432\u043e\u0441\u043f\u0440\u043e\u0438\u0437\u0432\u0435\u0441\u0442\u0438 \u0432\u0438\u0434\u0435\u043e: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x1

    return p1
.end method

.method synthetic lambda$play$7$org-rabochaya-projects-MediaPlaybackActivity(Lorg/rabochaya/projects/MediaLinks$Item;Landroid/media/MediaPlayer;)V
    .locals 3

    .line 19
    iget-boolean v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->disposed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u0410\u0443\u0434\u0438\u043e \u0433\u043e\u0442\u043e\u0432\u043e: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object p1, p1, Lorg/rabochaya/projects/MediaLinks$Item;->name:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-boolean p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->foreground:Z

    if-eqz p1, :cond_0

    invoke-virtual {p2}, Landroid/media/MediaPlayer;->start()V

    :cond_0
    return-void
.end method

.method synthetic lambda$play$8$org-rabochaya-projects-MediaPlaybackActivity(Landroid/media/MediaPlayer;II)Z
    .locals 2

    .line 19
    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->status:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0432\u043e\u0441\u043f\u0440\u043e\u0438\u0437\u0432\u0435\u0441\u0442\u0438 \u0430\u0443\u0434\u0438\u043e: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x1

    return p1
.end method

.method synthetic lambda$play$9$org-rabochaya-projects-MediaPlaybackActivity(Landroid/view/View;)V
    .locals 1

    .line 19
    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->audio:Landroid/media/MediaPlayer;

    if-eqz p1, :cond_1

    :try_start_0
    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->audio:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->audio:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->pause()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->audio:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->status:Landroid/widget/TextView;

    const-string v0, "\u0414\u043e\u0436\u0434\u0438\u0442\u0435\u0441\u044c \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u043a\u0438 \u0430\u0443\u0434\u0438\u043e"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 7
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->root:Landroid/widget/LinearLayout;

    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->root:Landroid/widget/LinearLayout;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->root:Landroid/widget/LinearLayout;

    const v0, -0xdcd2e3

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/MediaPlaybackActivity;->setContentView(Landroid/view/View;)V

    new-instance p1, Landroid/widget/TextView;

    invoke-direct {p1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->status:Landroid/widget/TextView;

    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->status:Landroid/widget/TextView;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->status:Landroid/widget/TextView;

    const/16 v0, 0xc

    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->status:Landroid/widget/TextView;

    const-string v0, "\u041e\u0442\u043a\u0440\u044b\u0442\u0438\u0435 \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u043e\u0433\u043e \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u044f\u2026"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->root:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance p1, Landroid/widget/Button;

    invoke-direct {p1, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v0, "\u041d\u0430\u0437\u0430\u0434"

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const v0, -0xdfdfe0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setTextColor(I)V

    const v0, -0x17131d

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setBackgroundColor(I)V

    new-instance v0, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/MediaPlaybackActivity$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/MediaPlaybackActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-direct {p0}, Lorg/rabochaya/projects/MediaPlaybackActivity;->load()V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 23
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->disposed:Z

    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->video:Landroid/widget/VideoView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->video:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->stopPlayback()V

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->audio:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->audio:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->audio:Landroid/media/MediaPlayer;

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->temporary:Ljava/io/File;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->temporary:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_2
    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->worker:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onPause()V
    .locals 1

    .line 22
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->foreground:Z

    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->video:Landroid/widget/VideoView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->video:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->pause()V

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->audio:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->audio:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->audio:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_1
    :goto_0
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 21
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/MediaPlaybackActivity;->foreground:Z

    return-void
.end method
