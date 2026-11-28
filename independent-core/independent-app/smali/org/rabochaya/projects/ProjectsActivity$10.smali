.class Lorg/rabochaya/projects/ProjectsActivity$10;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Lorg/rabochaya/projects/ProjectsActivity$Task;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->home()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ProjectsActivity;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity;)V
    .locals 0

    .line 64
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$10;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 66
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$10;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$000(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/ProjectStore;

    move-result-object v0

    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->list()Ljava/util/List;

    move-result-object v0

    .line 67
    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$10;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    new-instance v2, Lorg/rabochaya/projects/ProjectsActivity$10$1;

    invoke-direct {v2, p0, v0}, Lorg/rabochaya/projects/ProjectsActivity$10$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity$10;Ljava/util/List;)V

    invoke-static {v1, v2}, Lorg/rabochaya/projects/ProjectsActivity;->access$1500(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/Runnable;)V

    .line 79
    return-void
.end method
