.class Lorg/rabochaya/projects/ProjectsActivity$15$1;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Lorg/rabochaya/projects/ProjectsActivity$Task;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity$15;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/rabochaya/projects/ProjectsActivity$15;

.field final synthetic val$value:Z


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity$15;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 94
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$15$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$15;

    iput-boolean p2, p0, Lorg/rabochaya/projects/ProjectsActivity$15$1;->val$value:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 94
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$15$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$15;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$15;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$400(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/KmlProject;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$15$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$15;

    iget-object v1, v1, Lorg/rabochaya/projects/ProjectsActivity$15;->val$e:Lorg/w3c/dom/Element;

    iget-boolean v2, p0, Lorg/rabochaya/projects/ProjectsActivity$15$1;->val$value:Z

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/KmlProject;->setVisible(Lorg/w3c/dom/Element;Z)V

    return-void
.end method
