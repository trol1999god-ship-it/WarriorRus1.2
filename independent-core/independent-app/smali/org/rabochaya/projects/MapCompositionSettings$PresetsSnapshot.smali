.class public final Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;
.super Ljava/lang/Object;
.source "MapCompositionSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/MapCompositionSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PresetsSnapshot"
.end annotation


# instance fields
.field public final presets:Lorg/rabochaya/projects/MapCompositionPresets;

.field private final raw:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lorg/rabochaya/projects/MapCompositionPresets;Ljava/lang/String;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;->presets:Lorg/rabochaya/projects/MapCompositionPresets;

    iput-object p2, p0, Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;->raw:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lorg/rabochaya/projects/MapCompositionPresets;Ljava/lang/String;Lorg/rabochaya/projects/MapCompositionSettings$1;)V
    .locals 0

    .line 13
    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;-><init>(Lorg/rabochaya/projects/MapCompositionPresets;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;)Ljava/lang/String;
    .locals 0

    .line 13
    iget-object p0, p0, Lorg/rabochaya/projects/MapCompositionSettings$PresetsSnapshot;->raw:Ljava/lang/String;

    return-object p0
.end method
