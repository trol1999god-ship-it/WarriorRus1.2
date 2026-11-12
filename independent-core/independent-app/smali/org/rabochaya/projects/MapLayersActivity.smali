.class public final Lorg/rabochaya/projects/MapLayersActivity;
.super Landroid/app/Activity;
.source "MapLayersActivity.java"


# static fields
.field private static final PICK_SOURCE:I = 0x11a9


# instance fields
.field private disposed:Z

.field private list:Landroid/widget/LinearLayout;

.field private pendingLayer:Ljava/lang/String;

.field private pendingOpacity:I

.field private project:J

.field private restoreY:I

.field private root:Landroid/widget/LinearLayout;

.field private scroll:Landroid/widget/ScrollView;

.field private snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

.field private status:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 4
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lorg/rabochaya/projects/MapLayersActivity;Landroid/view/View;)V
    .locals 0

    .line 4
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->font(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$102(Lorg/rabochaya/projects/MapLayersActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 4
    iput-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity;->pendingLayer:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$202(Lorg/rabochaya/projects/MapLayersActivity;I)I
    .locals 0

    .line 4
    iput p1, p0, Lorg/rabochaya/projects/MapLayersActivity;->pendingOpacity:I

    return p1
.end method

.method static synthetic access$300(Lorg/rabochaya/projects/MapLayersActivity;)V
    .locals 0

    .line 4
    invoke-direct {p0}, Lorg/rabochaya/projects/MapLayersActivity;->flushOpacity()V

    return-void
.end method

.method private add(Lorg/rabochaya/projects/MapComposition$Layer;)V
    .locals 3

    .line 28
    :try_start_0
    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    iget-object v0, v0, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;

    invoke-virtual {v0, p1}, Lorg/rabochaya/projects/MapComposition;->add(Lorg/rabochaya/projects/MapComposition$Layer;)Lorg/rabochaya/projects/MapComposition;

    move-result-object p1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/rabochaya/projects/MapLayersActivity;->apply(Lorg/rabochaya/projects/MapComposition;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u0421\u043b\u043e\u0439 \u043d\u0435 \u0434\u043e\u0431\u0430\u0432\u043b\u0435\u043d: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method private addChoices()V
    .locals 7

    .line 23
    invoke-direct {p0}, Lorg/rabochaya/projects/MapLayersActivity;->flushOpacity()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const-string v2, "\u0418\u0437 \u043a\u0430\u0442\u0430\u043b\u043e\u0433\u0430"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v2, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda1;-><init>(Lorg/rabochaya/projects/MapLayersActivity;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "catalog"

    const-string v4, ""

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "template"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "\u041d\u0430\u0441\u0442\u0440\u043e\u0435\u043d\u043d\u044b\u0439 XYZ-\u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v2, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda2;-><init>(Lorg/rabochaya/projects/MapLayersActivity;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Lorg/rabochaya/projects/MapLayersActivity;->getFilesDir()Ljava/io/File;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "local_basemap_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v5, p0, Lorg/rabochaya/projects/MapLayersActivity;->project:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".mbtiles"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "MBTiles \u043f\u0440\u043e\u0435\u043a\u0442\u0430"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v2, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda3;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda3;-><init>(Lorg/rabochaya/projects/MapLayersActivity;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    const-string v2, "\u041e\u0431\u0437\u043e\u0440\u043d\u0430\u044f \u043a\u0430\u0440\u0442\u0430"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v2, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda4;-><init>(Lorg/rabochaya/projects/MapLayersActivity;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v2, Lorg/rabochaya/projects/MapLayersActivity$3;

    const v3, 0x1090011

    invoke-direct {v2, p0, p0, v3, v0}, Lorg/rabochaya/projects/MapLayersActivity$3;-><init>(Lorg/rabochaya/projects/MapLayersActivity;Landroid/content/Context;ILjava/util/List;)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "\u0414\u043e\u0431\u0430\u0432\u0438\u0442\u044c \u0441\u043b\u043e\u0439"

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v3, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda5;

    invoke-direct {v3, v1}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda5;-><init>(Ljava/util/ArrayList;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda6;

    invoke-direct {v1, p0, v0}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda6;-><init>(Lorg/rabochaya/projects/MapLayersActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private apply(Lorg/rabochaya/projects/MapComposition;Z)V
    .locals 7

    .line 29
    iget-boolean v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->disposed:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->pendingLayer:Ljava/lang/String;

    :try_start_0
    iget-wide v2, p0, Lorg/rabochaya/projects/MapLayersActivity;->project:J

    iget-object v4, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    move-object v1, p0

    move-object v5, p1

    move v6, p2

    invoke-static/range {v1 .. v6}, Lorg/rabochaya/projects/MapCompositionSettings;->save(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionSettings$Snapshot;Lorg/rabochaya/projects/MapComposition;Z)Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    const-string p1, ""

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->show(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u0418\u0437\u043c\u0435\u043d\u0435\u043d\u0438\u0435 \u043d\u0435 \u043f\u0440\u0438\u043c\u0435\u043d\u0435\u043d\u043e: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->reload(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .locals 3

    .line 9
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 p2, 0x0

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 p2, 0x41600000    # 14.0f

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setTextSize(F)V

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    const/16 p2, 0x30

    invoke-direct {p0, p2}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result p2

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setMinHeight(I)V

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {p2, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda18;

    invoke-direct {p1, p3}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda18;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method private checkTint(Landroid/widget/CheckBox;)V
    .locals 5

    .line 11
    new-instance v0, Landroid/content/res/ColorStateList;

    const v1, 0x10100a0

    filled-new-array {v1}, [I

    move-result-object v1

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/4 v4, 0x2

    new-array v4, v4, [[I

    aput-object v1, v4, v2

    const/4 v1, 0x1

    aput-object v3, v4, v1

    const v1, -0xff6978

    const v2, -0x2f2937

    filled-new-array {v1, v2}, [I

    move-result-object v1

    invoke-direct {v0, v4, v1}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method private confirmPreset(Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Lorg/rabochaya/projects/MapCompositionPresets$Entry;Z)V
    .locals 9

    .line 22
    if-eqz p4, :cond_0

    const-string v0, "\u0411\u0443\u0434\u0435\u0442 \u0443\u0434\u0430\u043b\u0435\u043d\u043e \u0442\u043e\u043b\u044c\u043a\u043e \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u043e\u0435 \u0438\u043c\u044f \u0438 \u0441\u043e\u0441\u0442\u0430\u0432 \u043d\u0430\u0431\u043e\u0440\u0430. \u0422\u0435\u043a\u0443\u0449\u0438\u0435 \u0441\u043b\u043e\u0438, \u043a\u0430\u0440\u0442\u044b, \u043a\u0435\u0448 \u0438 \u043e\u0431\u044a\u0435\u043a\u0442\u044b \u043e\u0441\u0442\u0430\u043d\u0443\u0442\u0441\u044f."

    goto :goto_0

    :cond_0
    const-string v0, "\u041f\u043e\u043a\u0430\u0437\u0430\u043d\u043d\u044b\u0439 \u0441\u043e\u0441\u0442\u0430\u0432 \u0431\u0443\u0434\u0435\u0442 \u0437\u0430\u043c\u0435\u043d\u0451\u043d \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u043c\u0438 \u0441\u043b\u043e\u044f\u043c\u0438, \u043f\u043e\u0440\u044f\u0434\u043a\u043e\u043c, \u0432\u0438\u0434\u0438\u043c\u043e\u0441\u0442\u044c\u044e \u0438 \u043f\u0440\u043e\u0437\u0440\u0430\u0447\u043d\u043e\u0441\u0442\u044c\u044e; \u043a\u043e\u043c\u043f\u043e\u0437\u0438\u0446\u0438\u044f \u0431\u0443\u0434\u0435\u0442 \u0432\u043a\u043b\u044e\u0447\u0435\u043d\u0430. \u0424\u0430\u0439\u043b\u044b \u043a\u0430\u0440\u0442, \u043a\u0435\u0448 \u0438 \u043e\u0431\u044a\u0435\u043a\u0442\u044b \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u044e\u0442\u0441\u044f. \u041b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 \u0441\u043b\u043e\u0439 \u0438\u0441\u043f\u043e\u043b\u044c\u0437\u0443\u0435\u0442 \u0443\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d\u043d\u044b\u0439 \u0441\u0435\u0439\u0447\u0430\u0441 MBTiles \u044d\u0442\u043e\u0433\u043e \u043f\u0440\u043e\u0435\u043a\u0442\u0430, \u043d\u0430\u0431\u043e\u0440 \u043d\u0435 \u0445\u0440\u0430\u043d\u0438\u0442 \u043a\u043e\u043f\u0438\u044e \u0444\u0430\u0439\u043b\u0430."

    :goto_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    if-eqz p4, :cond_1

    const-string v2, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u043d\u0430\u0431\u043e\u0440?"

    goto :goto_1

    :cond_1
    const-string v2, "\u041f\u0440\u0438\u043c\u0435\u043d\u0438\u0442\u044c \u043d\u0430\u0431\u043e\u0440?"

    :goto_1
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p3, Lorg/rabochaya/projects/MapCompositionPresets$Entry;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    if-eqz p4, :cond_2

    const-string v1, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c"

    goto :goto_2

    :cond_2
    const-string v1, "\u041f\u0440\u0438\u043c\u0435\u043d\u0438\u0442\u044c"

    :goto_2
    new-instance v8, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda9;

    move-object v2, v8

    move-object v3, p0

    move v4, p4

    move-object v5, p1

    move-object v6, p3

    move-object v7, p2

    invoke-direct/range {v2 .. v7}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda9;-><init>(Lorg/rabochaya/projects/MapLayersActivity;ZLorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionPresets$Entry;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;)V

    invoke-virtual {v0, v1, v8}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->prepared(Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private dp(I)I
    .locals 0

    .line 7
    int-to-float p1, p1

    invoke-static {p0, p1}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result p1

    return p1
.end method

.method private flushOpacity()V
    .locals 3

    .line 30
    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->pendingLayer:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->pendingLayer:Ljava/lang/String;

    iget v1, p0, Lorg/rabochaya/projects/MapLayersActivity;->pendingOpacity:I

    const/4 v2, 0x0

    iput-object v2, p0, Lorg/rabochaya/projects/MapLayersActivity;->pendingLayer:Ljava/lang/String;

    :try_start_0
    iget-object v2, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    iget-object v2, v2, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;

    invoke-virtual {v2, v0, v1}, Lorg/rabochaya/projects/MapComposition;->opacity(Ljava/lang/String;I)Lorg/rabochaya/projects/MapComposition;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lorg/rabochaya/projects/MapLayersActivity;->apply(Lorg/rabochaya/projects/MapComposition;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u0418\u0437\u043c\u0435\u043d\u0435\u043d\u0438\u0435 \u043d\u0435 \u043f\u0440\u0438\u043c\u0435\u043d\u0435\u043d\u043e: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/MapLayersActivity;->reload(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private font(Landroid/view/View;)V
    .locals 3

    .line 10
    instance-of v0, p1, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Landroid/widget/TextView;

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    move-object v1, p1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_1

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/MapLayersActivity;->font(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method static synthetic lambda$addChoices$17(Ljava/util/ArrayList;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 23
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$button$0(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 9
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method private prepared(Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 2

    .line 18
    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    new-instance v0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda15;

    invoke-direct {v0, p0, p1}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda15;-><init>(Lorg/rabochaya/projects/MapLayersActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    return-object p1
.end method

.method private presetActions(Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Lorg/rabochaya/projects/MapCompositionPresets$Entry;)V
    .locals 3

    .line 21
    new-instance v0, Lorg/rabochaya/projects/MapLayersActivity$2;

    const-string v1, "\u041f\u0440\u0438\u043c\u0435\u043d\u0438\u0442\u044c \u043d\u0430\u0431\u043e\u0440"

    const-string v2, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u043d\u0430\u0431\u043e\u0440"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const v2, 0x1090011

    invoke-direct {v0, p0, p0, v2, v1}, Lorg/rabochaya/projects/MapLayersActivity$2;-><init>(Lorg/rabochaya/projects/MapLayersActivity;Landroid/content/Context;I[Ljava/lang/String;)V

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v2, p3, Lorg/rabochaya/projects/MapCompositionPresets$Entry;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda7;

    invoke-direct {v2, p0, p1, p2, p3}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda7;-><init>(Lorg/rabochaya/projects/MapLayersActivity;Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Lorg/rabochaya/projects/MapCompositionPresets$Entry;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->prepared(Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private presets()V
    .locals 7

    .line 19
    invoke-direct {p0}, Lorg/rabochaya/projects/MapLayersActivity;->flushOpacity()V

    iget-boolean v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->disposed:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    if-nez v0, :cond_0

    goto/16 :goto_1

    :cond_0
    :try_start_0
    iget-wide v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->project:J

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/MapCompositionSettings;->loadPresets(Landroid/content/Context;J)Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const-string v3, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c \u043f\u043e\u043a\u0430\u0437\u0430\u043d\u043d\u044b\u0439 \u0441\u043e\u0441\u0442\u0430\u0432"

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v3, v0, Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;->presets:Lorg/rabochaya/projects/MapCompositionPresets;

    iget-object v3, v3, Lorg/rabochaya/projects/MapCompositionPresets;->entries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/MapCompositionPresets$Entry;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, v4, Lorg/rabochaya/projects/MapCompositionPresets$Entry;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " \u00b7 \u0441\u043b\u043e\u0451\u0432: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v4, v4, Lorg/rabochaya/projects/MapCompositionPresets$Entry;->composition:Lorg/rabochaya/projects/MapComposition;

    iget-object v4, v4, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    new-instance v3, Lorg/rabochaya/projects/MapLayersActivity$1;

    const v4, 0x1090011

    invoke-direct {v3, p0, p0, v4, v2}, Lorg/rabochaya/projects/MapLayersActivity$1;-><init>(Lorg/rabochaya/projects/MapLayersActivity;Landroid/content/Context;ILjava/util/List;)V

    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v4, "\u041d\u0430\u0431\u043e\u0440\u044b \u0441\u043b\u043e\u0451\u0432"

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    new-instance v4, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda0;

    invoke-direct {v4, p0, v0, v1}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/MapLayersActivity;Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/MapLayersActivity;->prepared(Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    iget-object v1, p0, Lorg/rabochaya/projects/MapLayersActivity;->status:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u041d\u0430\u0431\u043e\u0440\u044b \u043d\u0435 \u0438\u0437\u043c\u0435\u043d\u0435\u043d\u044b: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    :goto_1
    return-void
.end method

.method private reload(Ljava/lang/String;)V
    .locals 2

    .line 12
    :try_start_0
    iget-wide v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->project:J

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/MapCompositionSettings;->load(Landroid/content/Context;J)Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->show(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043f\u0440\u043e\u0447\u0438\u0442\u0430\u0442\u044c \u0441\u043e\u0441\u0442\u0430\u0432: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, ". \u0421\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u0435 \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438 \u043d\u0435 \u0438\u0437\u043c\u0435\u043d\u0435\u043d\u044b."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->show(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private remove(Lorg/rabochaya/projects/MapComposition$Layer;)V
    .locals 3

    .line 27
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u0423\u0431\u0440\u0430\u0442\u044c \u0441\u043b\u043e\u0439?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p1, Lorg/rabochaya/projects/MapComposition$Layer;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n\u0418\u0441\u0445\u043e\u0434\u043d\u0430\u044f \u043a\u0430\u0440\u0442\u0430, \u043a\u0435\u0448 \u0438 \u043e\u0431\u044a\u0435\u043a\u0442\u044b \u043e\u0441\u0442\u0430\u043d\u0443\u0442\u0441\u044f \u043d\u0430 \u0443\u0441\u0442\u0440\u043e\u0439\u0441\u0442\u0432\u0435."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda16;

    invoke-direct {v1, p0, p1}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda16;-><init>(Lorg/rabochaya/projects/MapLayersActivity;Lorg/rabochaya/projects/MapComposition$Layer;)V

    const-string p1, "\u0423\u0431\u0440\u0430\u0442\u044c"

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    new-instance v0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda17;

    invoke-direct {v0, p0, p1}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda17;-><init>(Lorg/rabochaya/projects/MapLayersActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private row(Lorg/rabochaya/projects/MapComposition$Layer;I)V
    .locals 9

    .line 24
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/4 v2, 0x6

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result v2

    const/16 v5, 0x8

    invoke-direct {p0, v5}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result v5

    invoke-virtual {v0, v3, v4, v2, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    invoke-static {}, Lorg/rabochaya/projects/WorkspaceUi;->panel()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v2, p1, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    const/4 v4, -0x1

    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    const/4 v3, 0x4

    invoke-direct {p0, v3}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v3}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result v3

    const/4 v6, 0x0

    invoke-virtual {v2, v6, v5, v6, v3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    iget-object v3, p0, Lorg/rabochaya/projects/MapLayersActivity;->list:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p1, Lorg/rabochaya/projects/MapComposition$Layer;->name:Ljava/lang/String;

    const/16 v3, 0x12

    invoke-direct {p0, v2, v3}, Lorg/rabochaya/projects/MapLayersActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v2, "local"

    iget-object v3, p1, Lorg/rabochaya/projects/MapComposition$Layer;->kind:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "MBTiles \u043f\u0440\u043e\u0435\u043a\u0442\u0430"

    goto :goto_0

    :cond_0
    const-string v2, "bundled"

    iget-object v3, p1, Lorg/rabochaya/projects/MapComposition$Layer;->kind:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "\u041e\u0431\u0437\u043e\u0440\u043d\u0430\u044f \u043a\u0430\u0440\u0442\u0430"

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lorg/rabochaya/projects/MapComposition$Layer;->source()Lorg/rabochaya/projects/TileSource;

    move-result-object v2

    if-nez v2, :cond_2

    const-string v2, "\u0418\u0441\u0442\u043e\u0447\u043d\u0438\u043a \u043a\u0430\u0442\u0430\u043b\u043e\u0433\u0430 \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u0435\u043d"

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Lorg/rabochaya/projects/MapComposition$Layer;->source()Lorg/rabochaya/projects/TileSource;

    move-result-object v2

    iget-object v2, v2, Lorg/rabochaya/projects/TileSource;->attribution:Ljava/lang/String;

    :goto_0
    const/16 v3, 0xc

    invoke-direct {p0, v2, v3}, Lorg/rabochaya/projects/MapLayersActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Landroid/widget/CheckBox;

    invoke-direct {v2, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    const-string v3, "\u041f\u043e\u043a\u0430\u0437\u044b\u0432\u0430\u0442\u044c \u0441\u043b\u043e\u0439"

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setTextColor(I)V

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setTypeface(Landroid/graphics/Typeface;)V

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/MapLayersActivity;->checkTint(Landroid/widget/CheckBox;)V

    iget-boolean v3, p1, Lorg/rabochaya/projects/MapComposition$Layer;->visible:Z

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v3, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda10;

    invoke-direct {v3, p0, p1}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda10;-><init>(Lorg/rabochaya/projects/MapLayersActivity;Lorg/rabochaya/projects/MapComposition$Layer;)V

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u041d\u0435\u043f\u0440\u043e\u0437\u0440\u0430\u0447\u043d\u043e\u0441\u0442\u044c: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v5, p1, Lorg/rabochaya/projects/MapComposition$Layer;->opacity:I

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, "%"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/16 v5, 0xe

    invoke-direct {p0, v2, v5}, Lorg/rabochaya/projects/MapLayersActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v5, Landroid/widget/SeekBar;

    invoke-direct {v5, p0}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;)V

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v7, p1, Lorg/rabochaya/projects/MapComposition$Layer;->name:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Landroid/widget/SeekBar;->setContentDescription(Ljava/lang/CharSequence;)V

    const/16 v3, 0x64

    invoke-virtual {v5, v3}, Landroid/widget/SeekBar;->setMax(I)V

    iget v3, p1, Lorg/rabochaya/projects/MapComposition$Layer;->opacity:I

    invoke-virtual {v5, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v7, 0x30

    invoke-direct {p0, v7}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result v8

    invoke-direct {v3, v4, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Lorg/rabochaya/projects/MapLayersActivity$4;

    invoke-direct {v3, p0, v2, p1}, Lorg/rabochaya/projects/MapLayersActivity$4;-><init>(Lorg/rabochaya/projects/MapLayersActivity;Landroid/widget/TextView;Lorg/rabochaya/projects/MapComposition$Layer;)V

    invoke-virtual {v5, v3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 25
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda11;

    invoke-direct {v0, p0, p1, p2}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda11;-><init>(Lorg/rabochaya/projects/MapLayersActivity;Lorg/rabochaya/projects/MapComposition$Layer;I)V

    const-string v3, "\u0412\u044b\u0448\u0435"

    invoke-direct {p0, v2, v3, v0}, Lorg/rabochaya/projects/MapLayersActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v0

    new-instance v3, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda12;

    invoke-direct {v3, p0, p1, p2}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda12;-><init>(Lorg/rabochaya/projects/MapLayersActivity;Lorg/rabochaya/projects/MapComposition$Layer;I)V

    const-string v4, "\u041d\u0438\u0436\u0435"

    invoke-direct {p0, v2, v4, v3}, Lorg/rabochaya/projects/MapLayersActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v3

    iget-object v4, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    iget-object v4, v4, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;

    iget-object v4, v4, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    sub-int/2addr v4, v1

    if-ge p2, v4, :cond_3

    move v4, v1

    goto :goto_1

    :cond_3
    move v4, v6

    :goto_1
    invoke-virtual {v0, v4}, Landroid/widget/Button;->setEnabled(Z)V

    if-lez p2, :cond_4

    goto :goto_2

    :cond_4
    move v1, v6

    :goto_2
    invoke-virtual {v3, v1}, Landroid/widget/Button;->setEnabled(Z)V

    new-instance p2, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda13;

    invoke-direct {p2, p0, p1}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda13;-><init>(Lorg/rabochaya/projects/MapLayersActivity;Lorg/rabochaya/projects/MapComposition$Layer;)V

    const-string p1, "\u0423\u0431\u0440\u0430\u0442\u044c"

    invoke-direct {p0, v2, p1, p2}, Lorg/rabochaya/projects/MapLayersActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move p1, v6

    :goto_3
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p2

    if-ge p1, p2, :cond_5

    invoke-virtual {v2, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v7}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result v1

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v0, v6, v1, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_3

    .line 26
    :cond_5
    return-void
.end method

.method private savePreset(Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;)V
    .locals 10

    .line 20
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v2, 0xc

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result v3

    const/16 v4, 0x8

    invoke-direct {p0, v4}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, v4}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result v4

    invoke-virtual {v0, v3, v5, v2, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v3, "\u0417\u0430\u043f\u043e\u043c\u0438\u043d\u0430\u044e\u0442\u0441\u044f \u043f\u043e\u043a\u0430\u0437\u0430\u043d\u043d\u044b\u0435 \u0441\u043b\u043e\u0438, \u043f\u043e\u0440\u044f\u0434\u043e\u043a, \u0432\u0438\u0434\u0438\u043c\u043e\u0441\u0442\u044c \u0438 \u043f\u0440\u043e\u0437\u0440\u0430\u0447\u043d\u043e\u0441\u0442\u044c. \u041a\u0430\u0440\u0442\u044b, \u043a\u0435\u0448 \u0438 \u043e\u0431\u044a\u0435\u043a\u0442\u044b \u043d\u0435 \u043a\u043e\u043f\u0438\u0440\u0443\u044e\u0442\u0441\u044f \u0438 \u043d\u0435 \u043c\u0435\u043d\u044f\u044e\u0442\u0441\u044f. \u0421\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u0438\u0435 \u043d\u0435 \u043f\u0440\u0438\u043c\u0435\u043d\u044f\u0435\u0442 \u043d\u0430\u0431\u043e\u0440; \u043f\u0440\u0438\u043c\u0435\u043d\u0435\u043d\u0438\u0435 \u043f\u043e\u0437\u0436\u0435 \u044f\u0432\u043d\u043e \u0432\u043a\u043b\u044e\u0447\u0438\u0442 \u043a\u043e\u043c\u043f\u043e\u0437\u0438\u0446\u0438\u044e. \u0414\u043e 16 \u043d\u0430\u0431\u043e\u0440\u043e\u0432 \u044d\u0442\u043e\u0433\u043e \u043f\u0440\u043e\u0435\u043a\u0442\u0430."

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Landroid/widget/EditText;

    invoke-direct {v2, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const-string v3, "\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435 \u043d\u0430\u0431\u043e\u0440\u0430"

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    const/high16 v3, 0x12000000

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setImeOptions(I)V

    new-array v1, v1, [Landroid/text/InputFilter;

    new-instance v3, Landroid/text/InputFilter$LengthFilter;

    const/16 v4, 0x50

    invoke-direct {v3, v4}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    const/4 v4, 0x0

    aput-object v3, v1, v4

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c \u043d\u0430\u0431\u043e\u0440 \u0441\u043b\u043e\u0451\u0432"

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c"

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/MapLayersActivity;->prepared(Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    new-instance v1, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda14;

    move-object v4, v1

    move-object v5, p0

    move-object v6, v0

    move-object v7, p1

    move-object v8, p2

    move-object v9, v2

    invoke-direct/range {v4 .. v9}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda14;-><init>(Lorg/rabochaya/projects/MapLayersActivity;Landroid/app/AlertDialog;Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Landroid/widget/EditText;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    invoke-virtual {v2}, Landroid/widget/EditText;->requestFocus()Z

    return-void
.end method

.method private show(Ljava/lang/String;)V
    .locals 9

    .line 13
    iget-boolean v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->disposed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->scroll:Landroid/widget/ScrollView;

    if-nez v0, :cond_1

    iget v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->restoreY:I

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v0

    :goto_0
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lorg/rabochaya/projects/MapLayersActivity;->root:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lorg/rabochaya/projects/MapLayersActivity;->root:Landroid/widget/LinearLayout;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v1, p0, Lorg/rabochaya/projects/MapLayersActivity;->root:Landroid/widget/LinearLayout;

    const/16 v3, 0x8

    invoke-direct {p0, v3}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result v4

    const/4 v5, 0x4

    invoke-direct {p0, v5}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result v6

    invoke-direct {p0, v3}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v5}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result v5

    invoke-virtual {v1, v4, v6, v3, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v1, p0, Lorg/rabochaya/projects/MapLayersActivity;->root:Landroid/widget/LinearLayout;

    const v3, -0xdcd2e3

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object v1, p0, Lorg/rabochaya/projects/MapLayersActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v1}, Lorg/rabochaya/projects/MapLayersActivity;->setContentView(Landroid/view/View;)V

    iget-object v1, p0, Lorg/rabochaya/projects/MapLayersActivity;->root:Landroid/widget/LinearLayout;

    const-string v3, "\u0421\u043b\u043e\u0438 \u043a\u0430\u0440\u0442\u044b"

    const/16 v4, 0x16

    invoke-direct {p0, v3, v4}, Lorg/rabochaya/projects/MapLayersActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/16 v1, 0xe

    invoke-direct {p0, p1, v1}, Lorg/rabochaya/projects/MapLayersActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity;->status:Landroid/widget/TextView;

    iget-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity;->status:Landroid/widget/TextView;

    const/4 v1, 0x3

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity;->root:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lorg/rabochaya/projects/MapLayersActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    const-string v1, "\u041a \u043a\u0430\u0440\u0442\u0435"

    if-nez p1, :cond_2

    iget-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity;->root:Landroid/widget/LinearLayout;

    new-instance v0, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda19;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda19;-><init>(Lorg/rabochaya/projects/MapLayersActivity;)V

    invoke-direct {p0, p1, v1, v0}, Lorg/rabochaya/projects/MapLayersActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    return-void

    .line 14
    :cond_2
    new-instance p1, Landroid/widget/ScrollView;

    invoke-direct {p1, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity;->scroll:Landroid/widget/ScrollView;

    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v3, p0, Lorg/rabochaya/projects/MapLayersActivity;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v3, p1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    iget-object v3, p0, Lorg/rabochaya/projects/MapLayersActivity;->root:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lorg/rabochaya/projects/MapLayersActivity;->scroll:Landroid/widget/ScrollView;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, -0x1

    const/4 v8, 0x0

    invoke-direct {v5, v7, v8, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v3, Landroid/widget/CheckBox;

    invoke-direct {v3, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    const-string v4, "\u0418\u0441\u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u044c \u043a\u043e\u043c\u043f\u043e\u0437\u0438\u0446\u0438\u044e \u0441\u043b\u043e\u0451\u0432"

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v3, v7}, Landroid/widget/CheckBox;->setTextColor(I)V

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setTypeface(Landroid/graphics/Typeface;)V

    invoke-direct {p0, v3}, Lorg/rabochaya/projects/MapLayersActivity;->checkTint(Landroid/widget/CheckBox;)V

    iget-object v4, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    iget-boolean v4, v4, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->enabled:Z

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v4, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda20;

    invoke-direct {v4, p0}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda20;-><init>(Lorg/rabochaya/projects/MapLayersActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 15
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u0414\u043e 16 \u0441\u043b\u043e\u0451\u0432. \u0412\u0435\u0440\u0445\u043d\u0438\u0439 \u0441\u043b\u043e\u0439 \u043f\u043e\u043a\u0430\u0437\u0430\u043d \u043f\u0435\u0440\u0432\u044b\u043c. \u0423\u0434\u0430\u043b\u0435\u043d\u0438\u0435 \u0441\u043b\u043e\u044f \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u0435\u0442 \u043a\u0430\u0440\u0442\u044b, \u043a\u0435\u0448 \u0438 \u043e\u0431\u044a\u0435\u043a\u0442\u044b. "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->network(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string v4, "\u041e\u043d\u043b\u0430\u0439\u043d \u0438 \u043a\u0435\u0448."

    goto :goto_1

    :cond_3
    const-string v4, "\u0422\u043e\u043b\u044c\u043a\u043e \u043a\u0435\u0448; \u0438\u043d\u0442\u0435\u0440\u043d\u0435\u0442 \u0432\u043a\u043b\u044e\u0447\u0430\u0435\u0442\u0441\u044f \u0432 \u043c\u0435\u043d\u044e \u043a\u0430\u0440\u0442\u044b."

    :goto_1
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0xc

    invoke-direct {p0, v3, v4}, Lorg/rabochaya/projects/MapLayersActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v3, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda21;

    invoke-direct {v3, p0}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda21;-><init>(Lorg/rabochaya/projects/MapLayersActivity;)V

    const-string v4, "\u0414\u043e\u0431\u0430\u0432\u0438\u0442\u044c \u0441\u043b\u043e\u0439"

    invoke-direct {p0, p1, v4, v3}, Lorg/rabochaya/projects/MapLayersActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v3

    iget-object v4, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    iget-object v4, v4, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;

    iget-object v4, v4, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    const/16 v5, 0x10

    if-ge v4, v5, :cond_4

    move v8, v2

    :cond_4
    invoke-virtual {v3, v8}, Landroid/widget/Button;->setEnabled(Z)V

    new-instance v3, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda22;

    invoke-direct {v3, p0}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda22;-><init>(Lorg/rabochaya/projects/MapLayersActivity;)V

    const-string v4, "\u041d\u0430\u0431\u043e\u0440\u044b \u0441\u043b\u043e\u0451\u0432"

    invoke-direct {p0, p1, v4, v3}, Lorg/rabochaya/projects/MapLayersActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    .line 16
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lorg/rabochaya/projects/MapLayersActivity;->list:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lorg/rabochaya/projects/MapLayersActivity;->list:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v3, p0, Lorg/rabochaya/projects/MapLayersActivity;->list:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    iget-object p1, p1, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;

    iget-object p1, p1, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity;->list:Landroid/widget/LinearLayout;

    const-string v3, "\u041f\u043e\u0434\u043b\u043e\u0436\u0435\u043a \u043d\u0435\u0442. \u041e\u0431\u044a\u0435\u043a\u0442\u044b \u043e\u0441\u0442\u0430\u044e\u0442\u0441\u044f \u043d\u0430 \u043a\u0430\u0440\u0442\u0435."

    invoke-direct {p0, v3, v5}, Lorg/rabochaya/projects/MapLayersActivity;->text(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_5
    iget-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    iget-object p1, p1, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;

    iget-object p1, p1, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    sub-int/2addr p1, v2

    :goto_2
    if-ltz p1, :cond_6

    iget-object v2, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    iget-object v2, v2, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;

    iget-object v2, v2, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/MapComposition$Layer;

    invoke-direct {p0, v2, p1}, Lorg/rabochaya/projects/MapLayersActivity;->row(Lorg/rabochaya/projects/MapComposition$Layer;I)V

    add-int/lit8 p1, p1, -0x1

    goto :goto_2

    :cond_6
    iget-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity;->root:Landroid/widget/LinearLayout;

    new-instance v2, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda23;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda23;-><init>(Lorg/rabochaya/projects/MapLayersActivity;)V

    invoke-direct {p0, p1, v1, v2}, Lorg/rabochaya/projects/MapLayersActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    iget-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity;->scroll:Landroid/widget/ScrollView;

    new-instance v1, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda24;

    invoke-direct {v1, p0, v0}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda24;-><init>(Lorg/rabochaya/projects/MapLayersActivity;I)V

    invoke-virtual {p1, v1}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 17
    return-void
.end method

.method private text(Ljava/lang/String;I)Landroid/widget/TextView;
    .locals 3

    .line 8
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    int-to-float p1, p2

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 p1, -0x1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const/16 p1, 0x8

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result p2

    const/4 v1, 0x6

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result p1

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/MapLayersActivity;->dp(I)I

    move-result v1

    invoke-virtual {v0, p2, v2, p1, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object v0
.end method


# virtual methods
.method synthetic lambda$addChoices$13$org-rabochaya-projects-MapLayersActivity()V
    .locals 4

    .line 23
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/rabochaya/projects/MapCatalogActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "project"

    iget-wide v2, p0, Lorg/rabochaya/projects/MapLayersActivity;->project:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "layer_pick"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0x11a9

    invoke-virtual {p0, v0, v1}, Lorg/rabochaya/projects/MapLayersActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method synthetic lambda$addChoices$14$org-rabochaya-projects-MapLayersActivity()V
    .locals 1

    .line 23
    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->source(Landroid/content/Context;)Lorg/rabochaya/projects/TileSource;

    move-result-object v0

    invoke-static {v0}, Lorg/rabochaya/projects/MapComposition$Layer;->custom(Lorg/rabochaya/projects/TileSource;)Lorg/rabochaya/projects/MapComposition$Layer;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/MapLayersActivity;->add(Lorg/rabochaya/projects/MapComposition$Layer;)V

    return-void
.end method

.method synthetic lambda$addChoices$15$org-rabochaya-projects-MapLayersActivity()V
    .locals 1

    .line 23
    invoke-static {}, Lorg/rabochaya/projects/MapComposition$Layer;->local()Lorg/rabochaya/projects/MapComposition$Layer;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/MapLayersActivity;->add(Lorg/rabochaya/projects/MapComposition$Layer;)V

    return-void
.end method

.method synthetic lambda$addChoices$16$org-rabochaya-projects-MapLayersActivity()V
    .locals 1

    .line 23
    invoke-static {}, Lorg/rabochaya/projects/MapComposition$Layer;->bundled()Lorg/rabochaya/projects/MapComposition$Layer;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/MapLayersActivity;->add(Lorg/rabochaya/projects/MapComposition$Layer;)V

    return-void
.end method

.method synthetic lambda$addChoices$18$org-rabochaya-projects-MapLayersActivity(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .locals 0

    .line 23
    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->font(Landroid/view/View;)V

    return-void
.end method

.method synthetic lambda$confirmPreset$12$org-rabochaya-projects-MapLayersActivity(ZLorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionPresets$Entry;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Landroid/content/DialogInterface;I)V
    .locals 6

    .line 22
    if-eqz p1, :cond_0

    :try_start_0
    iget-wide p4, p0, Lorg/rabochaya/projects/MapLayersActivity;->project:J

    iget-object p3, p3, Lorg/rabochaya/projects/MapCompositionPresets$Entry;->name:Ljava/lang/String;

    invoke-static {p0, p4, p5, p2, p3}, Lorg/rabochaya/projects/MapCompositionSettings;->deletePreset(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Ljava/lang/String;)Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

    goto :goto_0

    :cond_0
    iget-wide v1, p0, Lorg/rabochaya/projects/MapLayersActivity;->project:J

    iget-object v5, p3, Lorg/rabochaya/projects/MapCompositionPresets$Entry;->name:Ljava/lang/String;

    move-object v0, p0

    move-object v3, p4

    move-object v4, p2

    invoke-static/range {v0 .. v5}, Lorg/rabochaya/projects/MapCompositionSettings;->applyPreset(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionSettings$Snapshot;Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Ljava/lang/String;)Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    move-result-object p2

    iput-object p2, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    :goto_0
    if-eqz p1, :cond_1

    const-string p1, "\u041d\u0430\u0431\u043e\u0440 \u0443\u0434\u0430\u043b\u0451\u043d"

    goto :goto_1

    :cond_1
    const-string p1, "\u041d\u0430\u0431\u043e\u0440 \u043f\u0440\u0438\u043c\u0435\u043d\u0451\u043d"

    :goto_1
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->reload(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "\u041d\u0430\u0431\u043e\u0440\u044b \u043d\u0435 \u0438\u0437\u043c\u0435\u043d\u0435\u043d\u044b: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->reload(Ljava/lang/String;)V

    :goto_2
    return-void
.end method

.method synthetic lambda$prepared$7$org-rabochaya-projects-MapLayersActivity(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .locals 0

    .line 18
    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->font(Landroid/view/View;)V

    return-void
.end method

.method synthetic lambda$presetActions$11$org-rabochaya-projects-MapLayersActivity(Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Lorg/rabochaya/projects/MapCompositionPresets$Entry;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 21
    if-nez p5, :cond_0

    const/4 p4, 0x0

    goto :goto_0

    :cond_0
    const/4 p4, 0x1

    :goto_0
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/rabochaya/projects/MapLayersActivity;->confirmPreset(Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Lorg/rabochaya/projects/MapCompositionPresets$Entry;Z)V

    return-void
.end method

.method synthetic lambda$presets$8$org-rabochaya-projects-MapLayersActivity(Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 19
    if-nez p4, :cond_0

    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/MapLayersActivity;->savePreset(Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;)V

    goto :goto_0

    :cond_0
    iget-object p3, p1, Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;->presets:Lorg/rabochaya/projects/MapCompositionPresets;

    iget-object p3, p3, Lorg/rabochaya/projects/MapCompositionPresets;->entries:Ljava/util/List;

    add-int/lit8 p4, p4, -0x1

    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lorg/rabochaya/projects/MapCompositionPresets$Entry;

    invoke-direct {p0, p1, p2, p3}, Lorg/rabochaya/projects/MapLayersActivity;->presetActions(Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Lorg/rabochaya/projects/MapCompositionPresets$Entry;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$remove$23$org-rabochaya-projects-MapLayersActivity(Lorg/rabochaya/projects/MapComposition$Layer;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 27
    iget-object p2, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    iget-object p2, p2, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;

    iget-object p1, p1, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    invoke-virtual {p2, p1}, Lorg/rabochaya/projects/MapComposition;->remove(Ljava/lang/String;)Lorg/rabochaya/projects/MapComposition;

    move-result-object p1

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/MapLayersActivity;->apply(Lorg/rabochaya/projects/MapComposition;Z)V

    return-void
.end method

.method synthetic lambda$remove$24$org-rabochaya-projects-MapLayersActivity(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .locals 0

    .line 27
    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->font(Landroid/view/View;)V

    return-void
.end method

.method synthetic lambda$row$19$org-rabochaya-projects-MapLayersActivity(Lorg/rabochaya/projects/MapComposition$Layer;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 24
    iget-object p2, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    iget-object p2, p2, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;

    iget-object p1, p1, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    invoke-virtual {p2, p1, p3}, Lorg/rabochaya/projects/MapComposition;->visible(Ljava/lang/String;Z)Lorg/rabochaya/projects/MapComposition;

    move-result-object p1

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/MapLayersActivity;->apply(Lorg/rabochaya/projects/MapComposition;Z)V

    return-void
.end method

.method synthetic lambda$row$20$org-rabochaya-projects-MapLayersActivity(Lorg/rabochaya/projects/MapComposition$Layer;I)V
    .locals 2

    .line 25
    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    iget-object v0, v0, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;

    iget-object p1, p1, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    const/4 v1, 0x1

    add-int/2addr p2, v1

    invoke-virtual {v0, p1, p2}, Lorg/rabochaya/projects/MapComposition;->move(Ljava/lang/String;I)Lorg/rabochaya/projects/MapComposition;

    move-result-object p1

    invoke-direct {p0, p1, v1}, Lorg/rabochaya/projects/MapLayersActivity;->apply(Lorg/rabochaya/projects/MapComposition;Z)V

    return-void
.end method

.method synthetic lambda$row$21$org-rabochaya-projects-MapLayersActivity(Lorg/rabochaya/projects/MapComposition$Layer;I)V
    .locals 2

    .line 25
    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    iget-object v0, v0, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;

    iget-object p1, p1, Lorg/rabochaya/projects/MapComposition$Layer;->id:Ljava/lang/String;

    const/4 v1, 0x1

    sub-int/2addr p2, v1

    invoke-virtual {v0, p1, p2}, Lorg/rabochaya/projects/MapComposition;->move(Ljava/lang/String;I)Lorg/rabochaya/projects/MapComposition;

    move-result-object p1

    invoke-direct {p0, p1, v1}, Lorg/rabochaya/projects/MapLayersActivity;->apply(Lorg/rabochaya/projects/MapComposition;Z)V

    return-void
.end method

.method synthetic lambda$row$22$org-rabochaya-projects-MapLayersActivity(Lorg/rabochaya/projects/MapComposition$Layer;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->remove(Lorg/rabochaya/projects/MapComposition$Layer;)V

    return-void
.end method

.method synthetic lambda$savePreset$10$org-rabochaya-projects-MapLayersActivity(Landroid/app/AlertDialog;Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Landroid/widget/EditText;Landroid/content/DialogInterface;)V
    .locals 7

    .line 20
    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p5

    invoke-virtual {p5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p5

    invoke-direct {p0, p5}, Lorg/rabochaya/projects/MapLayersActivity;->font(Landroid/view/View;)V

    const/4 p5, -0x1

    invoke-virtual {p1, p5}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p5

    new-instance v6, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda8;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/MapLayersActivity$$ExternalSyntheticLambda8;-><init>(Lorg/rabochaya/projects/MapLayersActivity;Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Landroid/widget/EditText;Landroid/app/AlertDialog;)V

    invoke-virtual {p5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$savePreset$9$org-rabochaya-projects-MapLayersActivity(Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Landroid/widget/EditText;Landroid/app/AlertDialog;Landroid/view/View;)V
    .locals 6

    .line 20
    :try_start_0
    iget-wide v1, p0, Lorg/rabochaya/projects/MapLayersActivity;->project:J

    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    invoke-static/range {v0 .. v5}, Lorg/rabochaya/projects/MapCompositionSettings;->savePreset(Landroid/content/Context;JLorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;Ljava/lang/String;)Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;

    invoke-virtual {p4}, Landroid/app/AlertDialog;->dismiss()V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "\u041d\u0430\u0431\u043e\u0440 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->reload(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$show$1$org-rabochaya-projects-MapLayersActivity()V
    .locals 0

    .line 13
    invoke-virtual {p0}, Lorg/rabochaya/projects/MapLayersActivity;->finish()V

    return-void
.end method

.method synthetic lambda$show$2$org-rabochaya-projects-MapLayersActivity(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 14
    iget-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    iget-object p1, p1, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;

    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/MapLayersActivity;->apply(Lorg/rabochaya/projects/MapComposition;Z)V

    return-void
.end method

.method synthetic lambda$show$3$org-rabochaya-projects-MapLayersActivity()V
    .locals 0

    .line 15
    invoke-direct {p0}, Lorg/rabochaya/projects/MapLayersActivity;->addChoices()V

    return-void
.end method

.method synthetic lambda$show$4$org-rabochaya-projects-MapLayersActivity()V
    .locals 0

    .line 15
    invoke-direct {p0}, Lorg/rabochaya/projects/MapLayersActivity;->presets()V

    return-void
.end method

.method synthetic lambda$show$5$org-rabochaya-projects-MapLayersActivity()V
    .locals 0

    .line 16
    invoke-direct {p0}, Lorg/rabochaya/projects/MapLayersActivity;->flushOpacity()V

    invoke-virtual {p0}, Lorg/rabochaya/projects/MapLayersActivity;->finish()V

    return-void
.end method

.method synthetic lambda$show$6$org-rabochaya-projects-MapLayersActivity(I)V
    .locals 2

    .line 16
    iget-boolean v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->disposed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->scroll:Landroid/widget/ScrollView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Landroid/widget/ScrollView;->scrollTo(II)V

    :cond_0
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 31
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 v0, 0x11a9

    if-ne p1, v0, :cond_0

    const/4 p1, -0x1

    if-ne p2, p1, :cond_0

    if-eqz p3, :cond_0

    :try_start_0
    iget-object p1, p0, Lorg/rabochaya/projects/MapLayersActivity;->snapshot:Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    iget-object p1, p1, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;

    const-string p2, "catalog"

    invoke-virtual {p3, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lorg/rabochaya/projects/MapComposition$Layer;->catalog(Ljava/lang/String;)Lorg/rabochaya/projects/MapComposition$Layer;

    move-result-object p2

    invoke-virtual {p1, p2}, Lorg/rabochaya/projects/MapComposition;->add(Lorg/rabochaya/projects/MapComposition$Layer;)Lorg/rabochaya/projects/MapComposition;

    move-result-object p1

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/MapLayersActivity;->apply(Lorg/rabochaya/projects/MapComposition;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "\u0421\u043b\u043e\u0439 \u043d\u0435 \u0434\u043e\u0431\u0430\u0432\u043b\u0435\u043d: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->reload(Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 6
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/MapLayersActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "project"

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->project:J

    invoke-virtual {p0}, Lorg/rabochaya/projects/MapLayersActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const v1, -0xe3dae8

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/MapLayersActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    const/4 v0, 0x0

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "scroll"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    :goto_0
    iput v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->restoreY:I

    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->setResult(I)V

    iget-wide v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->project:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-gtz p1, :cond_1

    invoke-virtual {p0}, Lorg/rabochaya/projects/MapLayersActivity;->finish()V

    return-void

    :cond_1
    const-string p1, ""

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/MapLayersActivity;->reload(Ljava/lang/String;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 33
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->disposed:Z

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onPause()V
    .locals 0

    .line 33
    invoke-direct {p0}, Lorg/rabochaya/projects/MapLayersActivity;->flushOpacity()V

    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 32
    invoke-direct {p0}, Lorg/rabochaya/projects/MapLayersActivity;->flushOpacity()V

    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->scroll:Landroid/widget/ScrollView;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/MapLayersActivity;->scroll:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->getScrollY()I

    move-result v0

    :goto_0
    const-string v1, "scroll"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method
