.class Lorg/rabochaya/projects/ProjectsActivity$16;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->showFolder()V
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

    .line 95
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$16;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$16;->val$e:Lorg/w3c/dom/Element;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 95
    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$16;->val$e:Lorg/w3c/dom/Element;

    invoke-static {p1}, Lorg/rabochaya/projects/KmlProject;->isContainer(Lorg/w3c/dom/Element;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$16;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$16;->val$e:Lorg/w3c/dom/Element;

    const-string v1, "id"

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$302(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$16;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {p1}, Lorg/rabochaya/projects/ProjectsActivity;->access$1100(Lorg/rabochaya/projects/ProjectsActivity;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$16;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$16;->val$e:Lorg/w3c/dom/Element;

    invoke-static {p1, v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$2300(Lorg/rabochaya/projects/ProjectsActivity;Lorg/w3c/dom/Element;)V

    :goto_0
    return-void
.end method
