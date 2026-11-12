.class Lorg/rabochaya/projects/ProjectsActivity$11;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Lorg/rabochaya/projects/ProjectsActivity$Task;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->open(JLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ProjectsActivity;

.field final synthetic val$folder:Ljava/lang/String;

.field final synthetic val$id:J


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity;JLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 83
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$11;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iput-wide p2, p0, Lorg/rabochaya/projects/ProjectsActivity$11;->val$id:J

    iput-object p4, p0, Lorg/rabochaya/projects/ProjectsActivity$11;->val$folder:Ljava/lang/String;

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

    .line 83
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$11;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$000(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/ProjectStore;

    move-result-object v0

    iget-wide v1, p0, Lorg/rabochaya/projects/ProjectsActivity$11;->val$id:J

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$11;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    new-instance v2, Lorg/rabochaya/projects/ProjectsActivity$11$1;

    invoke-direct {v2, p0, v0}, Lorg/rabochaya/projects/ProjectsActivity$11$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity$11;Lorg/rabochaya/projects/KmlProject;)V

    invoke-static {v1, v2}, Lorg/rabochaya/projects/ProjectsActivity;->access$1500(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/Runnable;)V

    return-void
.end method
