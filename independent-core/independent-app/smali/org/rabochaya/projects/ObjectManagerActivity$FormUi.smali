.class final Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;
.super Ljava/lang/Object;
.source "ObjectManagerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/ObjectManagerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "FormUi"
.end annotation


# instance fields
.field final boxes:[Landroid/widget/CheckBox;

.field dialog:Landroid/app/AlertDialog;

.field final error:Landroid/widget/TextView;

.field final inputs:[Landroid/widget/EditText;

.field final kind:Ljava/lang/String;

.field final pane:Landroid/widget/LinearLayout;

.field final scope:J

.field final spinners:[Landroid/widget/Spinner;

.field final synthetic this$0:Lorg/rabochaya/projects/ObjectManagerActivity;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity;Ljava/lang/String;Landroid/widget/LinearLayout;[Landroid/widget/EditText;[Landroid/widget/Spinner;[Landroid/widget/CheckBox;Landroid/widget/TextView;)V
    .locals 2

    .line 162
    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 161
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$1400(Lorg/rabochaya/projects/ObjectManagerActivity;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->scope:J

    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->pane:Landroid/widget/LinearLayout;

    .line 162
    iput-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->kind:Ljava/lang/String;

    iput-object p4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->inputs:[Landroid/widget/EditText;

    iput-object p5, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->spinners:[Landroid/widget/Spinner;

    iput-object p6, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->boxes:[Landroid/widget/CheckBox;

    iput-object p7, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->error:Landroid/widget/TextView;

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->pane:Landroid/widget/LinearLayout;

    const/4 p4, 0x1

    invoke-virtual {p2, p4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object p2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->pane:Landroid/widget/LinearLayout;

    invoke-static {p1, p3}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$1500(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/view/View;)Landroid/widget/ScrollView;

    move-result-object p1

    new-instance p3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p4, 0x0

    const/high16 p5, 0x3f800000    # 1.0f

    const/4 p6, -0x1

    invoke-direct {p3, p6, p4, p5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p2, p1, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method bind(Landroid/app/AlertDialog;)V
    .locals 1

    .line 164
    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->dialog:Landroid/app/AlertDialog;

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {v0, p0}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$1602(Lorg/rabochaya/projects/ObjectManagerActivity;Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;)Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

    new-instance v0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;)V

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    return-void
.end method

.method capture()Lorg/rabochaya/projects/ObjectFormDraft;
    .locals 12

    .line 163
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->inputs:[Landroid/widget/EditText;

    array-length v0, v0

    new-array v5, v0, [Ljava/lang/String;

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->inputs:[Landroid/widget/EditText;

    array-length v0, v0

    new-array v6, v0, [I

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->inputs:[Landroid/widget/EditText;

    array-length v0, v0

    new-array v7, v0, [I

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->spinners:[Landroid/widget/Spinner;

    array-length v0, v0

    new-array v9, v0, [I

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->boxes:[Landroid/widget/CheckBox;

    array-length v0, v0

    new-array v10, v0, [Z

    const/4 v0, -0x1

    const/4 v1, 0x0

    move v8, v0

    move v0, v1

    :goto_0
    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->inputs:[Landroid/widget/EditText;

    array-length v2, v2

    if-ge v0, v2, :cond_1

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->inputs:[Landroid/widget/EditText;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v5, v0

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->inputs:[Landroid/widget/EditText;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v2

    aput v2, v6, v0

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->inputs:[Landroid/widget/EditText;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v2

    aput v2, v7, v0

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->inputs:[Landroid/widget/EditText;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Landroid/widget/EditText;->hasFocus()Z

    move-result v2

    if-eqz v2, :cond_0

    move v8, v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v1

    :goto_1
    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->spinners:[Landroid/widget/Spinner;

    array-length v2, v2

    if-ge v0, v2, :cond_2

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->spinners:[Landroid/widget/Spinner;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v2

    aput v2, v9, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    :goto_2
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->boxes:[Landroid/widget/CheckBox;

    array-length v0, v0

    if-ge v1, v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->boxes:[Landroid/widget/CheckBox;

    aget-object v0, v0, v1

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    aput-boolean v0, v10, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_3
    new-instance v0, Lorg/rabochaya/projects/ObjectFormDraft;

    iget-wide v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->scope:J

    iget-object v4, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->kind:Ljava/lang/String;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->error:Landroid/widget/TextView;

    if-nez v1, :cond_4

    const-string v1, ""

    goto :goto_3

    :cond_4
    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->error:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_3
    move-object v11, v1

    move-object v1, v0

    invoke-direct/range {v1 .. v11}, Lorg/rabochaya/projects/ObjectFormDraft;-><init>(JLjava/lang/String;[Ljava/lang/String;[I[II[I[ZLjava/lang/String;)V

    return-object v0
.end method

.method synthetic lambda$bind$0$org-rabochaya-projects-ObjectManagerActivity$FormUi(Landroid/content/DialogInterface;)V
    .locals 1

    .line 164
    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {p1}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$1600(Lorg/rabochaya/projects/ObjectManagerActivity;)Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

    move-result-object p1

    if-ne p1, p0, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$1602(Lorg/rabochaya/projects/ObjectManagerActivity;Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;)Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;

    :cond_0
    return-void
.end method

.method shown(Lorg/rabochaya/projects/ObjectFormDraft;)V
    .locals 12

    .line 168
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-virtual {v1}, Lorg/rabochaya/projects/ObjectManagerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "id"

    const-string v3, "android"

    const-string v4, "buttonPanel"

    invoke-virtual {v1, v4, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v2, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setBaselineAligned(Z)V

    .line 169
    const/4 v3, -0x3

    const/4 v4, -0x2

    const/4 v5, -0x1

    filled-new-array {v3, v4, v5}, [I

    move-result-object v3

    move v6, v2

    :goto_0
    const/4 v7, 0x3

    if-ge v6, v7, :cond_4

    aget v7, v3, v6

    iget-object v8, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v8, v7}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v8

    if-nez v8, :cond_0

    goto :goto_2

    :cond_0
    invoke-virtual {v8}, Landroid/widget/Button;->getTransformationMethod()Landroid/text/method/TransformationMethod;

    move-result-object v9

    invoke-virtual {v8}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    instance-of v10, v10, Landroid/view/ViewGroup;

    if-eqz v10, :cond_1

    invoke-virtual {v8}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    check-cast v10, Landroid/view/ViewGroup;

    invoke-virtual {v10, v8}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_1
    invoke-virtual {v8, v2}, Landroid/widget/Button;->setSingleLine(Z)V

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    const/4 v9, 0x2

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setMaxLines(I)V

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v9, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    const/high16 v10, 0x40800000    # 4.0f

    invoke-static {v9, v10}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v9

    invoke-virtual {v8}, Landroid/widget/Button;->getPaddingTop()I

    move-result v10

    invoke-virtual {v8}, Landroid/widget/Button;->getPaddingBottom()I

    move-result v11

    invoke-virtual {v8, v9, v10, v9, v11}, Landroid/widget/Button;->setPadding(IIII)V

    iget-object v9, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    const/high16 v10, 0x42400000    # 48.0f

    invoke-static {v9, v10}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setMinHeight(I)V

    iget-object v9, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {v9, v10}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setMinimumHeight(I)V

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    if-ne v7, v5, :cond_2

    const/high16 v7, 0x3fa00000    # 1.25f

    goto :goto_1

    :cond_2
    if-ne v7, v4, :cond_3

    const/high16 v7, 0x3f400000    # 0.75f

    goto :goto_1

    :cond_3
    const/high16 v7, 0x3f800000    # 1.0f

    :goto_1
    invoke-direct {v9, v2, v4, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 170
    :cond_4
    if-eqz v0, :cond_5

    const/16 v3, 0x8

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_5
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->pane:Landroid/widget/LinearLayout;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->dialog:Landroid/app/AlertDialog;

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$100(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/app/AlertDialog;)V

    .line 171
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Lorg/rabochaya/projects/ObjectFormDraft;->starts()[I

    move-result-object v0

    invoke-virtual {p1}, Lorg/rabochaya/projects/ObjectFormDraft;->ends()[I

    move-result-object v1

    iget v3, p1, Lorg/rabochaya/projects/ObjectFormDraft;->focus:I

    if-ltz v3, :cond_6

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->inputs:[Landroid/widget/EditText;

    iget v4, p1, Lorg/rabochaya/projects/ObjectFormDraft;->focus:I

    aget-object v3, v3, v4

    invoke-virtual {v3}, Landroid/widget/EditText;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_6

    iget-object v3, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->inputs:[Landroid/widget/EditText;

    iget p1, p1, Lorg/rabochaya/projects/ObjectFormDraft;->focus:I

    aget-object p1, v3, p1

    invoke-virtual {p1}, Landroid/widget/EditText;->requestFocus()Z

    goto :goto_3

    :cond_6
    iget p1, p1, Lorg/rabochaya/projects/ObjectFormDraft;->focus:I

    if-gez p1, :cond_7

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->pane:Landroid/widget/LinearLayout;

    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->setFocusableInTouchMode(Z)V

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->pane:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->requestFocus()Z

    :cond_7
    :goto_3
    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->inputs:[Landroid/widget/EditText;

    array-length p1, p1

    if-ge v2, p1, :cond_8

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$FormUi;->inputs:[Landroid/widget/EditText;

    aget-object p1, p1, v2

    aget v3, v0, v2

    aget v4, v1, v2

    invoke-virtual {p1, v3, v4}, Landroid/widget/EditText;->setSelection(II)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 172
    :cond_8
    return-void
.end method
