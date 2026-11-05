.class public final synthetic Lorg/rabochaya/projects/WorkspaceUi$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/PopupWindow;

.field public final synthetic f$1:Lorg/rabochaya/projects/WorkspaceUi$Item;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/PopupWindow;Lorg/rabochaya/projects/WorkspaceUi$Item;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/WorkspaceUi$$ExternalSyntheticLambda0;->f$0:Landroid/widget/PopupWindow;

    iput-object p2, p0, Lorg/rabochaya/projects/WorkspaceUi$$ExternalSyntheticLambda0;->f$1:Lorg/rabochaya/projects/WorkspaceUi$Item;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/WorkspaceUi$$ExternalSyntheticLambda0;->f$0:Landroid/widget/PopupWindow;

    iget-object v1, p0, Lorg/rabochaya/projects/WorkspaceUi$$ExternalSyntheticLambda0;->f$1:Lorg/rabochaya/projects/WorkspaceUi$Item;

    invoke-static {v0, v1, p1}, Lorg/rabochaya/projects/WorkspaceUi;->lambda$menu$2(Landroid/widget/PopupWindow;Lorg/rabochaya/projects/WorkspaceUi$Item;Landroid/view/View;)V

    return-void
.end method
