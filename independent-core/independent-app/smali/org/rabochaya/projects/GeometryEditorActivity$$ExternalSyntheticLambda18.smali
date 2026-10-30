.class public final synthetic Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda18;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:I

.field public final synthetic f$4:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda18;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda18;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda18;->f$2:Ljava/lang/String;

    iput p4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda18;->f$3:I

    iput-object p5, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda18;->f$4:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 7

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda18;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda18;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda18;->f$2:Ljava/lang/String;

    iget v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda18;->f$3:I

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda18;->f$4:Ljava/lang/String;

    move-object v5, p1

    move v6, p2

    invoke-virtual/range {v0 .. v6}, Lorg/rabochaya/projects/GeometryEditorActivity;->lambda$vertices$5$org-rabochaya-projects-GeometryEditorActivity(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Landroid/content/DialogInterface;I)V

    return-void
.end method
