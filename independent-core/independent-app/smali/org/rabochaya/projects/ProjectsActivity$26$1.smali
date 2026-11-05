.class Lorg/rabochaya/projects/ProjectsActivity$26$1;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Lorg/rabochaya/projects/ProjectsActivity$Task;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity$26;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/rabochaya/projects/ProjectsActivity$26;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity$26;)V
    .locals 0

    .line 138
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$26$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$26;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 138
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$26$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$26;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$26;->val$e:Lorg/w3c/dom/Element;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->cloneNode(Z)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$3100(Lorg/w3c/dom/Element;)V

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$26$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$26;

    iget-object v1, v1, Lorg/rabochaya/projects/ProjectsActivity$26;->val$e:Lorg/w3c/dom/Element;

    invoke-interface {v1}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/w3c/dom/Node;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    return-void
.end method
