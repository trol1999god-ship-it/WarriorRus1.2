.class final Lorg/rabochaya/projects/ObjectTreeWrites$EditResult;
.super Ljava/lang/Object;
.source "ObjectTreeWrites.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/ObjectTreeWrites;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "EditResult"
.end annotation


# instance fields
.field final folder:Ljava/lang/String;

.field final project:Lorg/rabochaya/projects/KmlProject;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/KmlProject;Ljava/lang/String;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lorg/rabochaya/projects/ObjectTreeWrites$EditResult;->project:Lorg/rabochaya/projects/KmlProject;

    .line 13
    iput-object p2, p0, Lorg/rabochaya/projects/ObjectTreeWrites$EditResult;->folder:Ljava/lang/String;

    .line 14
    return-void
.end method
