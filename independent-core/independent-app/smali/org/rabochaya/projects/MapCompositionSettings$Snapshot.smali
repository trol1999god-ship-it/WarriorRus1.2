.class public final Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;
.super Ljava/lang/Object;
.source "MapCompositionSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/MapCompositionSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Snapshot"
.end annotation


# instance fields
.field public final composition:Lorg/rabochaya/projects/MapComposition;

.field public final enabled:Z

.field private final raw:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lorg/rabochaya/projects/MapComposition;ZLjava/lang/String;)V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->composition:Lorg/rabochaya/projects/MapComposition;

    iput-boolean p2, p0, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->enabled:Z

    iput-object p3, p0, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->raw:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lorg/rabochaya/projects/MapComposition;ZLjava/lang/String;Lorg/rabochaya/projects/MapCompositionSettings$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;-><init>(Lorg/rabochaya/projects/MapComposition;ZLjava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;)Ljava/lang/String;
    .locals 0

    .line 7
    iget-object p0, p0, Lorg/rabochaya/projects/MapCompositionSettings$Snapshot;->raw:Ljava/lang/String;

    return-object p0
.end method
