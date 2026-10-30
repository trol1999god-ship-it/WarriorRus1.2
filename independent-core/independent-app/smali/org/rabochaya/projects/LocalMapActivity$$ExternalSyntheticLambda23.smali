.class public final synthetic Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda23;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/LocalMapActivity;

.field public final synthetic f$1:Landroid/widget/Spinner;

.field public final synthetic f$2:Landroid/widget/CheckBox;

.field public final synthetic f$3:Landroid/widget/Spinner;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/widget/Spinner;Landroid/widget/CheckBox;Landroid/widget/Spinner;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda23;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda23;->f$1:Landroid/widget/Spinner;

    iput-object p3, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda23;->f$2:Landroid/widget/CheckBox;

    iput-object p4, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda23;->f$3:Landroid/widget/Spinner;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 6

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda23;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda23;->f$1:Landroid/widget/Spinner;

    iget-object v2, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda23;->f$2:Landroid/widget/CheckBox;

    iget-object v3, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda23;->f$3:Landroid/widget/Spinner;

    move-object v4, p1

    move v5, p2

    invoke-virtual/range {v0 .. v5}, Lorg/rabochaya/projects/LocalMapActivity;->lambda$coordinateOptions$43$org-rabochaya-projects-LocalMapActivity(Landroid/widget/Spinner;Landroid/widget/CheckBox;Landroid/widget/Spinner;Landroid/content/DialogInterface;I)V

    return-void
.end method
