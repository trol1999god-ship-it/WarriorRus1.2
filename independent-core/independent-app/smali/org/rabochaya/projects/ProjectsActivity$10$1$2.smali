.class Lorg/rabochaya/projects/ProjectsActivity$10$1$2;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


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

    .line 75
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1$2;->this$2:Lorg/rabochaya/projects/ProjectsActivity$10$1;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1$2;->val$p:Lorg/rabochaya/projects/ProjectStore$Summary;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 3

    .line 75
    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1$2;->this$2:Lorg/rabochaya/projects/ProjectsActivity$10$1;

    iget-object p1, p1, Lorg/rabochaya/projects/ProjectsActivity$10$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$10;

    iget-object p1, p1, Lorg/rabochaya/projects/ProjectsActivity$10;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1$2;->val$p:Lorg/rabochaya/projects/ProjectStore$Summary;

    iget-wide v0, v0, Lorg/rabochaya/projects/ProjectStore$Summary;->id:J

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1$2;->val$p:Lorg/rabochaya/projects/ProjectStore$Summary;

    iget-object v2, v2, Lorg/rabochaya/projects/ProjectStore$Summary;->name:Ljava/lang/String;

    invoke-static {p1, v0, v1, v2}, Lorg/rabochaya/projects/ProjectsActivity;->access$1800(Lorg/rabochaya/projects/ProjectsActivity;JLjava/lang/String;)V

    const/4 p1, 0x1

    return p1
.end method
