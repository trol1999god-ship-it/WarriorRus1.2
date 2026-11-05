.class public final Lorg/rabochaya/projects/MapCatalog$Entry;
.super Ljava/lang/Object;
.source "MapCatalog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/MapCatalog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Entry"
.end annotation


# instance fields
.field public final group:Ljava/lang/String;

.field public final key:Ljava/lang/String;

.field public final source:Lorg/rabochaya/projects/TileSource;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/MapCatalog$Entry;->key:Ljava/lang/String;

    iput-object p2, p0, Lorg/rabochaya/projects/MapCatalog$Entry;->group:Ljava/lang/String;

    iput-object p3, p0, Lorg/rabochaya/projects/MapCatalog$Entry;->source:Lorg/rabochaya/projects/TileSource;

    return-void
.end method
