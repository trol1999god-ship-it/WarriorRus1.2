.class public final Lorg/rabochaya/projects/SvgIcon$Shape;
.super Ljava/lang/Object;
.source "SvgIcon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/SvgIcon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Shape"
.end annotation


# instance fields
.field public final evenOdd:Z

.field public final fill:Ljava/lang/Integer;

.field public final path:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/SvgPath$Segment;",
            ">;"
        }
    .end annotation
.end field

.field public final stroke:Ljava/lang/Integer;

.field public final strokeWidth:D


# direct methods
.method private constructor <init>(Ljava/util/List;Lorg/rabochaya/projects/SvgIcon$Paint;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/SvgPath$Segment;",
            ">;",
            "Lorg/rabochaya/projects/SvgIcon$Paint;",
            ")V"
        }
    .end annotation

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/SvgIcon$Shape;->path:Ljava/util/List;

    iget-object p1, p2, Lorg/rabochaya/projects/SvgIcon$Paint;->fill:Ljava/lang/Integer;

    iput-object p1, p0, Lorg/rabochaya/projects/SvgIcon$Shape;->fill:Ljava/lang/Integer;

    iget-object p1, p2, Lorg/rabochaya/projects/SvgIcon$Paint;->stroke:Ljava/lang/Integer;

    iput-object p1, p0, Lorg/rabochaya/projects/SvgIcon$Shape;->stroke:Ljava/lang/Integer;

    iget-wide v0, p2, Lorg/rabochaya/projects/SvgIcon$Paint;->width:D

    iput-wide v0, p0, Lorg/rabochaya/projects/SvgIcon$Shape;->strokeWidth:D

    iget-boolean p1, p2, Lorg/rabochaya/projects/SvgIcon$Paint;->evenOdd:Z

    iput-boolean p1, p0, Lorg/rabochaya/projects/SvgIcon$Shape;->evenOdd:Z

    return-void
.end method

.method synthetic constructor <init>(Ljava/util/List;Lorg/rabochaya/projects/SvgIcon$Paint;Lorg/rabochaya/projects/SvgIcon$1;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/SvgIcon$Shape;-><init>(Ljava/util/List;Lorg/rabochaya/projects/SvgIcon$Paint;)V

    return-void
.end method
