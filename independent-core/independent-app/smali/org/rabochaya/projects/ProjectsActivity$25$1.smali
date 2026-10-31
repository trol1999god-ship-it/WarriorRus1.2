.class Lorg/rabochaya/projects/ProjectsActivity$25$1;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Lorg/rabochaya/projects/ProjectsActivity$Task;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity$25;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/rabochaya/projects/ProjectsActivity$25;

.field final synthetic val$name:Ljava/lang/String;

.field final synthetic val$target:Lorg/w3c/dom/Element;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity$25;Ljava/lang/String;Lorg/w3c/dom/Element;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 137
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$25$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$25;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$25$1;->val$name:Ljava/lang/String;

    iput-object p3, p0, Lorg/rabochaya/projects/ProjectsActivity$25$1;->val$target:Lorg/w3c/dom/Element;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 137
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$25$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$25;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$25;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$400(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/KmlProject;

    move-result-object v0

    iget-object v0, v0, Lorg/rabochaya/projects/KmlProject;->document:Lorg/w3c/dom/Document;

    const-string v1, "Folder"

    const-string v2, "http://www.opengis.net/kml/2.2"

    invoke-interface {v0, v2, v1}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "rk_"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "id"

    invoke-interface {v0, v3, v1}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$25$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$25;

    iget-object v1, v1, Lorg/rabochaya/projects/ProjectsActivity$25;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$400(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/KmlProject;

    move-result-object v1

    iget-object v1, v1, Lorg/rabochaya/projects/KmlProject;->document:Lorg/w3c/dom/Document;

    const-string v3, "name"

    invoke-interface {v1, v2, v3}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity$25$1;->val$name:Ljava/lang/String;

    invoke-interface {v1, v2}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$25$1;->val$target:Lorg/w3c/dom/Element;

    invoke-interface {v1, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    return-void
.end method
