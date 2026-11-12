.class Lorg/rabochaya/projects/ProjectsActivity$27$1;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Lorg/rabochaya/projects/ProjectsActivity$Task;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity$27;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/rabochaya/projects/ProjectsActivity$27;

.field final synthetic val$value:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity$27;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 139
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$27$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$27;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$27$1;->val$value:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 139
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$27$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$27;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$27;->val$e:Lorg/w3c/dom/Element;

    const-string v1, "name"

    invoke-static {v0, v1}, Lorg/rabochaya/projects/KmlProject;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$27$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$27;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$27;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$400(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/KmlProject;

    move-result-object v0

    iget-object v0, v0, Lorg/rabochaya/projects/KmlProject;->document:Lorg/w3c/dom/Document;

    const-string v2, "http://www.opengis.net/kml/2.2"

    invoke-interface {v0, v2, v1}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$27$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$27;

    iget-object v1, v1, Lorg/rabochaya/projects/ProjectsActivity$27;->val$e:Lorg/w3c/dom/Element;

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity$27$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$27;

    iget-object v2, v2, Lorg/rabochaya/projects/ProjectsActivity$27;->val$e:Lorg/w3c/dom/Element;

    invoke-interface {v2}, Lorg/w3c/dom/Element;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lorg/w3c/dom/Element;->insertBefore(Lorg/w3c/dom/Node;Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    :cond_0
    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$27$1;->val$value:Ljava/lang/String;

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    return-void
.end method
