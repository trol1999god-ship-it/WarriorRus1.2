.class Lorg/rabochaya/projects/ProjectsActivity$19;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Lorg/rabochaya/projects/ProjectsActivity$Task;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->diagram()V
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

    .line 115
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$19;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 115
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$19;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$400(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/KmlProject;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/KmlProject;->features(Z)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$19;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    new-instance v2, Lorg/rabochaya/projects/ProjectsActivity$19$1;

    invoke-direct {v2, p0, v0}, Lorg/rabochaya/projects/ProjectsActivity$19$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity$19;Ljava/util/List;)V

    invoke-static {v1, v2}, Lorg/rabochaya/projects/ProjectsActivity;->access$1500(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/Runnable;)V

    return-void
.end method
