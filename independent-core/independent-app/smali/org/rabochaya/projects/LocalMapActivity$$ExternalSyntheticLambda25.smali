.class public final synthetic Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda25;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/LocalMapActivity;

.field public final synthetic f$1:Landroid/app/AlertDialog;

.field public final synthetic f$2:Landroid/widget/EditText;

.field public final synthetic f$3:Landroid/widget/EditText;

.field public final synthetic f$4:Landroid/widget/EditText;

.field public final synthetic f$5:Lorg/rabochaya/projects/KmlProject$Feature;

.field public final synthetic f$6:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Lorg/rabochaya/projects/KmlProject$Feature;Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda25;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda25;->f$1:Landroid/app/AlertDialog;

    iput-object p3, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda25;->f$2:Landroid/widget/EditText;

    iput-object p4, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda25;->f$3:Landroid/widget/EditText;

    iput-object p5, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda25;->f$4:Landroid/widget/EditText;

    iput-object p6, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda25;->f$5:Lorg/rabochaya/projects/KmlProject$Feature;

    iput-object p7, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda25;->f$6:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 8

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda25;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda25;->f$1:Landroid/app/AlertDialog;

    iget-object v2, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda25;->f$2:Landroid/widget/EditText;

    iget-object v3, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda25;->f$3:Landroid/widget/EditText;

    iget-object v4, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda25;->f$4:Landroid/widget/EditText;

    iget-object v5, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda25;->f$5:Lorg/rabochaya/projects/KmlProject$Feature;

    iget-object v6, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda25;->f$6:Ljava/lang/String;

    move-object v7, p1

    invoke-virtual/range {v0 .. v7}, Lorg/rabochaya/projects/LocalMapActivity;->lambda$editObject$67$org-rabochaya-projects-LocalMapActivity(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Lorg/rabochaya/projects/KmlProject$Feature;Ljava/lang/String;Landroid/content/DialogInterface;)V

    return-void
.end method
