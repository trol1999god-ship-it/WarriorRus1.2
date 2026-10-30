.class Lorg/rabochaya/projects/ProjectsActivity$3;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->frame(Ljava/lang/String;)V
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

    .line 51
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$3;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 51
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$3;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const-wide/16 v1, -0x1

    invoke-static {v0, v1, v2}, Lorg/rabochaya/projects/ProjectsActivity;->access$202(Lorg/rabochaya/projects/ProjectsActivity;J)J

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$3;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const-string v1, ""

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$302(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$3;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$402(Lorg/rabochaya/projects/ProjectsActivity;Lorg/rabochaya/projects/KmlProject;)Lorg/rabochaya/projects/KmlProject;

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$3;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$500(Lorg/rabochaya/projects/ProjectsActivity;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$3;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$600(Lorg/rabochaya/projects/ProjectsActivity;)V

    return-void
.end method
