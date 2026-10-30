.class Lorg/rabochaya/projects/LocalMapActivity$1;
.super Ljava/lang/Object;
.source "LocalMapActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/LocalMapActivity;->goToCoordinates()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/LocalMapActivity;

.field final synthetic val$hint:Landroid/widget/TextView;

.field final synthetic val$input:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/widget/EditText;Landroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 57
    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$1;->this$0:Lorg/rabochaya/projects/LocalMapActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity$1;->val$input:Landroid/widget/EditText;

    iput-object p3, p0, Lorg/rabochaya/projects/LocalMapActivity$1;->val$hint:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
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

    .line 57
    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$1;->val$input:Landroid/widget/EditText;

    const-string p2, ""

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$1;->val$input:Landroid/widget/EditText;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    if-nez p3, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$1;->val$hint:Landroid/widget/TextView;

    const-string p2, "\u0428\u0438\u0440\u043e\u0442\u0430 \u0434\u043e\u043b\u0433\u043e\u0442\u0430: 55.75 37.6"

    :goto_0
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    :cond_0
    const/4 p1, 0x1

    if-ne p3, p1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$1;->val$hint:Landroid/widget/TextView;

    const-string p2, "\u0428\u0438\u0440\u043e\u0442\u0430; \u0434\u043e\u043b\u0433\u043e\u0442\u0430: 55\u00b045\u2032 N; 37\u00b036\u2032 E"

    goto :goto_0

    :cond_1
    const/4 p1, 0x2

    if-ne p3, p1, :cond_2

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$1;->val$hint:Landroid/widget/TextView;

    const-string p2, "\u0428\u0438\u0440\u043e\u0442\u0430; \u0434\u043e\u043b\u0433\u043e\u0442\u0430: 55\u00b045\u203200\u2033 N; 37\u00b036\u203200\u2033 E"

    goto :goto_0

    :cond_2
    const/4 p1, 0x3

    if-ne p3, p1, :cond_3

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$1;->val$hint:Landroid/widget/TextView;

    const-string p2, "\u0417\u043e\u043d\u0430, \u043f\u043e\u043b\u0443\u0448\u0430\u0440\u0438\u0435 N/S, Easting, Northing (\u043c\u0435\u0442\u0440\u044b): 37 N 410000 6170000"

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$1;->val$hint:Landroid/widget/TextView;

    const-string p2, "MGRS WGS 84: \u0437\u043e\u043d\u0430, \u0448\u0438\u0440\u043e\u0442\u043d\u044b\u0439 \u043f\u043e\u044f\u0441, \u043a\u0432\u0430\u0434\u0440\u0430\u0442 \u0438 \u0443\u0442\u043e\u0447\u043d\u0435\u043d\u0438\u0435 E/N. \u041f\u0440\u0438\u043c\u0435\u0440: 15S WC 80817 51205. \u041f\u0435\u0440\u0435\u0445\u043e\u0434 \u043a \u0446\u0435\u043d\u0442\u0440\u0443 \u044f\u0447\u0435\u0439\u043a\u0438."

    goto :goto_0

    :goto_1
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

    .line 57
    return-void
.end method
