.class Lorg/rabochaya/projects/ProjectsActivity$21$1;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity$21;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/rabochaya/projects/ProjectsActivity$21;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity$21;)V
    .locals 0

    .line 132
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$21$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$21;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 132
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$21$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$21;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$21;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$102(Lorg/rabochaya/projects/ProjectsActivity;Z)Z

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$21$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$21;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$21;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$1000(Lorg/rabochaya/projects/ProjectsActivity;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$21$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$21;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$21;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$1100(Lorg/rabochaya/projects/ProjectsActivity;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$21$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$21;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$21;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const-string v2, "\u0424\u0430\u0439\u043b \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method
