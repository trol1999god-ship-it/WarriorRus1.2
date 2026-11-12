.class Lorg/rabochaya/projects/ProjectsActivity$18;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Lorg/rabochaya/projects/ProjectsActivity$Task;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->change(Lorg/rabochaya/projects/ProjectsActivity$Task;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ProjectsActivity;

.field final synthetic val$change:Lorg/rabochaya/projects/ProjectsActivity$Task;

.field final synthetic val$folder:Ljava/lang/String;

.field final synthetic val$id:J


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity;Lorg/rabochaya/projects/ProjectsActivity$Task;JLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 101
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$18;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$18;->val$change:Lorg/rabochaya/projects/ProjectsActivity$Task;

    iput-wide p3, p0, Lorg/rabochaya/projects/ProjectsActivity$18;->val$id:J

    iput-object p5, p0, Lorg/rabochaya/projects/ProjectsActivity$18;->val$folder:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 102
    :try_start_0
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$18;->val$change:Lorg/rabochaya/projects/ProjectsActivity$Task;

    invoke-interface {v0}, Lorg/rabochaya/projects/ProjectsActivity$Task;->run()V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$18;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$000(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/ProjectStore;

    move-result-object v0

    iget-wide v1, p0, Lorg/rabochaya/projects/ProjectsActivity$18;->val$id:J

    iget-object v3, p0, Lorg/rabochaya/projects/ProjectsActivity$18;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v3}, Lorg/rabochaya/projects/ProjectsActivity;->access$400(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/KmlProject;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lorg/rabochaya/projects/ProjectStore;->saveDocument(JLorg/rabochaya/projects/KmlProject;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$18;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$000(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/ProjectStore;

    move-result-object v0

    iget-wide v1, p0, Lorg/rabochaya/projects/ProjectsActivity$18;->val$id:J

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$18;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    new-instance v2, Lorg/rabochaya/projects/ProjectsActivity$18$2;

    invoke-direct {v2, p0, v0}, Lorg/rabochaya/projects/ProjectsActivity$18$2;-><init>(Lorg/rabochaya/projects/ProjectsActivity$18;Lorg/rabochaya/projects/KmlProject;)V

    invoke-static {v1, v2}, Lorg/rabochaya/projects/ProjectsActivity;->access$1500(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/Runnable;)V

    .line 104
    return-void

    .line 102
    :catch_0
    move-exception v0

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$18;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$000(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/ProjectStore;

    move-result-object v1

    iget-wide v2, p0, Lorg/rabochaya/projects/ProjectsActivity$18;->val$id:J

    invoke-virtual {v1, v2, v3}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity$18;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    new-instance v3, Lorg/rabochaya/projects/ProjectsActivity$18$1;

    invoke-direct {v3, p0, v1}, Lorg/rabochaya/projects/ProjectsActivity$18$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity$18;Lorg/rabochaya/projects/KmlProject;)V

    invoke-static {v2, v3}, Lorg/rabochaya/projects/ProjectsActivity;->access$1500(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/Runnable;)V

    throw v0
.end method
