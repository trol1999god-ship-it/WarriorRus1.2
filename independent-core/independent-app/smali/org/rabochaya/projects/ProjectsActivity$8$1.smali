.class Lorg/rabochaya/projects/ProjectsActivity$8$1;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity$8;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/rabochaya/projects/ProjectsActivity$8;

.field final synthetic val$ex:Ljava/lang/Exception;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity$8;Ljava/lang/Exception;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 60
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$8$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$8;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$8$1;->val$ex:Ljava/lang/Exception;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 60
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$8$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$8;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$8;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$102(Lorg/rabochaya/projects/ProjectsActivity;Z)Z

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$8$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$8;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$8;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$1000(Lorg/rabochaya/projects/ProjectsActivity;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$8$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$8;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$8;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$8$1;->val$ex:Ljava/lang/Exception;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    const-string v1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0432\u044b\u043f\u043e\u043b\u043d\u0438\u0442\u044c \u043e\u043f\u0435\u0440\u0430\u0446\u0438\u044e"

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$8$1;->val$ex:Ljava/lang/Exception;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    :goto_0
    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$8$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$8;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$8;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$400(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/KmlProject;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$8$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$8;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$8;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$1100(Lorg/rabochaya/projects/ProjectsActivity;)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$8$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$8;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$8;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const-string v1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043e\u0442\u043a\u0440\u044b\u0442\u044c \u043f\u0440\u043e\u0435\u043a\u0442"

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$1200(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/String;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$8$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$8;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$8;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$1400(Lorg/rabochaya/projects/ProjectsActivity;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$8$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$8;

    iget-object v1, v1, Lorg/rabochaya/projects/ProjectsActivity$8;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const-string v2, "\u041d\u0430\u0436\u043c\u0438\u0442\u0435 \u00ab\u041f\u0440\u043e\u0435\u043a\u0442\u044b\u00bb \u0434\u043b\u044f \u043f\u043e\u0432\u0442\u043e\u0440\u043d\u043e\u0439 \u043f\u043e\u043f\u044b\u0442\u043a\u0438 \u0438\u043b\u0438 \u0438\u043c\u043f\u043e\u0440\u0442\u0438\u0440\u0443\u0439\u0442\u0435 \u0434\u0440\u0443\u0433\u043e\u0439 \u0444\u0430\u0439\u043b."

    const/16 v3, 0x10

    invoke-static {v1, v2, v3}, Lorg/rabochaya/projects/ProjectsActivity;->access$1300(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :goto_1
    return-void
.end method
