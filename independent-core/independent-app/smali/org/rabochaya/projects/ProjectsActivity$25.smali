.class Lorg/rabochaya/projects/ProjectsActivity$25;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->newFolder()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ProjectsActivity;

.field final synthetic val$edit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity;Landroid/widget/EditText;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 137
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$25;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$25;->val$edit:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 137
    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$25;->val$edit:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_0

    return-void

    :cond_0
    iget-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$25;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {p2}, Lorg/rabochaya/projects/ProjectsActivity;->access$2900(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/w3c/dom/Element;

    move-result-object p2

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$25;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    new-instance v1, Lorg/rabochaya/projects/ProjectsActivity$25$1;

    invoke-direct {v1, p0, p1, p2}, Lorg/rabochaya/projects/ProjectsActivity$25$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity$25;Ljava/lang/String;Lorg/w3c/dom/Element;)V

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$2200(Lorg/rabochaya/projects/ProjectsActivity;Lorg/rabochaya/projects/ProjectsActivity$Task;)V

    return-void
.end method
