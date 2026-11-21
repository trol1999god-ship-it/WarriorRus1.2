.class public final Lorg/rabochaya/projects/SvgPath$Segment;
.super Ljava/lang/Object;
.source "SvgPath.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/SvgPath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Segment"
.end annotation


# instance fields
.field public final command:C

.field public final values:[D


# direct methods
.method private varargs constructor <init>(C[D)V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-char p1, p0, Lorg/rabochaya/projects/SvgPath$Segment;->command:C

    iput-object p2, p0, Lorg/rabochaya/projects/SvgPath$Segment;->values:[D

    return-void
.end method

.method synthetic constructor <init>(C[DLorg/rabochaya/projects/SvgPath$1;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/SvgPath$Segment;-><init>(C[D)V

    return-void
.end method
