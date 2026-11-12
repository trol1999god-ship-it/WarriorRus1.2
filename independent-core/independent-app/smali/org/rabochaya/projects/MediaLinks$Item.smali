.class public final Lorg/rabochaya/projects/MediaLinks$Item;
.super Ljava/lang/Object;
.source "MediaLinks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/MediaLinks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Item"
.end annotation


# instance fields
.field public final href:Ljava/lang/String;

.field public final id:Ljava/lang/String;

.field public final mime:Ljava/lang/String;

.field public final name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/MediaLinks$Item;->id:Ljava/lang/String;

    iput-object p2, p0, Lorg/rabochaya/projects/MediaLinks$Item;->name:Ljava/lang/String;

    iput-object p3, p0, Lorg/rabochaya/projects/MediaLinks$Item;->href:Ljava/lang/String;

    iput-object p4, p0, Lorg/rabochaya/projects/MediaLinks$Item;->mime:Ljava/lang/String;

    return-void
.end method
