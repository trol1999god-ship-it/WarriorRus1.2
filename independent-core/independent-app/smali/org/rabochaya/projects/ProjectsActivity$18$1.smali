.class Lorg/rabochaya/projects/ProjectsActivity$18$1;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity$18;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/rabochaya/projects/ProjectsActivity$18;

.field final synthetic val$old:Lorg/rabochaya/projects/KmlProject;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity$18;Lorg/rabochaya/projects/KmlProject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 102
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$18$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$18;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$18$1;->val$old:Lorg/rabochaya/projects/KmlProject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 102
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$18$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$18;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$18;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$18$1;->val$old:Lorg/rabochaya/projects/KmlProject;

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$402(Lorg/rabochaya/projects/ProjectsActivity;Lorg/rabochaya/projects/KmlProject;)Lorg/rabochaya/projects/KmlProject;

    return-void
.end method
