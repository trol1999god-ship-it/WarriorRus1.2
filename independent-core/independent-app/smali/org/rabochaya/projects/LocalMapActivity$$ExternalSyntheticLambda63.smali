.class public final synthetic Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda63;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/LocalMapActivity;

.field public final synthetic f$1:Landroid/app/AlertDialog;

.field public final synthetic f$2:Landroid/widget/EditText;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/app/AlertDialog;Landroid/widget/EditText;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda63;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda63;->f$1:Landroid/app/AlertDialog;

    iput-object p3, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda63;->f$2:Landroid/widget/EditText;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 3

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda63;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda63;->f$1:Landroid/app/AlertDialog;

    iget-object v2, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda63;->f$2:Landroid/widget/EditText;

    invoke-virtual {v0, v1, v2, p1}, Lorg/rabochaya/projects/LocalMapActivity;->lambda$search$48$org-rabochaya-projects-LocalMapActivity(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/content/DialogInterface;)V

    return-void
.end method
