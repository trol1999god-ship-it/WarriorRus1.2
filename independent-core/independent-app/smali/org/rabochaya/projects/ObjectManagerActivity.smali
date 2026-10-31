.class public final Lorg/rabochaya/projects/ObjectManagerActivity;
.super Landroid/app/Activity;
.source "ObjectManagerActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;,
        Lorg/rabochaya/projects/ObjectManagerActivity$Rows;
    }
.end annotation


# static fields
.field private static final SELECTION_SESSION:Ljava/lang/String;


# instance fields
.field private actions:Landroid/widget/Button;

.field private activeForm:Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

.field private adapter:Lorg/rabochaya/projects/ObjectManagerActivity$Rows;

.field private busy:Z

.field private confirmationDialog:Landroid/app/AlertDialog;

.field private confirmationDraft:Lorg/rabochaya/projects/ObjectConfirmationDraft;

.field private dateButton:Landroid/widget/Button;

.field private disposed:Z

.field private editorDialog:Landroid/app/AlertDialog;

.field private editorDraft:Lorg/rabochaya/projects/ObjectEditorDraft;

.field private editorInput:Landroid/widget/EditText;

.field private expected:Ljava/lang/String;

.field private folder:Ljava/lang/String;

.field private list:Landroid/widget/ListView;

.field private listing:Lorg/rabochaya/projects/ObjectListing;

.field private moveDialog:Landroid/app/AlertDialog;

.field private moveDraft:Lorg/rabochaya/projects/ObjectMoveDraft;

.field private path:Landroid/widget/TextView;

.field private pendingConfirmation:Lorg/rabochaya/projects/ObjectConfirmationDraft;

.field private pendingEditor:Lorg/rabochaya/projects/ObjectEditorDraft;

.field private pendingForm:Lorg/rabochaya/projects/ObjectFormDraft;

.field private pendingMove:Lorg/rabochaya/projects/ObjectMoveDraft;

.field private pendingSelection:Landroid/os/Bundle;

.field private project:J

.field private refreshOnResume:Z

.field private rows:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/ObjectTree$Row;",
            ">;"
        }
    .end annotation
.end field

.field private searchButton:Landroid/widget/Button;

.field private final selected:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private selectionInfo:Landroid/widget/TextView;

.field private final shownKeys:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private snapshot:Lorg/w3c/dom/Element;

.field private status:Landroid/widget/TextView;

.field private up:Landroid/widget/Button;

.field private viewInfo:Landroid/widget/TextView;

.field private viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

.field private visible:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/ObjectTree$Row;",
            ">;"
        }
    .end annotation
.end field

.field private final worker:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 8
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/ObjectManagerActivity;->SELECTION_SESSION:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 7
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 13
    const-string v0, ""

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->rows:Ljava/util/List;

    .line 14
    invoke-static {}, Lorg/rabochaya/projects/ObjectListing$Options;->defaults()Lorg/rabochaya/projects/ObjectListing$Options;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->shownKeys:Ljava/util/Set;

    .line 15
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->worker:Ljava/util/concurrent/ExecutorService;

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->visible:Ljava/util/List;

    return-void
.end method

