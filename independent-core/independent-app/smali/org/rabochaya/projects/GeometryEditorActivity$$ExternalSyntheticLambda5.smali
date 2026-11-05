.class public final synthetic Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

.field public final synthetic f$1:Ljava/util/List;

.field public final synthetic f$2:Lorg/rabochaya/projects/GeometryEdits$Part;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/util/List;Lorg/rabochaya/projects/GeometryEdits$Part;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$1:Ljava/util/List;

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$2:Lorg/rabochaya/projects/GeometryEdits$Part;

    iput-object p4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$3:Ljava/lang/String;

    iput-object p5, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$4:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 7

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$1:Ljava/util/List;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$2:Lorg/rabochaya/projects/GeometryEdits$Part;

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$3:Ljava/lang/String;

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda5;->f$4:Ljava/lang/String;

    move-object v5, p1

    move v6, p2

    invoke-virtual/range {v0 .. v6}, Lorg/rabochaya/projects/GeometryEditorActivity;->lambda$actions$1$org-rabochaya-projects-GeometryEditorActivity(Ljava/util/List;Lorg/rabochaya/projects/GeometryEdits$Part;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface;I)V

    return-void
.end method
