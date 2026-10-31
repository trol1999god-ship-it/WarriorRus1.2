.class public final Lorg/rabochaya/projects/OnlineMapActivity;
.super Landroid/app/Activity;
.source "OnlineMapActivity.java"


# instance fields
.field private volatile cancelled:Z

.field private disposed:Z

.field private volatile downloading:Lorg/rabochaya/projects/OnlineTiles;

.field private project:J

.field private root:Landroid/widget/LinearLayout;

.field private running:Z

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

    iput-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->worker:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private button(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 4

    .line 17
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, -0x1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setTextColor(I)V

    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v2, -0xc8bcd7

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v2, 0x41000000    # 8.0f

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const/4 v2, 0x1

    const v3, -0x9b88b0

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Lorg/rabochaya/projects/OnlineMapActivity;->root:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, p1, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda25;

    invoke-direct {p1, p0, p2}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda25;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private cancel()V
    .locals 2

    .line 35
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->cancelled:Z

    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->downloading:Lorg/rabochaya/projects/OnlineTiles;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/rabochaya/projects/OnlineTiles;->cancel()V

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->status:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430\u2026 \u041f\u043e\u043b\u0443\u0447\u0435\u043d\u043d\u044b\u0435 \u0442\u0430\u0439\u043b\u044b \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u044e\u0442\u0441\u044f"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    return-void
.end method

.method private catalog()V
    .locals 4

    .line 33
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/rabochaya/projects/MapCatalogActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "project"

    iget-wide v2, p0, Lorg/rabochaya/projects/OnlineMapActivity;->project:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0x1195

    invoke-virtual {p0, v0, v1}, Lorg/rabochaya/projects/OnlineMapActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private clear()V
    .locals 2

    .line 32
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->running:Z

    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda24;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda24;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private configure()V
    .locals 14

    .line 20
    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->source(Landroid/content/Context;)Lorg/rabochaya/projects/TileSource;

    move-result-object v0

    iget-object v1, v0, Lorg/rabochaya/projects/TileSource;->layers:[Lorg/rabochaya/projects/TileSource;

    if-nez v1, :cond_0

    iget-object v1, v0, Lorg/rabochaya/projects/TileSource;->template:Ljava/lang/String;

    const-string v2, "{x}"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "catalog"

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    invoke-static {}, Lorg/rabochaya/projects/TileSource;->osm()Lorg/rabochaya/projects/TileSource;

    move-result-object v0

    :cond_1
    invoke-direct {p0}, Lorg/rabochaya/projects/OnlineMapActivity;->form()Landroid/widget/LinearLayout;

    move-result-object v1

    const-string v2, "\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435"

    iget-object v3, v0, Lorg/rabochaya/projects/TileSource;->name:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-direct {p0, v1, v2, v3, v4}, Lorg/rabochaya/projects/OnlineMapActivity;->input(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/EditText;

    move-result-object v8

    const-string v2, "HTTPS-\u0448\u0430\u0431\u043b\u043e\u043d XYZ: {z}/{x}/{y}"

    iget-object v3, v0, Lorg/rabochaya/projects/TileSource;->template:Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3, v4}, Lorg/rabochaya/projects/OnlineMapActivity;->input(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/EditText;

    move-result-object v9

    const-string v2, "\u041f\u043e\u0434\u043f\u0438\u0441\u044c \u043f\u0440\u0430\u0432\u043e\u043e\u0431\u043b\u0430\u0434\u0430\u0442\u0435\u043b\u044f"

    iget-object v3, v0, Lorg/rabochaya/projects/TileSource;->attribution:Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3, v4}, Lorg/rabochaya/projects/OnlineMapActivity;->input(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/EditText;

    move-result-object v10

    iget v2, v0, Lorg/rabochaya/projects/TileSource;->minZoom:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u041c\u0438\u043d\u0438\u043c\u0430\u043b\u044c\u043d\u044b\u0439 \u043c\u0430\u0441\u0448\u0442\u0430\u0431"

    const/4 v4, 0x1

    invoke-direct {p0, v1, v3, v2, v4}, Lorg/rabochaya/projects/OnlineMapActivity;->input(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/EditText;

    move-result-object v11

    iget v2, v0, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u041c\u0430\u043a\u0441\u0438\u043c\u0430\u043b\u044c\u043d\u044b\u0439 \u043c\u0430\u0441\u0448\u0442\u0430\u0431"

    invoke-direct {p0, v1, v3, v2, v4}, Lorg/rabochaya/projects/OnlineMapActivity;->input(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/EditText;

    move-result-object v12

    new-instance v13, Landroid/widget/CheckBox;

    invoke-direct {v13, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    const-string v2, "\u0418\u0441\u0442\u043e\u0447\u043d\u0438\u043a \u0440\u0430\u0437\u0440\u0435\u0448\u0430\u0435\u0442 \u0441\u043a\u0430\u0447\u0438\u0432\u0430\u043d\u0438\u0435 \u043e\u0431\u043b\u0430\u0441\u0442\u0435\u0439"

    invoke-virtual {v13, v2}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    const v2, -0xdfdfe0

    invoke-virtual {v13, v2}, Landroid/widget/CheckBox;->setTextColor(I)V

    iget-boolean v0, v0, Lorg/rabochaya/projects/TileSource;->downloads:Z

    invoke-virtual {v13, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-virtual {v1, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "XYZ-\u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda26;

    move-object v5, v1

    move-object v6, p0

    move-object v7, v0

    invoke-direct/range {v5 .. v13}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda26;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/CheckBox;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private download(Lorg/rabochaya/projects/TileSource;Lorg/rabochaya/projects/TileDownloadPlan;)V
    .locals 2

    .line 28
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->running:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->cancelled:Z

    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u0421\u043a\u0430\u0447\u0438\u0432\u0430\u043d\u0438\u0435: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object p1, p1, Lorg/rabochaya/projects/TileSource;->name:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x14

    invoke-direct {p0, p1, v0}, Lorg/rabochaya/projects/OnlineMapActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    const-string p1, "\u041f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u043a\u0430\u2026"

    const/16 v0, 0xf

    invoke-direct {p0, p1, v0}, Lorg/rabochaya/projects/OnlineMapActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/OnlineMapActivity;->status:Landroid/widget/TextView;

    new-instance p1, Landroid/widget/ProgressBar;

    const/4 v0, 0x0

    const v1, 0x1010078

    invoke-direct {p1, p0, v0, v1}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iget-wide v0, p2, Lorg/rabochaya/projects/TileDownloadPlan;->count:J

    long-to-int v0, v0

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setMax(I)V

    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0438\u0442\u044c \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0443"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    const v1, -0xc8bcd7

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    iget-object v1, p0, Lorg/rabochaya/projects/OnlineMapActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda22;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda22;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda23;

    invoke-direct {v1, p0, p2, p1}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda23;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;Lorg/rabochaya/projects/TileDownloadPlan;Landroid/widget/ProgressBar;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 30
    return-void
.end method

.method private form()Landroid/widget/LinearLayout;
    .locals 3

    .line 19
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0x12

    const/16 v2, 0xc

    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const v1, -0xd0a13

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    return-object v0
.end method

.method private input(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/EditText;
    .locals 1

    .line 18
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const p2, -0xdfdfe0

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p2}, Landroid/widget/EditText;->setTextColor(I)V

    const/4 p2, -0x1

    invoke-virtual {v0, p2}, Landroid/widget/EditText;->setBackgroundColor(I)V

    const/4 p2, 0x1

    invoke-virtual {v0, p2}, Landroid/widget/EditText;->setSingleLine(Z)V

    if-eqz p4, :cond_0

    const/16 p2, 0x3002

    goto :goto_0

    :cond_0
    const p2, 0x80001

    :goto_0
    invoke-virtual {v0, p2}, Landroid/widget/EditText;->setInputType(I)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method private static join([Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p0, v2

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_0

    const/16 v4, 0x3b

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_0
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static number(D)Ljava/lang/String;
    .locals 2

    .line 27
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, p1, v1

    const-string p0, "%.8f"

    invoke-static {v0, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private region(Z)V
    .locals 13

    .line 21
    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->source(Landroid/content/Context;)Lorg/rabochaya/projects/TileSource;

    move-result-object v0

    iget-boolean v1, v0, Lorg/rabochaya/projects/TileSource;->downloads:Z

    const/4 v2, 0x0

    if-nez v1, :cond_0

    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v0, "\u042d\u0442\u043e\u0442 \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a \u0440\u0430\u0437\u0440\u0435\u0448\u0430\u0435\u0442 \u0442\u043e\u043b\u044c\u043a\u043e \u043f\u0440\u043e\u0441\u043c\u043e\u0442\u0440 \u0438 \u043a\u0435\u0448 \u043f\u0440\u043e\u0441\u043c\u043e\u0442\u0440\u0435\u043d\u043d\u043e\u0433\u043e. \u0414\u043b\u044f \u0441\u043a\u0430\u0447\u0438\u0432\u0430\u043d\u0438\u044f \u043e\u0431\u043b\u0430\u0441\u0442\u0438 \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u0442\u0435 XYZ-\u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a, \u043a\u043e\u0442\u043e\u0440\u044b\u0439 \u0440\u0430\u0437\u0440\u0435\u0448\u0430\u0435\u0442 \u0442\u0430\u043a\u0443\u044e \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0443."

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;)V

    const-string v1, "\u041d\u0430\u0441\u0442\u0440\u043e\u0438\u0442\u044c"

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    invoke-virtual {p1, v0, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void

    :cond_0
    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->network(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/OnlineMapActivity;->status:Landroid/widget/TextView;

    const-string v0, "\u0412\u043a\u043b\u044e\u0447\u0438\u0442\u0435 \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0443 \u0442\u0430\u0439\u043b\u043e\u0432 \u0438\u0437 \u0438\u043d\u0442\u0435\u0440\u043d\u0435\u0442\u0430"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 22
    :cond_1
    invoke-virtual {p0}, Lorg/rabochaya/projects/OnlineMapActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v3, "bounds"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getDoubleArrayExtra(Ljava/lang/String;)[D

    move-result-object v1

    const/4 v3, 0x4

    if-eqz v1, :cond_2

    array-length v4, v1

    if-eq v4, v3, :cond_3

    :cond_2
    new-array v1, v3, [D

    fill-array-data v1, :array_0

    :cond_3
    invoke-virtual {p0}, Lorg/rabochaya/projects/OnlineMapActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string v4, "zoom"

    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/Intent;->getDoubleExtra(Ljava/lang/String;D)D

    move-result-wide v3

    double-to-int v3, v3

    const/4 v4, 0x0

    aget-wide v5, v1, v4

    invoke-static {v5, v6}, Lorg/rabochaya/projects/OnlineMapActivity;->number(D)Ljava/lang/String;

    move-result-object v7

    const/4 v5, 0x1

    aget-wide v8, v1, v5

    invoke-static {v8, v9}, Lorg/rabochaya/projects/OnlineMapActivity;->number(D)Ljava/lang/String;

    move-result-object v8

    const/4 v6, 0x2

    aget-wide v9, v1, v6

    invoke-static {v9, v10}, Lorg/rabochaya/projects/OnlineMapActivity;->number(D)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x3

    aget-wide v10, v1, v10

    invoke-static {v10, v11}, Lorg/rabochaya/projects/OnlineMapActivity;->number(D)Ljava/lang/String;

    move-result-object v10

    iget v1, v0, Lorg/rabochaya/projects/TileSource;->minZoom:I

    iget v11, v0, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    invoke-static {v11, v3}, Ljava/lang/Math;->min(II)I

    move-result v11

    invoke-static {v1, v11}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v11

    iget v1, v0, Lorg/rabochaya/projects/TileSource;->minZoom:I

    iget v12, v0, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    add-int/2addr v3, v6

    invoke-static {v12, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v12

    filled-new-array/range {v7 .. v12}, [Ljava/lang/String;

    move-result-object v1

    .line 23
    const/4 v3, 0x6

    if-eqz p1, :cond_4

    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "region_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v0, Lorg/rabochaya/projects/TileSource;->id:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, ""

    invoke-interface {p1, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v6, ";"

    invoke-virtual {p1, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length v6, p1

    if-ne v6, v3, :cond_4

    move-object v1, p1

    .line 24
    :cond_4
    invoke-direct {p0}, Lorg/rabochaya/projects/OnlineMapActivity;->form()Landroid/widget/LinearLayout;

    move-result-object p1

    const-string v10, "\u041e\u0442 \u043c\u0430\u0441\u0448\u0442\u0430\u0431\u0430"

    const-string v11, "\u0414\u043e \u043c\u0430\u0441\u0448\u0442\u0430\u0431\u0430"

    const-string v6, "\u0417\u0430\u043f\u0430\u0434: \u0434\u043e\u043b\u0433\u043e\u0442\u0430"

    const-string v7, "\u042e\u0433: \u0448\u0438\u0440\u043e\u0442\u0430"

    const-string v8, "\u0412\u043e\u0441\u0442\u043e\u043a: \u0434\u043e\u043b\u0433\u043e\u0442\u0430"

    const-string v9, "\u0421\u0435\u0432\u0435\u0440: \u0448\u0438\u0440\u043e\u0442\u0430"

    filled-new-array/range {v6 .. v11}, [Ljava/lang/String;

    move-result-object v6

    new-array v7, v3, [Landroid/widget/EditText;

    :goto_0
    if-ge v4, v3, :cond_5

    aget-object v8, v6, v4

    aget-object v9, v1, v4

    invoke-direct {p0, p1, v8, v9, v5}, Lorg/rabochaya/projects/OnlineMapActivity;->input(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/EditText;

    move-result-object v8

    aput-object v8, v7, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_5
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v3, "\u041d\u0430\u0447\u0430\u043b\u044c\u043d\u044b\u0435 \u0433\u0440\u0430\u043d\u0438\u0446\u044b \u2014 \u0432\u0438\u0434\u0438\u043c\u0430\u044f \u043e\u0431\u043b\u0430\u0441\u0442\u044c \u043a\u0430\u0440\u0442\u044b. \u0417\u0430\u043f\u0430\u0434 > \u0432\u043e\u0441\u0442\u043e\u043a\u0430 \u043e\u0437\u043d\u0430\u0447\u0430\u0435\u0442 \u043f\u0435\u0440\u0435\u0441\u0435\u0447\u0435\u043d\u0438\u0435 180\u00b0. \u0414\u043e 20 000 \u0442\u0430\u0439\u043b\u043e\u0432, \u043a\u0435\u0448 \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a\u0430 \u0434\u043e 256 \u041c\u0438\u0411. \u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430 \u0438\u0434\u0451\u0442, \u043f\u043e\u043a\u0430 \u043e\u0442\u043a\u0440\u044b\u0442 \u044d\u0442\u043e\u0442 \u044d\u043a\u0440\u0430\u043d; \u043e\u0442\u043c\u0435\u043d\u0430 \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u0435\u0442 \u043f\u043e\u043b\u0443\u0447\u0435\u043d\u043d\u043e\u0435."

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v3, -0xdfdfe0

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, p1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 25
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "\u041e\u0431\u043b\u0430\u0441\u0442\u044c \u0434\u043b\u044f \u0441\u043a\u0430\u0447\u0438\u0432\u0430\u043d\u0438\u044f"

    invoke-virtual {p1, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v1, "\u0420\u0430\u0441\u0441\u0447\u0438\u0442\u0430\u0442\u044c"

    invoke-virtual {p1, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-virtual {p1, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    new-instance v1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1, v7, v0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda1;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;Landroid/app/AlertDialog;[Landroid/widget/EditText;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    .line 26
    return-void

    nop

    :array_0
    .array-data 8
        -0x4010000000000000L    # -1.0
        -0x4010000000000000L    # -1.0
        0x3ff0000000000000L    # 1.0
        0x3ff0000000000000L    # 1.0
    .end array-data
.end method

.method private show(Ljava/lang/String;)V
    .locals 3

    .line 7
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->root:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->root:Landroid/widget/LinearLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->root:Landroid/widget/LinearLayout;

    const/16 v1, 0x12

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->root:Landroid/widget/LinearLayout;

    const v1, -0xdcd2e3

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lorg/rabochaya/projects/OnlineMapActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/OnlineMapActivity;->setContentView(Landroid/view/View;)V

    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->source(Landroid/content/Context;)Lorg/rabochaya/projects/TileSource;

    move-result-object v0

    .line 8
    const-string v1, "\u041e\u043d\u043b\u0430\u0439\u043d-\u043a\u0430\u0440\u0442\u0430 \u0438 \u043a\u0435\u0448"

    const/16 v2, 0x15

    invoke-direct {p0, v1, v2}, Lorg/rabochaya/projects/OnlineMapActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, v0, Lorg/rabochaya/projects/TileSource;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u00b7 z"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lorg/rabochaya/projects/TileSource;->minZoom:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\u2013"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lorg/rabochaya/projects/TileSource;->attribution:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xe

    invoke-direct {p0, v1, v2}, Lorg/rabochaya/projects/OnlineMapActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    invoke-direct {p0, p1, v2}, Lorg/rabochaya/projects/OnlineMapActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/OnlineMapActivity;->status:Landroid/widget/TextView;

    const-string p1, "\u0412 \u0441\u0435\u0442\u044c \u043f\u0435\u0440\u0435\u0434\u0430\u044e\u0442\u0441\u044f \u0442\u043e\u043b\u044c\u043a\u043e \u0437\u0430\u043f\u0440\u043e\u0441\u044b \u0442\u0430\u0439\u043b\u043e\u0432 \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u043e\u0439 \u043a\u0430\u0440\u0442\u044b. \u041e\u0431\u044a\u0435\u043a\u0442\u044b, \u0437\u0430\u043c\u0435\u0442\u043a\u0438 \u0438 \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u044f \u043e\u0441\u0442\u0430\u044e\u0442\u0441\u044f \u043d\u0430 \u0443\u0441\u0442\u0440\u043e\u0439\u0441\u0442\u0432\u0435."

    const/16 v1, 0xd

    invoke-direct {p0, p1, v1}, Lorg/rabochaya/projects/OnlineMapActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    .line 9
    new-instance p1, Landroid/widget/CheckBox;

    invoke-direct {p1, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    const-string v1, "\u0417\u0430\u0433\u0440\u0443\u0436\u0430\u0442\u044c \u0442\u0430\u0439\u043b\u044b \u0438\u0437 \u0438\u043d\u0442\u0435\u0440\u043d\u0435\u0442\u0430"

    invoke-virtual {p1, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    const/4 v1, -0x1

    invoke-virtual {p1, v1}, Landroid/widget/CheckBox;->setTextColor(I)V

    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->network(Landroid/content/Context;)Z

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/CheckBox;->setChecked(Z)V

    iget-object v1, p0, Lorg/rabochaya/projects/OnlineMapActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, p1}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda7;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;Landroid/widget/CheckBox;)V

    invoke-virtual {p1, v1}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 10
    new-instance p1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda10;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda10;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;)V

    const-string v1, "\u0412\u0441\u0435 \u0438\u0441\u0445\u043e\u0434\u043d\u044b\u0435 \u043a\u0430\u0440\u0442\u044b \u0438 \u043d\u0430\u0431\u043e\u0440\u044b"

    invoke-direct {p0, v1, p1}, Lorg/rabochaya/projects/OnlineMapActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;)V

    new-instance p1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda11;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda11;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;)V

    const-string v1, "OpenStreetMap \u2014 \u043f\u0440\u043e\u0441\u043c\u043e\u0442\u0440"

    invoke-direct {p0, v1, p1}, Lorg/rabochaya/projects/OnlineMapActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;)V

    new-instance p1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda12;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda12;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;)V

    const-string v1, "\u041d\u0430\u0441\u0442\u0440\u043e\u0438\u0442\u044c XYZ-\u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a"

    invoke-direct {p0, v1, p1}, Lorg/rabochaya/projects/OnlineMapActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 11
    new-instance p1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda13;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda13;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;)V

    const-string v1, "\u041f\u043e\u043a\u0430\u0437\u0430\u0442\u044c \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u0443\u044e \u043a\u0430\u0440\u0442\u0443"

    invoke-direct {p0, v1, p1}, Lorg/rabochaya/projects/OnlineMapActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;)V

    new-instance p1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda14;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda14;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;)V

    const-string v1, "\u041b\u043e\u043a\u0430\u043b\u044c\u043d\u0430\u044f \u043f\u043e\u0434\u043b\u043e\u0436\u043a\u0430 MBTiles"

    invoke-direct {p0, v1, p1}, Lorg/rabochaya/projects/OnlineMapActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 12
    new-instance p1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda15;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda15;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;)V

    const-string v1, "\u0421\u043a\u0430\u0447\u0430\u0442\u044c \u043e\u0431\u043b\u0430\u0441\u0442\u044c \u0432 \u043a\u0435\u0448"

    invoke-direct {p0, v1, p1}, Lorg/rabochaya/projects/OnlineMapActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;)V

    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "region_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lorg/rabochaya/projects/TileSource;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda16;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda16;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;)V

    const-string v1, "\u041f\u0440\u043e\u0434\u043e\u043b\u0436\u0438\u0442\u044c \u043f\u0440\u0435\u0434\u044b\u0434\u0443\u0449\u0443\u044e \u043e\u0431\u043b\u0430\u0441\u0442\u044c"

    invoke-direct {p0, v1, p1}, Lorg/rabochaya/projects/OnlineMapActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 13
    :cond_0
    new-instance p1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda17;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda17;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;)V

    const-string v1, "\u042d\u043a\u0441\u043f\u043e\u0440\u0442 \u043a\u0435\u0448\u0430 MBTiles"

    invoke-direct {p0, v1, p1}, Lorg/rabochaya/projects/OnlineMapActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;)V

    new-instance p1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda18;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda18;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;)V

    const-string v1, "\u041e\u0431\u044a\u0451\u043c \u043a\u0435\u0448\u0430"

    invoke-direct {p0, v1, p1}, Lorg/rabochaya/projects/OnlineMapActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;)V

    new-instance p1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda8;

    invoke-direct {p1, p0, v0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda8;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;Lorg/rabochaya/projects/TileSource;)V

    const-string v0, "\u041e\u0447\u0438\u0441\u0442\u0438\u0442\u044c \u043a\u0435\u0448 \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a\u0430"

    invoke-direct {p0, v0, p1}, Lorg/rabochaya/projects/OnlineMapActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 14
    new-instance p1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda9;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda9;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;)V

    const-string v0, "\u041a \u043a\u0430\u0440\u0442\u0435"

    invoke-direct {p0, v0, p1}, Lorg/rabochaya/projects/OnlineMapActivity;->button(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 15
    return-void
.end method

.method private stats()V
    .locals 2

    .line 31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->running:Z

    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda28;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda28;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private text(Ljava/lang/String;I)Landroid/widget/TextView;
    .locals 1

    .line 16
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, -0x1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    int-to-float p1, p2

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 p1, 0x2

    const/16 p2, 0x8

    invoke-virtual {v0, p1, p2, p1, p2}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object p1, p0, Lorg/rabochaya/projects/OnlineMapActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object v0
.end method


# virtual methods
.method synthetic lambda$button$14$org-rabochaya-projects-OnlineMapActivity(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 17
    iget-boolean p2, p0, Lorg/rabochaya/projects/OnlineMapActivity;->running:Z

    if-nez p2, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lorg/rabochaya/projects/OnlineMapActivity;->status:Landroid/widget/TextView;

    const-string p2, "\u0414\u043e\u0436\u0434\u0438\u0442\u0435\u0441\u044c \u0437\u0430\u0432\u0435\u0440\u0448\u0435\u043d\u0438\u044f \u0438\u043b\u0438 \u043e\u0442\u043c\u0435\u043d\u0438\u0442\u0435 \u0437\u0430\u0433\u0440\u0443\u0437\u043a\u0443"

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$clear$27$org-rabochaya-projects-OnlineMapActivity(Ljava/lang/String;)V
    .locals 1

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->running:Z

    iget-boolean v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->disposed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$clear$28$org-rabochaya-projects-OnlineMapActivity()V
    .locals 5

    .line 32
    :try_start_0
    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->source(Landroid/content/Context;)Lorg/rabochaya/projects/TileSource;

    move-result-object v0

    invoke-virtual {v0}, Lorg/rabochaya/projects/TileSource;->leafs()[Lorg/rabochaya/projects/TileSource;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    new-instance v4, Lorg/rabochaya/projects/OnlineTiles;

    invoke-direct {v4, p0, v3}, Lorg/rabochaya/projects/OnlineTiles;-><init>(Landroid/content/Context;Lorg/rabochaya/projects/TileSource;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-virtual {v4}, Lorg/rabochaya/projects/OnlineTiles;->clear()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-virtual {v4}, Lorg/rabochaya/projects/OnlineTiles;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_3
    invoke-virtual {v4}, Lorg/rabochaya/projects/OnlineTiles;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v1

    :try_start_4
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw v0

    :cond_0
    const-string v0, "\u041a\u0435\u0448 \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a\u0430 \u043e\u0447\u0438\u0449\u0435\u043d"
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043e\u0447\u0438\u0441\u0442\u0438\u0442\u044c \u043a\u0435\u0448: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_2
    new-instance v1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0, v0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda6;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lorg/rabochaya/projects/OnlineMapActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$configure$15$org-rabochaya-projects-OnlineMapActivity(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/CheckBox;Landroid/app/AlertDialog;Landroid/view/View;)V
    .locals 7

    .line 20
    :try_start_0
    new-instance p8, Lorg/rabochaya/projects/TileSource;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p6}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v6

    move-object v0, p8

    invoke-direct/range {v0 .. v6}, Lorg/rabochaya/projects/TileSource;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIZ)V

    iget-wide p3, p0, Lorg/rabochaya/projects/OnlineMapActivity;->project:J

    invoke-static {p0, p8, p3, p4}, Lorg/rabochaya/projects/OnlineMapSettings;->save(Landroid/content/Context;Lorg/rabochaya/projects/TileSource;J)V

    invoke-virtual {p7}, Landroid/app/AlertDialog;->dismiss()V

    const-string p1, "\u0418\u0441\u0442\u043e\u0447\u043d\u0438\u043a \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d; \u043a\u0435\u0448\u0438 \u0440\u0430\u0437\u043d\u044b\u0445 \u0430\u0434\u0440\u0435\u0441\u043e\u0432 \u0445\u0440\u0430\u043d\u044f\u0442\u0441\u044f \u043e\u0442\u0434\u0435\u043b\u044c\u043d\u043e."

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/OnlineMapActivity;->show(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p3

    if-nez p3, :cond_0

    const-string p1, "\u041f\u0440\u043e\u0432\u0435\u0440\u044c\u0442\u0435 \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438"

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-virtual {p2, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_1
    return-void
.end method

.method synthetic lambda$configure$16$org-rabochaya-projects-OnlineMapActivity(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/CheckBox;Landroid/content/DialogInterface;)V
    .locals 11

    .line 20
    const/4 v0, -0x1

    move-object v9, p1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v10, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda21;

    move-object v1, v10

    move-object v2, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v1 .. v9}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda21;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/CheckBox;Landroid/app/AlertDialog;)V

    invoke-virtual {v0, v10}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$download$21$org-rabochaya-projects-OnlineMapActivity(Landroid/view/View;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Lorg/rabochaya/projects/OnlineMapActivity;->cancel()V

    return-void
.end method

.method synthetic lambda$download$22$org-rabochaya-projects-OnlineMapActivity(Landroid/widget/ProgressBar;ILorg/rabochaya/projects/TileDownloadPlan;)V
    .locals 2

    .line 29
    iget-boolean v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->disposed:Z

    if-nez v0, :cond_0

    invoke-virtual {p1, p2}, Landroid/widget/ProgressBar;->setProgress(I)V

    iget-object p1, p0, Lorg/rabochaya/projects/OnlineMapActivity;->status:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u0421\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u043e: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " / "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-wide v0, p3, Lorg/rabochaya/projects/TileDownloadPlan;->count:J

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$download$23$org-rabochaya-projects-OnlineMapActivity(Ljava/lang/String;ILorg/rabochaya/projects/TileDownloadPlan;)V
    .locals 1

    .line 29
    iget-boolean v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->disposed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->running:Z

    if-eqz p1, :cond_1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "\u0417\u0430\u0433\u0440\u0443\u0437\u043a\u0430 \u043e\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d\u0430: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ". \u041f\u043e\u043b\u0443\u0447\u0435\u043d\u043d\u043e\u0435 \u0441\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u043e; \u043c\u043e\u0436\u043d\u043e \u043f\u0440\u043e\u0434\u043e\u043b\u0436\u0438\u0442\u044c."

    :goto_0
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_2

    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-boolean v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->cancelled:Z

    if-eqz v0, :cond_2

    const-string v0, "\u041e\u0442\u043c\u0435\u043d\u0435\u043d\u043e. "

    goto :goto_1

    :cond_2
    const-string v0, "\u0413\u043e\u0442\u043e\u0432\u043e. "

    :goto_1
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "\u0412 \u043a\u0435\u0448\u0435: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " \u0438\u0437 "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-wide p2, p3, Lorg/rabochaya/projects/TileDownloadPlan;->count:J

    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " \u0442\u0430\u0439\u043b\u043e\u0432 \u044d\u0442\u043e\u0439 \u043e\u0431\u043b\u0430\u0441\u0442\u0438."

    goto :goto_0

    :goto_2
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/OnlineMapActivity;->show(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$download$24$org-rabochaya-projects-OnlineMapActivity(Lorg/rabochaya/projects/TileDownloadPlan;Landroid/widget/ProgressBar;)V
    .locals 11

    .line 29
    const/4 v0, 0x0

    move v1, v0

    move v2, v1

    :goto_0
    const/4 v3, 0x0

    :try_start_0
    iget-object v4, p1, Lorg/rabochaya/projects/TileDownloadPlan;->sources:[Lorg/rabochaya/projects/TileSource;

    array-length v4, v4

    if-ge v1, v4, :cond_4

    iget-boolean v4, p0, Lorg/rabochaya/projects/OnlineMapActivity;->cancelled:Z

    if-nez v4, :cond_4

    iget-boolean v4, p0, Lorg/rabochaya/projects/OnlineMapActivity;->disposed:Z

    if-nez v4, :cond_4

    new-instance v4, Lorg/rabochaya/projects/OnlineTiles;

    iget-object v5, p1, Lorg/rabochaya/projects/TileDownloadPlan;->sources:[Lorg/rabochaya/projects/TileSource;

    aget-object v5, v5, v1

    invoke-direct {v4, p0, v5}, Lorg/rabochaya/projects/OnlineTiles;-><init>(Landroid/content/Context;Lorg/rabochaya/projects/TileSource;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    :try_start_1
    iput-object v4, p0, Lorg/rabochaya/projects/OnlineMapActivity;->downloading:Lorg/rabochaya/projects/OnlineTiles;

    iget-object v5, p1, Lorg/rabochaya/projects/TileDownloadPlan;->regions:[Lorg/rabochaya/projects/TileRegion;

    aget-object v5, v5, v1

    invoke-virtual {v5}, Lorg/rabochaya/projects/TileRegion;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [I

    iget-boolean v7, p0, Lorg/rabochaya/projects/OnlineMapActivity;->cancelled:Z

    if-nez v7, :cond_3

    iget-boolean v7, p0, Lorg/rabochaya/projects/OnlineMapActivity;->disposed:Z

    if-eqz v7, :cond_0

    goto :goto_2

    :cond_0
    aget v7, v6, v0

    const/4 v8, 0x1

    aget v9, v6, v8

    const/4 v10, 0x2

    aget v6, v6, v10

    invoke-virtual {v4, v7, v9, v6}, Lorg/rabochaya/projects/OnlineTiles;->download(III)V

    add-int/lit8 v2, v2, 0x1

    if-eq v2, v8, :cond_1

    rem-int/lit8 v6, v2, 0x5

    if-eqz v6, :cond_1

    int-to-long v6, v2

    iget-wide v8, p1, Lorg/rabochaya/projects/TileDownloadPlan;->count:J

    cmp-long v6, v6, v8

    if-nez v6, :cond_2

    :cond_1
    new-instance v6, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda19;

    invoke-direct {v6, p0, p2, v2, p1}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda19;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;Landroid/widget/ProgressBar;ILorg/rabochaya/projects/TileDownloadPlan;)V

    invoke-virtual {p0, v6}, Lorg/rabochaya/projects/OnlineMapActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_2
    const-wide/16 v6, 0xc8

    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :cond_3
    :goto_2
    :try_start_2
    invoke-virtual {v4}, Lorg/rabochaya/projects/OnlineTiles;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catchall_0
    move-exception p2

    :try_start_3
    invoke-virtual {v4}, Lorg/rabochaya/projects/OnlineTiles;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception v0

    :try_start_4
    invoke-virtual {p2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_3
    throw p2
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :cond_4
    iput-object v3, p0, Lorg/rabochaya/projects/OnlineMapActivity;->downloading:Lorg/rabochaya/projects/OnlineTiles;

    goto :goto_5

    :catchall_2
    move-exception p1

    goto :goto_6

    :catch_0
    move-exception p2

    :try_start_5
    iget-boolean v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->cancelled:Z

    if-nez v0, :cond_5

    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    goto :goto_4

    :cond_5
    move-object p2, v3

    :goto_4
    iput-object v3, p0, Lorg/rabochaya/projects/OnlineMapActivity;->downloading:Lorg/rabochaya/projects/OnlineTiles;

    move-object v3, p2

    :goto_5
    new-instance p2, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda20;

    invoke-direct {p2, p0, v3, v2, p1}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda20;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;Ljava/lang/String;ILorg/rabochaya/projects/TileDownloadPlan;)V

    invoke-virtual {p0, p2}, Lorg/rabochaya/projects/OnlineMapActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    :goto_6
    iput-object v3, p0, Lorg/rabochaya/projects/OnlineMapActivity;->downloading:Lorg/rabochaya/projects/OnlineTiles;

    throw p1
.end method

.method synthetic lambda$region$17$org-rabochaya-projects-OnlineMapActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 21
    invoke-direct {p0}, Lorg/rabochaya/projects/OnlineMapActivity;->configure()V

    return-void
.end method

.method synthetic lambda$region$18$org-rabochaya-projects-OnlineMapActivity(Lorg/rabochaya/projects/TileSource;[Ljava/lang/String;Lorg/rabochaya/projects/TileDownloadPlan;Landroid/content/DialogInterface;I)V
    .locals 1

    .line 25
    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p4

    invoke-interface {p4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p4

    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "region_"

    invoke-virtual {p5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p5

    iget-object v0, p1, Lorg/rabochaya/projects/TileSource;->id:Ljava/lang/String;

    invoke-virtual {p5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-static {p2}, Lorg/rabochaya/projects/OnlineMapActivity;->join([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p4, p5, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    invoke-direct {p0, p1, p3}, Lorg/rabochaya/projects/OnlineMapActivity;->download(Lorg/rabochaya/projects/TileSource;Lorg/rabochaya/projects/TileDownloadPlan;)V

    return-void
.end method

.method synthetic lambda$region$19$org-rabochaya-projects-OnlineMapActivity([Landroid/widget/EditText;Lorg/rabochaya/projects/TileSource;Landroid/app/AlertDialog;Landroid/view/View;)V
    .locals 18

    .line 25
    move-object/from16 v1, p0

    move-object/from16 v0, p2

    const/4 v2, 0x6

    const/4 v14, 0x0

    :try_start_0
    new-array v15, v2, [Ljava/lang/String;

    move v3, v14

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, p1, v3

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x2c

    const/16 v6, 0x2e

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v15, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x4

    aget-object v2, v15, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    const/4 v2, 0x5

    aget-object v2, v15, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    iget v2, v0, Lorg/rabochaya/projects/TileSource;->minZoom:I

    if-lt v12, v2, :cond_1

    iget v2, v0, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    if-gt v13, v2, :cond_1

    new-instance v10, Lorg/rabochaya/projects/TileDownloadPlan;

    aget-object v2, v15, v14

    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    const/4 v2, 0x1

    aget-object v2, v15, v2

    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v6

    const/4 v2, 0x2

    aget-object v2, v15, v2

    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v8

    const/4 v2, 0x3

    aget-object v2, v15, v2

    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v16

    move-object v2, v10

    move-object/from16 v3, p2

    move-object v14, v10

    move-wide/from16 v10, v16

    invoke-direct/range {v2 .. v13}, Lorg/rabochaya/projects/TileDownloadPlan;-><init>(Lorg/rabochaya/projects/TileSource;DDDDII)V

    invoke-virtual/range {p3 .. p3}, Landroid/app/AlertDialog;->dismiss()V

    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u041e\u0431\u043b\u0430\u0441\u0442\u044c: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, v14, Lorg/rabochaya/projects/TileDownloadPlan;->count:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " \u0442\u0430\u0439\u043b\u043e\u0432. \u0423\u0436\u0435 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u0435 \u0431\u0443\u0434\u0443\u0442 \u043f\u0440\u043e\u043f\u0443\u0449\u0435\u043d\u044b. \u041c\u0430\u043a\u0441\u0438\u043c\u0443\u043c \u043d\u043e\u0432\u044b\u0445 \u0434\u0430\u043d\u043d\u044b\u0445 \u2014 \u0434\u043e "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, v14, Lorg/rabochaya/projects/TileDownloadPlan;->count:J

    const-wide/16 v6, 0x100

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " \u041c\u0438\u0411. \u0421\u043a\u0430\u0447\u0430\u0442\u044c?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const-string v3, "\u0421\u043a\u0430\u0447\u0430\u0442\u044c"

    new-instance v4, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda2;

    invoke-direct {v4, v1, v0, v15, v14}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda2;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;Lorg/rabochaya/projects/TileSource;[Ljava/lang/String;Lorg/rabochaya/projects/TileDownloadPlan;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v2, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_1

    :cond_1
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u041c\u0430\u0441\u0448\u0442\u0430\u0431\u044b \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a\u0430: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v0, Lorg/rabochaya/projects/TileSource;->minZoom:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\u2013"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v0, v0, Lorg/rabochaya/projects/TileSource;->maxZoom:I

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_1
    return-void
.end method

.method synthetic lambda$region$20$org-rabochaya-projects-OnlineMapActivity(Landroid/app/AlertDialog;[Landroid/widget/EditText;Lorg/rabochaya/projects/TileSource;Landroid/content/DialogInterface;)V
    .locals 1

    .line 25
    const/4 p4, -0x1

    invoke-virtual {p1, p4}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p4

    new-instance v0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda27;

    invoke-direct {v0, p0, p2, p3, p1}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda27;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;[Landroid/widget/EditText;Lorg/rabochaya/projects/TileSource;Landroid/app/AlertDialog;)V

    invoke-virtual {p4, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$show$0$org-rabochaya-projects-OnlineMapActivity(Landroid/widget/CheckBox;)V
    .locals 1

    .line 9
    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->network(Landroid/content/Context;)Z

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    return-void
.end method

.method synthetic lambda$show$1$org-rabochaya-projects-OnlineMapActivity(Landroid/widget/CheckBox;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 9
    iget-boolean p2, p0, Lorg/rabochaya/projects/OnlineMapActivity;->running:Z

    if-eqz p2, :cond_0

    new-instance p2, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda5;

    invoke-direct {p2, p0, p1}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda5;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;Landroid/widget/CheckBox;)V

    invoke-virtual {p1, p2}, Landroid/widget/CheckBox;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_0
    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "network"

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method synthetic lambda$show$10$org-rabochaya-projects-OnlineMapActivity()V
    .locals 0

    .line 13
    invoke-direct {p0}, Lorg/rabochaya/projects/OnlineMapActivity;->stats()V

    return-void
.end method

.method synthetic lambda$show$11$org-rabochaya-projects-OnlineMapActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 13
    invoke-direct {p0}, Lorg/rabochaya/projects/OnlineMapActivity;->clear()V

    return-void
.end method

.method synthetic lambda$show$12$org-rabochaya-projects-OnlineMapActivity(Lorg/rabochaya/projects/TileSource;)V
    .locals 3

    .line 13
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0432\u0441\u0435 \u0441\u043a\u0430\u0447\u0430\u043d\u043d\u044b\u0435 \u0438 \u043f\u0440\u043e\u0441\u043c\u043e\u0442\u0440\u0435\u043d\u043d\u044b\u0435 \u0442\u0430\u0439\u043b\u044b \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a\u0430 \u00ab"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object p1, p1, Lorg/rabochaya/projects/TileSource;->name:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, "\u00bb? \u041a\u0435\u0448 \u043e\u0431\u0449\u0438\u0445 \u0441\u043b\u043e\u0451\u0432 \u0431\u0443\u0434\u0435\u0442 \u0443\u0434\u0430\u043b\u0451\u043d \u0438 \u0434\u043b\u044f \u0434\u0440\u0443\u0433\u0438\u0445 \u043d\u0430\u0431\u043e\u0440\u043e\u0432. \u041f\u0440\u043e\u0435\u043a\u0442\u044b \u0438 \u0438\u043c\u043f\u043e\u0440\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u043d\u044b\u0435 MBTiles \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u0442\u0441\u044f."

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda3;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;)V

    const-string v1, "\u041e\u0447\u0438\u0441\u0442\u0438\u0442\u044c"

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method synthetic lambda$show$13$org-rabochaya-projects-OnlineMapActivity()V
    .locals 0

    .line 14
    invoke-virtual {p0}, Lorg/rabochaya/projects/OnlineMapActivity;->finish()V

    return-void
.end method

.method synthetic lambda$show$2$org-rabochaya-projects-OnlineMapActivity()V
    .locals 0

    .line 10
    invoke-direct {p0}, Lorg/rabochaya/projects/OnlineMapActivity;->catalog()V

    return-void
.end method

.method synthetic lambda$show$3$org-rabochaya-projects-OnlineMapActivity()V
    .locals 3

    .line 10
    invoke-static {}, Lorg/rabochaya/projects/TileSource;->osm()Lorg/rabochaya/projects/TileSource;

    move-result-object v0

    iget-wide v1, p0, Lorg/rabochaya/projects/OnlineMapActivity;->project:J

    invoke-static {p0, v0, v1, v2}, Lorg/rabochaya/projects/OnlineMapSettings;->save(Landroid/content/Context;Lorg/rabochaya/projects/TileSource;J)V

    const-string v0, "\u041f\u0440\u043e\u0441\u043c\u043e\u0442\u0440 \u0432\u043a\u043b\u044e\u0447\u0451\u043d. \u041f\u0440\u043e\u0441\u043c\u043e\u0442\u0440\u0435\u043d\u043d\u044b\u0435 \u0442\u0430\u0439\u043b\u044b \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u044e\u0442\u0441\u044f \u0430\u0432\u0442\u043e\u043c\u0430\u0442\u0438\u0447\u0435\u0441\u043a\u0438."

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/OnlineMapActivity;->show(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$show$4$org-rabochaya-projects-OnlineMapActivity()V
    .locals 0

    .line 10
    invoke-direct {p0}, Lorg/rabochaya/projects/OnlineMapActivity;->configure()V

    return-void
.end method

.method synthetic lambda$show$5$org-rabochaya-projects-OnlineMapActivity()V
    .locals 3

    .line 11
    iget-wide v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->project:J

    const/4 v2, 0x1

    invoke-static {p0, v0, v1, v2}, Lorg/rabochaya/projects/OnlineMapSettings;->use(Landroid/content/Context;JZ)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/OnlineMapActivity;->finish()V

    return-void
.end method

.method synthetic lambda$show$6$org-rabochaya-projects-OnlineMapActivity()V
    .locals 3

    .line 11
    iget-wide v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->project:J

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lorg/rabochaya/projects/OnlineMapSettings;->use(Landroid/content/Context;JZ)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/OnlineMapActivity;->finish()V

    return-void
.end method

.method synthetic lambda$show$7$org-rabochaya-projects-OnlineMapActivity()V
    .locals 1

    .line 12
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/OnlineMapActivity;->region(Z)V

    return-void
.end method

.method synthetic lambda$show$8$org-rabochaya-projects-OnlineMapActivity()V
    .locals 1

    .line 12
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/OnlineMapActivity;->region(Z)V

    return-void
.end method

.method synthetic lambda$show$9$org-rabochaya-projects-OnlineMapActivity()V
    .locals 2

    .line 13
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/rabochaya/projects/CacheExportActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/OnlineMapActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method synthetic lambda$stats$25$org-rabochaya-projects-OnlineMapActivity(Ljava/lang/String;)V
    .locals 1

    .line 31
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->running:Z

    iget-boolean v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->disposed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$stats$26$org-rabochaya-projects-OnlineMapActivity()V
    .locals 13

    .line 31
    const/4 v0, 0x3

    :try_start_0
    new-array v1, v0, [J

    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->source(Landroid/content/Context;)Lorg/rabochaya/projects/TileSource;

    move-result-object v2

    invoke-virtual {v2}, Lorg/rabochaya/projects/TileSource;->leafs()[Lorg/rabochaya/projects/TileSource;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v3, :cond_1

    aget-object v6, v2, v5

    new-instance v7, Lorg/rabochaya/projects/OnlineTiles;

    invoke-direct {v7, p0, v6}, Lorg/rabochaya/projects/OnlineTiles;-><init>(Landroid/content/Context;Lorg/rabochaya/projects/TileSource;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-virtual {v7}, Lorg/rabochaya/projects/OnlineTiles;->stats()[J

    move-result-object v6

    move v8, v4

    :goto_1
    if-ge v8, v0, :cond_0

    aget-wide v9, v1, v8

    aget-wide v11, v6, v8

    add-long/2addr v9, v11

    aput-wide v9, v1, v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_0
    :try_start_2
    invoke-virtual {v7}, Lorg/rabochaya/projects/OnlineTiles;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_3
    invoke-virtual {v7}, Lorg/rabochaya/projects/OnlineTiles;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v1

    :try_start_4
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_2
    throw v0

    :cond_1
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "\u041a\u0435\u0448: %d \u0442\u0430\u0439\u043b\u043e\u0432 \u00b7 %.2f \u041c\u0438\u0411 \u00b7 \u0434\u043b\u044f \u043e\u0431\u043b\u0430\u0441\u0442\u0435\u0439: %d"

    new-array v0, v0, [Ljava/lang/Object;

    aget-wide v5, v1, v4

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v0, v4

    const/4 v4, 0x1

    aget-wide v5, v1, v4

    long-to-double v5, v5

    const-wide/high16 v7, 0x4130000000000000L    # 1048576.0

    div-double/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    aput-object v5, v0, v4

    const/4 v4, 0x2

    aget-wide v5, v1, v4

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v0, v4

    invoke-static {v2, v3, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u0440\u043e\u0447\u0438\u0442\u0430\u0442\u044c \u043a\u0435\u0448: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_3
    new-instance v1, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, v0}, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda4;-><init>(Lorg/rabochaya/projects/OnlineMapActivity;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lorg/rabochaya/projects/OnlineMapActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 34
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 v0, 0x1195

    if-ne p1, v0, :cond_0

    const/4 p1, -0x1

    if-ne p2, p1, :cond_0

    const-string p1, "\u041a\u0430\u0440\u0442\u0430 \u0432\u044b\u0431\u0440\u0430\u043d\u0430. \u0414\u043b\u044f \u043e\u0442\u043a\u0440\u044b\u0442\u0438\u044f \u043d\u0430\u0436\u043c\u0438\u0442\u0435 \u00ab\u041f\u043e\u043a\u0430\u0437\u0430\u0442\u044c \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u0443\u044e \u043a\u0430\u0440\u0442\u0443\u00bb."

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/OnlineMapActivity;->show(Ljava/lang/String;)V

    if-eqz p3, :cond_0

    const-string p1, "catalog_action"

    const/4 p2, 0x0

    invoke-virtual {p3, p1, p2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const/4 p2, 0x2

    if-ne p1, p2, :cond_0

    new-instance p1, Landroid/content/Intent;

    const-class p2, Lorg/rabochaya/projects/CacheExportActivity;

    invoke-direct {p1, p0, p2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/OnlineMapActivity;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 36
    iget-boolean v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->running:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lorg/rabochaya/projects/OnlineMapActivity;->cancel()V

    goto :goto_0

    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 6
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/OnlineMapActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "project"

    const-wide/16 v1, -0x1

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->project:J

    const-string p1, ""

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/OnlineMapActivity;->show(Ljava/lang/String;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->disposed:Z

    invoke-direct {p0}, Lorg/rabochaya/projects/OnlineMapActivity;->cancel()V

    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->worker:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onStop()V
    .locals 1

    .line 37
    iget-boolean v0, p0, Lorg/rabochaya/projects/OnlineMapActivity;->running:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lorg/rabochaya/projects/OnlineMapActivity;->cancel()V

    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    return-void
.end method
