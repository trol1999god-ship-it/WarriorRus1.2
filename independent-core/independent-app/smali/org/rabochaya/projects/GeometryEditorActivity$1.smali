.class Lorg/rabochaya/projects/GeometryEditorActivity$1;
.super Ljava/lang/Object;
.source "GeometryEditorActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/GeometryEditorActivity;->build(Lorg/rabochaya/projects/GeometryDraft;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/GeometryEditorActivity;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/GeometryEditorActivity;)V
    .locals 0

    .line 112
    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onItemSelected$0$org-rabochaya-projects-GeometryEditorActivity$1(ILandroid/content/DialogInterface;I)V
    .locals 2

    .line 112
    :try_start_0
    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$600(Lorg/rabochaya/projects/GeometryEditorActivity;)Ljava/io/File;

    move-result-object p2

    iget-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$700(Lorg/rabochaya/projects/GeometryEditorActivity;)J

    move-result-wide v0

    iget-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$800(Lorg/rabochaya/projects/GeometryEditorActivity;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, v0, v1, p3}, Lorg/rabochaya/projects/GeometryDraft;->delete(Ljava/io/File;JLjava/lang/String;)V

    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {p2, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$400(Lorg/rabochaya/projects/GeometryEditorActivity;I)V

    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    const/4 p3, 0x1

    invoke-static {p2, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$002(Lorg/rabochaya/projects/GeometryEditorActivity;Z)Z

    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$300(Lorg/rabochaya/projects/GeometryEditorActivity;)Landroid/widget/Spinner;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/widget/Spinner;->setSelection(I)V

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$002(Lorg/rabochaya/projects/GeometryEditorActivity;Z)Z

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {p1, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$500(Lorg/rabochaya/projects/GeometryEditorActivity;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$900(Lorg/rabochaya/projects/GeometryEditorActivity;)Landroid/widget/TextView;

    move-result-object p2

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 112
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$000(Lorg/rabochaya/projects/GeometryEditorActivity;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$100(Lorg/rabochaya/projects/GeometryEditorActivity;)I

    move-result p1

    if-ne p3, p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$200(Lorg/rabochaya/projects/GeometryEditorActivity;)Z

    move-result p1

    const/4 p2, 0x1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$100(Lorg/rabochaya/projects/GeometryEditorActivity;)I

    move-result p1

    iget-object p4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {p4, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$002(Lorg/rabochaya/projects/GeometryEditorActivity;Z)Z

    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$300(Lorg/rabochaya/projects/GeometryEditorActivity;)Landroid/widget/Spinner;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/widget/Spinner;->setSelection(I)V

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$002(Lorg/rabochaya/projects/GeometryEditorActivity;Z)Z

    new-instance p1, Landroid/app/AlertDialog$Builder;

    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-direct {p1, p2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string p2, "\u0421\u043c\u0435\u043d\u0438\u0442\u044c \u043a\u043e\u043d\u0442\u0443\u0440 \u0438 \u043e\u0442\u043c\u0435\u043d\u0438\u0442\u044c \u043d\u0435\u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u0439 \u0432\u0432\u043e\u0434?"

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance p2, Lorg/rabochaya/projects/GeometryEditorActivity$1$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0, p3}, Lorg/rabochaya/projects/GeometryEditorActivity$1$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/GeometryEditorActivity$1;I)V

    const-string p3, "\u0421\u043c\u0435\u043d\u0438\u0442\u044c \u043a\u043e\u043d\u0442\u0443\u0440"

    invoke-virtual {p1, p3, p2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u041f\u0440\u043e\u0434\u043e\u043b\u0436\u0438\u0442\u044c \u0440\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u0435"

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {p1, p3}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$400(Lorg/rabochaya/projects/GeometryEditorActivity;I)V

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {p1, p2}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$500(Lorg/rabochaya/projects/GeometryEditorActivity;Z)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    .line 112
    return-void
.end method
