.class final Lorg/rabochaya/projects/ObjectDescription$Content;
.super Ljava/lang/Object;
.source "ObjectDescription.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/ObjectDescription;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Content"
.end annotation


# instance fields
.field final blocks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field note:Ljava/lang/String;

.field property:Lorg/w3c/dom/Element;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectDescription$Content;->blocks:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(Lorg/rabochaya/projects/ObjectDescription$1;)V
    .locals 0

    .line 10
    invoke-direct {p0}, Lorg/rabochaya/projects/ObjectDescription$Content;-><init>()V

    return-void
.end method
