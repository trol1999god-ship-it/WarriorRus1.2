.class public final synthetic Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/AttachmentsActivity;

.field public final synthetic f$1:Lorg/rabochaya/projects/MediaLinks$Item;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/AttachmentsActivity;Lorg/rabochaya/projects/MediaLinks$Item;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda6;->f$0:Lorg/rabochaya/projects/AttachmentsActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda6;->f$1:Lorg/rabochaya/projects/MediaLinks$Item;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda6;->f$0:Lorg/rabochaya/projects/AttachmentsActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/AttachmentsActivity$$ExternalSyntheticLambda6;->f$1:Lorg/rabochaya/projects/MediaLinks$Item;

    invoke-virtual {v0, v1, p1, p2}, Lorg/rabochaya/projects/AttachmentsActivity;->lambda$show$8$org-rabochaya-projects-AttachmentsActivity(Lorg/rabochaya/projects/MediaLinks$Item;Landroid/content/DialogInterface;I)V

    return-void
.end method
