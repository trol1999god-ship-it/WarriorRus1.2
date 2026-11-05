.class Lorg/rabochaya/projects/ProjectsActivity$27;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->rename(Lorg/w3c/dom/Element;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ProjectsActivity;

.field final synthetic val$e:Lorg/w3c/dom/Element;

.field final synthetic val$edit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity;Landroid/widget/EditText;Lorg/w3c/dom/Element;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 139
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$27;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$27;->val$edit:Landroid/widget/EditText;

    iput-object p3, p0, Lorg/rabochaya/projects/ProjectsActivity$27;->val$e:Lorg/w3c/dom/Element;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 139
    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$27;->val$edit:Landroid/widget/EditText;

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
    iget-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$27;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    new-instance v0, Lorg/rabochaya/projects/ProjectsActivity$27$1;

    invoke-direct {v0, p0, p1}, Lorg/rabochaya/projects/ProjectsActivity$27$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity$27;Ljava/lang/String;)V

    invoke-static {p2, v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$2200(Lorg/rabochaya/projects/ProjectsActivity;Lorg/rabochaya/projects/ProjectsActivity$Task;)V

    return-void
.end method
