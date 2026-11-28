.class public final Lorg/rabochaya/projects/GeometryEdits$Part;
.super Ljava/lang/Object;
.source "GeometryEdits.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/GeometryEdits;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Part"
.end annotation


# instance fields
.field public final hole:Z

.field public final key:Ljava/lang/String;

.field public final name:Ljava/lang/String;

.field public final polygon:Z

.field public final text:Ljava/lang/String;

.field public final token:Ljava/lang/String;

.field public final type:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lorg/rabochaya/projects/GeometryEdits$Target;Ljava/lang/String;)V
    .locals 2

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iget-object v0, p1, Lorg/rabochaya/projects/GeometryEdits$Target;->key:Ljava/lang/String;

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEdits$Part;->key:Ljava/lang/String;

    .line 20
    iget-object v0, p1, Lorg/rabochaya/projects/GeometryEdits$Target;->name:Ljava/lang/String;

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEdits$Part;->name:Ljava/lang/String;

    .line 21
    iget-object v0, p1, Lorg/rabochaya/projects/GeometryEdits$Target;->type:Ljava/lang/String;

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    .line 22
    iget-object v0, p1, Lorg/rabochaya/projects/GeometryEdits$Target;->coordinates:Lorg/w3c/dom/Element;

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryEdits$Part;->type:Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/rabochaya/projects/GeometryEdits;->access$000(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryEdits$Part;->text:Ljava/lang/String;

    .line 23
    iput-object p2, p0, Lorg/rabochaya/projects/GeometryEdits$Part;->token:Ljava/lang/String;

    .line 24
    iget-boolean p2, p1, Lorg/rabochaya/projects/GeometryEdits$Target;->hole:Z

    iput-boolean p2, p0, Lorg/rabochaya/projects/GeometryEdits$Part;->hole:Z

    .line 25
    iget-object p1, p1, Lorg/rabochaya/projects/GeometryEdits$Target;->polygon:Lorg/w3c/dom/Element;

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lorg/rabochaya/projects/GeometryEdits$Part;->polygon:Z

    .line 26
    return-void
.end method

.method synthetic constructor <init>(Lorg/rabochaya/projects/GeometryEdits$Target;Ljava/lang/String;Lorg/rabochaya/projects/GeometryEdits$1;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Lorg/rabochaya/projects/GeometryEdits$Part;-><init>(Lorg/rabochaya/projects/GeometryEdits$Target;Ljava/lang/String;)V

    return-void
.end method
