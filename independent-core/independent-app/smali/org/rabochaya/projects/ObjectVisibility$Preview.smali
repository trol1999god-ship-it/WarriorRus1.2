.class public final Lorg/rabochaya/projects/ObjectVisibility$Preview;
.super Ljava/lang/Object;
.source "ObjectVisibility.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/ObjectVisibility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Preview"
.end annotation


# instance fields
.field public final changed:I

.field public final hidden:I

.field public final selected:I

.field public final selectedStillHidden:I

.field public final shown:I


# direct methods
.method constructor <init>(IIIII)V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lorg/rabochaya/projects/ObjectVisibility$Preview;->selected:I

    iput p2, p0, Lorg/rabochaya/projects/ObjectVisibility$Preview;->changed:I

    iput p3, p0, Lorg/rabochaya/projects/ObjectVisibility$Preview;->shown:I

    iput p4, p0, Lorg/rabochaya/projects/ObjectVisibility$Preview;->hidden:I

    iput p5, p0, Lorg/rabochaya/projects/ObjectVisibility$Preview;->selectedStillHidden:I

    return-void
.end method
