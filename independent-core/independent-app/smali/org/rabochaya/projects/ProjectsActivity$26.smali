.class Lorg/rabochaya/projects/ProjectsActivity$26;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->nodeMenu(Lorg/w3c/dom/Element;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ProjectsActivity;

.field final synthetic val$e:Lorg/w3c/dom/Element;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity;Lorg/w3c/dom/Element;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 138
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$26;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$26;->val$e:Lorg/w3c/dom/Element;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 138
    if-nez p2, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$26;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$26;->val$e:Lorg/w3c/dom/Element;

    invoke-static {p1, v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$3000(Lorg/rabochaya/projects/ProjectsActivity;Lorg/w3c/dom/Element;)V

    :cond_0
    const/4 p1, 0x1

    if-ne p2, p1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$26;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    new-instance v0, Lorg/rabochaya/projects/ProjectsActivity$26$1;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ProjectsActivity$26$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity$26;)V

    invoke-static {p1, v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$2200(Lorg/rabochaya/projects/ProjectsActivity;Lorg/rabochaya/projects/ProjectsActivity$Task;)V

    :cond_1
    const/4 p1, 0x2

    if-ne p2, p1, :cond_2

    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$26;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$26;->val$e:Lorg/w3c/dom/Element;

    invoke-static {p1, v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$3200(Lorg/rabochaya/projects/ProjectsActivity;Lorg/w3c/dom/Element;)V

    :cond_2
    const/4 p1, 0x3

    if-ne p2, p1, :cond_3

    new-instance p1, Landroid/app/AlertDialog$Builder;

    iget-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$26;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-direct {p1, p2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string p2, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u043e\u0431\u044a\u0435\u043a\u0442 \u0438 \u0435\u0433\u043e \u0441\u043e\u0434\u0435\u0440\u0436\u0438\u043c\u043e\u0435?"

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance p2, Lorg/rabochaya/projects/ProjectsActivity$26$2;

    invoke-direct {p2, p0}, Lorg/rabochaya/projects/ProjectsActivity$26$2;-><init>(Lorg/rabochaya/projects/ProjectsActivity$26;)V

    const-string v0, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c"

    invoke-virtual {p1, v0, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    :cond_3
    return-void
.end method
