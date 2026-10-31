.class Lorg/rabochaya/projects/GeometryEditorActivity$2;
.super Ljava/lang/Object;
.source "GeometryEditorActivity.java"

# interfaces
.implements Lorg/rabochaya/projects/GeometryMapCanvas$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/GeometryEditorActivity;->openMap()V
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

    .line 126
    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$2;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public changed()V
    .locals 6

    .line 127
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$2;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$1000(Lorg/rabochaya/projects/GeometryEditorActivity;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$2;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$1100(Lorg/rabochaya/projects/GeometryEditorActivity;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$2;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$1200(Lorg/rabochaya/projects/GeometryEditorActivity;)Lorg/rabochaya/projects/GeometryMapCanvas;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$2;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$1300(Lorg/rabochaya/projects/GeometryEditorActivity;)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$2;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$1500(Lorg/rabochaya/projects/GeometryEditorActivity;)Landroid/widget/EditText;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$2;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$1400(Lorg/rabochaya/projects/GeometryEditorActivity;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object v1

    invoke-virtual {v1}, Lorg/rabochaya/projects/GeometryMapState;->text()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$2;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$1500(Lorg/rabochaya/projects/GeometryEditorActivity;)Landroid/widget/EditText;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$2;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$1600(Lorg/rabochaya/projects/GeometryEditorActivity;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$2;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$2;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$1400(Lorg/rabochaya/projects/GeometryEditorActivity;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object v2

    invoke-virtual {v2}, Lorg/rabochaya/projects/GeometryMapState;->selected()I

    move-result v2

    if-ltz v2, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u0412\u0435\u0440\u0448\u0438\u043d\u0430 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$2;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {v3}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$1400(Lorg/rabochaya/projects/GeometryEditorActivity;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object v3

    invoke-virtual {v3}, Lorg/rabochaya/projects/GeometryMapState;->selected()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", \u0432\u044b\u0441\u043e\u0442\u0430 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$2;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {v3}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$1400(Lorg/rabochaya/projects/GeometryEditorActivity;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object v3

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$2;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {v4}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$1400(Lorg/rabochaya/projects/GeometryEditorActivity;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object v4

    invoke-virtual {v4}, Lorg/rabochaya/projects/GeometryMapState;->selected()I

    move-result v4

    invoke-virtual {v3, v4}, Lorg/rabochaya/projects/GeometryMapState;->point(I)[D

    move-result-object v3

    const/4 v4, 0x2

    aget-wide v4, v3, v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \u043c. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_1
    const-string v2, ""

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$2;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {v2}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$1400(Lorg/rabochaya/projects/GeometryEditorActivity;)Lorg/rabochaya/projects/GeometryMapState;

    move-result-object v2

    invoke-virtual {v2}, Lorg/rabochaya/projects/GeometryMapState;->complete()Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v2, "\u0412\u0432\u043e\u0434 \u0438\u0437\u043c\u0435\u043d\u0451\u043d; \u043d\u0430\u0436\u043c\u0438\u0442\u0435 \u00ab\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c\u00bb"

    goto :goto_1

    :cond_2
    const-string v2, "\u041d\u043e\u0432\u044b\u0439 \u043a\u043e\u043d\u0442\u0443\u0440: \u043d\u0443\u0436\u043d\u044b \u043c\u0438\u043d\u0438\u043c\u0443\u043c \u0442\u0440\u0438 \u0440\u0430\u0437\u043d\u044b\u0435 \u0432\u0435\u0440\u0448\u0438\u043d\u044b"

    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$1700(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/lang/String;)V

    :cond_3
    :goto_2
    return-void
.end method

.method public message(Ljava/lang/String;)V
    .locals 1

    .line 128
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$2;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$1000(Lorg/rabochaya/projects/GeometryEditorActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$2;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {v0, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$1700(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
