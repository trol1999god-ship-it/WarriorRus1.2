.class Lorg/rabochaya/projects/ProjectsActivity$24$1;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity$24;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/rabochaya/projects/ProjectsActivity$24;

.field final synthetic val$bitmap:Landroid/graphics/Bitmap;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity$24;Landroid/graphics/Bitmap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 135
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$24$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$24;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$24$1;->val$bitmap:Landroid/graphics/Bitmap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 135
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$24$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$24;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$24;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$102(Lorg/rabochaya/projects/ProjectsActivity;Z)Z

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$24$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$24;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$24;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$1000(Lorg/rabochaya/projects/ProjectsActivity;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$24$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$24;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$24;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$1100(Lorg/rabochaya/projects/ProjectsActivity;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$24$1;->val$bitmap:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    const-string v2, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    if-nez v0, :cond_0

    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lorg/rabochaya/projects/ProjectsActivity$24$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$24;

    iget-object v3, v3, Lorg/rabochaya/projects/ProjectsActivity$24;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-direct {v0, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Lorg/rabochaya/projects/ProjectsActivity$24$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$24;

    iget-object v3, v3, Lorg/rabochaya/projects/ProjectsActivity$24;->val$name:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v3, "\u0412\u043b\u043e\u0436\u0435\u043d\u0438\u0435 \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u0435\u0442\u0441\u044f \u043f\u0440\u0438 \u044d\u043a\u0441\u043f\u043e\u0440\u0442\u0435 KMZ. \u041f\u0440\u043e\u0441\u043c\u043e\u0442\u0440 \u044d\u0442\u043e\u0433\u043e \u0444\u043e\u0440\u043c\u0430\u0442\u0430 \u043f\u043e\u043a\u0430 \u043d\u0435 \u0440\u0435\u0430\u043b\u0438\u0437\u043e\u0432\u0430\u043d."

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    :goto_0
    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void

    :cond_0
    new-instance v0, Landroid/widget/ImageView;

    iget-object v3, p0, Lorg/rabochaya/projects/ProjectsActivity$24$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$24;

    iget-object v3, v3, Lorg/rabochaya/projects/ProjectsActivity$24;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-direct {v0, v3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Lorg/rabochaya/projects/ProjectsActivity$24$1;->val$bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V

    new-instance v3, Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Lorg/rabochaya/projects/ProjectsActivity$24$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$24;

    iget-object v4, v4, Lorg/rabochaya/projects/ProjectsActivity$24;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-direct {v3, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v4, p0, Lorg/rabochaya/projects/ProjectsActivity$24$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$24;

    iget-object v4, v4, Lorg/rabochaya/projects/ProjectsActivity$24;->val$name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    goto :goto_0
.end method
