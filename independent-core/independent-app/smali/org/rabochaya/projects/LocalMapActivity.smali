.class public final Lorg/rabochaya/projects/LocalMapActivity;
.super Landroid/app/Activity;
.source "LocalMapActivity.java"

# interfaces
.implements Lorg/rabochaya/projects/LocalMapView$Listener;


# static fields
.field private static final CATALOG:I = 0x1196

.field private static final DEM:I = 0x11fa

.field private static final IMPORT_MAP:I = 0x10cd

.field private static final IMPORT_TIFF:I = 0x10ce

.field private static final LAYERS:I = 0x1197


# instance fields
.field private busy:Z

.field private coordinates:Landroid/widget/TextView;

.field private creationPoint:[D

.field private dem:Lorg/rabochaya/projects/HgtRaster;

.field private disposed:Z

.field private drawingRow:Landroid/widget/LinearLayout;

.field private features:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/KmlProject$Feature;",
            ">;"
        }
    .end annotation
.end field

.field private lastError:J

.field private map:Lorg/rabochaya/projects/LocalMapView;

.field private pendingDrawPoints:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "[D>;"
        }
    .end annotation
.end field

.field private pendingDrawType:Ljava/lang/String;

.field private popup:Landroid/widget/PopupWindow;

.field private projectId:J

.field private refreshMapOnResume:Z

.field private refreshOnResume:Z

.field private root:Landroid/widget/LinearLayout;

.field private status:Landroid/widget/TextView;

.field private warning:Ljava/lang/String;

.field private final worker:Ljava/util/concurrent/ExecutorService;

.field private zoomButtons:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 4
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 6
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->worker:Ljava/util/concurrent/ExecutorService;

    const-string v0, ""

    iput-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->warning:Ljava/lang/String;

    return-void
.end method

