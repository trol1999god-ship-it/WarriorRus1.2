.class Lorg/rabochaya/projects/MapLayersActivity$3;
.super Landroid/widget/ArrayAdapter;
.source "MapLayersActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/MapLayersActivity;->addChoices()V
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
.field final synthetic this$0:Lorg/rabochaya/projects/MapLayersActivity;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/MapLayersActivity;Landroid/content/Context;ILjava/util/List;)V
    .locals 0

    .line 23
    iput-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity$3;->this$0:Lorg/rabochaya/projects/MapLayersActivity;

    invoke-direct {p0, p2, p3, p4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 23
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iget-object p2, p0, Lorg/rabochaya/projects/MapLayersActivity$3;->this$0:Lorg/rabochaya/projects/MapLayersActivity;

    invoke-static {p2, p1}, Lorg/rabochaya/projects/MapLayersActivity;->access$000(Lorg/rabochaya/projects/MapLayersActivity;Landroid/view/View;)V

    return-object p1
.end method
