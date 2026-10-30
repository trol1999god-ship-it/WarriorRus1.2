.class public final Lorg/rabochaya/projects/KmlTimeFilter$Entry;
.super Ljava/lang/Object;
.source "KmlTimeFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/KmlTimeFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Entry"
.end annotation


# instance fields
.field private final begin:Ljava/math/BigDecimal;

.field private final end:Ljava/math/BigDecimal;

.field private final endInclusive:Z

.field public final status:I


# direct methods
.method private constructor <init>(ILjava/math/BigDecimal;Ljava/math/BigDecimal;Z)V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lorg/rabochaya/projects/KmlTimeFilter$Entry;->status:I

    iput-object p2, p0, Lorg/rabochaya/projects/KmlTimeFilter$Entry;->begin:Ljava/math/BigDecimal;

    iput-object p3, p0, Lorg/rabochaya/projects/KmlTimeFilter$Entry;->end:Ljava/math/BigDecimal;

    iput-boolean p4, p0, Lorg/rabochaya/projects/KmlTimeFilter$Entry;->endInclusive:Z

    return-void
.end method

.method synthetic constructor <init>(ILjava/math/BigDecimal;Ljava/math/BigDecimal;ZLorg/rabochaya/projects/KmlTimeFilter$1;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/rabochaya/projects/KmlTimeFilter$Entry;-><init>(ILjava/math/BigDecimal;Ljava/math/BigDecimal;Z)V

    return-void
.end method

.method static synthetic access$100(Lorg/rabochaya/projects/KmlTimeFilter$Entry;)Ljava/math/BigDecimal;
    .locals 0

    .line 30
    iget-object p0, p0, Lorg/rabochaya/projects/KmlTimeFilter$Entry;->end:Ljava/math/BigDecimal;

    return-object p0
.end method

.method static synthetic access$200(Lorg/rabochaya/projects/KmlTimeFilter$Entry;)Z
    .locals 0

    .line 30
    iget-boolean p0, p0, Lorg/rabochaya/projects/KmlTimeFilter$Entry;->endInclusive:Z

    return p0
.end method

.method static synthetic access$300(Lorg/rabochaya/projects/KmlTimeFilter$Entry;)Ljava/math/BigDecimal;
    .locals 0

    .line 30
    iget-object p0, p0, Lorg/rabochaya/projects/KmlTimeFilter$Entry;->begin:Ljava/math/BigDecimal;

    return-object p0
.end method