.method private button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 4

    .line 10
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    const/4 p2, 0x0

    invoke-virtual {v0, p2}, Landroid/widget/Button;->setAllCaps(Z)V

    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const v2, -0xc8bcd7

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/high16 v2, 0x41000000    # 8.0f

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    const/high16 v3, 0x42480000    # 50.0f

    mul-float/2addr v2, v3

    float-to-int v2, v2

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v1, p2, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    const/4 p2, 0x2

    invoke-virtual {v1, p2, p2, p2, p2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda22;

    invoke-direct {p1, p0, p3}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda22;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private canLeave()Z
    .locals 1

    .line 38
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->drawingType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, "\u0417\u0430\u0432\u0435\u0440\u0448\u0438\u0442\u0435 \u0438\u043b\u0438 \u043e\u0442\u043c\u0435\u043d\u0438\u0442\u0435 \u0440\u0438\u0441\u0443\u043d\u043e\u043a"

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->error(Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method private chooseMap()V
    .locals 6

    .line 69
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->drawingType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, "\u0417\u0430\u0432\u0435\u0440\u0448\u0438\u0442\u0435 \u0438\u043b\u0438 \u043e\u0442\u043c\u0435\u043d\u0438\u0442\u0435 \u0440\u0438\u0441\u0443\u043d\u043e\u043a"

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->error(Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u041f\u043e\u0434\u043b\u043e\u0436\u043a\u0430 \u043a\u0430\u0440\u0442\u044b"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0423\u0431\u0440\u0430\u0442\u044c MBTiles"

    const-string v2, "\u0418\u043c\u043f\u043e\u0440\u0442 GeoTIFF"

    const-string v3, "\u041e\u043d\u043b\u0430\u0439\u043d-\u043a\u0430\u0440\u0442\u0430 \u0438 \u043a\u0435\u0448"

    const-string v4, "\u041e\u0442\u043a\u0440\u044b\u0442\u044c MBTiles"

    const-string v5, "\u041f\u043e\u043a\u0430\u0437\u0430\u0442\u044c \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u0439 MBTiles"

    filled-new-array {v3, v4, v5, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda64;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda64;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method public static cleanupDeletedProject(Landroid/content/Context;J)V
    .locals 4

    .line 94
    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/DemActivity;->cleanup(Landroid/content/Context;J)Z

    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings;->removeDeletedProject(Landroid/content/Context;J)V

    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/CompositionDownloadSettings;->removeDeletedProject(Landroid/content/Context;J)V

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "local_basemap_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".mbtiles"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Lorg/rabochaya/projects/LocalRasterStore;->remove(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_0

    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda4;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    invoke-static {p0}, Lorg/rabochaya/projects/OnlineMapSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "project_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "view_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "_"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-class p2, Lorg/rabochaya/projects/LocalMapActivity;

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p0, p2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "x"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p0, p2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, "y"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p0, p2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "z"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method private closeDem()V
    .locals 1

    .line 96
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->dem:Lorg/rabochaya/projects/HgtRaster;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->dem:Lorg/rabochaya/projects/HgtRaster;

    invoke-virtual {v0}, Lorg/rabochaya/projects/HgtRaster;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->dem:Lorg/rabochaya/projects/HgtRaster;

    :cond_0
    return-void
.end method

.method private compositionDownload()V
    .locals 5

    .line 70
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->canLeave()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->refreshMapOnResume:Z

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/rabochaya/projects/CompositionDownloadActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "project"

    iget-wide v2, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v1}, Lorg/rabochaya/projects/LocalMapView;->bounds()[D

    move-result-object v1

    const-string v2, "bounds"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[D)Landroid/content/Intent;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v2}, Lorg/rabochaya/projects/LocalMapView;->viewport()[D

    move-result-object v2

    const/4 v3, 0x2

    aget-wide v3, v2, v3

    const-string v2, "zoom"

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;D)Landroid/content/Intent;

    :cond_1
    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private compositionFont(Landroid/view/View;)V
    .locals 3

    .line 40
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

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/LocalMapActivity;->compositionFont(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private coordinateCaption(Ljava/lang/String;)Landroid/widget/TextView;
    .locals 1

    .line 47
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const p1, -0xdfdfe0

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    return-object v0
.end method

.method private coordinateForm()Landroid/widget/LinearLayout;
    .locals 2

    .line 52
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v1, 0x41800000    # 16.0f

    invoke-static {p0, v1}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v1

    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    return-object v0
.end method

.method private coordinateOptions()V
    .locals 7

    .line 55
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->coordinateForm()Landroid/widget/LinearLayout;

    move-result-object v0

    const-string v1, "\u041e\u0441\u043d\u043e\u0432\u043d\u043e\u0439 \u0444\u043e\u0440\u043c\u0430\u0442"

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/LocalMapActivity;->coordinateCaption(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p0}, Lorg/rabochaya/projects/CoordinateSettings;->primary(Landroid/content/Context;)I

    move-result v1

    const-string v2, "\u041e\u0441\u043d\u043e\u0432\u043d\u043e\u0439 \u0444\u043e\u0440\u043c\u0430\u0442 \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442"

    invoke-direct {p0, v0, v1, v2}, Lorg/rabochaya/projects/LocalMapActivity;->coordinateSpinner(Landroid/widget/LinearLayout;ILjava/lang/String;)Landroid/widget/Spinner;

    move-result-object v1

    const-string v2, "\u0414\u043e\u043f\u043e\u043b\u043d\u0438\u0442\u0435\u043b\u044c\u043d\u044b\u0439 \u0444\u043e\u0440\u043c\u0430\u0442"

    invoke-direct {p0, v2}, Lorg/rabochaya/projects/LocalMapActivity;->coordinateCaption(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p0}, Lorg/rabochaya/projects/CoordinateSettings;->secondary(Landroid/content/Context;)I

    move-result v2

    const-string v3, "\u0414\u043e\u043f\u043e\u043b\u043d\u0438\u0442\u0435\u043b\u044c\u043d\u044b\u0439 \u0444\u043e\u0440\u043c\u0430\u0442 \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442"

    invoke-direct {p0, v0, v2, v3}, Lorg/rabochaya/projects/LocalMapActivity;->coordinateSpinner(Landroid/widget/LinearLayout;ILjava/lang/String;)Landroid/widget/Spinner;

    move-result-object v2

    new-instance v3, Landroid/widget/CheckBox;

    invoke-direct {v3, p0}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    const-string v4, "\u041f\u043e\u043a\u0430\u0437\u044b\u0432\u0430\u0442\u044c \u0434\u043e\u043f\u043e\u043b\u043d\u0438\u0442\u0435\u043b\u044c\u043d\u044b\u0435 \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b"

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    const v4, -0xdfdfe0

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setTextColor(I)V

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setTypeface(Landroid/graphics/Typeface;)V

    invoke-static {p0}, Lorg/rabochaya/projects/CoordinateSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "show_secondary"

    const/4 v6, 0x1

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 56
    new-instance v4, Landroid/widget/ScrollView;

    invoke-direct {v4, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v5, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b \u0446\u0435\u043d\u0442\u0440\u0430 \u043a\u0430\u0440\u0442\u044b"

    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v4, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda28;

    invoke-direct {v4, p0, v1, v2, v3}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda28;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/CheckBox;)V

    const-string v5, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c"

    invoke-virtual {v0, v5, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v4, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v4, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda29;

    invoke-direct {v4, p0, v1, v3, v2}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda29;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/widget/Spinner;Landroid/widget/CheckBox;Landroid/widget/Spinner;)V

    const-string v1, "\u041a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u0442\u044c"

    invoke-virtual {v0, v1, v4}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 57
    return-void
.end method

.method private coordinateSpinner(Landroid/widget/LinearLayout;ILjava/lang/String;)Landroid/widget/Spinner;
    .locals 3

    .line 49
    new-instance v0, Landroid/widget/Spinner;

    invoke-direct {v0, p0}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p3}, Landroid/widget/Spinner;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 50
    new-instance p3, Landroid/widget/ArrayAdapter;

    const v1, 0x1090008

    invoke-static {}, Lorg/rabochaya/projects/Coordinates;->names()[Ljava/lang/String;

    move-result-object v2

    invoke-direct {p3, p0, v1, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    const v1, 0x1090009

    invoke-virtual {p3, v1}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    invoke-virtual {v0, p3}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    invoke-virtual {v0, p2}, Landroid/widget/Spinner;->setSelection(I)V

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p3, -0x1

    const/4 v1, -0x2

    invoke-direct {p2, p3, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private discardDrawing(Z)V
    .locals 2

    .line 103
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0438\u0442\u044c \u043d\u0435\u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u0439 \u0440\u0438\u0441\u0443\u043d\u043e\u043a?"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda58;

    invoke-direct {v1, p0, p1}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda58;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Z)V

    const-string p1, "\u041e\u0442\u043c\u0435\u043d\u0438\u0442\u044c \u0440\u0438\u0441\u0443\u043d\u043e\u043a"

    invoke-virtual {v0, p1, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string v0, "\u041f\u0440\u043e\u0434\u043e\u043b\u0436\u0438\u0442\u044c \u0440\u0438\u0441\u043e\u0432\u0430\u043d\u0438\u0435"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private display()V
    .locals 4

    .line 45
    const/4 v0, 0x2

    new-array v0, v0, [Z

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->coordinates:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getVisibility()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    aput-boolean v1, v0, v3

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->zoomButtons:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v1

    if-nez v1, :cond_1

    move v3, v2

    :cond_1
    aput-boolean v3, v0, v2

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "\u041e\u0442\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b \u0446\u0435\u043d\u0442\u0440\u0430"

    const-string v3, "\u041a\u043d\u043e\u043f\u043a\u0438 \u043c\u0430\u0441\u0448\u0442\u0430\u0431\u0430"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda68;

    invoke-direct {v3, p0, v0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda68;-><init>(Lorg/rabochaya/projects/LocalMapActivity;[Z)V

    invoke-virtual {v1, v2, v0, v3}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda69;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda69;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v2, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private drawingCoordinates()Ljava/lang/String;
    .locals 7

    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v1}, Lorg/rabochaya/projects/LocalMapView;->drawingPoints()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [D

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_0

    const/16 v3, 0xa

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_0
    const/4 v3, 0x1

    aget-wide v3, v2, v3

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x20

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v5, 0x0

    aget-wide v5, v2, v5

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x2

    aget-wide v4, v2, v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private editObject(Lorg/rabochaya/projects/KmlProject$Feature;Ljava/lang/String;)V
    .locals 19

    .line 112
    move-object/from16 v8, p0

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    iget-boolean v0, v8, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    if-nez v0, :cond_d

    iget-object v0, v8, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-nez v0, :cond_0

    goto/16 :goto_7

    .line 113
    :cond_0
    const-string v0, "Point"

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v6, :cond_1

    iget-object v3, v6, Lorg/rabochaya/projects/KmlProject$Feature;->shapes:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ne v3, v1, :cond_1

    iget-object v3, v6, Lorg/rabochaya/projects/KmlProject$Feature;->shapes:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/rabochaya/projects/KmlProject$Geometry;

    iget-object v3, v3, Lorg/rabochaya/projects/KmlProject$Geometry;->type:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, v6, Lorg/rabochaya/projects/KmlProject$Feature;->element:Lorg/w3c/dom/Element;

    invoke-static {v3, v0}, Lorg/rabochaya/projects/KmlProject;->child(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v3

    if-eqz v3, :cond_1

    move v3, v1

    goto :goto_0

    :cond_1
    move v3, v2

    .line 114
    :goto_0
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v5, 0x12

    const/16 v9, 0xc

    invoke-virtual {v4, v5, v9, v5, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const v5, -0xc0a10

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 115
    const-string v5, ""

    if-nez v6, :cond_2

    move-object v9, v5

    goto :goto_1

    :cond_2
    iget-object v9, v6, Lorg/rabochaya/projects/KmlProject$Feature;->name:Ljava/lang/String;

    :goto_1
    const-string v10, "\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435"

    invoke-direct {v8, v4, v10, v9, v2}, Lorg/rabochaya/projects/LocalMapActivity;->field(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/EditText;

    move-result-object v9

    .line 116
    if-nez v6, :cond_3

    move-object v10, v5

    goto :goto_2

    :cond_3
    iget-object v10, v6, Lorg/rabochaya/projects/KmlProject$Feature;->element:Lorg/w3c/dom/Element;

    invoke-static {v10}, Lorg/rabochaya/projects/MediaLinks;->note(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v10

    :goto_2
    const-string v11, "\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435"

    invoke-direct {v8, v4, v11, v10, v1}, Lorg/rabochaya/projects/LocalMapActivity;->field(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/EditText;

    move-result-object v10

    .line 117
    nop

    .line 118
    const-string v11, "%.8f %.8f"

    const/4 v12, 0x2

    if-eqz v3, :cond_4

    iget-object v5, v6, Lorg/rabochaya/projects/KmlProject$Feature;->shapes:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/rabochaya/projects/KmlProject$Geometry;

    iget-object v5, v5, Lorg/rabochaya/projects/KmlProject$Geometry;->rings:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [D

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    aget-wide v14, v5, v1

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object v15, v9

    move-object/from16 v16, v10

    aget-wide v9, v5, v2

    invoke-virtual {v13, v9, v10}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-wide v13, v5, v12

    invoke-virtual {v9, v13, v14}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_3

    .line 119
    :cond_4
    move-object v15, v9

    move-object/from16 v16, v10

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    iget-object v5, v8, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v5}, Lorg/rabochaya/projects/LocalMapView;->viewport()[D

    move-result-object v5

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    aget-wide v13, v5, v1

    invoke-static {v13, v14}, Lorg/rabochaya/projects/MapMath;->lat(D)D

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v10

    aget-wide v13, v5, v2

    invoke-static {v13, v14}, Lorg/rabochaya/projects/MapMath;->lon(D)D

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    new-array v13, v12, [Ljava/lang/Object;

    aput-object v10, v13, v2

    aput-object v5, v13, v1

    invoke-static {v9, v11, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 120
    :cond_5
    :goto_3
    const/4 v9, 0x0

    if-nez v6, :cond_6

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    iget-object v10, v8, Lorg/rabochaya/projects/LocalMapActivity;->creationPoint:[D

    if-eqz v10, :cond_6

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-object v10, v8, Lorg/rabochaya/projects/LocalMapActivity;->creationPoint:[D

    aget-wide v13, v10, v1

    invoke-static {v13, v14}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v10

    iget-object v13, v8, Lorg/rabochaya/projects/LocalMapActivity;->creationPoint:[D

    aget-wide v17, v13, v2

    invoke-static/range {v17 .. v18}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v13

    new-array v14, v12, [Ljava/lang/Object;

    aput-object v10, v14, v2

    aput-object v13, v14, v1

    invoke-static {v5, v11, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    iput-object v9, v8, Lorg/rabochaya/projects/LocalMapActivity;->creationPoint:[D

    .line 121
    :cond_6
    if-nez v6, :cond_7

    iget-object v2, v8, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v2}, Lorg/rabochaya/projects/LocalMapView;->drawingType()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_7

    iget-object v2, v8, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v2}, Lorg/rabochaya/projects/LocalMapView;->drawingType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapActivity;->drawingCoordinates()Ljava/lang/String;

    move-result-object v5

    .line 122
    :cond_7
    if-nez v3, :cond_9

    if-nez v6, :cond_8

    goto :goto_4

    :cond_8
    move-object v5, v9

    goto :goto_5

    :cond_9
    :goto_4
    const-string v2, "WGS 84: \u0448\u0438\u0440\u043e\u0442\u0430 \u0434\u043e\u043b\u0433\u043e\u0442\u0430 [\u0432\u044b\u0441\u043e\u0442\u0430], \u043e\u0434\u043d\u0430 \u0432\u0435\u0440\u0448\u0438\u043d\u0430 \u0432 \u0441\u0442\u0440\u043e\u043a\u0435"

    invoke-direct {v8, v4, v2, v5, v1}, Lorg/rabochaya/projects/LocalMapActivity;->field(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/EditText;

    move-result-object v1

    move-object v5, v1

    .line 123
    :goto_5
    if-eqz v5, :cond_b

    if-nez v6, :cond_a

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    const/4 v12, 0x4

    :cond_a
    invoke-virtual {v5, v12}, Landroid/widget/EditText;->setMinLines(I)V

    .line 124
    :cond_b
    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, v8}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v4}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 125
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v8}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    if-nez v6, :cond_c

    const-string v2, "\u041d\u043e\u0432\u044b\u0439 \u043e\u0431\u044a\u0435\u043a\u0442"

    goto :goto_6

    :cond_c
    const-string v2, "\u0418\u0437\u043c\u0435\u043d\u0438\u0442\u044c \u043e\u0431\u044a\u0435\u043a\u0442"

    :goto_6
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u0421\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c"

    invoke-virtual {v0, v1, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-virtual {v0, v1, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v9

    .line 126
    new-instance v10, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda31;

    move-object v0, v10

    move-object/from16 v1, p0

    move-object v2, v9

    move-object v3, v15

    move-object/from16 v4, v16

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    invoke-direct/range {v0 .. v7}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda31;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Lorg/rabochaya/projects/KmlProject$Feature;Ljava/lang/String;)V

    invoke-virtual {v9, v10}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 143
    invoke-virtual {v9}, Landroid/app/AlertDialog;->show()V

    .line 144
    return-void

    .line 112
    :cond_d
    :goto_7
    return-void
.end method

.method private field(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Z)Landroid/widget/EditText;
    .locals 1

    .line 108
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const p2, -0xdfdfe0

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 109
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p2}, Landroid/widget/EditText;->setTextColor(I)V

    const p2, -0x9f9fa0

    invoke-virtual {v0, p2}, Landroid/widget/EditText;->setHintTextColor(I)V

    const/4 p2, -0x1

    invoke-virtual {v0, p2}, Landroid/widget/EditText;->setBackgroundColor(I)V

    xor-int/lit8 p3, p4, 0x1

    invoke-virtual {v0, p3}, Landroid/widget/EditText;->setSingleLine(Z)V

    if-eqz p4, :cond_0

    const/high16 p3, 0x20000

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    or-int/lit8 p3, p3, 0x1

    invoke-virtual {v0, p3}, Landroid/widget/EditText;->setInputType(I)V

    new-instance p3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p4, -0x2

    invoke-direct {p3, p2, p4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private goToCoordinates()V
    .locals 6

    .line 59
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->canLeave()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->coordinateForm()Landroid/widget/LinearLayout;

    move-result-object v0

    const-string v1, "\u0424\u043e\u0440\u043c\u0430\u0442 \u0432\u0432\u043e\u0434\u0430"

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/LocalMapActivity;->coordinateCaption(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static {p0}, Lorg/rabochaya/projects/CoordinateSettings;->primary(Landroid/content/Context;)I

    move-result v1

    const-string v2, "\u0424\u043e\u0440\u043c\u0430\u0442 \u0432\u0432\u043e\u0434\u0430 \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442"

    invoke-direct {p0, v0, v1, v2}, Lorg/rabochaya/projects/LocalMapActivity;->coordinateSpinner(Landroid/widget/LinearLayout;ILjava/lang/String;)Landroid/widget/Spinner;

    move-result-object v1

    new-instance v2, Landroid/widget/EditText;

    invoke-direct {v2, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const v3, -0xdfdfe0

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setTextColor(I)V

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setBackgroundColor(I)V

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    const v4, 0x20001

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setInputType(I)V

    const/4 v4, 0x2

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setMinLines(I)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    invoke-direct {v4, v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string v3, ""

    invoke-direct {p0, v3}, Lorg/rabochaya/projects/LocalMapActivity;->coordinateCaption(Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 60
    new-instance v4, Lorg/rabochaya/projects/LocalMapActivity$1;

    invoke-direct {v4, p0, v2, v3}, Lorg/rabochaya/projects/LocalMapActivity$1;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/widget/EditText;Landroid/widget/TextView;)V

    invoke-virtual {v1, v4}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 61
    new-instance v3, Landroid/widget/ScrollView;

    invoke-direct {v3, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v0}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v4, "\u041f\u0435\u0440\u0435\u0439\u0442\u0438 \u043a \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u0430\u043c"

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v3, "\u041f\u0435\u0440\u0435\u0439\u0442\u0438"

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v3, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    new-instance v3, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda57;

    invoke-direct {v3, p0, v0, v2, v1}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda57;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/Spinner;)V

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 62
    return-void
.end method

.method private importMap(Landroid/net/Uri;)V
    .locals 1

    .line 75
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/rabochaya/projects/LocalMapActivity;->importMap(Landroid/net/Uri;Z)V

    return-void
.end method

.method private importMap(Landroid/net/Uri;Z)V
    .locals 3

    .line 77
    const-string v0, "content"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "\u0412\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 \u0444\u0430\u0439\u043b"

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->error(Ljava/lang/String;)V

    return-void

    .line 78
    :cond_0
    :try_start_0
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->mapFile()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lorg/rabochaya/projects/LocalRasterStore;->stamp(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->status:Landroid/widget/TextView;

    if-eqz p2, :cond_1

    const-string v2, "\u041f\u0440\u0435\u043e\u0431\u0440\u0430\u0437\u043e\u0432\u0430\u043d\u0438\u0435 GeoTIFF\u2026"

    goto :goto_0

    :cond_1
    const-string v2, "\u041a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u0435 \u0438 \u043f\u0440\u043e\u0432\u0435\u0440\u043a\u0430 MBTiles\u2026"

    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda70;

    invoke-direct {v2, p0, p1, p2, v0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda70;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/net/Uri;ZLjava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 93
    return-void

    .line 78
    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->error(Ljava/lang/String;)V

    return-void
.end method

.method private item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;
    .locals 1

    .line 36
    new-instance v0, Lorg/rabochaya/projects/WorkspaceUi$Item;

    invoke-direct {v0, p1, p2}, Lorg/rabochaya/projects/WorkspaceUi$Item;-><init>(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-object v0
.end method

.method private label(Ljava/lang/String;I)Landroid/widget/TextView;
    .locals 1

    .line 9
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    const/4 p1, -0x1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    int-to-float p1, p2

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 p1, 0xe

    const/16 p2, 0xa

    invoke-virtual {v0, p1, p2, p1, p2}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object v0
.end method

.method static synthetic lambda$cleanupDeletedProject$61(Landroid/content/Context;)V
    .locals 2

    .line 94
    const-string v0, "\u041f\u0440\u043e\u0435\u043a\u0442 \u0443\u0434\u0430\u043b\u0451\u043d, \u043d\u043e \u043f\u0440\u0438\u0432\u0430\u0442\u043d\u0443\u044e \u043a\u043e\u043f\u0438\u044e \u043a\u0430\u0440\u0442\u044b \u0443\u0434\u0430\u043b\u0438\u0442\u044c \u043d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private load()V
    .locals 2

    .line 13
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    const-string v0, "\u041e\u0442\u043a\u0440\u044b\u0442\u0438\u0435 \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u043e\u0439 \u043a\u0430\u0440\u0442\u044b\u2026"

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->message(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda60;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda60;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private mainMenu()V
    .locals 6

    .line 39
    new-instance v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda12;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda12;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v1, "\u041f\u0440\u043e\u0435\u043a\u0442\u044b \u0438 \u0444\u0430\u0439\u043b\u044b KML/KMZ"

    invoke-direct {p0, v1, v0}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda13;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda13;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v2, "\u041d\u043e\u0432\u044b\u0439 \u043f\u0440\u043e\u0435\u043a\u0442"

    invoke-direct {p0, v2, v1}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda14;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda14;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v3, "\u041e\u0442\u043e\u0431\u0440\u0430\u0436\u0435\u043d\u0438\u0435"

    invoke-direct {p0, v3, v2}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v2

    new-instance v3, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda15;

    invoke-direct {v3, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda15;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v4, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c \u043a\u0430\u0440\u0442\u0443"

    invoke-direct {p0, v4, v3}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v3

    const/4 v4, 0x4

    new-array v4, v4, [Lorg/rabochaya/projects/WorkspaceUi$Item;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    aput-object v3, v4, v0

    const-string v0, "\u041c\u0435\u043d\u044e"

    invoke-direct {p0, v0, v4}, Lorg/rabochaya/projects/LocalMapActivity;->menu(Ljava/lang/String;[Lorg/rabochaya/projects/WorkspaceUi$Item;)V

    return-void
.end method

.method private manager(Z)V
    .locals 4

    .line 44
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->canLeave()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->refreshOnResume:Z

    if-nez p1, :cond_1

    iget-wide v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/ObjectManagerActivity;->open(Landroid/app/Activity;J)V

    return-void

    :cond_1
    const/4 v0, 0x0

    const-string v1, "org.rabochaya.projects.ProjectsActivity"

    invoke-virtual {p0, v1, v0}, Lorg/rabochaya/projects/LocalMapActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    if-eqz p1, :cond_2

    const-wide/16 v2, -0x1

    goto :goto_0

    :cond_2
    iget-wide v2, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    :goto_0
    const-string p1, "project"

    invoke-interface {v0, p1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "folder"

    const-string v2, ""

    invoke-interface {p1, v0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p1, p0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private mapFile()Ljava/io/File;
    .locals 5

    .line 11
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "local_basemap_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".mbtiles"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private mapsMenu()V
    .locals 8

    .line 41
    new-instance v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda38;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda38;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v1, "\u0421\u043b\u043e\u0438 \u043a\u0430\u0440\u0442\u044b"

    invoke-direct {p0, v1, v0}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda39;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda39;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v2, "\u041e\u043d\u043b\u0430\u0439\u043d-\u043a\u0430\u0440\u0442\u044b"

    invoke-direct {p0, v2, v1}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda40;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda40;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v3, "\u041f\u043e\u0434\u043b\u043e\u0436\u043a\u0430"

    invoke-direct {p0, v3, v2}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v2

    new-instance v3, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda41;

    invoke-direct {v3, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda41;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v4, "\u041a\u0435\u0448 / \u043e\u043d\u043b\u0430\u0439\u043d"

    invoke-direct {p0, v4, v3}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v3

    new-instance v4, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda42;

    invoke-direct {v4, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda42;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v5, "\u0421\u043a\u0430\u0447\u0430\u0442\u044c \u043e\u0431\u043b\u0430\u0441\u0442\u044c \u0441\u043b\u043e\u0451\u0432"

    invoke-direct {p0, v5, v4}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v4

    new-instance v5, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda43;

    invoke-direct {v5, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda43;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v6, "\u042d\u043a\u0441\u043f\u043e\u0440\u0442 \u043a\u0435\u0448\u0430 MBTiles"

    invoke-direct {p0, v6, v5}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v5

    const/4 v6, 0x6

    new-array v6, v6, [Lorg/rabochaya/projects/WorkspaceUi$Item;

    const/4 v7, 0x0

    aput-object v0, v6, v7

    const/4 v0, 0x1

    aput-object v1, v6, v0

    const/4 v0, 0x2

    aput-object v2, v6, v0

    const/4 v0, 0x3

    aput-object v3, v6, v0

    const/4 v0, 0x4

    aput-object v4, v6, v0

    const/4 v0, 0x5

    aput-object v5, v6, v0

    const-string v0, "\u041a\u0430\u0440\u0442\u044b"

    invoke-direct {p0, v0, v6}, Lorg/rabochaya/projects/LocalMapActivity;->menu(Ljava/lang/String;[Lorg/rabochaya/projects/WorkspaceUi$Item;)V

    return-void
.end method

.method private marksMenu()V
    .locals 5

    .line 42
    new-instance v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda34;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda34;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v1, "\u0421\u043e\u0437\u0434\u0430\u0442\u044c"

    invoke-direct {p0, v1, v0}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda35;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda35;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v2, "\u0421\u043f\u0438\u0441\u043e\u043a \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432"

    invoke-direct {p0, v2, v1}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda36;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda36;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v3, "\u0412\u0441\u0435 \u043e\u0431\u044a\u0435\u043a\u0442\u044b"

    invoke-direct {p0, v3, v2}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v2

    const/4 v3, 0x3

    new-array v3, v3, [Lorg/rabochaya/projects/WorkspaceUi$Item;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    const-string v0, "\u041c\u0435\u0442\u043a\u0438"

    invoke-direct {p0, v0, v3}, Lorg/rabochaya/projects/LocalMapActivity;->menu(Ljava/lang/String;[Lorg/rabochaya/projects/WorkspaceUi$Item;)V

    return-void
.end method

.method private varargs menu(Ljava/lang/String;[Lorg/rabochaya/projects/WorkspaceUi$Item;)V
    .locals 1

    .line 37
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->popup:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->popup:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->root:Landroid/widget/LinearLayout;

    invoke-static {p0, v0, p1, p2}, Lorg/rabochaya/projects/WorkspaceUi;->menu(Landroid/app/Activity;Landroid/view/View;Ljava/lang/String;[Lorg/rabochaya/projects/WorkspaceUi$Item;)Landroid/widget/PopupWindow;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->popup:Landroid/widget/PopupWindow;

    return-void
.end method

.method private message(Ljava/lang/String;)V
    .locals 2

    .line 12
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->root:Landroid/widget/LinearLayout;

    const/16 v1, 0x11

    invoke-direct {p0, p1, v1}, Lorg/rabochaya/projects/LocalMapActivity;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-void
.end method

.method private newObject()V
    .locals 6

    .line 99
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->drawingType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, "\u0417\u0430\u0432\u0435\u0440\u0448\u0438\u0442\u0435 \u0438\u043b\u0438 \u043e\u0442\u043c\u0435\u043d\u0438\u0442\u0435 \u0440\u0438\u0441\u0443\u043d\u043e\u043a"

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->error(Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "\u0421\u043e\u0437\u0434\u0430\u0442\u044c \u043e\u0431\u044a\u0435\u043a\u0442"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041d\u0430\u0440\u0438\u0441\u043e\u0432\u0430\u0442\u044c \u043c\u0430\u0440\u0448\u0440\u0443\u0442"

    const-string v2, "\u041d\u0430\u0440\u0438\u0441\u043e\u0432\u0430\u0442\u044c \u043e\u0431\u043b\u0430\u0441\u0442\u044c"

    const-string v3, "\u041c\u0435\u0442\u043a\u0430"

    const-string v4, "\u041c\u0430\u0440\u0448\u0440\u0443\u0442"

    const-string v5, "\u041e\u0431\u043b\u0430\u0441\u0442\u044c"

    filled-new-array {v3, v4, v5, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda23;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda23;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private newProject()V
    .locals 4

    .line 46
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->canLeave()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const v1, -0xdfdfe0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTextColor(I)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackgroundColor(I)V

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "\u041d\u043e\u0432\u044b\u0439 \u043f\u0440\u043e\u0435\u043a\u0442"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u0421\u043e\u0437\u0434\u0430\u0442\u044c"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda59;

    invoke-direct {v2, p0, v1, v0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda59;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/app/AlertDialog;Landroid/widget/EditText;)V

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private onlineSettings()V
    .locals 5

    .line 71
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->drawingType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, "\u0417\u0430\u0432\u0435\u0440\u0448\u0438\u0442\u0435 \u0438\u043b\u0438 \u043e\u0442\u043c\u0435\u043d\u0438\u0442\u0435 \u0440\u0438\u0441\u0443\u043d\u043e\u043a"

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->error(Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->refreshMapOnResume:Z

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/rabochaya/projects/OnlineMapActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "project"

    iget-wide v2, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v1}, Lorg/rabochaya/projects/LocalMapView;->bounds()[D

    move-result-object v1

    const-string v2, "bounds"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[D)Landroid/content/Intent;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v2}, Lorg/rabochaya/projects/LocalMapView;->viewport()[D

    move-result-object v2

    const/4 v3, 0x2

    aget-wide v3, v2, v3

    const-string v2, "zoom"

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;D)Landroid/content/Intent;

    :cond_1
    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static open(Landroid/app/Activity;J)V
    .locals 2

    .line 7
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/rabochaya/projects/LocalMapActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "project"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private orientationMenu()V
    .locals 6

    .line 43
    new-instance v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda8;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda8;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v1, "\u041a\u043e\u043c\u043f\u0430\u0441"

    invoke-direct {p0, v1, v0}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v0

    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda9;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda9;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v2, "\u041f\u0435\u0440\u0435\u0439\u0442\u0438 \u043a \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u0430\u043c"

    invoke-direct {p0, v2, v1}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda10;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda10;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v3, "\u0424\u043e\u0440\u043c\u0430\u0442\u044b \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442"

    invoke-direct {p0, v3, v2}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v2

    new-instance v3, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda11;

    invoke-direct {v3, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda11;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v4, "DEM / \u0432\u044b\u0441\u043e\u0442\u0430 \u0446\u0435\u043d\u0442\u0440\u0430"

    invoke-direct {p0, v4, v3}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v3

    const/4 v4, 0x4

    new-array v4, v4, [Lorg/rabochaya/projects/WorkspaceUi$Item;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    aput-object v3, v4, v0

    const-string v0, "\u041e\u0440\u0438\u0435\u043d\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u0435"

    invoke-direct {p0, v0, v4}, Lorg/rabochaya/projects/LocalMapActivity;->menu(Ljava/lang/String;[Lorg/rabochaya/projects/WorkspaceUi$Item;)V

    return-void
.end method

.method private pick()V
    .locals 3

    .line 72
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->drawingType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, "\u0417\u0430\u0432\u0435\u0440\u0448\u0438\u0442\u0435 \u0438\u043b\u0438 \u043e\u0442\u043c\u0435\u043d\u0438\u0442\u0435 \u0440\u0438\u0441\u0443\u043d\u043e\u043a"

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->error(Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "*/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.LOCAL_ONLY"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/16 v1, 0x10cd

    invoke-virtual {p0, v0, v1}, Lorg/rabochaya/projects/LocalMapActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private pickTiff()V
    .locals 3

    .line 73
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->canLeave()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "*/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "android.intent.extra.LOCAL_ONLY"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0x10ce

    invoke-virtual {p0, v0, v1}, Lorg/rabochaya/projects/LocalMapActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private refreshCoordinates()V
    .locals 10

    .line 53
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->viewport()[D

    move-result-object v0

    const/4 v1, 0x1

    aget-wide v1, v0, v1

    invoke-static {v1, v2}, Lorg/rabochaya/projects/MapMath;->lat(D)D

    move-result-wide v4

    const/4 v1, 0x0

    aget-wide v1, v0, v1

    invoke-static {v1, v2}, Lorg/rabochaya/projects/MapMath;->lon(D)D

    move-result-wide v6

    const/4 v1, 0x2

    aget-wide v8, v0, v1

    move-object v3, p0

    invoke-virtual/range {v3 .. v9}, Lorg/rabochaya/projects/LocalMapActivity;->center(DDD)V

    :cond_0
    return-void
.end method

.method private removeMap()V
    .locals 3

    .line 95
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->drawingType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, "\u0417\u0430\u0432\u0435\u0440\u0448\u0438\u0442\u0435 \u0438\u043b\u0438 \u043e\u0442\u043c\u0435\u043d\u0438\u0442\u0435 \u0440\u0438\u0441\u0443\u043d\u043e\u043a"

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->error(Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->mapFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\u041b\u043e\u043a\u0430\u043b\u044c\u043d\u0430\u044f \u043f\u043e\u0434\u043b\u043e\u0436\u043a\u0430 \u043d\u0435 \u0432\u044b\u0431\u0440\u0430\u043d\u0430"

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->error(Ljava/lang/String;)V

    return-void

    :cond_1
    :try_start_0
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->mapFile()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lorg/rabochaya/projects/LocalRasterStore;->stamp(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "\u0423\u0434\u0430\u043b\u0438\u0442\u044c \u043f\u0440\u0438\u0432\u0430\u0442\u043d\u0443\u044e \u043a\u043e\u043f\u0438\u044e \u043f\u043e\u0434\u043b\u043e\u0436\u043a\u0438? \u041e\u0431\u044a\u0435\u043a\u0442\u044b \u043f\u0440\u043e\u0435\u043a\u0442\u0430 \u0438 \u0438\u0441\u0445\u043e\u0434\u043d\u044b\u0439 MBTiles \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u0442\u0441\u044f."

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda44;

    invoke-direct {v2, p0, v0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda44;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Ljava/lang/String;)V

    const-string v0, "\u0423\u0431\u0440\u0430\u0442\u044c"

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->error(Ljava/lang/String;)V

    return-void
.end method

.method private saveView()V
    .locals 9

    .line 64
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->viewport()[D

    move-result-object v0

    const/4 v1, 0x0

    aget-wide v3, v0, v1

    const/4 v1, 0x1

    aget-wide v5, v0, v1

    const/4 v1, 0x2

    aget-wide v7, v0, v1

    move-object v2, p0

    invoke-virtual/range {v2 .. v8}, Lorg/rabochaya/projects/LocalMapActivity;->settled(DDD)V

    :cond_0
    return-void
.end method

.method private search()V
    .locals 4

    .line 63
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->canLeave()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const v1, -0xdfdfe0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTextColor(I)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackgroundColor(I)V

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "\u041f\u043e\u0438\u0441\u043a \u043d\u0430 \u043a\u0430\u0440\u0442\u0435"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435 \u0441\u0440\u0435\u0434\u0438 \u0432\u0438\u0434\u0438\u043c\u044b\u0445 \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432 \u043f\u0440\u043e\u0435\u043a\u0442\u0430"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u041d\u0430\u0439\u0442\u0438"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda71;

    invoke-direct {v2, p0, v1, v0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda71;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/app/AlertDialog;Landroid/widget/EditText;)V

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private show(Z)V
    .locals 21

    .line 15
    move-object/from16 v9, p0

    const-string v10, ".5"

    const-string v11, ""

    iget-boolean v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->disposed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    const/4 v12, 0x0

    if-eqz v0, :cond_1

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapActivity;->saveView()V

    iget-object v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->close()V

    iput-object v12, v9, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    :cond_1
    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapActivity;->closeDem()V

    :try_start_0
    iget-wide v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-static {v9, v0, v1}, Lorg/rabochaya/projects/DemActivity;->file(Landroid/content/Context;J)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v1, v9, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-static {v0, v1, v2}, Lorg/rabochaya/projects/HgtRaster;->owned(Ljava/io/File;J)Lorg/rabochaya/projects/HgtRaster;

    move-result-object v0

    iput-object v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->dem:Lorg/rabochaya/projects/HgtRaster;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DEM \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u0435\u043d: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->warning:Ljava/lang/String;

    :cond_2
    :goto_0
    iget-object v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 16
    iget-wide v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-static {v9, v0, v1}, Lorg/rabochaya/projects/OnlineMapSettings;->active(Landroid/content/Context;J)Z

    move-result v13

    if-eqz v13, :cond_3

    invoke-static/range {p0 .. p0}, Lorg/rabochaya/projects/OnlineMapSettings;->source(Landroid/content/Context;)Lorg/rabochaya/projects/TileSource;

    move-result-object v0

    move-object v14, v0

    goto :goto_1

    :cond_3
    move-object v14, v12

    .line 17
    :goto_1
    :try_start_1
    iget-wide v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-static {v9, v0, v1}, Lorg/rabochaya/projects/MapCompositionSettings;->active(Landroid/content/Context;J)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-wide v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-static {v9, v0, v1}, Lorg/rabochaya/projects/MapCompositionSettings;->load(Landroid/content/Context;J)Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;

    move-result-object v0

    iget-object v0, v0, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :cond_4
    move-object v0, v12

    :goto_2
    move-object v15, v11

    goto :goto_3

    :catch_1
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u0421\u043e\u0441\u0442\u0430\u0432 \u043a\u0430\u0440\u0442 \u043d\u0435 \u043f\u0440\u043e\u0447\u0438\u0442\u0430\u043d: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v15, v0

    move-object v0, v12

    .line 18
    :goto_3
    new-instance v8, Landroid/widget/FrameLayout;

    invoke-direct {v8, v9}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iget-object v1, v9, Lorg/rabochaya/projects/LocalMapActivity;->root:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v7, -0x1

    const/4 v6, 0x0

    invoke-direct {v2, v7, v6, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v8, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    new-instance v5, Lorg/rabochaya/projects/LocalMapView;

    iget-object v3, v9, Lorg/rabochaya/projects/LocalMapActivity;->features:Ljava/util/List;

    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapActivity;->mapFile()Ljava/io/File;

    move-result-object v4

    invoke-static/range {p0 .. p0}, Lorg/rabochaya/projects/OnlineMapSettings;->network(Landroid/content/Context;)Z

    move-result v16

    move-object v1, v5

    move-object/from16 v2, p0

    move-object v12, v5

    move-object/from16 v5, p0

    move-object/from16 v18, v11

    move v11, v6

    move-object v6, v14

    move v11, v7

    move/from16 v7, v16

    move-object/from16 v19, v8

    move-object v8, v0

    invoke-direct/range {v1 .. v8}, Lorg/rabochaya/projects/LocalMapView;-><init>(Landroid/content/Context;Ljava/util/List;Ljava/io/File;Lorg/rabochaya/projects/LocalMapView$Listener;Lorg/rabochaya/projects/TileSource;ZLorg/rabochaya/projects/MapComposition;)V

    iput-object v12, v9, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    iget-object v1, v9, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v11, v11}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    move-object/from16 v3, v19

    invoke-virtual {v3, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    const-string v1, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b \u0446\u0435\u043d\u0442\u0440\u0430 \u00b7 WGS 84"

    const/16 v2, 0xc

    invoke-direct {v9, v1, v2}, Lorg/rabochaya/projects/LocalMapActivity;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, v9, Lorg/rabochaya/projects/LocalMapActivity;->coordinates:Landroid/widget/TextView;

    iget-object v1, v9, Lorg/rabochaya/projects/LocalMapActivity;->coordinates:Landroid/widget/TextView;

    invoke-static {}, Lorg/rabochaya/projects/WorkspaceUi;->panel()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, v9, Lorg/rabochaya/projects/LocalMapActivity;->coordinates:Landroid/widget/TextView;

    const-string v2, "\u041d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438 \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442 \u0446\u0435\u043d\u0442\u0440\u0430"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v1, v9, Lorg/rabochaya/projects/LocalMapActivity;->coordinates:Landroid/widget/TextView;

    new-instance v2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda45;

    invoke-direct {v2, v9}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda45;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v9, Lorg/rabochaya/projects/LocalMapActivity;->coordinates:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v9, v2}, Lorg/rabochaya/projects/LocalMapActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v2, "show_coordinates"

    const/4 v5, 0x1

    invoke-interface {v4, v2, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v2, 0x0

    goto :goto_4

    :cond_5
    const/16 v2, 0x8

    :goto_4
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v2, 0x33

    const/4 v4, -0x2

    invoke-direct {v1, v4, v4, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    const/high16 v2, 0x42500000    # 52.0f

    invoke-static {v9, v2}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v2

    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    iget-object v2, v9, Lorg/rabochaya/projects/LocalMapActivity;->coordinates:Landroid/widget/TextView;

    invoke-virtual {v3, v2, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda48;

    invoke-direct {v1, v9}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda48;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v2, "collapse"

    const-string v7, "\u0421\u0432\u0435\u0440\u043d\u0443\u0442\u044c / \u0440\u0430\u0437\u0432\u0435\u0440\u043d\u0443\u0442\u044c \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b"

    invoke-static {v9, v2, v7, v1}, Lorg/rabochaya/projects/WorkspaceUi;->icon(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/ImageButton;

    move-result-object v1

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v7, 0x42400000    # 48.0f

    invoke-static {v9, v7}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v8

    invoke-static {v9, v7}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v12

    const/16 v6, 0x35

    invoke-direct {v2, v8, v12, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v3, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    const-string v1, " \u00b7 "

    if-eqz v13, :cond_7

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, v14, Lorg/rabochaya/projects/TileSource;->name:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static/range {p0 .. p0}, Lorg/rabochaya/projects/OnlineMapSettings;->network(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_6

    const-string v6, "\u043e\u043d\u043b\u0430\u0439\u043d + \u043a\u0435\u0448"

    goto :goto_5

    :cond_6
    const-string v6, "\u0442\u043e\u043b\u044c\u043a\u043e \u043a\u0435\u0448"

    :goto_5
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_6

    :cond_7
    invoke-direct/range {p0 .. p0}, Lorg/rabochaya/projects/LocalMapActivity;->mapFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_8

    const-string v2, "\u041b\u043e\u043a\u0430\u043b\u044c\u043d\u0430\u044f \u043a\u0430\u0440\u0442\u0430 MBTiles"

    goto :goto_6

    :cond_8
    const-string v2, "\u041e\u0431\u0437\u043e\u0440\u043d\u0430\u044f \u043a\u0430\u0440\u0442\u0430"

    .line 23
    :goto_6
    const-string v6, " \u0432\u0438\u0434\u0438\u043c\u044b\u0445 \u043e\u0431\u044a\u0435\u043a\u0442\u043e\u0432"

    const-string v8, "\n"

    if-eqz v0, :cond_d

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v12, Ljava/util/LinkedHashSet;

    invoke-direct {v12}, Ljava/util/LinkedHashSet;-><init>()V

    iget-object v11, v0, Lorg/rabochaya/projects/MapComposition;->layers:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    const/4 v7, 0x0

    :goto_7
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_b

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v5, v20

    check-cast v5, Lorg/rabochaya/projects/MapComposition$Layer;

    iget-boolean v4, v5, Lorg/rabochaya/projects/MapComposition$Layer;->visible:Z

    if-eqz v4, :cond_a

    iget v4, v5, Lorg/rabochaya/projects/MapComposition$Layer;->opacity:I

    if-lez v4, :cond_a

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_9

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_9
    iget-object v4, v5, Lorg/rabochaya/projects/MapComposition$Layer;->name:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Lorg/rabochaya/projects/MapComposition$Layer;->source()Lorg/rabochaya/projects/TileSource;

    move-result-object v4

    if-eqz v4, :cond_a

    iget-object v4, v4, Lorg/rabochaya/projects/TileSource;->attribution:Ljava/lang/String;

    invoke-virtual {v12, v4}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    :cond_a
    const/4 v4, -0x2

    const/4 v5, 0x1

    goto :goto_7

    :cond_b
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u041a\u043e\u043c\u043f\u043e\u0437\u0438\u0446\u0438\u044f: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " \u0441\u043b\u043e\u0451\u0432 \u00b7 "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v9, Lorg/rabochaya/projects/LocalMapActivity;->features:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-nez v7, :cond_c

    const-string v2, " \u00b7 \u0431\u0435\u0437 \u043f\u043e\u0434\u043b\u043e\u0436\u043a\u0438"

    goto :goto_8

    :cond_c
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_8
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v12}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_9
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_9

    :cond_d
    invoke-virtual {v15}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_e

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 24
    :cond_e
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-nez v0, :cond_f

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v5, v9, Lorg/rabochaya/projects/LocalMapActivity;->features:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_a

    :cond_f
    move-object/from16 v1, v18

    :goto_a
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-nez v0, :cond_10

    if-eqz v13, :cond_10

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v14, Lorg/rabochaya/projects/TileSource;->attribution:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    goto :goto_b

    :cond_10
    move-object/from16 v11, v18

    :goto_b
    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v4, 0xb

    invoke-direct {v9, v1, v4}, Lorg/rabochaya/projects/LocalMapActivity;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    iput-object v1, v9, Lorg/rabochaya/projects/LocalMapActivity;->status:Landroid/widget/TextView;

    iget-object v1, v9, Lorg/rabochaya/projects/LocalMapActivity;->status:Landroid/widget/TextView;

    invoke-static {}, Lorg/rabochaya/projects/WorkspaceUi;->panel()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    if-eqz v0, :cond_11

    iget-object v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->status:Landroid/widget/TextView;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->status:Landroid/widget/TextView;

    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u0421\u043e\u0441\u0442\u0430\u0432 \u0438 \u043f\u043e\u0434\u043f\u0438\u0441\u0438 \u043a\u0430\u0440\u0442"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->status:Landroid/widget/TextView;

    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda49;

    invoke-direct {v1, v9, v2}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda49;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_11
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v1, 0x53

    const/4 v2, -0x2

    invoke-direct {v0, v2, v2, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    const/high16 v1, 0x42580000    # 54.0f

    invoke-static {v9, v1}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v1

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    iget-object v1, v9, Lorg/rabochaya/projects/LocalMapActivity;->status:Landroid/widget/TextView;

    invoke-virtual {v3, v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->zoomButtons:Landroid/widget/LinearLayout;

    iget-object v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->zoomButtons:Landroid/widget/LinearLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->zoomButtons:Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    invoke-virtual {v9, v2}, Lorg/rabochaya/projects/LocalMapActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v2, "show_zoom"

    invoke-interface {v4, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_12

    const/4 v6, 0x0

    goto :goto_c

    :cond_12
    const/16 v6, 0x8

    :goto_c
    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->zoomButtons:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v2, 0x42400000    # 48.0f

    invoke-static {v9, v2}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v4

    const/16 v2, 0x55

    const/4 v5, -0x2

    invoke-direct {v1, v4, v5, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v3, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    iget-object v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->zoomButtons:Landroid/widget/LinearLayout;

    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda50;

    invoke-direct {v1, v9}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda50;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v2, "plus"

    const-string v3, "+"

    invoke-static {v9, v2, v3, v1}, Lorg/rabochaya/projects/WorkspaceUi;->icon(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/ImageButton;

    move-result-object v1

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x42400000    # 48.0f

    invoke-static {v9, v3}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v4

    const/4 v5, -0x1

    invoke-direct {v2, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->zoomButtons:Landroid/widget/LinearLayout;

    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda51;

    invoke-direct {v1, v9}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda51;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v2, "minus"

    const-string v4, "\u2212"

    invoke-static {v9, v2, v4, v1}, Lorg/rabochaya/projects/WorkspaceUi;->icon(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/ImageButton;

    move-result-object v1

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v9, v3}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v4

    invoke-direct {v2, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 27
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iget-object v1, v9, Lorg/rabochaya/projects/LocalMapActivity;->root:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x42600000    # 56.0f

    invoke-static {v9, v3}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v3

    invoke-direct {v2, v5, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda52;

    invoke-direct {v1, v9}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda52;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v2, "menu"

    const-string v3, "\u041c\u0435\u043d\u044e"

    invoke-direct {v9, v0, v2, v3, v1}, Lorg/rabochaya/projects/LocalMapActivity;->tool(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda53;

    invoke-direct {v1, v9}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda53;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v2, "maps"

    const-string v3, "\u041a\u0430\u0440\u0442\u044b"

    invoke-direct {v9, v0, v2, v3, v1}, Lorg/rabochaya/projects/LocalMapActivity;->tool(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda54;

    invoke-direct {v1, v9}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda54;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v2, "marks"

    const-string v3, "\u041c\u0435\u0442\u043a\u0438"

    invoke-direct {v9, v0, v2, v3, v1}, Lorg/rabochaya/projects/LocalMapActivity;->tool(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda55;

    invoke-direct {v1, v9}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda55;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v2, "files"

    const-string v3, "\u0424\u0430\u0439\u043b\u043e\u0432\u044b\u0439 \u043c\u0435\u043d\u0435\u0434\u0436\u0435\u0440"

    invoke-direct {v9, v0, v2, v3, v1}, Lorg/rabochaya/projects/LocalMapActivity;->tool(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda56;

    invoke-direct {v1, v9}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda56;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v2, "compass"

    const-string v3, "\u041e\u0440\u0438\u0435\u043d\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u0435"

    invoke-direct {v9, v0, v2, v3, v1}, Lorg/rabochaya/projects/LocalMapActivity;->tool(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda46;

    invoke-direct {v1, v9}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda46;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v2, "search"

    const-string v3, "\u041f\u043e\u0438\u0441\u043a \u043d\u0430 \u043a\u0430\u0440\u0442\u0435"

    invoke-direct {v9, v0, v2, v3, v1}, Lorg/rabochaya/projects/LocalMapActivity;->tool(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 29
    const/4 v1, 0x0

    invoke-virtual {v9, v1}, Lorg/rabochaya/projects/LocalMapActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v1, "show_tools"

    const/4 v3, 0x1

    invoke-interface {v2, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    const/4 v6, 0x0

    :goto_d
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-ge v6, v2, :cond_14

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    if-eqz v1, :cond_13

    const/4 v3, 0x0

    goto :goto_e

    :cond_13
    const/16 v3, 0x8

    :goto_e
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_d

    .line 30
    :cond_14
    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda47;

    invoke-direct {v1, v9, v0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda47;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/widget/LinearLayout;)V

    const-string v2, "expand"

    const-string v3, "\u0421\u0432\u0435\u0440\u043d\u0443\u0442\u044c / \u0440\u0430\u0437\u0432\u0435\u0440\u043d\u0443\u0442\u044c \u0438\u043d\u0441\u0442\u0440\u0443\u043c\u0435\u043d\u0442\u044b"

    invoke-static {v9, v2, v3, v1}, Lorg/rabochaya/projects/WorkspaceUi;->icon(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/ImageButton;

    move-result-object v1

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x42400000    # 48.0f

    invoke-static {v9, v3}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v3

    const/4 v4, -0x1

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    const/4 v1, 0x0

    iput-object v1, v9, Lorg/rabochaya/projects/LocalMapActivity;->drawingRow:Landroid/widget/LinearLayout;

    iget-object v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->pendingDrawType:Ljava/lang/String;

    if-eqz v0, :cond_17

    iget-object v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->pendingDrawPoints:Ljava/util/ArrayList;

    if-eqz v0, :cond_17

    iget-object v0, v9, Lorg/rabochaya/projects/LocalMapActivity;->pendingDrawType:Ljava/lang/String;

    iget-object v2, v9, Lorg/rabochaya/projects/LocalMapActivity;->pendingDrawPoints:Ljava/util/ArrayList;

    iput-object v1, v9, Lorg/rabochaya/projects/LocalMapActivity;->pendingDrawType:Ljava/lang/String;

    iput-object v1, v9, Lorg/rabochaya/projects/LocalMapActivity;->pendingDrawPoints:Ljava/util/ArrayList;

    const-string v1, "LineString"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_15

    const-string v1, "Polygon"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17

    :cond_15
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/16 v3, 0x7d0

    if-gt v1, v3, :cond_17

    invoke-direct {v9, v0}, Lorg/rabochaya/projects/LocalMapActivity;->startDrawing(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_17

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [D

    if-eqz v1, :cond_16

    array-length v2, v1

    const/4 v3, 0x2

    if-lt v2, v3, :cond_16

    iget-object v2, v9, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    const/4 v3, 0x0

    aget-wide v4, v1, v3

    const/4 v3, 0x1

    aget-wide v6, v1, v3

    invoke-virtual {v2, v4, v5, v6, v7}, Lorg/rabochaya/projects/LocalMapView;->addDrawingPoint(DD)V

    goto :goto_f

    :cond_16
    const/4 v3, 0x1

    goto :goto_f

    .line 32
    :cond_17
    if-eqz p1, :cond_18

    const/4 v0, 0x0

    invoke-virtual {v9, v0}, Lorg/rabochaya/projects/LocalMapActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "view_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, v9, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_18

    :try_start_2
    iget-object v11, v9, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v12

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "y"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v14

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "z"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/high16 v2, 0x40000000    # 2.0f

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v0

    float-to-double v0, v0

    move-wide/from16 v16, v0

    invoke-virtual/range {v11 .. v17}, Lorg/rabochaya/projects/LocalMapView;->restore(DDD)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_10

    :catch_2
    move-exception v0

    .line 33
    :cond_18
    :goto_10
    return-void
.end method

.method private startDrawing(Ljava/lang/String;)V
    .locals 2

    .line 100
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0, p1}, Lorg/rabochaya/projects/LocalMapView;->beginDrawing(Ljava/lang/String;)V

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->drawingRow:Landroid/widget/LinearLayout;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->root:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->drawingRow:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    :cond_1
    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->drawingRow:Landroid/widget/LinearLayout;

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->root:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->drawingRow:Landroid/widget/LinearLayout;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->drawingRow:Landroid/widget/LinearLayout;

    new-instance v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda18;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda18;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v1, "\u0412 \u0446\u0435\u043d\u0442\u0440\u0435"

    invoke-direct {p0, p1, v1, v0}, Lorg/rabochaya/projects/LocalMapActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->drawingRow:Landroid/widget/LinearLayout;

    new-instance v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda19;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda19;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v1, "\u0428\u0430\u0433 \u043d\u0430\u0437\u0430\u0434"

    invoke-direct {p0, p1, v1, v0}, Lorg/rabochaya/projects/LocalMapActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->drawingRow:Landroid/widget/LinearLayout;

    new-instance v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda20;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda20;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v1, "\u0417\u0430\u043f\u0438\u0441\u0430\u0442\u044c"

    invoke-direct {p0, p1, v1, v0}, Lorg/rabochaya/projects/LocalMapActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->drawingRow:Landroid/widget/LinearLayout;

    new-instance v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda21;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda21;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v1, "\u041e\u0442\u043c\u0435\u043d\u0430"

    invoke-direct {p0, p1, v1, v0}, Lorg/rabochaya/projects/LocalMapActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method private tool(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 2

    .line 35
    new-instance v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda30;

    invoke-direct {v0, p0, p4}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda30;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Ljava/lang/Runnable;)V

    invoke-static {p0, p2, p3, v0}, Lorg/rabochaya/projects/WorkspaceUi;->icon(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/ImageButton;

    move-result-object p2

    new-instance p3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p4, -0x1

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    invoke-direct {p3, v1, p4, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method public center(DDD)V
    .locals 6

    .line 97
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->coordinates:Landroid/widget/TextView;

    if-eqz v0, :cond_3

    invoke-static/range {p0 .. p6}, Lorg/rabochaya/projects/CoordinateSettings;->panel(Landroid/content/Context;DDD)Ljava/lang/String;

    move-result-object p5

    iget-object p6, p0, Lorg/rabochaya/projects/LocalMapActivity;->dem:Lorg/rabochaya/projects/HgtRaster;

    if-eqz p6, :cond_2

    :try_start_0
    iget-object p6, p0, Lorg/rabochaya/projects/LocalMapActivity;->dem:Lorg/rabochaya/projects/HgtRaster;

    invoke-virtual {p6, p3, p4, p1, p2}, Lorg/rabochaya/projects/HgtRaster;->height(DD)D

    move-result-wide p1

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result p4

    if-eqz p4, :cond_0

    const-string p1, "\nDEM: \u043d\u0435\u0442 \u0434\u0430\u043d\u043d\u044b\u0445"

    goto :goto_0

    :cond_0
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p6, "\nDEM: "

    invoke-virtual {p4, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    sget-object p6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v0, "%.1f"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1, p2}, Ljava/lang/Math;->abs(D)D

    move-result-wide v2

    const-wide v4, 0x3fa999999999999aL    # 0.05

    cmpg-double v2, v2, v4

    if-gez v2, :cond_1

    const-wide/16 p1, 0x0

    :cond_1
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v1, p2

    invoke-static {p6, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " \u043c \u00b7 HGT"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "\nDEM \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u0435\u043d"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    :cond_2
    :goto_1
    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->coordinates:Landroid/widget/TextView;

    invoke-virtual {p1, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_3
    return-void
.end method

.method public draftChanged(I)V
    .locals 3

    .line 102
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->status:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u0420\u0438\u0441\u043e\u0432\u0430\u043d\u0438\u0435: \u0432\u0435\u0440\u0448\u0438\u043d "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " \u00b7 \u043a\u0430\u0441\u0430\u0439\u0442\u0435\u0441\u044c \u043a\u0430\u0440\u0442\u044b \u0438\u043b\u0438 \u0434\u043e\u0431\u0430\u0432\u043b\u044f\u0439\u0442\u0435 \u0432 \u0446\u0435\u043d\u0442\u0440\u0435"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public error(Ljava/lang/String;)V
    .locals 6

    .line 145
    if-nez p1, :cond_0

    const-string p1, "\u041e\u0448\u0438\u0431\u043a\u0430 \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u043e\u0439 \u043a\u0430\u0440\u0442\u044b"

    :cond_0
    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->warning:Ljava/lang/String;

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->status:Landroid/widget/TextView;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->status:Landroid/widget/TextView;

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->warning:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lorg/rabochaya/projects/LocalMapActivity;->lastError:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x1388

    cmp-long p1, v2, v4

    if-lez p1, :cond_2

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->warning:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    iput-wide v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->lastError:J

    :cond_2
    return-void
.end method

.method synthetic lambda$button$0$org-rabochaya-projects-LocalMapActivity(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 10
    iget-boolean p2, p0, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    if-nez p2, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method synthetic lambda$chooseMap$54$org-rabochaya-projects-LocalMapActivity(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 69
    if-nez p2, :cond_0

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->onlineSettings()V

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    if-ne p2, p1, :cond_1

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->pick()V

    goto :goto_0

    :cond_1
    const/4 v0, 0x2

    if-ne p2, v0, :cond_2

    iget-wide v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    const/4 p2, 0x0

    invoke-static {p0, v0, v1, p2}, Lorg/rabochaya/projects/OnlineMapSettings;->use(Landroid/content/Context;JZ)V

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->show(Z)V

    goto :goto_0

    :cond_2
    const/4 p1, 0x3

    if-ne p2, p1, :cond_3

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->removeMap()V

    goto :goto_0

    :cond_3
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->pickTiff()V

    :goto_0
    return-void
.end method

.method synthetic lambda$coordinateOptions$47$org-rabochaya-projects-LocalMapActivity(Landroid/widget/Spinner;Landroid/widget/Spinner;Landroid/widget/CheckBox;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 56
    invoke-static {p0}, Lorg/rabochaya/projects/CoordinateSettings;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p4

    invoke-interface {p4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p4

    const-string p5, "primary"

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    invoke-interface {p4, p5, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p4, "secondary"

    invoke-virtual {p2}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p2

    invoke-interface {p1, p4, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "show_secondary"

    invoke-virtual {p3}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p3

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->refreshCoordinates()V

    return-void
.end method

.method synthetic lambda$coordinateOptions$48$org-rabochaya-projects-LocalMapActivity(Landroid/widget/Spinner;Landroid/widget/CheckBox;Landroid/widget/Spinner;Landroid/content/DialogInterface;I)V
    .locals 6

    .line 56
    iget-object p4, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz p4, :cond_1

    iget-object p4, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {p4}, Lorg/rabochaya/projects/LocalMapView;->viewport()[D

    move-result-object p4

    const-string p5, "clipboard"

    invoke-virtual {p0, p5}, Lorg/rabochaya/projects/LocalMapActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Landroid/content/ClipboardManager;

    if-eqz p5, :cond_1

    invoke-virtual {p1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p1

    const/4 v0, 0x1

    aget-wide v0, p4, v0

    invoke-static {v0, v1}, Lorg/rabochaya/projects/MapMath;->lat(D)D

    move-result-wide v0

    const/4 v2, 0x0

    aget-wide v3, p4, v2

    invoke-static {v3, v4}, Lorg/rabochaya/projects/MapMath;->lon(D)D

    move-result-wide v3

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Lorg/rabochaya/projects/Coordinates;->name(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    const-string v5, ": "

    invoke-virtual {p4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-static {v0, v1, v3, v4, p1}, Lorg/rabochaya/projects/CoordinateSettings;->display(DDI)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p3}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p2

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p3, "\n"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {p2}, Lorg/rabochaya/projects/Coordinates;->name(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {v0, v1, v3, v4, p2}, Lorg/rabochaya/projects/CoordinateSettings;->display(DDI)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_0
    const-string p2, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b \u0446\u0435\u043d\u0442\u0440\u0430 \u043a\u0430\u0440\u0442\u044b"

    invoke-static {p2, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p1

    invoke-virtual {p5, p1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    const-string p1, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b \u0441\u043a\u043e\u043f\u0438\u0440\u043e\u0432\u0430\u043d\u044b"

    invoke-static {p0, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_1
    return-void
.end method

.method synthetic lambda$discardDrawing$71$org-rabochaya-projects-LocalMapActivity(ZLandroid/content/DialogInterface;I)V
    .locals 0

    .line 103
    iget-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {p2}, Lorg/rabochaya/projects/LocalMapView;->cancelDrawing()V

    iget-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity;->drawingRow:Landroid/widget/LinearLayout;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity;->root:Landroid/widget/LinearLayout;

    iget-object p3, p0, Lorg/rabochaya/projects/LocalMapActivity;->drawingRow:Landroid/widget/LinearLayout;

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    const/4 p2, 0x0

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity;->drawingRow:Landroid/widget/LinearLayout;

    :cond_0
    iget-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity;->status:Landroid/widget/TextView;

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->mapFile()Ljava/io/File;

    move-result-object p3

    invoke-virtual {p3}, Ljava/io/File;->isFile()Z

    move-result p3

    if-eqz p3, :cond_1

    const-string p3, "\u041b\u043e\u043a\u0430\u043b\u044c\u043d\u0430\u044f \u043a\u0430\u0440\u0442\u0430 MBTiles"

    goto :goto_0

    :cond_1
    const-string p3, "\u041e\u0431\u0437\u043e\u0440\u043d\u0430\u044f \u043a\u0430\u0440\u0442\u0430"

    :goto_0
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapActivity;->finish()V

    :cond_2
    return-void
.end method

.method synthetic lambda$display$40$org-rabochaya-projects-LocalMapActivity([ZLandroid/content/DialogInterface;IZ)V
    .locals 1

    .line 45
    aput-boolean p4, p1, p3

    if-nez p3, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->coordinates:Landroid/widget/TextView;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->zoomButtons:Landroid/widget/LinearLayout;

    :goto_0
    const/4 p2, 0x0

    if-eqz p4, :cond_1

    move v0, p2

    goto :goto_1

    :cond_1
    const/16 v0, 0x8

    :goto_1
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0, p2}, Lorg/rabochaya/projects/LocalMapActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    if-nez p3, :cond_2

    const-string p2, "show_coordinates"

    goto :goto_2

    :cond_2
    const-string p2, "show_zoom"

    :goto_2
    invoke-interface {p1, p2, p4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method synthetic lambda$display$41$org-rabochaya-projects-LocalMapActivity(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 45
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->coordinateOptions()V

    return-void
.end method

.method synthetic lambda$editObject$72$org-rabochaya-projects-LocalMapActivity(Ljava/util/List;)V
    .locals 1

    .line 141
    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->disposed:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->drawingType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->cancelDrawing()V

    :cond_0
    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->features:Ljava/util/List;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->show(Z)V

    const-string v0, "\u041e\u0431\u044a\u0435\u043a\u0442 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d"

    invoke-static {p0, v0, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_1
    return-void
.end method

.method synthetic lambda$editObject$73$org-rabochaya-projects-LocalMapActivity(Ljava/lang/Exception;)V
    .locals 2

    .line 142
    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->disposed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0441\u043e\u0445\u0440\u0430\u043d\u0438\u0442\u044c: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->error(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$editObject$74$org-rabochaya-projects-LocalMapActivity(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 3

    .line 135
    new-instance v0, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V

    .line 136
    :try_start_0
    iget-wide v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v1

    .line 137
    if-nez p1, :cond_0

    invoke-virtual {v1}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p1

    invoke-static {p1, p2, p3, p4, p5}, Lorg/rabochaya/projects/FeatureEdits;->create(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lorg/w3c/dom/Element;

    goto :goto_0

    .line 138
    :cond_0
    invoke-virtual {v1, p1}, Lorg/rabochaya/projects/KmlProject;->byId(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-static {p1, p3, p4}, Lorg/rabochaya/projects/FeatureEdits;->metadata(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p5, :cond_1

    invoke-static {p1, p5}, Lorg/rabochaya/projects/FeatureEdits;->movePoint(Lorg/w3c/dom/Element;Ljava/util/List;)V

    .line 139
    :cond_1
    :goto_0
    iget-wide p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-virtual {v0, p1, p2, v1}, Lorg/rabochaya/projects/ProjectStore;->saveDocument(JLorg/rabochaya/projects/KmlProject;)V

    .line 140
    iget-wide p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-virtual {v0, p1, p2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lorg/rabochaya/projects/KmlProject;->features(Z)Ljava/util/List;

    move-result-object p1

    .line 141
    new-instance p2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda24;

    invoke-direct {p2, p0, p1}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda24;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Ljava/util/List;)V

    invoke-virtual {p0, p2}, Lorg/rabochaya/projects/LocalMapActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 138
    :cond_2
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u041e\u0431\u044a\u0435\u043a\u0442 \u0431\u043e\u043b\u044c\u0448\u0435 \u043d\u0435 \u0441\u0443\u0449\u0435\u0441\u0442\u0432\u0443\u0435\u0442"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 142
    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception p1

    :try_start_1
    new-instance p2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda25;

    invoke-direct {p2, p0, p1}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda25;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, p2}, Lorg/rabochaya/projects/LocalMapActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    return-void

    :goto_2
    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    throw p1
.end method

.method synthetic lambda$editObject$75$org-rabochaya-projects-LocalMapActivity(Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Lorg/rabochaya/projects/KmlProject$Feature;Ljava/lang/String;Landroid/app/AlertDialog;Landroid/view/View;)V
    .locals 7

    .line 127
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p7

    invoke-virtual {p7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p7

    invoke-virtual {p7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p7

    invoke-virtual {p7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 128
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result p7

    if-nez p7, :cond_5

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result p7

    const/16 v0, 0x3e8

    if-le p7, v0, :cond_0

    goto :goto_3

    .line 129
    :cond_0
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result p1

    const p7, 0x186a0

    if-le p1, p7, :cond_1

    const-string p1, "\u041e\u043f\u0438\u0441\u0430\u043d\u0438\u0435: \u0434\u043e 100 000 \u0441\u0438\u043c\u0432\u043e\u043b\u043e\u0432"

    invoke-virtual {p2, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    .line 131
    :cond_1
    const/4 p1, 0x0

    if-nez p3, :cond_2

    move-object v6, p1

    goto :goto_1

    :cond_2
    :try_start_0
    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    if-nez p4, :cond_3

    move-object p7, p5

    goto :goto_0

    :cond_3
    const-string p7, "Point"

    :goto_0
    invoke-static {p2, p7}, Lorg/rabochaya/projects/FeatureEdits;->coordinates(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p2
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v6, p2

    .line 132
    :goto_1
    nop

    .line 133
    if-nez p4, :cond_4

    goto :goto_2

    :cond_4
    iget-object p1, p4, Lorg/rabochaya/projects/KmlProject$Feature;->element:Lorg/w3c/dom/Element;

    const-string p2, "id"

    invoke-interface {p1, p2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_2
    move-object v2, p1

    .line 134
    const/4 p1, 0x1

    iput-boolean p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->status:Landroid/widget/TextView;

    const-string p2, "\u0421\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u0438\u0435 \u043e\u0431\u044a\u0435\u043a\u0442\u0430\u2026"

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p6}, Landroid/app/AlertDialog;->dismiss()V

    .line 135
    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance p2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda67;

    move-object v0, p2

    move-object v1, p0

    move-object v3, p5

    invoke-direct/range {v0 .. v6}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda67;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    invoke-interface {p1, p2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 143
    return-void

    .line 132
    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    .line 128
    :cond_5
    :goto_3
    const-string p2, "\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435: \u043e\u0442 1 \u0434\u043e 1000 \u0441\u0438\u043c\u0432\u043e\u043b\u043e\u0432"

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$editObject$76$org-rabochaya-projects-LocalMapActivity(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Lorg/rabochaya/projects/KmlProject$Feature;Ljava/lang/String;Landroid/content/DialogInterface;)V
    .locals 10

    .line 126
    const/4 v0, -0x1

    move-object v8, p1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v9, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda66;

    move-object v1, v9

    move-object v2, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object/from16 v7, p6

    invoke-direct/range {v1 .. v8}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda66;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Lorg/rabochaya/projects/KmlProject$Feature;Ljava/lang/String;Landroid/app/AlertDialog;)V

    invoke-virtual {v0, v9}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$goToCoordinates$49$org-rabochaya-projects-LocalMapActivity(Landroid/widget/EditText;Landroid/widget/Spinner;Landroid/app/AlertDialog;Landroid/view/View;)V
    .locals 7

    .line 61
    :try_start_0
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result p2

    invoke-static {p4, p2}, Lorg/rabochaya/projects/Coordinates;->parse(Ljava/lang/String;I)Lorg/rabochaya/projects/Coordinates$Position;

    move-result-object p2

    iget-wide v0, p2, Lorg/rabochaya/projects/Coordinates$Position;->lat:D

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    const-wide v2, 0x40554345b1a57f00L    # 85.05112878

    cmpl-double p4, v0, v2

    if-gtz p4, :cond_0

    iget-object p4, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {p4}, Lorg/rabochaya/projects/LocalMapView;->viewport()[D

    move-result-object p4

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    iget-wide v1, p2, Lorg/rabochaya/projects/Coordinates$Position;->lon:D

    invoke-static {v1, v2}, Lorg/rabochaya/projects/MapMath;->x(D)D

    move-result-wide v1

    iget-wide v3, p2, Lorg/rabochaya/projects/Coordinates$Position;->lat:D

    invoke-static {v3, v4}, Lorg/rabochaya/projects/MapMath;->y(D)D

    move-result-wide v3

    const/4 p2, 0x2

    aget-wide v5, p4, p2

    invoke-virtual/range {v0 .. v6}, Lorg/rabochaya/projects/LocalMapView;->restore(DDD)V

    invoke-virtual {p3}, Landroid/app/AlertDialog;->dismiss()V

    goto :goto_0

    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    const-string p3, "\u042d\u0442\u0430 \u043a\u0430\u0440\u0442\u0430 \u043e\u0442\u043e\u0431\u0440\u0430\u0436\u0430\u0435\u0442 \u0448\u0438\u0440\u043e\u0442\u044b \u0434\u043e \u00b185.05112878\u00b0"

    invoke-direct {p2, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p2

    invoke-virtual {p2}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$goToCoordinates$50$org-rabochaya-projects-LocalMapActivity(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/widget/Spinner;Landroid/content/DialogInterface;)V
    .locals 1

    .line 61
    const/4 p4, -0x1

    invoke-virtual {p1, p4}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p4

    new-instance v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda32;

    invoke-direct {v0, p0, p2, p3, p1}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda32;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/widget/EditText;Landroid/widget/Spinner;Landroid/app/AlertDialog;)V

    invoke-virtual {p4, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$importMap$57$org-rabochaya-projects-LocalMapActivity(II)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 86
    iget-boolean p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->disposed:Z

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string p2, "\u0418\u043c\u043f\u043e\u0440\u0442 \u043e\u0442\u043c\u0435\u043d\u0451\u043d"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method synthetic lambda$importMap$58$org-rabochaya-projects-LocalMapActivity(Lorg/rabochaya/projects/LocalMapView;[D)V
    .locals 13

    .line 91
    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->disposed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-ne v0, p1, :cond_0

    const/4 v0, 0x0

    aget-wide v1, p2, v0

    const/4 v11, 0x1

    aget-wide v3, p2, v11

    const/4 v12, 0x2

    aget-wide v5, p2, v12

    const/4 v7, 0x3

    aget-wide v7, p2, v7

    invoke-virtual {p1}, Lorg/rabochaya/projects/LocalMapView;->getWidth()I

    move-result v9

    invoke-virtual {p1}, Lorg/rabochaya/projects/LocalMapView;->getHeight()I

    move-result v10

    invoke-static/range {v1 .. v10}, Lorg/rabochaya/projects/GeoRasterTransform;->viewport(DDDDII)[D

    move-result-object p2

    aget-wide v2, p2, v0

    aget-wide v4, p2, v11

    aget-wide v6, p2, v12

    move-object v1, p1

    invoke-virtual/range {v1 .. v7}, Lorg/rabochaya/projects/LocalMapView;->restore(DDD)V

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->saveView()V

    :cond_0
    return-void
.end method

.method synthetic lambda$importMap$59$org-rabochaya-projects-LocalMapActivity(Ljava/lang/String;[D)V
    .locals 3

    .line 91
    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->disposed:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    if-eqz p1, :cond_1

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->error(Ljava/lang/String;)V

    iget-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity;->status:Landroid/widget/TextView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u041a\u0430\u0440\u0442\u0430 \u043d\u0435 \u0437\u0430\u043c\u0435\u043d\u0435\u043d\u0430: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    :cond_1
    const-string p1, ""

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->warning:Ljava/lang/String;

    iget-wide v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-static {p0, v1, v2, v0}, Lorg/rabochaya/projects/OnlineMapSettings;->use(Landroid/content/Context;JZ)V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->show(Z)V

    if-eqz p2, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    new-instance v1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda72;

    invoke-direct {v1, p0, v0, p2}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda72;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Lorg/rabochaya/projects/LocalMapView;[D)V

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/LocalMapView;->post(Ljava/lang/Runnable;)Z

    :cond_2
    if-eqz p2, :cond_3

    iget-wide v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/MapCompositionSettings;->active(Landroid/content/Context;J)Z

    move-result p2

    if-eqz p2, :cond_3

    const-string p2, "\u041a\u0430\u0440\u0442\u0430 \u0441\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u0430. \u041f\u0440\u0438 \u043d\u0435\u043e\u0431\u0445\u043e\u0434\u0438\u043c\u043e\u0441\u0442\u0438 \u0434\u043e\u0431\u0430\u0432\u044c\u0442\u0435 \u043b\u043e\u043a\u0430\u043b\u044c\u043d\u044b\u0439 \u0441\u043b\u043e\u0439 \u0432 \u00ab\u0421\u043b\u043e\u0438 \u043a\u0430\u0440\u0442\u044b\u00bb."

    goto :goto_0

    :cond_3
    const-string p2, "\u041b\u043e\u043a\u0430\u043b\u044c\u043d\u0430\u044f \u043a\u0430\u0440\u0442\u0430 \u0441\u043e\u0445\u0440\u0430\u043d\u0435\u043d\u0430"

    :goto_0
    invoke-static {p0, p2, p1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :goto_1
    return-void
.end method

.method synthetic lambda$importMap$60$org-rabochaya-projects-LocalMapActivity(Landroid/net/Uri;ZLjava/lang/String;)V
    .locals 12

    .line 79
    nop

    .line 81
    const/4 v0, 0x0

    :try_start_0
    const-string v1, "local-map-import-"

    const-string v2, ".tmp"

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapActivity;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-static {v1, v2, v3}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_6
    .catchall {:try_start_0 .. :try_end_0} :catchall_e

    .line 82
    :try_start_1
    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_d

    :try_start_2
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_b

    .line 83
    if-eqz p1, :cond_9

    const/high16 v3, 0x10000

    :try_start_3
    new-array v3, v3, [B

    const-wide/16 v4, 0x0

    .line 84
    :goto_0
    invoke-virtual {p1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v6

    const/4 v7, -0x1

    const/4 v8, 0x0

    if-eq v6, v7, :cond_4

    iget-boolean v7, p0, Lorg/rabochaya/projects/LocalMapActivity;->disposed:Z

    if-nez v7, :cond_3

    int-to-long v9, v6

    add-long/2addr v4, v9

    if-eqz p2, :cond_0

    const-wide/32 v9, 0x20000000

    goto :goto_1

    :cond_0
    const-wide v9, 0x80000000L

    :goto_1
    cmp-long v7, v4, v9

    if-lez v7, :cond_2

    new-instance p3, Ljava/io/IOException;

    if-eqz p2, :cond_1

    const-string p2, "\u041f\u0440\u0435\u0434\u0435\u043b GeoTIFF \u2014 512 \u041c\u0438\u0411"

    goto :goto_2

    :cond_1
    const-string p2, "\u041f\u0440\u0435\u0434\u0435\u043b MBTiles \u2014 2 \u0413\u0438\u0411"

    :goto_2
    invoke-direct {p3, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p3

    :cond_2
    invoke-virtual {v2, v3, v8, v6}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_0

    :cond_3
    new-instance p2, Ljava/io/IOException;

    const-string p3, "\u0418\u043c\u043f\u043e\u0440\u0442 \u043e\u0442\u043c\u0435\u043d\u0451\u043d"

    invoke-direct {p2, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_4
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/FileDescriptor;->sync()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_9

    .line 85
    :try_start_4
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_b

    if-eqz p1, :cond_5

    :try_start_5
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_d

    .line 86
    :cond_5
    if-eqz p2, :cond_6

    :try_start_6
    new-instance p1, Lorg/rabochaya/projects/GeoTiffRaster;

    invoke-direct {p1, v1}, Lorg/rabochaya/projects/GeoTiffRaster;-><init>(Ljava/io/File;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    :try_start_7
    iget-object p2, p1, Lorg/rabochaya/projects/GeoTiffRaster;->transform:Lorg/rabochaya/projects/GeoRasterTransform;

    const/4 v2, 0x4

    new-array v2, v2, [D

    iget-wide v3, p2, Lorg/rabochaya/projects/GeoRasterTransform;->west:D

    aput-wide v3, v2, v8

    iget-wide v3, p2, Lorg/rabochaya/projects/GeoRasterTransform;->south:D

    const/4 v5, 0x1

    aput-wide v3, v2, v5

    iget-wide v3, p2, Lorg/rabochaya/projects/GeoRasterTransform;->east:D

    const/4 v5, 0x2

    aput-wide v3, v2, v5

    iget-wide v3, p2, Lorg/rabochaya/projects/GeoRasterTransform;->north:D

    const/4 p2, 0x3

    aput-wide v3, v2, p2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    invoke-virtual {p1}, Lorg/rabochaya/projects/GeoTiffRaster;->close()V

    const-string p1, "geotiff-map-"

    const-string p2, ".mbtiles"

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapActivity;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-static {p1, p2, v3}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object p1
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    :try_start_9
    new-instance p2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda0;

    invoke-direct {p2, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    invoke-static {v1, p1, p2}, Lorg/rabochaya/projects/GeoTiffImport;->write(Ljava/io/File;Ljava/io/File;Lorg/rabochaya/projects/CacheExport$Progress;)I
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    move-object v11, v1

    move-object v1, p1

    move-object p1, v11

    goto :goto_5

    .line 90
    :catchall_0
    move-exception p2

    move-object v0, p1

    goto/16 :goto_9

    :catch_0
    move-exception p2

    move-object v0, p1

    goto/16 :goto_b

    :catch_1
    move-exception p1

    goto :goto_4

    .line 86
    :catchall_1
    move-exception p2

    :try_start_a
    invoke-virtual {p1}, Lorg/rabochaya/projects/GeoTiffRaster;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    goto :goto_3

    :catchall_2
    move-exception p1

    :try_start_b
    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_3
    throw p2
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_2
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 90
    :catchall_3
    move-exception p1

    move-object v0, v1

    goto/16 :goto_11

    :catch_2
    move-exception p1

    move-object v2, v0

    :goto_4
    move-object v0, v1

    goto/16 :goto_f

    .line 86
    :cond_6
    move-object p1, v0

    move-object v2, p1

    .line 87
    :goto_5
    :try_start_c
    new-instance p2, Lorg/rabochaya/projects/OfflineTiles;

    invoke-direct {p2, v1}, Lorg/rabochaya/projects/OfflineTiles;-><init>(Ljava/io/File;)V

    invoke-virtual {p2}, Lorg/rabochaya/projects/OfflineTiles;->close()V

    .line 88
    iget-boolean p2, p0, Lorg/rabochaya/projects/LocalMapActivity;->disposed:Z

    if-nez p2, :cond_8

    .line 89
    const-class p2, Lorg/rabochaya/projects/LocalRasterStore;

    monitor-enter p2
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_4
    .catchall {:try_start_c .. :try_end_c} :catchall_8

    :try_start_d
    iget-boolean v3, p0, Lorg/rabochaya/projects/LocalMapActivity;->disposed:Z

    if-nez v3, :cond_7

    new-instance v3, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v3, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    :try_start_e
    iget-wide v4, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-virtual {v3, v4, v5}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    :try_start_f
    invoke-virtual {v3}, Lorg/rabochaya/projects/ProjectStore;->close()V

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->mapFile()Ljava/io/File;

    move-result-object v3

    invoke-static {v1, v3, p3}, Lorg/rabochaya/projects/LocalRasterStore;->replace(Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    :try_start_10
    monitor-exit p2
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_7

    .line 90
    if-eqz p1, :cond_d

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    goto/16 :goto_10

    .line 89
    :catchall_4
    move-exception p3

    :try_start_11
    invoke-virtual {v3}, Lorg/rabochaya/projects/ProjectStore;->close()V

    :goto_6
    throw p3

    :cond_7
    new-instance p3, Ljava/io/IOException;

    const-string v0, "\u0418\u043c\u043f\u043e\u0440\u0442 \u043e\u0442\u043c\u0435\u043d\u0451\u043d"

    invoke-direct {p3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_5

    goto :goto_6

    :catchall_5
    move-exception p3

    move-object v0, v1

    :goto_7
    :try_start_12
    monitor-exit p2
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_7

    :try_start_13
    throw p3
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_3
    .catchall {:try_start_13 .. :try_end_13} :catchall_6

    .line 90
    :catchall_6
    move-exception p2

    goto :goto_8

    :catch_3
    move-exception p2

    goto :goto_a

    .line 89
    :catchall_7
    move-exception p3

    goto :goto_7

    .line 88
    :cond_8
    :try_start_14
    new-instance p2, Ljava/io/IOException;

    const-string p3, "\u0418\u043c\u043f\u043e\u0440\u0442 \u043e\u0442\u043c\u0435\u043d\u0451\u043d"

    invoke-direct {p2, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_4
    .catchall {:try_start_14 .. :try_end_14} :catchall_8

    .line 90
    :catchall_8
    move-exception p2

    move-object v0, v1

    :goto_8
    move-object v1, p1

    :goto_9
    move-object p1, p2

    goto :goto_11

    :catch_4
    move-exception p2

    move-object v0, v1

    :goto_a
    move-object v1, p1

    :goto_b
    move-object p1, p2

    goto :goto_f

    .line 82
    :catchall_9
    move-exception p2

    goto :goto_c

    .line 83
    :cond_9
    :try_start_15
    new-instance p2, Ljava/io/IOException;

    const-string p3, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043e\u0442\u043a\u0440\u044b\u0442\u044c \u0444\u0430\u0439\u043b"

    invoke-direct {p2, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_9

    .line 82
    :goto_c
    :try_start_16
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_a

    goto :goto_d

    :catchall_a
    move-exception p3

    :try_start_17
    invoke-virtual {p2, p3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_d
    throw p2
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_b

    :catchall_b
    move-exception p2

    if-eqz p1, :cond_a

    :try_start_18
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_c

    goto :goto_e

    :catchall_c
    move-exception p1

    :try_start_19
    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_a
    :goto_e
    throw p2
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_5
    .catchall {:try_start_19 .. :try_end_19} :catchall_d

    .line 90
    :catchall_d
    move-exception p1

    move-object v11, v1

    move-object v1, v0

    move-object v0, v11

    goto :goto_11

    :catch_5
    move-exception p1

    move-object v2, v0

    move-object v0, v1

    move-object v1, v2

    goto :goto_f

    :catchall_e
    move-exception p1

    move-object v1, v0

    goto :goto_11

    :catch_6
    move-exception p1

    move-object v1, v0

    move-object v2, v1

    :goto_f
    :try_start_1a
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_f

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_b
    if-eqz v1, :cond_c

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 91
    :cond_c
    move-object v0, p1

    :cond_d
    :goto_10
    new-instance p1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda1;

    invoke-direct {p1, p0, v0, v2}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda1;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Ljava/lang/String;[D)V

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 92
    return-void

    .line 90
    :catchall_f
    move-exception p1

    :goto_11
    if-eqz v0, :cond_e

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_e
    if-eqz v1, :cond_f

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_f
    throw p1
.end method

.method synthetic lambda$load$1$org-rabochaya-projects-LocalMapActivity(Ljava/util/List;)V
    .locals 2

    .line 13
    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->disposed:Z

    if-nez v0, :cond_0

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->features:Ljava/util/List;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    iget-wide v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-static {p0, v0, v1}, Lorg/rabochaya/projects/ProjectSession;->remember(Landroid/content/Context;J)V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->show(Z)V

    :cond_0
    return-void
.end method

.method synthetic lambda$load$2$org-rabochaya-projects-LocalMapActivity()V
    .locals 0

    .line 13
    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapActivity;->finish()V

    return-void
.end method

.method synthetic lambda$load$3$org-rabochaya-projects-LocalMapActivity(Ljava/lang/Exception;)V
    .locals 2

    .line 13
    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->disposed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043e\u0442\u043a\u0440\u044b\u0442\u044c \u043f\u0440\u043e\u0435\u043a\u0442: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->message(Ljava/lang/String;)V

    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda37;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda37;-><init>(Lorg/rabochaya/projects/LocalMapActivity;)V

    const-string v1, "\u041a \u0441\u043f\u0438\u0441\u043a\u0443"

    invoke-direct {p0, p1, v1, v0}, Lorg/rabochaya/projects/LocalMapActivity;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$load$4$org-rabochaya-projects-LocalMapActivity()V
    .locals 3

    .line 13
    new-instance v0, Lorg/rabochaya/projects/ProjectStore;

    invoke-direct {v0, p0}, Lorg/rabochaya/projects/ProjectStore;-><init>(Landroid/content/Context;)V

    :try_start_0
    iget-wide v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/rabochaya/projects/KmlProject;->features(Z)Ljava/util/List;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda26;

    invoke-direct {v2, p0, v1}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda26;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Ljava/util/List;)V

    invoke-virtual {p0, v2}, Lorg/rabochaya/projects/LocalMapActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_1
    new-instance v2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda27;

    invoke-direct {v2, p0, v1}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda27;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, v2}, Lorg/rabochaya/projects/LocalMapActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    return-void

    :goto_1
    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectStore;->close()V

    throw v1
.end method

.method synthetic lambda$longPressed$18$org-rabochaya-projects-LocalMapActivity(DD)V
    .locals 2

    .line 34
    const/4 v0, 0x2

    new-array v0, v0, [D

    const/4 v1, 0x0

    aput-wide p1, v0, v1

    const/4 p1, 0x1

    aput-wide p3, v0, p1

    iput-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->creationPoint:[D

    const/4 p1, 0x0

    const-string p2, "Point"

    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/LocalMapActivity;->editObject(Lorg/rabochaya/projects/KmlProject$Feature;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$longPressed$19$org-rabochaya-projects-LocalMapActivity(DD)V
    .locals 1

    .line 34
    const-string v0, "LineString"

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->startDrawing(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/rabochaya/projects/LocalMapView;->addDrawingPoint(DD)V

    return-void
.end method

.method synthetic lambda$longPressed$20$org-rabochaya-projects-LocalMapActivity(DD)V
    .locals 1

    .line 34
    const-string v0, "Polygon"

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->startDrawing(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0, p1, p2, p3, p4}, Lorg/rabochaya/projects/LocalMapView;->addDrawingPoint(DD)V

    return-void
.end method

.method synthetic lambda$longPressed$21$org-rabochaya-projects-LocalMapActivity(DD)V
    .locals 8

    .line 34
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->viewport()[D

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {p1, p2}, Lorg/rabochaya/projects/MapMath;->x(D)D

    move-result-wide v2

    invoke-static {p3, p4}, Lorg/rabochaya/projects/MapMath;->y(D)D

    move-result-wide v4

    const/4 p1, 0x2

    aget-wide v6, v0, p1

    invoke-virtual/range {v1 .. v7}, Lorg/rabochaya/projects/LocalMapView;->restore(DDD)V

    return-void
.end method

.method synthetic lambda$mainMenu$23$org-rabochaya-projects-LocalMapActivity()V
    .locals 1

    .line 39
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->manager(Z)V

    return-void
.end method

.method synthetic lambda$mainMenu$24$org-rabochaya-projects-LocalMapActivity()V
    .locals 0

    .line 39
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->newProject()V

    return-void
.end method

.method synthetic lambda$mainMenu$25$org-rabochaya-projects-LocalMapActivity()V
    .locals 0

    .line 39
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->display()V

    return-void
.end method

.method synthetic lambda$mainMenu$26$org-rabochaya-projects-LocalMapActivity()V
    .locals 0

    .line 39
    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapActivity;->onBackPressed()V

    return-void
.end method

.method synthetic lambda$mapsMenu$27$org-rabochaya-projects-LocalMapActivity()V
    .locals 4

    .line 41
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->canLeave()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->refreshMapOnResume:Z

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/rabochaya/projects/MapLayersActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "project"

    iget-wide v2, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0x1197

    invoke-virtual {p0, v0, v1}, Lorg/rabochaya/projects/LocalMapActivity;->startActivityForResult(Landroid/content/Intent;I)V

    :cond_0
    return-void
.end method

.method synthetic lambda$mapsMenu$28$org-rabochaya-projects-LocalMapActivity()V
    .locals 4

    .line 41
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->canLeave()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->refreshMapOnResume:Z

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/rabochaya/projects/MapCatalogActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "project"

    iget-wide v2, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0x1196

    invoke-virtual {p0, v0, v1}, Lorg/rabochaya/projects/LocalMapActivity;->startActivityForResult(Landroid/content/Intent;I)V

    :cond_0
    return-void
.end method

.method synthetic lambda$mapsMenu$29$org-rabochaya-projects-LocalMapActivity()V
    .locals 0

    .line 41
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->chooseMap()V

    return-void
.end method

.method synthetic lambda$mapsMenu$30$org-rabochaya-projects-LocalMapActivity()V
    .locals 0

    .line 41
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->onlineSettings()V

    return-void
.end method

.method synthetic lambda$mapsMenu$31$org-rabochaya-projects-LocalMapActivity()V
    .locals 0

    .line 41
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->compositionDownload()V

    return-void
.end method

.method synthetic lambda$mapsMenu$32$org-rabochaya-projects-LocalMapActivity()V
    .locals 4

    .line 41
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->canLeave()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->refreshMapOnResume:Z

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/rabochaya/projects/CacheExportActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "project"

    iget-wide v2, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$marksMenu$33$org-rabochaya-projects-LocalMapActivity()V
    .locals 0

    .line 42
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->newObject()V

    return-void
.end method

.method synthetic lambda$marksMenu$34$org-rabochaya-projects-LocalMapActivity()V
    .locals 1

    .line 42
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->manager(Z)V

    return-void
.end method

.method synthetic lambda$marksMenu$35$org-rabochaya-projects-LocalMapActivity()V
    .locals 1

    .line 42
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->fit()V

    return-void
.end method

.method synthetic lambda$newObject$66$org-rabochaya-projects-LocalMapActivity(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 99
    const-string p1, "Polygon"

    const-string v0, "LineString"

    const/4 v1, 0x3

    if-ge p2, v1, :cond_0

    const-string v1, "Point"

    filled-new-array {v1, v0, p1}, [Ljava/lang/String;

    move-result-object p1

    aget-object p1, p1, p2

    const/4 p2, 0x0

    invoke-direct {p0, p2, p1}, Lorg/rabochaya/projects/LocalMapActivity;->editObject(Lorg/rabochaya/projects/KmlProject$Feature;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    if-ne p2, v1, :cond_1

    move-object p1, v0

    :cond_1
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->startDrawing(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$newProject$42$org-rabochaya-projects-LocalMapActivity(J)V
    .locals 1

    .line 46
    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->disposed:Z

    if-nez v0, :cond_0

    invoke-static {p0, p1, p2}, Lorg/rabochaya/projects/LocalMapActivity;->open(Landroid/app/Activity;J)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapActivity;->finish()V

    :cond_0
    return-void
.end method

.method synthetic lambda$newProject$43$org-rabochaya-projects-LocalMapActivity(Ljava/lang/Exception;)V
    .locals 2

    .line 46
    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->disposed:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0441\u043e\u0437\u0434\u0430\u0442\u044c \u043f\u0440\u043e\u0435\u043a\u0442: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->error(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$newProject$44$org-rabochaya-projects-LocalMapActivity(Ljava/lang/String;)V
    .locals 2

    .line 46
    :try_start_0
    invoke-static {p0, p1}, Lorg/rabochaya/projects/ProjectSession;->create(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v0

    new-instance p1, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda16;

    invoke-direct {p1, p0, v0, v1}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda16;-><init>(Lorg/rabochaya/projects/LocalMapActivity;J)V

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    new-instance v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda17;

    invoke-direct {v0, p0, p1}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda17;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Ljava/lang/Exception;)V

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$newProject$45$org-rabochaya-projects-LocalMapActivity(Landroid/widget/EditText;Landroid/app/AlertDialog;Landroid/view/View;)V
    .locals 2

    .line 46
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x3e8

    if-le v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    iput-boolean p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    invoke-virtual {p2}, Landroid/app/AlertDialog;->dismiss()V

    iget-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance p2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda2;

    invoke-direct {p2, p0, p3}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda2;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Ljava/lang/String;)V

    invoke-interface {p1, p2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void

    :cond_1
    :goto_0
    const-string p2, "\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435: \u043e\u0442 1 \u0434\u043e 1000 \u0441\u0438\u043c\u0432\u043e\u043b\u043e\u0432"

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$newProject$46$org-rabochaya-projects-LocalMapActivity(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/content/DialogInterface;)V
    .locals 1

    .line 46
    const/4 p3, -0x1

    invoke-virtual {p1, p3}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p3

    new-instance v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda63;

    invoke-direct {v0, p0, p2, p1}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda63;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/widget/EditText;Landroid/app/AlertDialog;)V

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$onActivityResult$55$org-rabochaya-projects-LocalMapActivity(Landroid/net/Uri;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 74
    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/LocalMapActivity;->importMap(Landroid/net/Uri;Z)V

    return-void
.end method

.method synthetic lambda$onActivityResult$56$org-rabochaya-projects-LocalMapActivity(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .locals 0

    .line 74
    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->compositionFont(Landroid/view/View;)V

    return-void
.end method

.method synthetic lambda$orientationMenu$36$org-rabochaya-projects-LocalMapActivity()V
    .locals 2

    .line 43
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/rabochaya/projects/CompassActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method synthetic lambda$orientationMenu$37$org-rabochaya-projects-LocalMapActivity()V
    .locals 0

    .line 43
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->goToCoordinates()V

    return-void
.end method

.method synthetic lambda$orientationMenu$38$org-rabochaya-projects-LocalMapActivity()V
    .locals 0

    .line 43
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->coordinateOptions()V

    return-void
.end method

.method synthetic lambda$orientationMenu$39$org-rabochaya-projects-LocalMapActivity()V
    .locals 4

    .line 43
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->canLeave()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/rabochaya/projects/DemActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "project"

    iget-wide v2, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0x11fa

    invoke-virtual {p0, v0, v1}, Lorg/rabochaya/projects/LocalMapActivity;->startActivityForResult(Landroid/content/Intent;I)V

    :cond_0
    return-void
.end method

.method synthetic lambda$picked$63$org-rabochaya-projects-LocalMapActivity(Lorg/rabochaya/projects/KmlProject$Feature;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 98
    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/LocalMapActivity;->editObject(Lorg/rabochaya/projects/KmlProject$Feature;Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$picked$64$org-rabochaya-projects-LocalMapActivity(Lorg/rabochaya/projects/KmlProject$Feature;Landroid/content/DialogInterface;I)V
    .locals 2

    .line 98
    const/4 p2, 0x1

    iput-boolean p2, p0, Lorg/rabochaya/projects/LocalMapActivity;->refreshOnResume:Z

    new-instance p2, Landroid/content/Intent;

    const-class p3, Lorg/rabochaya/projects/AttachmentsActivity;

    invoke-direct {p2, p0, p3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p3, "project"

    iget-wide v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-virtual {p2, p3, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object p3

    iget-object p1, p1, Lorg/rabochaya/projects/KmlProject$Feature;->element:Lorg/w3c/dom/Element;

    const-string v0, "id"

    invoke-interface {p1, v0}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "feature"

    invoke-virtual {p3, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p2}, Lorg/rabochaya/projects/LocalMapActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method synthetic lambda$picked$65$org-rabochaya-projects-LocalMapActivity(Landroid/app/AlertDialog;Lorg/rabochaya/projects/KmlProject$Feature;Landroid/view/View;)V
    .locals 2

    .line 98
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->canLeave()Z

    move-result p3

    if-eqz p3, :cond_0

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->refreshOnResume:Z

    iget-wide v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    iget-object p1, p2, Lorg/rabochaya/projects/KmlProject$Feature;->element:Lorg/w3c/dom/Element;

    const-string p2, "id"

    invoke-interface {p1, p2}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v0, v1, p1}, Lorg/rabochaya/projects/GeometryEditorActivity;->open(Landroid/app/Activity;JLjava/lang/String;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$removeMap$62$org-rabochaya-projects-LocalMapActivity(Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 95
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->saveView()V

    iget-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {p2}, Lorg/rabochaya/projects/LocalMapView;->close()V

    const/4 p2, 0x0

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    :cond_0
    :try_start_0
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->mapFile()Ljava/io/File;

    move-result-object p2

    invoke-static {p2, p1}, Lorg/rabochaya/projects/LocalRasterStore;->remove(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->error(Ljava/lang/String;)V

    :goto_0
    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->show(Z)V

    return-void
.end method

.method synthetic lambda$search$51$org-rabochaya-projects-LocalMapActivity(Ljava/util/ArrayList;Landroid/content/DialogInterface;I)V
    .locals 0

    .line 63
    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/rabochaya/projects/KmlProject$Feature;

    iget-object p2, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {p2, p1}, Lorg/rabochaya/projects/LocalMapView;->focus(Lorg/rabochaya/projects/KmlProject$Feature;)V

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->picked(Lorg/rabochaya/projects/KmlProject$Feature;)V

    return-void
.end method

.method synthetic lambda$search$52$org-rabochaya-projects-LocalMapActivity(Landroid/widget/EditText;Landroid/app/AlertDialog;Landroid/view/View;)V
    .locals 5

    .line 63
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p3

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p3, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p2, "\u0412\u0432\u0435\u0434\u0438\u0442\u0435 \u043d\u0430\u0437\u0432\u0430\u043d\u0438\u0435"

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->features:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/KmlProject$Feature;

    iget-object v3, v2, Lorg/rabochaya/projects/KmlProject$Feature;->name:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_3

    const-string p2, "\u041e\u0431\u044a\u0435\u043a\u0442\u044b \u043d\u0435 \u043d\u0430\u0439\u0434\u0435\u043d\u044b"

    invoke-virtual {p1, p2}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    :cond_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p3, p1, [Ljava/lang/String;

    const/4 v1, 0x0

    :goto_1
    if-ge v1, p1, :cond_4

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/KmlProject$Feature;

    iget-object v2, v2, Lorg/rabochaya/projects/KmlProject$Feature;->name:Ljava/lang/String;

    aput-object v2, p3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    invoke-virtual {p2}, Landroid/app/AlertDialog;->dismiss()V

    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-direct {p1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string p2, "\u041d\u0430\u0439\u0434\u0435\u043d\u043d\u044b\u0435 \u043e\u0431\u044a\u0435\u043a\u0442\u044b"

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    new-instance p2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda3;

    invoke-direct {p2, p0, v0}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda3;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Ljava/util/ArrayList;)V

    invoke-virtual {p1, p3, p2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method synthetic lambda$search$53$org-rabochaya-projects-LocalMapActivity(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/content/DialogInterface;)V
    .locals 1

    .line 63
    const/4 p3, -0x1

    invoke-virtual {p1, p3}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object p3

    new-instance v0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda33;

    invoke-direct {v0, p0, p2, p1}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda33;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/widget/EditText;Landroid/app/AlertDialog;)V

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method synthetic lambda$show$10$org-rabochaya-projects-LocalMapActivity()V
    .locals 3

    .line 26
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    const-wide/high16 v1, -0x4010000000000000L    # -1.0

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/LocalMapView;->step(D)V

    return-void
.end method

.method synthetic lambda$show$11$org-rabochaya-projects-LocalMapActivity()V
    .locals 0

    .line 28
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->mainMenu()V

    return-void
.end method

.method synthetic lambda$show$12$org-rabochaya-projects-LocalMapActivity()V
    .locals 0

    .line 28
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->mapsMenu()V

    return-void
.end method

.method synthetic lambda$show$13$org-rabochaya-projects-LocalMapActivity()V
    .locals 0

    .line 28
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->marksMenu()V

    return-void
.end method

.method synthetic lambda$show$14$org-rabochaya-projects-LocalMapActivity()V
    .locals 1

    .line 28
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->manager(Z)V

    return-void
.end method

.method synthetic lambda$show$15$org-rabochaya-projects-LocalMapActivity()V
    .locals 0

    .line 28
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->orientationMenu()V

    return-void
.end method

.method synthetic lambda$show$16$org-rabochaya-projects-LocalMapActivity()V
    .locals 0

    .line 28
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->search()V

    return-void
.end method

.method synthetic lambda$show$17$org-rabochaya-projects-LocalMapActivity(Landroid/widget/LinearLayout;)V
    .locals 6

    .line 30
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    move v3, v0

    :goto_1
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    sub-int/2addr v4, v2

    if-ge v3, v4, :cond_2

    invoke-virtual {p1, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    if-eqz v1, :cond_1

    move v5, v0

    goto :goto_2

    :cond_1
    const/16 v5, 0x8

    :goto_2
    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_2
    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "show_tools"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method synthetic lambda$show$5$org-rabochaya-projects-LocalMapActivity(Landroid/view/View;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->coordinateOptions()V

    return-void
.end method

.method synthetic lambda$show$6$org-rabochaya-projects-LocalMapActivity()V
    .locals 4

    .line 21
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->coordinates:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    iget-object v2, p0, Lorg/rabochaya/projects/LocalMapActivity;->coordinates:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    const/16 v3, 0x8

    :goto_1
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {p0, v1}, Lorg/rabochaya/projects/LocalMapActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "show_coordinates"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method synthetic lambda$show$7$org-rabochaya-projects-LocalMapActivity(Landroid/app/AlertDialog;Landroid/content/DialogInterface;)V
    .locals 0

    .line 24
    invoke-virtual {p1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->compositionFont(Landroid/view/View;)V

    return-void
.end method

.method synthetic lambda$show$8$org-rabochaya-projects-LocalMapActivity(Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 24
    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v0, "\u0421\u043e\u0441\u0442\u0430\u0432 \u0438 \u043f\u043e\u0434\u043f\u0438\u0441\u0438 \u043a\u0430\u0440\u0442"

    invoke-virtual {p2, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    new-instance p2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda65;

    invoke-direct {p2, p0, p1}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda65;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method synthetic lambda$show$9$org-rabochaya-projects-LocalMapActivity()V
    .locals 3

    .line 26
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    const-wide/high16 v1, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/LocalMapView;->step(D)V

    return-void
.end method

.method synthetic lambda$startDrawing$67$org-rabochaya-projects-LocalMapActivity()V
    .locals 1

    .line 100
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->addDrawingCenter()V

    return-void
.end method

.method synthetic lambda$startDrawing$68$org-rabochaya-projects-LocalMapActivity()V
    .locals 1

    .line 100
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->undoDrawing()V

    return-void
.end method

.method synthetic lambda$startDrawing$69$org-rabochaya-projects-LocalMapActivity()V
    .locals 2

    .line 100
    :try_start_0
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->drawingCoordinates()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v1}, Lorg/rabochaya/projects/LocalMapView;->drawingType()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/rabochaya/projects/FeatureEdits;->coordinates(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->drawingType()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v1, v0}, Lorg/rabochaya/projects/LocalMapActivity;->editObject(Lorg/rabochaya/projects/KmlProject$Feature;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->error(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method synthetic lambda$startDrawing$70$org-rabochaya-projects-LocalMapActivity()V
    .locals 1

    .line 100
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->discardDrawing(Z)V

    return-void
.end method

.method synthetic lambda$tool$22$org-rabochaya-projects-LocalMapActivity(Ljava/lang/Runnable;)V
    .locals 1

    .line 35
    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    if-nez v0, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method public longPressed(DD)V
    .locals 15

    .line 34
    move-object v6, p0

    iget-boolean v0, v6, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static/range {p1 .. p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-static/range {p3 .. p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    const/4 v7, 0x2

    new-array v3, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v1, v3, v8

    const/4 v9, 0x1

    aput-object v2, v3, v9

    const-string v1, "%.6f, %.6f"

    invoke-static {v0, v1, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    new-instance v11, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda73;

    move-object v0, v11

    move-object v1, p0

    move-wide/from16 v2, p3

    move-wide/from16 v4, p1

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda73;-><init>(Lorg/rabochaya/projects/LocalMapActivity;DD)V

    const-string v0, "\u0421\u043e\u0437\u0434\u0430\u0442\u044c \u043c\u0435\u0442\u043a\u0443 \u0437\u0434\u0435\u0441\u044c"

    invoke-direct {p0, v0, v11}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v11

    new-instance v12, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda74;

    move-object v0, v12

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda74;-><init>(Lorg/rabochaya/projects/LocalMapActivity;DD)V

    const-string v0, "\u041d\u0430\u0447\u0430\u0442\u044c \u043c\u0430\u0440\u0448\u0440\u0443\u0442 \u0437\u0434\u0435\u0441\u044c"

    invoke-direct {p0, v0, v12}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v12

    new-instance v13, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda75;

    move-object v0, v13

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda75;-><init>(Lorg/rabochaya/projects/LocalMapActivity;DD)V

    const-string v0, "\u041d\u0430\u0447\u0430\u0442\u044c \u043e\u0431\u043b\u0430\u0441\u0442\u044c \u0437\u0434\u0435\u0441\u044c"

    invoke-direct {p0, v0, v13}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v13

    new-instance v14, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda76;

    move-object v0, v14

    invoke-direct/range {v0 .. v5}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda76;-><init>(Lorg/rabochaya/projects/LocalMapActivity;DD)V

    const-string v0, "\u0412 \u0446\u0435\u043d\u0442\u0440 \u043a\u0430\u0440\u0442\u044b"

    invoke-direct {p0, v0, v14}, Lorg/rabochaya/projects/LocalMapActivity;->item(Ljava/lang/String;Ljava/lang/Runnable;)Lorg/rabochaya/projects/WorkspaceUi$Item;

    move-result-object v0

    const/4 v1, 0x4

    new-array v1, v1, [Lorg/rabochaya/projects/WorkspaceUi$Item;

    aput-object v11, v1, v8

    aput-object v12, v1, v9

    aput-object v13, v1, v7

    const/4 v2, 0x3

    aput-object v0, v1, v2

    invoke-direct {p0, v10, v1}, Lorg/rabochaya/projects/LocalMapActivity;->menu(Ljava/lang/String;[Lorg/rabochaya/projects/WorkspaceUi$Item;)V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 4

    .line 74
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 v0, 0x11fa

    const/4 v1, 0x1

    const/4 v2, -0x1

    if-ne p1, v0, :cond_1

    if-ne p2, v2, :cond_0

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/LocalMapActivity;->show(Z)V

    :cond_0
    return-void

    :cond_1
    const/16 v0, 0x1197

    const/4 v3, 0x0

    if-ne p1, v0, :cond_3

    iput-boolean v3, p0, Lorg/rabochaya/projects/LocalMapActivity;->refreshMapOnResume:Z

    if-ne p2, v2, :cond_2

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/LocalMapActivity;->show(Z)V

    :cond_2
    return-void

    :cond_3
    const/16 v0, 0x1196

    if-ne p1, v0, :cond_8

    if-ne p2, v2, :cond_7

    if-nez p3, :cond_4

    goto :goto_0

    :cond_4
    const-string p1, "catalog_action"

    invoke-virtual {p3, p1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    :goto_0
    if-ne v3, v1, :cond_5

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->onlineSettings()V

    goto :goto_1

    :cond_5
    const/4 p1, 0x2

    if-ne v3, p1, :cond_6

    iput-boolean v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->refreshMapOnResume:Z

    new-instance p1, Landroid/content/Intent;

    const-class p2, Lorg/rabochaya/projects/CacheExportActivity;

    invoke-direct {p1, p0, p2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p2, "project"

    iget-wide v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-virtual {p1, p2, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_1

    :cond_6
    invoke-direct {p0, v1}, Lorg/rabochaya/projects/LocalMapActivity;->show(Z)V

    :cond_7
    :goto_1
    return-void

    :cond_8
    const/16 v0, 0x10ce

    if-ne p1, v0, :cond_9

    if-ne p2, v2, :cond_9

    if-eqz p3, :cond_9

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_9

    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    if-nez v0, :cond_9

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    new-instance p2, Landroid/app/AlertDialog$Builder;

    invoke-direct {p2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string p3, "\u0418\u043c\u043f\u043e\u0440\u0442 GeoTIFF"

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    const-string p3, "\u041b\u043e\u043a\u0430\u043b\u044c\u043d\u0430\u044f \u043a\u043e\u043f\u0438\u044f \u0437\u0430\u043c\u0435\u043d\u0438\u0442 \u0441\u043e\u0445\u0440\u0430\u043d\u0451\u043d\u043d\u044b\u0439 MBTiles \u044d\u0442\u043e\u0433\u043e \u043f\u0440\u043e\u0435\u043a\u0442\u0430 \u043f\u043e\u0441\u043b\u0435 \u0443\u0441\u043f\u0435\u0448\u043d\u043e\u0439 \u043f\u0440\u043e\u0432\u0435\u0440\u043a\u0438. \u041f\u043e\u043a\u0430 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0430\u043d\u044b \u043d\u0435\u0441\u0436\u0430\u0442\u044b\u0435 RGB/gray8 strips, EPSG:4326/3857, \u0431\u0435\u0437 DEM. \u0414\u043e 512 \u041c\u0438\u0411/20 000 \u0442\u0430\u0439\u043b\u043e\u0432. \u0418\u0441\u0445\u043e\u0434\u043d\u044b\u0439 \u0444\u0430\u0439\u043b \u0438 \u043e\u0431\u044a\u0435\u043a\u0442\u044b \u0441\u043e\u0445\u0440\u0430\u043d\u044f\u044e\u0442\u0441\u044f."

    invoke-virtual {p2, p3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p2

    new-instance p3, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda61;

    invoke-direct {p3, p0, p1}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda61;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/net/Uri;)V

    const-string p1, "\u0418\u043c\u043f\u043e\u0440\u0442\u0438\u0440\u043e\u0432\u0430\u0442\u044c"

    invoke-virtual {p2, p1, p3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "\u041e\u0442\u043c\u0435\u043d\u0430"

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    new-instance p2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda62;

    invoke-direct {p2, p0, p1}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda62;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void

    :cond_9
    const/16 v0, 0x10cd

    if-ne p1, v0, :cond_b

    if-ne p2, v2, :cond_b

    if-eqz p3, :cond_b

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_b

    iget-boolean p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    if-eqz p1, :cond_a

    goto :goto_2

    :cond_a
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/LocalMapActivity;->importMap(Landroid/net/Uri;)V

    :cond_b
    :goto_2
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 104
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->drawingType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->discardDrawing(Z)V

    goto :goto_0

    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    .line 8
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "project"

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->root:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->root:Landroid/widget/LinearLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->root:Landroid/widget/LinearLayout;

    const v1, -0xdcd2e3

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->root:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->setContentView(Landroid/view/View;)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const v1, -0xe3dae8

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-virtual {p0}, Lorg/rabochaya/projects/LocalMapActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    if-eqz p1, :cond_0

    const-string v0, "drawing_type"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->pendingDrawType:Ljava/lang/String;

    const-string v0, "drawing_points"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p1

    instance-of v0, p1, Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    check-cast p1, Ljava/util/ArrayList;

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity;->pendingDrawPoints:Ljava/util/ArrayList;

    :cond_0
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->load()V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 68
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->disposed:Z

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->closeDem()V

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->close()V

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->worker:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 67
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->popup:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->popup:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    :cond_0
    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->saveView()V

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/LocalMapView;->suspend(Z)V

    :cond_1
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 66
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->refreshOnResume:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    if-nez v0, :cond_0

    iput-boolean v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->refreshOnResume:Z

    iput-boolean v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->refreshMapOnResume:Z

    invoke-direct {p0}, Lorg/rabochaya/projects/LocalMapActivity;->load()V

    goto :goto_0

    :cond_0
    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->refreshMapOnResume:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    if-nez v0, :cond_1

    iput-boolean v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->refreshMapOnResume:Z

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/rabochaya/projects/LocalMapActivity;->show(Z)V

    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/LocalMapView;->suspend(Z)V

    :cond_2
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 105
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->drawingType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v0}, Lorg/rabochaya/projects/LocalMapView;->drawingType()Ljava/lang/String;

    move-result-object v0

    const-string v1, "drawing_type"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->map:Lorg/rabochaya/projects/LocalMapView;

    invoke-virtual {v1}, Lorg/rabochaya/projects/LocalMapView;->drawingPoints()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const-string v1, "drawing_points"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method public picked(Lorg/rabochaya/projects/KmlProject$Feature;)V
    .locals 8

    .line 98
    iget-boolean v0, p0, Lorg/rabochaya/projects/LocalMapActivity;->busy:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p1, Lorg/rabochaya/projects/KmlProject$Feature;->element:Lorg/w3c/dom/Element;

    invoke-static {v1}, Lorg/rabochaya/projects/MediaLinks;->note(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    iget-object v1, p1, Lorg/rabochaya/projects/KmlProject$Feature;->shapes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/KmlProject$Geometry;

    iget-object v5, v2, Lorg/rabochaya/projects/KmlProject$Geometry;->rings:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move v6, v4

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/2addr v6, v7

    goto :goto_1

    :cond_3
    iget-object v5, v2, Lorg/rabochaya/projects/KmlProject$Geometry;->type:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ": "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "Point"

    iget-object v6, v2, Lorg/rabochaya/projects/KmlProject$Geometry;->type:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v2, v2, Lorg/rabochaya/projects/KmlProject$Geometry;->rings:Ljava/util/List;

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [D

    const-string v5, "\u0428\u0438\u0440\u043e\u0442\u0430: "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-wide v6, v2, v3

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\n\u0414\u043e\u043b\u0433\u043e\u0442\u0430: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-wide v4, v2, v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n\u0412\u044b\u0441\u043e\u0442\u0430: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x2

    aget-wide v4, v2, v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " \u043c\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_4
    const-string v1, "\n\u0412\u043b\u043e\u0436\u0435\u043d\u0438\u044f: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lorg/rabochaya/projects/KmlProject$Feature;->element:Lorg/w3c/dom/Element;

    invoke-static {v2}, Lorg/rabochaya/projects/MediaLinks;->list(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x10

    invoke-direct {p0, v0, v1}, Lorg/rabochaya/projects/LocalMapActivity;->label(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v0

    const v1, -0xdcd2e3

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundColor(I)V

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v2, "\u041a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442\u044b \u0438 \u043a\u043e\u043d\u0442\u0443\u0440\u044b"

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setAllCaps(Z)V

    invoke-static {p0}, Lorg/rabochaya/projects/WorkspaceUi;->font(Landroid/app/Activity;)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setTypeface(Landroid/graphics/Typeface;)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v2, Landroid/widget/ScrollView;

    invoke-direct {v2, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v3, p1, Lorg/rabochaya/projects/KmlProject$Feature;->name:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "\u0417\u0430\u043a\u0440\u044b\u0442\u044c"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda5;

    invoke-direct {v2, p0, p1}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda5;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Lorg/rabochaya/projects/KmlProject$Feature;)V

    const-string v3, "\u0418\u0437\u043c\u0435\u043d\u0438\u0442\u044c"

    invoke-virtual {v1, v3, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda6;

    invoke-direct {v2, p0, p1}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda6;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Lorg/rabochaya/projects/KmlProject$Feature;)V

    const-string v3, "\u0412\u043b\u043e\u0436\u0435\u043d\u0438\u044f"

    invoke-virtual {v1, v3, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    new-instance v2, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda7;

    invoke-direct {v2, p0, v1, p1}, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda7;-><init>(Lorg/rabochaya/projects/LocalMapActivity;Landroid/app/AlertDialog;Lorg/rabochaya/projects/KmlProject$Feature;)V

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method public settled(DDD)V
    .locals 4

    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "view_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lorg/rabochaya/projects/LocalMapActivity;->projectId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/rabochaya/projects/LocalMapActivity;->getPreferences(I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, p2}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v1, "y"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p3, p4}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, "z"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    double-to-float p3, p5

    invoke-interface {p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method
