.class Lorg/rabochaya/projects/ProjectsActivity$11$1;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity$11;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/rabochaya/projects/ProjectsActivity$11;

.field final synthetic val$loaded:Lorg/rabochaya/projects/KmlProject;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity$11;Lorg/rabochaya/projects/KmlProject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 83
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$11$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$11;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$11$1;->val$loaded:Lorg/rabochaya/projects/KmlProject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 83
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$11$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$11;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$11;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$102(Lorg/rabochaya/projects/ProjectsActivity;Z)Z

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$11$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$11;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$11;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$1000(Lorg/rabochaya/projects/ProjectsActivity;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$11$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$11;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$11;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$11$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$11;

    iget-wide v1, v1, Lorg/rabochaya/projects/ProjectsActivity$11;->val$id:J

    invoke-static {v0, v1, v2}, Lorg/rabochaya/projects/ProjectsActivity;->access$202(Lorg/rabochaya/projects/ProjectsActivity;J)J

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$11$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$11;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$11;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$11$1;->val$loaded:Lorg/rabochaya/projects/KmlProject;

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$402(Lorg/rabochaya/projects/ProjectsActivity;Lorg/rabochaya/projects/KmlProject;)Lorg/rabochaya/projects/KmlProject;

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$11$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$11;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$11;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$11$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$11;

    iget-object v1, v1, Lorg/rabochaya/projects/ProjectsActivity$11;->val$folder:Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$302(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$11$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$11;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$11;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$500(Lorg/rabochaya/projects/ProjectsActivity;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$11$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$11;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$11;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$1100(Lorg/rabochaya/projects/ProjectsActivity;)V

    return-void
.end method
