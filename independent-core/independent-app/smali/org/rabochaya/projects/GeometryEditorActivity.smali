.class public final Lorg/rabochaya/projects/GeometryEditorActivity;
.super Landroid/app/Activity;
.source "GeometryEditorActivity.java"


# instance fields
.field private addingHole:Z

.field private base:Ljava/lang/String;

.field private body:Landroid/widget/FrameLayout;

.field private busy:Z

.field private close:Landroid/widget/Button;

.field private current:I

.field private disposed:Z

.field private expected:Ljava/lang/String;

.field private featureId:Ljava/lang/String;

.field private input:Landroid/widget/EditText;

.field private mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

.field private mapMode:Z

.field private mapState:Lorg/rabochaya/projects/GeometryMapState;

.field private mapViewport:[D

.field private mode:Landroid/widget/Button;

.field private more:Landroid/widget/Button;

.field private notice:Landroid/widget/Toast;

.field private orphan:Z

.field private ownedDraft:Lorg/rabochaya/projects/GeometryDraft;

.field private parts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/GeometryEdits$Part;",
            ">;"
        }
    .end annotation
.end field

.field private preferredKey:Ljava/lang/String;

.field private project:J

.field private restoreMap:Z

.field private restoreSelection:I

.field private root:Landroid/widget/LinearLayout;

.field private save:Landroid/widget/Button;

.field private selecting:Z

.field private selector:Landroid/widget/Spinner;

.field private status:Landroid/widget/TextView;

.field private final worker:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 14
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 28
    const/4 v0, -0x1

    iput v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreSelection:I

    .line 33
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->worker:Ljava/util/concurrent/ExecutorService;

    .line 35
    iput v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    .line 36
    const-string v0, ""

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->base:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lorg/rabochaya/projects/GeometryEditorActivity;)Z
    .locals 0

    .line 14
    iget-boolean p0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selecting:Z

    return p0
.end method

.method static synthetic access$002(Lorg/rabochaya/projects/GeometryEditorActivity;Z)Z
    .locals 0

    .line 14
    iput-boolean p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selecting:Z

    return p1
.end method

.method static synthetic access$100(Lorg/rabochaya/projects/GeometryEditorActivity;)I
    .locals 0

    .line 14
    iget p0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    return p0
.end method

.method static synthetic access$1000(Lorg/rabochaya/projects/GeometryEditorActivity;)Z
    .locals 0

    .line 14
    iget-boolean p0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    return p0
.end method

.method static synthetic access$1100(Lorg/rabochaya/projects/GeometryEditorActivity;)Z
    .locals 0

    .line 14
    iget-boolean p0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    return p0
.end method

.method static synthetic access$1200(Lorg/rabochaya/projects/GeometryEditorActivity;)Lorg/rabochaya/projects/GeometryMapCanvas;
    .locals 0

    .line 14
    iget-object p0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    return-object p0
.end method

