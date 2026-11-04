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

.field public final synthetic f$6:Lorg/rabochaya/projects/GeometryEdits$Part;

.field public final synthetic f$7:Ljava/lang/String;

.field public final synthetic f$8:Z


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ILjava/util/List;Lorg/rabochaya/projects/GeometryEdits$Part;Ljava/lang/String;Z)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$1:Ljava/util/List;

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$2:Ljava/lang/String;

    iput-object p4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$3:Ljava/lang/String;

    iput p5, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$4:I

    iput-object p6, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$5:Ljava/util/List;

    iput-object p7, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$6:Lorg/rabochaya/projects/GeometryEdits$Part;

    iput-object p8, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$7:Ljava/lang/String;

    iput-boolean p9, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$8:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 11

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$1:Ljava/util/List;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$2:Ljava/lang/String;

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$3:Ljava/lang/String;

    iget v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$4:I

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$5:Ljava/util/List;

    iget-object v6, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$6:Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v7, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$7:Ljava/lang/String;

    iget-boolean v8, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda23;->f$8:Z

    move-object v9, p1

    move v10, p2

    invoke-virtual/range {v0 .. v10}, Lorg/rabochaya/projects/GeometryEditorActivity;->lambda$vertices$2$org-rabochaya-projects-GeometryEditorActivity(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ILjava/util/List;Lorg/rabochaya/projects/GeometryEdits$Part;Ljava/lang/String;ZLandroid/content/DialogInterface;I)V

    return-void
.end method
