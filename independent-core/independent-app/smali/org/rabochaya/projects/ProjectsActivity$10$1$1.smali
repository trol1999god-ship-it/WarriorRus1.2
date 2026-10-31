.class Lorg/rabochaya/projects/ProjectsActivity$10$1$1;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity$10$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lorg/rabochaya/projects/ProjectsActivity$10$1;

.field final synthetic val$p:Lorg/rabochaya/projects/ProjectStore$Summary;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity$10$1;Lorg/rabochaya/projects/ProjectStore$Summary;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 74
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1$1;->this$2:Lorg/rabochaya/projects/ProjectsActivity$10$1;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1$1;->val$p:Lorg/rabochaya/projects/ProjectStore$Summary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 74
    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1$1;->this$2:Lorg/rabochaya/projects/ProjectsActivity$10$1;

    iget-object p1, p1, Lorg/rabochaya/projects/ProjectsActivity$10$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$10;

    iget-object p1, p1, Lorg/rabochaya/projects/ProjectsActivity$10;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1$1;->val$p:Lorg/rabochaya/projects/ProjectStore$Summary;

    iget-wide v0, v0, Lorg/rabochaya/projects/ProjectStore$Summary;->id:J

    const-string v2, ""

    invoke-static {p1, v0, v1, v2}, Lorg/rabochaya/projects/ProjectsActivity;->access$1700(Lorg/rabochaya/projects/ProjectsActivity;JLjava/lang/String;)V

    return-void
.end method
