.class Lorg/rabochaya/projects/GeometryEditorActivity$1;
.super Landroid/widget/ArrayAdapter;
.source "GeometryEditorActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/GeometryEditorActivity;->build(Lorg/rabochaya/projects/GeometryDraft;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/GeometryEditorActivity;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/GeometryEditorActivity;Landroid/content/Context;I[Ljava/lang/String;)V
    .locals 0

    .line 172
    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-direct {p0, p2, p3, p4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 172
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {p2, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$000(Lorg/rabochaya/projects/GeometryEditorActivity;Landroid/view/View;)V

    return-object p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 172
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iget-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$1;->this$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    invoke-static {p2, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->access$000(Lorg/rabochaya/projects/GeometryEditorActivity;Landroid/view/View;)V

    return-object p1
.end method
