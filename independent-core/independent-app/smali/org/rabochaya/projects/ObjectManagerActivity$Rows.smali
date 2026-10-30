.class final Lorg/rabochaya/projects/ObjectManagerActivity$Rows;
.super Landroid/widget/BaseAdapter;
.source "ObjectManagerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/ObjectManagerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Rows"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ObjectManagerActivity;


# direct methods
.method private constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V
    .locals 0

    .line 61
    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity;Lorg/rabochaya/projects/ObjectManagerActivity$1;)V
    .locals 0

    .line 61
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 62
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$200(Lorg/rabochaya/projects/ObjectManagerActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .line 62
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$200(Lorg/rabochaya/projects/ObjectManagerActivity;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    .line 62
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5

    .line 63
    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {p2}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$200(Lorg/rabochaya/projects/ObjectManagerActivity;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/rabochaya/projects/ObjectTree$Row;

    new-instance p2, Landroid/widget/LinearLayout;

    iget-object p3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-direct {p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 p3, 0x10

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 64
    new-instance p3, Landroid/widget/CheckBox;

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-direct {p3, v0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$300(Lorg/rabochaya/projects/ObjectManagerActivity;)Lorg/rabochaya/projects/ObjectListing;

    move-result-object v0

    iget-object v1, p1, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/ObjectListing;->get(Ljava/lang/String;)Lorg/rabochaya/projects/ObjectListing$Item;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p1, Lorg/rabochaya/projects/ObjectTree$Row;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v3, Lorg/rabochaya/projects/ObjectListing;->KINDS:[Ljava/lang/String;

    iget v4, v0, Lorg/rabochaya/projects/ObjectListing$Item;->kind:I

    aget-object v3, v3, v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v3, v0, Lorg/rabochaya/projects/ObjectListing$Item;->visible:Z

    const-string v4, ""

    if-eqz v3, :cond_0

    move-object v3, v4

    goto :goto_0

    :cond_0
    const-string v3, " \u00b7 \u0421\u043a\u0440\u044b\u0442\u043e \u043f\u043e KML"

    :goto_0
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {v3}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$400(Lorg/rabochaya/projects/ObjectManagerActivity;)Lorg/rabochaya/projects/ObjectListing$Options;

    move-result-object v3

    iget-boolean v3, v3, Lorg/rabochaya/projects/ObjectListing$Options;->recursive:Z

    if-eqz v3, :cond_1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v0, v0, Lorg/rabochaya/projects/ObjectListing$Item;->path:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :cond_1
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, 0x3

    invoke-virtual {p3, v0}, Landroid/widget/CheckBox;->setMaxLines(I)V

    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p3, v0}, Landroid/widget/CheckBox;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$500(Lorg/rabochaya/projects/ObjectManagerActivity;)Ljava/util/Set;

    move-result-object v0

    iget-object v1, p1, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {p3, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$600(Lorg/rabochaya/projects/ObjectManagerActivity;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p3, v0}, Landroid/widget/CheckBox;->setEnabled(Z)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    invoke-direct {v0, v3, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p2, p3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity$Rows$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity$Rows;Lorg/rabochaya/projects/ObjectTree$Row;)V

    invoke-virtual {p3, v0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 65
    new-instance v0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity$Rows$$ExternalSyntheticLambda1;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity$Rows;Lorg/rabochaya/projects/ObjectTree$Row;)V

    .line 66
    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-virtual {p3, v0}, Landroid/widget/CheckBox;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 67
    iget-boolean p3, p1, Lorg/rabochaya/projects/ObjectTree$Row;->folder:Z

    if-eqz p3, :cond_2

    iget-object p3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    new-instance v1, Lorg/rabochaya/projects/ObjectManagerActivity$Rows$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity$Rows$$ExternalSyntheticLambda2;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity$Rows;Lorg/rabochaya/projects/ObjectTree$Row;)V

    const-string p1, "\u041e\u0442\u043a\u0440\u044b\u0442\u044c"

    invoke-static {p3, p2, p1, v1}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$700(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    :cond_2
    return-object p2
.end method

.method synthetic lambda$getView$0$org-rabochaya-projects-ObjectManagerActivity$Rows(Lorg/rabochaya/projects/ObjectTree$Row;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 64
    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {p2}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$600(Lorg/rabochaya/projects/ObjectManagerActivity;)Z

    move-result p2

    if-eqz p2, :cond_0

    return-void

    :cond_0
    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {p2}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$500(Lorg/rabochaya/projects/ObjectManagerActivity;)Ljava/util/Set;

    move-result-object p2

    iget-object p1, p1, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    if-eqz p3, :cond_1

    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-interface {p2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :goto_0
    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$1200(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$1300(Lorg/rabochaya/projects/ObjectManagerActivity;)Landroid/widget/TextView;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "\u0412\u044b\u0431\u0440\u0430\u043d\u043e: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object p3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {p3}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$500(Lorg/rabochaya/projects/ObjectManagerActivity;)Ljava/util/Set;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/Set;->size()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$getView$1$org-rabochaya-projects-ObjectManagerActivity$Rows(Lorg/rabochaya/projects/ObjectTree$Row;Landroid/view/View;)Z
    .locals 2

    .line 65
    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {p2}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$600(Lorg/rabochaya/projects/ObjectManagerActivity;)Z

    move-result p2

    const/4 v0, 0x1

    if-nez p2, :cond_2

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {p2}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$900(Lorg/rabochaya/projects/ObjectManagerActivity;)Lorg/w3c/dom/Element;

    move-result-object p2

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {p2}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$500(Lorg/rabochaya/projects/ObjectManagerActivity;)Ljava/util/Set;

    move-result-object p2

    iget-object v1, p1, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-interface {p2, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {p2}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$500(Lorg/rabochaya/projects/ObjectManagerActivity;)Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->clear()V

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {p2}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$500(Lorg/rabochaya/projects/ObjectManagerActivity;)Ljava/util/Set;

    move-result-object p2

    iget-object v1, p1, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-interface {p2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {p2}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$1000(Lorg/rabochaya/projects/ObjectManagerActivity;)V

    :cond_1
    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {p2, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$1100(Lorg/rabochaya/projects/ObjectManagerActivity;Lorg/rabochaya/projects/ObjectTree$Row;)V

    :cond_2
    :goto_0
    return v0
.end method

.method synthetic lambda$getView$2$org-rabochaya-projects-ObjectManagerActivity$Rows(Lorg/rabochaya/projects/ObjectTree$Row;)V
    .locals 1

    .line 67
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$Rows;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iget-object p1, p1, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    invoke-static {v0, p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$800(Lorg/rabochaya/projects/ObjectManagerActivity;Ljava/lang/String;)V

    return-void
.end method
