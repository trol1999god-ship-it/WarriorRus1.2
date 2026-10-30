.class public final synthetic Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/LocalMapActivity;

.field public final synthetic f$1:Landroid/app/AlertDialog;

.field public final synthetic f$2:Lorg/rabochaya/projects/KmlProject$Feature;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/app/AlertDialog;Lorg/rabochaya/projects/KmlProject$Feature;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda4;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda4;->f$1:Landroid/app/AlertDialog;

    iput-object p3, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda4;->f$2:Lorg/rabochaya/projects/KmlProject$Feature;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda4;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda4;->f$1:Landroid/app/AlertDialog;

    iget-object v2, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda4;->f$2:Lorg/rabochaya/projects/KmlProject$Feature;

    invoke-virtual {v0, v1, v2, p1}, Lorg/rabochaya/projects/LocalMapActivity;->lambda$picked$56$org-rabochaya-projects-LocalMapActivity(Landroid/app/AlertDialog;Lorg/rabochaya/projects/KmlProject$Feature;Landroid/view/View;)V

    return-void
.end method
