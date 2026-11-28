.class public final Lorg/rabochaya/projects/MapCompositionPresets$Entry;
.super Ljava/lang/Object;
.source "MapCompositionPresets.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/MapCompositionPresets;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Entry"
.end annotation


# instance fields
.field public final composition:Lorg/rabochaya/projects/MapComposition;

.field public final name:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Lorg/rabochaya/projects/MapComposition;)V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/MapCompositionPresets$Entry;->name:Ljava/lang/String;

    iput-object p2, p0, Lorg/rabochaya/projects/MapCompositionPresets$Entry;->composition:Lorg/rabochaya/projects/MapComposition;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lorg/rabochaya/projects/MapComposition;Lorg/rabochaya/projects/MapCompositionPresets$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/MapCompositionPresets$Entry;-><init>(Ljava/lang/String;Lorg/rabochaya/projects/MapComposition;)V

    return-void
.end method
