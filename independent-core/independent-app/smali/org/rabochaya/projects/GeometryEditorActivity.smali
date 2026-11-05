.class public final Lorg/rabochaya/projects/GeometryEditorActivity;
.super Landroid/app/Activity;
.source "GeometryEditorActivity.java"


# static fields
.field private static final VERTEX_SESSION:Ljava/lang/String;


# instance fields
.field private addingHole:Z

.field private base:Ljava/lang/String;

.field private body:Landroid/widget/FrameLayout;

.field private busy:Z

.field private close:Landroid/widget/Button;

.field private closeDecisionComplete:Z

.field private closeDialog:Landroid/app/AlertDialog;

.field private closeDraft:Lorg/rabochaya/projects/GeometryCloseDraft;

.field private closeDraftConflict:Z

.field private closeError:Ljava/lang/String;

.field private compactMapControls:Landroid/widget/LinearLayout;

.field private coordinateHint:Landroid/widget/TextView;

.field private current:I

.field private disposed:Z

.field private expected:Ljava/lang/String;

.field private featureId:Ljava/lang/String;

.field private geometryChecking:Z

.field private geometryConfirmation:Lorg/rabochaya/projects/GeometryConfirmationDraft;

.field private geometryConfirmationDialog:Landroid/app/AlertDialog;

.field private geometryConfirmationError:Ljava/lang/String;

.field private heading:Landroid/widget/TextView;

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

.field private partChoice:Lorg/rabochaya/projects/GeometryPartChoiceDraft;

.field private partChoiceChecking:Z

.field private partChoiceDialog:Landroid/app/AlertDialog;

.field private partChoiceError:Ljava/lang/String;

.field private parts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/GeometryEdits$Part;",
            ">;"
        }
    .end annotation
.end field

.field private pendingClose:Lorg/rabochaya/projects/GeometryCloseDraft;

.field private pendingCloseError:Ljava/lang/String;

.field private pendingGeometryConfirmation:Lorg/rabochaya/projects/GeometryConfirmationDraft;

.field private pendingGeometryError:Ljava/lang/String;

.field private pendingMapUndo:Lorg/rabochaya/projects/GeometryMapUndoDraft;

.field private pendingPartChoice:Lorg/rabochaya/projects/GeometryPartChoiceDraft;

.field private pendingPartChoiceError:Ljava/lang/String;

.field private pendingVertex:Lorg/rabochaya/projects/VertexEditDraft;

.field private preferredKey:Ljava/lang/String;

.field private project:J

.field private restoreHoleDeletion:Z

.field private restoreMap:Z

.field private restoreSelection:I

.field private root:Landroid/widget/LinearLayout;

.field private save:Landroid/widget/Button;

.field private selecting:Z

.field private selector:Landroid/widget/Spinner;

.field private stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

.field private status:Landroid/widget/TextView;

.field private vertexDialog:Landroid/app/AlertDialog;

.field private vertexDraft:Lorg/rabochaya/projects/VertexEditDraft;

.field private vertexError:Landroid/widget/TextView;

.field private vertexInput:Landroid/widget/EditText;

.field private vertexLayoutCleanup:Ljava/lang/Runnable;

