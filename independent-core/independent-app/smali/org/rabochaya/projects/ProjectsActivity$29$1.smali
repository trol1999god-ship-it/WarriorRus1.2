.class Lorg/rabochaya/projects/ProjectsActivity$29$1;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Lorg/rabochaya/projects/ProjectsActivity$Task;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity$29;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/rabochaya/projects/ProjectsActivity$29;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity$29;)V
    .locals 0

    .line 146
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$29$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$29;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 146
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$29$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$29;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$29;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$000(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/ProjectStore;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$29$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$29;

    iget-wide v1, v1, Lorg/rabochaya/projects/ProjectsActivity$29;->val$id:J

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/ProjectStore;->remove(J)V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$29$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$29;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$29;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0, v1, v2}, Lorg/rabochaya/projects/LocalMapActivity;->cleanupDeletedProject(Landroid/content/Context;J)V

    new-instance v1, Lorg/rabochaya/projects/ProjectsActivity$29$1$1;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/ProjectsActivity$29$1$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity$29$1;)V

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$1500(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/Runnable;)V

    return-void
.end method
