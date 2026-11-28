.class Lorg/rabochaya/projects/ProjectsActivity$10$1;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity$10;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/rabochaya/projects/ProjectsActivity$10;

.field final synthetic val$projects:Ljava/util/List;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity$10;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 67
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$10;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1;->val$projects:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 69
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$10;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$10;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$102(Lorg/rabochaya/projects/ProjectsActivity;Z)Z

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$10;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$10;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$1000(Lorg/rabochaya/projects/ProjectsActivity;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$10;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$10;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$402(Lorg/rabochaya/projects/ProjectsActivity;Lorg/rabochaya/projects/KmlProject;)Lorg/rabochaya/projects/KmlProject;

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$10;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$10;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const-string v1, "\u041b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0435 KML/KMZ"

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$1200(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/String;)V

    .line 70
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$10;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$10;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$1400(Lorg/rabochaya/projects/ProjectsActivity;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$10;

    iget-object v1, v1, Lorg/rabochaya/projects/ProjectsActivity$10;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const-string v2, "\u0424\u0430\u0439\u043b\u044b \u0438 \u0432\u043b\u043e\u0436\u0435\u043d\u0438\u044f \u0445\u0440\u0430\u043d\u044f\u0442\u0441\u044f \u043d\u0430 \u0443\u0441\u0442\u0440\u043e\u0439\u0441\u0442\u0432\u0435. \u0421\u0435\u0442\u0435\u0432\u044b\u0435 \u0441\u0441\u044b\u043b\u043a\u0438 \u043d\u0435 \u0437\u0430\u0433\u0440\u0443\u0436\u0430\u044e\u0442\u0441\u044f."

    const/16 v3, 0xe

    invoke-static {v1, v2, v3}, Lorg/rabochaya/projects/ProjectsActivity;->access$1300(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 71
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1;->val$projects:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$10;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$10;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$1400(Lorg/rabochaya/projects/ProjectsActivity;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$10;

    iget-object v1, v1, Lorg/rabochaya/projects/ProjectsActivity$10;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const-string v2, "\u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u00ab\u0418\u043c\u043f\u043e\u0440\u0442\u00bb, \u0447\u0442\u043e\u0431\u044b \u043e\u0442\u043a\u0440\u044b\u0442\u044c \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 KML \u0438\u043b\u0438 KMZ."

    const/16 v3, 0x10

    invoke-static {v1, v2, v3}, Lorg/rabochaya/projects/ProjectsActivity;->access$1300(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 72
    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1;->val$projects:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/ProjectStore$Summary;

    .line 73
    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$10;

    iget-object v2, v2, Lorg/rabochaya/projects/ProjectsActivity$10;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u25a3  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v1, Lorg/rabochaya/projects/ProjectStore$Summary;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x12

    invoke-static {v2, v3, v4}, Lorg/rabochaya/projects/ProjectsActivity;->access$1300(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/ProjectsActivity$10$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$10;

    iget-object v3, v3, Lorg/rabochaya/projects/ProjectsActivity$10;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v3}, Lorg/rabochaya/projects/ProjectsActivity;->access$1400(Lorg/rabochaya/projects/ProjectsActivity;)Landroid/widget/LinearLayout;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 74
    new-instance v3, Lorg/rabochaya/projects/ProjectsActivity$10$1$1;

    invoke-direct {v3, p0, v1}, Lorg/rabochaya/projects/ProjectsActivity$10$1$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity$10$1;Lorg/rabochaya/projects/ProjectStore$Summary;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
    new-instance v3, Lorg/rabochaya/projects/ProjectsActivity$10$1$2;

    invoke-direct {v3, p0, v1}, Lorg/rabochaya/projects/ProjectsActivity$10$1$2;-><init>(Lorg/rabochaya/projects/ProjectsActivity$10$1;Lorg/rabochaya/projects/ProjectStore$Summary;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 76
    goto :goto_0

    .line 77
    :cond_1
    return-void
.end method