.method static synthetic access$100(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/app/AlertDialog;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->styleDialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method static synthetic access$1000(Lorg/rabochaya/projects/ObjectManagerActivity;)V
    .locals 0

    .line 7
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->render()V

    return-void
.end method

.method static synthetic access$1100(Lorg/rabochaya/projects/ObjectManagerActivity;Lorg/rabochaya/projects/ObjectTree$Row;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->rowMenu(Lorg/rabochaya/projects/ObjectTree$Row;)V

    return-void
.end method

.method static synthetic access$1200(Lorg/rabochaya/projects/ObjectManagerActivity;)V
    .locals 0

    .line 7
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->selectionSummary()V

    return-void
.end method

.method static synthetic access$1300(Lorg/rabochaya/projects/ObjectManagerActivity;)Landroid/widget/TextView;
    .locals 0

    .line 7
    iget-object p0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->status:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$1400(Lorg/rabochaya/projects/ObjectManagerActivity;)J
    .locals 2

    .line 7
    iget-wide v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    return-wide v0
.end method

.method static synthetic access$1500(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/view/View;)Landroid/widget/ScrollView;
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->scroll(Landroid/view/View;)Landroid/widget/ScrollView;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1600(Lorg/rabochaya/projects/ObjectManagerActivity;)Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;
    .locals 0

    .line 7
    iget-object p0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->activeForm:Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

    return-object p0
.end method

.method static synthetic access$1602(Lorg/rabochaya/projects/ObjectManagerActivity;Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;)Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;
    .locals 0

    .line 7
    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->activeForm:Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

    return-object p1
.end method

.method static synthetic access$200(Lorg/rabochaya/projects/ObjectManagerActivity;)Ljava/util/List;
    .locals 0

    .line 7
    iget-object p0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->visible:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$300(Lorg/rabochaya/projects/ObjectManagerActivity;)Lorg/rabochaya/projects/ObjectListing;
    .locals 0

    .line 7
    iget-object p0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->listing:Lorg/rabochaya/projects/ObjectListing;

    return-object p0
.end method

.method static synthetic access$400(Lorg/rabochaya/projects/ObjectManagerActivity;)Lorg/rabochaya/projects/ObjectListing$Options;
    .locals 0

    .line 7
    iget-object p0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    return-object p0
.end method

.method static synthetic access$500(Lorg/rabochaya/projects/ObjectManagerActivity;)Ljava/util/Set;
    .locals 0

    .line 7
    iget-object p0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    return-object p0
.end method

.method static synthetic access$600(Lorg/rabochaya/projects/ObjectManagerActivity;)Z
    .locals 0

    .line 7
    iget-boolean p0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->busy:Z

    return p0
.end method

.method static synthetic access$700(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lorg/rabochaya/projects/ObjectManagerActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$800(Lorg/rabochaya/projects/ObjectManagerActivity;Ljava/lang/String;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->navigate(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$900(Lorg/rabochaya/projects/ObjectManagerActivity;)Lorg/w3c/dom/Element;
    .locals 0

    .line 7
    iget-object p0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->snapshot:Lorg/w3c/dom/Element;

    return-object p0
.end method

.method private button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .locals 1

    .line 54
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 p2, 0x0

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance p1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda50;

    invoke-direct {p1, p0, p3}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda50;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method private capture(Z)V
    .locals 4

    .line 86
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->selection()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/ObjectManagerActivity;->enabled(Z)V

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->status:Landroid/widget/TextView;

    const-string v3, "\u0417\u0430\u043f\u043e\u043c\u0438\u043d\u0430\u043d\u0438\u0435 \u0432\u044b\u0431\u043e\u0440\u0430\u2026"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda6;

    invoke-direct {v3, p0, p1, v0, v1}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda6;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;ZLjava/util/List;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private clearClipboard()V
    .locals 2

    .line 87
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->enabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda11;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private clipboardError(Ljava/lang/Exception;)V
    .locals 1

    .line 88
    new-instance v0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda45;

    invoke-direct {v0, p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda45;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private clipboardStamp(Lorg/rabochaya/projects/ProjectStore;)Ljava/lang/String;
    .locals 1

    .line 90
    const-string v0, ""

    :try_start_0
    invoke-static {p1}, Lorg/rabochaya/projects/ObjectClipboardWrites;->get(Lorg/rabochaya/projects/ProjectStore;)Lorg/rabochaya/projects/ObjectClipboard;

    move-result-object p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lorg/rabochaya/projects/ObjectClipboard;->fingerprint()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-object v0

    :catch_0
    move-exception p1

    return-object v0
.end method

.method private confirmDelete()V
    .locals 14

    .line 125
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->selection()Ljava/util/List;

    move-result-object v6

    if-nez v6, :cond_0

    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->snapshot:Lorg/w3c/dom/Element;

    invoke-static {v0, v6}, Lorg/rabochaya/projects/ObjectTree;->selectedCount(Lorg/w3c/dom/Element;Ljava/util/Collection;)I

    move-result v0

    iget-wide v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    const-string v3, "delete"

    iget-object v4, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    sget-object v5, Lorg/rabochaya/projects/ObjectManagerActivity;->SELECTION_SESSION:Ljava/lang/String;

    iget-object v7, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->rows:Ljava/util/List;

    const-string v8, ""

    const-string v9, ""

    const-string v10, ""

    const-string v11, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u043e\u0435?"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "\u0411\u0443\u0434\u0435\u0442 \u0443\u0434\u0430\u043b\u0435\u043d\u043e \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432 \u0438 \u043f\u0430\u043f\u043e\u043a: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v12, ", \u0432\u043a\u043b\u044e\u0447\u0430\u044f \u0441\u043e\u0434\u0435\u0440\u0436\u0438\u043c\u043e\u0435 \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0445 \u043f\u0430\u043f\u043e\u043a. \u0412\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0445 \u0441\u0442\u0440\u043e\u043a \u0432\u043d\u0435 \u0441\u043f\u0438\u0441\u043a\u0430: "

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->outsideSelection()I

    move-result v12

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v12, ". \u041e\u0442\u043c\u0435\u043d\u044b \u043f\u043e\u0441\u043b\u0435 \u0441\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u0438\u044f \u043d\u0435\u0442. \u0424\u0430\u0439\u043b\u044b \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u0439 \u043e\u0441\u0442\u0430\u043d\u0443\u0442\u0441\u044f \u0432 \u043f\u0440\u043e\u0435\u043a\u0442\u0435."

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->outsideSelection()I

    move-result v13

    move-wide v0, v1

    move-object v2, v3

    move-object v3, v4

    move-object v4, v5

    move-object v5, v7

    move-object v7, v8

    move-object v8, v9

    move-object v9, v10

    move-object v10, v11

    move-object v11, v12

    move v12, v13

    invoke-static/range {v0 .. v12}, Lorg/rabochaya/projects/ObjectConfirmationDraft;->capture(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/Collection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lorg/rabochaya/projects/ObjectConfirmationDraft;

    move-result-object v0

    const-string v1, ""

    invoke-direct {p0, v0, v1}, Lorg/rabochaya/projects/ObjectManagerActivity;->openConfirmation(Lorg/rabochaya/projects/ObjectConfirmationDraft;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->notice(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private confirmationButton(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 129
    const-string v0, "delete"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c"

    goto :goto_0

    :cond_0
    const-string v0, "show"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "\u041f\u043e\u043a\u0430\u0437\u0430\u0442\u044c"

    goto :goto_0

    :cond_1
    const-string v0, "hide"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    const-string p1, "\u0421\u043a\u0440\u044b\u0442\u044c"

    goto :goto_0

    :cond_2
    const-string p1, "\u0412\u0441\u0442\u0430\u0432\u0438\u0442\u044c"

    :goto_0
    return-object p1
.end method

.method private dateInput(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/EditText;
    .locals 3

    .line 172
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->input()Landroid/widget/EditText;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    const-string v2, "\u0413\u0413\u0413\u0413-\u041c\u041c-\u0414\u0414"

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p2}, Landroid/widget/EditText;->setContentDescription(Ljava/lang/CharSequence;)V

    new-array p2, v1, [Landroid/text/InputFilter;

    new-instance v1, Landroid/text/InputFilter$LengthFilter;

    const/16 v2, 0xa

    invoke-direct {v1, v2}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    const/4 v2, 0x0

    aput-object v1, p2, v2

    invoke-virtual {v0, p2}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    invoke-virtual {v0, p3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method private dateOptions()V
    .locals 1

    .line 174
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->dateOptions(Lorg/rabochaya/projects/ObjectFormDraft;)V

    return-void
.end method

.method private dateOptions(Lorg/rabochaya/projects/ObjectFormDraft;)V
    .locals 17

    .line 176
    move-object/from16 v9, p0

    move-object/from16 v8, p1

    const/4 v7, 0x0

    if-nez v8, :cond_0

    iget-object v0, v9, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v0, v0, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget v0, v0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->mode:I

    goto :goto_0

    :cond_0
    invoke-virtual/range {p1 .. p1}, Lorg/rabochaya/projects/ObjectFormDraft;->choices()[I

    move-result-object v0

    aget v0, v0, v7

    :goto_0
    if-nez v8, :cond_1

    iget-object v1, v9, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v1, v1, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget-object v1, v1, Lorg/rabochaya/projects/KmlTimeFilter$Query;->from:Ljava/lang/String;

    iget-object v2, v9, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v2, v2, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget-object v2, v2, Lorg/rabochaya/projects/KmlTimeFilter$Query;->to:Ljava/lang/String;

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_1
    invoke-virtual/range {p1 .. p1}, Lorg/rabochaya/projects/ObjectFormDraft;->texts()[Ljava/lang/String;

    move-result-object v1

    :goto_1
    new-instance v10, Landroid/widget/LinearLayout;

    invoke-direct {v10, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v2, 0x10

    const/16 v3, 0x8

    invoke-virtual {v10, v2, v3, v2, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v3, "\u0421\u043e\u0431\u0441\u0442\u0432\u0435\u043d\u043d\u044b\u0435 TimeStamp / TimeSpan \u043e\u0431\u044a\u0435\u043a\u0442\u0430. \u042d\u0442\u043e \u043d\u0435 \u0434\u0430\u0442\u0430 \u0441\u043e\u0437\u0434\u0430\u043d\u0438\u044f \u0444\u0430\u0439\u043b\u0430. \u041f\u0435\u0440\u0438\u043e\u0434 \u0437\u0430\u0434\u0430\u0451\u0442\u0441\u044f \u0446\u0435\u043b\u044b\u043c\u0438 \u0434\u043d\u044f\u043c\u0438 UTC, \u043e\u0431\u0435 \u0434\u0430\u0442\u044b \u0432\u043a\u043b\u044e\u0447\u0435\u043d\u044b. \u041f\u0443\u0441\u0442\u0430\u044f \u0433\u0440\u0430\u043d\u0438\u0446\u0430 \u043d\u0435 \u043e\u0433\u0440\u0430\u043d\u0438\u0447\u0438\u0432\u0430\u0435\u0442 \u043f\u0435\u0440\u0438\u043e\u0434."

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v10, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 177
    const-string v2, "\u041e\u0442\u0431\u043e\u0440 \u043f\u043e \u0434\u0430\u0442\u0435"

    sget-object v3, Lorg/rabochaya/projects/KmlTimeFilter;->MODES:[Ljava/lang/String;

    invoke-direct {v9, v10, v2, v3, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->option(Landroid/widget/LinearLayout;Ljava/lang/String;[Ljava/lang/String;I)Landroid/widget/Spinner;

    move-result-object v12

    const-string v2, "\u0421 \u0434\u0430\u0442\u044b (UTC)"

    aget-object v3, v1, v7

    invoke-direct {v9, v10, v2, v3}, Lorg/rabochaya/projects/ObjectManagerActivity;->dateInput(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v13

    const-string v2, "\u041f\u043e \u0434\u0430\u0442\u0443 (UTC)"

    aget-object v1, v1, v11

    invoke-direct {v9, v10, v2, v1}, Lorg/rabochaya/projects/ObjectManagerActivity;->dateInput(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v14

    const/4 v15, 0x2

    if-ne v0, v15, :cond_2

    move v1, v11

    goto :goto_2

    :cond_2
    move v1, v7

    :goto_2
    invoke-virtual {v13, v1}, Landroid/widget/EditText;->setEnabled(Z)V

    if-ne v0, v15, :cond_3

    move v1, v11

    goto :goto_3

    :cond_3
    move v1, v7

    :goto_3
    invoke-virtual {v14, v1}, Landroid/widget/EditText;->setEnabled(Z)V

    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const v1, -0x4fffe0

    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setTextColor(I)V

    if-nez v8, :cond_4

    const-string v1, ""

    goto :goto_4

    :cond_4
    iget-object v1, v8, Lorg/rabochaya/projects/ObjectFormDraft;->error:Ljava/lang/String;

    :goto_4
    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v10, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    filled-new-array {v0}, [I

    move-result-object v5

    .line 178
    new-instance v4, Lorg/rabochaya/projects/ObjectManagerActivity$3;

    move-object v0, v4

    move-object/from16 v1, p0

    move-object v2, v12

    move-object v3, v13

    move-object v11, v4

    move-object v4, v14

    move-object/from16 v16, v6

    invoke-direct/range {v0 .. v6}, Lorg/rabochaya/projects/ObjectManagerActivity$3;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;[ILandroid/widget/TextView;)V

    invoke-virtual {v12, v11}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 179
    new-instance v11, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

    new-array v4, v15, [Landroid/widget/EditText;

    aput-object v13, v4, v7

    const/4 v0, 0x1

    aput-object v14, v4, v0

    new-array v5, v0, [Landroid/widget/Spinner;

    aput-object v12, v5, v7

    new-array v6, v7, [Landroid/widget/CheckBox;

    const-string v2, "dates"

    move-object v0, v11

    move-object v3, v10

    move-object/from16 v7, v16

    invoke-direct/range {v0 .. v7}, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Ljava/lang/String;Landroid/widget/LinearLayout;[Landroid/widget/EditText;[Landroid/widget/Spinner;[Landroid/widget/CheckBox;Landroid/widget/TextView;)V

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->dialog()Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0414\u0430\u0442\u044b KML"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, v11, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->pane:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041f\u0440\u0438\u043c\u0435\u043d\u0438\u0442\u044c"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda13;

    invoke-direct {v1, v9}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda13;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    const-string v3, "\u0421\u0431\u0440\u043e\u0441\u0438\u0442\u044c \u0434\u0430\u0442\u044b"

    invoke-virtual {v0, v3, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v10

    invoke-virtual {v11, v10}, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->bind(Landroid/app/AlertDialog;)V

    .line 180
    new-instance v15, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda14;

    move-object v0, v15

    move-object/from16 v1, p0

    move-object v2, v11

    move-object/from16 v3, p1

    move-object v4, v10

    move-object v5, v12

    move-object v6, v13

    move-object v7, v14

    move-object/from16 v8, v16

    invoke-direct/range {v0 .. v8}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda14;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;Lorg/rabochaya/projects/ObjectFormDraft;Landroid/app/AlertDialog;Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/TextView;)V

    invoke-virtual {v10, v15}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v10}, Landroid/app/AlertDialog;->show()V

    .line 181
    return-void
.end method

.method private description()V
    .locals 10

    .line 101
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const-string v0, "\u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u043e\u0434\u0438\u043d \u043e\u0431\u044a\u0435\u043a\u0442 \u0438\u043b\u0438 \u043f\u0430\u043f\u043a\u0443"

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->notice(Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Ljava/lang/String;

    :try_start_0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->snapshot:Lorg/w3c/dom/Element;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    invoke-static {v0, v5, v1}, Lorg/rabochaya/projects/ObjectDescription;->read(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-instance v0, Lorg/rabochaya/projects/ObjectEditorDraft;

    iget-wide v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    const-string v4, "description"

    iget-object v6, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    move-object v1, v0

    invoke-direct/range {v1 .. v9}, Lorg/rabochaya/projects/ObjectEditorDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->openEditor(Lorg/rabochaya/projects/ObjectEditorDraft;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->notice(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private destination()V
    .locals 12

    .line 113
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->selection()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const-string v3, ""

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v4, "\u041a\u043e\u0440\u0435\u043d\u044c \u043f\u0440\u043e\u0435\u043a\u0442\u0430"

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    invoke-interface {v5, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->rows:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v6, 0x0

    if-eqz v4, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/ObjectTree$Row;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, v4, Lorg/rabochaya/projects/ObjectTree$Row;->parent:Ljava/lang/String;

    invoke-interface {v5, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " / "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v4, Lorg/rabochaya/projects/ObjectTree$Row;->name:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget-object v8, v4, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-interface {v5, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-boolean v8, v4, Lorg/rabochaya/projects/ObjectTree$Row;->folder:Z

    if-nez v8, :cond_2

    :cond_1
    :goto_1
    goto :goto_0

    :cond_2
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_3
    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    iget-object v10, v4, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_4

    iget-object v10, v4, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, "/"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    :cond_4
    const/4 v6, 0x1

    goto :goto_2

    :cond_5
    if-nez v6, :cond_1

    iget-object v4, v4, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 115
    :cond_6
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->dialog()Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const-string v4, "\u041f\u0435\u0440\u0435\u043d\u0435\u0441\u0442\u0438 \u0432 \u043f\u0430\u043f\u043a\u0443"

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    new-array v4, v6, [Ljava/lang/String;

    invoke-interface {v2, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/CharSequence;

    new-instance v5, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda17;

    invoke-direct {v5, p0, v0, v1, v2}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda17;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 116
    return-void
.end method

.method private destinationLabel(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 89
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const-string v1, "\u041a\u043e\u0440\u0435\u043d\u044c \u043f\u0440\u043e\u0435\u043a\u0442\u0430"

    if-nez v0, :cond_3

    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length v2, p1

    const-string v3, ""

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_3

    aget-object v5, p1, v4

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_0

    move-object v3, v5

    goto :goto_1

    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_1
    iget-object v5, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->listing:Lorg/rabochaya/projects/ObjectListing;

    invoke-virtual {v5, v3}, Lorg/rabochaya/projects/ObjectListing;->get(Ljava/lang/String;)Lorg/rabochaya/projects/ObjectListing$Item;

    move-result-object v5

    if-eqz v5, :cond_2

    iget-object v6, v5, Lorg/rabochaya/projects/ObjectListing$Item;->row:Lorg/rabochaya/projects/ObjectTree$Row;

    iget-boolean v6, v6, Lorg/rabochaya/projects/ObjectTree$Row;->folder:Z

    if-eqz v6, :cond_2

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, " / "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v5, v5, Lorg/rabochaya/projects/ObjectListing$Item;->row:Lorg/rabochaya/projects/ObjectTree$Row;

    iget-object v5, v5, Lorg/rabochaya/projects/ObjectTree$Row;->name:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    const v6, 0x9c40

    if-gt v5, v6, :cond_1

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0434\u043b\u0438\u043d\u043d\u044b\u0439 \u043f\u0443\u0442\u044c \u043d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u041f\u0430\u043f\u043a\u0430 \u043d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u043d\u0430"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    return-object v1
.end method

.method private dialog()Landroid/app/AlertDialog$Builder;
    .locals 1

    .line 53
    new-instance v0, Lorg/rabochaya/projects/ObjectManagerActivity$2;

    invoke-direct {v0, p0, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$2;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/content/Context;)V

    return-object v0
.end method

.method private dialogPadding(Landroid/view/View;Ljava/util/Map;)V
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

    .line 34
    const/4 v0, 0x5

    new-array v0, v0, [I

    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    const/4 v2, 0x0

    aput v1, v0, v2

    const/4 v1, 0x1

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    aput v3, v0, v1

    const/4 v1, 0x2

    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    aput v3, v0, v1

    const/4 v1, 0x3

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    aput v3, v0, v1

    instance-of v1, p1, Landroid/widget/EditText;

    if-eqz v1, :cond_0

    move-object v1, p1

    check-cast v1, Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getMinLines()I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, -0x1

    :goto_0
    const/4 v3, 0x4

    aput v1, v0, v3

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    check-cast p1, Landroid/view/ViewGroup;

    :goto_1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge v2, v0, :cond_1

    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/rabochaya/projects/ObjectManagerActivity;->dialogPadding(Landroid/view/View;Ljava/util/Map;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method

.method private enabled(Z)V
    .locals 4

    .line 55
    xor-int/lit8 v0, p1, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->busy:Z

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->actions:Landroid/widget/Button;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz p1, :cond_0

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->snapshot:Lorg/w3c/dom/Element;

    if-eqz v3, :cond_0

    move v3, v2

    goto :goto_0

    :cond_0
    move v3, v1

    :goto_0
    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->up:Landroid/widget/Button;

    if-eqz p1, :cond_1

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    move v3, v2

    goto :goto_1

    :cond_1
    move v3, v1

    :goto_1
    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->list:Landroid/widget/ListView;

    invoke-virtual {v0, p1}, Landroid/widget/ListView;->setEnabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->searchButton:Landroid/widget/Button;

    if-eqz p1, :cond_2

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->listing:Lorg/rabochaya/projects/ObjectListing;

    if-eqz v3, :cond_2

    move v3, v2

    goto :goto_2

    :cond_2
    move v3, v1

    :goto_2
    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->dateButton:Landroid/widget/Button;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->listing:Lorg/rabochaya/projects/ObjectListing;

    if-eqz p1, :cond_3

    move v1, v2

    :cond_3
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->adapter:Lorg/rabochaya/projects/ObjectManagerActivity$Rows;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->adapter:Lorg/rabochaya/projects/ObjectManagerActivity$Rows;

    invoke-virtual {p1}, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->notifyDataSetChanged()V

    :cond_4
    return-void
.end method

.method private font(Landroid/view/View;)V
    .locals 4

    .line 32
    instance-of v0, p1, Landroid/widget/TextView;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    move-object v0, p1

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v2

    if-nez v2, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Typeface;->getStyle()I

    move-result v2

    :goto_0
    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object v3

    invoke-static {v3, v2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

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

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->font(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method private input()Landroid/widget/EditText;
    .locals 3

    .line 30
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/widget/EditText;->getImeOptions()I

    move-result v1

    const/high16 v2, 0x10000000

    or-int/2addr v1, v2

    const/high16 v2, 0x2000000

    or-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setImeOptions(I)V

    return-object v0
.end method

.method static synthetic lambda$searchOptions$47(Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;Lorg/rabochaya/projects/ObjectFormDraft;Landroid/content/DialogInterface;)V
    .locals 0

    .line 169
    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->shown(Lorg/rabochaya/projects/ObjectFormDraft;)V

    return-void
.end method

.method private load()V
    .locals 3

    .line 56
    iget-boolean v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->busy:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingConfirmation:Lorg/rabochaya/projects/ObjectConfirmationDraft;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingConfirmation:Lorg/rabochaya/projects/ObjectConfirmationDraft;

    invoke-virtual {v0}, Lorg/rabochaya/projects/ObjectConfirmationDraft;->paste()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v1

    :goto_0
    invoke-direct {p0, v1}, Lorg/rabochaya/projects/ObjectManagerActivity;->enabled(Z)V

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->status:Landroid/widget/TextView;

    const-string v2, "\u0427\u0442\u0435\u043d\u0438\u0435 \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u043e\u0433\u043e \u043f\u0440\u043e\u0435\u043a\u0442\u0430\u2026"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda30;

    invoke-direct {v2, p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda30;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Z)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private menu()V
    .locals 14

    .line 82
    const-string v12, "\u0421\u043a\u0440\u044b\u0442\u044c \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0435"

    const-string v13, "\u0418\u0437\u043c\u0435\u043d\u0438\u0442\u044c \u043e\u043f\u0438\u0441\u0430\u043d\u0438\u0435"

    const-string v0, "\u041d\u043e\u0432\u0430\u044f \u043f\u0430\u043f\u043a\u0430 / \u0433\u0440\u0443\u043f\u043f\u0430"

    const-string v1, "\u0412\u044b\u0431\u0440\u0430\u0442\u044c \u043f\u043e\u043a\u0430\u0437\u0430\u043d\u043d\u044b\u0435"

    const-string v2, "\u0421\u043d\u044f\u0442\u044c \u0432\u0435\u0441\u044c \u0432\u044b\u0431\u043e\u0440"

    const-string v3, "\u041f\u0435\u0440\u0435\u043d\u0435\u0441\u0442\u0438 \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u043e\u0435"

    const-string v4, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u043e\u0435"

    const-string v5, "\u041f\u0435\u0440\u0435\u0438\u043c\u0435\u043d\u043e\u0432\u0430\u0442\u044c \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u043e\u0435"

    const-string v6, "\u041f\u0435\u0440\u0435\u0447\u0438\u0442\u0430\u0442\u044c \u0441\u043f\u0438\u0441\u043e\u043a"

    const-string v7, "\u041a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u0442\u044c"

    const-string v8, "\u0412\u044b\u0440\u0435\u0437\u0430\u0442\u044c"

    const-string v9, "\u0412\u0441\u0442\u0430\u0432\u0438\u0442\u044c \u0432 \u044d\u0442\u0443 \u043f\u0430\u043f\u043a\u0443"

    const-string v10, "\u041e\u0447\u0438\u0441\u0442\u0438\u0442\u044c \u0431\u0443\u0444\u0435\u0440"

    const-string v11, "\u041f\u043e\u043a\u0430\u0437\u0430\u0442\u044c \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0435"

    filled-new-array/range {v0 .. v13}, [Ljava/lang/String;

    move-result-object v0

    .line 83
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->dialog()Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u0414\u0435\u0439\u0441\u0442\u0432\u0438\u044f \u00b7 \u0432\u044b\u0431\u0440\u0430\u043d\u043e "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \u00b7 \u0432\u043d\u0435 \u0441\u043f\u0438\u0441\u043a\u0430 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->outsideSelection()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda33;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda33;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 84
    return-void
.end method

.method private name(Z)V
    .locals 10

    .line 98
    if-eqz p1, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const-string p1, "\u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u043e\u0434\u0438\u043d \u043e\u0431\u044a\u0435\u043a\u0442"

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->notice(Ljava/lang/String;)V

    return-void

    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    :goto_0
    move-object v5, v0

    const-string v0, ""

    if-eqz p1, :cond_3

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->rows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/ObjectTree$Row;

    iget-object v3, v2, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v0, v2, Lorg/rabochaya/projects/ObjectTree$Row;->name:Ljava/lang/String;

    goto :goto_1

    :cond_3
    move-object v7, v0

    .line 99
    :try_start_0
    new-instance v0, Lorg/rabochaya/projects/ObjectEditorDraft;

    iget-wide v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    if-eqz p1, :cond_4

    const-string p1, "rename"

    goto :goto_2

    :cond_4
    const-string p1, "create"

    :goto_2
    move-object v4, p1

    iget-object v6, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    move-object v1, v0

    invoke-direct/range {v1 .. v9}, Lorg/rabochaya/projects/ObjectEditorDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->openEditor(Lorg/rabochaya/projects/ObjectEditorDraft;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->notice(Ljava/lang/String;)V

    .line 100
    :goto_3
    return-void
.end method

.method private navigate(Ljava/lang/String;)V
    .locals 7

    .line 62
    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    new-instance p1, Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v4, v0, Lorg/rabochaya/projects/ObjectListing$Options;->sort:I

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-boolean v6, v0, Lorg/rabochaya/projects/ObjectListing$Options;->foldersFirst:Z

    const-string v1, ""

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v0, p1

    invoke-direct/range {v0 .. v6}, Lorg/rabochaya/projects/ObjectListing$Options;-><init>(Ljava/lang/String;IIIZZ)V

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->rememberView()V

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->render()V

    return-void
.end method

.method private notice(Ljava/lang/String;)V
    .locals 2

    .line 183
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->dialog()Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u041f\u043e\u043d\u044f\u0442\u043d\u043e"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method public static open(Landroid/app/Activity;J)V
    .locals 2

    .line 17
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "project"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private openConfirmation(Lorg/rabochaya/projects/ObjectConfirmationDraft;Ljava/lang/String;)V
    .locals 11

    .line 130
    iget-wide v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->snapshot:Lorg/w3c/dom/Element;

    sget-object v4, Lorg/rabochaya/projects/ObjectManagerActivity;->SELECTION_SESSION:Ljava/lang/String;

    move-object v0, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lorg/rabochaya/projects/ObjectConfirmationDraft;->restore(JLorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result p2

    xor-int/lit8 v8, p2, 0x1

    if-eqz v8, :cond_0

    const-string p2, ""

    goto :goto_1

    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lorg/rabochaya/projects/ObjectConfirmationDraft;->paste()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "\u041f\u0440\u043e\u0435\u043a\u0442 \u0438\u043b\u0438 \u0431\u0443\u0444\u0435\u0440 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f \u043b\u0438\u0431\u043e \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u0435\u043d."

    goto :goto_0

    :cond_1
    const-string v0, "\u041f\u0440\u043e\u0435\u043a\u0442 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f."

    :goto_0
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " \u0414\u0435\u0439\u0441\u0442\u0432\u0438\u0435 \u0437\u0430\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u0430\u043d\u043e. \u041e\u0442\u043c\u0435\u043d\u0438\u0442\u0435 \u043f\u043e\u0434\u0442\u0432\u0435\u0440\u0436\u0434\u0435\u043d\u0438\u0435 \u0438 \u043f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u0435 \u0432\u044b\u0431\u043e\u0440.\n\n"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 131
    :goto_1
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->dialog()Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, p1, Lorg/rabochaya/projects/ObjectConfirmationDraft;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object v1, p1, Lorg/rabochaya/projects/ObjectConfirmationDraft;->message:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    iget-object v0, p1, Lorg/rabochaya/projects/ObjectConfirmationDraft;->action:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->confirmationButton(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const-string v0, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-virtual {p2, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p2

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->confirmationDraft:Lorg/rabochaya/projects/ObjectConfirmationDraft;

    iput-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->confirmationDialog:Landroid/app/AlertDialog;

    new-instance v0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda31;

    invoke-direct {v0, p0, p2}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda31;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    new-instance v0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda32;

    move-object v5, v0

    move-object v6, p0

    move-object v7, p2

    move-object v9, p1

    invoke-direct/range {v5 .. v10}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda32;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/app/AlertDialog;ZLorg/rabochaya/projects/ObjectConfirmationDraft;Ljava/util/List;)V

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {p2}, Landroid/app/AlertDialog;->show()V

    .line 132
    return-void
.end method

.method private openEditor(Lorg/rabochaya/projects/ObjectEditorDraft;)V
    .locals 10

    .line 103
    iget-wide v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->snapshot:Lorg/w3c/dom/Element;

    invoke-virtual {p1, v0, v1, v2}, Lorg/rabochaya/projects/ObjectEditorDraft;->matches(JLorg/w3c/dom/Element;)Z

    move-result v6

    iget-object v0, p1, Lorg/rabochaya/projects/ObjectEditorDraft;->operation:Ljava/lang/String;

    const-string v1, "description"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v2, 0x10

    const/16 v3, 0x8

    invoke-virtual {v0, v2, v3, v2, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 104
    if-eqz v8, :cond_0

    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v3, "\u0418\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u0442\u0435\u043a\u0441\u0442 \u043e\u043f\u0438\u0441\u0430\u043d\u0438\u044f KML. HTML \u0438 \u0441\u0441\u044b\u043b\u043a\u0438 \u043f\u043e\u043a\u0430\u0437\u0430\u043d\u044b \u043a\u0430\u043a \u0442\u0435\u043a\u0441\u0442. \u0421\u043b\u0443\u0436\u0435\u0431\u043d\u044b\u0435 \u0441\u0441\u044b\u043b\u043a\u0438 \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u0439 \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u044e\u0442\u0441\u044f \u043e\u0442\u0434\u0435\u043b\u044c\u043d\u043e. \u041f\u0443\u0441\u0442\u043e\u0439 \u0442\u0435\u043a\u0441\u0442 \u043e\u0447\u0438\u0449\u0430\u0435\u0442 \u043e\u043f\u0438\u0441\u0430\u043d\u0438\u0435."

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 105
    :cond_0
    if-nez v6, :cond_1

    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v3, "\u041f\u0440\u043e\u0435\u043a\u0442 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f. \u0427\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u0432\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d. \u0421\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u0438\u0435 \u0437\u0430\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u0430\u043d\u043e. \u041e\u0442\u043c\u0435\u043d\u0438\u0442\u0435 \u0440\u0435\u0434\u0430\u043a\u0442\u043e\u0440 \u0438 \u043f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u0435 \u0432\u044b\u0431\u043e\u0440 \u043e\u0431\u044a\u0435\u043a\u0442\u0430."

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 106
    :cond_1
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->input()Landroid/widget/EditText;

    move-result-object v2

    new-array v3, v1, [Landroid/text/InputFilter;

    new-instance v4, Landroid/text/InputFilter$LengthFilter;

    const v5, 0x186a0

    invoke-direct {v4, v5}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    const-string v3, "\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435 \u043e\u0431\u044a\u0435\u043a\u0442\u0430"

    const-string v4, "rename"

    if-eqz v8, :cond_2

    move-object v5, v3

    goto :goto_0

    :cond_2
    iget-object v5, p1, Lorg/rabochaya/projects/ObjectEditorDraft;->operation:Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const-string v5, "\u041d\u043e\u0432\u043e\u0435 \u043d\u0430\u0437\u0432\u0430\u043d\u0438\u0435"

    goto :goto_0

    :cond_3
    const-string v5, "\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435 \u043f\u0430\u043f\u043a\u0438 / \u0433\u0440\u0443\u043f\u043f\u044b"

    :goto_0
    invoke-virtual {v2, v5}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 107
    if-eqz v8, :cond_4

    const v1, 0xa0001

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setInputType(I)V

    const/4 v1, 0x4

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setMinLines(I)V

    const/16 v1, 0x9

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setMaxLines(I)V

    const/16 v1, 0x30

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setGravity(I)V

    goto :goto_1

    :cond_4
    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    :goto_1
    iget-object v1, p1, Lorg/rabochaya/projects/ObjectEditorDraft;->text:Ljava/lang/String;

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 108
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->dialog()Landroid/app/AlertDialog$Builder;

    move-result-object v1

    if-eqz v8, :cond_5

    goto :goto_2

    :cond_5
    iget-object v3, p1, Lorg/rabochaya/projects/ObjectEditorDraft;->operation:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    const-string v3, "\u041f\u0435\u0440\u0435\u0438\u043c\u0435\u043d\u043e\u0432\u0430\u0442\u044c"

    goto :goto_2

    :cond_6
    const-string v3, "\u041d\u043e\u0432\u0430\u044f \u043f\u0430\u043f\u043a\u0430 / \u0433\u0440\u0443\u043f\u043f\u0430"

    :goto_2
    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->scroll(Landroid/view/View;)Landroid/widget/ScrollView;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c"

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->editorDraft:Lorg/rabochaya/projects/ObjectEditorDraft;

    iput-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->editorInput:Landroid/widget/EditText;

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->editorDialog:Landroid/app/AlertDialog;

    .line 109
    new-instance v1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;

    invoke-direct {v1, p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda15;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 110
    new-instance v1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;

    move-object v3, v1

    move-object v4, p0

    move-object v5, v0

    move-object v7, v2

    move-object v9, p1

    invoke-direct/range {v3 .. v9}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda16;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/app/AlertDialog;ZLandroid/widget/EditText;ZLorg/rabochaya/projects/ObjectEditorDraft;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    invoke-virtual {v2}, Landroid/widget/EditText;->requestFocus()Z

    iget v0, p1, Lorg/rabochaya/projects/ObjectEditorDraft;->start:I

    iget p1, p1, Lorg/rabochaya/projects/ObjectEditorDraft;->end:I

    invoke-virtual {v2, v0, p1}, Landroid/widget/EditText;->setSelection(II)V

    .line 111
    return-void
.end method

.method private openMove(Lorg/rabochaya/projects/ObjectMoveDraft;)V
    .locals 10

    .line 121
    iget-wide v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->snapshot:Lorg/w3c/dom/Element;

    sget-object v3, Lorg/rabochaya/projects/ObjectManagerActivity;->SELECTION_SESSION:Ljava/lang/String;

    invoke-virtual {p1, v0, v1, v2, v3}, Lorg/rabochaya/projects/ObjectMoveDraft;->restore(JLorg/w3c/dom/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/lit8 v7, v0, 0x1

    if-eqz v7, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    const-string v0, "\u041f\u0440\u043e\u0435\u043a\u0442 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f. \u041f\u0435\u0440\u0435\u043d\u043e\u0441 \u0437\u0430\u0431\u043b\u043e\u043a\u0438\u0440\u043e\u0432\u0430\u043d. \u041e\u0442\u043c\u0435\u043d\u0438\u0442\u0435 \u043f\u043e\u0434\u0442\u0432\u0435\u0440\u0436\u0434\u0435\u043d\u0438\u0435 \u0438 \u043f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u0435 \u0432\u044b\u0431\u043e\u0440.\n\n"

    .line 122
    :goto_0
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->dialog()Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\u041f\u0435\u0440\u0435\u043d\u0435\u0441\u0442\u0438 \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0435 \u043e\u0431\u044a\u0435\u043a\u0442\u044b ("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lorg/rabochaya/projects/ObjectMoveDraft;->indices()[I

    move-result-object v2

    array-length v2, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ", \u0432\u043d\u0435 \u0441\u043f\u0438\u0441\u043a\u0430: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p1, Lorg/rabochaya/projects/ObjectMoveDraft;->outside:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ") \u0432 \u00ab"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p1, Lorg/rabochaya/projects/ObjectMoveDraft;->label:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\u00bb? \u0412\u0438\u0434\u0438\u043c\u043e\u0441\u0442\u044c \u0431\u0443\u0434\u0435\u0442 \u0437\u0430\u0432\u0438\u0441\u0435\u0442\u044c \u043e\u0442 \u043d\u043e\u0432\u043e\u0439 \u043f\u0430\u043f\u043a\u0438."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041f\u0435\u0440\u0435\u043d\u0435\u0441\u0442\u0438"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->moveDraft:Lorg/rabochaya/projects/ObjectMoveDraft;

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->moveDialog:Landroid/app/AlertDialog;

    .line 123
    new-instance v1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda43;

    invoke-direct {v1, p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda43;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    new-instance v1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda44;

    move-object v4, v1

    move-object v5, p0

    move-object v6, v0

    move-object v9, p1

    invoke-direct/range {v4 .. v9}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda44;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/app/AlertDialog;ZLjava/util/List;Lorg/rabochaya/projects/ObjectMoveDraft;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 124
    return-void
.end method

.method private option(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/CheckBox;
    .locals 1

    .line 146
    new-instance v0, Landroid/widget/CheckBox;

    invoke-direct {v0, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p3}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method private option(Landroid/widget/LinearLayout;Ljava/lang/String;[Ljava/lang/String;I)Landroid/widget/Spinner;
    .locals 2

    .line 145
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/Spinner;

    invoke-direct {v0, p0}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/Spinner;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance p2, Landroid/widget/ArrayAdapter;

    const v1, 0x1090008

    invoke-direct {p2, p0, v1, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    const p3, 0x1090009

    invoke-virtual {p2, p3}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    invoke-virtual {v0, p2}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    invoke-virtual {v0, p4}, Landroid/widget/Spinner;->setSelection(I)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method private outsideSelection()I
    .locals 4

    .line 58
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->shownKeys:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method private parent()V
    .locals 3

    .line 63
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    if-gez v0, :cond_1

    const-string v0, ""

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->navigate(Ljava/lang/String;)V

    return-void
.end method

.method private paste()V
    .locals 9

    .line 91
    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    iget-object v5, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    :try_start_0
    invoke-direct {p0, v5}, Lorg/rabochaya/projects/ObjectManagerActivity;->destinationLabel(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->snapshot:Lorg/w3c/dom/Element;

    iget-object v4, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->rows:Ljava/util/List;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->enabled(Z)V

    iget-object v7, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v8, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda28;

    move-object v0, v8

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda28;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Ljava/lang/String;Lorg/w3c/dom/Element;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v7, v8}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->notice(Ljava/lang/String;)V

    return-void
.end method

.method private readConfirmation(Landroid/os/Bundle;)Lorg/rabochaya/projects/ObjectConfirmationDraft;
    .locals 16

    .line 126
    move-object/from16 v0, p1

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    :try_start_0
    new-instance v15, Lorg/rabochaya/projects/ObjectConfirmationDraft;

    const-string v2, "project"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v3

    const-string v2, "action"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v2, "token"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v2, "session"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v2, "indices"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v8

    const-string v2, "destination"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v2, "destinationLabel"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v2, "fingerprint"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v2, "title"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v2, "message"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v2, "outside"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v14

    move-object v2, v15

    invoke-direct/range {v2 .. v14}, Lorg/rabochaya/projects/ObjectConfirmationDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;[ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v15

    :catch_0
    move-exception v0

    return-object v1
.end method

.method private readEditor(Landroid/os/Bundle;)Lorg/rabochaya/projects/ObjectEditorDraft;
    .locals 11

    .line 94
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    :try_start_0
    new-instance v10, Lorg/rabochaya/projects/ObjectEditorDraft;

    const-string v1, "project"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    const-string v1, "operation"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v1, "key"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v1, "token"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v1, "text"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v1, "start"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v8

    const-string v1, "end"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v9

    move-object v1, v10

    invoke-direct/range {v1 .. v9}, Lorg/rabochaya/projects/ObjectEditorDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v10

    :catch_0
    move-exception p1

    return-object v0
.end method

.method private readForm(Landroid/os/Bundle;)Lorg/rabochaya/projects/ObjectFormDraft;
    .locals 13

    .line 147
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    :try_start_0
    new-instance v12, Lorg/rabochaya/projects/ObjectFormDraft;

    const-string v1, "project"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    const-string v1, "kind"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v1, "texts"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    const-string v1, "starts"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v6

    const-string v1, "ends"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v7

    const-string v1, "focus"

    const/4 v8, -0x1

    invoke-virtual {p1, v1, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v8

    const-string v1, "choices"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v9

    const-string v1, "checks"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBooleanArray(Ljava/lang/String;)[Z

    move-result-object v10

    const-string v1, "error"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    move-object v1, v12

    invoke-direct/range {v1 .. v11}, Lorg/rabochaya/projects/ObjectFormDraft;-><init>(JLjava/lang/String;[Ljava/lang/String;[I[II[I[ZLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v12

    :catch_0
    move-exception p1

    return-object v0
.end method

.method private readMove(Landroid/os/Bundle;)Lorg/rabochaya/projects/ObjectMoveDraft;
    .locals 11

    .line 117
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    :try_start_0
    new-instance v10, Lorg/rabochaya/projects/ObjectMoveDraft;

    const-string v1, "project"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    const-string v1, "token"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v1, "session"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v1, "indices"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v6

    const-string v1, "destination"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v1, "label"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v1, "outside"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v9

    move-object v1, v10

    invoke-direct/range {v1 .. v9}, Lorg/rabochaya/projects/ObjectMoveDraft;-><init>(JLjava/lang/String;Ljava/lang/String;[ILjava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v10

    :catch_0
    move-exception p1

    return-object v0
.end method

.method private rememberView()V
    .locals 4

    .line 144
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->viewPrefs()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "folder"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "token"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "query"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v3, v3, Lorg/rabochaya/projects/ObjectListing$Options;->query:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "searchField"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v3, v3, Lorg/rabochaya/projects/ObjectListing$Options;->searchField:I

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "dateMode"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v3, v3, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget v3, v3, Lorg/rabochaya/projects/KmlTimeFilter$Query;->mode:I

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "dateFrom"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v3, v3, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget-object v3, v3, Lorg/rabochaya/projects/KmlTimeFilter$Query;->from:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "dateTo"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v3, v3, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget-object v3, v3, Lorg/rabochaya/projects/KmlTimeFilter$Query;->to:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "kind"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v3, v3, Lorg/rabochaya/projects/ObjectListing$Options;->kind:I

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "visibility"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v3, v3, Lorg/rabochaya/projects/ObjectListing$Options;->visibility:I

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "sort"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v3, v3, Lorg/rabochaya/projects/ObjectListing$Options;->sort:I

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "recursive"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-boolean v3, v3, Lorg/rabochaya/projects/ObjectListing$Options;->recursive:Z

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "foldersFirst"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-boolean v2, v2, Lorg/rabochaya/projects/ObjectListing$Options;->foldersFirst:Z

    invoke-interface {v1, v0, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method private render()V
    .locals 10

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->visible:Ljava/util/List;

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->shownKeys:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->listing:Lorg/rabochaya/projects/ObjectListing;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->listing:Lorg/rabochaya/projects/ObjectListing;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/ObjectListing;->select(Ljava/lang/String;Lorg/rabochaya/projects/ObjectListing$Options;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/ObjectListing$Item;

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->visible:Ljava/util/List;

    iget-object v3, v1, Lorg/rabochaya/projects/ObjectListing$Item;->row:Lorg/rabochaya/projects/ObjectTree$Row;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->shownKeys:Ljava/util/Set;

    iget-object v1, v1, Lorg/rabochaya/projects/ObjectListing$Item;->row:Lorg/rabochaya/projects/ObjectTree$Row;

    iget-object v1, v1, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "\u041a\u043e\u0440\u0435\u043d\u044c \u043f\u0440\u043e\u0435\u043a\u0442\u0430"

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->listing:Lorg/rabochaya/projects/ObjectListing;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/ObjectListing;->get(Ljava/lang/String;)Lorg/rabochaya/projects/ObjectListing$Item;

    move-result-object v0

    iget-object v0, v0, Lorg/rabochaya/projects/ObjectListing$Item;->row:Lorg/rabochaya/projects/ObjectTree$Row;

    iget-object v0, v0, Lorg/rabochaya/projects/ObjectTree$Row;->name:Ljava/lang/String;

    .line 61
    :goto_1
    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->dateButton:Landroid/widget/Button;

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v2, v2, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget v2, v2, Lorg/rabochaya/projects/KmlTimeFilter$Query;->mode:I

    const-string v3, " \u2014 "

    const-string v4, " UTC: "

    const/4 v5, 0x2

    const-string v6, "\u2026"

    const-string v7, ""

    if-nez v2, :cond_3

    const-string v2, "\u0414\u0430\u0442\u044b KML"

    goto :goto_5

    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u0414\u0430\u0442\u044b KML \u00b7 "

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v8, Lorg/rabochaya/projects/KmlTimeFilter;->MODES:[Ljava/lang/String;

    iget-object v9, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v9, v9, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget v9, v9, Lorg/rabochaya/projects/KmlTimeFilter$Query;->mode:I

    aget-object v8, v8, v9

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v8, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v8, v8, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget v8, v8, Lorg/rabochaya/projects/KmlTimeFilter$Query;->mode:I

    if-ne v8, v5, :cond_6

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v9, v9, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget-object v9, v9, Lorg/rabochaya/projects/KmlTimeFilter$Query;->from:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_4

    move-object v9, v6

    goto :goto_2

    :cond_4
    iget-object v9, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v9, v9, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget-object v9, v9, Lorg/rabochaya/projects/KmlTimeFilter$Query;->from:Ljava/lang/String;

    :goto_2
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v9, v9, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget-object v9, v9, Lorg/rabochaya/projects/KmlTimeFilter$Query;->to:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_5

    move-object v9, v6

    goto :goto_3

    :cond_5
    iget-object v9, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v9, v9, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget-object v9, v9, Lorg/rabochaya/projects/KmlTimeFilter$Query;->to:Ljava/lang/String;

    :goto_3
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_4

    :cond_6
    move-object v8, v7

    :goto_4
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_5
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->path:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " \u00b7 \u043f\u043e\u043a\u0430\u0437\u0430\u043d\u043e: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->visible:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v1, v1, Lorg/rabochaya/projects/ObjectListing$Options;->query:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_7

    move-object v1, v7

    goto :goto_6

    :cond_7
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lorg/rabochaya/projects/ObjectListing;->SEARCH_FIELDS:[Ljava/lang/String;

    iget-object v8, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v8, v8, Lorg/rabochaya/projects/ObjectListing$Options;->searchField:I

    aget-object v2, v2, v8

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": \u00ab"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v2, v2, Lorg/rabochaya/projects/ObjectListing$Options;->query:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\u00bb. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_6
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lorg/rabochaya/projects/ObjectListing;->KINDS:[Ljava/lang/String;

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v2, v2, Lorg/rabochaya/projects/ObjectListing$Options;->kind:I

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u00b7 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Lorg/rabochaya/projects/ObjectListing;->VISIBILITY:[Ljava/lang/String;

    iget-object v8, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v8, v8, Lorg/rabochaya/projects/ObjectListing$Options;->visibility:I

    aget-object v2, v2, v8

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-boolean v2, v2, Lorg/rabochaya/projects/ObjectListing$Options;->recursive:Z

    if-eqz v2, :cond_8

    const-string v2, "\u0421 \u0432\u043b\u043e\u0436\u0435\u043d\u043d\u044b\u043c\u0438 \u043f\u0430\u043f\u043a\u0430\u043c\u0438"

    goto :goto_7

    :cond_8
    const-string v2, "\u042d\u0442\u0430 \u043f\u0430\u043f\u043a\u0430"

    :goto_7
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Lorg/rabochaya/projects/ObjectListing;->SORTS:[Ljava/lang/String;

    iget-object v8, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v8, v8, Lorg/rabochaya/projects/ObjectListing$Options;->sort:I

    aget-object v2, v2, v8

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-boolean v2, v2, Lorg/rabochaya/projects/ObjectListing$Options;->foldersFirst:Z

    if-eqz v2, :cond_9

    const-string v2, " \u00b7 \u041f\u0430\u043f\u043a\u0438 \u0432\u043d\u0430\u0447\u0430\u043b\u0435"

    goto :goto_8

    :cond_9
    move-object v2, v7

    :goto_8
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v2, v2, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget v2, v2, Lorg/rabochaya/projects/KmlTimeFilter$Query;->mode:I

    if-eqz v2, :cond_d

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lorg/rabochaya/projects/KmlTimeFilter;->MODES:[Ljava/lang/String;

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v2, v2, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget v2, v2, Lorg/rabochaya/projects/KmlTimeFilter$Query;->mode:I

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v1, v1, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget v1, v1, Lorg/rabochaya/projects/KmlTimeFilter$Query;->mode:I

    if-ne v1, v5, :cond_c

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v2, v2, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget-object v2, v2, Lorg/rabochaya/projects/KmlTimeFilter$Query;->from:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_a

    move-object v2, v6

    goto :goto_9

    :cond_a
    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v2, v2, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget-object v2, v2, Lorg/rabochaya/projects/KmlTimeFilter$Query;->from:Ljava/lang/String;

    :goto_9
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v2, v2, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget-object v2, v2, Lorg/rabochaya/projects/KmlTimeFilter$Query;->to:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_b

    goto :goto_a

    :cond_b
    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v2, v2, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget-object v6, v2, Lorg/rabochaya/projects/KmlTimeFilter$Query;->to:Ljava/lang/String;

    :goto_a
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    :cond_c
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_d
    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewInfo:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewInfo:Landroid/widget/TextView;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    invoke-virtual {v1}, Lorg/rabochaya/projects/ObjectListing$Options;->filtered()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_f

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v1, v1, Lorg/rabochaya/projects/ObjectListing$Options;->sort:I

    if-nez v1, :cond_f

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-boolean v1, v1, Lorg/rabochaya/projects/ObjectListing$Options;->foldersFirst:Z

    if-eqz v1, :cond_e

    goto :goto_b

    :cond_e
    const/16 v1, 0x8

    goto :goto_c

    :cond_f
    :goto_b
    move v1, v2

    :goto_c
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->selectionSummary()V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u0412\u044b\u0431\u0440\u0430\u043d\u043e: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->up:Landroid/widget/Button;

    iget-boolean v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->busy:Z

    if-nez v1, :cond_10

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_10

    const/4 v2, 0x1

    :cond_10
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->adapter:Lorg/rabochaya/projects/ObjectManagerActivity$Rows;

    invoke-virtual {v0}, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->notifyDataSetChanged()V

    return-void
.end method

.method private restoreConfirmation(Ljava/lang/String;)V
    .locals 4

    .line 128
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingConfirmation:Lorg/rabochaya/projects/ObjectConfirmationDraft;

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingConfirmation:Lorg/rabochaya/projects/ObjectConfirmationDraft;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->editorDialog:Landroid/app/AlertDialog;

    if-nez v1, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->activeForm:Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

    if-nez v1, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->moveDialog:Landroid/app/AlertDialog;

    if-nez v1, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->confirmationDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    iget-wide v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    sget-object v3, Lorg/rabochaya/projects/ObjectManagerActivity;->SELECTION_SESSION:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lorg/rabochaya/projects/ObjectConfirmationDraft;->inSession(JLjava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->status:Landroid/widget/TextView;

    const-string v0, "\u041f\u043e\u0434\u0442\u0432\u0435\u0440\u0436\u0434\u0435\u043d\u0438\u0435 \u0434\u0440\u0443\u0433\u043e\u0433\u043e \u043f\u0440\u043e\u0435\u043a\u0442\u0430 \u0438\u043b\u0438 \u043f\u0440\u043e\u0446\u0435\u0441\u0441\u0430 \u043d\u0435 \u0432\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d\u043e"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_1
    invoke-direct {p0, v0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->openConfirmation(Lorg/rabochaya/projects/ObjectConfirmationDraft;Ljava/lang/String;)V

    :cond_2
    :goto_0
    return-void
.end method

.method private restoreEditor()V
    .locals 5

    .line 96
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingEditor:Lorg/rabochaya/projects/ObjectEditorDraft;

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingEditor:Lorg/rabochaya/projects/ObjectEditorDraft;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-wide v1, v0, Lorg/rabochaya/projects/ObjectEditorDraft;->project:J

    iget-wide v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u0427\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u0434\u0440\u0443\u0433\u043e\u0433\u043e \u043f\u0440\u043e\u0435\u043a\u0442\u0430 \u043d\u0435 \u0432\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_1
    iget-wide v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->snapshot:Lorg/w3c/dom/Element;

    invoke-virtual {v0, v1, v2, v3}, Lorg/rabochaya/projects/ObjectEditorDraft;->matches(JLorg/w3c/dom/Element;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, v0, Lorg/rabochaya/projects/ObjectEditorDraft;->operation:Ljava/lang/String;

    const-string v2, "create"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    iget-object v2, v0, Lorg/rabochaya/projects/ObjectEditorDraft;->key:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->render()V

    :cond_2
    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->openEditor(Lorg/rabochaya/projects/ObjectEditorDraft;)V

    return-void
.end method

.method private restoreForm()V
    .locals 3

    .line 149
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingForm:Lorg/rabochaya/projects/ObjectFormDraft;

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingForm:Lorg/rabochaya/projects/ObjectFormDraft;

    if-eqz v0, :cond_3

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->editorDialog:Landroid/app/AlertDialog;

    if-nez v1, :cond_3

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->activeForm:Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    iget-wide v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/ObjectFormDraft;->appliesTo(J)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u0427\u0435\u0440\u043d\u043e\u0432\u0438\u043a \u0444\u043e\u0440\u043c\u044b \u0434\u0440\u0443\u0433\u043e\u0433\u043e \u043f\u0440\u043e\u0435\u043a\u0442\u0430 \u043d\u0435 \u0432\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_1
    iget-object v1, v0, Lorg/rabochaya/projects/ObjectFormDraft;->kind:Ljava/lang/String;

    const-string v2, "search"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->searchOptions(Lorg/rabochaya/projects/ObjectFormDraft;)V

    goto :goto_0

    :cond_2
    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->dateOptions(Lorg/rabochaya/projects/ObjectFormDraft;)V

    :cond_3
    :goto_0
    return-void
.end method

.method private restoreMove()V
    .locals 4

    .line 119
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingMove:Lorg/rabochaya/projects/ObjectMoveDraft;

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingMove:Lorg/rabochaya/projects/ObjectMoveDraft;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->editorDialog:Landroid/app/AlertDialog;

    if-nez v1, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->activeForm:Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

    if-nez v1, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->moveDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    iget-wide v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    sget-object v3, Lorg/rabochaya/projects/ObjectManagerActivity;->SELECTION_SESSION:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lorg/rabochaya/projects/ObjectMoveDraft;->inSession(JLjava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041f\u043e\u0434\u0442\u0432\u0435\u0440\u0436\u0434\u0435\u043d\u0438\u0435 \u043f\u0435\u0440\u0435\u043d\u043e\u0441\u0430 \u0434\u0440\u0443\u0433\u043e\u0433\u043e \u043f\u0440\u043e\u0435\u043a\u0442\u0430 \u0438\u043b\u0438 \u043f\u0440\u043e\u0446\u0435\u0441\u0441\u0430 \u043d\u0435 \u0432\u043e\u0441\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d\u043e"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_1
    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->openMove(Lorg/rabochaya/projects/ObjectMoveDraft;)V

    :cond_2
    :goto_0
    return-void
.end method

.method private restoreSelection()V
    .locals 8

    .line 93
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingSelection:Landroid/os/Bundle;

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingSelection:Landroid/os/Bundle;

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    new-instance v1, Lorg/rabochaya/projects/ObjectSelectionState;

    const-string v2, "project"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v3

    const-string v2, "token"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v2, "session"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v2, "indices"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v7

    move-object v2, v1

    invoke-direct/range {v2 .. v7}, Lorg/rabochaya/projects/ObjectSelectionState;-><init>(JLjava/lang/String;Ljava/lang/String;[I)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    iget-wide v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    iget-object v4, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->snapshot:Lorg/w3c/dom/Element;

    sget-object v5, Lorg/rabochaya/projects/ObjectManagerActivity;->SELECTION_SESSION:Ljava/lang/String;

    invoke-virtual {v1, v2, v3, v4, v5}, Lorg/rabochaya/projects/ObjectSelectionState;->restore(JLorg/w3c/dom/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    :goto_0
    return-void
.end method

.method private restoreView()V
    .locals 17

    .line 142
    move-object/from16 v1, p0

    const-string v2, ""

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->viewPrefs()Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v4, v1, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    :try_start_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "folder"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    iget-object v5, v1, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    if-nez v5, :cond_0

    iput-object v2, v1, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "token"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v1, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    new-instance v5, Lorg/rabochaya/projects/ObjectListing$Options;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "query"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, "kind"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x0

    invoke-interface {v0, v6, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v9

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v10, "visibility"

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v10

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v11, "sort"

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v11

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v12, "recursive"

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v13, "foldersFirst"

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v14, "searchField"

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v14

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v15, "dateMode"

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v15

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, "dateFrom"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, "dateTo"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v6, v5

    move v8, v9

    move v9, v10

    move v10, v11

    move v11, v12

    move v12, v13

    move v13, v14

    move v14, v15

    move-object/from16 v15, v16

    move-object/from16 v16, v0

    invoke-direct/range {v6 .. v16}, Lorg/rabochaya/projects/ObjectListing$Options;-><init>(Ljava/lang/String;IIIZZIILjava/lang/String;Ljava/lang/String;)V

    iput-object v5, v1, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iput-object v2, v1, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    iput-object v4, v1, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    invoke-static {}, Lorg/rabochaya/projects/ObjectListing$Options;->defaults()Lorg/rabochaya/projects/ObjectListing$Options;

    move-result-object v0

    iput-object v0, v1, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    :goto_0
    return-void
.end method

.method private rowMenu(Lorg/rabochaya/projects/ObjectTree$Row;)V
    .locals 4

    .line 74
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 75
    iget-boolean v2, p1, Lorg/rabochaya/projects/ObjectTree$Row;->folder:Z

    if-eqz v2, :cond_0

    const-string v2, "\u041e\u0442\u043a\u0440\u044b\u0442\u044c \u044d\u0442\u0443 \u043f\u0430\u043f\u043a\u0443"

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v2, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda18;

    invoke-direct {v2, p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda18;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Lorg/rabochaya/projects/ObjectTree$Row;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    :cond_0
    const-string p1, "\u041f\u0435\u0440\u0435\u0438\u043c\u0435\u043d\u043e\u0432\u0430\u0442\u044c \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u043e\u0435"

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance p1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda19;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda19;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string p1, "\u0418\u0437\u043c\u0435\u043d\u0438\u0442\u044c \u043e\u043f\u0438\u0441\u0430\u043d\u0438\u0435"

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance p1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda20;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda20;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    const-string p1, "\u041a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u0442\u044c"

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance p1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda21;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda21;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string p1, "\u0412\u044b\u0440\u0435\u0437\u0430\u0442\u044c"

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance p1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda22;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda22;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string p1, "\u041f\u0435\u0440\u0435\u043d\u0435\u0441\u0442\u0438 \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u043e\u0435"

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance p1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda23;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda23;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    const-string p1, "\u041f\u043e\u043a\u0430\u0437\u0430\u0442\u044c \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0435"

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance p1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda24;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda24;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string p1, "\u0421\u043a\u0440\u044b\u0442\u044c \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0435"

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance p1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda25;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda25;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string p1, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u043e\u0435"

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance p1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda26;

    invoke-direct {p1, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda26;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->dialog()Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u0414\u0435\u0439\u0441\u0442\u0432\u0438\u044f \u0441 \u0432\u044b\u0431\u043e\u0440\u043e\u043c \u00b7 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \u00b7 \u0432\u043d\u0435 \u0441\u043f\u0438\u0441\u043a\u0430 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->outsideSelection()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/CharSequence;

    new-instance v2, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda27;

    invoke-direct {v2, p0, v1}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda27;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Ljava/util/List;)V

    invoke-virtual {p1, v0, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 80
    return-void
.end method

.method private saveConfirmation()Landroid/os/Bundle;
    .locals 5

    .line 127
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->confirmationDraft:Lorg/rabochaya/projects/ObjectConfirmationDraft;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingConfirmation:Lorg/rabochaya/projects/ObjectConfirmationDraft;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->confirmationDraft:Lorg/rabochaya/projects/ObjectConfirmationDraft;

    :goto_0
    if-nez v0, :cond_1

    const/4 v0, 0x0

    return-object v0

    :cond_1
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "project"

    iget-wide v3, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->project:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "action"

    iget-object v3, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->action:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "token"

    iget-object v3, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->token:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "session"

    iget-object v3, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->session:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "indices"

    invoke-virtual {v0}, Lorg/rabochaya/projects/ObjectConfirmationDraft;->indices()[I

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    const-string v2, "destination"

    iget-object v3, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->destination:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "destinationLabel"

    iget-object v3, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->destinationLabel:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "fingerprint"

    iget-object v3, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->fingerprint:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "title"

    iget-object v3, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->title:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "message"

    iget-object v3, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->message:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "outside"

    iget v0, v0, Lorg/rabochaya/projects/ObjectConfirmationDraft;->outside:I

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-object v1
.end method

.method private saveEditor()Landroid/os/Bundle;
    .locals 11

    .line 95
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->editorDraft:Lorg/rabochaya/projects/ObjectEditorDraft;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->editorInput:Landroid/widget/EditText;

    if-eqz v1, :cond_0

    new-instance v1, Lorg/rabochaya/projects/ObjectEditorDraft;

    iget-wide v3, v0, Lorg/rabochaya/projects/ObjectEditorDraft;->project:J

    iget-object v5, v0, Lorg/rabochaya/projects/ObjectEditorDraft;->operation:Ljava/lang/String;

    iget-object v6, v0, Lorg/rabochaya/projects/ObjectEditorDraft;->key:Ljava/lang/String;

    iget-object v7, v0, Lorg/rabochaya/projects/ObjectEditorDraft;->token:Ljava/lang/String;

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->editorInput:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->editorInput:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v9

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->editorInput:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v10

    move-object v2, v1

    invoke-direct/range {v2 .. v10}, Lorg/rabochaya/projects/ObjectEditorDraft;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingEditor:Lorg/rabochaya/projects/ObjectEditorDraft;

    :goto_0
    if-nez v1, :cond_1

    const/4 v0, 0x0

    return-object v0

    :cond_1
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v2, "project"

    iget-wide v3, v1, Lorg/rabochaya/projects/ObjectEditorDraft;->project:J

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "operation"

    iget-object v3, v1, Lorg/rabochaya/projects/ObjectEditorDraft;->operation:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "key"

    iget-object v3, v1, Lorg/rabochaya/projects/ObjectEditorDraft;->key:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "token"

    iget-object v3, v1, Lorg/rabochaya/projects/ObjectEditorDraft;->token:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "text"

    iget-object v3, v1, Lorg/rabochaya/projects/ObjectEditorDraft;->text:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "start"

    iget v3, v1, Lorg/rabochaya/projects/ObjectEditorDraft;->start:I

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "end"

    iget v1, v1, Lorg/rabochaya/projects/ObjectEditorDraft;->end:I

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-object v0
.end method

.method private saveForm()Landroid/os/Bundle;
    .locals 5

    .line 148
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->activeForm:Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingForm:Lorg/rabochaya/projects/ObjectFormDraft;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->activeForm:Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

    invoke-virtual {v0}, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->capture()Lorg/rabochaya/projects/ObjectFormDraft;

    move-result-object v0

    :goto_0
    if-nez v0, :cond_1

    const/4 v0, 0x0

    return-object v0

    :cond_1
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "project"

    iget-wide v3, v0, Lorg/rabochaya/projects/ObjectFormDraft;->project:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "kind"

    iget-object v3, v0, Lorg/rabochaya/projects/ObjectFormDraft;->kind:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "texts"

    invoke-virtual {v0}, Lorg/rabochaya/projects/ObjectFormDraft;->texts()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    const-string v2, "starts"

    invoke-virtual {v0}, Lorg/rabochaya/projects/ObjectFormDraft;->starts()[I

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    const-string v2, "ends"

    invoke-virtual {v0}, Lorg/rabochaya/projects/ObjectFormDraft;->ends()[I

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    const-string v2, "focus"

    iget v3, v0, Lorg/rabochaya/projects/ObjectFormDraft;->focus:I

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "choices"

    invoke-virtual {v0}, Lorg/rabochaya/projects/ObjectFormDraft;->choices()[I

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    const-string v2, "checks"

    invoke-virtual {v0}, Lorg/rabochaya/projects/ObjectFormDraft;->checks()[Z

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBooleanArray(Ljava/lang/String;[Z)V

    const-string v2, "error"

    iget-object v0, v0, Lorg/rabochaya/projects/ObjectFormDraft;->error:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method private saveMove()Landroid/os/Bundle;
    .locals 5

    .line 118
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->moveDraft:Lorg/rabochaya/projects/ObjectMoveDraft;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingMove:Lorg/rabochaya/projects/ObjectMoveDraft;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->moveDraft:Lorg/rabochaya/projects/ObjectMoveDraft;

    :goto_0
    if-nez v0, :cond_1

    const/4 v0, 0x0

    return-object v0

    :cond_1
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "project"

    iget-wide v3, v0, Lorg/rabochaya/projects/ObjectMoveDraft;->project:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "token"

    iget-object v3, v0, Lorg/rabochaya/projects/ObjectMoveDraft;->token:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "session"

    iget-object v3, v0, Lorg/rabochaya/projects/ObjectMoveDraft;->session:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "indices"

    invoke-virtual {v0}, Lorg/rabochaya/projects/ObjectMoveDraft;->indices()[I

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    const-string v2, "destination"

    iget-object v3, v0, Lorg/rabochaya/projects/ObjectMoveDraft;->destination:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "label"

    iget-object v3, v0, Lorg/rabochaya/projects/ObjectMoveDraft;->label:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "outside"

    iget v0, v0, Lorg/rabochaya/projects/ObjectMoveDraft;->outside:I

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-object v1
.end method

.method private saveSelection()Landroid/os/Bundle;
    .locals 7

    .line 92
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->snapshot:Lorg/w3c/dom/Element;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingSelection:Landroid/os/Bundle;

    return-object v0

    :cond_0
    iget-wide v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    sget-object v4, Lorg/rabochaya/projects/ObjectManagerActivity;->SELECTION_SESSION:Ljava/lang/String;

    iget-object v5, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->rows:Ljava/util/List;

    iget-object v6, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    invoke-static/range {v1 .. v6}, Lorg/rabochaya/projects/ObjectSelectionState;->capture(JLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/Collection;)Lorg/rabochaya/projects/ObjectSelectionState;

    move-result-object v0

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "project"

    iget-wide v3, v0, Lorg/rabochaya/projects/ObjectSelectionState;->project:J

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string v2, "token"

    iget-object v3, v0, Lorg/rabochaya/projects/ObjectSelectionState;->token:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "session"

    iget-object v3, v0, Lorg/rabochaya/projects/ObjectSelectionState;->session:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "indices"

    invoke-virtual {v0}, Lorg/rabochaya/projects/ObjectSelectionState;->indices()[I

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    return-object v1
.end method

.method private scroll(Landroid/view/View;)Landroid/widget/ScrollView;
    .locals 1

    .line 31
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    return-object v0
.end method

.method private searchOptions()V
    .locals 1

    .line 164
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->searchOptions(Lorg/rabochaya/projects/ObjectFormDraft;)V

    return-void
.end method

.method private searchOptions(Lorg/rabochaya/projects/ObjectFormDraft;)V
    .locals 19

    .line 166
    move-object/from16 v9, p0

    move-object/from16 v10, p1

    if-nez v10, :cond_0

    iget-object v0, v9, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v0, v0, Lorg/rabochaya/projects/ObjectListing$Options;->searchField:I

    iget-object v1, v9, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v1, v1, Lorg/rabochaya/projects/ObjectListing$Options;->kind:I

    iget-object v2, v9, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v2, v2, Lorg/rabochaya/projects/ObjectListing$Options;->visibility:I

    iget-object v3, v9, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v3, v3, Lorg/rabochaya/projects/ObjectListing$Options;->sort:I

    filled-new-array {v0, v1, v2, v3}, [I

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual/range {p1 .. p1}, Lorg/rabochaya/projects/ObjectFormDraft;->choices()[I

    move-result-object v0

    :goto_0
    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v10, :cond_1

    iget-object v4, v9, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-boolean v4, v4, Lorg/rabochaya/projects/ObjectListing$Options;->recursive:Z

    iget-object v5, v9, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-boolean v5, v5, Lorg/rabochaya/projects/ObjectListing$Options;->foldersFirst:Z

    new-array v6, v1, [Z

    aput-boolean v4, v6, v2

    aput-boolean v5, v6, v3

    goto :goto_1

    :cond_1
    invoke-virtual/range {p1 .. p1}, Lorg/rabochaya/projects/ObjectFormDraft;->checks()[Z

    move-result-object v6

    .line 167
    :goto_1
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v5, 0x10

    const/16 v7, 0x8

    invoke-virtual {v4, v5, v7, v5, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->input()Landroid/widget/EditText;

    move-result-object v8

    invoke-virtual {v8, v3}, Landroid/widget/EditText;->setSingleLine(Z)V

    const-string v5, "\u0422\u0435\u043a\u0441\u0442 \u0434\u043b\u044f \u043f\u043e\u0438\u0441\u043a\u0430"

    invoke-virtual {v8, v5}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-virtual {v8, v5}, Landroid/widget/EditText;->setContentDescription(Ljava/lang/CharSequence;)V

    new-array v5, v3, [Landroid/text/InputFilter;

    new-instance v7, Landroid/text/InputFilter$LengthFilter;

    const/16 v11, 0x100

    invoke-direct {v7, v11}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v7, v5, v2

    invoke-virtual {v8, v5}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    if-nez v10, :cond_2

    iget-object v5, v9, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v5, v5, Lorg/rabochaya/projects/ObjectListing$Options;->query:Ljava/lang/String;

    goto :goto_2

    :cond_2
    invoke-virtual/range {p1 .. p1}, Lorg/rabochaya/projects/ObjectFormDraft;->texts()[Ljava/lang/String;

    move-result-object v5

    aget-object v5, v5, v2

    :goto_2
    invoke-virtual {v8, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v4, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 168
    sget-object v5, Lorg/rabochaya/projects/ObjectListing;->SEARCH_FIELDS:[Ljava/lang/String;

    aget v7, v0, v2

    const-string v11, "\u0418\u0441\u043a\u0430\u0442\u044c \u0432"

    invoke-direct {v9, v4, v11, v5, v7}, Lorg/rabochaya/projects/ObjectManagerActivity;->option(Landroid/widget/LinearLayout;Ljava/lang/String;[Ljava/lang/String;I)Landroid/widget/Spinner;

    move-result-object v11

    sget-object v5, Lorg/rabochaya/projects/ObjectListing;->KINDS:[Ljava/lang/String;

    aget v7, v0, v3

    const-string v12, "\u0422\u0438\u043f \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432"

    invoke-direct {v9, v4, v12, v5, v7}, Lorg/rabochaya/projects/ObjectManagerActivity;->option(Landroid/widget/LinearLayout;Ljava/lang/String;[Ljava/lang/String;I)Landroid/widget/Spinner;

    move-result-object v12

    sget-object v5, Lorg/rabochaya/projects/ObjectListing;->VISIBILITY:[Ljava/lang/String;

    aget v7, v0, v1

    const-string v13, "\u0412\u0438\u0434\u0438\u043c\u043e\u0441\u0442\u044c \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432"

    invoke-direct {v9, v4, v13, v5, v7}, Lorg/rabochaya/projects/ObjectManagerActivity;->option(Landroid/widget/LinearLayout;Ljava/lang/String;[Ljava/lang/String;I)Landroid/widget/Spinner;

    move-result-object v13

    sget-object v5, Lorg/rabochaya/projects/ObjectListing;->SORTS:[Ljava/lang/String;

    const/4 v7, 0x3

    aget v0, v0, v7

    const-string v14, "\u041f\u043e\u0440\u044f\u0434\u043e\u043a \u0441\u043f\u0438\u0441\u043a\u0430"

    invoke-direct {v9, v4, v14, v5, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->option(Landroid/widget/LinearLayout;Ljava/lang/String;[Ljava/lang/String;I)Landroid/widget/Spinner;

    move-result-object v14

    const-string v0, "\u0421 \u0432\u043b\u043e\u0436\u0435\u043d\u043d\u044b\u043c\u0438 \u043f\u0430\u043f\u043a\u0430\u043c\u0438"

    aget-boolean v5, v6, v2

    invoke-direct {v9, v4, v0, v5}, Lorg/rabochaya/projects/ObjectManagerActivity;->option(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v15

    const-string v0, "\u041f\u0430\u043f\u043a\u0438 \u0432\u043d\u0430\u0447\u0430\u043b\u0435"

    aget-boolean v5, v6, v3

    invoke-direct {v9, v4, v0, v5}, Lorg/rabochaya/projects/ObjectManagerActivity;->option(Landroid/widget/LinearLayout;Ljava/lang/String;Z)Landroid/widget/CheckBox;

    move-result-object v16

    new-instance v6, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

    new-array v5, v3, [Landroid/widget/EditText;

    aput-object v8, v5, v2

    const/4 v0, 0x4

    new-array v0, v0, [Landroid/widget/Spinner;

    aput-object v11, v0, v2

    aput-object v12, v0, v3

    aput-object v13, v0, v1

    aput-object v14, v0, v7

    new-array v7, v1, [Landroid/widget/CheckBox;

    aput-object v15, v7, v2

    aput-object v16, v7, v3

    const/16 v17, 0x0

    const-string v2, "search"

    move-object/from16 v18, v0

    move-object v0, v6

    move-object/from16 v1, p0

    move-object v3, v4

    move-object v4, v5

    move-object/from16 v5, v18

    move-object v10, v6

    move-object v6, v7

    move-object/from16 v7, v17

    invoke-direct/range {v0 .. v7}, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Ljava/lang/String;Landroid/widget/LinearLayout;[Landroid/widget/EditText;[Landroid/widget/Spinner;[Landroid/widget/CheckBox;Landroid/widget/TextView;)V

    .line 169
    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->dialog()Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041f\u043e\u0438\u0441\u043a \u0438 \u0444\u0438\u043b\u044c\u0442\u0440\u044b"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v1, v10, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->pane:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    new-instance v6, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda8;

    move-object v0, v6

    move-object/from16 v1, p0

    move-object v2, v8

    move-object v3, v12

    move-object v4, v13

    move-object v5, v14

    move-object v12, v6

    move-object v6, v15

    move-object v13, v7

    move-object/from16 v7, v16

    move-object v8, v11

    invoke-direct/range {v0 .. v8}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda8;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/widget/EditText;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/Spinner;)V

    const-string v0, "\u041f\u0440\u0438\u043c\u0435\u043d\u0438\u0442\u044c"

    invoke-virtual {v13, v0, v12}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda9;

    invoke-direct {v1, v9}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda9;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    const-string v2, "\u0421\u0431\u0440\u043e\u0441\u0438\u0442\u044c"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v10, v0}, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->bind(Landroid/app/AlertDialog;)V

    new-instance v1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;

    move-object/from16 v2, p1

    move-object v3, v10

    invoke-direct {v1, v3, v2}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda10;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;Lorg/rabochaya/projects/ObjectFormDraft;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 170
    return-void
.end method

.method private selection()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 112
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "\u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u043e\u0431\u044a\u0435\u043a\u0442\u044b"

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->notice(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method private selectionSummary()V
    .locals 3

    .line 59
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selectionInfo:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u0412\u044b\u0431\u0440\u0430\u043d\u043e: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " \u00b7 \u0432\u043d\u0435 \u0441\u043f\u0438\u0441\u043a\u0430: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->outsideSelection()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private styleDialog(Landroid/app/AlertDialog;)V
    .locals 16

    .line 36
    move-object/from16 v12, p0

    invoke-virtual/range {p1 .. p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-direct {v12, v2}, Lorg/rabochaya/projects/ObjectManagerActivity;->watchFont(Landroid/view/View;)V

    .line 37
    const v0, 0x102002b

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 38
    :cond_0
    new-instance v6, Ljava/util/LinkedHashMap;

    invoke-direct {v6}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-direct {v12, v0, v6}, Lorg/rabochaya/projects/ObjectManagerActivity;->dialogPadding(Landroid/view/View;Ljava/util/Map;)V

    invoke-interface {v6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    move v3, v1

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    instance-of v4, v4, Landroid/widget/EditText;

    if-eqz v4, :cond_1

    move v3, v5

    goto :goto_0

    :cond_2
    if-nez v3, :cond_3

    return-void

    .line 39
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v3, "topPanel"

    const-string v4, "id"

    const-string v7, "android"

    invoke-virtual {v0, v3, v4, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual/range {p0 .. p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v3, "buttonPanel"

    invoke-virtual {v0, v3, v4, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 40
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v3

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v4

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v7

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v9

    const/4 v10, -0x1

    filled-new-array {v3, v4, v7, v9, v10}, [I

    move-result-object v3

    invoke-interface {v6, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    :cond_4
    if-nez v8, :cond_5

    const/16 v0, 0x8

    goto :goto_1

    :cond_5
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v0

    :goto_1
    move v7, v0

    invoke-virtual/range {p1 .. p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v10, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    invoke-virtual/range {p1 .. p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v11, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 42
    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v9

    const v0, 0x1010031

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-virtual {v12, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    const v3, -0xcfcfd0

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v13

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    new-array v3, v5, [Z

    aput-boolean v1, v3, v1

    .line 43
    invoke-virtual {v2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v14

    new-instance v15, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda0;

    move-object v0, v15

    move-object/from16 v1, p0

    move-object v4, v8

    move v5, v7

    move-object/from16 v7, p1

    move v8, v13

    invoke-direct/range {v0 .. v11}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/view/View;[ZLandroid/view/View;ILjava/util/Map;Landroid/app/AlertDialog;ILandroid/graphics/drawable/Drawable;II)V

    invoke-virtual {v14, v15}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 52
    return-void
.end method

.method private viewPrefs()Landroid/content/SharedPreferences;
    .locals 2

    .line 141
    const-string v0, "object-manager-view"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/rabochaya/projects/ObjectManagerActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method private visibility(Z)V
    .locals 14

    .line 85
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->selection()Ljava/util/List;

    move-result-object v6

    if-nez v6, :cond_0

    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->snapshot:Lorg/w3c/dom/Element;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    invoke-static {v0, v6, p1, v1}, Lorg/rabochaya/projects/ObjectVisibility;->preview(Lorg/w3c/dom/Element;Ljava/util/Collection;ZLjava/lang/String;)Lorg/rabochaya/projects/ObjectVisibility$Preview;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v13, ""

    if-eqz p1, :cond_1

    :try_start_1
    iget v1, v0, Lorg/rabochaya/projects/ObjectVisibility$Preview;->selectedStillHidden:I

    if-lez v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " \u0418\u0437-\u0437\u0430 \u0441\u043a\u0440\u044b\u0442\u044b\u0445 \u0440\u043e\u0434\u0438\u0442\u0435\u043b\u0435\u0439 \u043e\u0441\u0442\u0430\u043d\u0435\u0442\u0441\u044f \u0441\u043a\u0440\u044b\u0442\u043e \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0445 \u044d\u043b\u0435\u043c\u0435\u043d\u0442\u043e\u0432: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lorg/rabochaya/projects/ObjectVisibility$Preview;->selectedStillHidden:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ". \u0420\u043e\u0434\u0438\u0442\u0435\u043b\u044c\u0441\u043a\u0438\u0435 \u043f\u0430\u043f\u043a\u0438 \u0430\u0432\u0442\u043e\u043c\u0430\u0442\u0438\u0447\u0435\u0441\u043a\u0438 \u043d\u0435 \u0440\u0430\u0441\u043a\u0440\u044b\u0432\u0430\u044e\u0442\u0441\u044f."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    move-object v1, v13

    :goto_0
    iget v2, v0, Lorg/rabochaya/projects/ObjectVisibility$Preview;->changed:I

    if-nez v2, :cond_3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u0421\u043e\u0431\u0441\u0442\u0432\u0435\u043d\u043d\u0430\u044f \u0432\u0438\u0434\u0438\u043c\u043e\u0441\u0442\u044c \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0445 \u044d\u043b\u0435\u043c\u0435\u043d\u0442\u043e\u0432 \u0443\u0436\u0435 "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    if-eqz p1, :cond_2

    const-string p1, "\u0432\u043a\u043b\u044e\u0447\u0435\u043d\u0430."

    goto :goto_1

    :cond_2
    const-string p1, "\u0432\u044b\u043a\u043b\u044e\u0447\u0435\u043d\u0430."

    :goto_1
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->notice(Ljava/lang/String;)V

    return-void

    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u0412\u044b\u0431\u0440\u0430\u043d\u043e \u0441\u0442\u0440\u043e\u043a: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Lorg/rabochaya/projects/ObjectVisibility$Preview;->selected:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", \u0432\u043d\u0435 \u0441\u043f\u0438\u0441\u043a\u0430: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->outsideSelection()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ". \u0411\u0443\u0434\u0435\u0442 \u0438\u0437\u043c\u0435\u043d\u0435\u043d\u0430 \u0441\u043e\u0431\u0441\u0442\u0432\u0435\u043d\u043d\u0430\u044f \u0432\u0438\u0434\u0438\u043c\u043e\u0441\u0442\u044c: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Lorg/rabochaya/projects/ObjectVisibility$Preview;->changed:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ". \u041f\u043e KML \u0441\u0442\u0430\u043d\u0435\u0442 \u0432\u0438\u0434\u0438\u043c\u044b\u043c\u0438 \u0441\u0442\u0440\u043e\u043a \u0438 \u043f\u0430\u043f\u043e\u043a: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, v0, Lorg/rabochaya/projects/ObjectVisibility$Preview;->shown:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", \u0441\u043a\u0440\u044b\u0442\u044b\u043c\u0438: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v0, v0, Lorg/rabochaya/projects/ObjectVisibility$Preview;->hidden:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ". \u0421\u043e\u0434\u0435\u0440\u0436\u0438\u043c\u043e\u0435 \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0445 \u043f\u0430\u043f\u043e\u043a \u0443\u0447\u0438\u0442\u044b\u0432\u0430\u0435\u0442\u0441\u044f \u0447\u0435\u0440\u0435\u0437 \u043d\u0430\u0441\u043b\u0435\u0434\u043e\u0432\u0430\u043d\u0438\u0435; \u0441\u043e\u0431\u0441\u0442\u0432\u0435\u043d\u043d\u044b\u0435 \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438 \u043e\u0441\u0442\u0430\u043b\u044c\u043d\u044b\u0445 \u044d\u043b\u0435\u043c\u0435\u043d\u0442\u043e\u0432 \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u0442\u0441\u044f."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    iget-wide v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    if-eqz p1, :cond_4

    const-string v2, "show"

    goto :goto_2

    :cond_4
    const-string v2, "hide"

    :goto_2
    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    sget-object v4, Lorg/rabochaya/projects/ObjectManagerActivity;->SELECTION_SESSION:Ljava/lang/String;

    iget-object v5, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->rows:Ljava/util/List;

    const-string v7, ""

    const-string v8, ""

    const-string v9, ""

    if-eqz p1, :cond_5

    const-string p1, "\u041f\u043e\u043a\u0430\u0437\u0430\u0442\u044c \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0435?"

    goto :goto_3

    :cond_5
    const-string p1, "\u0421\u043a\u0440\u044b\u0442\u044c \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u044b\u0435?"

    :goto_3
    move-object v10, p1

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->outsideSelection()I

    move-result v12

    invoke-static/range {v0 .. v12}, Lorg/rabochaya/projects/ObjectConfirmationDraft;->capture(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/Collection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lorg/rabochaya/projects/ObjectConfirmationDraft;

    move-result-object p1

    invoke-direct {p0, p1, v13}, Lorg/rabochaya/projects/ObjectManagerActivity;->openConfirmation(Lorg/rabochaya/projects/ObjectConfirmationDraft;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_4

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->notice(Ljava/lang/String;)V

    :goto_4
    return-void
.end method

.method private watchFont(Landroid/view/View;)V
    .locals 2

    .line 33
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda42;

    invoke-direct {v1, p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda42;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->font(Landroid/view/View;)V

    return-void
.end method

.method private withDates(ILjava/lang/String;Ljava/lang/String;)Lorg/rabochaya/projects/ObjectListing$Options;
    .locals 12

    .line 173
    new-instance v11, Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v1, v0, Lorg/rabochaya/projects/ObjectListing$Options;->query:Ljava/lang/String;

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v2, v0, Lorg/rabochaya/projects/ObjectListing$Options;->kind:I

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v3, v0, Lorg/rabochaya/projects/ObjectListing$Options;->visibility:I

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v4, v0, Lorg/rabochaya/projects/ObjectListing$Options;->sort:I

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-boolean v5, v0, Lorg/rabochaya/projects/ObjectListing$Options;->recursive:Z

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-boolean v6, v0, Lorg/rabochaya/projects/ObjectListing$Options;->foldersFirst:Z

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v7, v0, Lorg/rabochaya/projects/ObjectListing$Options;->searchField:I

    move-object v0, v11

    move v8, p1

    move-object v9, p2

    move-object v10, p3

    invoke-direct/range {v0 .. v10}, Lorg/rabochaya/projects/ObjectListing$Options;-><init>(Ljava/lang/String;IIIZZIILjava/lang/String;Ljava/lang/String;)V

    return-object v11
.end method

.method private write(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 133
    iget-object v4, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/ObjectManagerActivity;->write(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Landroid/app/AlertDialog;)V

    return-void
.end method

.method private write(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Landroid/app/AlertDialog;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/app/AlertDialog;",
            ")V"
        }
    .end annotation

    .line 135
    iget-boolean v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->busy:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->snapshot:Lorg/w3c/dom/Element;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->enabled(Z)V

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->adapter:Lorg/rabochaya/projects/ObjectManagerActivity$Rows;

    invoke-virtual {v1}, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->notifyDataSetChanged()V

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->status:Landroid/widget/TextView;

    const-string v2, "\u0421\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u0438\u0435\u2026"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz p5, :cond_1

    const/4 v1, -0x1

    invoke-virtual {p5, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    const/4 v1, -0x2

    invoke-virtual {p5, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p5, v0}, Landroid/app/AlertDialog;->setCancelable(Z)V

    .line 136
    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v8, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda29;

    move-object v1, v8

    move-object v2, p0

    move-object v3, p1

    move-object v4, p3

    move-object v5, p4

    move-object v6, p2

    move-object v7, p5

    invoke-direct/range {v1 .. v7}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda29;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Landroid/app/AlertDialog;)V

    invoke-interface {v0, v8}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 140
    return-void

    .line 135
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method synthetic lambda$button$8$org-rabochaya-projects-ObjectManagerActivity(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 54
    iget-boolean p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->busy:Z

    if-nez p2, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method synthetic lambda$capture$25$org-rabochaya-projects-ObjectManagerActivity(Z)V
    .locals 2

    .line 86
    iget-boolean v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->disposed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->enabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p1, :cond_1

    const-string p1, "\u0412\u044b\u0440\u0435\u0437\u0430\u043d\u0438\u0435 \u043f\u043e\u0434\u0433\u043e\u0442\u043e\u0432\u043b\u0435\u043d\u043e"

    goto :goto_0

    :cond_1
    const-string p1, "\u0412\u044b\u0431\u043e\u0440 \u0441\u043a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u043d \u0432 \u0431\u0443\u0444\u0435\u0440"

    :goto_0
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ". \u041e\u0442\u043a\u0440\u043e\u0439\u0442\u0435 \u043f\u0430\u043f\u043a\u0443 \u043d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u044f \u0438 \u0432\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u00ab\u0412\u0441\u0442\u0430\u0432\u0438\u0442\u044c \u0432 \u044d\u0442\u0443 \u043f\u0430\u043f\u043a\u0443\u00bb. \u041f\u0440\u0438 \u0438\u0437\u043c\u0435\u043d\u0435\u043d\u0438\u0438 \u043f\u0440\u043e\u0435\u043a\u0442\u0430 \u043f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u0435 \u0432\u044b\u0431\u043e\u0440."

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$capture$26$org-rabochaya-projects-ObjectManagerActivity(ZLjava/util/List;Ljava/lang/String;)V
    .locals 7

    .line 86
    new-instance v6, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v6, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V

    :try_start_0
    iget-wide v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    move-object v0, v6

    move v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lorg/rabochaya/projects/ObjectClipboardWrites;->capture(Lorg/rabochaya/projects/ProjectStore;JZLjava/util/List;Ljava/lang/String;)V

    new-instance p2, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda2;

    invoke-direct {p2, p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda2;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Z)V

    invoke-virtual {p0, p2}, Lorg/rabochaya/projects/ObjectManagerActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->clipboardError(Ljava/lang/Exception;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    invoke-virtual {v6}, Lorg/rabochaya/projects/ProjectStore;->close()V

    return-void

    :goto_1
    invoke-virtual {v6}, Lorg/rabochaya/projects/ProjectStore;->close()V

    throw p1
.end method

.method synthetic lambda$clearClipboard$27$org-rabochaya-projects-ObjectManagerActivity()V
    .locals 2

    .line 87
    iget-boolean v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->disposed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->enabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u0411\u0443\u0444\u0435\u0440 \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432 \u043e\u0447\u0438\u0449\u0435\u043d"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$clearClipboard$28$org-rabochaya-projects-ObjectManagerActivity()V
    .locals 2

    .line 87
    new-instance v0, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V

    :try_start_0
    invoke-static {v0}, Lorg/rabochaya/projects/ObjectClipboardWrites;->clear(Lorg/rabochaya/projects/ProjectStore;)V

    new-instance v1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda1;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    invoke-virtual {p0, v1}, Lorg/rabochaya/projects/ObjectManagerActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_1
    invoke-direct {p0, v1}, Lorg/rabochaya/projects/ObjectManagerActivity;->clipboardError(Ljava/lang/Exception;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    return-void

    :goto_1
    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    throw v1
.end method

.method synthetic lambda$clipboardError$29$org-rabochaya-projects-ObjectManagerActivity(Ljava/lang/Exception;)V
    .locals 2

    .line 88
    iget-boolean v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->disposed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->enabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->notice(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$dateOptions$48$org-rabochaya-projects-ObjectManagerActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 179
    const/4 p1, 0x0

    const-string p2, ""

    invoke-direct {p0, p1, p2, p2}, Lorg/rabochaya/projects/ObjectManagerActivity;->withDates(ILjava/lang/String;Ljava/lang/String;)Lorg/rabochaya/projects/ObjectListing$Options;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->rememberView()V

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->render()V

    return-void
.end method

.method synthetic lambda$dateOptions$49$org-rabochaya-projects-ObjectManagerActivity(Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/app/AlertDialog;Landroid/widget/TextView;Landroid/view/View;)V
    .locals 0

    .line 180
    :try_start_0
    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p0, p1, p2, p3}, Lorg/rabochaya/projects/ObjectManagerActivity;->withDates(ILjava/lang/String;Ljava/lang/String;)Lorg/rabochaya/projects/ObjectListing$Options;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->rememberView()V

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->render()V

    invoke-virtual {p4}, Landroid/app/AlertDialog;->dismiss()V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p5, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$dateOptions$50$org-rabochaya-projects-ObjectManagerActivity(Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;Lorg/rabochaya/projects/ObjectFormDraft;Landroid/app/AlertDialog;Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/TextView;Landroid/content/DialogInterface;)V
    .locals 7

    .line 180
    invoke-virtual {p1, p2}, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->shown(Lorg/rabochaya/projects/ObjectFormDraft;)V

    const/4 p1, -0x1

    invoke-virtual {p3, p1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p1

    new-instance p2, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda48;

    move-object v0, p2

    move-object v1, p0

    move-object v2, p4

    move-object v3, p5

    move-object v4, p6

    move-object v5, p3

    move-object v6, p7

    invoke-direct/range {v0 .. v6}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda48;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/widget/Spinner;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/app/AlertDialog;Landroid/widget/TextView;)V

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$destination$35$org-rabochaya-projects-ObjectManagerActivity(Ljava/util/List;Ljava/util/List;Ljava/util/List;Landroid/content/DialogInterface;I)V
    .locals 9

    .line 115
    :try_start_0
    iget-wide v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    sget-object v3, Lorg/rabochaya/projects/ObjectManagerActivity;->SELECTION_SESSION:Ljava/lang/String;

    iget-object v4, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->rows:Ljava/util/List;

    invoke-interface {p2, p5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    move-object v6, p2

    check-cast v6, Ljava/lang/String;

    invoke-interface {p3, p5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    move-object v7, p2

    check-cast v7, Ljava/lang/String;

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->outsideSelection()I

    move-result v8

    move-object v5, p1

    invoke-static/range {v0 .. v8}, Lorg/rabochaya/projects/ObjectMoveDraft;->capture(JLjava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/Collection;Ljava/lang/String;Ljava/lang/String;I)Lorg/rabochaya/projects/ObjectMoveDraft;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->openMove(Lorg/rabochaya/projects/ObjectMoveDraft;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->notice(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$load$10$org-rabochaya-projects-ObjectManagerActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 56
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->load()V

    return-void
.end method

.method synthetic lambda$load$11$org-rabochaya-projects-ObjectManagerActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 56
    invoke-virtual {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->finish()V

    return-void
.end method

.method synthetic lambda$load$12$org-rabochaya-projects-ObjectManagerActivity(Ljava/lang/Exception;)V
    .locals 3

    .line 56
    iget-boolean v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->disposed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->enabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->dialog()Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043e\u0442\u043a\u0440\u044b\u0442\u044c \u043c\u0435\u043d\u0435\u0434\u0436\u0435\u0440: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda46;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda46;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    const-string v1, "\u041f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u044c"

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance v0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda47;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda47;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    const-string v1, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    invoke-virtual {p1, v1, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method synthetic lambda$load$13$org-rabochaya-projects-ObjectManagerActivity(Z)V
    .locals 9

    .line 56
    new-instance v0, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V

    :try_start_0
    iget-wide v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object v5

    invoke-static {v5}, Lorg/rabochaya/projects/ObjectTree;->rows(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v6

    invoke-static {v5}, Lorg/rabochaya/projects/ObjectTree;->token(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v6}, Lorg/rabochaya/projects/ObjectListing;->build(Lorg/w3c/dom/Element;Ljava/util/List;)Lorg/rabochaya/projects/ObjectListing;

    move-result-object v7

    if-eqz p1, :cond_0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->clipboardStamp(Lorg/rabochaya/projects/ProjectStore;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    move-object v8, p1

    new-instance p1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda34;

    move-object v2, p1

    move-object v3, p0

    invoke-direct/range {v2 .. v8}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda34;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Ljava/lang/String;Lorg/w3c/dom/Element;Ljava/util/List;Lorg/rabochaya/projects/ObjectListing;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception p1

    :try_start_1
    new-instance v1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda35;

    invoke-direct {v1, p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda35;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, v1}, Lorg/rabochaya/projects/ObjectManagerActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    return-void

    :goto_2
    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    throw p1
.end method

.method synthetic lambda$load$9$org-rabochaya-projects-ObjectManagerActivity(Ljava/lang/String;Lorg/w3c/dom/Element;Ljava/util/List;Lorg/rabochaya/projects/ObjectListing;Ljava/lang/String;)V
    .locals 2

    .line 56
    iget-boolean v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->disposed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    const-string v1, ""

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    iput-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    :cond_2
    iput-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->snapshot:Lorg/w3c/dom/Element;

    iput-object p3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->rows:Ljava/util/List;

    iput-object p4, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->listing:Lorg/rabochaya/projects/ObjectListing;

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_4

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->listing:Lorg/rabochaya/projects/ObjectListing;

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lorg/rabochaya/projects/ObjectListing;->get(Ljava/lang/String;)Lorg/rabochaya/projects/ObjectListing$Item;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->listing:Lorg/rabochaya/projects/ObjectListing;

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lorg/rabochaya/projects/ObjectListing;->get(Ljava/lang/String;)Lorg/rabochaya/projects/ObjectListing$Item;

    move-result-object p1

    iget-object p1, p1, Lorg/rabochaya/projects/ObjectListing$Item;->row:Lorg/rabochaya/projects/ObjectTree$Row;

    iget-boolean p1, p1, Lorg/rabochaya/projects/ObjectTree$Row;->folder:Z

    if-nez p1, :cond_4

    :cond_3
    iput-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    :cond_4
    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->restoreSelection()V

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->rememberView()V

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->render()V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->enabled(Z)V

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->status:Landroid/widget/TextView;

    const-string p2, "\u0424\u043b\u0430\u0436\u043a\u0438 \u2014 \u0432\u044b\u0431\u043e\u0440, \u0434\u043e\u043b\u0433\u043e\u0435 \u043d\u0430\u0436\u0430\u0442\u0438\u0435 \u2014 \u0434\u0435\u0439\u0441\u0442\u0432\u0438\u044f, \u00ab\u041e\u0442\u043a\u0440\u044b\u0442\u044c\u00bb \u2014 \u0432\u0445\u043e\u0434 \u0432 \u043f\u0430\u043f\u043a\u0443"

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->restoreEditor()V

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->restoreForm()V

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->restoreMove()V

    invoke-direct {p0, p5}, Lorg/rabochaya/projects/ObjectManagerActivity;->restoreConfirmation(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$menu$24$org-rabochaya-projects-ObjectManagerActivity(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 83
    iget-boolean p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->busy:Z

    if-eqz p1, :cond_0

    return-void

    :cond_0
    const/4 p1, 0x1

    const/4 v0, 0x0

    packed-switch p2, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->description()V

    goto :goto_1

    :pswitch_1
    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->visibility(Z)V

    goto :goto_1

    :pswitch_2
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->visibility(Z)V

    goto :goto_1

    :pswitch_3
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->clearClipboard()V

    goto :goto_1

    :pswitch_4
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->paste()V

    goto :goto_1

    :pswitch_5
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->capture(Z)V

    goto :goto_1

    :pswitch_6
    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->capture(Z)V

    goto :goto_1

    :pswitch_7
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->load()V

    goto :goto_1

    :pswitch_8
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->name(Z)V

    goto :goto_1

    :pswitch_9
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->confirmDelete()V

    goto :goto_1

    :pswitch_a
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->destination()V

    goto :goto_1

    :pswitch_b
    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    :cond_1
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->render()V

    goto :goto_1

    :pswitch_c
    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->visible:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/rabochaya/projects/ObjectTree$Row;

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    iget-object p2, p2, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :pswitch_d
    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->name(Z)V

    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method synthetic lambda$onCreate$0$org-rabochaya-projects-ObjectManagerActivity()V
    .locals 0

    .line 24
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->parent()V

    return-void
.end method

.method synthetic lambda$onCreate$1$org-rabochaya-projects-ObjectManagerActivity()V
    .locals 0

    .line 24
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->menu()V

    return-void
.end method

.method synthetic lambda$onCreate$2$org-rabochaya-projects-ObjectManagerActivity()V
    .locals 0

    .line 24
    invoke-virtual {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->finish()V

    return-void
.end method

.method synthetic lambda$onCreate$3$org-rabochaya-projects-ObjectManagerActivity()V
    .locals 0

    .line 25
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->searchOptions()V

    return-void
.end method

.method synthetic lambda$onCreate$4$org-rabochaya-projects-ObjectManagerActivity()V
    .locals 0

    .line 25
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->dateOptions()V

    return-void
.end method

.method synthetic lambda$onCreate$5$org-rabochaya-projects-ObjectManagerActivity()V
    .locals 5

    .line 27
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->refreshOnResume:Z

    const/4 v0, 0x0

    const-string v1, "org.rabochaya.projects.ProjectsActivity"

    invoke-virtual {p0, v1, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "project"

    iget-wide v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    invoke-interface {v0, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "folder"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method synthetic lambda$openConfirmation$39$org-rabochaya-projects-ObjectManagerActivity(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .locals 0

    .line 131
    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->confirmationDialog:Landroid/app/AlertDialog;

    if-ne p2, p1, :cond_0

    const/4 p1, 0x0

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->confirmationDraft:Lorg/rabochaya/projects/ObjectConfirmationDraft;

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->confirmationDialog:Landroid/app/AlertDialog;

    :cond_0
    return-void
.end method

.method synthetic lambda$openConfirmation$40$org-rabochaya-projects-ObjectManagerActivity(ZLorg/rabochaya/projects/ObjectConfirmationDraft;Landroid/app/AlertDialog;Ljava/util/List;Landroid/view/View;)V
    .locals 6

    .line 131
    if-eqz p1, :cond_2

    iget-boolean v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->busy:Z

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p2}, Lorg/rabochaya/projects/ObjectConfirmationDraft;->paste()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p2, Lorg/rabochaya/projects/ObjectConfirmationDraft;->fingerprint:Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    iget-object v3, p2, Lorg/rabochaya/projects/ObjectConfirmationDraft;->destination:Ljava/lang/String;

    iget-object v4, p2, Lorg/rabochaya/projects/ObjectConfirmationDraft;->token:Ljava/lang/String;

    const-string v1, "paste"

    move-object v0, p0

    goto :goto_0

    :cond_1
    iget-object v1, p2, Lorg/rabochaya/projects/ObjectConfirmationDraft;->action:Ljava/lang/String;

    const-string v3, ""

    iget-object v4, p2, Lorg/rabochaya/projects/ObjectConfirmationDraft;->token:Ljava/lang/String;

    move-object v0, p0

    move-object v2, p4

    :goto_0
    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/ObjectManagerActivity;->write(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Landroid/app/AlertDialog;)V

    :cond_2
    :goto_1
    return-void
.end method

.method synthetic lambda$openConfirmation$41$org-rabochaya-projects-ObjectManagerActivity(Landroid/app/AlertDialog;ZLorg/rabochaya/projects/ObjectConfirmationDraft;Ljava/util/List;Landroid/content/DialogInterface;)V
    .locals 7

    .line 131
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->styleDialog(Landroid/app/AlertDialog;)V

    const/4 p5, -0x1

    invoke-virtual {p1, p5}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p1, p5}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p5

    new-instance v6, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda5;

    move-object v0, v6

    move-object v1, p0

    move v2, p2

    move-object v3, p3

    move-object v4, p1

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda5;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;ZLorg/rabochaya/projects/ObjectConfirmationDraft;Landroid/app/AlertDialog;Ljava/util/List;)V

    invoke-virtual {p5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$openEditor$32$org-rabochaya-projects-ObjectManagerActivity(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .locals 0

    .line 109
    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->editorDialog:Landroid/app/AlertDialog;

    if-ne p2, p1, :cond_0

    const/4 p1, 0x0

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->editorDraft:Lorg/rabochaya/projects/ObjectEditorDraft;

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->editorInput:Landroid/widget/EditText;

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->editorDialog:Landroid/app/AlertDialog;

    :cond_0
    return-void
.end method

.method synthetic lambda$openEditor$33$org-rabochaya-projects-ObjectManagerActivity(ZLandroid/widget/EditText;ZLorg/rabochaya/projects/ObjectEditorDraft;Landroid/app/AlertDialog;Landroid/view/View;)V
    .locals 6

    .line 110
    if-eqz p1, :cond_3

    iget-boolean p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->busy:Z

    if-eqz p1, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    if-eqz p3, :cond_1

    :try_start_0
    invoke-static {v3}, Lorg/rabochaya/projects/ObjectDescription;->validate(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_2

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    const/16 p3, 0x3e8

    if-gt p1, p3, :cond_2

    :goto_0
    iget-object v1, p4, Lorg/rabochaya/projects/ObjectEditorDraft;->operation:Ljava/lang/String;

    iget-object p1, p4, Lorg/rabochaya/projects/ObjectEditorDraft;->key:Ljava/lang/String;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    iget-object v4, p4, Lorg/rabochaya/projects/ObjectEditorDraft;->token:Ljava/lang/String;

    move-object v0, p0

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/ObjectManagerActivity;->write(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Landroid/app/AlertDialog;)V

    return-void

    :cond_2
    :try_start_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p3, "\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435: \u043e\u0442 1 \u0434\u043e 1000 \u0441\u0438\u043c\u0432\u043e\u043b\u043e\u0432"

    invoke-direct {p1, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :cond_3
    :goto_1
    return-void
.end method

.method synthetic lambda$openEditor$34$org-rabochaya-projects-ObjectManagerActivity(Landroid/app/AlertDialog;ZLandroid/widget/EditText;ZLorg/rabochaya/projects/ObjectEditorDraft;Landroid/content/DialogInterface;)V
    .locals 8

    .line 110
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->styleDialog(Landroid/app/AlertDialog;)V

    const/4 p6, -0x1

    invoke-virtual {p1, p6}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p1, p6}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p6

    new-instance v7, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda49;

    move-object v0, v7

    move-object v1, p0

    move v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    move-object v6, p1

    invoke-direct/range {v0 .. v6}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda49;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;ZLandroid/widget/EditText;ZLorg/rabochaya/projects/ObjectEditorDraft;Landroid/app/AlertDialog;)V

    invoke-virtual {p6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$openMove$36$org-rabochaya-projects-ObjectManagerActivity(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .locals 0

    .line 123
    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->moveDialog:Landroid/app/AlertDialog;

    if-ne p2, p1, :cond_0

    const/4 p1, 0x0

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->moveDraft:Lorg/rabochaya/projects/ObjectMoveDraft;

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->moveDialog:Landroid/app/AlertDialog;

    :cond_0
    return-void
.end method

.method synthetic lambda$openMove$37$org-rabochaya-projects-ObjectManagerActivity(ZLjava/util/List;Lorg/rabochaya/projects/ObjectMoveDraft;Landroid/app/AlertDialog;Landroid/view/View;)V
    .locals 6

    .line 123
    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->busy:Z

    if-nez p1, :cond_0

    iget-object v3, p3, Lorg/rabochaya/projects/ObjectMoveDraft;->destination:Ljava/lang/String;

    iget-object v4, p3, Lorg/rabochaya/projects/ObjectMoveDraft;->token:Ljava/lang/String;

    const-string v1, "move"

    move-object v0, p0

    move-object v2, p2

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/ObjectManagerActivity;->write(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Landroid/app/AlertDialog;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$openMove$38$org-rabochaya-projects-ObjectManagerActivity(Landroid/app/AlertDialog;ZLjava/util/List;Lorg/rabochaya/projects/ObjectMoveDraft;Landroid/content/DialogInterface;)V
    .locals 7

    .line 123
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->styleDialog(Landroid/app/AlertDialog;)V

    const/4 p5, -0x1

    invoke-virtual {p1, p5}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p1, p5}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p5

    new-instance v6, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda7;

    move-object v0, v6

    move-object v1, p0

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda7;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;ZLjava/util/List;Lorg/rabochaya/projects/ObjectMoveDraft;Landroid/app/AlertDialog;)V

    invoke-virtual {p5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$paste$30$org-rabochaya-projects-ObjectManagerActivity(Lorg/rabochaya/projects/ObjectConfirmationDraft;Ljava/lang/String;)V
    .locals 1

    .line 91
    iget-boolean v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->disposed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->enabled(Z)V

    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/ObjectManagerActivity;->openConfirmation(Lorg/rabochaya/projects/ObjectConfirmationDraft;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$paste$31$org-rabochaya-projects-ObjectManagerActivity(Ljava/lang/String;Lorg/w3c/dom/Element;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 17

    .line 91
    move-object/from16 v1, p0

    new-instance v2, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v2, v1}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V

    :try_start_0
    invoke-static {v2}, Lorg/rabochaya/projects/ObjectClipboardWrites;->get(Lorg/rabochaya/projects/ProjectStore;)Lorg/rabochaya/projects/ObjectClipboard;

    move-result-object v0

    if-eqz v0, :cond_5

    iget-wide v3, v0, Lorg/rabochaya/projects/ObjectClipboard;->project:J

    iget-wide v5, v1, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    cmp-long v3, v3, v5

    if-nez v3, :cond_4

    iget-object v3, v0, Lorg/rabochaya/projects/ObjectClipboard;->token:Ljava/lang/String;

    move-object/from16 v7, p1

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {v0}, Lorg/rabochaya/projects/ObjectClipboard;->fingerprint()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v0, Lorg/rabochaya/projects/ObjectClipboard;->keys:Ljava/util/List;

    move-object/from16 v5, p2

    invoke-static {v5, v4}, Lorg/rabochaya/projects/ObjectTree;->selectedCount(Lorg/w3c/dom/Element;Ljava/util/Collection;)I

    move-result v4

    iget-wide v5, v1, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    iget-boolean v8, v0, Lorg/rabochaya/projects/ObjectClipboard;->cut:Z

    if-eqz v8, :cond_0

    const-string v8, "pastecut"

    goto :goto_0

    :cond_0
    const-string v8, "pastecopy"

    :goto_0
    sget-object v9, Lorg/rabochaya/projects/ObjectManagerActivity;->SELECTION_SESSION:Ljava/lang/String;

    iget-object v10, v0, Lorg/rabochaya/projects/ObjectClipboard;->keys:Ljava/util/List;

    iget-boolean v11, v0, Lorg/rabochaya/projects/ObjectClipboard;->cut:Z

    if-eqz v11, :cond_1

    const-string v11, "\u041f\u0435\u0440\u0435\u043d\u0435\u0441\u0442\u0438 \u0438\u0437 \u0431\u0443\u0444\u0435\u0440\u0430?"

    goto :goto_1

    :cond_1
    const-string v11, "\u0421\u043e\u0437\u0434\u0430\u0442\u044c \u043a\u043e\u043f\u0438\u0438 \u0438\u0437 \u0431\u0443\u0444\u0435\u0440\u0430?"

    :goto_1
    move-object v14, v11

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "\u041e\u0431\u044a\u0435\u043a\u0442\u043e\u0432 \u0438 \u043f\u0430\u043f\u043e\u043a \u0441 \u0441\u043e\u0434\u0435\u0440\u0436\u0438\u043c\u044b\u043c: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v11, ". \u0412\u0441\u0442\u0430\u0432\u0438\u0442\u044c \u0432 \u043e\u0442\u043a\u0440\u044b\u0442\u0443\u044e \u043f\u0430\u043f\u043a\u0443? \u0412\u0438\u0434\u0438\u043c\u043e\u0441\u0442\u044c \u0431\u0443\u0434\u0435\u0442 \u0437\u0430\u0432\u0438\u0441\u0435\u0442\u044c \u043e\u0442 \u043d\u0435\u0451."

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v0, v0, Lorg/rabochaya/projects/ObjectClipboard;->cut:Z

    if-eqz v0, :cond_2

    const-string v0, " \u0418\u0441\u0445\u043e\u0434\u043d\u044b\u0435 \u043e\u0431\u044a\u0435\u043a\u0442\u044b \u0431\u0443\u0434\u0443\u0442 \u043f\u0435\u0440\u0435\u043d\u0435\u0441\u0435\u043d\u044b \u043f\u043e\u0441\u043b\u0435 \u043f\u043e\u0434\u0442\u0432\u0435\u0440\u0436\u0434\u0435\u043d\u0438\u044f."

    goto :goto_2

    :cond_2
    const-string v0, " \u0418\u043c\u0435\u043d\u0430 \u0438 \u0441\u0441\u044b\u043b\u043a\u0438 \u043d\u0430 \u0444\u0430\u0439\u043b\u044b \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u0439 \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u0442\u0441\u044f; \u0438\u0434\u0435\u043d\u0442\u0438\u0444\u0438\u043a\u0430\u0442\u043e\u0440\u044b \u043a\u043e\u043f\u0438\u0439 \u0431\u0443\u0434\u0443\u0442 \u043d\u043e\u0432\u044b\u043c\u0438."

    :goto_2
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " \u041d\u0430\u0437\u043d\u0430\u0447\u0435\u043d\u0438\u0435: \u00ab"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object/from16 v12, p5

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "\u00bb."

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x0

    move-wide v4, v5

    move-object v6, v8

    move-object/from16 v7, p1

    move-object v8, v9

    move-object/from16 v9, p3

    move-object/from16 v11, p4

    move-object/from16 v12, p5

    move-object v13, v3

    invoke-static/range {v4 .. v16}, Lorg/rabochaya/projects/ObjectConfirmationDraft;->capture(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/Collection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Lorg/rabochaya/projects/ObjectConfirmationDraft;

    move-result-object v0

    new-instance v4, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda12;

    invoke-direct {v4, v1, v0, v3}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda12;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Lorg/rabochaya/projects/ObjectConfirmationDraft;Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Lorg/rabochaya/projects/ObjectManagerActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_4

    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v3, "\u041f\u0440\u043e\u0435\u043a\u0442 \u0438\u0437\u043c\u0435\u043d\u0438\u043b\u0441\u044f \u043f\u043e\u0441\u043b\u0435 \u0437\u0430\u043f\u043e\u043b\u043d\u0435\u043d\u0438\u044f \u0431\u0443\u0444\u0435\u0440\u0430. \u041f\u043e\u0432\u0442\u043e\u0440\u0438\u0442\u0435 \u0432\u044b\u0431\u043e\u0440 \u0438 \u043a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u0435 \u0438\u043b\u0438 \u0432\u044b\u0440\u0435\u0437\u0430\u043d\u0438\u0435"

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    :goto_3
    throw v0

    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v3, "\u0411\u0443\u0444\u0435\u0440 \u043e\u0442\u043d\u043e\u0441\u0438\u0442\u0441\u044f \u043a \u0434\u0440\u0443\u0433\u043e\u043c\u0443 \u043f\u0440\u043e\u0435\u043a\u0442\u0443"

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v3, "\u0411\u0443\u0444\u0435\u0440 \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432 \u043f\u0443\u0441\u0442"

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception v0

    goto :goto_5

    :catch_0
    move-exception v0

    :try_start_1
    invoke-direct {v1, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->clipboardError(Ljava/lang/Exception;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_4
    invoke-virtual {v2}, Lorg/rabochaya/projects/ProjectStore;->close()V

    return-void

    :goto_5
    invoke-virtual {v2}, Lorg/rabochaya/projects/ProjectStore;->close()V

    throw v0
.end method

.method synthetic lambda$rowMenu$14$org-rabochaya-projects-ObjectManagerActivity(Lorg/rabochaya/projects/ObjectTree$Row;)V
    .locals 0

    .line 75
    iget-object p1, p1, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->navigate(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$rowMenu$15$org-rabochaya-projects-ObjectManagerActivity()V
    .locals 1

    .line 76
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->name(Z)V

    return-void
.end method

.method synthetic lambda$rowMenu$16$org-rabochaya-projects-ObjectManagerActivity()V
    .locals 0

    .line 76
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->description()V

    return-void
.end method

.method synthetic lambda$rowMenu$17$org-rabochaya-projects-ObjectManagerActivity()V
    .locals 1

    .line 77
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->capture(Z)V

    return-void
.end method

.method synthetic lambda$rowMenu$18$org-rabochaya-projects-ObjectManagerActivity()V
    .locals 1

    .line 77
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->capture(Z)V

    return-void
.end method

.method synthetic lambda$rowMenu$19$org-rabochaya-projects-ObjectManagerActivity()V
    .locals 0

    .line 77
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->destination()V

    return-void
.end method

.method synthetic lambda$rowMenu$20$org-rabochaya-projects-ObjectManagerActivity()V
    .locals 1

    .line 78
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->visibility(Z)V

    return-void
.end method

.method synthetic lambda$rowMenu$21$org-rabochaya-projects-ObjectManagerActivity()V
    .locals 1

    .line 78
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->visibility(Z)V

    return-void
.end method

.method synthetic lambda$rowMenu$22$org-rabochaya-projects-ObjectManagerActivity()V
    .locals 0

    .line 78
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->confirmDelete()V

    return-void
.end method

.method synthetic lambda$rowMenu$23$org-rabochaya-projects-ObjectManagerActivity(Ljava/util/List;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 79
    iget-boolean p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->busy:Z

    if-nez p2, :cond_0

    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method synthetic lambda$searchOptions$45$org-rabochaya-projects-ObjectManagerActivity(Landroid/widget/EditText;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/Spinner;Landroid/content/DialogInterface;I)V
    .locals 13

    .line 169
    move-object v0, p0

    new-instance v12, Lorg/rabochaya/projects/ObjectListing$Options;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v3

    invoke-virtual/range {p3 .. p3}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v4

    invoke-virtual/range {p4 .. p4}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v5

    invoke-virtual/range {p5 .. p5}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v6

    invoke-virtual/range {p6 .. p6}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v7

    invoke-virtual/range {p7 .. p7}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v8

    iget-object v1, v0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v1, v1, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget v9, v1, Lorg/rabochaya/projects/KmlTimeFilter$Query;->mode:I

    iget-object v1, v0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v1, v1, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget-object v10, v1, Lorg/rabochaya/projects/KmlTimeFilter$Query;->from:Ljava/lang/String;

    iget-object v1, v0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v1, v1, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget-object v11, v1, Lorg/rabochaya/projects/KmlTimeFilter$Query;->to:Ljava/lang/String;

    move-object v1, v12

    invoke-direct/range {v1 .. v11}, Lorg/rabochaya/projects/ObjectListing$Options;-><init>(Ljava/lang/String;IIIZZIILjava/lang/String;Ljava/lang/String;)V

    iput-object v12, v0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->rememberView()V

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->render()V

    return-void
.end method

.method synthetic lambda$searchOptions$46$org-rabochaya-projects-ObjectManagerActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 169
    invoke-static {}, Lorg/rabochaya/projects/ObjectListing$Options;->defaults()Lorg/rabochaya/projects/ObjectListing$Options;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->rememberView()V

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->render()V

    return-void
.end method

.method synthetic lambda$styleDialog$7$org-rabochaya-projects-ObjectManagerActivity(Landroid/view/View;[ZLandroid/view/View;ILjava/util/Map;Landroid/app/AlertDialog;ILandroid/graphics/drawable/Drawable;II)V
    .locals 12

    .line 44
    move-object v0, p3

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    move-object v2, p1

    invoke-virtual {p1, v1}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->getResources()Landroid/content/res/Resources;

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

    .line 45
    :goto_0
    aget-boolean v2, p2, v4

    if-ne v1, v2, :cond_2

    return-void

    :cond_2
    aput-boolean v1, p2, v4

    .line 48
    if-eqz v0, :cond_4

    if-eqz v1, :cond_3

    const/16 v2, 0x8

    goto :goto_1

    :cond_3
    move/from16 v2, p4

    :goto_1
    invoke-virtual {p3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 49
    :cond_4
    invoke-interface/range {p5 .. p5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_5
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/View;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I

    aget v8, v2, v4

    if-eqz v1, :cond_7

    instance-of v9, v7, Landroid/widget/EditText;

    if-eqz v9, :cond_6

    move v9, v5

    goto :goto_3

    :cond_6
    move v9, v4

    goto :goto_3

    :cond_7
    aget v9, v2, v3

    :goto_3
    aget v10, v2, v5

    if-eqz v1, :cond_9

    instance-of v11, v7, Landroid/widget/EditText;

    if-eqz v11, :cond_8

    move v11, v5

    goto :goto_4

    :cond_8
    move v11, v4

    goto :goto_4

    :cond_9
    const/4 v11, 0x3

    aget v11, v2, v11

    :goto_4
    invoke-virtual {v7, v8, v9, v10, v11}, Landroid/view/View;->setPadding(IIII)V

    instance-of v8, v7, Landroid/widget/EditText;

    if-eqz v8, :cond_5

    const/4 v8, 0x4

    aget v9, v2, v8

    if-ltz v9, :cond_5

    check-cast v7, Landroid/widget/EditText;

    if-eqz v1, :cond_a

    move v2, v3

    goto :goto_5

    :cond_a
    aget v2, v2, v8

    :goto_5
    invoke-virtual {v7, v2}, Landroid/widget/EditText;->setMinLines(I)V

    goto :goto_2

    .line 50
    :cond_b
    invoke-virtual/range {p6 .. p6}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v1, :cond_c

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    move/from16 v3, p7

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    goto :goto_6

    :cond_c
    move-object/from16 v2, p8

    :goto_6
    invoke-virtual {v0, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual/range {p6 .. p6}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v1, :cond_d

    const/4 v2, -0x1

    goto :goto_7

    :cond_d
    move/from16 v2, p9

    :goto_7
    if-eqz v1, :cond_e

    const/4 v1, -0x2

    goto :goto_8

    :cond_e
    move/from16 v1, p10

    :goto_8
    invoke-virtual {v0, v2, v1}, Landroid/view/Window;->setLayout(II)V

    .line 51
    return-void
.end method

.method synthetic lambda$watchFont$6$org-rabochaya-projects-ObjectManagerActivity(Landroid/view/View;)V
    .locals 0

    .line 33
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->font(Landroid/view/View;)V

    return-void
.end method

.method synthetic lambda$write$42$org-rabochaya-projects-ObjectManagerActivity(Landroid/app/AlertDialog;Lorg/w3c/dom/Element;Ljava/util/List;Lorg/rabochaya/projects/ObjectListing;Ljava/lang/String;)V
    .locals 1

    .line 138
    iget-boolean v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->disposed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    :cond_1
    iput-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->snapshot:Lorg/w3c/dom/Element;

    iput-object p3, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->rows:Ljava/util/List;

    iput-object p4, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->listing:Lorg/rabochaya/projects/ObjectListing;

    iput-object p5, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    const-string p1, ""

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selected:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->clear()V

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->rememberView()V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->enabled(Z)V

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->render()V

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->status:Landroid/widget/TextView;

    const-string p2, "\u0418\u0437\u043c\u0435\u043d\u0435\u043d\u0438\u044f \u0441\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u044b"

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$write$43$org-rabochaya-projects-ObjectManagerActivity(Ljava/lang/Exception;Landroid/app/AlertDialog;)V
    .locals 4

    .line 139
    iget-boolean v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->disposed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->enabled(Z)V

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->adapter:Lorg/rabochaya/projects/ObjectManagerActivity$Rows;

    invoke-virtual {v1}, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->notifyDataSetChanged()V

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->status:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u0418\u0437\u043c\u0435\u043d\u0435\u043d\u0438\u044f \u043d\u0435 \u0441\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u044b: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz p2, :cond_1

    const/4 v1, -0x1

    invoke-virtual {p2, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    const/4 v1, -0x2

    invoke-virtual {p2, v1}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog;->setCancelable(Z)V

    :cond_1
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->notice(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$write$44$org-rabochaya-projects-ObjectManagerActivity(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Landroid/app/AlertDialog;)V
    .locals 8

    .line 136
    new-instance v7, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v7, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V

    :try_start_0
    const-string v0, "paste"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    const/4 p1, 0x0

    invoke-interface {p4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    move-object v5, p1

    check-cast v5, Ljava/lang/String;

    move-object v0, v7

    move-object v3, p2

    move-object v4, p3

    invoke-static/range {v0 .. v5}, Lorg/rabochaya/projects/ObjectClipboardWrites;->paste(Lorg/rabochaya/projects/ProjectStore;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/rabochaya/projects/KmlProject;

    move-result-object p1

    goto :goto_0

    :cond_0
    iget-wide v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    move-object v0, v7

    move-object v3, p1

    move-object v4, p4

    move-object v5, p2

    move-object v6, p3

    invoke-static/range {v0 .. v6}, Lorg/rabochaya/projects/ObjectTreeWrites;->apply(Lorg/rabochaya/projects/ProjectStore;JLjava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Lorg/rabochaya/projects/KmlProject;

    move-result-object p1

    :goto_0
    invoke-virtual {p1}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object v3

    .line 137
    invoke-static {v3}, Lorg/rabochaya/projects/ObjectTree;->rows(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v4

    invoke-static {v3}, Lorg/rabochaya/projects/ObjectTree;->token(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v4}, Lorg/rabochaya/projects/ObjectListing;->build(Lorg/w3c/dom/Element;Ljava/util/List;)Lorg/rabochaya/projects/ObjectListing;

    move-result-object v5

    .line 138
    new-instance p1, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda3;

    move-object v0, p1

    move-object v1, p0

    move-object v2, p5

    invoke-direct/range {v0 .. v6}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda3;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/app/AlertDialog;Lorg/w3c/dom/Element;Ljava/util/List;Lorg/rabochaya/projects/ObjectListing;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 139
    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception p1

    :try_start_1
    new-instance p2, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda4;

    invoke-direct {p2, p0, p1, p5}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda4;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Ljava/lang/Exception;Landroid/app/AlertDialog;)V

    invoke-virtual {p0, p2}, Lorg/rabochaya/projects/ObjectManagerActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    invoke-virtual {v7}, Lorg/rabochaya/projects/ProjectStore;->close()V

    return-void

    :goto_2
    invoke-virtual {v7}, Lorg/rabochaya/projects/ProjectStore;->close()V

    throw p1
.end method

.method public onBackPressed()V
    .locals 8

    .line 186
    iget-boolean v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->busy:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    invoke-virtual {v0}, Lorg/rabochaya/projects/ObjectListing$Options;->filtered()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lorg/rabochaya/projects/ObjectListing$Options;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v5, v1, Lorg/rabochaya/projects/ObjectListing$Options;->sort:I

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-boolean v7, v1, Lorg/rabochaya/projects/ObjectListing$Options;->foldersFirst:Z

    const-string v2, ""

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lorg/rabochaya/projects/ObjectListing$Options;-><init>(Ljava/lang/String;IIIZZ)V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewOptions:Lorg/rabochaya/projects/ObjectListing$Options;

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->rememberView()V

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->render()V

    return-void

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->parent()V

    goto :goto_0

    :cond_2
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 18
    invoke-virtual {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v0, v0, 0x30

    const/16 v1, 0x20

    if-ne v0, v1, :cond_0

    const v0, 0x103022e

    goto :goto_0

    :cond_0
    const v0, 0x1030241

    :goto_0
    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->setTheme(I)V

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "project"

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->project:J

    .line 19
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->restoreView()V

    if-eqz p1, :cond_1

    const-string v0, "folder"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    const-string v0, "token"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    const-string v0, "editor"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->readEditor(Landroid/os/Bundle;)Lorg/rabochaya/projects/ObjectEditorDraft;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingEditor:Lorg/rabochaya/projects/ObjectEditorDraft;

    const-string v0, "selection"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingSelection:Landroid/os/Bundle;

    const-string v0, "form"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->readForm(Landroid/os/Bundle;)Lorg/rabochaya/projects/ObjectFormDraft;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingForm:Lorg/rabochaya/projects/ObjectFormDraft;

    const-string v0, "move"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->readMove(Landroid/os/Bundle;)Lorg/rabochaya/projects/ObjectMoveDraft;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingMove:Lorg/rabochaya/projects/ObjectMoveDraft;

    const-string v0, "confirmation"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->readConfirmation(Landroid/os/Bundle;)Lorg/rabochaya/projects/ObjectConfirmationDraft;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->pendingConfirmation:Lorg/rabochaya/projects/ObjectConfirmationDraft;

    .line 20
    :cond_1
    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0xc

    invoke-virtual {p1, v1, v1, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->setContentView(Landroid/view/View;)V

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->watchFont(Landroid/view/View;)V

    .line 21
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v0, Lorg/rabochaya/projects/ObjectManagerActivity$1;

    invoke-direct {v0, p0, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$1;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x1

    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v2, "\u041e\u0431\u044a\u0435\u043a\u0442\u044b \u043f\u0440\u043e\u0435\u043a\u0442\u0430"

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v2, 0x41a80000    # 21.0f

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 23
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->path:Landroid/widget/TextView;

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->path:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewInfo:Landroid/widget/TextView;

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewInfo:Landroid/widget/TextView;

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewInfo:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->viewInfo:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selectionInfo:Landroid/widget/TextView;

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->selectionInfo:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->status:Landroid/widget/TextView;

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 24
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda36;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda36;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    const-string v3, "\u0412\u0432\u0435\u0440\u0445"

    invoke-direct {p0, v0, v3, v2}, Lorg/rabochaya/projects/ObjectManagerActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->up:Landroid/widget/Button;

    new-instance v2, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda37;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda37;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    const-string v3, "\u0414\u0435\u0439\u0441\u0442\u0432\u0438\u044f"

    invoke-direct {p0, v0, v3, v2}, Lorg/rabochaya/projects/ObjectManagerActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->actions:Landroid/widget/Button;

    new-instance v2, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda38;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda38;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    const-string v3, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    invoke-direct {p0, v0, v3, v2}, Lorg/rabochaya/projects/ObjectManagerActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 25
    new-instance v0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda39;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda39;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    const-string v2, "\u041f\u043e\u0438\u0441\u043a \u0438 \u0444\u0438\u043b\u044c\u0442\u0440\u044b"

    invoke-direct {p0, v1, v2, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->searchButton:Landroid/widget/Button;

    new-instance v0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda40;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda40;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    const-string v2, "\u0414\u0430\u0442\u044b KML"

    invoke-direct {p0, v1, v2, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->dateButton:Landroid/widget/Button;

    .line 26
    new-instance v0, Landroid/widget/ListView;

    invoke-direct {v0, p0}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->list:Landroid/widget/ListView;

    new-instance v0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;Lorg/rabochaya/projects/ObjectManagerActivity$1;)V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->adapter:Lorg/rabochaya/projects/ObjectManagerActivity$Rows;

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->list:Landroid/widget/ListView;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->adapter:Lorg/rabochaya/projects/ObjectManagerActivity$Rows;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->list:Landroid/widget/ListView;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v1, v4, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    new-instance v0, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda41;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$$ExternalSyntheticLambda41;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    const-string v1, "\u041f\u0440\u043e\u0435\u043a\u0442\u044b, \u0438\u043c\u043f\u043e\u0440\u0442 \u0438 \u044d\u043a\u0441\u043f\u043e\u0440\u0442"

    invoke-direct {p0, p1, v1, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 28
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->load()V

    .line 29
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 187
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->disposed:Z

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->editorDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->editorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->activeForm:Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->activeForm:Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

    iget-object v0, v0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->moveDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->moveDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_2
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->confirmationDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->confirmationDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    :cond_3
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->worker:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 185
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    iget-boolean v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->refreshOnResume:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->busy:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->refreshOnResume:Z

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->load()V

    :cond_0
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 184
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "folder"

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->folder:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "token"

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity;->expected:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "editor"

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->saveEditor()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    const-string v0, "selection"

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->saveSelection()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    const-string v0, "form"

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->saveForm()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    const-string v0, "move"

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->saveMove()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    const-string v0, "confirmation"

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->saveConfirmation()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->rememberView()V

    return-void
.end method
