.class public final Lorg/rabochaya/projects/ObjectListing$Item;
.super Ljava/lang/Object;
.source "ObjectListing.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/ObjectListing;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Item"
.end annotation


# instance fields
.field private final description:Ljava/lang/String;

.field public final kind:I

.field public final order:I

.field public final path:Ljava/lang/String;

.field public final row:Lorg/rabochaya/projects/ObjectTree$Row;

.field private final search:Ljava/lang/String;

.field public final time:Lorg/rabochaya/projects/KmlTimeFilter$Entry;

.field public final visible:Z


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ObjectTree$Row;Ljava/lang/String;IZI)V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lorg/rabochaya/projects/ObjectTree$Row;->element:Lorg/w3c/dom/Element;

    invoke-static {v0}, Lorg/rabochaya/projects/KmlTimeFilter;->read(Lorg/w3c/dom/Element;)Lorg/rabochaya/projects/KmlTimeFilter$Entry;

    move-result-object v0

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectListing$Item;->time:Lorg/rabochaya/projects/KmlTimeFilter$Entry;

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectListing$Item;->row:Lorg/rabochaya/projects/ObjectTree$Row;

    iput-object p2, p0, Lorg/rabochaya/projects/ObjectListing$Item;->path:Ljava/lang/String;

    iput p3, p0, Lorg/rabochaya/projects/ObjectListing$Item;->kind:I

    iput-boolean p4, p0, Lorg/rabochaya/projects/ObjectListing$Item;->visible:Z

    iput p5, p0, Lorg/rabochaya/projects/ObjectListing$Item;->order:I

    iget-object p2, p1, Lorg/rabochaya/projects/ObjectTree$Row;->name:Ljava/lang/String;

    invoke-static {p2}, Lorg/rabochaya/projects/ObjectListing;->access$000(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lorg/rabochaya/projects/ObjectListing$Item;->search:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p1, p1, Lorg/rabochaya/projects/ObjectTree$Row;->element:Lorg/w3c/dom/Element;

    invoke-static {p1}, Lorg/rabochaya/projects/ObjectListing;->access$100(Lorg/w3c/dom/Element;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lorg/w3c/dom/Element;

    const-string p4, "description"

    invoke-static {p3, p4}, Lorg/rabochaya/projects/ObjectListing;->access$200(Lorg/w3c/dom/Element;Ljava/lang/String;)Z

    move-result p4

    if-eqz p4, :cond_0

    invoke-interface {p3}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Lorg/rabochaya/projects/ObjectListing;->descriptionText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string p4, " "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/rabochaya/projects/ObjectListing;->access$000(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectListing$Item;->description:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$300(Lorg/rabochaya/projects/ObjectListing$Item;)Ljava/lang/String;
    .locals 0

    .line 17
    iget-object p0, p0, Lorg/rabochaya/projects/ObjectListing$Item;->search:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$400(Lorg/rabochaya/projects/ObjectListing$Item;)Ljava/lang/String;
    .locals 0

    .line 17
    iget-object p0, p0, Lorg/rabochaya/projects/ObjectListing$Item;->description:Ljava/lang/String;

    return-object p0
.end method
