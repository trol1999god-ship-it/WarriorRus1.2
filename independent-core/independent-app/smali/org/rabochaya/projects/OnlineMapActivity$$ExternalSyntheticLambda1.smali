.class public final synthetic Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/OnlineMapActivity;

.field public final synthetic f$1:Landroid/app/AlertDialog;

.field public final synthetic f$2:[Landroid/widget/EditText;

.field public final synthetic f$3:Lorg/rabochaya/projects/TileSource;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/OnlineMapActivity;Landroid/app/AlertDialog;[Landroid/widget/EditText;Lorg/rabochaya/projects/TileSource;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda1;->f$0:Lorg/rabochaya/projects/OnlineMapActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda1;->f$1:Landroid/app/AlertDialog;

    iput-object p3, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda1;->f$2:[Landroid/widget/EditText;

    iput-object p4, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda1;->f$3:Lorg/rabochaya/projects/TileSource;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 4

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda1;->f$0:Lorg/rabochaya/projects/OnlineMapActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda1;->f$1:Landroid/app/AlertDialog;

    iget-object v2, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda1;->f$2:[Landroid/widget/EditText;

    iget-object v3, p0, Lorg/rabochaya/projects/OnlineMapActivity$$ExternalSyntheticLambda1;->f$3:Lorg/rabochaya/projects/TileSource;

    invoke-virtual {v0, v1, v2, v3, p1}, Lorg/rabochaya/projects/OnlineMapActivity;->lambda$region$20$org-rabochaya-projects-OnlineMapActivity(Landroid/app/AlertDialog;[Landroid/widget/EditText;Lorg/rabochaya/projects/TileSource;Landroid/content/DialogInterface;)V

    return-void
.end method
