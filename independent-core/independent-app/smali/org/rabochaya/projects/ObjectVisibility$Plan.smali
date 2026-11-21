.class final Lorg/rabochaya/projects/ObjectVisibility$Plan;
.super Ljava/lang/Object;
.source "ObjectVisibility.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/ObjectVisibility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Plan"
.end annotation


# instance fields
.field final changes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/w3c/dom/Element;",
            ">;"
        }
    .end annotation
.end field

.field final preview:Lorg/rabochaya/projects/ObjectVisibility$Preview;


# direct methods
.method constructor <init>(Ljava/util/List;Lorg/rabochaya/projects/ObjectVisibility$Preview;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/w3c/dom/Element;",
            ">;",
            "Lorg/rabochaya/projects/ObjectVisibility$Preview;",
            ")V"
        }
    .end annotation

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectVisibility$Plan;->changes:Ljava/util/List;

    iput-object p2, p0, Lorg/rabochaya/projects/ObjectVisibility$Plan;->preview:Lorg/rabochaya/projects/ObjectVisibility$Preview;

    return-void
.end method
