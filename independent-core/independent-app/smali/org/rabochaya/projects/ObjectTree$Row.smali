.class public final Lorg/rabochaya/projects/ObjectTree$Row;
.super Ljava/lang/Object;
.source "ObjectTree.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/ObjectTree;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Row"
.end annotation


# instance fields
.field public final depth:I

.field final element:Lorg/w3c/dom/Element;

.field public final folder:Z

.field public final key:Ljava/lang/String;

.field public final name:Ljava/lang/String;

.field public final parent:Ljava/lang/String;

.field public final type:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/w3c/dom/Element;I)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lorg/rabochaya/projects/ObjectTree$Row;->element:Lorg/w3c/dom/Element;

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectTree$Row;->key:Ljava/lang/String;

    iput-object p2, p0, Lorg/rabochaya/projects/ObjectTree$Row;->parent:Ljava/lang/String;

    iput p4, p0, Lorg/rabochaya/projects/ObjectTree$Row;->depth:I

    invoke-static {p3}, Lorg/rabochaya/projects/ObjectTree;->access$000(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectTree$Row;->type:Ljava/lang/String;

    invoke-static {p3}, Lorg/rabochaya/projects/ObjectTree;->access$100(Lorg/w3c/dom/Element;)Z

    move-result p1

    iput-boolean p1, p0, Lorg/rabochaya/projects/ObjectTree$Row;->folder:Z

    const-string p1, "name"

    invoke-static {p3, p1}, Lorg/rabochaya/projects/ObjectTree;->access$200(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_0

    const-string p1, "\u0411\u0435\u0437 \u043d\u0430\u0437\u0432\u0430\u043d\u0438\u044f"

    :cond_0
    iput-object p1, p0, Lorg/rabochaya/projects/ObjectTree$Row;->name:Ljava/lang/String;

    return-void
.end method
