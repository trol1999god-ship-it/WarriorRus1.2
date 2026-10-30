.class public final Lorg/rabochaya/projects/DocumentRouter;
.super Ljava/lang/Object;
.source "DocumentRouter.java"


# static fields
.field private static final pending:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/app/Activity;",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 12
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lorg/rabochaya/projects/DocumentRouter;->pending:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addManagerButton(Landroid/widget/LinearLayout;)V
    .locals 4

    .line 35
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/widget/Button;

    invoke-direct {v1, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v2, "KML/KMZ"

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextColor(I)V

    const v3, -0xc8bcd7

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 36
    new-instance v3, Lorg/rabochaya/projects/DocumentRouter$1;

    invoke-direct {v3, v0}, Lorg/rabochaya/projects/DocumentRouter$1;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v0, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    return-void
.end method

.method public static capture(Landroid/app/Activity;)V
    .locals 3

    .line 22
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 23
    invoke-static {v0}, Lorg/rabochaya/projects/DocumentRouter;->supports(Landroid/content/Intent;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 24
    sget-object v1, Lorg/rabochaya/projects/DocumentRouter;->pending:Ljava/util/Map;

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-interface {v1, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    .line 27
    :cond_0
    return-void
.end method

.method private static open(Landroid/app/Activity;Landroid/content/Intent;)V
    .locals 3

    .line 31
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/rabochaya/projects/ProjectsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 32
    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    move-result p1

    and-int/lit8 p1, p1, 0x1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 33
    return-void
.end method

.method public static openPending(Landroid/app/Activity;)V
    .locals 1

    .line 28
    sget-object v0, Lorg/rabochaya/projects/DocumentRouter;->pending:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    if-eqz v0, :cond_0

    invoke-static {p0, v0}, Lorg/rabochaya/projects/DocumentRouter;->open(Landroid/app/Activity;Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public static receive(Landroid/app/Activity;Landroid/content/Intent;)Z
    .locals 1

    .line 29
    invoke-static {p1}, Lorg/rabochaya/projects/DocumentRouter;->supports(Landroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-static {p0, p1}, Lorg/rabochaya/projects/DocumentRouter;->open(Landroid/app/Activity;Landroid/content/Intent;)V

    const/4 p0, 0x1

    return p0
.end method

.method public static supports(Landroid/content/Intent;)Z
    .locals 4

    .line 14
    const/4 v0, 0x0

    if-eqz p0, :cond_6

    invoke-virtual {p0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_2

    .line 15
    :cond_0
    invoke-virtual {p0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    .line 16
    const-string v3, "content"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, "file"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    return v0

    .line 17
    :cond_1
    invoke-virtual {v1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    if-nez v1, :cond_2

    move-object v1, v2

    goto :goto_0

    :cond_2
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 18
    :goto_0
    invoke-virtual {p0}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_3

    goto :goto_1

    :cond_3
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    .line 19
    :goto_1
    const-string p0, ".kml"

    invoke-virtual {v1, p0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_4

    const-string p0, ".kmz"

    invoke-virtual {v1, p0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_4

    const-string p0, "application/vnd.google-earth.kml+xml"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    const-string p0, "application/vnd.google-earth.kmz"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    const-string p0, "application/kml"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_4

    const-string p0, "application/kmz"

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5

    :cond_4
    const/4 v0, 0x1

    :cond_5
    return v0

    .line 14
    :cond_6
    :goto_2
    return v0
.end method
