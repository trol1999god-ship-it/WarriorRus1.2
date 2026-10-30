.class public final synthetic Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda50;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/LocalMapActivity;

.field public final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/LocalMapActivity;Z)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda50;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iput-boolean p2, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda50;->f$1:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda50;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iget-boolean v1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda50;->f$1:Z

    invoke-virtual {v0, v1, p1, p2}, Lorg/rabochaya/projects/LocalMapActivity;->lambda$discardDrawing$62$org-rabochaya-projects-LocalMapActivity(ZLandroid/content/DialogInterface;I)V

    return-void
.end method
