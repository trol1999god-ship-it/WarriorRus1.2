.class final Lorg/rabochaya/projects/GeometryMapState$Snapshot;
.super Ljava/lang/Object;
.source "GeometryMapState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/GeometryMapState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Snapshot"
.end annotation


# instance fields
.field final selected:I

.field final text:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryMapState$Snapshot;->text:Ljava/lang/String;

    iput p2, p0, Lorg/rabochaya/projects/GeometryMapState$Snapshot;->selected:I

    return-void
.end method
