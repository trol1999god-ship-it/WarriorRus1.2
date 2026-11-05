.class Lorg/rabochaya/projects/ProjectsActivity$19$1;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity$19;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/rabochaya/projects/ProjectsActivity$19;

.field final synthetic val$features:Ljava/util/List;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity$19;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 115
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$19$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$19;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$19$1;->val$features:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 115
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$19$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$19;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$19;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$102(Lorg/rabochaya/projects/ProjectsActivity;Z)Z

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$19$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$19;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$19;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$1000(Lorg/rabochaya/projects/ProjectsActivity;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$19$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$19;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$19;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$2500(Lorg/rabochaya/projects/ProjectsActivity;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$19$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$19;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$19;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$2500(Lorg/rabochaya/projects/ProjectsActivity;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity$19$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$19;

    iget-object v2, v2, Lorg/rabochaya/projects/ProjectsActivity$19;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const-string v3, "\u0421\u0445\u0435\u043c\u0430 \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432 \u00b7 \u0431\u0435\u0437 \u043a\u0430\u0440\u0442\u044b-\u043f\u043e\u0434\u043b\u043e\u0436\u043a\u0438"

    const/16 v4, 0x11

    invoke-static {v2, v3, v4}, Lorg/rabochaya/projects/ProjectsActivity;->access$1300(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity$19$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$19;

    iget-object v2, v2, Lorg/rabochaya/projects/ProjectsActivity$19;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-direct {v0, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity$19$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$19;

    iget-object v2, v2, Lorg/rabochaya/projects/ProjectsActivity$19;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v2}, Lorg/rabochaya/projects/ProjectsActivity;->access$2500(Lorg/rabochaya/projects/ProjectsActivity;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity$19$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$19;

    iget-object v2, v2, Lorg/rabochaya/projects/ProjectsActivity$19;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    new-instance v3, Lorg/rabochaya/projects/ProjectsActivity$19$1$1;

    invoke-direct {v3, p0}, Lorg/rabochaya/projects/ProjectsActivity$19$1$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity$19$1;)V

    const-string v4, "\u041a \u0441\u043f\u0438\u0441\u043a\u0443"

    invoke-static {v2, v0, v4, v3}, Lorg/rabochaya/projects/ProjectsActivity;->access$2600(Lorg/rabochaya/projects/ProjectsActivity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    new-instance v0, Lorg/rabochaya/projects/ProjectMapView;

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity$19$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$19;

    iget-object v2, v2, Lorg/rabochaya/projects/ProjectsActivity$19;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iget-object v3, p0, Lorg/rabochaya/projects/ProjectsActivity$19$1;->val$features:Ljava/util/List;

    new-instance v4, Lorg/rabochaya/projects/ProjectsActivity$19$1$2;

    invoke-direct {v4, p0}, Lorg/rabochaya/projects/ProjectsActivity$19$1$2;-><init>(Lorg/rabochaya/projects/ProjectsActivity$19$1;)V

    invoke-direct {v0, v2, v3, v4}, Lorg/rabochaya/projects/ProjectMapView;-><init>(Landroid/content/Context;Ljava/util/List;Lorg/rabochaya/projects/ProjectMapView$Pick;)V

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity$19$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$19;

    iget-object v2, v2, Lorg/rabochaya/projects/ProjectsActivity$19;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v2}, Lorg/rabochaya/projects/ProjectsActivity;->access$2500(Lorg/rabochaya/projects/ProjectsActivity;)Landroid/widget/LinearLayout;

    move-result-object v2

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v3, v4, v1, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v2, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
