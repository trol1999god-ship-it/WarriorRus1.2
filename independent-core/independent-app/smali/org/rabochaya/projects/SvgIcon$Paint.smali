.class final Lorg/rabochaya/projects/SvgIcon$Paint;
.super Ljava/lang/Object;
.source "SvgIcon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/SvgIcon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Paint"
.end annotation


# instance fields
.field evenOdd:Z

.field fill:Ljava/lang/Integer;

.field stroke:Ljava/lang/Integer;

.field width:D


# direct methods
.method constructor <init>()V
    .locals 2

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, -0x1000000

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/SvgIcon$Paint;->fill:Ljava/lang/Integer;

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/SvgIcon$Paint;->stroke:Ljava/lang/Integer;

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    iput-wide v0, p0, Lorg/rabochaya/projects/SvgIcon$Paint;->width:D

    return-void
.end method

.method constructor <init>(Lorg/rabochaya/projects/SvgIcon$Paint;)V
    .locals 2

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, -0x1000000

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/SvgIcon$Paint;->fill:Ljava/lang/Integer;

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/rabochaya/projects/SvgIcon$Paint;->stroke:Ljava/lang/Integer;

    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    iput-wide v0, p0, Lorg/rabochaya/projects/SvgIcon$Paint;->width:D

    iget-object v0, p1, Lorg/rabochaya/projects/SvgIcon$Paint;->fill:Ljava/lang/Integer;

    iput-object v0, p0, Lorg/rabochaya/projects/SvgIcon$Paint;->fill:Ljava/lang/Integer;

    iget-object v0, p1, Lorg/rabochaya/projects/SvgIcon$Paint;->stroke:Ljava/lang/Integer;

    iput-object v0, p0, Lorg/rabochaya/projects/SvgIcon$Paint;->stroke:Ljava/lang/Integer;

    iget-wide v0, p1, Lorg/rabochaya/projects/SvgIcon$Paint;->width:D

    iput-wide v0, p0, Lorg/rabochaya/projects/SvgIcon$Paint;->width:D

    iget-boolean p1, p1, Lorg/rabochaya/projects/SvgIcon$Paint;->evenOdd:Z

    iput-boolean p1, p0, Lorg/rabochaya/projects/SvgIcon$Paint;->evenOdd:Z

    return-void
.end method
