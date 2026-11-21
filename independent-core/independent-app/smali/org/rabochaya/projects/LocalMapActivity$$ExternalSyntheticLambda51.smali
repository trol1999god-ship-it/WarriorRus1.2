.class public final synthetic Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda51;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/LocalMapActivity;

.field public final synthetic f$1:Landroid/widget/FrameLayout;

.field public final synthetic f$2:Landroid/widget/LinearLayout;

.field public final synthetic f$3:Landroid/widget/LinearLayout;

.field public final synthetic f$4:I

.field public final synthetic f$5:I

.field public final synthetic f$6:Landroid/widget/HorizontalScrollView;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/widget/FrameLayout;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;IILandroid/widget/HorizontalScrollView;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda51;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda51;->f$1:Landroid/widget/FrameLayout;

    iput-object p3, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda51;->f$2:Landroid/widget/LinearLayout;

    iput-object p4, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda51;->f$3:Landroid/widget/LinearLayout;

    iput p5, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda51;->f$4:I

    iput p6, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda51;->f$5:I

    iput-object p7, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda51;->f$6:Landroid/widget/HorizontalScrollView;

    return-void
.end method


# virtual methods
.method public final onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 17

    .line 0
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda51;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iget-object v2, v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda51;->f$1:Landroid/widget/FrameLayout;

    iget-object v3, v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda51;->f$2:Landroid/widget/LinearLayout;

    iget-object v4, v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda51;->f$3:Landroid/widget/LinearLayout;

    iget v5, v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda51;->f$4:I

    iget v6, v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda51;->f$5:I

    iget-object v7, v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda51;->f$6:Landroid/widget/HorizontalScrollView;

    move-object/from16 v8, p1

    move/from16 v9, p2

    move/from16 v10, p3

    move/from16 v11, p4

    move/from16 v12, p5

    move/from16 v13, p6

    move/from16 v14, p7

    move/from16 v15, p8

    move/from16 v16, p9

    invoke-virtual/range {v1 .. v16}, Lorg/rabochaya/projects/LocalMapActivity;->lambda$show$17$org-rabochaya-projects-LocalMapActivity(Landroid/widget/FrameLayout;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;IILandroid/widget/HorizontalScrollView;Landroid/view/View;IIIIIIII)V

    return-void
.end method
