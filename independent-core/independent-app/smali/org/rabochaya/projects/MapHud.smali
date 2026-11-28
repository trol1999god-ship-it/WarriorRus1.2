.class final Lorg/rabochaya/projects/MapHud;
.super Ljava/lang/Object;
.source "MapHud.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/MapHud$Glyph;
    }
.end annotation


# static fields
.field private static final ACCENT:I = -0x7e3a0e

.field private static final EDGE:I = -0xa47959

.field static final INK:I = -0x150a01

.field static final SURFACE:I = -0xde5cbb5


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static button(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/ImageButton;
    .locals 4

    .line 36
    new-instance v0, Landroid/widget/ImageButton;

    invoke-direct {v0, p0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 37
    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 38
    new-instance v1, Lorg/rabochaya/projects/MapHud$Glyph;

    invoke-direct {v1, p1}, Lorg/rabochaya/projects/MapHud$Glyph;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 39
    invoke-virtual {v0, p2}, Landroid/widget/ImageButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 40
    new-instance p1, Landroid/graphics/drawable/RippleDrawable;

    const v1, 0x4081c5f2

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-static {p0}, Lorg/rabochaya/projects/MapHud;->panel(Landroid/app/Activity;)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {p1, v1, v2, v3}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 41
    const/high16 p1, 0x41200000    # 10.0f

    invoke-static {p0, p1}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result p1

    .line 42
    invoke-virtual {v0, p1, p1, p1, p1}, Landroid/widget/ImageButton;->setPadding(IIII)V

    .line 43
    new-instance p1, Lorg/rabochaya/projects/MapHud$$ExternalSyntheticLambda0;

    invoke-direct {p1, p3}, Lorg/rabochaya/projects/MapHud$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 44
    new-instance p1, Lorg/rabochaya/projects/MapHud$$ExternalSyntheticLambda1;

    invoke-direct {p1, p0, p2}, Lorg/rabochaya/projects/MapHud$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 48
    return-object v0
.end method

.method static synthetic lambda$button$0(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 43
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$button$1(Landroid/app/Activity;Ljava/lang/String;Landroid/view/View;)Z
    .locals 0

    .line 45
    const/4 p2, 0x0

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 46
    const/4 p0, 0x1

    return p0
.end method

.method static panel(Landroid/app/Activity;)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 28
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 29
    const v1, -0xde5cbb5

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 30
    const/high16 v1, 0x40c00000    # 6.0f

    invoke-static {p0, v1}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 31
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {p0, v1}, Lorg/rabochaya/projects/WorkspaceUi;->dp(Landroid/app/Activity;F)I

    move-result p0

    const v1, -0xa47959    # -2.9180009E38f

    invoke-virtual {v0, p0, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 32
    return-object v0
.end method
