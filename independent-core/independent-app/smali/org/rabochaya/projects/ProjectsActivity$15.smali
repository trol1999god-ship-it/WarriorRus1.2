.class Lorg/rabochaya/projects/ProjectsActivity$15;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


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

    .line 94
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$15;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$15;->val$e:Lorg/w3c/dom/Element;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 94
    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$15;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    new-instance v0, Lorg/rabochaya/projects/ProjectsActivity$15$1;

    invoke-direct {v0, p0, p2}, Lorg/rabochaya/projects/ProjectsActivity$15$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity$15;Z)V

    invoke-static {p1, v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$2200(Lorg/rabochaya/projects/ProjectsActivity;Lorg/rabochaya/projects/ProjectsActivity$Task;)V

    return-void
.end method
