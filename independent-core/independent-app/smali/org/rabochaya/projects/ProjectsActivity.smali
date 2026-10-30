.class public final Lorg/rabochaya/projects/ProjectsActivity;
.super Landroid/app/Activity;
.source "ProjectsActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/ProjectsActivity$Task;
    }
.end annotation


# static fields
.field private static final EXPORT:I = 0x1006

.field private static final IMPORT:I = 0x1005


# instance fields
.field private resumedOnce:Z

.field private busy:Z

.field private content:Landroid/widget/LinearLayout;

.field private disposed:Z

.field private exportKmz:Z

.field private exportProjectId:J

.field private folderId:Ljava/lang/String;

.field private pendingRequest:I

.field private pendingResult:Landroid/content/Intent;

.field private project:Lorg/rabochaya/projects/KmlProject;

.field private projectId:J

.field private root:Landroid/widget/LinearLayout;

.field private store:Lorg/rabochaya/projects/ProjectStore;

.field private final worker:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 17
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 19
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->worker:Ljava/util/concurrent/ExecutorService;

    .line 22
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->projectId:J

    .line 23
    const-string v2, ""

    iput-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity;->folderId:Ljava/lang/String;

    .line 26
    iput-wide v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->exportProjectId:J

    return-void
.end method

.method static synthetic access$000(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/ProjectStore;
    .locals 0

    .line 17
    iget-object p0, p0, Lorg/rabochaya/projects/ProjectsActivity;->store:Lorg/rabochaya/projects/ProjectStore;

    return-object p0
.end method

.method static synthetic access$100(Lorg/rabochaya/projects/ProjectsActivity;)Z
    .locals 0

    .line 17
    iget-boolean p0, p0, Lorg/rabochaya/projects/ProjectsActivity;->busy:Z

    return p0
.end method

.method static synthetic access$1000(Lorg/rabochaya/projects/ProjectsActivity;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->flushPending()V

    return-void
.end method

.method static synthetic access$102(Lorg/rabochaya/projects/ProjectsActivity;Z)Z
    .locals 0

    .line 17
    iput-boolean p1, p0, Lorg/rabochaya/projects/ProjectsActivity;->busy:Z

    return p1
.end method

.method static synthetic access$1100(Lorg/rabochaya/projects/ProjectsActivity;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->showFolder()V

    return-void
.end method

.method static synthetic access$1200(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/String;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ProjectsActivity;->frame(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1300(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/String;I)Landroid/widget/TextView;
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/ProjectsActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1400(Lorg/rabochaya/projects/ProjectsActivity;)Landroid/widget/LinearLayout;
    .locals 0

    .line 17
    iget-object p0, p0, Lorg/rabochaya/projects/ProjectsActivity;->content:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method static synthetic access$1500(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/Runnable;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ProjectsActivity;->ui(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$1600(Lorg/rabochaya/projects/ProjectsActivity;)Z
    .locals 0

    .line 17
    iget-boolean p0, p0, Lorg/rabochaya/projects/ProjectsActivity;->disposed:Z

    return p0
.end method

.method static synthetic access$1700(Lorg/rabochaya/projects/ProjectsActivity;JLjava/lang/String;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lorg/rabochaya/projects/ProjectsActivity;->open(JLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$1800(Lorg/rabochaya/projects/ProjectsActivity;JLjava/lang/String;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lorg/rabochaya/projects/ProjectsActivity;->confirmDelete(JLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$1900(Lorg/rabochaya/projects/ProjectsActivity;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->up()V

    return-void
.end method

.method static synthetic access$200(Lorg/rabochaya/projects/ProjectsActivity;)J
    .locals 2

    .line 17
    iget-wide v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->projectId:J

    return-wide v0
.end method

.method static synthetic access$2000(Lorg/rabochaya/projects/ProjectsActivity;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->newFolder()V

    return-void
.end method

.method static synthetic access$202(Lorg/rabochaya/projects/ProjectsActivity;J)J
    .locals 0

    .line 17
    iput-wide p1, p0, Lorg/rabochaya/projects/ProjectsActivity;->projectId:J

    return-wide p1
.end method

.method static synthetic access$2100(Lorg/rabochaya/projects/ProjectsActivity;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->more()V

    return-void
.end method

.method static synthetic access$2200(Lorg/rabochaya/projects/ProjectsActivity;Lorg/rabochaya/projects/ProjectsActivity$Task;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ProjectsActivity;->change(Lorg/rabochaya/projects/ProjectsActivity$Task;)V

    return-void
.end method

.method static synthetic access$2300(Lorg/rabochaya/projects/ProjectsActivity;Lorg/w3c/dom/Element;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ProjectsActivity;->details(Lorg/w3c/dom/Element;)V

    return-void
.end method

.method static synthetic access$2400(Lorg/rabochaya/projects/ProjectsActivity;Lorg/w3c/dom/Element;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ProjectsActivity;->nodeMenu(Lorg/w3c/dom/Element;)V

    return-void
.end method

.method static synthetic access$2500(Lorg/rabochaya/projects/ProjectsActivity;)Landroid/widget/LinearLayout;
    .locals 0

    .line 17
    iget-object p0, p0, Lorg/rabochaya/projects/ProjectsActivity;->root:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method static synthetic access$2600(Lorg/rabochaya/projects/ProjectsActivity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lorg/rabochaya/projects/ProjectsActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2700(Lorg/rabochaya/projects/ProjectsActivity;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->assets()V

    return-void
.end method

.method static synthetic access$2800(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/String;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ProjectsActivity;->previewAsset(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2900(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/w3c/dom/Element;
    .locals 0

    .line 17
    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->folder()Lorg/w3c/dom/Element;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$3000(Lorg/rabochaya/projects/ProjectsActivity;Lorg/w3c/dom/Element;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ProjectsActivity;->rename(Lorg/w3c/dom/Element;)V

    return-void
.end method

.method static synthetic access$302(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 17
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity;->folderId:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$3100(Lorg/w3c/dom/Element;)V
    .locals 0

    .line 17
    invoke-static {p0}, Lorg/rabochaya/projects/ProjectsActivity;->freshIds(Lorg/w3c/dom/Element;)V

    return-void
.end method

.method static synthetic access$3200(Lorg/rabochaya/projects/ProjectsActivity;Lorg/w3c/dom/Element;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ProjectsActivity;->move(Lorg/w3c/dom/Element;)V

    return-void
.end method

.method static synthetic access$3300(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/String;Lorg/rabochaya/projects/ProjectsActivity$Task;)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/ProjectsActivity;->task(Ljava/lang/String;Lorg/rabochaya/projects/ProjectsActivity$Task;)V

    return-void
.end method

.method static synthetic access$400(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/KmlProject;
    .locals 0

    .line 17
    iget-object p0, p0, Lorg/rabochaya/projects/ProjectsActivity;->project:Lorg/rabochaya/projects/KmlProject;

    return-object p0
.end method

.method static synthetic access$402(Lorg/rabochaya/projects/ProjectsActivity;Lorg/rabochaya/projects/KmlProject;)Lorg/rabochaya/projects/KmlProject;
    .locals 0

    .line 17
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity;->project:Lorg/rabochaya/projects/KmlProject;

    return-object p1
.end method

.method static synthetic access$500(Lorg/rabochaya/projects/ProjectsActivity;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->remember()V

    return-void
.end method

.method static synthetic access$600(Lorg/rabochaya/projects/ProjectsActivity;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->home()V

    return-void
.end method

.method static synthetic access$700(Lorg/rabochaya/projects/ProjectsActivity;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->pickImport()V

    return-void
.end method

.method static synthetic access$800(Lorg/rabochaya/projects/ProjectsActivity;Z)V
    .locals 0

    .line 17
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ProjectsActivity;->pickExport(Z)V

    return-void
.end method

.method static synthetic access$900(Lorg/rabochaya/projects/ProjectsActivity;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->diagram()V

    return-void
.end method

.method private assets()V
    .locals 4

    .line 134
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->project:Lorg/rabochaya/projects/KmlProject;

    iget-object v0, v0, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u0412\u043b\u043e\u0436\u0435\u043d\u0438\u044f: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/ProjectsActivity$23;

    invoke-direct {v2, p0, v0}, Lorg/rabochaya/projects/ProjectsActivity$23;-><init>(Lorg/rabochaya/projects/ProjectsActivity;[Ljava/lang/String;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .locals 5

    .line 44
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 p2, 0x41500000    # 13.0f

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setTextSize(F)V

    const/4 p2, -0x1

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setTextColor(I)V

    const/4 p2, 0x0

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setAllCaps(Z)V

    const/16 v1, 0x30

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->dp(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 45
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v2, -0xc8bcd7

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/4 v2, 0x7

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/ProjectsActivity;->dp(I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 46
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v2, 0x34

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/ProjectsActivity;->dp(I)I

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v1, p2, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/4 p2, 0x2

    invoke-direct {p0, p2}, Lorg/rabochaya/projects/ProjectsActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, p2}, Lorg/rabochaya/projects/ProjectsActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, p2}, Lorg/rabochaya/projects/ProjectsActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, p2}, Lorg/rabochaya/projects/ProjectsActivity;->dp(I)I

    move-result p2

    invoke-virtual {v1, v2, v3, v4, p2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    new-instance p1, Lorg/rabochaya/projects/ProjectsActivity$2;

    invoke-direct {p1, p0, p3}, Lorg/rabochaya/projects/ProjectsActivity$2;-><init>(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method private change(Lorg/rabochaya/projects/ProjectsActivity$Task;)V
    .locals 7

    .line 100
    iget-wide v3, p0, Lorg/rabochaya/projects/ProjectsActivity;->projectId:J

    iget-object v5, p0, Lorg/rabochaya/projects/ProjectsActivity;->folderId:Ljava/lang/String;

    .line 101
    new-instance v6, Lorg/rabochaya/projects/ProjectsActivity$18;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/ProjectsActivity$18;-><init>(Lorg/rabochaya/projects/ProjectsActivity;Lorg/rabochaya/projects/ProjectsActivity$Task;JLjava/lang/String;)V

    const-string p1, "\u0421\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u0438\u0435 \u043d\u0430 \u0443\u0441\u0442\u0440\u043e\u0439\u0441\u0442\u0432\u0435\u2026"

    invoke-direct {p0, p1, v6}, Lorg/rabochaya/projects/ProjectsActivity;->task(Ljava/lang/String;Lorg/rabochaya/projects/ProjectsActivity$Task;)V

    .line 105
    return-void
.end method

.method private confirmDelete(JLjava/lang/String;)V
    .locals 1

    .line 146
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p3

    const-string v0, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 \u043f\u0440\u043e\u0435\u043a\u0442? \u0418\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u0438\u043c\u043f\u043e\u0440\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u043d\u044b\u0439 \u0444\u0430\u0439\u043b \u043e\u0441\u0442\u0430\u043d\u0435\u0442\u0441\u044f \u0431\u0435\u0437 \u0438\u0437\u043c\u0435\u043d\u0435\u043d\u0438\u0439."

    invoke-virtual {p3, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p3

    new-instance v0, Lorg/rabochaya/projects/ProjectsActivity$29;

    invoke-direct {v0, p0, p1, p2}, Lorg/rabochaya/projects/ProjectsActivity$29;-><init>(Lorg/rabochaya/projects/ProjectsActivity;J)V

    const-string p1, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c"

    invoke-virtual {p3, p1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private details(Lorg/w3c/dom/Element;)V
    .locals 9

    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "description"

    invoke-static {p1, v1}, Lorg/rabochaya/projects/KmlProject;->text(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    :cond_0
    const/4 v1, 0x1

    :try_start_0
    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity;->project:Lorg/rabochaya/projects/KmlProject;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/rabochaya/projects/KmlProject;->features(Z)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/KmlProject$Feature;

    iget-object v5, v4, Lorg/rabochaya/projects/KmlProject$Feature;->element:Lorg/w3c/dom/Element;

    if-ne v5, p1, :cond_1

    iget-object v4, v4, Lorg/rabochaya/projects/KmlProject$Feature;->shapes:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/rabochaya/projects/KmlProject$Geometry;

    iget-object v6, v5, Lorg/rabochaya/projects/KmlProject$Geometry;->rings:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move v7, v3

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/2addr v7, v8

    goto :goto_1

    :cond_3
    iget-object v6, v5, Lorg/rabochaya/projects/KmlProject$Geometry;->type:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, ": "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "Point"

    iget-object v7, v5, Lorg/rabochaya/projects/KmlProject$Geometry;->type:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    iget-object v5, v5, Lorg/rabochaya/projects/KmlProject$Geometry;->rings:Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [D

    const-string v6, "\u0428\u0438\u0440\u043e\u0442\u0430: "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-wide v7, v5, v1

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n\u0414\u043e\u043b\u0433\u043e\u0442\u0430: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-wide v7, v5, v3

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n\u0412\u044b\u0441\u043e\u0442\u0430: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v7, 0x2

    aget-wide v7, v5, v7

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " \u043c\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-nez v2, :cond_5

    const-string v2, "\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435 \u043e\u0442\u0441\u0443\u0442\u0441\u0442\u0432\u0443\u0435\u0442"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x10

    invoke-direct {p0, v0, v2}, Lorg/rabochaya/projects/ProjectsActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 111
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-static {p1}, Lorg/rabochaya/projects/KmlProject;->name(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 112
    return-void
.end method

.method private diagram()V
    .locals 2
    iget-wide v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->projectId:J
    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/LocalMapActivity;->open(Landroid/app/Activity;J)V
    return-void
.end method

.method private dp(I)I
    .locals 1

    .line 41
    int-to-float p1, p1

    invoke-virtual {p0}, Lorg/rabochaya/projects/ProjectsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method private flushPending()V
    .locals 4

    .line 56
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->pendingResult:Landroid/content/Intent;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->busy:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->pendingResult:Landroid/content/Intent;

    iget v1, p0, Lorg/rabochaya/projects/ProjectsActivity;->pendingRequest:I

    const/4 v2, 0x0

    iput-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity;->pendingResult:Landroid/content/Intent;

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity;->root:Landroid/widget/LinearLayout;

    new-instance v3, Lorg/rabochaya/projects/ProjectsActivity$7;

    invoke-direct {v3, p0, v1, v0}, Lorg/rabochaya/projects/ProjectsActivity$7;-><init>(Lorg/rabochaya/projects/ProjectsActivity;ILandroid/content/Intent;)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method private folder()Lorg/w3c/dom/Element;
    .locals 2

    .line 85
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->project:Lorg/rabochaya/projects/KmlProject;

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity;->folderId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/KmlProject;->byId(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {v0}, Lorg/rabochaya/projects/KmlProject;->isContainer(Lorg/w3c/dom/Element;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->project:Lorg/rabochaya/projects/KmlProject;

    invoke-virtual {v0}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method private frame(Ljava/lang/String;)V
    .locals 5

    .line 50
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->root:Landroid/widget/LinearLayout;

    const/16 v1, 0x13

    invoke-direct {p0, p1, v1}, Lorg/rabochaya/projects/ProjectsActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 51
    new-instance v0, Lorg/rabochaya/projects/ProjectsActivity$3;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ProjectsActivity$3;-><init>(Lorg/rabochaya/projects/ProjectsActivity;)V

    const-string v1, "\u041f\u0440\u043e\u0435\u043a\u0442\u044b"

    invoke-direct {p0, p1, v1, v0}, Lorg/rabochaya/projects/ProjectsActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 52
    new-instance v0, Lorg/rabochaya/projects/ProjectsActivity$4;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ProjectsActivity$4;-><init>(Lorg/rabochaya/projects/ProjectsActivity;)V

    const-string v1, "\u0418\u043c\u043f\u043e\u0440\u0442"

    invoke-direct {p0, p1, v1, v0}, Lorg/rabochaya/projects/ProjectsActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 53
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->project:Lorg/rabochaya/projects/KmlProject;

    if-eqz v0, :cond_0

    new-instance v0, Lorg/rabochaya/projects/ProjectsActivity$5;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ProjectsActivity$5;-><init>(Lorg/rabochaya/projects/ProjectsActivity;)V

    const-string v1, "KMZ"

    invoke-direct {p0, p1, v1, v0}, Lorg/rabochaya/projects/ProjectsActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    new-instance v0, Lorg/rabochaya/projects/ProjectsActivity$6;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ProjectsActivity$6;-><init>(Lorg/rabochaya/projects/ProjectsActivity;)V

    const-string v1, "Карта"

    invoke-direct {p0, p1, v1, v0}, Lorg/rabochaya/projects/ProjectsActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 54
    :cond_0
    new-instance p1, Landroid/widget/ScrollView;

    invoke-direct {p1, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->content:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->content:Landroid/widget/LinearLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->root:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, -0x1

    invoke-direct {v1, v4, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 55
    return-void
.end method

.method private static freshIds(Lorg/w3c/dom/Element;)V
    .locals 7

    .line 141
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v1, "*"

    invoke-interface {p0, v1}, Lorg/w3c/dom/Element;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object p0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    if-ge v1, v2, :cond_0

    invoke-interface {p0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    check-cast v2, Lorg/w3c/dom/Element;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 142
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/w3c/dom/Element;

    const-string v3, "id"

    invoke-interface {v2, v3}, Lorg/w3c/dom/Element;->hasAttribute(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2, v3}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "rk_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v2, v3, v5}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 143
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    const-string v2, "styleUrl"

    invoke-static {v1}, Lorg/rabochaya/projects/KmlProject;->tag(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    const-string v3, "#"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {p0, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    goto :goto_2

    .line 144
    :cond_4
    return-void
.end method

.method private home()V
    .locals 2

    .line 64
    new-instance v0, Lorg/rabochaya/projects/ProjectsActivity$10;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ProjectsActivity$10;-><init>(Lorg/rabochaya/projects/ProjectsActivity;)V

    const-string v1, "\u041b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0435 \u043f\u0440\u043e\u0435\u043a\u0442\u044b"

    invoke-direct {p0, v1, v0}, Lorg/rabochaya/projects/ProjectsActivity;->task(Ljava/lang/String;Lorg/rabochaya/projects/ProjectsActivity$Task;)V

    .line 81
    return-void
.end method

.method private importUri(Landroid/net/Uri;)V
    .locals 2

    .line 121
    const-string v0, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "content"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "\u0420\u0430\u0437\u0440\u0435\u0448\u0435\u043d\u044b \u0442\u043e\u043b\u044c\u043a\u043e \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0435 \u0444\u0430\u0439\u043b\u044b"

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->home()V

    return-void

    .line 122
    :cond_0
    new-instance v0, Lorg/rabochaya/projects/ProjectsActivity$20;

    invoke-direct {v0, p0, p1}, Lorg/rabochaya/projects/ProjectsActivity$20;-><init>(Lorg/rabochaya/projects/ProjectsActivity;Landroid/net/Uri;)V

    const-string p1, "\u0418\u043c\u043f\u043e\u0440\u0442 \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u043e\u0433\u043e \u043f\u0440\u043e\u0435\u043a\u0442\u0430\u2026"

    invoke-direct {p0, p1, v0}, Lorg/rabochaya/projects/ProjectsActivity;->task(Ljava/lang/String;Lorg/rabochaya/projects/ProjectsActivity$Task;)V

    .line 130
    return-void
.end method

.method private input(Ljava/lang/String;)Landroid/widget/EditText;
    .locals 1

    .line 136
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, -0x1

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setTextColor(I)V

    const p1, -0xd4cadf

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setBackgroundColor(I)V

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setSingleLine(Z)V

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setSelectAllOnFocus(Z)V

    return-object v0
.end method

.method private more()V
    .locals 4

    .line 133
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u041f\u0440\u043e\u0435\u043a\u0442"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u042d\u043a\u0441\u043f\u043e\u0440\u0442 KML (\u0431\u0435\u0437 \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u0439)"

    const-string v2, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u043f\u0440\u043e\u0435\u043a\u0442"

    const-string v3, "\u0412\u043b\u043e\u0436\u0435\u043d\u0438\u044f KMZ"

    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/ProjectsActivity$22;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/ProjectsActivity$22;-><init>(Lorg/rabochaya/projects/ProjectsActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private move(Lorg/w3c/dom/Element;)V
    .locals 7

    .line 145
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity;->project:Lorg/rabochaya/projects/KmlProject;

    iget-object v1, v1, Lorg/rabochaya/projects/KmlProject;->document:Lorg/w3c/dom/Document;

    const-string v2, "*"

    invoke-interface {v1, v2}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-ge v3, v4, :cond_4

    invoke-interface {v1, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    check-cast v4, Lorg/w3c/dom/Element;

    invoke-static {v4}, Lorg/rabochaya/projects/KmlProject;->isContainer(Lorg/w3c/dom/Element;)Z

    move-result v5

    if-nez v5, :cond_1

    :cond_0
    goto :goto_2

    :cond_1
    move v6, v2

    move-object v5, v4

    :goto_1
    if-eqz v5, :cond_3

    if-ne v5, p1, :cond_2

    const/4 v6, 0x1

    :cond_2
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v5

    goto :goto_1

    :cond_3
    if-nez v6, :cond_0

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v3, v1, [Ljava/lang/String;

    :goto_3
    if-ge v2, v1, :cond_5

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/w3c/dom/Element;

    invoke-static {v4}, Lorg/rabochaya/projects/KmlProject;->name(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_5
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "\u041f\u0435\u0440\u0435\u043c\u0435\u0441\u0442\u0438\u0442\u044c"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/ProjectsActivity$28;

    invoke-direct {v2, p0, v0, p1}, Lorg/rabochaya/projects/ProjectsActivity$28;-><init>(Lorg/rabochaya/projects/ProjectsActivity;Ljava/util/List;Lorg/w3c/dom/Element;)V

    invoke-virtual {v1, v3, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private newFolder()V
    .locals 3

    .line 137
    const-string v0, "\u041d\u043e\u0432\u0430\u044f \u0433\u0440\u0443\u043f\u043f\u0430"

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ProjectsActivity;->input(Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v0

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "\u0421\u043e\u0437\u0434\u0430\u0442\u044c \u0433\u0440\u0443\u043f\u043f\u0443"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/ProjectsActivity$25;

    invoke-direct {v2, p0, v0}, Lorg/rabochaya/projects/ProjectsActivity$25;-><init>(Lorg/rabochaya/projects/ProjectsActivity;Landroid/widget/EditText;)V

    const-string v0, "\u0421\u043e\u0437\u0434\u0430\u0442\u044c"

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private nodeMenu(Lorg/w3c/dom/Element;)V
    .locals 5

    .line 138
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-static {p1}, Lorg/rabochaya/projects/KmlProject;->name(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041f\u0435\u0440\u0435\u043c\u0435\u0441\u0442\u0438\u0442\u044c \u0432 \u0433\u0440\u0443\u043f\u043f\u0443"

    const-string v2, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c"

    const-string v3, "\u041f\u0435\u0440\u0435\u0438\u043c\u0435\u043d\u043e\u0432\u0430\u0442\u044c"

    const-string v4, "\u041a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u0440\u044f\u0434\u043e\u043c"

    filled-new-array {v3, v4, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/ProjectsActivity$26;

    invoke-direct {v2, p0, p1}, Lorg/rabochaya/projects/ProjectsActivity$26;-><init>(Lorg/rabochaya/projects/ProjectsActivity;Lorg/w3c/dom/Element;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private open(JLjava/lang/String;)V
    .locals 1

    .line 83
    new-instance v0, Lorg/rabochaya/projects/ProjectsActivity$11;

    invoke-direct {v0, p0, p1, p2, p3}, Lorg/rabochaya/projects/ProjectsActivity$11;-><init>(Lorg/rabochaya/projects/ProjectsActivity;JLjava/lang/String;)V

    const-string p1, "\u041e\u0442\u043a\u0440\u044b\u0442\u0438\u0435 \u043f\u0440\u043e\u0435\u043a\u0442\u0430\u2026"

    invoke-direct {p0, p1, v0}, Lorg/rabochaya/projects/ProjectsActivity;->task(Ljava/lang/String;Lorg/rabochaya/projects/ProjectsActivity$Task;)V

    .line 84
    return-void
.end method

.method private pickExport(Z)V
    .locals 2

    .line 131
    iput-boolean p1, p0, Lorg/rabochaya/projects/ProjectsActivity;->exportKmz:Z

    iget-wide v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->projectId:J

    iput-wide v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->exportProjectId:J

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    if-eqz p1, :cond_0

    const-string v1, "application/vnd.google-earth.kmz"

    goto :goto_0

    :cond_0
    const-string v1, "application/vnd.google-earth.kml+xml"

    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    if-eqz p1, :cond_1

    const-string p1, "project.kmz"

    goto :goto_1

    :cond_1
    const-string p1, "project.kml"

    :goto_1
    const-string v1, "android.intent.extra.TITLE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "android.intent.extra.LOCAL_ONLY"

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/16 p1, 0x1006

    invoke-virtual {p0, v0, p1}, Lorg/rabochaya/projects/ProjectsActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private pickImport()V
    .locals 5

    .line 119
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "*/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.LOCAL_ONLY"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v1, "application/xml"

    const-string v2, "application/octet-stream"

    const-string v3, "application/vnd.google-earth.kml+xml"

    const-string v4, "application/vnd.google-earth.kmz"

    filled-new-array {v3, v4, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.intent.extra.MIME_TYPES"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    const/16 v1, 0x1005

    invoke-virtual {p0, v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private previewAsset(Ljava/lang/String;)V
    .locals 2

    .line 135
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->project:Lorg/rabochaya/projects/KmlProject;

    iget-object v0, v0, Lorg/rabochaya/projects/KmlProject;->assets:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    new-instance v1, Lorg/rabochaya/projects/ProjectsActivity$24;

    invoke-direct {v1, p0, v0, p1}, Lorg/rabochaya/projects/ProjectsActivity$24;-><init>(Lorg/rabochaya/projects/ProjectsActivity;[BLjava/lang/String;)V

    const-string p1, "\u041e\u0442\u043a\u0440\u044b\u0442\u0438\u0435 \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u043e\u0433\u043e \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u044f\u2026"

    invoke-direct {p0, p1, v1}, Lorg/rabochaya/projects/ProjectsActivity;->task(Ljava/lang/String;Lorg/rabochaya/projects/ProjectsActivity$Task;)V

    return-void
.end method

.method private remember()V
    .locals 4

    .line 57
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/ProjectsActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "project"

    iget-wide v2, p0, Lorg/rabochaya/projects/ProjectsActivity;->projectId:J

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "folder"

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity;->folderId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method private rename(Lorg/w3c/dom/Element;)V
    .locals 3

    .line 139
    invoke-static {p1}, Lorg/rabochaya/projects/KmlProject;->name(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ProjectsActivity;->input(Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v0

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "\u041f\u0435\u0440\u0435\u0438\u043c\u0435\u043d\u043e\u0432\u0430\u0442\u044c"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/ProjectsActivity$27;

    invoke-direct {v2, p0, v0, p1}, Lorg/rabochaya/projects/ProjectsActivity$27;-><init>(Lorg/rabochaya/projects/ProjectsActivity;Landroid/widget/EditText;Lorg/w3c/dom/Element;)V

    const-string p1, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c"

    invoke-virtual {v1, p1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private showFolder()V
    .locals 9

    .line 87
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->project:Lorg/rabochaya/projects/KmlProject;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->home()V

    return-void

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->busy:Z

    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->flushPending()V

    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->folder()Lorg/w3c/dom/Element;

    move-result-object v1

    const-string v2, "id"

    invoke-interface {v1, v2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity;->folderId:Ljava/lang/String;

    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->remember()V

    .line 88
    invoke-static {v1}, Lorg/rabochaya/projects/KmlProject;->name(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/ProjectsActivity;->frame(Ljava/lang/String;)V

    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Lorg/rabochaya/projects/ProjectsActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 89
    new-instance v3, Lorg/rabochaya/projects/ProjectsActivity$12;

    invoke-direct {v3, p0}, Lorg/rabochaya/projects/ProjectsActivity$12;-><init>(Lorg/rabochaya/projects/ProjectsActivity;)V

    const-string v4, "\u2191 \u041d\u0430\u0437\u0430\u0434"

    invoke-direct {p0, v2, v4, v3}, Lorg/rabochaya/projects/ProjectsActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    new-instance v3, Lorg/rabochaya/projects/ProjectsActivity$13;

    invoke-direct {v3, p0}, Lorg/rabochaya/projects/ProjectsActivity$13;-><init>(Lorg/rabochaya/projects/ProjectsActivity;)V

    const-string v4, "+ \u0413\u0440\u0443\u043f\u043f\u0430"

    invoke-direct {p0, v2, v4, v3}, Lorg/rabochaya/projects/ProjectsActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    new-instance v3, Lorg/rabochaya/projects/ProjectsActivity$14;

    invoke-direct {v3, p0}, Lorg/rabochaya/projects/ProjectsActivity$14;-><init>(Lorg/rabochaya/projects/ProjectsActivity;)V

    const-string v4, "\u0415\u0449\u0451"

    invoke-direct {p0, v2, v4, v3}, Lorg/rabochaya/projects/ProjectsActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 90
    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity;->project:Lorg/rabochaya/projects/KmlProject;

    invoke-virtual {v2, v1}, Lorg/rabochaya/projects/KmlProject;->children(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity;->content:Landroid/widget/LinearLayout;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u041e\u0431\u044a\u0435\u043a\u0442\u043e\u0432 \u0438 \u0433\u0440\u0443\u043f\u043f: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0xe

    invoke-direct {p0, v3, v4}, Lorg/rabochaya/projects/ProjectsActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 91
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/w3c/dom/Element;

    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v4, 0x10

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v4, p0, Lorg/rabochaya/projects/ProjectsActivity;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 92
    new-instance v4, Landroid/widget/CheckBox;

    invoke-direct {v4, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u0412\u0438\u0434\u0438\u043c\u043e\u0441\u0442\u044c: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v2}, Lorg/rabochaya/projects/KmlProject;->name(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v5, p0, Lorg/rabochaya/projects/ProjectsActivity;->project:Lorg/rabochaya/projects/KmlProject;

    invoke-virtual {v5, v2}, Lorg/rabochaya/projects/KmlProject;->visible(Lorg/w3c/dom/Element;)Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v6, 0x30

    invoke-direct {p0, v6}, Lorg/rabochaya/projects/ProjectsActivity;->dp(I)I

    move-result v6

    const/16 v7, 0x3c

    invoke-direct {p0, v7}, Lorg/rabochaya/projects/ProjectsActivity;->dp(I)I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 93
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v2}, Lorg/rabochaya/projects/KmlProject;->isContainer(Lorg/w3c/dom/Element;)Z

    move-result v6

    if-eqz v6, :cond_1

    const-string v6, "\u25a3  "

    goto :goto_1

    :cond_1
    const-string v6, "\u25cf  "

    :goto_1
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v2}, Lorg/rabochaya/projects/KmlProject;->name(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x11

    invoke-direct {p0, v5, v6}, Lorg/rabochaya/projects/ProjectsActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v5

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v6, v0, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/16 v3, 0x38

    invoke-direct {p0, v3}, Lorg/rabochaya/projects/ProjectsActivity;->dp(I)I

    move-result v3

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setMinHeight(I)V

    .line 94
    new-instance v3, Lorg/rabochaya/projects/ProjectsActivity$15;

    invoke-direct {v3, p0, v2}, Lorg/rabochaya/projects/ProjectsActivity$15;-><init>(Lorg/rabochaya/projects/ProjectsActivity;Lorg/w3c/dom/Element;)V

    invoke-virtual {v4, v3}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 95
    new-instance v3, Lorg/rabochaya/projects/ProjectsActivity$16;

    invoke-direct {v3, p0, v2}, Lorg/rabochaya/projects/ProjectsActivity$16;-><init>(Lorg/rabochaya/projects/ProjectsActivity;Lorg/w3c/dom/Element;)V

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    new-instance v3, Lorg/rabochaya/projects/ProjectsActivity$17;

    invoke-direct {v3, p0, v2}, Lorg/rabochaya/projects/ProjectsActivity$17;-><init>(Lorg/rabochaya/projects/ProjectsActivity;Lorg/w3c/dom/Element;)V

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 97
    goto/16 :goto_0

    .line 98
    :cond_2
    return-void
.end method

.method private task(Ljava/lang/String;Lorg/rabochaya/projects/ProjectsActivity$Task;)V
    .locals 2

    .line 59
    iget-boolean v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->busy:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->busy:Z

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->root:Landroid/widget/LinearLayout;

    const/16 v1, 0x12

    invoke-direct {p0, p1, v1}, Lorg/rabochaya/projects/ProjectsActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity;->root:Landroid/widget/LinearLayout;

    new-instance v0, Landroid/widget/ProgressBar;

    invoke-direct {v0, p0}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 60
    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lorg/rabochaya/projects/ProjectsActivity$8;

    invoke-direct {v0, p0, p2}, Lorg/rabochaya/projects/ProjectsActivity$8;-><init>(Lorg/rabochaya/projects/ProjectsActivity;Lorg/rabochaya/projects/ProjectsActivity$Task;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 61
    return-void
.end method

.method private text(Ljava/lang/String;I)Landroid/widget/TextView;
    .locals 3

    .line 42
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, -0x1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    int-to-float p1, p2

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 p1, 0xc

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ProjectsActivity;->dp(I)I

    move-result p2

    const/16 v1, 0xa

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ProjectsActivity;->dp(I)I

    move-result p1

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->dp(I)I

    move-result v1

    invoke-virtual {v0, p2, v2, p1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object v0
.end method

.method private ui(Ljava/lang/Runnable;)V
    .locals 1

    .line 62
    new-instance v0, Lorg/rabochaya/projects/ProjectsActivity$9;

    invoke-direct {v0, p0, p1}, Lorg/rabochaya/projects/ProjectsActivity$9;-><init>(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/Runnable;)V

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/ProjectsActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private up()V
    .locals 3

    .line 117
    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->folder()Lorg/w3c/dom/Element;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity;->project:Lorg/rabochaya/projects/KmlProject;

    invoke-virtual {v2}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object v2

    if-eq v0, v2, :cond_0

    instance-of v0, v1, Lorg/w3c/dom/Element;

    if-eqz v0, :cond_0

    check-cast v1, Lorg/w3c/dom/Element;

    const-string v0, "id"

    invoke-interface {v1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->folderId:Ljava/lang/String;

    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->showFolder()V

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->projectId:J

    const-string v0, ""

    iput-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->folderId:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->project:Lorg/rabochaya/projects/KmlProject;

    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->remember()V

    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->home()V

    :goto_0
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6

    .line 132
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const/4 v0, -0x1

    if-ne p2, v0, :cond_4

    if-eqz p3, :cond_4

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    iget-boolean p2, p0, Lorg/rabochaya/projects/ProjectsActivity;->busy:Z

    if-eqz p2, :cond_1

    new-instance p2, Landroid/content/Intent;

    invoke-direct {p2, p3}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity;->pendingResult:Landroid/content/Intent;

    iput p1, p0, Lorg/rabochaya/projects/ProjectsActivity;->pendingRequest:I

    return-void

    :cond_1
    const/16 p2, 0x1005

    if-ne p1, p2, :cond_2

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ProjectsActivity;->importUri(Landroid/net/Uri;)V

    return-void

    :cond_2
    const/16 p2, 0x1006

    if-ne p1, p2, :cond_4

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v4

    const-string p1, "file"

    invoke-virtual {v4}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    const-string p1, "content"

    invoke-virtual {v4}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    const-string p1, "\u0420\u0430\u0437\u0440\u0435\u0448\u0435\u043d\u044b \u0442\u043e\u043b\u044c\u043a\u043e \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0435 \u0444\u0430\u0439\u043b\u044b"

    const/4 p2, 0x1

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void

    :cond_3
    iget-wide v2, p0, Lorg/rabochaya/projects/ProjectsActivity;->exportProjectId:J

    iget-boolean v5, p0, Lorg/rabochaya/projects/ProjectsActivity;->exportKmz:Z

    new-instance p1, Lorg/rabochaya/projects/ProjectsActivity$21;

    move-object v0, p1

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/ProjectsActivity$21;-><init>(Lorg/rabochaya/projects/ProjectsActivity;JLandroid/net/Uri;Z)V

    const-string p2, "\u042d\u043a\u0441\u043f\u043e\u0440\u0442 \u0432 \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0439 \u0444\u0430\u0439\u043b\u2026"

    invoke-direct {p0, p2, p1}, Lorg/rabochaya/projects/ProjectsActivity;->task(Ljava/lang/String;Lorg/rabochaya/projects/ProjectsActivity$Task;)V

    :cond_4
    :goto_0
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 118
    iget-boolean v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->busy:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->project:Lorg/rabochaya/projects/KmlProject;

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->up()V

    goto :goto_0

    :cond_1
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7

    .line 32
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    new-instance v0, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->store:Lorg/rabochaya/projects/ProjectStore;

    invoke-virtual {p0}, Lorg/rabochaya/projects/ProjectsActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const v1, -0xe3dae8

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/ProjectsActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 33
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->root:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->root:Landroid/widget/LinearLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->root:Landroid/widget/LinearLayout;

    const v1, -0xdcd2e3

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/ProjectsActivity;->setContentView(Landroid/view/View;)V

    .line 34
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/ProjectsActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "project"

    const-wide/16 v3, -0x1

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    iput-wide v5, p0, Lorg/rabochaya/projects/ProjectsActivity;->projectId:J

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/ProjectsActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, ""

    const-string v5, "folder"

    invoke-interface {v0, v5, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->folderId:Ljava/lang/String;

    .line 35
    if-eqz p1, :cond_0

    iget-wide v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->projectId:J

    invoke-virtual {p1, v2, v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->projectId:J

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->folderId:Ljava/lang/String;

    invoke-virtual {p1, v5, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->folderId:Ljava/lang/String;

    const-string v0, "exportKmz"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->exportKmz:Z

    const-string v0, "exportProjectId"

    invoke-virtual {p1, v0, v3, v4}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->exportProjectId:J

    .line 36
    :cond_0
    invoke-virtual {p0}, Lorg/rabochaya/projects/ProjectsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_1

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lorg/rabochaya/projects/ProjectsActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ProjectsActivity;->importUri(Landroid/net/Uri;)V

    goto :goto_0

    .line 37
    :cond_1
    iget-wide v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->projectId:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-ltz p1, :cond_2

    iget-wide v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->projectId:J

    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity;->folderId:Ljava/lang/String;

    invoke-direct {p0, v0, v1, p1}, Lorg/rabochaya/projects/ProjectsActivity;->open(JLjava/lang/String;)V

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->home()V

    .line 38
    :goto_0
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .line 40
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->disposed:Z

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/rabochaya/projects/ProjectsActivity$1;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/ProjectsActivity$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->worker:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3

    .line 39
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "project"

    iget-wide v1, p0, Lorg/rabochaya/projects/ProjectsActivity;->projectId:J

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v0, "folder"

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity;->folderId:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "exportKmz"

    iget-boolean v1, p0, Lorg/rabochaya/projects/ProjectsActivity;->exportKmz:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "exportProjectId"

    iget-wide v1, p0, Lorg/rabochaya/projects/ProjectsActivity;->exportProjectId:J

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    return-void
.end method

.method protected onResume()V
    .locals 4
    invoke-super {p0}, Landroid/app/Activity;->onResume()V
    iget-boolean v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->resumedOnce:Z
    if-nez v0, :refresh
    const/4 v0, 0x1
    iput-boolean v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->resumedOnce:Z
    return-void
    :refresh
    iget-boolean v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->busy:Z
    if-nez v0, :done
    iget-boolean v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->disposed:Z
    if-nez v0, :done
    iget-wide v0, p0, Lorg/rabochaya/projects/ProjectsActivity;->projectId:J
    const-wide/16 v2, 0x0
    cmp-long v2, v0, v2
    if-ltz v2, :home
    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity;->folderId:Ljava/lang/String;
    invoke-direct {p0, v0, v1, v2}, Lorg/rabochaya/projects/ProjectsActivity;->open(JLjava/lang/String;)V
    goto :done
    :home
    invoke-direct {p0}, Lorg/rabochaya/projects/ProjectsActivity;->home()V
    :done
    return-void
.end method