.method static synthetic access$1300(Lorg/rabochaya/projects/GeometryEditorActivity;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->clearNotice()V

    return-void
.end method

.method static synthetic access$1400(Lorg/rabochaya/projects/GeometryEditorActivity;)Lorg/rabochaya/projects/GeometryMapState;
    .locals 0

    .line 14
    iget-object p0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    return-object p0
.end method

.method static synthetic access$1500(Lorg/rabochaya/projects/GeometryEditorActivity;)Landroid/widget/EditText;
    .locals 0

    .line 14
    iget-object p0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    return-object p0
.end method

.method static synthetic access$1600(Lorg/rabochaya/projects/GeometryEditorActivity;)Z
    .locals 0

    .line 14
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->persist()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1700(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/lang/String;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMessage(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lorg/rabochaya/projects/GeometryEditorActivity;)Z
    .locals 0

    .line 14
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->dirty()Z

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lorg/rabochaya/projects/GeometryEditorActivity;)Landroid/widget/Spinner;
    .locals 0

    .line 14
    iget-object p0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    return-object p0
.end method

.method static synthetic access$400(Lorg/rabochaya/projects/GeometryEditorActivity;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->choosePart(I)V

    return-void
.end method

.method static synthetic access$500(Lorg/rabochaya/projects/GeometryEditorActivity;Z)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    return-void
.end method

.method static synthetic access$600(Lorg/rabochaya/projects/GeometryEditorActivity;)Ljava/io/File;
    .locals 0

    .line 14
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->drafts()Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(Lorg/rabochaya/projects/GeometryEditorActivity;)J
    .locals 2

    .line 14
    iget-wide v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    return-wide v0
.end method

.method static synthetic access$800(Lorg/rabochaya/projects/GeometryEditorActivity;)Ljava/lang/String;
    .locals 0

    .line 14
    iget-object p0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$900(Lorg/rabochaya/projects/GeometryEditorActivity;)Landroid/widget/TextView;
    .locals 0

    .line 14
    iget-object p0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    return-object p0
.end method

.method private actions()V
    .locals 4

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/GeometryEdits$Part;

    .line 54
    iget-boolean v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    if-nez v2, :cond_0

    iget-boolean v2, v1, Lorg/rabochaya/projects/GeometryEdits$Part;->polygon:Z

    if-eqz v2, :cond_0

    iget-boolean v2, v1, Lorg/rabochaya/projects/GeometryEdits$Part;->hole:Z

    if-nez v2, :cond_0

    const-string v2, "\u0414\u043e\u0431\u0430\u0432\u0438\u0442\u044c \u0432\u043d\u0443\u0442\u0440\u0435\u043d\u043d\u0438\u0439 \u043a\u043e\u043d\u0442\u0443\u0440"

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    :cond_0
    iget-boolean v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez v2, :cond_1

    iget-boolean v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    if-nez v2, :cond_1

    iget-boolean v1, v1, Lorg/rabochaya/projects/GeometryEdits$Part;->hole:Z

    if-eqz v1, :cond_1

    const-string v1, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0432\u043d\u0443\u0442\u0440\u0435\u043d\u043d\u0438\u0439 \u043a\u043e\u043d\u0442\u0443\u0440"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    :cond_1
    iget-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez v1, :cond_2

    const-string v1, "\u0420\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u0432\u0435\u0440\u0448\u0438\u043d\u044b"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    :cond_2
    const-string v1, "\u041a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u0432\u0432\u043e\u0434"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v1, "\u041f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0442\u044c \u043e\u0431\u044a\u0435\u043a\u0442"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "\u0414\u0435\u0439\u0441\u0442\u0432\u0438\u044f \u0441 \u043a\u043e\u043d\u0442\u0443\u0440\u043e\u043c"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/CharSequence;

    new-instance v3, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda6;

    invoke-direct {v3, p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda6;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/util/List;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 59
    return-void
.end method

.method private applyVertex(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/widget/EditText;)Z
    .locals 2

    .line 86
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    const/4 v1, 0x0

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 87
    :cond_0
    :try_start_0
    invoke-static {p1, p2, p3, p4, p5}, Lorg/rabochaya/projects/GeometryVertices;->edit(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->clearNotice()V

    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {p2, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string p2, "\u0412\u0435\u0440\u0448\u0438\u043d\u044b \u0438\u0437\u043c\u0435\u043d\u0435\u043d\u044b \u0432\u043e \u0432\u0432\u043e\u0434\u0435. \u0414\u043b\u044f \u0437\u0430\u043f\u0438\u0441\u0438 \u043e\u0431\u044a\u0435\u043a\u0442\u0430 \u043d\u0430\u0436\u043c\u0438\u0442\u0435 \u00ab\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c\u00bb"

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    .line 88
    :catch_0
    move-exception p1

    if-eqz p6, :cond_1

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p6, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_1
    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return v1

    .line 86
    :cond_2
    :goto_1
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string p2, "\u0412\u0432\u043e\u0434 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f; \u0432\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u0432\u0435\u0440\u0448\u0438\u043d\u0443 \u0437\u0430\u043d\u043e\u0432\u043e"

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return v1
.end method

.method private build(Lorg/rabochaya/projects/GeometryDraft;Ljava/lang/String;)V
    .locals 8

    .line 102
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    const-string v1, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b \u0438 \u043a\u043e\u043d\u0442\u0443\u0440\u044b"

    const/16 v2, 0x15

    invoke-direct {p0, v1, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/Spinner;

    invoke-direct {v0, p0}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setBackgroundColor(I)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    const-string v2, "\u0412\u044b\u0431\u043e\u0440 \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u0438 \u0438 \u043a\u043e\u043d\u0442\u0443\u0440\u0430"

    invoke-virtual {v0, v2}, Landroid/widget/Spinner;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    new-array v2, v0, [Ljava/lang/String;

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v0, :cond_0

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v5, v5, Lorg/rabochaya/projects/GeometryEdits$Part;->name:Ljava/lang/String;

    aput-object v5, v2, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/widget/ArrayAdapter;

    const v4, 0x1090008

    invoke-direct {v0, p0, v4, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    const v2, 0x1090009

    invoke-virtual {v0, v2}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    invoke-virtual {v2, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 103
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    const-string v2, "WGS 84: \u0448\u0438\u0440\u043e\u0442\u0430 \u0434\u043e\u043b\u0433\u043e\u0442\u0430 [\u0432\u044b\u0441\u043e\u0442\u0430], \u043e\u0434\u043d\u0430 \u0432\u0435\u0440\u0448\u0438\u043d\u0430 \u0432 \u0441\u0442\u0440\u043e\u043a\u0435"

    const/16 v4, 0xc

    invoke-direct {p0, v2, v4}, Lorg/rabochaya/projects/GeometryEditorActivity;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 104
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    new-instance v2, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda9;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda9;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v5, "\u0420\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u043d\u0430 \u043a\u0430\u0440\u0442\u0435"

    invoke-direct {p0, v0, v5, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mode:Landroid/widget/Button;

    .line 105
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    const v2, -0xdfdfe0

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTextColor(I)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackgroundColor(I)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    const/16 v2, 0x33

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setGravity(I)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    const v2, 0xa0001

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setInputType(I)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setSaveEnabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    const/4 v2, 0x1

    new-array v5, v2, [Landroid/text/InputFilter;

    new-instance v6, Landroid/text/InputFilter$LengthFilter;

    const v7, 0x7a120

    invoke-direct {v6, v7}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v6, v5, v3

    invoke-virtual {v0, v5}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->body:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->body:Landroid/widget/FrameLayout;

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v6, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v5, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->body:Landroid/widget/FrameLayout;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v6, v1, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 106
    const-string v0, ""

    invoke-direct {p0, v0, v4}, Lorg/rabochaya/projects/GeometryEditorActivity;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x42580000    # 54.0f

    invoke-static {p0, v6}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v6

    invoke-direct {v5, v1, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 107
    new-instance v4, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda10;

    invoke-direct {v4, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda10;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v5, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c"

    invoke-direct {p0, v0, v5, v4}, Lorg/rabochaya/projects/GeometryEditorActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v4

    iput-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->save:Landroid/widget/Button;

    new-instance v4, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda11;

    invoke-direct {v4, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda11;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v5, "\u0414\u0435\u0439\u0441\u0442\u0432\u0438\u044f"

    invoke-direct {p0, v0, v5, v4}, Lorg/rabochaya/projects/GeometryEditorActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v4

    iput-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->more:Landroid/widget/Button;

    new-instance v4, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda12;

    invoke-direct {v4, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda12;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v5, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    invoke-direct {p0, v0, v5, v4}, Lorg/rabochaya/projects/GeometryEditorActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v4

    iput-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->close:Landroid/widget/Button;

    move v4, v3

    :goto_1
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v5

    if-ge v4, v5, :cond_1

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v3, v1, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 108
    :cond_1
    iput v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    if-eqz p1, :cond_2

    iget-object v0, p1, Lorg/rabochaya/projects/GeometryDraft;->key:Ljava/lang/String;

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->preferredKey:Ljava/lang/String;

    :goto_2
    if-eqz v0, :cond_4

    move v1, v3

    :goto_3
    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v1, v4, :cond_4

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v4, v4, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    iput v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    goto :goto_4

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 109
    :cond_4
    :goto_4
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapViewport:[D

    iput-boolean v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selecting:Z

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    iget v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-virtual {v1, v4}, Landroid/widget/Spinner;->setSelection(I)V

    iput-boolean v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selecting:Z

    iget v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->showPart(I)V

    iget-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreMap:Z

    if-eqz v1, :cond_5

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapViewport:[D

    .line 110
    :cond_5
    if-eqz p1, :cond_8

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v1, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object v4, p1, Lorg/rabochaya/projects/GeometryDraft;->key:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    iget-object v4, p1, Lorg/rabochaya/projects/GeometryDraft;->text:Ljava/lang/String;

    invoke-virtual {v1, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p1, Lorg/rabochaya/projects/GeometryDraft;->token:Ljava/lang/String;

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-boolean v1, p1, Lorg/rabochaya/projects/GeometryDraft;->addingHole:Z

    iput-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    iget-object v4, p1, Lorg/rabochaya/projects/GeometryDraft;->token:Ljava/lang/String;

    iget-object v0, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->token:Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "\u0412\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a"

    goto :goto_5

    :cond_6
    const-string v0, "\u0413\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0430\u0441\u044c; \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d. \u041f\u0435\u0440\u0435\u0434 \u0437\u0430\u043f\u0438\u0441\u044c\u044e \u043f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0439\u0442\u0435 \u043e\u0431\u044a\u0435\u043a\u0442"

    :goto_5
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_6

    :cond_7
    iput-boolean v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    iget-object v1, p1, Lorg/rabochaya/projects/GeometryDraft;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p1, Lorg/rabochaya/projects/GeometryDraft;->token:Ljava/lang/String;

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041a\u043e\u043d\u0442\u0443\u0440 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a\u0430 \u0431\u043e\u043b\u044c\u0448\u0435 \u043d\u0435 \u043d\u0430\u0439\u0434\u0435\u043d. \u0412\u0432\u043e\u0434 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d; \u043c\u043e\u0436\u043d\u043e \u0441\u043a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u0435\u0433\u043e \u0438\u043b\u0438 \u043f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0442\u044c \u043e\u0431\u044a\u0435\u043a\u0442"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    :cond_8
    :goto_6
    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_9

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    :cond_9
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    new-instance p2, Lorg/rabochaya/projects/GeometryEditorActivity$1;

    invoke-direct {p2, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$1;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    invoke-virtual {p1, p2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreMap:Z

    if-eqz p1, :cond_a

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez p1, :cond_a

    iput-boolean v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreMap:Z

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->openMap()V

    .line 113
    :cond_a
    return-void
.end method

.method private button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .locals 3

    .line 50
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 p2, 0x0

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {p2, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda21;

    invoke-direct {p1, p0, p3}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda21;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method private choosePart(I)V
    .locals 1

    .line 115
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->dirty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->persist()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->showPart(I)V

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->openMap()V

    :cond_1
    return-void
.end method

.method private clearNotice()V
    .locals 1

    .line 137
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->notice:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->notice:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->notice:Landroid/widget/Toast;

    :cond_0
    return-void
.end method

.method private dirty()Z
    .locals 3

    .line 135
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    if-eqz v0, :cond_1

    iget v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    if-ltz v0, :cond_1

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v1, v1, Lorg/rabochaya/projects/GeometryEdits$Part;->token:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->base:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private discardReload()V
    .locals 3

    .line 139
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u041f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0442\u044c \u043e\u0431\u044a\u0435\u043a\u0442 \u0438 \u0443\u0434\u0430\u043b\u0438\u0442\u044c \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u044d\u0442\u043e\u0433\u043e \u043e\u0431\u044a\u0435\u043a\u0442\u0430?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda13;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda13;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v2, "\u041f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0442\u044c"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private drafts()Ljava/io/File;
    .locals 3

    .line 41
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "geometry-drafts"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private enabled(Z)V
    .locals 6

    .line 51
    xor-int/lit8 v0, p1, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    const/4 v0, 0x4

    new-array v1, v0, [Landroid/view/View;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->more:Landroid/widget/Button;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const/4 v2, 0x2

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->close:Landroid/widget/Button;

    aput-object v5, v1, v2

    const/4 v2, 0x3

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mode:Landroid/widget/Button;

    aput-object v5, v1, v2

    move v2, v3

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v5, v1, v2

    if-eqz v5, :cond_0

    invoke-virtual {v5, p1}, Landroid/view/View;->setEnabled(Z)V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    if-eqz p1, :cond_2

    iget-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez v1, :cond_2

    move v1, v4

    goto :goto_1

    :cond_2
    move v1, v3

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setEnabled(Z)V

    :cond_3
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->save:Landroid/widget/Button;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->save:Landroid/widget/Button;

    if-eqz p1, :cond_4

    iget-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez v1, :cond_4

    move v1, v4

    goto :goto_2

    :cond_4
    move v1, v3

    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_5
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mode:Landroid/widget/Button;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mode:Landroid/widget/Button;

    if-eqz p1, :cond_6

    iget-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez v1, :cond_6

    move v1, v4

    goto :goto_3

    :cond_6
    move v1, v3

    :goto_3
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_7
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    if-eqz p1, :cond_8

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez p1, :cond_8

    move v3, v4

    :cond_8
    invoke-virtual {v0, v3}, Lorg/rabochaya/projects/GeometryMapCanvas;->setEditingEnabled(Z)V

    :cond_9
    return-void
.end method

.method private label(Ljava/lang/String;I)Landroid/widget/TextView;
    .locals 1

    .line 49
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, -0x1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    int-to-float p1, p2

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    return-object v0
.end method

.method private load()V
    .locals 2

    .line 91
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreMap:Z

    :cond_0
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->releaseMap()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    .line 92
    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041e\u0442\u043a\u0440\u044b\u0442\u0438\u0435 \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u0438\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda8;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda8;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 100
    return-void
.end method

.method private mapMessage(Ljava/lang/String;)V
    .locals 3

    .line 133
    iget v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    if-ltz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v1, v1, Lorg/rabochaya/projects/GeometryEdits$Part;->token:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v0, :cond_1

    const-string v0, "\u0413\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0430\u0441\u044c; \u0437\u0430\u043f\u0438\u0441\u044c \u0431\u0443\u0434\u0435\u0442 \u043e\u0442\u043a\u043b\u043e\u043d\u0435\u043d\u0430. "

    goto :goto_1

    :cond_1
    const-string v0, ""

    :goto_1
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private newHole()V
    .locals 4

    .line 138
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->dirty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u0421\u043d\u0430\u0447\u0430\u043b\u0430 \u0441\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u0435 \u0438\u043b\u0438 \u043e\u0442\u043c\u0435\u043d\u0438\u0442\u0435 \u0442\u0435\u043a\u0443\u0449\u0438\u0439 \u0432\u0432\u043e\u0434"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->clearNotice()V

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->textMode()V

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    const-string v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v3, "\u041d\u043e\u0432\u044b\u0439 \u0432\u043d\u0443\u0442\u0440\u0435\u043d\u043d\u0438\u0439 \u043a\u043e\u043d\u0442\u0443\u0440: \u043c\u0438\u043d\u0438\u043c\u0443\u043c \u0442\u0440\u0438 \u0440\u0430\u0437\u043d\u044b\u0435 \u0432\u0435\u0440\u0448\u0438\u043d\u044b"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->openMap()V

    :cond_1
    return-void
.end method

.method public static open(Landroid/app/Activity;JLjava/lang/String;)V
    .locals 2

    .line 39
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "project"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object p1

    const-string p2, "feature"

    invoke-virtual {p1, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 40
    return-void
.end method

.method private openMap()V
    .locals 14

    .line 119
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-nez v0, :cond_8

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez v0, :cond_8

    iget v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    if-gez v0, :cond_0

    goto/16 :goto_3

    .line 121
    :cond_0
    :try_start_0
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    if-eqz v0, :cond_1

    const-string v0, "Polygon"

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v0, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    :goto_0
    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 122
    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v2}, Lorg/rabochaya/projects/GeometryMapState;->text()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    iget-object v2, v2, Lorg/rabochaya/projects/GeometryMapState;->type:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    iget-boolean v2, v2, Lorg/rabochaya/projects/GeometryMapState;->incompleteAllowed:Z

    iget-boolean v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    if-eq v2, v3, :cond_3

    :cond_2
    new-instance v2, Lorg/rabochaya/projects/GeometryMapState;

    iget-boolean v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    invoke-direct {v2, v1, v0, v3}, Lorg/rabochaya/projects/GeometryMapState;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    iput-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    .line 123
    :cond_3
    const/4 v0, 0x0

    move v1, v0

    :goto_1
    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v2}, Lorg/rabochaya/projects/GeometryMapState;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ge v1, v2, :cond_5

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v2, v1}, Lorg/rabochaya/projects/GeometryMapState;->point(I)[D

    move-result-object v2

    aget-wide v3, v2, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    const-wide v4, 0x40554345b1a57f00L    # 85.05112878

    cmpl-double v2, v2, v4

    if-gtz v2, :cond_4

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u042d\u0442\u0430 \u043a\u0430\u0440\u0442\u0430 \u043e\u0442\u043e\u0431\u0440\u0430\u0436\u0430\u0435\u0442 \u0448\u0438\u0440\u043e\u0442\u044b \u0434\u043e \u00b185.05112878\u00b0. \u0414\u043b\u044f \u043f\u043e\u043b\u044f\u0440\u043d\u044b\u0445 \u0432\u0435\u0440\u0448\u0438\u043d \u0438\u0441\u043f\u043e\u043b\u044c\u0437\u0443\u0439\u0442\u0435 \u0441\u043f\u0438\u0441\u043e\u043a \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 124
    :cond_5
    iget v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreSelection:I

    if-ltz v1, :cond_6

    iget v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreSelection:I

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v2}, Lorg/rabochaya/projects/GeometryMapState;->size()I

    move-result v2

    if-ge v1, v2, :cond_6

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    iget v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreSelection:I

    invoke-virtual {v1, v2}, Lorg/rabochaya/projects/GeometryMapState;->select(I)V

    :cond_6
    const/4 v1, -0x1

    iput v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreSelection:I

    .line 125
    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->clearFocus()V

    const-string v2, "input_method"

    invoke-virtual {p0, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/inputmethod/InputMethodManager;

    if-eqz v2, :cond_7

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getWindowToken()Landroid/os/IBinder;

    move-result-object v4

    invoke-virtual {v2, v4, v0}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 126
    :cond_7
    new-instance v0, Lorg/rabochaya/projects/GeometryMapCanvas;

    iget-wide v6, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v8, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    iget-object v9, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v10, v2, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-boolean v11, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    iget-object v12, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapViewport:[D

    new-instance v13, Lorg/rabochaya/projects/GeometryEditorActivity$2;

    invoke-direct {v13, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$2;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    move-object v4, v0

    move-object v5, p0

    invoke-direct/range {v4 .. v13}, Lorg/rabochaya/projects/GeometryMapCanvas;-><init>(Landroid/app/Activity;JLorg/rabochaya/projects/GeometryMapState;Ljava/util/List;Ljava/lang/String;Z[DLorg/rabochaya/projects/GeometryMapCanvas$Listener;)V

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    .line 130
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->body:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->body:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iput-boolean v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mode:Landroid/widget/Button;

    const-string v1, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b \u0441\u043f\u0438\u0441\u043a\u043e\u043c"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const-string v0, "\u041a\u043e\u0441\u043d\u0438\u0442\u0435\u0441\u044c \u0432\u0435\u0440\u0448\u0438\u043d\u044b \u0438 \u043f\u0435\u0440\u0435\u0442\u0430\u0449\u0438\u0442\u0435. \u0421\u0432\u043e\u0431\u043e\u0434\u043d\u043e\u0435 \u043c\u0435\u0441\u0442\u043e \u2014 \u043f\u0435\u0440\u0435\u043c\u0435\u0449\u0435\u043d\u0438\u0435 \u043a\u0430\u0440\u0442\u044b, \u0434\u0432\u0430 \u043f\u0430\u043b\u044c\u0446\u0430 \u2014 \u043c\u0430\u0441\u0448\u0442\u0430\u0431"

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMessage(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    goto :goto_2

    :catch_0
    move-exception v0

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    :goto_2
    return-void

    .line 119
    :cond_8
    :goto_3
    return-void
.end method

.method private persist()Z
    .locals 6

    .line 136
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    const/4 v1, 0x1

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    :try_start_0
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->dirty()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->drafts()Ljava/io/File;

    move-result-object v0

    iget-wide v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;

    invoke-static {v0, v2, v3, v4, v5}, Lorg/rabochaya/projects/GeometryDraft;->discardIfMatches(Ljava/io/File;JLjava/lang/String;Lorg/rabochaya/projects/GeometryDraft;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0411\u043e\u043b\u0435\u0435 \u043d\u043e\u0432\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u043e\u0441\u0442\u0430\u0432\u043b\u0435\u043d. \u041f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0439\u0442\u0435 \u043e\u0431\u044a\u0435\u043a\u0442"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    :goto_0
    return v1

    :cond_3
    new-instance v0, Lorg/rabochaya/projects/GeometryDraft;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v2, v2, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    iget-boolean v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    invoke-direct {v0, v2, v3, v4, v5}, Lorg/rabochaya/projects/GeometryDraft;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->drafts()Ljava/io/File;

    move-result-object v2

    iget-wide v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    invoke-virtual {v0, v2, v3, v4, v5}, Lorg/rabochaya/projects/GeometryDraft;->save(Ljava/io/File;JLjava/lang/String;)V

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    :catch_0
    move-exception v0

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u0427\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u043d\u0435 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    return v0

    :cond_4
    :goto_1
    return v1
.end method

.method private releaseMap()V
    .locals 1

    .line 116
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeometryMapCanvas;->viewport()[D

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapViewport:[D

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeometryMapCanvas;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    :cond_0
    return-void
.end method

.method private showPart(I)V
    .locals 4

    .line 114
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->releaseMap()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapViewport:[D

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    iput p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v1, p1, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->preferredKey:Ljava/lang/String;

    iget-object v1, p1, Lorg/rabochaya/projects/GeometryEdits$Part;->token:Ljava/lang/String;

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-object v1, p1, Lorg/rabochaya/projects/GeometryEdits$Part;->text:Ljava/lang/String;

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->base:Ljava/lang/String;

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->base:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->body:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->body:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mode:Landroid/widget/Button;

    const-string v1, "\u0420\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u043d\u0430 \u043a\u0430\u0440\u0442\u0435"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    iget-object p1, p1, Lorg/rabochaya/projects/GeometryEdits$Part;->name:Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private textMode()V
    .locals 4

    .line 117
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->releaseMap()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->body:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->body:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mode:Landroid/widget/Button;

    const-string v1, "\u0420\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u043d\u0430 \u043a\u0430\u0440\u0442\u0435"

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b \u0442\u0435\u043a\u0443\u0449\u0435\u0433\u043e \u0432\u0432\u043e\u0434\u0430. \u0414\u043b\u044f \u0437\u0430\u043f\u0438\u0441\u0438 \u043e\u0431\u044a\u0435\u043a\u0442\u0430 \u043d\u0430\u0436\u043c\u0438\u0442\u0435 \u00ab\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c\u00bb"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private vertices()V
    .locals 9

    .line 61
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iget-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    if-eqz v1, :cond_0

    const-string v1, "Polygon"

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v1, v1, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    .line 63
    :goto_0
    :try_start_0
    invoke-static {v0, v1}, Lorg/rabochaya/projects/GeometryVertices;->rows(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v4, v3, [Ljava/lang/String;

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v3, :cond_1

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v7, v5, 0x1

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, ". "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    move v5, v7

    goto :goto_1

    .line 65
    :cond_1
    new-instance v3, Landroid/app/AlertDialog$Builder;

    invoke-direct {v3, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v5, "\u0412\u0435\u0440\u0448\u0438\u043d\u044b: \u0448\u0438\u0440\u043e\u0442\u0430 \u0434\u043e\u043b\u0433\u043e\u0442\u0430 \u0432\u044b\u0441\u043e\u0442\u0430"

    invoke-virtual {v3, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    new-instance v5, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda19;

    invoke-direct {v5, p0, v1, v2, v0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda19;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 83
    const-string v1, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 84
    return-void

    .line 63
    :catch_0
    move-exception v0

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private write(Z)V
    .locals 10

    .line 141
    iget v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    if-ltz v0, :cond_6

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-eqz v0, :cond_0

    goto/16 :goto_2

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeometryMapCanvas;->cancelGesture()V

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->notice:Landroid/widget/Toast;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->notice:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->notice:Landroid/widget/Toast;

    :cond_2
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-boolean v6, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    .line 142
    if-nez p1, :cond_4

    if-eqz v6, :cond_3

    :try_start_0
    const-string v0, "Polygon"

    goto :goto_0

    :cond_3
    iget-object v0, v4, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    :goto_0
    invoke-static {v7, v0}, Lorg/rabochaya/projects/GeometryCoordinates;->parse(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 143
    :cond_4
    :goto_1
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->persist()Z

    move-result v0

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v8, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u0421\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u0438\u0435 \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u0438\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v9, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;

    move-object v1, v9

    move-object v2, p0

    move v3, p1

    invoke-direct/range {v1 .. v8}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;ZLorg/rabochaya/projects/GeometryEdits$Part;Ljava/lang/String;ZLjava/lang/String;Lorg/rabochaya/projects/GeometryDraft;)V

    invoke-interface {v0, v9}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 154
    return-void

    .line 141
    :cond_6
    :goto_2
    return-void
.end method


# virtual methods
.method synthetic lambda$actions$1$org-rabochaya-projects-GeometryEditorActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 58
    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->write(Z)V

    return-void
.end method

.method synthetic lambda$actions$2$org-rabochaya-projects-GeometryEditorActivity(Ljava/util/List;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 58
    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const-string p2, "\u0420\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u0432\u0435\u0440\u0448\u0438\u043d\u044b"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->textMode()V

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->vertices()V

    goto :goto_0

    :cond_0
    const-string p2, "\u0414\u043e\u0431\u0430\u0432\u0438\u0442\u044c \u0432\u043d\u0443\u0442\u0440\u0435\u043d\u043d\u0438\u0439 \u043a\u043e\u043d\u0442\u0443\u0440"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->newHole()V

    goto :goto_0

    :cond_1
    const-string p2, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0432\u043d\u0443\u0442\u0440\u0435\u043d\u043d\u0438\u0439 \u043a\u043e\u043d\u0442\u0443\u0440"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->dirty()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string p2, "\u0421\u043d\u0430\u0447\u0430\u043b\u0430 \u0441\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u0435 \u0438\u043b\u0438 \u043e\u0442\u043c\u0435\u043d\u0438\u0442\u0435 \u0442\u0435\u043a\u0443\u0449\u0438\u0439 \u0432\u0432\u043e\u0434"

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_2
    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string p2, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0442\u043e\u043b\u044c\u043a\u043e \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0439 \u0432\u043d\u0443\u0442\u0440\u0435\u043d\u043d\u0438\u0439 \u043a\u043e\u043d\u0442\u0443\u0440? \u041e\u0441\u0442\u0430\u043b\u044c\u043d\u0430\u044f \u043e\u0431\u043b\u0430\u0441\u0442\u044c \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u0435\u0442\u0441\u044f."

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance p2, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda20;

    invoke-direct {p2, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda20;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string p3, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u043a\u043e\u043d\u0442\u0443\u0440"

    invoke-virtual {p1, p3, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    :cond_3
    const-string p2, "\u041f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0442\u044c \u043e\u0431\u044a\u0435\u043a\u0442"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->discardReload()V

    goto :goto_0

    :cond_4
    const-string p1, "clipboard"

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/ClipboardManager;

    if-eqz p1, :cond_5

    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    const-string p3, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b WGS 84"

    invoke-static {p3, p2}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    :cond_5
    :goto_0
    return-void
.end method

.method synthetic lambda$build$12$org-rabochaya-projects-GeometryEditorActivity()V
    .locals 1

    .line 104
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->textMode()V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->openMap()V

    :goto_0
    return-void
.end method

.method synthetic lambda$build$13$org-rabochaya-projects-GeometryEditorActivity()V
    .locals 1

    .line 107
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->write(Z)V

    return-void
.end method

.method synthetic lambda$build$14$org-rabochaya-projects-GeometryEditorActivity()V
    .locals 0

    .line 107
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->actions()V

    return-void
.end method

.method synthetic lambda$build$15$org-rabochaya-projects-GeometryEditorActivity()V
    .locals 0

    .line 107
    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->onBackPressed()V

    return-void
.end method

.method synthetic lambda$button$0$org-rabochaya-projects-GeometryEditorActivity(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 50
    iget-boolean p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-nez p2, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method synthetic lambda$discardReload$16$org-rabochaya-projects-GeometryEditorActivity(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 139
    :try_start_0
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->drafts()Ljava/io/File;

    move-result-object p1

    iget-wide v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    invoke-static {p1, v0, v1, p2}, Lorg/rabochaya/projects/GeometryDraft;->delete(Ljava/io/File;JLjava/lang/String;)V

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->base:Ljava/lang/String;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    iput-boolean p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->load()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$load$10$org-rabochaya-projects-GeometryEditorActivity(Ljava/lang/Exception;)V
    .locals 3

    .line 99
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043e\u0442\u043a\u0440\u044b\u0442\u044c \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044e: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda7;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda7;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v1, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    invoke-direct {p0, p1, v1, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    :cond_0
    return-void
.end method

.method synthetic lambda$load$11$org-rabochaya-projects-GeometryEditorActivity()V
    .locals 7

    .line 93
    new-instance v0, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V

    .line 94
    :try_start_0
    iget-wide v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/rabochaya/projects/KmlProject;->byId(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 95
    invoke-static {v1}, Lorg/rabochaya/projects/GeometryEdits;->parts(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 96
    const-string v2, ""
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->drafts()Ljava/io/File;

    move-result-object v3

    iget-wide v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v6, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    invoke-static {v3, v4, v5, v6}, Lorg/rabochaya/projects/GeometryDraft;->load(Ljava/io/File;JLjava/lang/String;)Lorg/rabochaya/projects/GeometryDraft;

    move-result-object v3
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v2

    :try_start_2
    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    .line 97
    :goto_0
    nop

    .line 98
    new-instance v4, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda3;

    invoke-direct {v4, p0, v1, v3, v2}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda3;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/util/List;Lorg/rabochaya/projects/GeometryDraft;Ljava/lang/String;)V

    invoke-virtual {p0, v4}, Lorg/rabochaya/projects/GeometryEditorActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 95
    :cond_0
    new-instance v1, Ljava/io/IOException;

    const-string v2, "\u041d\u0435\u0442 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u043c\u044b\u0445 \u043a\u043e\u043d\u0442\u0443\u0440\u043e\u0432 \u0434\u043b\u044f \u0440\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u044f"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 94
    :cond_1
    new-instance v1, Ljava/io/IOException;

    const-string v2, "\u041e\u0431\u044a\u0435\u043a\u0442 \u0431\u043e\u043b\u044c\u0448\u0435 \u043d\u0435 \u0441\u0443\u0449\u0435\u0441\u0442\u0432\u0443\u0435\u0442"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 99
    :catchall_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    :try_start_3
    new-instance v2, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda4;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_1
    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    return-void

    :goto_2
    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    throw v1
.end method

.method synthetic lambda$load$8$org-rabochaya-projects-GeometryEditorActivity(Ljava/util/List;Lorg/rabochaya/projects/GeometryDraft;Ljava/lang/String;)V
    .locals 1

    .line 98
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez v0, :cond_0

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-direct {p0, p2, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->build(Lorg/rabochaya/projects/GeometryDraft;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$load$9$org-rabochaya-projects-GeometryEditorActivity()V
    .locals 0

    .line 99
    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->finish()V

    return-void
.end method

.method synthetic lambda$onBackPressed$20$org-rabochaya-projects-GeometryEditorActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 155
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->persist()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->finish()V

    :cond_0
    return-void
.end method

.method synthetic lambda$onBackPressed$21$org-rabochaya-projects-GeometryEditorActivity(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 155
    :try_start_0
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->drafts()Ljava/io/File;

    move-result-object p1

    iget-wide v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    invoke-static {p1, v0, v1, p2}, Lorg/rabochaya/projects/GeometryDraft;->delete(Ljava/io/File;JLjava/lang/String;)V

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->base:Ljava/lang/String;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->finish()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$vertices$3$org-rabochaya-projects-GeometryEditorActivity(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Landroid/widget/EditText;Landroid/app/AlertDialog;Landroid/view/View;)V
    .locals 7

    .line 79
    invoke-virtual {p5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p7

    invoke-virtual {p7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lorg/rabochaya/projects/GeometryEditorActivity;->applyVertex(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/widget/EditText;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p6}, Landroid/app/AlertDialog;->dismiss()V

    :cond_0
    return-void
.end method

.method synthetic lambda$vertices$4$org-rabochaya-projects-GeometryEditorActivity(Landroid/app/AlertDialog;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Landroid/widget/EditText;Landroid/content/DialogInterface;)V
    .locals 10

    .line 79
    const/4 v0, -0x1

    move-object v8, p1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v9, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda14;

    move-object v1, v9

    move-object v2, p0

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move-object v6, p5

    move-object/from16 v7, p6

    invoke-direct/range {v1 .. v8}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda14;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Landroid/widget/EditText;Landroid/app/AlertDialog;)V

    invoke-virtual {v0, v9}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$vertices$5$org-rabochaya-projects-GeometryEditorActivity(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 7

    .line 80
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v6}, Lorg/rabochaya/projects/GeometryEditorActivity;->applyVertex(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/widget/EditText;)Z

    return-void
.end method

.method synthetic lambda$vertices$6$org-rabochaya-projects-GeometryEditorActivity(Ljava/util/List;Ljava/util/List;ILjava/util/List;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 12

    .line 75
    move-object v8, p0

    move/from16 v0, p8

    move-object v1, p1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Ljava/lang/String;

    .line 76
    const-string v1, "replace"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v7, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v9, 0x0

    if-nez v1, :cond_2

    const-string v1, "before"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "after"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 80
    :cond_0
    const-string v0, "delete"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0432\u0435\u0440\u0448\u0438\u043d\u0443 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    add-int/lit8 v2, p3, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u0438\u0437 \u0442\u0435\u043a\u0443\u0449\u0435\u0433\u043e \u0432\u0432\u043e\u0434\u0430?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    new-instance v11, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda18;

    move-object v0, v11

    move-object v1, p0

    move-object/from16 v2, p5

    move-object/from16 v3, p6

    move v4, p3

    move-object v5, v6

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda18;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c"

    invoke-virtual {v10, v0, v11}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v7, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_1

    .line 81
    :cond_1
    const/4 v5, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object/from16 v1, p5

    move-object/from16 v2, p6

    move v3, p3

    move-object v4, v6

    move-object v6, v7

    invoke-direct/range {v0 .. v6}, Lorg/rabochaya/projects/GeometryEditorActivity;->applyVertex(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/widget/EditText;)Z

    goto :goto_1

    .line 77
    :cond_2
    :goto_0
    new-instance v10, Landroid/widget/EditText;

    invoke-direct {v10, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v10, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v10, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v10, v1}, Landroid/widget/EditText;->setSelectAllOnFocus(Z)V

    const-string v1, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b \u0432\u0435\u0440\u0448\u0438\u043d\u044b WGS 84"

    invoke-virtual {v10, v1}, Landroid/widget/EditText;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 78
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    move-object/from16 v2, p4

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0428\u0438\u0440\u043e\u0442\u0430 \u0434\u043e\u043b\u0433\u043e\u0442\u0430 [\u0432\u044b\u0441\u043e\u0442\u0430], \u0440\u0430\u0437\u0434\u0435\u043b\u0438\u0442\u0435\u043b\u044c \u2014 \u043f\u0440\u043e\u0431\u0435\u043b"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041f\u0440\u0438\u043c\u0435\u043d\u0438\u0442\u044c"

    invoke-virtual {v0, v1, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v7, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v9

    .line 79
    new-instance v11, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;

    move-object v0, v11

    move-object v1, p0

    move-object v2, v9

    move-object/from16 v3, p5

    move-object/from16 v4, p6

    move v5, p3

    move-object v7, v10

    invoke-direct/range {v0 .. v7}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Landroid/app/AlertDialog;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Landroid/widget/EditText;)V

    invoke-virtual {v9, v11}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v9}, Landroid/app/AlertDialog;->show()V

    .line 80
    nop

    .line 82
    :goto_1
    return-void
.end method

.method synthetic lambda$vertices$7$org-rabochaya-projects-GeometryEditorActivity(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 10

    .line 66
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 67
    const-string p4, "\u0418\u0437\u043c\u0435\u043d\u0438\u0442\u044c \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b"

    invoke-interface {v5, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string p4, "replace"

    invoke-interface {v2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    const-string p4, "Point"

    invoke-virtual {p4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-nez p4, :cond_2

    .line 69
    const-string p4, "\u0412\u0441\u0442\u0430\u0432\u0438\u0442\u044c \u043f\u0435\u0440\u0435\u0434"

    invoke-interface {v5, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string p4, "before"

    invoke-interface {v2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string p4, "\u0412\u0441\u0442\u0430\u0432\u0438\u0442\u044c \u043f\u043e\u0441\u043b\u0435"

    invoke-interface {v5, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string p4, "after"

    invoke-interface {v2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    if-lez p5, :cond_0

    const-string p4, "\u0412\u044b\u0448\u0435 \u0432 \u0441\u043f\u0438\u0441\u043a\u0435"

    invoke-interface {v5, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string p4, "up"

    invoke-interface {v2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    :cond_0
    add-int/lit8 p4, p5, 0x1

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    if-ge p4, v0, :cond_1

    const-string p4, "\u041d\u0438\u0436\u0435 \u0432 \u0441\u043f\u0438\u0441\u043a\u0435"

    invoke-interface {v5, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string p4, "down"

    invoke-interface {v2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    :cond_1
    const-string p4, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0432\u0435\u0440\u0448\u0438\u043d\u0443"

    invoke-interface {v5, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string p4, "delete"

    invoke-interface {v2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    :cond_2
    new-instance p4, Landroid/app/AlertDialog$Builder;

    invoke-direct {p4, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u0412\u0435\u0440\u0448\u0438\u043d\u0430 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/lit8 v1, p5, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p4

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {v5, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, [Ljava/lang/CharSequence;

    new-instance v9, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;

    move-object v0, v9

    move-object v1, p0

    move-object v3, p2

    move v4, p5

    move-object v6, p3

    move-object v7, p1

    invoke-direct/range {v0 .. v7}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/util/List;Ljava/util/List;ILjava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p4, v8, v9}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    .line 82
    const-string p2, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 83
    return-void
.end method

.method synthetic lambda$write$17$org-rabochaya-projects-GeometryEditorActivity(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 152
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez v0, :cond_0

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->base:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->preferredKey:Ljava/lang/String;

    const/4 p1, 0x1

    invoke-static {p0, p3, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->notice:Landroid/widget/Toast;

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->notice:Landroid/widget/Toast;

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->load()V

    :cond_0
    return-void
.end method

.method synthetic lambda$write$18$org-rabochaya-projects-GeometryEditorActivity(Ljava/lang/Exception;)V
    .locals 3

    .line 153
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0441\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c: "

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

.method synthetic lambda$write$19$org-rabochaya-projects-GeometryEditorActivity(ZLorg/rabochaya/projects/GeometryEdits$Part;Ljava/lang/String;ZLjava/lang/String;Lorg/rabochaya/projects/GeometryDraft;)V
    .locals 6

    .line 144
    new-instance v0, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V

    .line 145
    :try_start_0
    iget-wide v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/rabochaya/projects/KmlProject;->byId(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 146
    if-eqz p1, :cond_0

    iget-object v3, p2, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    invoke-static {v2, v3, p3}, Lorg/rabochaya/projects/GeometryEdits;->removeHole(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    if-eqz p4, :cond_1

    iget-object v3, p2, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    invoke-static {v2, v3, p3, p5}, Lorg/rabochaya/projects/GeometryEdits;->addHole(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v3, p2, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    invoke-static {v2, v3, p3, p5}, Lorg/rabochaya/projects/GeometryEdits;->replace(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    :goto_0
    iget-object p3, p2, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 148
    const-string v3, "/outer"

    const-string v4, "/inner/"

    const/4 v5, 0x0

    if-eqz p4, :cond_3

    :try_start_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p4, p2, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object p2, p2, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr p2, v3

    invoke-virtual {p4, v5, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2}, Lorg/rabochaya/projects/GeometryEdits;->parts(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_2
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_4

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v2, p4, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object p3, p4, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    goto :goto_1

    .line 149
    :cond_3
    if-eqz p1, :cond_4

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p3, p2, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object p2, p2, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    invoke-virtual {p2, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    invoke-virtual {p3, v5, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 150
    :cond_4
    nop

    .line 151
    iget-wide p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    invoke-virtual {v0, p1, p2, v1}, Lorg/rabochaya/projects/ProjectStore;->saveDocument(JLorg/rabochaya/projects/KmlProject;)V

    const-string p1, ""
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p6, :cond_5

    :try_start_2
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->drafts()Ljava/io/File;

    move-result-object p2

    iget-wide v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object p4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    invoke-static {p2, v1, v2, p4, p6}, Lorg/rabochaya/projects/GeometryDraft;->discardIfMatches(Ljava/io/File;JLjava/lang/String;Lorg/rabochaya/projects/GeometryDraft;)Z

    move-result p2

    if-nez p2, :cond_5

    const-string p1, " \u00b7 \u0411\u043e\u043b\u0435\u0435 \u043d\u043e\u0432\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u043e\u0441\u0442\u0430\u0432\u043b\u0435\u043d"
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :catch_0
    move-exception p1

    :try_start_3
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, " \u00b7 "

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_5
    :goto_2
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "\u0413\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f \u0441\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u0430"

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 152
    new-instance p2, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda15;

    invoke-direct {p2, p0, p5, p3, p1}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda15;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_3

    .line 145
    :cond_6
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u041e\u0431\u044a\u0435\u043a\u0442 \u0443\u0434\u0430\u043b\u0451\u043d; \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 153
    :catchall_0
    move-exception p1

    goto :goto_4

    :catch_1
    move-exception p1

    :try_start_4
    new-instance p2, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda16;

    invoke-direct {p2, p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda16;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :goto_3
    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    return-void

    :goto_4
    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    throw p1
.end method

.method public onBackPressed()V
    .locals 3

    .line 155
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u0414\u043e\u0436\u0434\u0438\u0442\u0435\u0441\u044c \u043e\u043a\u043e\u043d\u0447\u0430\u043d\u0438\u044f \u043e\u043f\u0435\u0440\u0430\u0446\u0438\u0438"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->dirty()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->finish()V

    return-void

    :cond_1
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c \u0432\u0432\u043e\u0434 \u043a\u0430\u043a \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u0438 \u0437\u0430\u043a\u0440\u044b\u0442\u044c \u0440\u0435\u0434\u0430\u043a\u0442\u043e\u0440?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda1;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v2, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041f\u0440\u043e\u0434\u043e\u043b\u0436\u0438\u0442\u044c \u0440\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u0435"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda2;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v2, "\u041e\u0442\u043c\u0435\u043d\u0438\u0442\u044c \u0432\u0432\u043e\u0434"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 43
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "project"

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "feature"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    .line 44
    if-eqz p1, :cond_0

    const-string v0, "geometry_map"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreMap:Z

    const-string v0, "geometry_selected"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreSelection:I

    const-string v0, "geometry_viewport"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getDoubleArray(Ljava/lang/String;)[D

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapViewport:[D

    const-string v0, "geometry_part"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->preferredKey:Ljava/lang/String;

    .line 45
    :cond_0
    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const v0, -0xe3dae8

    invoke-virtual {p1, v0}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 46
    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 p1, 0x41400000    # 12.0f

    invoke-static {p0, p1}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result p1

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1, p1, p1, p1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    const v0, -0xdcd2e3

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->setContentView(Landroid/view/View;)V

    .line 47
    const-string p1, "\u041e\u0442\u043a\u0440\u044b\u0442\u0438\u0435 \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u0438\u2026"

    const/16 v0, 0x10

    invoke-direct {p0, p1, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->load()V

    .line 48
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 159
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->releaseMap()V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->notice:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->notice:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->worker:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 157
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/GeometryMapCanvas;->suspend(Z)V

    :cond_0
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->persist()Z

    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 158
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/GeometryMapCanvas;->suspend(Z)V

    :cond_0
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 156
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeometryMapCanvas;->cancelGesture()V

    :cond_0
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->persist()Z

    const-string v0, "geometry_map"

    iget-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    if-ltz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v0, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->preferredKey:Ljava/lang/String;

    :goto_0
    const-string v1, "geometry_part"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    if-nez v0, :cond_2

    const/4 v0, -0x1

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeometryMapState;->selected()I

    move-result v0

    :goto_1
    const-string v1, "geometry_selected"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    if-nez v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapViewport:[D

    goto :goto_2

    :cond_3
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeometryMapCanvas;->viewport()[D

    move-result-object v0

    :goto_2
    const-string v1, "geometry_viewport"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putDoubleArray(Ljava/lang/String;[D)V

    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method
