.class final Lorg/rabochaya/projects/KmlTimeFilter$Value;
.super Ljava/lang/Object;
.source "KmlTimeFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/KmlTimeFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Value"
.end annotation


# instance fields
.field final begin:Ljava/math/BigDecimal;

.field final end:Ljava/math/BigDecimal;

.field final point:Z


# direct methods
.method constructor <init>(Ljava/math/BigDecimal;Ljava/math/BigDecimal;Z)V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/KmlTimeFilter$Value;->begin:Ljava/math/BigDecimal;

    iput-object p2, p0, Lorg/rabochaya/projects/KmlTimeFilter$Value;->end:Ljava/math/BigDecimal;

    iput-boolean p3, p0, Lorg/rabochaya/projects/KmlTimeFilter$Value;->point:Z

    return-void
.end method
