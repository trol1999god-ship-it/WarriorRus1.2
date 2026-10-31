.class Lorg/rabochaya/projects/ProjectsActivity$17;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


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

    .line 96
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$17;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$17;->val$e:Lorg/w3c/dom/Element;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 96
    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$17;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$17;->val$e:Lorg/w3c/dom/Element;

    invoke-static {p1, v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$2400(Lorg/rabochaya/projects/ProjectsActivity;Lorg/w3c/dom/Element;)V

    const/4 p1, 0x1

    return p1
.end method
