.class public final synthetic Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

.field public final synthetic f$1:Ljava/util/List;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:I

.field public final synthetic f$5:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ILjava/util/List;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$1:Ljava/util/List;

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$2:Ljava/lang/String;

    iput-object p4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$3:Ljava/lang/String;

    iput p5, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$4:I

    iput-object p6, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$5:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 8

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$1:Ljava/util/List;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$2:Ljava/lang/String;

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$3:Ljava/lang/String;

    iget v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$4:I

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$5:Ljava/util/List;

    move-object v6, p1

    move v7, p2

    invoke-virtual/range {v0 .. v7}, Lorg/rabochaya/projects/GeometryEditorActivity;->lambda$vertices$4$org-rabochaya-projects-GeometryEditorActivity(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ILjava/util/List;Landroid/content/DialogInterface;I)V

    return-void
.end method
