.class Lorg/rabochaya/projects/ProjectsActivity$8;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->task(Ljava/lang/String;Lorg/rabochaya/projects/ProjectsActivity$Task;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ProjectsActivity;

.field final synthetic val$task:Lorg/rabochaya/projects/ProjectsActivity$Task;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity;Lorg/rabochaya/projects/ProjectsActivity$Task;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 60
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$8;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$8;->val$task:Lorg/rabochaya/projects/ProjectsActivity$Task;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 60
    :try_start_0
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$8;->val$task:Lorg/rabochaya/projects/ProjectsActivity$Task;

    invoke-interface {v0}, Lorg/rabochaya/projects/ProjectsActivity$Task;->run()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$8;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    new-instance v2, Lorg/rabochaya/projects/ProjectsActivity$8$1;

    invoke-direct {v2, p0, v0}, Lorg/rabochaya/projects/ProjectsActivity$8$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity$8;Ljava/lang/Exception;)V

    invoke-static {v1, v2}, Lorg/rabochaya/projects/ProjectsActivity;->access$1500(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method
