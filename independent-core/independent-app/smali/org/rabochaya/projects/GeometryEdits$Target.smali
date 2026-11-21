.class final Lorg/rabochaya/projects/GeometryEdits$Target;
.super Ljava/lang/Object;
.source "GeometryEdits.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/GeometryEdits;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Target"
.end annotation


# instance fields
.field boundary:Lorg/w3c/dom/Element;

.field coordinates:Lorg/w3c/dom/Element;

.field hole:Z

.field key:Ljava/lang/String;

.field name:Ljava/lang/String;

.field polygon:Lorg/w3c/dom/Element;

.field type:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/w3c/dom/Element;Lorg/w3c/dom/Element;Lorg/w3c/dom/Element;Z)V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->key:Ljava/lang/String;

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->name:Ljava/lang/String;

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->type:Ljava/lang/String;

    iput-object p4, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->coordinates:Lorg/w3c/dom/Element;

    .line 35
    iput-object p5, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->polygon:Lorg/w3c/dom/Element;

    iput-object p6, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->boundary:Lorg/w3c/dom/Element;

    iput-boolean p7, p0, Lorg/rabochaya/projects/GeometryEdits$Target;->hole:Z

    .line 36
    return-void
.end method
