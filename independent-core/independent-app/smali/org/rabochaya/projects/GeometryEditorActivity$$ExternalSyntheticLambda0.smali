.class public final synthetic Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

.field public final synthetic f$1:Ljava/util/List;

.field public final synthetic f$2:Ljava/util/List;

.field public final synthetic f$3:I

.field public final synthetic f$4:Ljava/util/List;

.field public final synthetic f$5:Ljava/lang/String;

.field public final synthetic f$6:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/GeometryEditorActivity;Ljava/util/List;Ljava/util/List;ILjava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;->f$1:Ljava/util/List;

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;->f$2:Ljava/util/List;

    iput p4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;->f$3:I

    iput-object p5, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;->f$4:Ljava/util/List;

    iput-object p6, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;->f$5:Ljava/lang/String;

    iput-object p7, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;->f$6:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 9

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;->f$0:Lorg/rabochaya/projects/GeometryEditorActivity;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;->f$1:Ljava/util/List;

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;->f$2:Ljava/util/List;

    iget v3, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;->f$3:I

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;->f$4:Ljava/util/List;

    iget-object v5, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;->f$5:Ljava/lang/String;

    iget-object v6, p0, Lorg/rabochaya/projects/GeometryEditorActivity$$ExternalSyntheticLambda0;->f$6:Ljava/lang/String;

    move-object v7, p1

    move v8, p2

    invoke-virtual/range {v0 .. v8}, Lorg/rabochaya/projects/GeometryEditorActivity;->lambda$vertices$6$org-rabochaya-projects-GeometryEditorActivity(Ljava/util/List;Ljava/util/List;ILjava/util/List;Ljava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface;I)V

    return-void
.end method
