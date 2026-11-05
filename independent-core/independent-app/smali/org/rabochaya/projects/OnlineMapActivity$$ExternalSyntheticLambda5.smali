.class public final synthetic Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/OnlineMapActivity;

.field public final synthetic f$1:Landroid/widget/CheckBox;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/OnlineMapActivity;Landroid/widget/CheckBox;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda5;->f$0:Lorg/rabochaya/projects/OnlineMapActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda5;->f$1:Landroid/widget/CheckBox;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda5;->f$0:Lorg/rabochaya/projects/OnlineMapActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda5;->f$1:Landroid/widget/CheckBox;

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/OnlineMapActivity;->lambda$show$0$org-rabochaya-projects-OnlineMapActivity(Landroid/widget/CheckBox;)V

    return-void
.end method