.field private final worker:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 15
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/GeometryEditorActivity;->VERTEX_SESSION:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 14
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 17
    const-string v0, ""

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeError:Ljava/lang/String;

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingCloseError:Ljava/lang/String;

    .line 18
    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceError:Ljava/lang/String;

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingPartChoiceError:Ljava/lang/String;

    .line 20
    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationError:Ljava/lang/String;

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingGeometryError:Ljava/lang/String;

    .line 36
    const/4 v1, -0x1

    iput v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreSelection:I

    .line 41
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    iput-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->worker:Ljava/util/concurrent/ExecutorService;

    .line 43
    iput v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    .line 44
    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->base:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lorg/rabochaya/projects/GeometryEditorActivity;Landroid/view/View;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexFont(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$100(Lorg/rabochaya/projects/GeometryEditorActivity;)Z
    .locals 0

    .line 14
    iget-boolean p0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selecting:Z

    return p0
.end method

.method static synthetic access$1000(Lorg/rabochaya/projects/GeometryEditorActivity;)Lorg/rabochaya/projects/GeometryMapCanvas;
    .locals 0

    .line 14
    iget-object p0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    return-object p0
.end method

.method static synthetic access$102(Lorg/rabochaya/projects/GeometryEditorActivity;Z)Z
    .locals 0

    .line 14
    iput-boolean p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selecting:Z

    return p1
.end method

.method static synthetic access$1100(Lorg/rabochaya/projects/GeometryEditorActivity;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->clearNotice()V

    return-void
.end method

.method static synthetic access$1200(Lorg/rabochaya/projects/GeometryEditorActivity;)Lorg/rabochaya/projects/GeometryMapState;
    .locals 0

    .line 14
    iget-object p0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    return-object p0
.end method

.method static synthetic access$1300(Lorg/rabochaya/projects/GeometryEditorActivity;)Landroid/widget/EditText;
    .locals 0

    .line 14
    iget-object p0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    return-object p0
.end method

.method static synthetic access$1400(Lorg/rabochaya/projects/GeometryEditorActivity;)Z
    .locals 0

    .line 14
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->persist()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1500(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/lang/String;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMessage(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1600(Lorg/rabochaya/projects/GeometryEditorActivity;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->requestMapDeletion(I)V

    return-void
.end method

.method static synthetic access$200(Lorg/rabochaya/projects/GeometryEditorActivity;)I
    .locals 0

    .line 14
    iget p0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    return p0
.end method

.method static synthetic access$300(Lorg/rabochaya/projects/GeometryEditorActivity;)Z
    .locals 0

    .line 14
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->dirty()Z

    move-result p0

    return p0
.end method

.method static synthetic access$400(Lorg/rabochaya/projects/GeometryEditorActivity;)Landroid/widget/Spinner;
    .locals 0

    .line 14
    iget-object p0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    return-object p0
.end method

.method static synthetic access$500(Lorg/rabochaya/projects/GeometryEditorActivity;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->requestPartChoice(I)V

    return-void
.end method

.method static synthetic access$600(Lorg/rabochaya/projects/GeometryEditorActivity;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->choosePart(I)V

    return-void
.end method

.method static synthetic access$700(Lorg/rabochaya/projects/GeometryEditorActivity;Z)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    return-void
.end method

.method static synthetic access$800(Lorg/rabochaya/projects/GeometryEditorActivity;)Z
    .locals 0

    .line 14
    iget-boolean p0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    return p0
.end method

.method static synthetic access$900(Lorg/rabochaya/projects/GeometryEditorActivity;)Z
    .locals 0

    .line 14
    iget-boolean p0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    return p0
.end method

.method private actions()V
    .locals 9

    .line 61
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    .line 62
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-eqz v0, :cond_0

    const-string v0, "\u041e\u0442\u043c\u0435\u043d\u0438\u0442\u044c \u0443\u0434\u0430\u043b\u0435\u043d\u0438\u0435 \u043a\u043e\u043d\u0442\u0443\u0440\u0430"

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 63
    :cond_0
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    if-nez v0, :cond_1

    iget-boolean v0, v3, Lorg/rabochaya/projects/GeometryEdits$Part;->polygon:Z

    if-eqz v0, :cond_1

    iget-boolean v0, v3, Lorg/rabochaya/projects/GeometryEdits$Part;->hole:Z

    if-nez v0, :cond_1

    const-string v0, "\u0414\u043e\u0431\u0430\u0432\u0438\u0442\u044c \u0432\u043d\u0443\u0442\u0440\u0435\u043d\u043d\u0438\u0439 \u043a\u043e\u043d\u0442\u0443\u0440"

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    :cond_1
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    if-nez v0, :cond_2

    iget-boolean v0, v3, Lorg/rabochaya/projects/GeometryEdits$Part;->hole:Z

    if-eqz v0, :cond_2

    const-string v0, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0432\u043d\u0443\u0442\u0440\u0435\u043d\u043d\u0438\u0439 \u043a\u043e\u043d\u0442\u0443\u0440"

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    :cond_2
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez v0, :cond_3

    const-string v0, "\u0420\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u0432\u0435\u0440\u0448\u0438\u043d\u044b"

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    :cond_3
    :goto_0
    const-string v0, "\u041a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u0432\u0432\u043e\u0434"

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v0, "\u041f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0442\u044c \u043e\u0431\u044a\u0435\u043a\u0442"

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u0414\u0435\u0439\u0441\u0442\u0432\u0438\u044f \u0441 \u043a\u043e\u043d\u0442\u0443\u0440\u043e\u043c"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {v2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, [Ljava/lang/CharSequence;

    new-instance v8, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda7;

    move-object v0, v8

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda7;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/util/List;Lorg/rabochaya/projects/GeometryEdits$Part;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v7, v8}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 68
    return-void
.end method

.method private applyVertex(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/widget/EditText;)Z
    .locals 8

    .line 93
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lorg/rabochaya/projects/GeometryEditorActivity;->applyVertex(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/widget/EditText;Landroid/widget/TextView;)Z

    move-result p1

    return p1
.end method

.method private applyVertex(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/widget/EditText;Landroid/widget/TextView;)Z
    .locals 2

    .line 95
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    const/4 v1, 0x0

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 96
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

    .line 97
    :catch_0
    move-exception p1

    if-eqz p7, :cond_1

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p7, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p7, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_1
    if-eqz p6, :cond_2

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p6, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_2
    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return v1

    .line 95
    :cond_3
    :goto_1
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string p2, "\u0412\u0432\u043e\u0434 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f; \u0432\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u0432\u0435\u0440\u0448\u0438\u043d\u0443 \u0437\u0430\u043d\u043e\u0432\u043e"

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return v1
.end method

.method private boundedConfirmationError(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 117
    if-nez p1, :cond_0

    const-string p1, ""

    goto :goto_0

    :cond_0
    const/16 v0, 0x800

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method private build(Lorg/rabochaya/projects/GeometryDraft;Ljava/lang/String;)V
    .locals 8

    .line 171
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDraftConflict:Z

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDecisionComplete:Z

    .line 172
    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->removeAllViews()V

    const-string v1, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b \u0438 \u043a\u043e\u043d\u0442\u0443\u0440\u044b"

    const/16 v2, 0x15

    invoke-direct {p0, v1, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->heading:Landroid/widget/TextView;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->heading:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->compactMapControls:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->compactMapControls:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->compactMapControls:Landroid/widget/LinearLayout;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->compactMapControls:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x42400000    # 48.0f

    invoke-static {p0, v4}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v4

    const/4 v5, -0x1

    invoke-direct {v3, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/Spinner;

    invoke-direct {v1, p0}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    invoke-virtual {v1, v5}, Landroid/widget/Spinner;->setBackgroundColor(I)V

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    const-string v2, "\u0412\u044b\u0431\u043e\u0440 \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u0438 \u0438 \u043a\u043e\u043d\u0442\u0443\u0440\u0430"

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    new-array v2, v1, [Ljava/lang/String;

    move v3, v0

    :goto_0
    if-ge v3, v1, :cond_0

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v4, v4, Lorg/rabochaya/projects/GeometryEdits$Part;->name:Ljava/lang/String;

    aput-object v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    new-instance v1, Lorg/rabochaya/projects/GeometryEditorActivity$1;

    const v3, 0x1090008

    invoke-direct {v1, p0, p0, v3, v2}, Lorg/rabochaya/projects/GeometryEditorActivity$1;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Landroid/content/Context;I[Ljava/lang/String;)V

    const v2, 0x1090009

    invoke-virtual {v1, v2}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    invoke-virtual {v2, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 173
    const-string v1, "WGS 84: \u0448\u0438\u0440\u043e\u0442\u0430 \u0434\u043e\u043b\u0433\u043e\u0442\u0430 [\u0432\u044b\u0441\u043e\u0442\u0430], \u043e\u0434\u043d\u0430 \u0432\u0435\u0440\u0448\u0438\u043d\u0430 \u0432 \u0441\u0442\u0440\u043e\u043a\u0435"

    const/16 v2, 0xc

    invoke-direct {p0, v1, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->coordinateHint:Landroid/widget/TextView;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->coordinateHint:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 174
    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    new-instance v3, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda12;

    invoke-direct {v3, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda12;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v4, "\u0420\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u043d\u0430 \u043a\u0430\u0440\u0442\u0435"

    invoke-direct {p0, v1, v4, v3}, Lorg/rabochaya/projects/GeometryEditorActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mode:Landroid/widget/Button;

    .line 175
    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    const v3, -0xdfdfe0

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setTextColor(I)V

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v1, v5}, Landroid/widget/EditText;->setBackgroundColor(I)V

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    const/16 v3, 0x33

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setGravity(I)V

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    const v3, 0xa0001

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setInputType(I)V

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setSaveEnabled(Z)V

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    const/4 v3, 0x1

    new-array v4, v3, [Landroid/text/InputFilter;

    new-instance v6, Landroid/text/InputFilter$LengthFilter;

    const v7, 0x7a120

    invoke-direct {v6, v7}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v6, v4, v0

    invoke-virtual {v1, v4}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->body:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->body:Landroid/widget/FrameLayout;

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v6, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v4, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->body:Landroid/widget/FrameLayout;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v6, v5, v0, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 176
    const-string v1, ""

    invoke-direct {p0, v1, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x42580000    # 54.0f

    invoke-static {p0, v6}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v6

    invoke-direct {v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 177
    new-instance v2, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda13;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda13;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v4, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c"

    invoke-direct {p0, v1, v4, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->save:Landroid/widget/Button;

    new-instance v2, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda14;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda14;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v4, "\u0414\u0435\u0439\u0441\u0442\u0432\u0438\u044f"

    invoke-direct {p0, v1, v4, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->more:Landroid/widget/Button;

    new-instance v2, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda15;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda15;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v4, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    invoke-direct {p0, v1, v4, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->close:Landroid/widget/Button;

    move v2, v0

    :goto_1
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    if-ge v2, v4, :cond_1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v0, v5, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 178
    :cond_1
    iput v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    if-eqz p1, :cond_2

    iget-object v1, p1, Lorg/rabochaya/projects/GeometryDraft;->key:Ljava/lang/String;

    goto :goto_2

    :cond_2
    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->preferredKey:Ljava/lang/String;

    :goto_2
    if-eqz v1, :cond_4

    move v2, v0

    :goto_3
    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_4

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v4, v4, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    iput v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    goto :goto_4

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 179
    :cond_4
    :goto_4
    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapViewport:[D

    iput-boolean v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selecting:Z

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    iget v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-virtual {v2, v4}, Landroid/widget/Spinner;->setSelection(I)V

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selecting:Z

    iget v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->showPart(I)V

    iget-boolean v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreMap:Z

    if-eqz v2, :cond_5

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapViewport:[D

    .line 180
    :cond_5
    if-eqz p1, :cond_8

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v2, v1, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object v4, p1, Lorg/rabochaya/projects/GeometryDraft;->key:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    iget-object v4, p1, Lorg/rabochaya/projects/GeometryDraft;->text:Ljava/lang/String;

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p1, Lorg/rabochaya/projects/GeometryDraft;->token:Ljava/lang/String;

    iput-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-boolean v2, p1, Lorg/rabochaya/projects/GeometryDraft;->addingHole:Z

    iput-boolean v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    iget-object v4, p1, Lorg/rabochaya/projects/GeometryDraft;->token:Ljava/lang/String;

    iget-object v1, v1, Lorg/rabochaya/projects/GeometryEdits$Part;->token:Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    const-string v1, "\u0412\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a"

    goto :goto_5

    :cond_6
    const-string v1, "\u0413\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0430\u0441\u044c; \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d. \u041f\u0435\u0440\u0435\u0434 \u0437\u0430\u043f\u0438\u0441\u044c\u044e \u043f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0439\u0442\u0435 \u043e\u0431\u044a\u0435\u043a\u0442"

    :goto_5
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_6

    :cond_7
    iput-boolean v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    iget-object v2, p1, Lorg/rabochaya/projects/GeometryDraft;->text:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p1, Lorg/rabochaya/projects/GeometryDraft;->token:Ljava/lang/String;

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v2, "\u041a\u043e\u043d\u0442\u0443\u0440 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a\u0430 \u0431\u043e\u043b\u044c\u0448\u0435 \u043d\u0435 \u043d\u0430\u0439\u0434\u0435\u043d. \u0412\u0432\u043e\u0434 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d; \u043c\u043e\u0436\u043d\u043e \u0441\u043a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u0435\u0433\u043e \u0438\u043b\u0438 \u043f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0442\u044c \u043e\u0431\u044a\u0435\u043a\u0442"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 181
    :cond_8
    :goto_6
    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_9

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 182
    :cond_9
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    new-instance p2, Lorg/rabochaya/projects/GeometryEditorActivity$2;

    invoke-direct {p2, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$2;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    invoke-virtual {p1, p2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    invoke-direct {p0, v3}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreMap:Z

    if-eqz p1, :cond_a

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez p1, :cond_a

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreMap:Z

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->openMap()V

    :cond_a
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->fitMapControls()V

    const/4 p1, 0x0

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingMapUndo:Lorg/rabochaya/projects/GeometryMapUndoDraft;

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreVertexEditor()V

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreGeometryConfirmation()V

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->restorePartChoice()V

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreClose()V

    .line 183
    return-void
.end method

.method private button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .locals 3

    .line 58
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

    new-instance p1, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda37;

    invoke-direct {p1, p0, p3}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda37;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method private cancelStagedHoleDeletion()V
    .locals 2

    .line 122
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u0423\u0434\u0430\u043b\u0435\u043d\u0438\u0435 \u043a\u043e\u043d\u0442\u0443\u0440\u0430 \u043e\u0442\u043c\u0435\u043d\u0435\u043d\u043e; \u043f\u0440\u043e\u0435\u043a\u0442 \u043d\u0435 \u0438\u0437\u043c\u0435\u043d\u0451\u043d"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private choiceTarget(Lorg/rabochaya/projects/GeometryPartChoiceDraft;)I
    .locals 3

    .line 101
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v1, v1, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object v2, p1, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->targetKey:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method private choosePart(I)V
    .locals 1

    .line 185
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

.method private clearClose(Landroid/app/AlertDialog;)V
    .locals 1

    .line 242
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDialog:Landroid/app/AlertDialog;

    if-eq v0, p1, :cond_0

    return-void

    :cond_0
    const/4 p1, 0x0

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDialog:Landroid/app/AlertDialog;

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDraft:Lorg/rabochaya/projects/GeometryCloseDraft;

    const-string p1, ""

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeError:Ljava/lang/String;

    return-void
.end method

.method private clearGeometryConfirmation(Landroid/app/AlertDialog;)V
    .locals 1

    .line 124
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationDialog:Landroid/app/AlertDialog;

    if-eq v0, p1, :cond_0

    return-void

    :cond_0
    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryChecking:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryChecking:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmation:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationDialog:Landroid/app/AlertDialog;

    const-string v0, ""

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationError:Ljava/lang/String;

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez p1, :cond_1

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    :cond_1
    return-void
.end method

.method private clearNotice()V
    .locals 1

    .line 221
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->notice:Landroid/widget/Toast;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->notice:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->notice:Landroid/widget/Toast;

    :cond_0
    return-void
.end method

.method private clearPartChoice(Landroid/app/AlertDialog;)V
    .locals 1

    .line 105
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceDialog:Landroid/app/AlertDialog;

    if-eq v0, p1, :cond_0

    return-void

    :cond_0
    const/4 p1, 0x0

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceDialog:Landroid/app/AlertDialog;

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoice:Lorg/rabochaya/projects/GeometryPartChoiceDraft;

    const-string p1, ""

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceError:Ljava/lang/String;

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceChecking:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceChecking:Z

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez p1, :cond_1

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    :cond_1
    return-void
.end method

.method private clearVertexEditor(Landroid/app/AlertDialog;)V
    .locals 1

    .line 152
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexDialog:Landroid/app/AlertDialog;

    if-ne v0, p1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexLayoutCleanup:Ljava/lang/Runnable;

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexLayoutCleanup:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexLayoutCleanup:Ljava/lang/Runnable;

    :cond_0
    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexDraft:Lorg/rabochaya/projects/VertexEditDraft;

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexInput:Landroid/widget/EditText;

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexError:Landroid/widget/TextView;

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexDialog:Landroid/app/AlertDialog;

    :cond_1
    return-void
.end method

.method private closeFailure(Lorg/rabochaya/projects/GeometryCloseDraft;Landroid/app/AlertDialog;Ljava/lang/String;)V
    .locals 1

    .line 244
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDraft:Lorg/rabochaya/projects/GeometryCloseDraft;

    if-ne v0, p1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDialog:Landroid/app/AlertDialog;

    if-eq p1, p2, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->boundedConfirmationError(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeError:Ljava/lang/String;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c \u0432\u0432\u043e\u0434 \u043a\u0430\u043a \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u0438 \u0437\u0430\u043a\u0440\u044b\u0442\u044c \u0440\u0435\u0434\u0430\u043a\u0442\u043e\u0440?\n\n"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeError:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    invoke-virtual {p2}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexFont(Landroid/view/View;)V

    const/4 p1, -0x1

    invoke-virtual {p2, p1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p1

    const/4 p3, 0x0

    invoke-virtual {p1, p3}, Landroid/widget/Button;->setEnabled(Z)V

    const/4 p1, -0x3

    invoke-virtual {p2, p1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p1

    invoke-virtual {p1, p3}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method private closeMatches(Lorg/rabochaya/projects/GeometryCloseDraft;)Z
    .locals 13

    .line 241
    if-eqz p1, :cond_1

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    if-eqz v0, :cond_1

    iget v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    if-ltz v0, :cond_1

    iget v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-wide v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    sget-object v5, Lorg/rabochaya/projects/GeometryEditorActivity;->VERTEX_SESSION:Ljava/lang/String;

    iget-object v6, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object v7, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-object v8, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    iget-boolean v9, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->hole:Z

    iget-boolean v10, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    iget-boolean v11, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    move-object v1, p1

    invoke-virtual/range {v1 .. v12}, Lorg/rabochaya/projects/GeometryCloseDraft;->matches(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZLjava/lang/String;)Z

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method private confirmClose(Lorg/rabochaya/projects/GeometryCloseDraft;Landroid/app/AlertDialog;Z)V
    .locals 6

    .line 247
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez v0, :cond_6

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-nez v0, :cond_6

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDraft:Lorg/rabochaya/projects/GeometryCloseDraft;

    if-ne v0, p1, :cond_6

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDialog:Landroid/app/AlertDialog;

    if-eq v0, p2, :cond_0

    goto/16 :goto_1

    :cond_0
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->closeMatches(Lorg/rabochaya/projects/GeometryCloseDraft;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string p3, "\u0418\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u0432\u0432\u043e\u0434 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f. \u0417\u0430\u043a\u0440\u044b\u0442\u0438\u0435 \u0437\u0430\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u0430\u043d\u043e."

    invoke-direct {p0, p1, p2, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->closeFailure(Lorg/rabochaya/projects/GeometryCloseDraft;Landroid/app/AlertDialog;Ljava/lang/String;)V

    return-void

    :cond_1
    :try_start_0
    const-class v0, Lorg/rabochaya/projects/GeometryDraft;

    monitor-enter v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->drafts()Ljava/io/File;

    move-result-object v1

    iget-wide v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    invoke-static {v1, v2, v3, v4}, Lorg/rabochaya/projects/GeometryDraft;->load(Ljava/io/File;JLjava/lang/String;)Lorg/rabochaya/projects/GeometryDraft;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;

    invoke-direct {p0, v1, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->samePrivateDraft(Lorg/rabochaya/projects/GeometryDraft;Lorg/rabochaya/projects/GeometryDraft;)Z

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_2

    iput-boolean v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDraftConflict:Z

    const-string p3, "\u0411\u043e\u043b\u0435\u0435 \u043d\u043e\u0432\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u043e\u0441\u0442\u0430\u0432\u043b\u0435\u043d. \u041f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0439\u0442\u0435 \u043e\u0431\u044a\u0435\u043a\u0442."

    invoke-direct {p0, p1, p2, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->closeFailure(Lorg/rabochaya/projects/GeometryCloseDraft;Landroid/app/AlertDialog;Ljava/lang/String;)V

    monitor-exit v0

    return-void

    :cond_2
    if-eqz p3, :cond_4

    iget-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;

    if-eqz p3, :cond_3

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->drafts()Ljava/io/File;

    move-result-object p3

    iget-wide v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;

    invoke-static {p3, v3, v4, v1, v5}, Lorg/rabochaya/projects/GeometryDraft;->discardIfMatches(Ljava/io/File;JLjava/lang/String;Lorg/rabochaya/projects/GeometryDraft;)Z

    move-result p3

    if-nez p3, :cond_3

    iput-boolean v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDraftConflict:Z

    const-string p3, "\u0411\u043e\u043b\u0435\u0435 \u043d\u043e\u0432\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u043e\u0441\u0442\u0430\u0432\u043b\u0435\u043d. \u041f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0439\u0442\u0435 \u043e\u0431\u044a\u0435\u043a\u0442."

    invoke-direct {p0, p1, p2, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->closeFailure(Lorg/rabochaya/projects/GeometryCloseDraft;Landroid/app/AlertDialog;Ljava/lang/String;)V

    monitor-exit v0

    return-void

    :cond_3
    const/4 p3, 0x0

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;

    goto :goto_0

    :cond_4
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->persist()Z

    move-result p3

    if-nez p3, :cond_5

    iget-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p3

    invoke-interface {p3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->closeFailure(Lorg/rabochaya/projects/GeometryCloseDraft;Landroid/app/AlertDialog;Ljava/lang/String;)V

    monitor-exit v0

    return-void

    :cond_5
    :goto_0
    iput-boolean v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDecisionComplete:Z

    invoke-direct {p0, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->clearClose(Landroid/app/AlertDialog;)V

    invoke-virtual {p2}, Landroid/app/AlertDialog;->dismiss()V

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->finish()V

    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception p3

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p3
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p3

    invoke-virtual {p3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->closeFailure(Lorg/rabochaya/projects/GeometryCloseDraft;Landroid/app/AlertDialog;Ljava/lang/String;)V

    :cond_6
    :goto_1
    return-void
.end method

.method private confirmGeometryDeletion(Lorg/rabochaya/projects/GeometryConfirmationDraft;Landroid/app/AlertDialog;)V
    .locals 3

    .line 133
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmation:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-ne v0, p1, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationDialog:Landroid/app/AlertDialog;

    if-eq v0, p2, :cond_0

    goto :goto_0

    .line 134
    :cond_0
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationMatches(Lorg/rabochaya/projects/GeometryConfirmationDraft;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    const-string v0, "\u0413\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f \u0438\u043b\u0438 \u0438\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u0432\u0432\u043e\u0434 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0438\u0441\u044c. \u041f\u043e\u0434\u0442\u0432\u0435\u0440\u0436\u0434\u0435\u043d\u0438\u0435 \u0437\u0430\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u0430\u043d\u043e."

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationError(Lorg/rabochaya/projects/GeometryConfirmationDraft;Landroid/app/AlertDialog;Ljava/lang/String;Z)V

    return-void

    .line 135
    :cond_1
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->persist()Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationError(Lorg/rabochaya/projects/GeometryConfirmationDraft;Landroid/app/AlertDialog;Ljava/lang/String;Z)V

    return-void

    .line 136
    :cond_2
    iput-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryChecking:Z

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    const/4 v0, -0x1

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 137
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;

    invoke-direct {v1, p0, p1, p2}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Lorg/rabochaya/projects/GeometryConfirmationDraft;Landroid/app/AlertDialog;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 143
    return-void

    .line 133
    :cond_3
    :goto_0
    return-void
.end method

.method private confirmPartChoice(Lorg/rabochaya/projects/GeometryPartChoiceDraft;Landroid/app/AlertDialog;)V
    .locals 3

    .line 109
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceChecking:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoice:Lorg/rabochaya/projects/GeometryPartChoiceDraft;

    if-ne v0, p1, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceDialog:Landroid/app/AlertDialog;

    if-eq v0, p2, :cond_0

    goto :goto_0

    .line 110
    :cond_0
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceMatches(Lorg/rabochaya/projects/GeometryPartChoiceDraft;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    const-string v0, "\u0413\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f \u0438\u043b\u0438 \u0438\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u0432\u0432\u043e\u0434 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0438\u0441\u044c. \u0421\u043c\u0435\u043d\u0430 \u043a\u043e\u043d\u0442\u0443\u0440\u0430 \u0437\u0430\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u0430\u043d\u0430."

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceFailure(Lorg/rabochaya/projects/GeometryPartChoiceDraft;Landroid/app/AlertDialog;Ljava/lang/String;Z)V

    return-void

    .line 111
    :cond_1
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->persist()Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceFailure(Lorg/rabochaya/projects/GeometryPartChoiceDraft;Landroid/app/AlertDialog;Ljava/lang/String;Z)V

    return-void

    :cond_2
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;

    iput-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceChecking:Z

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    const/4 v1, -0x1

    invoke-virtual {p2, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 112
    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0, p1, p2, v0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda4;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Lorg/rabochaya/projects/GeometryPartChoiceDraft;Landroid/app/AlertDialog;Lorg/rabochaya/projects/GeometryDraft;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 115
    return-void

    .line 109
    :cond_3
    :goto_0
    return-void
.end method

.method private dirty()Z
    .locals 1

    .line 219
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-nez v0, :cond_1

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->textDirty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private discardReload()V
    .locals 3

    .line 223
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u041f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0442\u044c \u043e\u0431\u044a\u0435\u043a\u0442 \u0438 \u0443\u0434\u0430\u043b\u0438\u0442\u044c \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u044d\u0442\u043e\u0433\u043e \u043e\u0431\u044a\u0435\u043a\u0442\u0430?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda21;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda21;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

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

    .line 49
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "geometry-drafts"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private enabled(Z)V
    .locals 6

    .line 59
    xor-int/lit8 v0, p1, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    const/4 v0, 0x2

    new-array v1, v0, [Landroid/view/View;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->more:Landroid/widget/Button;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->close:Landroid/widget/Button;

    const/4 v4, 0x1

    aput-object v2, v1, v4

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
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    if-eqz p1, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-nez v1, :cond_2

    move v1, v4

    goto :goto_1

    :cond_2
    move v1, v3

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setEnabled(Z)V

    :cond_3
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    if-eqz p1, :cond_4

    iget-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez v1, :cond_4

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-nez v1, :cond_4

    move v1, v4

    goto :goto_2

    :cond_4
    move v1, v3

    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setEnabled(Z)V

    :cond_5
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->save:Landroid/widget/Button;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->save:Landroid/widget/Button;

    if-eqz p1, :cond_7

    iget-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez v1, :cond_7

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationMatches(Lorg/rabochaya/projects/GeometryConfirmationDraft;)Z

    move-result v1

    if-eqz v1, :cond_7

    :cond_6
    move v1, v4

    goto :goto_3

    :cond_7
    move v1, v3

    :goto_3
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_8
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mode:Landroid/widget/Button;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mode:Landroid/widget/Button;

    if-eqz p1, :cond_9

    iget-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez v1, :cond_9

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-nez v1, :cond_9

    move v1, v4

    goto :goto_4

    :cond_9
    move v1, v3

    :goto_4
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_a
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    if-eqz p1, :cond_b

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez p1, :cond_b

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-nez p1, :cond_b

    move v3, v4

    :cond_b
    invoke-virtual {v0, v3}, Lorg/rabochaya/projects/GeometryMapCanvas;->setEditingEnabled(Z)V

    :cond_c
    return-void
.end method

.method private fitMapControls()V
    .locals 8

    .line 189
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->compactMapControls:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->heading:Landroid/widget/TextView;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->coordinateHint:Landroid/widget/TextView;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mode:Landroid/widget/Button;

    if-nez v0, :cond_0

    goto/16 :goto_4

    .line 190
    :cond_0
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v1

    .line 191
    :goto_0
    const/4 v2, -0x1

    if-eqz v0, :cond_2

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    invoke-virtual {v3}, Landroid/widget/Spinner;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->compactMapControls:Landroid/widget/LinearLayout;

    if-eq v3, v4, :cond_2

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    invoke-virtual {v3}, Landroid/widget/Spinner;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mode:Landroid/widget/Button;

    invoke-virtual {v3}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mode:Landroid/widget/Button;

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->compactMapControls:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v5, v1, v2, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->compactMapControls:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mode:Landroid/widget/Button;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v1, v2, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1

    .line 192
    :cond_2
    if-nez v0, :cond_3

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    invoke-virtual {v3}, Landroid/widget/Spinner;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->compactMapControls:Landroid/widget/LinearLayout;

    if-ne v3, v4, :cond_3

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->compactMapControls:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->compactMapControls:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mode:Landroid/widget/Button;

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->coordinateHint:Landroid/widget/TextView;

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v5

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    invoke-direct {v6, v2, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mode:Landroid/widget/Button;

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->body:Landroid/widget/FrameLayout;

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v5

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v2, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 193
    :cond_3
    :goto_1
    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->compactMapControls:Landroid/widget/LinearLayout;

    const/16 v3, 0x8

    if-eqz v0, :cond_4

    move v4, v1

    goto :goto_2

    :cond_4
    move v4, v3

    :goto_2
    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->heading:Landroid/widget/TextView;

    if-eqz v0, :cond_5

    move v4, v3

    goto :goto_3

    :cond_5
    move v4, v1

    :goto_3
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->coordinateHint:Landroid/widget/TextView;

    if-eqz v0, :cond_6

    move v1, v3

    :cond_6
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    const/high16 v1, 0x41400000    # 12.0f

    invoke-static {p0, v1}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v2

    if-eqz v0, :cond_7

    const/high16 v1, 0x40000000    # 2.0f

    :cond_7
    invoke-static {p0, v1}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v0

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2, v0, v2, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 194
    return-void

    .line 189
    :cond_8
    :goto_4
    return-void
.end method

.method private fitVertexDialog(Landroid/app/AlertDialog;Landroid/widget/TextView;)V
    .locals 16

    .line 151
    move-object/from16 v13, p0

    invoke-virtual/range {p1 .. p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v14

    const v0, 0x102002b

    invoke-virtual {v14, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v7, Ljava/util/LinkedHashMap;

    invoke-direct {v7}, Ljava/util/LinkedHashMap;-><init>()V

    if-eqz v0, :cond_0

    invoke-direct {v13, v0, v7}, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexPaddings(Landroid/view/View;Ljava/util/Map;)V

    :cond_0
    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "topPanel"

    const-string v2, "id"

    const-string v3, "android"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v14, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "buttonPanel"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v14, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v5

    filled-new-array {v1, v2, v3, v5}, [I

    move-result-object v1

    invoke-interface {v7, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    if-nez v4, :cond_2

    const/16 v0, 0x8

    goto :goto_0

    :cond_2
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v0

    :goto_0
    move v5, v0

    invoke-virtual/range {p1 .. p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v11, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    invoke-virtual/range {p1 .. p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v12, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    invoke-virtual {v14}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v10

    const v0, 0x1010031

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-virtual {v13, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    const v1, -0x50506

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v9

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    const/4 v0, 0x1

    new-array v3, v0, [Z

    aput-boolean v2, v3, v2

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v15

    new-instance v8, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda19;

    move-object v0, v8

    move-object/from16 v1, p0

    move-object v2, v14

    move-object/from16 v6, p2

    move-object v13, v8

    move-object/from16 v8, p1

    invoke-direct/range {v0 .. v12}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda19;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Landroid/view/View;[ZLandroid/view/View;ILandroid/widget/TextView;Ljava/util/Map;Landroid/app/AlertDialog;ILandroid/graphics/drawable/Drawable;II)V

    invoke-virtual {v14}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, v13}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    invoke-virtual {v15}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, v13}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda20;

    invoke-direct {v0, v14, v13, v15}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda20;-><init>(Landroid/view/View;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Landroid/view/View;)V

    move-object v2, v13

    iput-object v0, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexLayoutCleanup:Ljava/lang/Runnable;

    invoke-interface {v2}, Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;->onGlobalLayout()V

    return-void
.end method

.method private geometryConfirmationError(Lorg/rabochaya/projects/GeometryConfirmationDraft;Landroid/app/AlertDialog;Ljava/lang/String;Z)V
    .locals 2

    .line 125
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmation:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-ne v0, p1, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationDialog:Landroid/app/AlertDialog;

    if-eq v0, p2, :cond_0

    goto :goto_2

    :cond_0
    invoke-direct {p0, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->boundedConfirmationError(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationError:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationMessage(Lorg/rabochaya/projects/GeometryConfirmationDraft;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationError:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, ""

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\n\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationError:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    const/4 p3, -0x1

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p3

    if-nez p4, :cond_2

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationMatches(Lorg/rabochaya/projects/GeometryConfirmationDraft;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-nez p1, :cond_2

    const/4 p1, 0x1

    goto :goto_1

    :cond_2
    const/4 p1, 0x0

    :goto_1
    invoke-virtual {p3, p1}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p2}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexFont(Landroid/view/View;)V

    :cond_3
    :goto_2
    return-void
.end method

.method private geometryConfirmationMatches(Lorg/rabochaya/projects/GeometryConfirmationDraft;)Z
    .locals 14

    .line 120
    const/4 v0, 0x0

    if-eqz p1, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    if-eqz v1, :cond_2

    iget v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    if-ltz v1, :cond_2

    iget v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    iget-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-boolean v2, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->onMap:Z

    if-eqz v2, :cond_1

    iget-boolean v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v2}, Lorg/rabochaya/projects/GeometryMapState;->selected()I

    move-result v2

    iget v3, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->index:I

    if-ne v2, v3, :cond_2

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v2}, Lorg/rabochaya/projects/GeometryMapState;->text()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-object v3, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->token:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-wide v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v6, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    sget-object v7, Lorg/rabochaya/projects/GeometryEditorActivity;->VERTEX_SESSION:Ljava/lang/String;

    iget-object v8, v1, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object v9, v1, Lorg/rabochaya/projects/GeometryEdits$Part;->token:Ljava/lang/String;

    iget-object v10, v1, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    iget-boolean v11, v1, Lorg/rabochaya/projects/GeometryEdits$Part;->hole:Z

    iget-boolean v12, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    move-object v3, p1

    invoke-virtual/range {v3 .. v13}, Lorg/rabochaya/projects/GeometryConfirmationDraft;->matches(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 v0, 0x1

    :cond_2
    :goto_0
    return v0
.end method

.method private geometryConfirmationMessage(Lorg/rabochaya/projects/GeometryConfirmationDraft;)Ljava/lang/String;
    .locals 2

    .line 121
    iget-boolean v0, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->onMap:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u0443\u044e \u0432\u0435\u0440\u0448\u0438\u043d\u0443 \u0438\u0437 \u0442\u0435\u043a\u0443\u0449\u0435\u0433\u043e \u0432\u0432\u043e\u0434\u0430?\n\n\u0412\u0435\u0440\u0448\u0438\u043d\u0430 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget p1, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->index:I

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    :goto_0
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_0
    iget-object v0, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->kind:Ljava/lang/String;

    const-string v1, "hole"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0442\u043e\u043b\u044c\u043a\u043e \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0439 \u0432\u043d\u0443\u0442\u0440\u0435\u043d\u043d\u0438\u0439 \u043a\u043e\u043d\u0442\u0443\u0440? \u041e\u0441\u0442\u0430\u043b\u044c\u043d\u0430\u044f \u043e\u0431\u043b\u0430\u0441\u0442\u044c \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u0435\u0442\u0441\u044f.\n\n\u0423\u0434\u0430\u043b\u0435\u043d\u0438\u0435 \u0431\u0443\u0434\u0435\u0442 \u0437\u0430\u043f\u0438\u0441\u0430\u043d\u043e \u0442\u043e\u043b\u044c\u043a\u043e \u043a\u043d\u043e\u043f\u043a\u043e\u0439 \u00ab\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c\u00bb."

    goto :goto_1

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0432\u0435\u0440\u0448\u0438\u043d\u0443 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget p1, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->index:I

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " \u0438\u0437 \u0442\u0435\u043a\u0443\u0449\u0435\u0433\u043e \u0432\u0432\u043e\u0434\u0430?"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    goto :goto_0

    :goto_1
    return-object p1
.end method

.method private label(Ljava/lang/String;I)Landroid/widget/TextView;
    .locals 1

    .line 57
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

.method static synthetic lambda$fitVertexDialog$17(Landroid/view/View;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;Landroid/view/View;)V
    .locals 1

    .line 151
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-virtual {p2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_1
    return-void
.end method

.method private load()V
    .locals 2

    .line 160
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

    .line 161
    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041e\u0442\u043a\u0440\u044b\u0442\u0438\u0435 \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u0438\u2026"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 162
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda11;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda11;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 169
    return-void
.end method

.method private mapMessage(Ljava/lang/String;)V
    .locals 3

    .line 216
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

    .line 222
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

    .line 47
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

    .line 48
    return-void
.end method

.method private openClose(Lorg/rabochaya/projects/GeometryCloseDraft;Ljava/lang/String;)V
    .locals 3

    .line 245
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    goto/16 :goto_1

    :cond_0
    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDraft:Lorg/rabochaya/projects/GeometryCloseDraft;

    invoke-direct {p0, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->boundedConfirmationError(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeError:Ljava/lang/String;

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->closeMatches(Lorg/rabochaya/projects/GeometryCloseDraft;)Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeError:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_1

    const-string p2, "\u0418\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u0432\u0432\u043e\u0434 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f. \u0417\u0430\u043a\u0440\u044b\u0442\u0438\u0435 \u0437\u0430\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u0430\u043d\u043e; \u043e\u0442\u043c\u0435\u043d\u0438\u0442\u0435 \u043f\u043e\u0434\u0442\u0432\u0435\u0440\u0436\u0434\u0435\u043d\u0438\u0435."

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeError:Ljava/lang/String;

    :cond_1
    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c \u0432\u0432\u043e\u0434 \u043a\u0430\u043a \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u0438 \u0437\u0430\u043a\u0440\u044b\u0442\u044c \u0440\u0435\u0434\u0430\u043a\u0442\u043e\u0440?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeError:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, ""

    goto :goto_0

    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\n\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeError:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const-string v0, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda32;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda32;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v2, "\u041f\u0440\u043e\u0434\u043e\u043b\u0436\u0438\u0442\u044c \u0440\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u0435"

    invoke-virtual {p2, v2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const-string v0, "\u041e\u0442\u043c\u0435\u043d\u0438\u0442\u044c \u0432\u0432\u043e\u0434"

    invoke-virtual {p2, v0, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p2

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDialog:Landroid/app/AlertDialog;

    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda33;

    invoke-direct {v0, p0, p2}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda33;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda34;

    invoke-direct {v0, p0, p2, p1}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda34;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Landroid/app/AlertDialog;Lorg/rabochaya/projects/GeometryCloseDraft;)V

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {p2}, Landroid/app/AlertDialog;->show()V

    :cond_3
    :goto_1
    return-void
.end method

.method private openGeometryConfirmation(Lorg/rabochaya/projects/GeometryConfirmationDraft;Ljava/lang/String;)V
    .locals 4

    .line 127
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez v0, :cond_5

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationDialog:Landroid/app/AlertDialog;

    if-nez v0, :cond_5

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexDialog:Landroid/app/AlertDialog;

    if-nez v0, :cond_5

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-eqz v0, :cond_0

    goto/16 :goto_2

    :cond_0
    iget-wide v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    sget-object v3, Lorg/rabochaya/projects/GeometryEditorActivity;->VERTEX_SESSION:Ljava/lang/String;

    invoke-virtual {p1, v0, v1, v2, v3}, Lorg/rabochaya/projects/GeometryConfirmationDraft;->inSession(JLjava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string p2, "\u0427\u0443\u0436\u043e\u0435 \u043d\u0430\u043c\u0435\u0440\u0435\u043d\u0438\u0435 \u0443\u0434\u0430\u043b\u0435\u043d\u0438\u044f \u043e\u0442\u043a\u043b\u043e\u043d\u0435\u043d\u043e"

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 128
    :cond_1
    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmation:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    invoke-direct {p0, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->boundedConfirmationError(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationError:Ljava/lang/String;

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationMatches(Lorg/rabochaya/projects/GeometryConfirmationDraft;)Z

    move-result p2

    if-nez p2, :cond_2

    const-string p2, "\u0413\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f \u0438\u043b\u0438 \u0438\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u0432\u0432\u043e\u0434 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0438\u0441\u044c. \u041f\u043e\u0434\u0442\u0432\u0435\u0440\u0436\u0434\u0435\u043d\u0438\u0435 \u0437\u0430\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u0430\u043d\u043e; \u043e\u0442\u043c\u0435\u043d\u0438\u0442\u0435 \u0435\u0433\u043e \u0438 \u0432\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u0434\u0435\u0439\u0441\u0442\u0432\u0438\u0435 \u0437\u0430\u043d\u043e\u0432\u043e."

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationError:Ljava/lang/String;

    .line 129
    :cond_2
    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationMessage(Lorg/rabochaya/projects/GeometryConfirmationDraft;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationError:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, ""

    goto :goto_0

    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\n\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationError:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    iget-object v0, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->kind:Ljava/lang/String;

    const-string v1, "hole"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u043a\u043e\u043d\u0442\u0443\u0440"

    goto :goto_1

    :cond_4
    const-string v0, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c"

    :goto_1
    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda38;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda38;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-virtual {p2, v1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p2

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationDialog:Landroid/app/AlertDialog;

    .line 130
    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda39;

    invoke-direct {v0, p0, p2}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda39;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda40;

    invoke-direct {v0, p0, p2, p1}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda40;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Landroid/app/AlertDialog;Lorg/rabochaya/projects/GeometryConfirmationDraft;)V

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {p2}, Landroid/app/AlertDialog;->show()V

    .line 131
    return-void

    .line 127
    :cond_5
    :goto_2
    return-void
.end method

.method private openMap()V
    .locals 14

    .line 200
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-nez v0, :cond_9

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez v0, :cond_9

    iget v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    if-gez v0, :cond_0

    goto/16 :goto_3

    .line 202
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

    move-result-object v13

    .line 203
    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingMapUndo:Lorg/rabochaya/projects/GeometryMapUndoDraft;

    const/4 v2, 0x0

    iput-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingMapUndo:Lorg/rabochaya/projects/GeometryMapUndoDraft;

    if-eqz v1, :cond_2

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-wide v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    sget-object v6, Lorg/rabochaya/projects/GeometryEditorActivity;->VERTEX_SESSION:Ljava/lang/String;

    iget-object v7, v2, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object v8, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-object v9, v2, Lorg/rabochaya/projects/GeometryEdits$Part;->token:Ljava/lang/String;

    iget-boolean v10, v2, Lorg/rabochaya/projects/GeometryEdits$Part;->hole:Z

    iget-boolean v11, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    move-wide v2, v3

    move-object v4, v5

    move-object v5, v6

    move-object v6, v7

    move-object v7, v8

    move-object v8, v9

    move-object v9, v0

    move-object v12, v13

    invoke-virtual/range {v1 .. v12}, Lorg/rabochaya/projects/GeometryMapUndoDraft;->restore(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object v1

    if-eqz v1, :cond_2

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    .line 204
    :cond_2
    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v1}, Lorg/rabochaya/projects/GeometryMapState;->text()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    iget-object v1, v1, Lorg/rabochaya/projects/GeometryMapState;->type:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    iget-boolean v1, v1, Lorg/rabochaya/projects/GeometryMapState;->incompleteAllowed:Z

    iget-boolean v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    if-eq v1, v2, :cond_4

    :cond_3
    new-instance v1, Lorg/rabochaya/projects/GeometryMapState;

    iget-boolean v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    invoke-direct {v1, v13, v0, v2}, Lorg/rabochaya/projects/GeometryMapState;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    .line 205
    :cond_4
    const/4 v0, 0x0

    move v1, v0

    :goto_1
    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v2}, Lorg/rabochaya/projects/GeometryMapState;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ge v1, v2, :cond_6

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v2, v1}, Lorg/rabochaya/projects/GeometryMapState;->point(I)[D

    move-result-object v2

    aget-wide v3, v2, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    const-wide v4, 0x40554345b1a57f00L    # 85.05112878

    cmpl-double v2, v2, v4

    if-gtz v2, :cond_5

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u042d\u0442\u0430 \u043a\u0430\u0440\u0442\u0430 \u043e\u0442\u043e\u0431\u0440\u0430\u0436\u0430\u0435\u0442 \u0448\u0438\u0440\u043e\u0442\u044b \u0434\u043e \u00b185.05112878\u00b0. \u0414\u043b\u044f \u043f\u043e\u043b\u044f\u0440\u043d\u044b\u0445 \u0432\u0435\u0440\u0448\u0438\u043d \u0438\u0441\u043f\u043e\u043b\u044c\u0437\u0443\u0439\u0442\u0435 \u0441\u043f\u0438\u0441\u043e\u043a \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 206
    :cond_6
    iget v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreSelection:I

    if-ltz v1, :cond_7

    iget v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreSelection:I

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v2}, Lorg/rabochaya/projects/GeometryMapState;->size()I

    move-result v2

    if-ge v1, v2, :cond_7

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    iget v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreSelection:I

    invoke-virtual {v1, v2}, Lorg/rabochaya/projects/GeometryMapState;->select(I)V

    :cond_7
    const/4 v1, -0x1

    iput v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreSelection:I

    .line 207
    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->clearFocus()V

    const-string v2, "input_method"

    invoke-virtual {p0, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/inputmethod/InputMethodManager;

    if-eqz v2, :cond_8

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getWindowToken()Landroid/os/IBinder;

    move-result-object v4

    invoke-virtual {v2, v4, v0}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 208
    :cond_8
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

    new-instance v13, Lorg/rabochaya/projects/GeometryEditorActivity$3;

    invoke-direct {v13, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$3;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    move-object v4, v0

    move-object v5, p0

    invoke-direct/range {v4 .. v13}, Lorg/rabochaya/projects/GeometryMapCanvas;-><init>(Landroid/app/Activity;JLorg/rabochaya/projects/GeometryMapState;Ljava/util/List;Ljava/lang/String;Z[DLorg/rabochaya/projects/GeometryMapCanvas$Listener;)V

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    .line 213
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

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->fitMapControls()V

    const-string v0, "\u041a\u043e\u0441\u043d\u0438\u0442\u0435\u0441\u044c \u0432\u0435\u0440\u0448\u0438\u043d\u044b \u0438 \u043f\u0435\u0440\u0435\u0442\u0430\u0449\u0438\u0442\u0435. \u0421\u0432\u043e\u0431\u043e\u0434\u043d\u043e\u0435 \u043c\u0435\u0441\u0442\u043e \u2014 \u043f\u0435\u0440\u0435\u043c\u0435\u0449\u0435\u043d\u0438\u0435 \u043a\u0430\u0440\u0442\u044b, \u0434\u0432\u0430 \u043f\u0430\u043b\u044c\u0446\u0430 \u2014 \u043c\u0430\u0441\u0448\u0442\u0430\u0431"

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMessage(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 214
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

    .line 215
    :goto_2
    return-void

    .line 200
    :cond_9
    :goto_3
    return-void
.end method

.method private openPartChoice(Lorg/rabochaya/projects/GeometryPartChoiceDraft;Ljava/lang/String;)V
    .locals 3

    .line 107
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    goto/16 :goto_1

    :cond_0
    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoice:Lorg/rabochaya/projects/GeometryPartChoiceDraft;

    invoke-direct {p0, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->boundedConfirmationError(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceError:Ljava/lang/String;

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceMatches(Lorg/rabochaya/projects/GeometryPartChoiceDraft;)Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceError:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_1

    const-string p2, "\u0413\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f \u0438\u043b\u0438 \u0438\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u0432\u0432\u043e\u0434 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0438\u0441\u044c. \u0421\u043c\u0435\u043d\u0430 \u043a\u043e\u043d\u0442\u0443\u0440\u0430 \u0437\u0430\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u0430\u043d\u0430."

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceError:Ljava/lang/String;

    :cond_1
    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u0421\u043c\u0435\u043d\u0438\u0442\u044c \u043a\u043e\u043d\u0442\u0443\u0440 \u0438 \u043e\u0442\u043c\u0435\u043d\u0438\u0442\u044c \u043d\u0435\u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u0439 \u0432\u0432\u043e\u0434?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceError:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, ""

    goto :goto_0

    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\n\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceError:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const-string v0, "\u0421\u043c\u0435\u043d\u0438\u0442\u044c \u043a\u043e\u043d\u0442\u0443\u0440"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda29;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda29;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v1, "\u041f\u0440\u043e\u0434\u043e\u043b\u0436\u0438\u0442\u044c \u0440\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u0435"

    invoke-virtual {p2, v1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p2

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceDialog:Landroid/app/AlertDialog;

    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda30;

    invoke-direct {v0, p0, p2}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda30;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda31;

    invoke-direct {v0, p0, p2, p1}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda31;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Landroid/app/AlertDialog;Lorg/rabochaya/projects/GeometryPartChoiceDraft;)V

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {p2}, Landroid/app/AlertDialog;->show()V

    :cond_3
    :goto_1
    return-void
.end method

.method private openVertexEditor(Lorg/rabochaya/projects/VertexEditDraft;)V
    .locals 10

    .line 154
    new-instance v4, Landroid/widget/EditText;

    invoke-direct {v4, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {v4, v0}, Landroid/widget/EditText;->setSingleLine(Z)V

    new-array v1, v0, [Landroid/text/InputFilter;

    new-instance v2, Landroid/text/InputFilter$LengthFilter;

    const/16 v3, 0x2000

    invoke-direct {v2, v3}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {v4, v1}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    invoke-virtual {v4}, Landroid/widget/EditText;->getImeOptions()I

    move-result v1

    const/high16 v2, 0x10000000

    or-int/2addr v1, v2

    const/high16 v2, 0x2000000

    or-int/2addr v1, v2

    invoke-virtual {v4, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    const-string v1, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b \u0432\u0435\u0440\u0448\u0438\u043d\u044b WGS 84"

    invoke-virtual {v4, v1}, Landroid/widget/EditText;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v1, p1, Lorg/rabochaya/projects/VertexEditDraft;->raw:Ljava/lang/String;

    invoke-virtual {v4, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v4, v3}, Landroid/widget/EditText;->setSelectAllOnFocus(Z)V

    .line 155
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4}, Landroid/widget/EditText;->getCurrentTextColor()I

    move-result v0

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v4}, Landroid/widget/EditText;->getCurrentTextColor()I

    move-result v0

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setTextColor(I)V

    const-string v0, "\u0428\u0438\u0440\u043e\u0442\u0430 \u0434\u043e\u043b\u0433\u043e\u0442\u0430 [\u0432\u044b\u0441\u043e\u0442\u0430], \u0440\u0430\u0437\u0434\u0435\u043b\u0438\u0442\u0435\u043b\u044c \u2014 \u043f\u0440\u043e\u0431\u0435\u043b"

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, -0x39d7d8

    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setTextColor(I)V

    const-string v0, "\u041e\u0448\u0438\u0431\u043a\u0430 \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442 \u0432\u0435\u0440\u0448\u0438\u043d\u044b"

    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v0, p1, Lorg/rabochaya/projects/VertexEditDraft;->error:Ljava/lang/String;

    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p1, Lorg/rabochaya/projects/VertexEditDraft;->error:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/16 v2, 0x8

    if-eqz v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v3

    :goto_0
    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setVisibility(I)V

    const-string v0, "\u0413\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f \u0438\u043b\u0438 \u0438\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u0432\u0432\u043e\u0434 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0438\u0441\u044c. \u041f\u0440\u0438\u043c\u0435\u043d\u0435\u043d\u0438\u0435 \u0437\u0430\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u0430\u043d\u043e; \u043e\u0442\u043c\u0435\u043d\u0438\u0442\u0435 \u0444\u043e\u0440\u043c\u0443 \u0438 \u0432\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u0432\u0435\u0440\u0448\u0438\u043d\u0443 \u0437\u0430\u043d\u043e\u0432\u043e."

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexMatches(Lorg/rabochaya/projects/VertexEditDraft;)Z

    move-result v0

    if-eqz v0, :cond_1

    move v3, v2

    :cond_1
    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 156
    iget-object v1, p1, Lorg/rabochaya/projects/VertexEditDraft;->operation:Ljava/lang/String;

    const-string v2, "replace"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "\u0418\u0437\u043c\u0435\u043d\u0438\u0442\u044c \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b"

    goto :goto_1

    :cond_2
    iget-object v1, p1, Lorg/rabochaya/projects/VertexEditDraft;->operation:Ljava/lang/String;

    const-string v2, "before"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "\u0412\u0441\u0442\u0430\u0432\u0438\u0442\u044c \u043f\u0435\u0440\u0435\u0434"

    goto :goto_1

    :cond_3
    const-string v1, "\u0412\u0441\u0442\u0430\u0432\u0438\u0442\u044c \u043f\u043e\u0441\u043b\u0435"

    :goto_1
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041f\u0440\u0438\u043c\u0435\u043d\u0438\u0442\u044c"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda24;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda24;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v2, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexDraft:Lorg/rabochaya/projects/VertexEditDraft;

    iput-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexInput:Landroid/widget/EditText;

    iput-object v7, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexError:Landroid/widget/TextView;

    iput-object v8, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexDialog:Landroid/app/AlertDialog;

    .line 157
    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda25;

    invoke-direct {v0, p0, v8}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda25;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {v8, v0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    new-instance v9, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda26;

    move-object v0, v9

    move-object v1, p0

    move-object v2, v8

    move-object v3, v5

    move-object v5, p1

    invoke-direct/range {v0 .. v7}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda26;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Landroid/app/AlertDialog;Landroid/widget/TextView;Landroid/widget/EditText;Lorg/rabochaya/projects/VertexEditDraft;Landroid/widget/TextView;Landroid/widget/TextView;)V

    invoke-virtual {v8, v9}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v8}, Landroid/app/AlertDialog;->show()V

    .line 158
    return-void
.end method

.method private partChoiceFailure(Lorg/rabochaya/projects/GeometryPartChoiceDraft;Landroid/app/AlertDialog;Ljava/lang/String;Z)V
    .locals 1

    .line 106
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoice:Lorg/rabochaya/projects/GeometryPartChoiceDraft;

    if-ne v0, p1, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceDialog:Landroid/app/AlertDialog;

    if-eq v0, p2, :cond_0

    goto :goto_1

    :cond_0
    invoke-direct {p0, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->boundedConfirmationError(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceError:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u0421\u043c\u0435\u043d\u0438\u0442\u044c \u043a\u043e\u043d\u0442\u0443\u0440 \u0438 \u043e\u0442\u043c\u0435\u043d\u0438\u0442\u044c \u043d\u0435\u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u0439 \u0432\u0432\u043e\u0434?\n\n"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceError:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    invoke-virtual {p2}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p3

    invoke-virtual {p3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p3

    invoke-direct {p0, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexFont(Landroid/view/View;)V

    const/4 p3, -0x1

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p2

    if-nez p4, :cond_1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceMatches(Lorg/rabochaya/projects/GeometryPartChoiceDraft;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-nez p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {p2, p1}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_2
    :goto_1
    return-void
.end method

.method private partChoiceMatches(Lorg/rabochaya/projects/GeometryPartChoiceDraft;)Z
    .locals 19

    .line 102
    move-object/from16 v0, p0

    const/4 v1, 0x0

    if-eqz p1, :cond_2

    iget-boolean v2, v0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez v2, :cond_2

    iget-object v2, v0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    if-eqz v2, :cond_2

    iget-object v2, v0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    if-eqz v2, :cond_2

    iget v2, v0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    if-ltz v2, :cond_2

    iget v2, v0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lt v2, v3, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct/range {p0 .. p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->choiceTarget(Lorg/rabochaya/projects/GeometryPartChoiceDraft;)I

    move-result v2

    if-gez v2, :cond_1

    return v1

    :cond_1
    iget-object v1, v0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v3, v0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-wide v3, v0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v5, v0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    sget-object v6, Lorg/rabochaya/projects/GeometryEditorActivity;->VERTEX_SESSION:Ljava/lang/String;

    iget-object v7, v1, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object v8, v0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-object v9, v1, Lorg/rabochaya/projects/GeometryEdits$Part;->token:Ljava/lang/String;

    iget-object v10, v1, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    iget-boolean v11, v1, Lorg/rabochaya/projects/GeometryEdits$Part;->hole:Z

    iget-boolean v12, v0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    iget-boolean v13, v0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    iget-object v1, v0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v14

    iget-object v15, v2, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object v1, v2, Lorg/rabochaya/projects/GeometryEdits$Part;->token:Ljava/lang/String;

    move-object/from16 v16, v1

    iget-object v1, v2, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    move-object/from16 v17, v1

    iget-boolean v1, v2, Lorg/rabochaya/projects/GeometryEdits$Part;->hole:Z

    move/from16 v18, v1

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v18}, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->matches(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    :cond_2
    :goto_0
    return v1
.end method

.method private persist()Z
    .locals 7

    .line 220
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDecisionComplete:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDraftConflict:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u0411\u043e\u043b\u0435\u0435 \u043d\u043e\u0432\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u043e\u0441\u0442\u0430\u0432\u043b\u0435\u043d. \u041f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0439\u0442\u0435 \u043e\u0431\u044a\u0435\u043a\u0442."

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return v2

    :cond_1
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-nez v0, :cond_6

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    :try_start_0
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->textDirty()Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;

    if-eqz v0, :cond_4

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->drafts()Ljava/io/File;

    move-result-object v0

    iget-wide v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    iget-object v6, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;

    invoke-static {v0, v3, v4, v5, v6}, Lorg/rabochaya/projects/GeometryDraft;->discardIfMatches(Ljava/io/File;JLjava/lang/String;Lorg/rabochaya/projects/GeometryDraft;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;

    goto :goto_0

    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u0411\u043e\u043b\u0435\u0435 \u043d\u043e\u0432\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u043e\u0441\u0442\u0430\u0432\u043b\u0435\u043d. \u041f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0439\u0442\u0435 \u043e\u0431\u044a\u0435\u043a\u0442"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    :goto_0
    return v1

    :cond_5
    new-instance v0, Lorg/rabochaya/projects/GeometryDraft;

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v3, v3, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    iget-boolean v6, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    invoke-direct {v0, v3, v4, v5, v6}, Lorg/rabochaya/projects/GeometryDraft;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->drafts()Ljava/io/File;

    move-result-object v3

    iget-wide v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v6, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    invoke-virtual {v0, v3, v4, v5, v6}, Lorg/rabochaya/projects/GeometryDraft;->save(Ljava/io/File;JLjava/lang/String;)V

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    :catch_0
    move-exception v0

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u0427\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u043d\u0435 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return v2

    :cond_6
    :goto_1
    return v1
.end method

.method private readClose(Landroid/os/Bundle;)Lorg/rabochaya/projects/GeometryCloseDraft;
    .locals 13

    .line 239
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    :try_start_0
    new-instance v12, Lorg/rabochaya/projects/GeometryCloseDraft;

    const-string v1, "project"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    const-string v1, "feature"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v1, "session"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v1, "key"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v1, "token"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v1, "type"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v1, "adding"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v9

    const-string v1, "map"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v10

    const-string v1, "stamp"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    move-object v1, v12

    invoke-direct/range {v1 .. v11}, Lorg/rabochaya/projects/GeometryCloseDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v12

    :catch_0
    move-exception p1

    return-object v0
.end method

.method private readGeometryConfirmation(Landroid/os/Bundle;)Lorg/rabochaya/projects/GeometryConfirmationDraft;
    .locals 16

    .line 118
    move-object/from16 v0, p1

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    :try_start_0
    new-instance v15, Lorg/rabochaya/projects/GeometryConfirmationDraft;

    const-string v2, "project"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v3

    const-string v2, "feature"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v2, "session"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v2, "key"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v2, "token"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v2, "mainStamp"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v2, "type"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v2, "kind"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v2, "adding"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v12

    const-string v2, "index"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v13

    const-string v2, "map"

    const/4 v14, 0x0

    invoke-virtual {v0, v2, v14}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v14

    move-object v2, v15

    invoke-direct/range {v2 .. v14}, Lorg/rabochaya/projects/GeometryConfirmationDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZIZ)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v15

    :catch_0
    move-exception v0

    return-object v1
.end method

.method private readPartChoice(Landroid/os/Bundle;)Lorg/rabochaya/projects/GeometryPartChoiceDraft;
    .locals 17

    .line 99
    move-object/from16 v0, p1

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    :try_start_0
    new-instance v16, Lorg/rabochaya/projects/GeometryPartChoiceDraft;

    const-string v2, "project"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v3

    const-string v2, "feature"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v2, "session"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v2, "sourceKey"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v2, "sourceToken"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v2, "sourceType"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v2, "adding"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v10

    const-string v2, "map"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v11

    const-string v2, "stamp"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v2, "targetKey"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v2, "targetToken"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v2, "targetType"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v2, v16

    invoke-direct/range {v2 .. v15}, Lorg/rabochaya/projects/GeometryPartChoiceDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v16

    :catch_0
    move-exception v0

    return-object v1
.end method

.method private readVertex(Landroid/os/Bundle;)Lorg/rabochaya/projects/VertexEditDraft;
    .locals 19

    .line 145
    move-object/from16 v0, p1

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    :try_start_0
    new-instance v18, Lorg/rabochaya/projects/VertexEditDraft;

    const-string v2, "project"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v3

    const-string v2, "feature"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v2, "session"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v2, "key"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v2, "token"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v2, "mainStamp"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v2, "type"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v2, "hole"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v11

    const-string v2, "index"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v12

    const-string v2, "operation"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v2, "raw"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v2, "start"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v15

    const-string v2, "end"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v16

    const-string v2, "error"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v2, v18

    invoke-direct/range {v2 .. v17}, Lorg/rabochaya/projects/VertexEditDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;Ljava/lang/String;IILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v18

    :catch_0
    move-exception v0

    return-object v1
.end method

.method private releaseMap()V
    .locals 1

    .line 186
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

.method private requestMapDeletion(I)V
    .locals 16

    .line 196
    move-object/from16 v1, p0

    iget-boolean v0, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez v0, :cond_1

    iget-boolean v0, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-nez v0, :cond_1

    iget-boolean v0, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-nez v0, :cond_1

    iget-boolean v0, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    if-eqz v0, :cond_1

    iget-object v0, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    if-eqz v0, :cond_1

    iget-object v0, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    if-eqz v0, :cond_1

    iget-object v0, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeometryMapState;->selected()I

    move-result v0

    move/from16 v13, p1

    if-ne v0, v13, :cond_1

    iget v0, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    if-gez v0, :cond_0

    goto :goto_1

    .line 197
    :cond_0
    iget-object v0, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v2, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/rabochaya/projects/GeometryEdits$Part;

    :try_start_0
    new-instance v15, Lorg/rabochaya/projects/GeometryConfirmationDraft;

    iget-wide v3, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v5, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    sget-object v6, Lorg/rabochaya/projects/GeometryEditorActivity;->VERTEX_SESSION:Ljava/lang/String;

    iget-object v7, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object v8, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-object v0, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/rabochaya/projects/VertexEditDraft;->stamp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iget-object v0, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    iget-object v10, v0, Lorg/rabochaya/projects/GeometryMapState;->type:Ljava/lang/String;

    const-string v11, "vertex"

    iget-boolean v12, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    const/4 v14, 0x1

    move-object v2, v15

    move/from16 v13, p1

    invoke-direct/range {v2 .. v14}, Lorg/rabochaya/projects/GeometryConfirmationDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZIZ)V

    const-string v0, ""

    invoke-direct {v1, v15, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->openGeometryConfirmation(Lorg/rabochaya/projects/GeometryConfirmationDraft;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v2, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 198
    :goto_0
    return-void

    .line 196
    :cond_1
    :goto_1
    return-void
.end method

.method private requestPartChoice(I)V
    .locals 18

    .line 103
    move-object/from16 v1, p0

    move/from16 v0, p1

    iget-boolean v2, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-nez v2, :cond_1

    iget-boolean v2, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez v2, :cond_1

    if-ltz v0, :cond_1

    iget-object v2, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    iget v2, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v2, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v3, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v3, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/rabochaya/projects/GeometryEdits$Part;

    :try_start_0
    new-instance v15, Lorg/rabochaya/projects/GeometryPartChoiceDraft;

    iget-wide v4, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v6, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    sget-object v7, Lorg/rabochaya/projects/GeometryEditorActivity;->VERTEX_SESSION:Ljava/lang/String;

    iget-object v8, v2, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object v9, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-object v10, v2, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    iget-boolean v11, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    iget-boolean v12, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    iget-object v2, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/rabochaya/projects/VertexEditDraft;->stamp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    iget-object v14, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object v2, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->token:Ljava/lang/String;

    iget-object v0, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    move-object v3, v15

    move-object/from16 v17, v15

    move-object v15, v2

    move-object/from16 v16, v0

    invoke-direct/range {v3 .. v16}, Lorg/rabochaya/projects/GeometryPartChoiceDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, ""

    move-object/from16 v2, v17

    invoke-direct {v1, v2, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->openPartChoice(Lorg/rabochaya/projects/GeometryPartChoiceDraft;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v2, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private restoreClose()V
    .locals 6

    .line 243
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingClose:Lorg/rabochaya/projects/GeometryCloseDraft;

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingClose:Lorg/rabochaya/projects/GeometryCloseDraft;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingCloseError:Ljava/lang/String;

    const-string v2, ""

    iput-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingCloseError:Ljava/lang/String;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-wide v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    sget-object v5, Lorg/rabochaya/projects/GeometryEditorActivity;->VERTEX_SESSION:Ljava/lang/String;

    invoke-virtual {v0, v2, v3, v4, v5}, Lorg/rabochaya/projects/GeometryCloseDraft;->inSession(JLjava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u0417\u0430\u043a\u0440\u044b\u0442\u0438\u0435 \u0434\u0440\u0443\u0433\u043e\u0433\u043e \u043e\u0431\u044a\u0435\u043a\u0442\u0430 \u0438\u043b\u0438 \u043f\u0440\u043e\u0446\u0435\u0441\u0441\u0430 \u043d\u0435 \u0432\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d\u043e"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_1
    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexDialog:Landroid/app/AlertDialog;

    if-nez v2, :cond_3

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationDialog:Landroid/app/AlertDialog;

    if-nez v2, :cond_3

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceDialog:Landroid/app/AlertDialog;

    if-eqz v2, :cond_2

    goto :goto_0

    :cond_2
    invoke-direct {p0, v0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->openClose(Lorg/rabochaya/projects/GeometryCloseDraft;Ljava/lang/String;)V

    return-void

    :cond_3
    :goto_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041e\u0434\u043d\u043e\u0432\u0440\u0435\u043c\u0435\u043d\u043d\u044b\u0435 \u0434\u0438\u0430\u043b\u043e\u0433\u0438 \u043d\u0435 \u0432\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d\u044b"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private restoreGeometryConfirmation()V
    .locals 7

    .line 123
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingGeometryConfirmation:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingGeometryConfirmation:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    iget-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreHoleDeletion:Z

    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreHoleDeletion:Z

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingGeometryError:Ljava/lang/String;

    const-string v3, ""

    iput-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingGeometryError:Ljava/lang/String;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-wide v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    sget-object v6, Lorg/rabochaya/projects/GeometryEditorActivity;->VERTEX_SESSION:Ljava/lang/String;

    invoke-virtual {v0, v3, v4, v5, v6}, Lorg/rabochaya/projects/GeometryConfirmationDraft;->inSession(JLjava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041f\u043e\u0434\u0442\u0432\u0435\u0440\u0436\u0434\u0435\u043d\u0438\u0435 \u0434\u0440\u0443\u0433\u043e\u0433\u043e \u043e\u0431\u044a\u0435\u043a\u0442\u0430 \u0438\u043b\u0438 \u043f\u0440\u043e\u0446\u0435\u0441\u0441\u0430 \u043d\u0435 \u0432\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d\u043e"

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_1
    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexDialog:Landroid/app/AlertDialog;

    if-eqz v3, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041e\u0434\u043d\u043e\u0432\u0440\u0435\u043c\u0435\u043d\u043d\u044b\u0435 \u0434\u0438\u0430\u043b\u043e\u0433\u0438 \u043d\u0435 \u0432\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d\u044b"

    goto :goto_0

    :cond_2
    if-eqz v1, :cond_5

    iget-object v1, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->kind:Ljava/lang/String;

    const-string v2, "hole"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u043e\u0435 \u043d\u0430\u043c\u0435\u0440\u0435\u043d\u0438\u0435 \u0443\u0434\u0430\u043b\u0435\u043d\u0438\u044f \u043e\u0442\u043a\u043b\u043e\u043d\u0435\u043d\u043e"

    goto :goto_0

    :cond_3
    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationMatches(Lorg/rabochaya/projects/GeometryConfirmationDraft;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "\u0423\u0434\u0430\u043b\u0435\u043d\u0438\u0435 \u043a\u043e\u043d\u0442\u0443\u0440\u0430 \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u043b\u0435\u043d\u043e. \u0414\u043b\u044f \u0437\u0430\u043f\u0438\u0441\u0438 \u043d\u0430\u0436\u043c\u0438\u0442\u0435 \u00ab\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c\u00bb"

    goto :goto_1

    :cond_4
    const-string v0, "\u0423\u0434\u0430\u043b\u0435\u043d\u0438\u0435 \u0437\u0430\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u0430\u043d\u043e: \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f \u0438\u043b\u0438 \u0432\u0432\u043e\u0434 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0438\u0441\u044c. \u041e\u0442\u043c\u0435\u043d\u0438\u0442\u0435 \u043d\u0430\u043c\u0435\u0440\u0435\u043d\u0438\u0435 \u0447\u0435\u0440\u0435\u0437 \u00ab\u0414\u0435\u0439\u0441\u0442\u0432\u0438\u044f\u00bb"

    :goto_1
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    :cond_5
    invoke-direct {p0, v0, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->openGeometryConfirmation(Lorg/rabochaya/projects/GeometryConfirmationDraft;Ljava/lang/String;)V

    :goto_2
    return-void
.end method

.method private restorePartChoice()V
    .locals 6

    .line 104
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingPartChoice:Lorg/rabochaya/projects/GeometryPartChoiceDraft;

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingPartChoice:Lorg/rabochaya/projects/GeometryPartChoiceDraft;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingPartChoiceError:Ljava/lang/String;

    const-string v2, ""

    iput-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingPartChoiceError:Ljava/lang/String;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-wide v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    sget-object v5, Lorg/rabochaya/projects/GeometryEditorActivity;->VERTEX_SESSION:Ljava/lang/String;

    invoke-virtual {v0, v2, v3, v4, v5}, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->inSession(JLjava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u0421\u043c\u0435\u043d\u0430 \u043a\u043e\u043d\u0442\u0443\u0440\u0430 \u0434\u0440\u0443\u0433\u043e\u0433\u043e \u043e\u0431\u044a\u0435\u043a\u0442\u0430 \u0438\u043b\u0438 \u043f\u0440\u043e\u0446\u0435\u0441\u0441\u0430 \u043d\u0435 \u0432\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d\u0430"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_1
    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexDialog:Landroid/app/AlertDialog;

    if-nez v2, :cond_3

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationDialog:Landroid/app/AlertDialog;

    if-eqz v2, :cond_2

    goto :goto_0

    :cond_2
    invoke-direct {p0, v0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->openPartChoice(Lorg/rabochaya/projects/GeometryPartChoiceDraft;Ljava/lang/String;)V

    return-void

    :cond_3
    :goto_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041e\u0434\u043d\u043e\u0432\u0440\u0435\u043c\u0435\u043d\u043d\u044b\u0435 \u0434\u0438\u0430\u043b\u043e\u0433\u0438 \u043d\u0435 \u0432\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d\u044b"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private restoreVertexEditor()V
    .locals 5

    .line 148
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingVertex:Lorg/rabochaya/projects/VertexEditDraft;

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingVertex:Lorg/rabochaya/projects/VertexEditDraft;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    iget-wide v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    sget-object v4, Lorg/rabochaya/projects/GeometryEditorActivity;->VERTEX_SESSION:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/rabochaya/projects/VertexEditDraft;->inSession(JLjava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u0412\u0432\u043e\u0434 \u0432\u0435\u0440\u0448\u0438\u043d\u044b \u0434\u0440\u0443\u0433\u043e\u0433\u043e \u043e\u0431\u044a\u0435\u043a\u0442\u0430 \u0438\u043b\u0438 \u043f\u0440\u043e\u0446\u0435\u0441\u0441\u0430 \u043d\u0435 \u0432\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_1
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->textMode()V

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->openVertexEditor(Lorg/rabochaya/projects/VertexEditDraft;)V

    :cond_2
    :goto_0
    return-void
.end method

.method private samePrivateDraft(Lorg/rabochaya/projects/GeometryDraft;Lorg/rabochaya/projects/GeometryDraft;)Z
    .locals 4

    .line 246
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p1, :cond_0

    if-nez p2, :cond_1

    :goto_0
    goto :goto_1

    :cond_0
    if-eqz p2, :cond_1

    iget-object v2, p1, Lorg/rabochaya/projects/GeometryDraft;->key:Ljava/lang/String;

    iget-object v3, p2, Lorg/rabochaya/projects/GeometryDraft;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p1, Lorg/rabochaya/projects/GeometryDraft;->token:Ljava/lang/String;

    iget-object v3, p2, Lorg/rabochaya/projects/GeometryDraft;->token:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p1, Lorg/rabochaya/projects/GeometryDraft;->text:Ljava/lang/String;

    iget-object v3, p2, Lorg/rabochaya/projects/GeometryDraft;->text:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-boolean p1, p1, Lorg/rabochaya/projects/GeometryDraft;->addingHole:Z

    iget-boolean p2, p2, Lorg/rabochaya/projects/GeometryDraft;->addingHole:Z

    if-ne p1, p2, :cond_1

    goto :goto_0

    :cond_1
    move v0, v1

    :goto_1
    return v0
.end method

.method private saveClose()Landroid/os/Bundle;
    .locals 5

    .line 240
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDraft:Lorg/rabochaya/projects/GeometryCloseDraft;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDraft:Lorg/rabochaya/projects/GeometryCloseDraft;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingClose:Lorg/rabochaya/projects/GeometryCloseDraft;

    :goto_0
    if-nez v0, :cond_1

    const/4 v0, 0x0

    return-object v0

    :cond_1
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "project"

    iget-wide v3, v0, Lorg/rabochaya/projects/GeometryCloseDraft;->project:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "feature"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryCloseDraft;->feature:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "session"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryCloseDraft;->session:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "key"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryCloseDraft;->key:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "token"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryCloseDraft;->token:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "type"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryCloseDraft;->type:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "adding"

    iget-boolean v3, v0, Lorg/rabochaya/projects/GeometryCloseDraft;->addingHole:Z

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "map"

    iget-boolean v3, v0, Lorg/rabochaya/projects/GeometryCloseDraft;->onMap:Z

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "stamp"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryCloseDraft;->mainStamp:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingClose:Lorg/rabochaya/projects/GeometryCloseDraft;

    if-ne v0, v2, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingCloseError:Ljava/lang/String;

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeError:Ljava/lang/String;

    :goto_1
    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->boundedConfirmationError(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "error"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method private saveGeometryConfirmation()Landroid/os/Bundle;
    .locals 5

    .line 119
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmation:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmation:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingGeometryConfirmation:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    :goto_0
    if-nez v0, :cond_2

    const/4 v0, 0x0

    return-object v0

    :cond_2
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "project"

    iget-wide v3, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->project:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "feature"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->feature:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "session"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->session:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "key"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->key:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "token"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->token:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "mainStamp"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->mainStamp:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "type"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->type:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "kind"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->kind:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "adding"

    iget-boolean v3, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->addingHole:Z

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "map"

    iget-boolean v3, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->onMap:Z

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "index"

    iget v3, v0, Lorg/rabochaya/projects/GeometryConfirmationDraft;->index:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-eq v0, v2, :cond_4

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingGeometryConfirmation:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-ne v0, v2, :cond_3

    iget-boolean v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreHoleDeletion:Z

    if-eqz v2, :cond_3

    goto :goto_1

    :cond_3
    const/4 v2, 0x0

    goto :goto_2

    :cond_4
    :goto_1
    const/4 v2, 0x1

    :goto_2
    const-string v3, "staged"

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingGeometryConfirmation:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-ne v0, v2, :cond_5

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingGeometryError:Ljava/lang/String;

    goto :goto_3

    :cond_5
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationError:Ljava/lang/String;

    :goto_3
    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->boundedConfirmationError(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "error"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method private savePartChoice()Landroid/os/Bundle;
    .locals 5

    .line 100
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoice:Lorg/rabochaya/projects/GeometryPartChoiceDraft;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoice:Lorg/rabochaya/projects/GeometryPartChoiceDraft;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingPartChoice:Lorg/rabochaya/projects/GeometryPartChoiceDraft;

    :goto_0
    if-nez v0, :cond_1

    const/4 v0, 0x0

    return-object v0

    :cond_1
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "project"

    iget-wide v3, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->project:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "feature"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->feature:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "session"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->session:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "sourceKey"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->sourceKey:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "sourceToken"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->sourceToken:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "sourceType"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->sourceType:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "adding"

    iget-boolean v3, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->addingHole:Z

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "map"

    iget-boolean v3, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->onMap:Z

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "stamp"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->mainStamp:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "targetKey"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->targetKey:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "targetToken"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->targetToken:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "targetType"

    iget-object v3, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->targetType:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingPartChoice:Lorg/rabochaya/projects/GeometryPartChoiceDraft;

    if-ne v0, v2, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingPartChoiceError:Ljava/lang/String;

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceError:Ljava/lang/String;

    :goto_1
    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->boundedConfirmationError(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "error"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method private saveVertex()Landroid/os/Bundle;
    .locals 6

    .line 146
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexDraft:Lorg/rabochaya/projects/VertexEditDraft;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingVertex:Lorg/rabochaya/projects/VertexEditDraft;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexDraft:Lorg/rabochaya/projects/VertexEditDraft;

    :goto_0
    if-nez v0, :cond_1

    const/4 v0, 0x0

    return-object v0

    :cond_1
    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexInput:Landroid/widget/EditText;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexInput:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexInput:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/4 v3, 0x0

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexInput:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexError:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/rabochaya/projects/VertexEditDraft;->withUi(Ljava/lang/String;IILjava/lang/String;)Lorg/rabochaya/projects/VertexEditDraft;

    move-result-object v0

    :cond_2
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "project"

    iget-wide v3, v0, Lorg/rabochaya/projects/VertexEditDraft;->project:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "feature"

    iget-object v3, v0, Lorg/rabochaya/projects/VertexEditDraft;->feature:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "session"

    iget-object v3, v0, Lorg/rabochaya/projects/VertexEditDraft;->session:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "key"

    iget-object v3, v0, Lorg/rabochaya/projects/VertexEditDraft;->key:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "token"

    iget-object v3, v0, Lorg/rabochaya/projects/VertexEditDraft;->token:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "mainStamp"

    iget-object v3, v0, Lorg/rabochaya/projects/VertexEditDraft;->mainStamp:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "type"

    iget-object v3, v0, Lorg/rabochaya/projects/VertexEditDraft;->type:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "hole"

    iget-boolean v3, v0, Lorg/rabochaya/projects/VertexEditDraft;->addingHole:Z

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "index"

    iget v3, v0, Lorg/rabochaya/projects/VertexEditDraft;->index:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "operation"

    iget-object v3, v0, Lorg/rabochaya/projects/VertexEditDraft;->operation:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "raw"

    iget-object v3, v0, Lorg/rabochaya/projects/VertexEditDraft;->raw:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "start"

    iget v3, v0, Lorg/rabochaya/projects/VertexEditDraft;->start:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "end"

    iget v3, v0, Lorg/rabochaya/projects/VertexEditDraft;->end:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "error"

    iget-object v0, v0, Lorg/rabochaya/projects/VertexEditDraft;->error:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method private showOrphanClose()V
    .locals 3

    .line 249
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c \u0432\u0432\u043e\u0434 \u043a\u0430\u043a \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u0438 \u0437\u0430\u043a\u0440\u044b\u0442\u044c \u0440\u0435\u0434\u0430\u043a\u0442\u043e\u0440?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v2, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041f\u0440\u043e\u0434\u043e\u043b\u0436\u0438\u0442\u044c \u0440\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u0435"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda6;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v2, "\u041e\u0442\u043c\u0435\u043d\u0438\u0442\u044c \u0432\u0432\u043e\u0434"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private showPart(I)V
    .locals 4

    .line 184
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->releaseMap()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapViewport:[D

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

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

.method private textDirty()Z
    .locals 3

    .line 218
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

.method private textMode()V
    .locals 4

    .line 187
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

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->fitMapControls()V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b \u0442\u0435\u043a\u0443\u0449\u0435\u0433\u043e \u0432\u0432\u043e\u0434\u0430. \u0414\u043b\u044f \u0437\u0430\u043f\u0438\u0441\u0438 \u043e\u0431\u044a\u0435\u043a\u0442\u0430 \u043d\u0430\u0436\u043c\u0438\u0442\u0435 \u00ab\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c\u00bb"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private vertexFont(Landroid/view/View;)V
    .locals 4

    .line 149
    instance-of v0, p1, Landroid/widget/TextView;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    move-object v0, p1

    check-cast v0, Landroid/widget/TextView;

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v3

    if-nez v3, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Typeface;->getStyle()I

    move-result v3

    :goto_0
    invoke-static {v2, v3}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/graphics/Typeface;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_1
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    check-cast p1, Landroid/view/ViewGroup;

    :goto_1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge v1, v0, :cond_2

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexFont(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method private vertexMatches(Lorg/rabochaya/projects/VertexEditDraft;)Z
    .locals 13

    .line 147
    iget v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    const/4 v1, 0x0

    if-ltz v0, :cond_2

    iget v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-object v3, p1, Lorg/rabochaya/projects/VertexEditDraft;->token:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-wide v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v6, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    sget-object v7, Lorg/rabochaya/projects/GeometryEditorActivity;->VERTEX_SESSION:Ljava/lang/String;

    iget-object v8, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object v9, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->token:Ljava/lang/String;

    iget-boolean v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    if-eqz v2, :cond_1

    const-string v0, "Polygon"

    goto :goto_0

    :cond_1
    iget-object v0, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    :goto_0
    move-object v10, v0

    iget-boolean v11, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    move-object v3, p1

    invoke-virtual/range {v3 .. v12}, Lorg/rabochaya/projects/VertexEditDraft;->matches(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 v1, 0x1

    :cond_2
    :goto_1
    return v1
.end method

.method private vertexPaddings(Landroid/view/View;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "[I>;)V"
        }
    .end annotation

    .line 150
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    filled-new-array {v0, v1, v2, v3}, [I

    move-result-object v0

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexPaddings(Landroid/view/View;Ljava/util/Map;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private vertices()V
    .locals 12

    .line 70
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v7, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-boolean v8, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    .line 71
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    if-eqz v0, :cond_0

    const-string v0, "Polygon"

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v0, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    :goto_0
    move-object v3, v0

    .line 73
    :try_start_0
    invoke-static {v5, v3}, Lorg/rabochaya/projects/GeometryVertices;->rows(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v0

    new-array v9, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v0, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v10, v1, 0x1

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v11, ". "

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v9, v1

    move v1, v10

    goto :goto_1

    .line 75
    :cond_1
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u0412\u0435\u0440\u0448\u0438\u043d\u044b: \u0448\u0438\u0440\u043e\u0442\u0430 \u0434\u043e\u043b\u0433\u043e\u0442\u0430 \u0432\u044b\u0441\u043e\u0442\u0430"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v10, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda35;

    move-object v1, v10

    move-object v2, p0

    invoke-direct/range {v1 .. v8}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda35;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lorg/rabochaya/projects/GeometryEdits$Part;Ljava/lang/String;Z)V

    invoke-virtual {v0, v9, v10}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 91
    const-string v1, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 92
    return-void

    .line 73
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

    .line 225
    iget v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    if-ltz v0, :cond_9

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-eqz v0, :cond_0

    goto/16 :goto_4

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-nez p1, :cond_2

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    move v4, v0

    goto :goto_1

    :cond_2
    :goto_0
    move v4, v1

    :goto_1
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationMatches(Lorg/rabochaya/projects/GeometryConfirmationDraft;)Z

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v0, "\u0423\u0434\u0430\u043b\u0435\u043d\u0438\u0435 \u0437\u0430\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u0430\u043d\u043e: \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f \u0438\u043b\u0438 \u0432\u0432\u043e\u0434 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0438\u0441\u044c"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    return-void

    :cond_3
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-virtual {p1}, Lorg/rabochaya/projects/GeometryMapCanvas;->cancelGesture()V

    :cond_4
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->notice:Landroid/widget/Toast;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->notice:Landroid/widget/Toast;

    invoke-virtual {p1}, Landroid/widget/Toast;->cancel()V

    const/4 p1, 0x0

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->notice:Landroid/widget/Toast;

    :cond_5
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    move-object v5, p1

    check-cast v5, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v6, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-boolean v7, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    .line 226
    if-nez v4, :cond_7

    if-eqz v7, :cond_6

    :try_start_0
    const-string p1, "Polygon"

    goto :goto_2

    :cond_6
    iget-object p1, v5, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    :goto_2
    invoke-static {v8, p1}, Lorg/rabochaya/projects/GeometryCoordinates;->parse(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

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

    .line 227
    :cond_7
    :goto_3
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->persist()Z

    move-result p1

    if-nez p1, :cond_8

    return-void

    :cond_8
    iget-object v9, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v0, "\u0421\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u0438\u0435 \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u0438\u2026"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 228
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda2;

    move-object v2, v0

    move-object v3, p0

    invoke-direct/range {v2 .. v9}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda2;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;ZLorg/rabochaya/projects/GeometryEdits$Part;Ljava/lang/String;ZLjava/lang/String;Lorg/rabochaya/projects/GeometryDraft;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 238
    return-void

    .line 225
    :cond_9
    :goto_4
    return-void
.end method


# virtual methods
.method synthetic lambda$actions$1$org-rabochaya-projects-GeometryEditorActivity(Ljava/util/List;Lorg/rabochaya/projects/GeometryEdits$Part;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 15

    .line 67
    move-object v1, p0

    move-object/from16 v0, p2

    move-object/from16 v2, p1

    move/from16 v3, p6

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "\u041e\u0442\u043c\u0435\u043d\u0438\u0442\u044c \u0443\u0434\u0430\u043b\u0435\u043d\u0438\u0435 \u043a\u043e\u043d\u0442\u0443\u0440\u0430"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->cancelStagedHoleDeletion()V

    goto/16 :goto_0

    :cond_0
    const-string v3, "\u0420\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u0442\u044c \u0432\u0435\u0440\u0448\u0438\u043d\u044b"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->textMode()V

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->vertices()V

    goto/16 :goto_0

    :cond_1
    const-string v3, "\u0414\u043e\u0431\u0430\u0432\u0438\u0442\u044c \u0432\u043d\u0443\u0442\u0440\u0435\u043d\u043d\u0438\u0439 \u043a\u043e\u043d\u0442\u0443\u0440"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->newHole()V

    goto :goto_0

    :cond_2
    const-string v3, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0432\u043d\u0443\u0442\u0440\u0435\u043d\u043d\u0438\u0439 \u043a\u043e\u043d\u0442\u0443\u0440"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->dirty()Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v0, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v2, "\u0421\u043d\u0430\u0447\u0430\u043b\u0430 \u0441\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u0435 \u0438\u043b\u0438 \u043e\u0442\u043c\u0435\u043d\u0438\u0442\u0435 \u0442\u0435\u043a\u0443\u0449\u0438\u0439 \u0432\u0432\u043e\u0434"

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_3
    :try_start_0
    new-instance v2, Lorg/rabochaya/projects/GeometryConfirmationDraft;

    iget-wide v4, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v6, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    sget-object v7, Lorg/rabochaya/projects/GeometryEditorActivity;->VERTEX_SESSION:Ljava/lang/String;

    iget-object v8, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    invoke-static/range {p4 .. p4}, Lorg/rabochaya/projects/VertexEditDraft;->stamp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iget-object v11, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    const-string v12, "hole"

    const/4 v13, 0x0

    const/4 v14, -0x1

    move-object v3, v2

    move-object/from16 v9, p3

    invoke-direct/range {v3 .. v14}, Lorg/rabochaya/projects/GeometryConfirmationDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V

    const-string v0, ""

    invoke-direct {p0, v2, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->openGeometryConfirmation(Lorg/rabochaya/projects/GeometryConfirmationDraft;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v2, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_4
    const-string v0, "\u041f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0442\u044c \u043e\u0431\u044a\u0435\u043a\u0442"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->discardReload()V

    goto :goto_0

    :cond_5
    const-string v0, "clipboard"

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    if-eqz v0, :cond_6

    iget-object v2, v1, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b WGS 84"

    invoke-static {v3, v2}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    :cond_6
    :goto_0
    return-void
.end method

.method synthetic lambda$build$26$org-rabochaya-projects-GeometryEditorActivity()V
    .locals 1

    .line 174
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->textMode()V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->openMap()V

    :goto_0
    return-void
.end method

.method synthetic lambda$build$27$org-rabochaya-projects-GeometryEditorActivity()V
    .locals 1

    .line 177
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->write(Z)V

    return-void
.end method

.method synthetic lambda$build$28$org-rabochaya-projects-GeometryEditorActivity()V
    .locals 0

    .line 177
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->actions()V

    return-void
.end method

.method synthetic lambda$build$29$org-rabochaya-projects-GeometryEditorActivity()V
    .locals 0

    .line 177
    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->onBackPressed()V

    return-void
.end method

.method synthetic lambda$button$0$org-rabochaya-projects-GeometryEditorActivity(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 58
    iget-boolean p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-nez p2, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method synthetic lambda$confirmGeometryDeletion$14$org-rabochaya-projects-GeometryEditorActivity(Lorg/rabochaya/projects/GeometryConfirmationDraft;Landroid/app/AlertDialog;Ljava/lang/String;)V
    .locals 8

    .line 138
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez v0, :cond_9

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmation:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-ne v0, p1, :cond_9

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationDialog:Landroid/app/AlertDialog;

    if-eq v0, p2, :cond_0

    goto/16 :goto_4

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryChecking:Z

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    if-nez p3, :cond_7

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationMatches(Lorg/rabochaya/projects/GeometryConfirmationDraft;)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_2

    .line 139
    :cond_1
    iget-object p3, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->kind:Ljava/lang/String;

    const-string v2, "vertex"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_6

    iget-boolean p3, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->onMap:Z

    if-eqz p3, :cond_4

    iget-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    if-eqz p3, :cond_3

    iget-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    iget v0, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->index:I

    invoke-virtual {p3, v0}, Lorg/rabochaya/projects/GeometryMapCanvas;->deleteConfirmed(I)Z

    move-result p3

    if-nez p3, :cond_2

    goto :goto_0

    :cond_2
    invoke-direct {p0, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->clearGeometryConfirmation(Landroid/app/AlertDialog;)V

    invoke-virtual {p2}, Landroid/app/AlertDialog;->dismiss()V

    return-void

    :cond_3
    :goto_0
    const-string p3, "\u0412\u044b\u0431\u0440\u0430\u043d\u043d\u0430\u044f \u0432\u0435\u0440\u0448\u0438\u043d\u0430 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0430\u0441\u044c. \u041f\u043e\u0434\u0442\u0432\u0435\u0440\u0436\u0434\u0435\u043d\u0438\u0435 \u0437\u0430\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u0430\u043d\u043e."

    invoke-direct {p0, p1, p2, p3, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationError(Lorg/rabochaya/projects/GeometryConfirmationDraft;Landroid/app/AlertDialog;Ljava/lang/String;Z)V

    return-void

    :cond_4
    iget-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->type:Ljava/lang/String;

    iget v4, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->index:I

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v5, "delete"

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lorg/rabochaya/projects/GeometryEditorActivity;->applyVertex(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/widget/EditText;)Z

    move-result p3

    if-nez p3, :cond_5

    iget-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p3

    invoke-interface {p3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationError(Lorg/rabochaya/projects/GeometryConfirmationDraft;Landroid/app/AlertDialog;Ljava/lang/String;Z)V

    return-void

    :cond_5
    invoke-direct {p0, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->clearGeometryConfirmation(Landroid/app/AlertDialog;)V

    invoke-virtual {p2}, Landroid/app/AlertDialog;->dismiss()V

    goto :goto_1

    .line 140
    :cond_6
    invoke-direct {p0, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->clearGeometryConfirmation(Landroid/app/AlertDialog;)V

    invoke-virtual {p2}, Landroid/app/AlertDialog;->dismiss()V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string p2, "\u0423\u0434\u0430\u043b\u0435\u043d\u0438\u0435 \u043a\u043e\u043d\u0442\u0443\u0440\u0430 \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u043b\u0435\u043d\u043e. \u0414\u043b\u044f \u0437\u0430\u043f\u0438\u0441\u0438 \u043d\u0430\u0436\u043c\u0438\u0442\u0435 \u00ab\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c\u00bb. \u0414\u043b\u044f \u043e\u0442\u043c\u0435\u043d\u044b \u2014 \u00ab\u0414\u0435\u0439\u0441\u0442\u0432\u0438\u044f\u00bb \u0438\u043b\u0438 \u00ab\u041d\u0430\u0437\u0430\u0434\u00bb"

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    :goto_1
    return-void

    .line 138
    :cond_7
    :goto_2
    if-eqz p3, :cond_8

    goto :goto_3

    :cond_8
    const-string p3, "\u0418\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u0432\u0432\u043e\u0434 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f. \u041f\u043e\u0434\u0442\u0432\u0435\u0440\u0436\u0434\u0435\u043d\u0438\u0435 \u0437\u0430\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u0430\u043d\u043e."

    :goto_3
    invoke-direct {p0, p1, p2, p3, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationError(Lorg/rabochaya/projects/GeometryConfirmationDraft;Landroid/app/AlertDialog;Ljava/lang/String;Z)V

    :cond_9
    :goto_4
    return-void
.end method

.method synthetic lambda$confirmGeometryDeletion$15$org-rabochaya-projects-GeometryEditorActivity(Lorg/rabochaya/projects/GeometryConfirmationDraft;Landroid/app/AlertDialog;)V
    .locals 7

    .line 137
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-wide v2, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->project:J

    invoke-virtual {v1, v2, v3}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v2

    iget-object v3, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->feature:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/rabochaya/projects/KmlProject;->byId(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-static {v2}, Lorg/rabochaya/projects/GeometryEdits;->parts(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v4, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->key:Ljava/lang/String;

    iget-object v5, v3, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->token:Ljava/lang/String;

    iget-object v5, v3, Lorg/rabochaya/projects/GeometryEdits$Part;->token:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->type:Ljava/lang/String;

    iget-object v5, v3, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-boolean v4, p1, Lorg/rabochaya/projects/GeometryConfirmationDraft;->hole:Z

    iget-boolean v3, v3, Lorg/rabochaya/projects/GeometryEdits$Part;->hole:Z

    if-ne v4, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    if-nez v2, :cond_2

    const-string v0, "\u0413\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0430\u0441\u044c \u0438\u043b\u0438 \u043e\u0431\u044a\u0435\u043a\u0442 \u0443\u0434\u0430\u043b\u0451\u043d. \u041f\u043e\u0434\u0442\u0432\u0435\u0440\u0436\u0434\u0435\u043d\u0438\u0435 \u0437\u0430\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u0430\u043d\u043e."
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :cond_2
    :goto_1
    invoke-virtual {v1}, Lorg/rabochaya/projects/ProjectStore;->close()V

    goto :goto_3

    :catch_0
    move-exception v0

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_4

    :catch_1
    move-exception v1

    move-object v6, v1

    move-object v1, v0

    move-object v0, v6

    :goto_2
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u0440\u043e\u0432\u0435\u0440\u0438\u0442\u044c \u0438\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u043e\u0431\u044a\u0435\u043a\u0442: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v1, :cond_3

    goto :goto_1

    .line 138
    :cond_3
    :goto_3
    new-instance v1, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda8;

    invoke-direct {v1, p0, p1, p2, v0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda8;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Lorg/rabochaya/projects/GeometryConfirmationDraft;Landroid/app/AlertDialog;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 142
    return-void

    .line 137
    :catchall_1
    move-exception p1

    move-object v0, v1

    :goto_4
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    :cond_4
    throw p1
.end method

.method synthetic lambda$confirmPartChoice$8$org-rabochaya-projects-GeometryEditorActivity(Lorg/rabochaya/projects/GeometryPartChoiceDraft;Landroid/app/AlertDialog;Ljava/lang/String;Lorg/rabochaya/projects/GeometryDraft;)V
    .locals 5

    .line 113
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez v0, :cond_5

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoice:Lorg/rabochaya/projects/GeometryPartChoiceDraft;

    if-ne v0, p1, :cond_5

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceDialog:Landroid/app/AlertDialog;

    if-eq v0, p2, :cond_0

    goto :goto_3

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceChecking:Z

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V

    if-nez p3, :cond_3

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceMatches(Lorg/rabochaya/projects/GeometryPartChoiceDraft;)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    if-eqz p4, :cond_2

    :try_start_0
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->drafts()Ljava/io/File;

    move-result-object p3

    iget-wide v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    invoke-static {p3, v2, v3, v4, p4}, Lorg/rabochaya/projects/GeometryDraft;->discardIfMatches(Ljava/io/File;JLjava/lang/String;Lorg/rabochaya/projects/GeometryDraft;)Z

    move-result p3

    if-nez p3, :cond_2

    const-string p3, "\u0411\u043e\u043b\u0435\u0435 \u043d\u043e\u0432\u044b\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u043e\u0441\u0442\u0430\u0432\u043b\u0435\u043d. \u041f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0439\u0442\u0435 \u043e\u0431\u044a\u0435\u043a\u0442."

    invoke-direct {p0, p1, p2, p3, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceFailure(Lorg/rabochaya/projects/GeometryPartChoiceDraft;Landroid/app/AlertDialog;Ljava/lang/String;Z)V

    return-void

    :cond_2
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->choiceTarget(Lorg/rabochaya/projects/GeometryPartChoiceDraft;)I

    move-result p3

    invoke-direct {p0, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->clearPartChoice(Landroid/app/AlertDialog;)V

    invoke-virtual {p2}, Landroid/app/AlertDialog;->dismiss()V

    const/4 p4, 0x0

    iput-object p4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->ownedDraft:Lorg/rabochaya/projects/GeometryDraft;

    invoke-direct {p0, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->choosePart(I)V

    iput-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selecting:Z

    iget-object p4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selector:Landroid/widget/Spinner;

    invoke-virtual {p4, p3}, Landroid/widget/Spinner;->setSelection(I)V

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->selecting:Z

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->enabled(Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p3

    invoke-virtual {p3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceFailure(Lorg/rabochaya/projects/GeometryPartChoiceDraft;Landroid/app/AlertDialog;Ljava/lang/String;Z)V

    :goto_0
    return-void

    :cond_3
    :goto_1
    if-eqz p3, :cond_4

    goto :goto_2

    :cond_4
    const-string p3, "\u0418\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u0432\u0432\u043e\u0434 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f. \u0421\u043c\u0435\u043d\u0430 \u043a\u043e\u043d\u0442\u0443\u0440\u0430 \u0437\u0430\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u0430\u043d\u0430."

    :goto_2
    invoke-direct {p0, p1, p2, p3, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceFailure(Lorg/rabochaya/projects/GeometryPartChoiceDraft;Landroid/app/AlertDialog;Ljava/lang/String;Z)V

    :cond_5
    :goto_3
    return-void
.end method

.method synthetic lambda$confirmPartChoice$9$org-rabochaya-projects-GeometryEditorActivity(Lorg/rabochaya/projects/GeometryPartChoiceDraft;Landroid/app/AlertDialog;Lorg/rabochaya/projects/GeometryDraft;)V
    .locals 10

    .line 112
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-wide v2, p1, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->project:J

    invoke-virtual {v1, v2, v3}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v2

    iget-object v3, p1, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->feature:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/rabochaya/projects/KmlProject;->byId(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    invoke-static {v2}, Lorg/rabochaya/projects/GeometryEdits;->parts(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v4, v3

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v6, p1, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->sourceKey:Ljava/lang/String;

    iget-object v7, v5, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    const/4 v7, 0x1

    if-eqz v6, :cond_1

    iget-object v6, p1, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->sourceToken:Ljava/lang/String;

    iget-object v8, v5, Lorg/rabochaya/projects/GeometryEdits$Part;->token:Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    iget-object v6, p1, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->sourceType:Ljava/lang/String;

    iget-object v8, v5, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    iget-boolean v6, p1, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->sourceHole:Z

    iget-boolean v8, v5, Lorg/rabochaya/projects/GeometryEdits$Part;->hole:Z

    if-ne v6, v8, :cond_1

    move v3, v7

    :cond_1
    iget-object v6, p1, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->targetKey:Ljava/lang/String;

    iget-object v8, v5, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, p1, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->targetToken:Ljava/lang/String;

    iget-object v8, v5, Lorg/rabochaya/projects/GeometryEdits$Part;->token:Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, p1, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->targetType:Ljava/lang/String;

    iget-object v8, v5, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    iget-boolean v6, p1, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->targetHole:Z

    iget-boolean v5, v5, Lorg/rabochaya/projects/GeometryEdits$Part;->hole:Z

    if-ne v6, v5, :cond_0

    move v4, v7

    goto :goto_0

    :cond_2
    move v4, v3

    :cond_3
    if-eqz v3, :cond_4

    if-nez v4, :cond_5

    :cond_4
    const-string v0, "\u0418\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u0438\u043b\u0438 \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0439 \u043a\u043e\u043d\u0442\u0443\u0440 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f. \u0421\u043c\u0435\u043d\u0430 \u043a\u043e\u043d\u0442\u0443\u0440\u0430 \u0437\u0430\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u0430\u043d\u0430."
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catch_0
    move-exception v0

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_1
    move-exception v1

    move-object v9, v1

    move-object v1, v0

    move-object v0, v9

    :goto_1
    :try_start_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u0440\u043e\u0432\u0435\u0440\u0438\u0442\u044c \u043a\u043e\u043d\u0442\u0443\u0440\u044b: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v1, :cond_6

    :cond_5
    :goto_2
    invoke-virtual {v1}, Lorg/rabochaya/projects/ProjectStore;->close()V

    .line 113
    :cond_6
    move-object v6, v0

    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda22;

    move-object v2, v0

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move-object v7, p3

    invoke-direct/range {v2 .. v7}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda22;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Lorg/rabochaya/projects/GeometryPartChoiceDraft;Landroid/app/AlertDialog;Ljava/lang/String;Lorg/rabochaya/projects/GeometryDraft;)V

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 114
    return-void

    .line 112
    :catchall_1
    move-exception p1

    move-object v0, v1

    :goto_3
    if-eqz v0, :cond_7

    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    :cond_7
    throw p1
.end method

.method synthetic lambda$discardReload$30$org-rabochaya-projects-GeometryEditorActivity(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 223
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

.method synthetic lambda$fitVertexDialog$16$org-rabochaya-projects-GeometryEditorActivity(Landroid/view/View;[ZLandroid/view/View;ILandroid/widget/TextView;Ljava/util/Map;Landroid/app/AlertDialog;ILandroid/graphics/drawable/Drawable;II)V
    .locals 12

    .line 151
    move-object v0, p3

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexFont(Landroid/view/View;)V

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->orientation:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x2

    if-ne v2, v5, :cond_0

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    const/high16 v2, 0x43480000    # 200.0f

    move-object v6, p0

    invoke-static {p0, v2}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v2

    if-ge v1, v2, :cond_1

    move v1, v3

    goto :goto_0

    :cond_0
    move-object v6, p0

    :cond_1
    move v1, v4

    :goto_0
    aget-boolean v2, p2, v4

    if-ne v1, v2, :cond_2

    return-void

    :cond_2
    aput-boolean v1, p2, v4

    const/16 v2, 0x8

    if-eqz v0, :cond_4

    if-eqz v1, :cond_3

    move v7, v2

    goto :goto_1

    :cond_3
    move/from16 v7, p4

    :goto_1
    invoke-virtual {p3, v7}, Landroid/view/View;->setVisibility(I)V

    :cond_4
    if-eqz v1, :cond_5

    goto :goto_2

    :cond_5
    move v2, v4

    :goto_2
    move-object/from16 v0, p5

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-interface/range {p6 .. p6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [I

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    aget v8, v7, v4

    if-eqz v1, :cond_6

    move v9, v4

    goto :goto_4

    :cond_6
    aget v9, v7, v3

    :goto_4
    aget v10, v7, v5

    if-eqz v1, :cond_7

    move v7, v4

    goto :goto_5

    :cond_7
    const/4 v11, 0x3

    aget v7, v7, v11

    :goto_5
    invoke-virtual {v2, v8, v9, v10, v7}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_3

    :cond_8
    invoke-virtual/range {p7 .. p7}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v1, :cond_9

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    move/from16 v3, p8

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    goto :goto_6

    :cond_9
    move-object/from16 v2, p9

    :goto_6
    invoke-virtual {v0, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual/range {p7 .. p7}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v1, :cond_a

    const/4 v2, -0x1

    goto :goto_7

    :cond_a
    move/from16 v2, p10

    :goto_7
    if-eqz v1, :cond_b

    const/4 v1, -0x2

    goto :goto_8

    :cond_b
    move/from16 v1, p11

    :goto_8
    invoke-virtual {v0, v2, v1}, Landroid/view/Window;->setLayout(II)V

    return-void
.end method

.method synthetic lambda$load$22$org-rabochaya-projects-GeometryEditorActivity(Ljava/util/List;Lorg/rabochaya/projects/GeometryDraft;Ljava/lang/String;)V
    .locals 1

    .line 167
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez v0, :cond_0

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    invoke-direct {p0, p2, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->build(Lorg/rabochaya/projects/GeometryDraft;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$load$23$org-rabochaya-projects-GeometryEditorActivity()V
    .locals 0

    .line 168
    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->finish()V

    return-void
.end method

.method synthetic lambda$load$24$org-rabochaya-projects-GeometryEditorActivity(Ljava/lang/Exception;)V
    .locals 3

    .line 168
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

    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda28;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda28;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    const-string v1, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    invoke-direct {p0, p1, v1, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    :cond_0
    return-void
.end method

.method synthetic lambda$load$25$org-rabochaya-projects-GeometryEditorActivity()V
    .locals 7

    .line 162
    new-instance v0, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V

    .line 163
    :try_start_0
    iget-wide v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/rabochaya/projects/KmlProject;->byId(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 164
    invoke-static {v1}, Lorg/rabochaya/projects/GeometryEdits;->parts(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 165
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

    .line 166
    :goto_0
    nop

    .line 167
    new-instance v4, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda16;

    invoke-direct {v4, p0, v1, v3, v2}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda16;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/util/List;Lorg/rabochaya/projects/GeometryDraft;Ljava/lang/String;)V

    invoke-virtual {p0, v4}, Lorg/rabochaya/projects/GeometryEditorActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 164
    :cond_0
    new-instance v1, Ljava/io/IOException;

    const-string v2, "\u041d\u0435\u0442 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u043c\u044b\u0445 \u043a\u043e\u043d\u0442\u0443\u0440\u043e\u0432 \u0434\u043b\u044f \u0440\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u044f"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 163
    :cond_1
    new-instance v1, Ljava/io/IOException;

    const-string v2, "\u041e\u0431\u044a\u0435\u043a\u0442 \u0431\u043e\u043b\u044c\u0448\u0435 \u043d\u0435 \u0441\u0443\u0449\u0435\u0441\u0442\u0432\u0443\u0435\u0442"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 168
    :catchall_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    :try_start_3
    new-instance v2, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;

    invoke-direct {v2, p0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda17;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/lang/Exception;)V

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

.method synthetic lambda$openClose$34$org-rabochaya-projects-GeometryEditorActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 245
    check-cast p1, Landroid/app/AlertDialog;

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->clearClose(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$openClose$35$org-rabochaya-projects-GeometryEditorActivity(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .locals 0

    .line 245
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->clearClose(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$openClose$36$org-rabochaya-projects-GeometryEditorActivity(Lorg/rabochaya/projects/GeometryCloseDraft;Landroid/app/AlertDialog;Landroid/view/View;)V
    .locals 0

    .line 245
    const/4 p3, 0x0

    invoke-direct {p0, p1, p2, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->confirmClose(Lorg/rabochaya/projects/GeometryCloseDraft;Landroid/app/AlertDialog;Z)V

    return-void
.end method

.method synthetic lambda$openClose$37$org-rabochaya-projects-GeometryEditorActivity(Lorg/rabochaya/projects/GeometryCloseDraft;Landroid/app/AlertDialog;Landroid/view/View;)V
    .locals 0

    .line 245
    const/4 p3, 0x1

    invoke-direct {p0, p1, p2, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->confirmClose(Lorg/rabochaya/projects/GeometryCloseDraft;Landroid/app/AlertDialog;Z)V

    return-void
.end method

.method synthetic lambda$openClose$38$org-rabochaya-projects-GeometryEditorActivity(Landroid/app/AlertDialog;Lorg/rabochaya/projects/GeometryCloseDraft;Landroid/content/DialogInterface;)V
    .locals 8

    .line 245
    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p3

    invoke-virtual {p3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p3

    invoke-direct {p0, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexFont(Landroid/view/View;)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p3

    iget p3, p3, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, -0x3

    const/4 v3, -0x1

    if-ne p3, v0, :cond_0

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p3

    const/4 v0, -0x2

    invoke-virtual {p3, v3, v0}, Landroid/view/Window;->setLayout(II)V

    const/high16 p3, 0x41000000    # 8.0f

    invoke-static {p0, p3}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result p3

    filled-new-array {v3, v0, v2}, [I

    move-result-object v0

    move v4, v1

    :goto_0
    const/4 v5, 0x3

    if-ge v4, v5, :cond_0

    aget v5, v0, v4

    invoke-virtual {p1, v5}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Button;->getPaddingTop()I

    move-result v6

    invoke-virtual {v5}, Landroid/widget/Button;->getPaddingBottom()I

    move-result v7

    invoke-virtual {v5, p3, v6, p3, v7}, Landroid/widget/Button;->setPadding(IIII)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    invoke-direct {p0, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->closeMatches(Lorg/rabochaya/projects/GeometryCloseDraft;)Z

    move-result p3

    if-eqz p3, :cond_1

    iget-boolean p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-nez p3, :cond_1

    iget-boolean p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDraftConflict:Z

    if-nez p3, :cond_1

    const/4 v1, 0x1

    :cond_1
    invoke-virtual {p1, v3}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p3

    invoke-virtual {p3, v1}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p1, v2}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p3

    invoke-virtual {p3, v1}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p1, v3}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p3

    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p2, p1}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Lorg/rabochaya/projects/GeometryCloseDraft;Landroid/app/AlertDialog;)V

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p1, v2}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p3

    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p2, p1}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda1;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Lorg/rabochaya/projects/GeometryCloseDraft;Landroid/app/AlertDialog;)V

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$openGeometryConfirmation$10$org-rabochaya-projects-GeometryEditorActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 129
    check-cast p1, Landroid/app/AlertDialog;

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->clearGeometryConfirmation(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$openGeometryConfirmation$11$org-rabochaya-projects-GeometryEditorActivity(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .locals 0

    .line 130
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->clearGeometryConfirmation(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$openGeometryConfirmation$12$org-rabochaya-projects-GeometryEditorActivity(Lorg/rabochaya/projects/GeometryConfirmationDraft;Landroid/app/AlertDialog;Landroid/view/View;)V
    .locals 0

    .line 130
    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->confirmGeometryDeletion(Lorg/rabochaya/projects/GeometryConfirmationDraft;Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$openGeometryConfirmation$13$org-rabochaya-projects-GeometryEditorActivity(Landroid/app/AlertDialog;Lorg/rabochaya/projects/GeometryConfirmationDraft;Landroid/content/DialogInterface;)V
    .locals 2

    .line 130
    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p3

    invoke-virtual {p3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p3

    invoke-direct {p0, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexFont(Landroid/view/View;)V

    const/4 p3, -0x1

    invoke-virtual {p1, p3}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    invoke-direct {p0, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationMatches(Lorg/rabochaya/projects/GeometryConfirmationDraft;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p1, p3}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p3

    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda18;

    invoke-direct {v0, p0, p2, p1}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda18;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Lorg/rabochaya/projects/GeometryConfirmationDraft;Landroid/app/AlertDialog;)V

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$openPartChoice$4$org-rabochaya-projects-GeometryEditorActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 107
    check-cast p1, Landroid/app/AlertDialog;

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->clearPartChoice(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$openPartChoice$5$org-rabochaya-projects-GeometryEditorActivity(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .locals 0

    .line 107
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->clearPartChoice(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$openPartChoice$6$org-rabochaya-projects-GeometryEditorActivity(Lorg/rabochaya/projects/GeometryPartChoiceDraft;Landroid/app/AlertDialog;Landroid/view/View;)V
    .locals 0

    .line 107
    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->confirmPartChoice(Lorg/rabochaya/projects/GeometryPartChoiceDraft;Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$openPartChoice$7$org-rabochaya-projects-GeometryEditorActivity(Landroid/app/AlertDialog;Lorg/rabochaya/projects/GeometryPartChoiceDraft;Landroid/content/DialogInterface;)V
    .locals 2

    .line 107
    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p3

    invoke-virtual {p3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p3

    invoke-direct {p0, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexFont(Landroid/view/View;)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p3

    iget p3, p3, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x2

    const/4 v1, -0x1

    if-ne p3, v0, :cond_0

    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p3

    const/4 v0, -0x2

    invoke-virtual {p3, v1, v0}, Landroid/view/Window;->setLayout(II)V

    :cond_0
    invoke-virtual {p1, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p3

    invoke-direct {p0, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceMatches(Lorg/rabochaya/projects/GeometryPartChoiceDraft;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p3, v0}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p3

    new-instance v0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda27;

    invoke-direct {v0, p0, p2, p1}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda27;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Lorg/rabochaya/projects/GeometryPartChoiceDraft;Landroid/app/AlertDialog;)V

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$openVertexEditor$18$org-rabochaya-projects-GeometryEditorActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 156
    check-cast p1, Landroid/app/AlertDialog;

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->clearVertexEditor(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$openVertexEditor$19$org-rabochaya-projects-GeometryEditorActivity(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .locals 0

    .line 157
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->clearVertexEditor(Landroid/app/AlertDialog;)V

    return-void
.end method

.method synthetic lambda$openVertexEditor$20$org-rabochaya-projects-GeometryEditorActivity(Lorg/rabochaya/projects/VertexEditDraft;Landroid/widget/TextView;Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/TextView;Landroid/view/View;)V
    .locals 8

    .line 157
    iget-boolean p6, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-nez p6, :cond_2

    iget-boolean p6, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-eqz p6, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexMatches(Lorg/rabochaya/projects/VertexEditDraft;)Z

    move-result p6

    if-nez p6, :cond_1

    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setVisibility(I)V

    const/4 p2, -0x1

    invoke-virtual {p3, p2}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/widget/Button;->setEnabled(Z)V

    return-void

    :cond_1
    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lorg/rabochaya/projects/VertexEditDraft;->type:Ljava/lang/String;

    iget v3, p1, Lorg/rabochaya/projects/VertexEditDraft;->index:I

    iget-object v4, p1, Lorg/rabochaya/projects/VertexEditDraft;->operation:Ljava/lang/String;

    invoke-virtual {p4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    move-object v0, p0

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lorg/rabochaya/projects/GeometryEditorActivity;->applyVertex(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/widget/EditText;Landroid/widget/TextView;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-direct {p0, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->clearVertexEditor(Landroid/app/AlertDialog;)V

    invoke-virtual {p3}, Landroid/app/AlertDialog;->dismiss()V

    :cond_2
    :goto_0
    return-void
.end method

.method synthetic lambda$openVertexEditor$21$org-rabochaya-projects-GeometryEditorActivity(Landroid/app/AlertDialog;Landroid/widget/TextView;Landroid/widget/EditText;Lorg/rabochaya/projects/VertexEditDraft;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/content/DialogInterface;)V
    .locals 7

    .line 157
    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->fitVertexDialog(Landroid/app/AlertDialog;Landroid/widget/TextView;)V

    invoke-virtual {p3}, Landroid/widget/EditText;->requestFocus()Z

    iget p2, p4, Lorg/rabochaya/projects/VertexEditDraft;->start:I

    iget p7, p4, Lorg/rabochaya/projects/VertexEditDraft;->end:I

    invoke-virtual {p3, p2, p7}, Landroid/widget/EditText;->setSelection(II)V

    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p7

    invoke-direct {p0, p4}, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexMatches(Lorg/rabochaya/projects/VertexEditDraft;)Z

    move-result v0

    invoke-virtual {p7, v0}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p2

    new-instance p7, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda3;

    move-object v0, p7

    move-object v1, p0

    move-object v2, p4

    move-object v3, p5

    move-object v4, p1

    move-object v5, p3

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda3;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Lorg/rabochaya/projects/VertexEditDraft;Landroid/widget/TextView;Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/TextView;)V

    invoke-virtual {p2, p7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$showOrphanClose$39$org-rabochaya-projects-GeometryEditorActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 249
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->persist()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->finish()V

    :cond_0
    return-void
.end method

.method synthetic lambda$showOrphanClose$40$org-rabochaya-projects-GeometryEditorActivity(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 249
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

.method synthetic lambda$vertices$2$org-rabochaya-projects-GeometryEditorActivity(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ILjava/util/List;Lorg/rabochaya/projects/GeometryEdits$Part;Ljava/lang/String;ZLandroid/content/DialogInterface;I)V
    .locals 25

    .line 85
    move-object/from16 v8, p0

    move/from16 v0, p4

    move-object/from16 v1, p5

    move-object/from16 v2, p1

    move/from16 v3, p10

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Ljava/lang/String;

    .line 86
    const-string v2, "replace"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "before"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string v2, "after"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 88
    :cond_0
    const-string v1, "delete"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    :try_start_0
    new-instance v1, Lorg/rabochaya/projects/GeometryConfirmationDraft;

    iget-wide v10, v8, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v12, v8, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    sget-object v13, Lorg/rabochaya/projects/GeometryEditorActivity;->VERTEX_SESSION:Ljava/lang/String;

    move-object/from16 v2, p6

    iget-object v14, v2, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    invoke-static/range {p2 .. p2}, Lorg/rabochaya/projects/VertexEditDraft;->stamp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    const-string v18, "vertex"

    move-object v9, v1

    move-object/from16 v15, p7

    move-object/from16 v17, p3

    move/from16 v19, p8

    move/from16 v20, p4

    invoke-direct/range {v9 .. v20}, Lorg/rabochaya/projects/GeometryConfirmationDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V

    const-string v0, ""

    invoke-direct {v8, v1, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->openGeometryConfirmation(Lorg/rabochaya/projects/GeometryConfirmationDraft;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    iget-object v1, v8, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 89
    :cond_1
    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move/from16 v4, p4

    invoke-direct/range {v1 .. v7}, Lorg/rabochaya/projects/GeometryEditorActivity;->applyVertex(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/widget/EditText;)Z

    goto :goto_1

    .line 87
    :cond_2
    :goto_0
    :try_start_1
    new-instance v2, Lorg/rabochaya/projects/VertexEditDraft;

    iget-wide v10, v8, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v12, v8, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    sget-object v13, Lorg/rabochaya/projects/GeometryEditorActivity;->VERTEX_SESSION:Ljava/lang/String;

    iget-object v3, v8, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v4, v8, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v14, v3, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object v15, v8, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    invoke-static/range {p2 .. p2}, Lorg/rabochaya/projects/VertexEditDraft;->stamp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    iget-boolean v3, v8, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v21, v4

    check-cast v21, Ljava/lang/String;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v23

    const-string v24, ""

    const/16 v22, 0x0

    move-object v9, v2

    move-object/from16 v17, p3

    move/from16 v18, v3

    move/from16 v19, p4

    move-object/from16 v20, v5

    invoke-direct/range {v9 .. v24}, Lorg/rabochaya/projects/VertexEditDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;Ljava/lang/String;IILjava/lang/String;)V

    invoke-direct {v8, v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->openVertexEditor(Lorg/rabochaya/projects/VertexEditDraft;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    iget-object v1, v8, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    :goto_1
    return-void
.end method

.method synthetic lambda$vertices$3$org-rabochaya-projects-GeometryEditorActivity(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lorg/rabochaya/projects/GeometryEdits$Part;Ljava/lang/String;ZLandroid/content/DialogInterface;I)V
    .locals 14

    .line 76
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 77
    const-string v1, "\u0418\u0437\u043c\u0435\u043d\u0438\u0442\u044c \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v1, "replace"

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    const-string v1, "Point"

    move-object v4, p1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 79
    const-string v1, "\u0412\u0441\u0442\u0430\u0432\u0438\u0442\u044c \u043f\u0435\u0440\u0435\u0434"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v1, "before"

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v1, "\u0412\u0441\u0442\u0430\u0432\u0438\u0442\u044c \u043f\u043e\u0441\u043b\u0435"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v1, "after"

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    if-lez p8, :cond_0

    const-string v1, "\u0412\u044b\u0448\u0435 \u0432 \u0441\u043f\u0438\u0441\u043a\u0435"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v1, "up"

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    :cond_0
    add-int/lit8 v1, p8, 0x1

    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    const-string v1, "\u041d\u0438\u0436\u0435 \u0432 \u0441\u043f\u0438\u0441\u043a\u0435"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v1, "down"

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    :cond_1
    const-string v1, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0432\u0435\u0440\u0448\u0438\u043d\u0443"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v1, "delete"

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    :cond_2
    new-instance v1, Landroid/app/AlertDialog$Builder;

    move-object v10, p0

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u0412\u0435\u0440\u0448\u0438\u043d\u0430 "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v5, p8, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v11

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    move-object v12, v0

    check-cast v12, [Ljava/lang/CharSequence;

    new-instance v13, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda36;

    move-object v0, v13

    move-object v1, p0

    move-object/from16 v3, p3

    move-object v4, p1

    move/from16 v5, p8

    move-object/from16 v6, p2

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move/from16 v9, p6

    invoke-direct/range {v0 .. v9}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda36;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ILjava/util/List;Lorg/rabochaya/projects/GeometryEdits$Part;Ljava/lang/String;Z)V

    invoke-virtual {v11, v12, v13}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 90
    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 91
    return-void
.end method

.method synthetic lambda$write$31$org-rabochaya-projects-GeometryEditorActivity(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 236
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

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

.method synthetic lambda$write$32$org-rabochaya-projects-GeometryEditorActivity(Ljava/lang/Exception;)V
    .locals 3

    .line 237
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

.method synthetic lambda$write$33$org-rabochaya-projects-GeometryEditorActivity(ZLorg/rabochaya/projects/GeometryEdits$Part;Ljava/lang/String;ZLjava/lang/String;Lorg/rabochaya/projects/GeometryDraft;)V
    .locals 6

    .line 228
    new-instance v0, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V

    .line 229
    :try_start_0
    iget-wide v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/rabochaya/projects/KmlProject;->byId(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 230
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

    .line 231
    :goto_0
    iget-object p3, p2, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 232
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

    .line 233
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

    .line 234
    :cond_4
    nop

    .line 235
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

    .line 236
    new-instance p2, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda9;

    invoke-direct {p2, p0, p5, p3, p1}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda9;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_3

    .line 229
    :cond_6
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u041e\u0431\u044a\u0435\u043a\u0442 \u0443\u0434\u0430\u043b\u0451\u043d; \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 237
    :catchall_0
    move-exception p1

    goto :goto_4

    :catch_1
    move-exception p1

    :try_start_4
    new-instance p2, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda10;

    invoke-direct {p2, p0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda10;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/lang/Exception;)V

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
    .locals 13

    .line 250
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u0414\u043e\u0436\u0434\u0438\u0442\u0435\u0441\u044c \u043e\u043a\u043e\u043d\u0447\u0430\u043d\u0438\u044f \u043e\u043f\u0435\u0440\u0430\u0446\u0438\u0438"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->stagedHoleDeletion:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->cancelStagedHoleDeletion()V

    return-void

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_2

    return-void

    :cond_2
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->dirty()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->finish()V

    return-void

    :cond_3
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->orphan:Z

    if-eqz v0, :cond_4

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->showOrphanClose()V

    return-void

    :cond_4
    iget v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    if-gez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeometryMapCanvas;->cancelGesture()V

    :cond_6
    :try_start_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/rabochaya/projects/GeometryEdits$Part;

    new-instance v12, Lorg/rabochaya/projects/GeometryCloseDraft;

    iget-wide v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    sget-object v5, Lorg/rabochaya/projects/GeometryEditorActivity;->VERTEX_SESSION:Ljava/lang/String;

    iget-object v6, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object v7, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-object v8, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    iget-boolean v9, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->addingHole:Z

    iget-boolean v10, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/rabochaya/projects/VertexEditDraft;->stamp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    move-object v1, v12

    invoke-direct/range {v1 .. v11}, Lorg/rabochaya/projects/GeometryCloseDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)V

    const-string v0, ""

    invoke-direct {p0, v12, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->openClose(Lorg/rabochaya/projects/GeometryCloseDraft;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8

    .line 51
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

    if-eqz p1, :cond_0

    const-string v0, "vertex"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->readVertex(Landroid/os/Bundle;)Lorg/rabochaya/projects/VertexEditDraft;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingVertex:Lorg/rabochaya/projects/VertexEditDraft;

    .line 52
    :cond_0
    const/4 v0, 0x1

    if-eqz p1, :cond_6

    const-string v1, "close_intent"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->readClose(Landroid/os/Bundle;)Lorg/rabochaya/projects/GeometryCloseDraft;

    move-result-object v4

    iput-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingClose:Lorg/rabochaya/projects/GeometryCloseDraft;

    const-string v4, ""

    const-string v5, "error"

    if-nez v1, :cond_1

    move-object v1, v4

    goto :goto_0

    :cond_1
    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->boundedConfirmationError(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingCloseError:Ljava/lang/String;

    const-string v1, "part_choice"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->readPartChoice(Landroid/os/Bundle;)Lorg/rabochaya/projects/GeometryPartChoiceDraft;

    move-result-object v6

    iput-object v6, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingPartChoice:Lorg/rabochaya/projects/GeometryPartChoiceDraft;

    if-nez v1, :cond_2

    move-object v1, v4

    goto :goto_1

    :cond_2
    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->boundedConfirmationError(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_1
    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingPartChoiceError:Ljava/lang/String;

    const-string v1, "geometry_confirmation"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->readGeometryConfirmation(Landroid/os/Bundle;)Lorg/rabochaya/projects/GeometryConfirmationDraft;

    move-result-object v6

    iput-object v6, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingGeometryConfirmation:Lorg/rabochaya/projects/GeometryConfirmationDraft;

    const/4 v6, 0x0

    if-eqz v1, :cond_3

    const-string v7, "staged"

    invoke-virtual {v1, v7, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_3

    move v7, v0

    goto :goto_2

    :cond_3
    move v7, v6

    :goto_2
    iput-boolean v7, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreHoleDeletion:Z

    if-nez v1, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {v1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->boundedConfirmationError(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_3
    iput-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingGeometryError:Ljava/lang/String;

    const-string v1, "geometry_owner"

    invoke-virtual {p1, v1, v2, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    iget-wide v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_6

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    const-string v2, "geometry_feature"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    const-string v1, "geometry_map"

    invoke-virtual {p1, v1, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreMap:Z

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v1

    iget-boolean v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreMap:Z

    if-eqz v2, :cond_5

    instance-of v2, v1, Lorg/rabochaya/projects/GeometryMapUndoDraft;

    if-eqz v2, :cond_5

    check-cast v1, Lorg/rabochaya/projects/GeometryMapUndoDraft;

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->pendingMapUndo:Lorg/rabochaya/projects/GeometryMapUndoDraft;

    :cond_5
    const-string v1, "geometry_selected"

    const/4 v2, -0x1

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->restoreSelection:I

    const-string v1, "geometry_viewport"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getDoubleArray(Ljava/lang/String;)[D

    move-result-object v1

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapViewport:[D

    const-string v1, "geometry_part"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->preferredKey:Ljava/lang/String;

    .line 53
    :cond_6
    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const v1, -0xe3dae8

    invoke-virtual {p1, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 54
    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

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

    .line 55
    const-string p1, "\u041e\u0442\u043a\u0440\u044b\u0442\u0438\u0435 \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u0438\u2026"

    const/16 v0, 0x10

    invoke-direct {p0, p1, v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->root:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->load()V

    .line 56
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 260
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->closeDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->partChoiceDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->geometryConfirmationDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_2
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->vertexDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_3
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->releaseMap()V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->notice:Landroid/widget/Toast;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->notice:Landroid/widget/Toast;

    invoke-virtual {v0}, Landroid/widget/Toast;->cancel()V

    :cond_4
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->worker:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 258
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

    .line 259
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/GeometryMapCanvas;->suspend(Z)V

    :cond_0
    return-void
.end method

.method public onRetainNonConfigurationInstance()Ljava/lang/Object;
    .locals 10

    .line 252
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->disposed:Z

    const/4 v1, 0x0

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->busy:Z

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapMode:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    if-eqz v0, :cond_4

    iget v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    if-ltz v0, :cond_4

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    if-nez v0, :cond_0

    goto :goto_1

    .line 253
    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeometryMapCanvas;->cancelGesture()V

    .line 254
    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeometryMapState;->canUndo()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeometryMapState;->text()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->input:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    .line 255
    :cond_2
    :try_start_0
    new-instance v0, Lorg/rabochaya/projects/GeometryMapUndoDraft;

    iget-wide v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    sget-object v6, Lorg/rabochaya/projects/GeometryEditorActivity;->VERTEX_SESSION:Ljava/lang/String;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->parts:Ljava/util/List;

    iget v7, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->current:I

    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v7, v2, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    iget-object v8, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->expected:Ljava/lang/String;

    iget-object v9, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapState:Lorg/rabochaya/projects/GeometryMapState;

    move-object v2, v0

    invoke-direct/range {v2 .. v9}, Lorg/rabochaya/projects/GeometryMapUndoDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/GeometryMapState;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    return-object v1

    .line 254
    :cond_3
    :goto_0
    return-object v1

    .line 252
    :cond_4
    :goto_1
    return-object v1
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3

    .line 257
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->mapCanvas:Lorg/rabochaya/projects/GeometryMapCanvas;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeometryMapCanvas;->cancelGesture()V

    :cond_0
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->persist()Z

    const-string v0, "geometry_owner"

    iget-wide v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->project:J

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v0, "geometry_feature"

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity;->featureId:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "geometry_confirmation"

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->saveGeometryConfirmation()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    const-string v0, "part_choice"

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->savePartChoice()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    const-string v0, "close_intent"

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->saveClose()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    const-string v0, "vertex"

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryEditorActivity;->saveVertex()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

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
