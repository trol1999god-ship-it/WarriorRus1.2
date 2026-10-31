.class public final Lorg/rabochaya/projects/GeometryMapCanvas;
.super Landroid/widget/LinearLayout;
.source "GeometryMapCanvas.java"

# interfaces
.implements Lorg/rabochaya/projects/LocalMapView$Listener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/GeometryMapCanvas$Listener;,
        Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;
    }
.end annotation


# instance fields
.field private final activity:Landroid/app/Activity;

.field private final add:Landroid/widget/Button;

.field private adding:Z

.field private closed:Z

.field private final context:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/List<",
            "[D>;>;"
        }
    .end annotation
.end field

.field private final contextTypes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private editable:Z

.field private initialViewport:[D

.field private initialised:Z

.field private final listener:Lorg/rabochaya/projects/GeometryMapCanvas$Listener;

.field private final map:Lorg/rabochaya/projects/LocalMapView;

.field private final overlay:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

.field private final remove:Landroid/widget/Button;

.field private final state:Lorg/rabochaya/projects/GeometryMapState;

.field private final undo:Landroid/widget/Button;


# direct methods
.method public constructor <init>(Landroid/app/Activity;JLorg/rabochaya/projects/GeometryMapState;Ljava/util/List;Ljava/lang/String;Z[DLorg/rabochaya/projects/GeometryMapCanvas$Listener;)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "J",
            "Lorg/rabochaya/projects/GeometryMapState;",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/GeometryEdits$Part;",
            ">;",
            "Ljava/lang/String;",
            "Z[D",
            "Lorg/rabochaya/projects/GeometryMapCanvas$Listener;",
            ")V"
        }
    .end annotation

    .line 25
    move-object/from16 v8, p0

    move-object/from16 v9, p1

    move-object/from16 v10, p4

    move-object/from16 v11, p9

    invoke-direct/range {p0 .. p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, v8, Lorg/rabochaya/projects/GeometryMapCanvas;->context:Ljava/util/List;

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, v8, Lorg/rabochaya/projects/GeometryMapCanvas;->contextTypes:Ljava/util/List;

    .line 21
    const/4 v12, 0x1

    iput-boolean v12, v8, Lorg/rabochaya/projects/GeometryMapCanvas;->editable:Z

    .line 25
    iput-object v9, v8, Lorg/rabochaya/projects/GeometryMapCanvas;->activity:Landroid/app/Activity;

    iput-object v10, v8, Lorg/rabochaya/projects/GeometryMapCanvas;->state:Lorg/rabochaya/projects/GeometryMapState;

    iput-object v11, v8, Lorg/rabochaya/projects/GeometryMapCanvas;->listener:Lorg/rabochaya/projects/GeometryMapCanvas$Listener;

    move-object/from16 v0, p8

    iput-object v0, v8, Lorg/rabochaya/projects/GeometryMapCanvas;->initialViewport:[D

    .line 26
    invoke-virtual {v8, v12}, Lorg/rabochaya/projects/GeometryMapCanvas;->setOrientation(I)V

    const v0, -0xdcd2e3

    invoke-virtual {v8, v0}, Lorg/rabochaya/projects/GeometryMapCanvas;->setBackgroundColor(I)V

    .line 27
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/rabochaya/projects/GeometryEdits$Part;

    if-nez p7, :cond_1

    iget-object v2, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    move-object/from16 v3, p6

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_1

    :cond_1
    move-object/from16 v3, p6

    :goto_1
    :try_start_0
    iget-object v2, v8, Lorg/rabochaya/projects/GeometryMapCanvas;->context:Ljava/util/List;

    iget-object v4, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->text:Ljava/lang/String;

    iget-object v5, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    invoke-static {v4, v5}, Lorg/rabochaya/projects/GeometryCoordinates;->parse(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v2, v8, Lorg/rabochaya/projects/GeometryMapCanvas;->contextTypes:Ljava/util/List;

    iget-object v0, v0, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0

    .line 28
    :cond_2
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, v9}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v13, -0x1

    const/4 v3, 0x0

    invoke-direct {v1, v13, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v0, v1}, Lorg/rabochaya/projects/GeometryMapCanvas;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 29
    invoke-static/range {p1 .. p3}, Lorg/rabochaya/projects/OnlineMapSettings;->active(Landroid/content/Context;J)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static/range {p1 .. p1}, Lorg/rabochaya/projects/OnlineMapSettings;->source(Landroid/content/Context;)Lorg/rabochaya/projects/TileSource;

    move-result-object v1

    goto :goto_2

    :cond_3
    const/4 v1, 0x0

    :goto_2
    move-object v14, v1

    .line 30
    new-instance v15, Ljava/io/File;

    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "local_basemap_"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v4, p2

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ".mbtiles"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v15, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 31
    new-instance v7, Lorg/rabochaya/projects/LocalMapView;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v4

    if-eqz v14, :cond_4

    invoke-static/range {p1 .. p1}, Lorg/rabochaya/projects/OnlineMapSettings;->network(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_4

    move/from16 v16, v12

    goto :goto_3

    :cond_4
    move/from16 v16, v3

    :goto_3
    move-object v1, v7

    move-object/from16 v2, p1

    move-object v3, v4

    move-object v4, v15

    move-object/from16 v5, p0

    move-object v6, v14

    move-object v12, v7

    move/from16 v7, v16

    invoke-direct/range {v1 .. v7}, Lorg/rabochaya/projects/LocalMapView;-><init>(Landroid/content/Context;Ljava/util/List;Ljava/io/File;Lorg/rabochaya/projects/LocalMapView$Listener;Lorg/rabochaya/projects/TileSource;Z)V

    iput-object v12, v8, Lorg/rabochaya/projects/GeometryMapCanvas;->map:Lorg/rabochaya/projects/LocalMapView;

    iget-object v1, v8, Lorg/rabochaya/projects/GeometryMapCanvas;->map:Lorg/rabochaya/projects/LocalMapView;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v13, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    new-instance v1, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    invoke-direct {v1, v8, v9}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;-><init>(Lorg/rabochaya/projects/GeometryMapCanvas;Landroid/app/Activity;)V

    iput-object v1, v8, Lorg/rabochaya/projects/GeometryMapCanvas;->overlay:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    iget-object v1, v8, Lorg/rabochaya/projects/GeometryMapCanvas;->overlay:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v13, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 33
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 34
    new-instance v2, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda4;

    invoke-direct {v2, v8}, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda4;-><init>(Lorg/rabochaya/projects/GeometryMapCanvas;)V

    const-string v3, "+"

    const-string v4, "\u0423\u0432\u0435\u043b\u0438\u0447\u0438\u0442\u044c \u043a\u0430\u0440\u0442\u0443 \u0440\u0435\u0434\u0430\u043a\u0442\u043e\u0440\u0430"

    invoke-direct {v8, v1, v3, v4, v2}, Lorg/rabochaya/projects/GeometryMapCanvas;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    new-instance v2, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda5;

    invoke-direct {v2, v8}, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda5;-><init>(Lorg/rabochaya/projects/GeometryMapCanvas;)V

    const-string v3, "\u2212"

    const-string v4, "\u0423\u043c\u0435\u043d\u044c\u0448\u0438\u0442\u044c \u043a\u0430\u0440\u0442\u0443 \u0440\u0435\u0434\u0430\u043a\u0442\u043e\u0440\u0430"

    invoke-direct {v8, v1, v3, v4, v2}, Lorg/rabochaya/projects/GeometryMapCanvas;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 35
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v3, 0x42400000    # 48.0f

    invoke-direct {v8, v3}, Lorg/rabochaya/projects/GeometryMapCanvas;->dp(F)I

    move-result v4

    const/high16 v5, 0x42c00000    # 96.0f

    invoke-direct {v8, v5}, Lorg/rabochaya/projects/GeometryMapCanvas;->dp(F)I

    move-result v5

    const/16 v6, 0x35

    invoke-direct {v2, v4, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    if-eqz v14, :cond_5

    iget-object v2, v14, Lorg/rabochaya/projects/TileSource;->attribution:Ljava/lang/String;

    goto :goto_4

    :cond_5
    invoke-virtual {v15}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_6

    const-string v2, "\u041b\u043e\u043a\u0430\u043b\u044c\u043d\u0430\u044f \u043a\u0430\u0440\u0442\u0430 MBTiles"

    goto :goto_4

    :cond_6
    const-string v2, "\u041e\u0431\u0437\u043e\u0440\u043d\u0430\u044f \u043a\u0430\u0440\u0442\u0430"

    :goto_4
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v13}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v2, 0x41200000    # 10.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    const v2, -0x33dcd2e3    # -4.2775668E7f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setBackgroundColor(I)V

    const/high16 v2, 0x40800000    # 4.0f

    invoke-direct {v8, v2}, Lorg/rabochaya/projects/GeometryMapCanvas;->dp(F)I

    move-result v4

    const/high16 v5, 0x40000000    # 2.0f

    invoke-direct {v8, v5}, Lorg/rabochaya/projects/GeometryMapCanvas;->dp(F)I

    move-result v6

    invoke-direct {v8, v2}, Lorg/rabochaya/projects/GeometryMapCanvas;->dp(F)I

    move-result v2

    invoke-direct {v8, v5}, Lorg/rabochaya/projects/GeometryMapCanvas;->dp(F)I

    move-result v5

    invoke-virtual {v1, v4, v6, v2, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 37
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v4, 0x53

    const/4 v5, -0x2

    invoke-direct {v2, v5, v5, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v3}, Lorg/rabochaya/projects/GeometryMapCanvas;->dp(F)I

    move-result v2

    invoke-direct {v1, v13, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v0, v1}, Lorg/rabochaya/projects/GeometryMapCanvas;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 39
    new-instance v1, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda6;

    invoke-direct {v1, v8, v11}, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda6;-><init>(Lorg/rabochaya/projects/GeometryMapCanvas;Lorg/rabochaya/projects/GeometryMapCanvas$Listener;)V

    const-string v2, "\u0414\u043e\u0431\u0430\u0432\u0438\u0442\u044c"

    const-string v3, "\u0414\u043e\u0431\u0430\u0432\u0438\u0442\u044c \u0432\u0435\u0440\u0448\u0438\u043d\u0443 \u043d\u0430 \u043a\u0430\u0440\u0442\u0435"

    invoke-direct {v8, v0, v2, v3, v1}, Lorg/rabochaya/projects/GeometryMapCanvas;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    iput-object v1, v8, Lorg/rabochaya/projects/GeometryMapCanvas;->add:Landroid/widget/Button;

    .line 40
    new-instance v1, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda7;

    invoke-direct {v1, v8, v10, v11, v9}, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda7;-><init>(Lorg/rabochaya/projects/GeometryMapCanvas;Lorg/rabochaya/projects/GeometryMapState;Lorg/rabochaya/projects/GeometryMapCanvas$Listener;Landroid/app/Activity;)V

    const-string v2, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c"

    const-string v3, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u0443\u044e \u0432\u0435\u0440\u0448\u0438\u043d\u0443"

    invoke-direct {v8, v0, v2, v3, v1}, Lorg/rabochaya/projects/GeometryMapCanvas;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    iput-object v1, v8, Lorg/rabochaya/projects/GeometryMapCanvas;->remove:Landroid/widget/Button;

    .line 44
    new-instance v1, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda8;

    invoke-direct {v1, v8, v10}, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda8;-><init>(Lorg/rabochaya/projects/GeometryMapCanvas;Lorg/rabochaya/projects/GeometryMapState;)V

    const-string v2, "\u0428\u0430\u0433 \u043d\u0430\u0437\u0430\u0434"

    const-string v3, "\u041e\u0442\u043c\u0435\u043d\u0438\u0442\u044c \u0434\u0435\u0439\u0441\u0442\u0432\u0438\u0435 \u0441 \u0432\u0435\u0440\u0448\u0438\u043d\u043e\u0439"

    invoke-direct {v8, v0, v2, v3, v1}, Lorg/rabochaya/projects/GeometryMapCanvas;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v1

    iput-object v1, v8, Lorg/rabochaya/projects/GeometryMapCanvas;->undo:Landroid/widget/Button;

    .line 45
    new-instance v1, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda9;

    invoke-direct {v1, v8}, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda9;-><init>(Lorg/rabochaya/projects/GeometryMapCanvas;)V

    const-string v2, "\u041e\u0445\u0432\u0430\u0442"

    const-string v3, "\u041f\u043e\u043a\u0430\u0437\u0430\u0442\u044c \u0432\u0435\u0441\u044c \u0440\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u0443\u0435\u043c\u044b\u0439 \u043a\u043e\u043d\u0442\u0443\u0440"

    invoke-direct {v8, v0, v2, v3, v1}, Lorg/rabochaya/projects/GeometryMapCanvas;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/GeometryMapCanvas;->update()V

    .line 46
    return-void
.end method

.method static synthetic access$000(Lorg/rabochaya/projects/GeometryMapCanvas;)Z
    .locals 0

    .line 11
    iget-boolean p0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->initialised:Z

    return p0
.end method

.method static synthetic access$002(Lorg/rabochaya/projects/GeometryMapCanvas;Z)Z
    .locals 0

    .line 11
    iput-boolean p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->initialised:Z

    return p1
.end method

.method static synthetic access$100(Lorg/rabochaya/projects/GeometryMapCanvas;)[D
    .locals 0

    .line 11
    iget-object p0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->initialViewport:[D

    return-object p0
.end method

.method static synthetic access$1000(Lorg/rabochaya/projects/GeometryMapCanvas;)Z
    .locals 0

    .line 11
    iget-boolean p0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->closed:Z

    return p0
.end method

.method static synthetic access$1100(Lorg/rabochaya/projects/GeometryMapCanvas;)Z
    .locals 0

    .line 11
    iget-boolean p0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->adding:Z

    return p0
.end method

.method static synthetic access$1200(Lorg/rabochaya/projects/GeometryMapCanvas;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryMapCanvas;->update()V

    return-void
.end method

.method static synthetic access$1300(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/GeometryMapCanvas$Listener;
    .locals 0

    .line 11
    iget-object p0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->listener:Lorg/rabochaya/projects/GeometryMapCanvas$Listener;

    return-object p0
.end method

.method static synthetic access$1400(Lorg/rabochaya/projects/GeometryMapCanvas;FF)[D
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/GeometryMapCanvas;->coordinate(FF)[D

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1500(Lorg/rabochaya/projects/GeometryMapCanvas;Ljava/lang/Runnable;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryMapCanvas;->act(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$200(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/LocalMapView;
    .locals 0

    .line 11
    iget-object p0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->map:Lorg/rabochaya/projects/LocalMapView;

    return-object p0
.end method

.method static synthetic access$300(Lorg/rabochaya/projects/GeometryMapCanvas;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryMapCanvas;->fit()V

    return-void
.end method

.method static synthetic access$400(Lorg/rabochaya/projects/GeometryMapCanvas;)Ljava/util/List;
    .locals 0

    .line 11
    iget-object p0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->context:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$500(Lorg/rabochaya/projects/GeometryMapCanvas;)Ljava/util/List;
    .locals 0

    .line 11
    iget-object p0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->contextTypes:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$600(Lorg/rabochaya/projects/GeometryMapCanvas;F)I
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryMapCanvas;->dp(F)I

    move-result p0

    return p0
.end method

.method static synthetic access$700(Lorg/rabochaya/projects/GeometryMapCanvas;)Lorg/rabochaya/projects/GeometryMapState;
    .locals 0

    .line 11
    iget-object p0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->state:Lorg/rabochaya/projects/GeometryMapState;

    return-object p0
.end method

.method static synthetic access$800(Lorg/rabochaya/projects/GeometryMapCanvas;[D)[F
    .locals 0

    .line 11
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryMapCanvas;->screen([D)[F

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$900(Lorg/rabochaya/projects/GeometryMapCanvas;)Z
    .locals 0

    .line 11
    iget-boolean p0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->editable:Z

    return p0
.end method

.method private act(Ljava/lang/Runnable;)V
    .locals 1

    .line 49
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->closed:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->editable:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->overlay:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->cancelGesture()V

    :try_start_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->adding:Z

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryMapCanvas;->update()V

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->listener:Lorg/rabochaya/projects/GeometryMapCanvas$Listener;

    invoke-interface {p1}, Lorg/rabochaya/projects/GeometryMapCanvas$Listener;->changed()V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->listener:Lorg/rabochaya/projects/GeometryMapCanvas$Listener;

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lorg/rabochaya/projects/GeometryMapCanvas$Listener;->message(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .locals 3

    .line 48
    new-instance v0, Landroid/widget/Button;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/high16 p2, 0x41400000    # 12.0f

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setTextSize(F)V

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->activity:Landroid/app/Activity;

    invoke-static {p2}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p3, -0x1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {p2, v1, p3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p1, p3, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_0
    new-instance p1, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda1;

    invoke-direct {p1, p0, p4}, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda1;-><init>(Lorg/rabochaya/projects/GeometryMapCanvas;Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method private coordinate(FF)[D
    .locals 17

    .line 59
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/rabochaya/projects/GeometryMapCanvas;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v1}, Lorg/rabochaya/projects/LocalMapView;->viewport()[D

    move-result-object v1

    const/4 v2, 0x2

    aget-wide v3, v1, v2

    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    const-wide/high16 v7, 0x4070000000000000L    # 256.0

    mul-double/2addr v3, v7

    const/4 v7, 0x0

    aget-wide v8, v1, v7

    move/from16 v10, p1

    float-to-double v10, v10

    iget-object v12, v0, Lorg/rabochaya/projects/GeometryMapCanvas;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v12}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v12

    int-to-double v12, v12

    div-double/2addr v12, v5

    sub-double/2addr v10, v12

    div-double/2addr v10, v3

    add-double/2addr v8, v10

    invoke-static {v8, v9}, Lorg/rabochaya/projects/MapMath;->lon(D)D

    move-result-wide v8

    const/4 v10, 0x1

    aget-wide v11, v1, v10

    move/from16 v1, p2

    float-to-double v13, v1

    iget-object v1, v0, Lorg/rabochaya/projects/GeometryMapCanvas;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v1}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v1

    move-wide v15, v8

    int-to-double v7, v1

    div-double/2addr v7, v5

    sub-double/2addr v13, v7

    div-double/2addr v13, v3

    add-double/2addr v11, v13

    invoke-static {v11, v12}, Lorg/rabochaya/projects/MapMath;->lat(D)D

    move-result-wide v3

    new-array v1, v2, [D

    const/4 v2, 0x0

    aput-wide v15, v1, v2

    aput-wide v3, v1, v10

    return-object v1
.end method

.method private dp(F)I
    .locals 1

    .line 47
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->activity:Landroid/app/Activity;

    invoke-static {v0, p1}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result p1

    return p1
.end method

.method private fit()V
    .locals 11

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    iget-object v3, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->state:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v3}, Lorg/rabochaya/projects/GeometryMapState;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->state:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v3, v2}, Lorg/rabochaya/projects/GeometryMapState;->point(I)[D

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->context:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    .line 62
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [[D

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[D

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v2}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v2

    const/4 v3, 0x1

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v4}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {v0, v2, v4}, Lorg/rabochaya/projects/MapMath;->fit([[DII)[D

    move-result-object v0

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->map:Lorg/rabochaya/projects/LocalMapView;

    aget-wide v5, v0, v1

    aget-wide v7, v0, v3

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->state:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v1}, Lorg/rabochaya/projects/GeometryMapState;->size()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v3, :cond_2

    const-wide/high16 v9, 0x4030000000000000L    # 16.0

    aget-wide v1, v0, v2

    invoke-static {v9, v10, v1, v2}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    move-wide v9, v0

    goto :goto_2

    :cond_2
    aget-wide v1, v0, v2

    move-wide v9, v1

    :goto_2
    invoke-virtual/range {v4 .. v10}, Lorg/rabochaya/projects/LocalMapView;->restore(DDD)V

    .line 63
    return-void
.end method

.method static synthetic lambda$new$3(Lorg/rabochaya/projects/GeometryMapState;)V
    .locals 0

    .line 42
    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryMapState;->delete()V

    return-void
.end method

.method static synthetic lambda$new$6(Lorg/rabochaya/projects/GeometryMapState;)V
    .locals 0

    .line 44
    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryMapState;->undo()V

    return-void
.end method

.method private screen([D)[F
    .locals 16

    .line 58
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/rabochaya/projects/GeometryMapCanvas;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v1}, Lorg/rabochaya/projects/LocalMapView;->viewport()[D

    move-result-object v1

    const/4 v2, 0x2

    aget-wide v3, v1, v2

    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    const-wide/high16 v7, 0x4070000000000000L    # 256.0

    mul-double/2addr v3, v7

    iget-object v7, v0, Lorg/rabochaya/projects/GeometryMapCanvas;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v7}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v7

    int-to-double v7, v7

    div-double/2addr v7, v5

    const/4 v9, 0x0

    aget-wide v10, p1, v9

    invoke-static {v10, v11}, Lorg/rabochaya/projects/MapMath;->x(D)D

    move-result-wide v10

    aget-wide v12, v1, v9

    invoke-static {v10, v11, v12, v13}, Lorg/rabochaya/projects/MapMath;->delta(DD)D

    move-result-wide v10

    mul-double/2addr v10, v3

    add-double/2addr v7, v10

    double-to-float v7, v7

    iget-object v8, v0, Lorg/rabochaya/projects/GeometryMapCanvas;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v8}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v8

    int-to-double v10, v8

    div-double/2addr v10, v5

    const/4 v5, 0x1

    aget-wide v12, p1, v5

    invoke-static {v12, v13}, Lorg/rabochaya/projects/MapMath;->y(D)D

    move-result-wide v12

    aget-wide v14, v1, v5

    sub-double/2addr v12, v14

    mul-double/2addr v12, v3

    add-double/2addr v10, v12

    double-to-float v1, v10

    new-array v2, v2, [F

    aput v7, v2, v9

    aput v1, v2, v5

    return-object v2
.end method

.method private update()V
    .locals 5

    .line 50
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->add:Landroid/widget/Button;

    iget-boolean v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->editable:Z

    const-string v2, "Point"

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->state:Lorg/rabochaya/projects/GeometryMapState;

    iget-object v1, v1, Lorg/rabochaya/projects/GeometryMapState;->type:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v4

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->add:Landroid/widget/Button;

    iget-boolean v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->adding:Z

    if-eqz v1, :cond_1

    const-string v1, "\u041a\u043e\u0441\u043d\u0443\u0442\u044c\u0441\u044f\u2026"

    goto :goto_1

    :cond_1
    const-string v1, "\u0414\u043e\u0431\u0430\u0432\u0438\u0442\u044c"

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->remove:Landroid/widget/Button;

    iget-boolean v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->editable:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->state:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v1}, Lorg/rabochaya/projects/GeometryMapState;->selected()I

    move-result v1

    if-ltz v1, :cond_2

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->state:Lorg/rabochaya/projects/GeometryMapState;

    iget-object v1, v1, Lorg/rabochaya/projects/GeometryMapState;->type:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    move v1, v3

    goto :goto_2

    :cond_2
    move v1, v4

    :goto_2
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->undo:Landroid/widget/Button;

    iget-boolean v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->editable:Z

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->state:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v1}, Lorg/rabochaya/projects/GeometryMapState;->canUndo()Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_3

    :cond_3
    move v3, v4

    :goto_3
    invoke-virtual {v0, v3}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->overlay:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->invalidate()V

    return-void
.end method


# virtual methods
.method public cancelGesture()V
    .locals 1

    .line 52
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->overlay:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->cancelGesture()V

    return-void
.end method

.method public center(DDD)V
    .locals 0

    .line 64
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->overlay:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->overlay:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    invoke-virtual {p1}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->invalidate()V

    :cond_0
    return-void
.end method

.method public close()V
    .locals 1

    .line 54
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->closed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->closed:Z

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->overlay:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->cancelGesture()V

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->close()V

    return-void
.end method

.method public draftChanged(I)V
    .locals 0

    .line 68
    return-void
.end method

.method public error(Ljava/lang/String;)V
    .locals 1

    .line 66
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->closed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->listener:Lorg/rabochaya/projects/GeometryMapCanvas$Listener;

    invoke-interface {v0, p1}, Lorg/rabochaya/projects/GeometryMapCanvas$Listener;->message(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$button$9$org-rabochaya-projects-GeometryMapCanvas(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 48
    iget-boolean p2, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->editable:Z

    if-eqz p2, :cond_0

    iget-boolean p2, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->closed:Z

    if-nez p2, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method synthetic lambda$new$0$org-rabochaya-projects-GeometryMapCanvas()V
    .locals 3

    .line 34
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->map:Lorg/rabochaya/projects/LocalMapView;

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/LocalMapView;->step(D)V

    return-void
.end method

.method synthetic lambda$new$1$org-rabochaya-projects-GeometryMapCanvas()V
    .locals 3

    .line 34
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->map:Lorg/rabochaya/projects/LocalMapView;

    const-wide/high16 v1, -0x4010000000000000L    # -1.0

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/LocalMapView;->step(D)V

    return-void
.end method

.method synthetic lambda$new$2$org-rabochaya-projects-GeometryMapCanvas(Lorg/rabochaya/projects/GeometryMapCanvas$Listener;)V
    .locals 1

    .line 39
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->overlay:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->cancelGesture()V

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->adding:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->adding:Z

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryMapCanvas;->update()V

    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->adding:Z

    if-eqz v0, :cond_0

    const-string v0, "\u041a\u043e\u0441\u043d\u0438\u0442\u0435\u0441\u044c \u043c\u0435\u0441\u0442\u0430 \u043d\u043e\u0432\u043e\u0439 \u0432\u0435\u0440\u0448\u0438\u043d\u044b. \u0412\u0441\u0442\u0430\u0432\u043a\u0430 \u043f\u043e\u0441\u043b\u0435 \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u043e\u0439; \u0432\u044b\u0441\u043e\u0442\u0430 \u043d\u043e\u0432\u043e\u0439 \u0432\u0435\u0440\u0448\u0438\u043d\u044b \u2014 0 \u043c"

    goto :goto_0

    :cond_0
    const-string v0, "\u0414\u043e\u0431\u0430\u0432\u043b\u0435\u043d\u0438\u0435 \u043e\u0442\u043c\u0435\u043d\u0435\u043d\u043e"

    :goto_0
    invoke-interface {p1, v0}, Lorg/rabochaya/projects/GeometryMapCanvas$Listener;->message(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$new$4$org-rabochaya-projects-GeometryMapCanvas(Lorg/rabochaya/projects/GeometryMapState;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 42
    new-instance p2, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda3;

    invoke-direct {p2, p1}, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda3;-><init>(Lorg/rabochaya/projects/GeometryMapState;)V

    invoke-direct {p0, p2}, Lorg/rabochaya/projects/GeometryMapCanvas;->act(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$new$5$org-rabochaya-projects-GeometryMapCanvas(Lorg/rabochaya/projects/GeometryMapState;Lorg/rabochaya/projects/GeometryMapCanvas$Listener;Landroid/app/Activity;)V
    .locals 1

    .line 41
    invoke-virtual {p1}, Lorg/rabochaya/projects/GeometryMapState;->selected()I

    move-result v0

    if-gez v0, :cond_0

    const-string p1, "\u0421\u043d\u0430\u0447\u0430\u043b\u0430 \u043a\u043e\u0441\u043d\u0438\u0442\u0435\u0441\u044c \u0432\u0435\u0440\u0448\u0438\u043d\u044b"

    invoke-interface {p2, p1}, Lorg/rabochaya/projects/GeometryMapCanvas$Listener;->message(Ljava/lang/String;)V

    return-void

    .line 42
    :cond_0
    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-direct {p2, p3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string p3, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u0432\u044b\u0431\u0440\u0430\u043d\u043d\u0443\u044e \u0432\u0435\u0440\u0448\u0438\u043d\u0443 \u0438\u0437 \u0442\u0435\u043a\u0443\u0449\u0435\u0433\u043e \u0432\u0432\u043e\u0434\u0430?"

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance p3, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda0;

    invoke-direct {p3, p0, p1}, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/GeometryMapCanvas;Lorg/rabochaya/projects/GeometryMapState;)V

    const-string p1, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c"

    invoke-virtual {p2, p1, p3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 43
    return-void
.end method

.method synthetic lambda$new$7$org-rabochaya-projects-GeometryMapCanvas(Lorg/rabochaya/projects/GeometryMapState;)V
    .locals 1

    .line 44
    new-instance v0, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda2;

    invoke-direct {v0, p1}, Lorg/rabochaya/projects/GeometryMapCanvas$$ExternalSyntheticLambda2;-><init>(Lorg/rabochaya/projects/GeometryMapState;)V

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/GeometryMapCanvas;->act(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$new$8$org-rabochaya-projects-GeometryMapCanvas()V
    .locals 0

    .line 45
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryMapCanvas;->fit()V

    return-void
.end method

.method public longPressed(DD)V
    .locals 0

    .line 69
    return-void
.end method

.method public picked(Lorg/rabochaya/projects/KmlProject$Feature;)V
    .locals 0

    .line 65
    return-void
.end method

.method public screenVertex(I)[F
    .locals 1

    .line 56
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->state:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {v0, p1}, Lorg/rabochaya/projects/GeometryMapState;->point(I)[D

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryMapCanvas;->screen([D)[F

    move-result-object p1

    return-object p1
.end method

.method public setEditingEnabled(Z)V
    .locals 0

    .line 51
    iput-boolean p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->editable:Z

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->overlay:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    invoke-virtual {p1}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->cancelGesture()V

    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryMapCanvas;->update()V

    return-void
.end method

.method public settled(DDD)V
    .locals 0

    .line 67
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->overlay:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->overlay:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    invoke-virtual {p1}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->invalidate()V

    :cond_0
    return-void
.end method

.method public suspend(Z)V
    .locals 1

    .line 53
    if-eqz p1, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->overlay:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    invoke-virtual {v0}, Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;->cancelGesture()V

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0, p1}, Lorg/rabochaya/projects/LocalMapView;->suspend(Z)V

    return-void
.end method

.method public touchSurface()Landroid/view/View;
    .locals 1

    .line 57
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->overlay:Lorg/rabochaya/projects/GeometryMapCanvas$Overlay;

    return-object v0
.end method

.method public viewport()[D
    .locals 1

    .line 55
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapCanvas;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->viewport()[D

    move-result-object v0

    return-object v0
.end method
