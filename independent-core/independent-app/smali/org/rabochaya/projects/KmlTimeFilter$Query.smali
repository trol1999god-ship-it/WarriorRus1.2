.class public final Lorg/rabochaya/projects/KmlTimeFilter$Query;
.super Ljava/lang/Object;
.source "KmlTimeFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/KmlTimeFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Query"
.end annotation


# instance fields
.field private final begin:Ljava/math/BigDecimal;

.field private final end:Ljava/math/BigDecimal;

.field public final from:Ljava/lang/String;

.field public final mode:I

.field public final to:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    if-ltz p1, :cond_8

    sget-object v0, Lorg/rabochaya/projects/KmlTimeFilter;->MODES:[Ljava/lang/String;

    array-length v0, v0

    if-ge p1, v0, :cond_8

    if-eqz p2, :cond_8

    if-eqz p3, :cond_8

    .line 17
    iput p1, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->mode:I

    const-string v0, ""

    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    move-object p2, v0

    :goto_0
    iput-object p2, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->from:Ljava/lang/String;

    if-ne p1, v1, :cond_1

    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :cond_1
    iput-object v0, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->to:Ljava/lang/String;

    .line 18
    iget-object p2, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->from:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    const/4 p3, 0x0

    if-eqz p2, :cond_2

    move-object p2, p3

    goto :goto_1

    :cond_2
    iget-object p2, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->from:Ljava/lang/String;

    invoke-static {p2}, Lorg/rabochaya/projects/KmlTimeFilter;->access$000(Ljava/lang/String;)Lorg/rabochaya/projects/KmlTimeFilter$Value;

    move-result-object p2

    iget-object p2, p2, Lorg/rabochaya/projects/KmlTimeFilter$Value;->begin:Ljava/math/BigDecimal;

    :goto_1
    iput-object p2, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->begin:Ljava/math/BigDecimal;

    iget-object p2, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->to:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_3

    goto :goto_2

    :cond_3
    iget-object p2, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->to:Ljava/lang/String;

    invoke-static {p2}, Lorg/rabochaya/projects/KmlTimeFilter;->access$000(Ljava/lang/String;)Lorg/rabochaya/projects/KmlTimeFilter$Value;

    move-result-object p2

    iget-object p3, p2, Lorg/rabochaya/projects/KmlTimeFilter$Value;->end:Ljava/math/BigDecimal;

    :goto_2
    iput-object p3, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->end:Ljava/math/BigDecimal;

    .line 19
    if-ne p1, v1, :cond_5

    iget-object p1, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->begin:Ljava/math/BigDecimal;

    if-nez p1, :cond_5

    iget-object p1, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->end:Ljava/math/BigDecimal;

    if-eqz p1, :cond_4

    goto :goto_3

    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u0423\u043a\u0430\u0436\u0438\u0442\u0435 \u0445\u043e\u0442\u044f \u0431\u044b \u043e\u0434\u043d\u0443 \u0433\u0440\u0430\u043d\u0438\u0446\u0443 \u043f\u0435\u0440\u0438\u043e\u0434\u0430"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 20
    :cond_5
    :goto_3
    iget-object p1, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->begin:Ljava/math/BigDecimal;

    if-eqz p1, :cond_7

    iget-object p1, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->end:Ljava/math/BigDecimal;

    if-eqz p1, :cond_7

    iget-object p1, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->begin:Ljava/math/BigDecimal;

    iget-object p2, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->end:Ljava/math/BigDecimal;

    invoke-virtual {p1, p2}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result p1

    if-gez p1, :cond_6

    goto :goto_4

    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041d\u0430\u0447\u0430\u043b\u043e \u043f\u0435\u0440\u0438\u043e\u0434\u0430 \u043f\u043e\u0437\u0436\u0435 \u043a\u043e\u043d\u0446\u0430"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 21
    :cond_7
    :goto_4
    return-void

    .line 16
    :cond_8
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0439 \u0444\u0438\u043b\u044c\u0442\u0440 \u0434\u0430\u0442"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static defaults()Lorg/rabochaya/projects/KmlTimeFilter$Query;
    .locals 3

    .line 22
    new-instance v0, Lorg/rabochaya/projects/KmlTimeFilter$Query;

    const/4 v1, 0x0

    const-string v2, ""

    invoke-direct {v0, v1, v2, v2}, Lorg/rabochaya/projects/KmlTimeFilter$Query;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public matches(Lorg/rabochaya/projects/KmlTimeFilter$Entry;)Z
    .locals 4

    .line 24
    iget v0, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->mode:I

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget v0, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->mode:I

    const/4 v2, 0x0

    if-ne v0, v1, :cond_2

    iget p1, p1, Lorg/rabochaya/projects/KmlTimeFilter$Entry;->status:I

    if-ne p1, v1, :cond_1

    goto :goto_0

    :cond_1
    move v1, v2

    :goto_0
    return v1

    :cond_2
    iget v0, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->mode:I

    const/4 v3, 0x3

    if-ne v0, v3, :cond_4

    iget p1, p1, Lorg/rabochaya/projects/KmlTimeFilter$Entry;->status:I

    if-nez p1, :cond_3

    goto :goto_1

    :cond_3
    move v1, v2

    :goto_1
    return v1

    :cond_4
    iget v0, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->mode:I

    const/4 v3, 0x4

    if-ne v0, v3, :cond_6

    iget p1, p1, Lorg/rabochaya/projects/KmlTimeFilter$Entry;->status:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_5

    goto :goto_2

    :cond_5
    move v1, v2

    :goto_2
    return v1

    .line 25
    :cond_6
    iget v0, p1, Lorg/rabochaya/projects/KmlTimeFilter$Entry;->status:I

    if-eq v0, v1, :cond_7

    return v2

    .line 26
    :cond_7
    iget-object v0, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->begin:Ljava/math/BigDecimal;

    if-eqz v0, :cond_9

    invoke-static {p1}, Lorg/rabochaya/projects/KmlTimeFilter$Entry;->access$100(Lorg/rabochaya/projects/KmlTimeFilter$Entry;)Ljava/math/BigDecimal;

    move-result-object v0

    if-eqz v0, :cond_9

    invoke-static {p1}, Lorg/rabochaya/projects/KmlTimeFilter$Entry;->access$100(Lorg/rabochaya/projects/KmlTimeFilter$Entry;)Ljava/math/BigDecimal;

    move-result-object v0

    iget-object v3, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->begin:Ljava/math/BigDecimal;

    invoke-virtual {v0, v3}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v0

    if-ltz v0, :cond_8

    if-nez v0, :cond_9

    invoke-static {p1}, Lorg/rabochaya/projects/KmlTimeFilter$Entry;->access$200(Lorg/rabochaya/projects/KmlTimeFilter$Entry;)Z

    move-result v0

    if-nez v0, :cond_9

    :cond_8
    return v2

    .line 27
    :cond_9
    iget-object v0, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->end:Ljava/math/BigDecimal;

    if-eqz v0, :cond_b

    invoke-static {p1}, Lorg/rabochaya/projects/KmlTimeFilter$Entry;->access$300(Lorg/rabochaya/projects/KmlTimeFilter$Entry;)Ljava/math/BigDecimal;

    move-result-object v0

    if-eqz v0, :cond_b

    invoke-static {p1}, Lorg/rabochaya/projects/KmlTimeFilter$Entry;->access$300(Lorg/rabochaya/projects/KmlTimeFilter$Entry;)Ljava/math/BigDecimal;

    move-result-object p1

    iget-object v0, p0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->end:Ljava/math/BigDecimal;

    invoke-virtual {p1, v0}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result p1

    if-gez p1, :cond_a

    goto :goto_3

    :cond_a
    move v1, v2

    :cond_b
    :goto_3
    return v1
.end method
