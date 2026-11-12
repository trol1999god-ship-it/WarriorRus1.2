.class Lorg/rabochaya/projects/MapLayersActivity$4;
.super Ljava/lang/Object;
.source "MapLayersActivity.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/MapLayersActivity;->row(Lorg/rabochaya/projects/MapComposition$Layer;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/MapLayersActivity;

.field final synthetic val$amount:Landroid/widget/TextView;

.field final synthetic val$layer:Lorg/rabochaya/projects/MapComposition$Layer;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/MapLayersActivity;Landroid/widget/TextView;Lorg/rabochaya/projects/MapComposition$Layer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 24
    iput-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity$4;->this$0:Lorg/rabochaya/projects/MapLayersActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/MapLayersActivity$4;->val$amount:Landroid/widget/TextView;

    iput-object p3, p0, Lorg/rabochaya/projects/MapLayersActivity$4;->val$layer:Lorg/rabochaya/projects/MapComposition$Layer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 2

    .line 24
    iget-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity$4;->val$amount:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u041d\u0435\u043f\u0440\u043e\u0437\u0440\u0430\u0447\u043d\u043e\u0441\u0442\u044c: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "%"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz p3, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity$4;->this$0:Lorg/rabochaya/projects/MapLayersActivity;

    iget-object p3, p0, Lorg/rabochaya/projects/MapLayersActivity$4;->val$layer:Lorg/rabochaya/projects/MapComposition$Layer;

    iget-object p3, p3, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    invoke-static {p1, p3}, Lorg/rabochaya/projects/MapLayersActivity;->access$102(Lorg/rabochaya/projects/MapLayersActivity;Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity$4;->this$0:Lorg/rabochaya/projects/MapLayersActivity;

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapLayersActivity;->access$202(Lorg/rabochaya/projects/MapLayersActivity;I)I

    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    .line 24
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    .line 24
    iget-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity$4;->this$0:Lorg/rabochaya/projects/MapLayersActivity;

    invoke-static {p1}, Lorg/rabochaya/projects/MapLayersActivity;->access$300(Lorg/rabochaya/projects/MapLayersActivity;)V

    return-void
.end method
