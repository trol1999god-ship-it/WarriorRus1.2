.class public final Lorg/rabochaya/projects/CompassActivity;
.super Landroid/app/Activity;
.source "CompassActivity.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/CompassActivity$Dial;
    }
.end annotation


# instance fields
.field private acceleration:[F

.field private accelerometer:Landroid/hardware/Sensor;

.field private accuracy:I

.field private dial:Lorg/rabochaya/projects/CompassActivity$Dial;

.field private heading:D

.field private magnetic:[F

.field private magnetometer:Landroid/hardware/Sensor;

.field private sensors:Landroid/hardware/SensorManager;

.field private status:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 4
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 5
    const-wide/high16 v0, 0x7ff8000000000000L    # Double.NaN

    iput-wide v0, p0, Lorg/rabochaya/projects/CompassActivity;->heading:D

    const/4 v0, 0x0

    iput v0, p0, Lorg/rabochaya/projects/CompassActivity;->accuracy:I

    return-void
.end method

.method static synthetic access$000(Lorg/rabochaya/projects/CompassActivity;)D
    .locals 2

    .line 4
    iget-wide v0, p0, Lorg/rabochaya/projects/CompassActivity;->heading:D

    return-wide v0
.end method


# virtual methods
.method synthetic lambda$onCreate$0$org-rabochaya-projects-CompassActivity(Landroid/view/View;)V
    .locals 0

    .line 6
    invoke-virtual {p0}, Lorg/rabochaya/projects/CompassActivity;->finish()V

    return-void
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 1

    .line 14
    invoke-virtual {p1}, Landroid/hardware/Sensor;->getType()I

    move-result p1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    iput p2, p0, Lorg/rabochaya/projects/CompassActivity;->accuracy:I

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6

    .line 6
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/16 v1, 0xc

    invoke-virtual {p1, v1, v1, v1, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const v1, -0xdcd2e3

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/CompassActivity;->setContentView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lorg/rabochaya/projects/CompassActivity;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lorg/rabochaya/projects/CompassActivity;->status:Landroid/widget/TextView;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, p0, Lorg/rabochaya/projects/CompassActivity;->status:Landroid/widget/TextView;

    const/high16 v3, 0x41a00000    # 20.0f

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextSize(F)V

    iget-object v1, p0, Lorg/rabochaya/projects/CompassActivity;->status:Landroid/widget/TextView;

    const-string v3, "\u041a\u043e\u043c\u043f\u0430\u0441 \u00b7 \u043c\u0430\u0433\u043d\u0438\u0442\u043d\u044b\u0439 \u0441\u0435\u0432\u0435\u0440"

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lorg/rabochaya/projects/CompassActivity;->status:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Lorg/rabochaya/projects/CompassActivity$Dial;

    invoke-direct {v1, p0, p0}, Lorg/rabochaya/projects/CompassActivity$Dial;-><init>(Lorg/rabochaya/projects/CompassActivity;Landroid/content/Context;)V

    iput-object v1, p0, Lorg/rabochaya/projects/CompassActivity;->dial:Lorg/rabochaya/projects/CompassActivity$Dial;

    iget-object v1, p0, Lorg/rabochaya/projects/CompassActivity;->dial:Lorg/rabochaya/projects/CompassActivity$Dial;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v3, v2, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    const-string v2, "\u0414\u0435\u0440\u0436\u0438\u0442\u0435 \u0442\u0435\u043b\u0435\u0444\u043e\u043d \u0431\u043b\u0438\u0437\u043a\u043e \u043a \u0433\u043e\u0440\u0438\u0437\u043e\u043d\u0442\u0430\u043b\u0438. \u041c\u0435\u0442\u0430\u043b\u043b \u0438 \u043c\u0430\u0433\u043d\u0438\u0442\u044b \u0438\u0441\u043a\u0430\u0436\u0430\u044e\u0442 \u043f\u043e\u043a\u0430\u0437\u0430\u043d\u0438\u044f. \u0410\u0437\u0438\u043c\u0443\u0442 \u0432\u0435\u0440\u0445\u043d\u0435\u0433\u043e \u043a\u0440\u0430\u044f \u044d\u043a\u0440\u0430\u043d\u0430 \u043e\u0442\u043d\u043e\u0441\u0438\u0442\u0441\u044f \u043a \u043c\u0430\u0433\u043d\u0438\u0442\u043d\u043e\u043c\u0443 \u0441\u0435\u0432\u0435\u0440\u0443."

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/Button;

    invoke-direct {v1, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    const-string v2, "\u041d\u0430\u0437\u0430\u0434"

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    const v2, -0xdfdfe0

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTextColor(I)V

    const v2, -0x17131d

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setBackgroundColor(I)V

    new-instance v2, Lorg/rabochaya/projects/CompassActivity$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0}, Lorg/rabochaya/projects/CompassActivity$$ExternalSyntheticLambda0;-><init>(Lorg/rabochaya/projects/CompassActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string p1, "sensor"

    invoke-virtual {p0, p1}, Lorg/rabochaya/projects/CompassActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/SensorManager;

    iput-object p1, p0, Lorg/rabochaya/projects/CompassActivity;->sensors:Landroid/hardware/SensorManager;

    iget-object p1, p0, Lorg/rabochaya/projects/CompassActivity;->sensors:Landroid/hardware/SensorManager;

    invoke-virtual {p1, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/CompassActivity;->accelerometer:Landroid/hardware/Sensor;

    iget-object p1, p0, Lorg/rabochaya/projects/CompassActivity;->sensors:Landroid/hardware/SensorManager;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/CompassActivity;->magnetometer:Landroid/hardware/Sensor;

    return-void
.end method

.method protected onPause()V
    .locals 1

    .line 8
    iget-object v0, p0, Lorg/rabochaya/projects/CompassActivity;->sensors:Landroid/hardware/SensorManager;

    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    return-void
.end method

.method protected onResume()V
    .locals 4

    .line 7
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    iget-object v0, p0, Lorg/rabochaya/projects/CompassActivity;->accelerometer:Landroid/hardware/Sensor;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/CompassActivity;->magnetometer:Landroid/hardware/Sensor;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/rabochaya/projects/CompassActivity;->sensors:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lorg/rabochaya/projects/CompassActivity;->accelerometer:Landroid/hardware/Sensor;

    const/4 v2, 0x2

    invoke-virtual {v0, p0, v1, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    move-result v0

    iget-object v1, p0, Lorg/rabochaya/projects/CompassActivity;->sensors:Landroid/hardware/SensorManager;

    iget-object v3, p0, Lorg/rabochaya/projects/CompassActivity;->magnetometer:Landroid/hardware/Sensor;

    invoke-virtual {v1, p0, v3, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    move-result v1

    if-eqz v0, :cond_1

    if-nez v1, :cond_2

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/CompassActivity;->sensors:Landroid/hardware/SensorManager;

    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    iget-object v0, p0, Lorg/rabochaya/projects/CompassActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041a\u043e\u043c\u043f\u0430\u0441 \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u0435\u043d: \u0434\u0430\u0442\u0447\u0438\u043a\u0438 \u043d\u0435 \u043e\u0442\u0432\u0435\u0447\u0430\u044e\u0442"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    return-void

    :cond_3
    :goto_0
    iget-object v0, p0, Lorg/rabochaya/projects/CompassActivity;->status:Landroid/widget/TextView;

    const-string v1, "\u041a\u043e\u043c\u043f\u0430\u0441 \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u0435\u043d: \u043d\u0435\u0442 \u043c\u0430\u0433\u043d\u0438\u0442\u043d\u043e\u0433\u043e \u0434\u0430\u0442\u0447\u0438\u043a\u0430 \u0438\u043b\u0438 \u0430\u043a\u0441\u0435\u043b\u0435\u0440\u043e\u043c\u0435\u0442\u0440\u0430"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 7

    .line 9
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    invoke-virtual {p1}, [F->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [F

    iput-object p1, p0, Lorg/rabochaya/projects/CompassActivity;->acceleration:[F

    goto :goto_0

    :cond_0
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    if-ne v0, v1, :cond_3

    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    invoke-virtual {v0}, [F->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    iput-object v0, p0, Lorg/rabochaya/projects/CompassActivity;->magnetic:[F

    iget p1, p1, Landroid/hardware/SensorEvent;->accuracy:I

    iput p1, p0, Lorg/rabochaya/projects/CompassActivity;->accuracy:I

    .line 10
    :goto_0
    iget-object p1, p0, Lorg/rabochaya/projects/CompassActivity;->acceleration:[F

    iget-object v0, p0, Lorg/rabochaya/projects/CompassActivity;->magnetic:[F

    invoke-virtual {p0}, Lorg/rabochaya/projects/CompassActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v3

    invoke-interface {v3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Display;->getRotation()I

    move-result v3

    invoke-static {p1, v0, v3}, Lorg/rabochaya/projects/CompassMath;->heading([F[FI)D

    move-result-wide v3

    .line 11
    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/CompassActivity;->status:Landroid/widget/TextView;

    const-string v0, "\u041a\u043e\u043c\u043f\u0430\u0441 \u00b7 \u043e\u0436\u0438\u0434\u0430\u044e\u0442\u0441\u044f \u0434\u0430\u043d\u043d\u044b\u0435; \u0434\u0435\u0440\u0436\u0438\u0442\u0435 \u0442\u0435\u043b\u0435\u0444\u043e\u043d \u0433\u043e\u0440\u0438\u0437\u043e\u043d\u0442\u0430\u043b\u044c\u043d\u043e"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 12
    :cond_1
    iget-wide v5, p0, Lorg/rabochaya/projects/CompassActivity;->heading:D

    invoke-static {v5, v6, v3, v4}, Lorg/rabochaya/projects/CompassMath;->smooth(DD)D

    move-result-wide v3

    iput-wide v3, p0, Lorg/rabochaya/projects/CompassActivity;->heading:D

    iget-object p1, p0, Lorg/rabochaya/projects/CompassActivity;->status:Landroid/widget/TextView;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-array v1, v1, [Ljava/lang/Object;

    iget-wide v3, p0, Lorg/rabochaya/projects/CompassActivity;->heading:D

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v1, v4

    iget v3, p0, Lorg/rabochaya/projects/CompassActivity;->accuracy:I

    if-nez v3, :cond_2

    const-string v3, " \u00b7 \u043d\u0443\u0436\u043d\u0430 \u043a\u0430\u043b\u0438\u0431\u0440\u043e\u0432\u043a\u0430"

    goto :goto_1

    :cond_2
    const-string v3, ""

    :goto_1
    aput-object v3, v1, v2

    const-string v3, "\u041c\u0430\u0433\u043d\u0438\u0442\u043d\u044b\u0439 \u0430\u0437\u0438\u043c\u0443\u0442: %03.0f\u00b0%s"

    invoke-static {v0, v3, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lorg/rabochaya/projects/CompassActivity;->dial:Lorg/rabochaya/projects/CompassActivity$Dial;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-wide v5, p0, Lorg/rabochaya/projects/CompassActivity;->heading:D

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v1, v2, v4

    const-string v1, "\u041c\u0430\u0433\u043d\u0438\u0442\u043d\u044b\u0439 \u0430\u0437\u0438\u043c\u0443\u0442 %.0f \u0433\u0440\u0430\u0434\u0443\u0441\u043e\u0432"

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/rabochaya/projects/CompassActivity$Dial;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lorg/rabochaya/projects/CompassActivity;->dial:Lorg/rabochaya/projects/CompassActivity$Dial;

    invoke-virtual {p1}, Lorg/rabochaya/projects/CompassActivity$Dial;->invalidate()V

    .line 13
    return-void

    .line 9
    :cond_3
    return-void
.end method
