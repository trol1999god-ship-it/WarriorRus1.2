.class Lorg/rabochaya/projects/ObjectListing$1;
.super Ljava/lang/Object;
.source "ObjectListing.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ObjectListing;->select(Ljava/lang/String;Lorg/rabochaya/projects/ObjectListing$Options;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lorg/rabochaya/projects/ObjectListing$Item;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ObjectListing;

.field final synthetic val$collator:Ljava/text/Collator;

.field final synthetic val$options:Lorg/rabochaya/projects/ObjectListing$Options;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ObjectListing;Lorg/rabochaya/projects/ObjectListing$Options;Ljava/text/Collator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 35
    iput-object p1, p0, Lorg/rabochaya/projects/ObjectListing$1;->this$0:Lorg/rabochaya/projects/ObjectListing;

    iput-object p2, p0, Lorg/rabochaya/projects/ObjectListing$1;->val$options:Lorg/rabochaya/projects/ObjectListing$Options;

    iput-object p3, p0, Lorg/rabochaya/projects/ObjectListing$1;->val$collator:Ljava/text/Collator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 35
    check-cast p1, Lorg/rabochaya/projects/ObjectListing$Item;

    check-cast p2, Lorg/rabochaya/projects/ObjectListing$Item;

    invoke-virtual {p0, p1, p2}, Lorg/rabochaya/projects/ObjectListing$1;->compare(Lorg/rabochaya/projects/ObjectListing$Item;Lorg/rabochaya/projects/ObjectListing$Item;)I

    move-result p1

    return p1
.end method

.method public compare(Lorg/rabochaya/projects/ObjectListing$Item;Lorg/rabochaya/projects/ObjectListing$Item;)I
    .locals 3

    .line 35
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectListing$1;->val$options:Lorg/rabochaya/projects/ObjectListing$Options;

    iget-boolean v0, v0, Lorg/rabochaya/projects/ObjectListing$Options;->foldersFirst:Z

    if-eqz v0, :cond_1

    iget-object v0, p1, Lorg/rabochaya/projects/ObjectListing$Item;->row:Lorg/rabochaya/projects/ObjectTree$Row;

    iget-boolean v0, v0, Lorg/rabochaya/projects/ObjectTree$Row;->folder:Z

    iget-object v1, p2, Lorg/rabochaya/projects/ObjectListing$Item;->row:Lorg/rabochaya/projects/ObjectTree$Row;

    iget-boolean v1, v1, Lorg/rabochaya/projects/ObjectTree$Row;->folder:Z

    if-eq v0, v1, :cond_1

    iget-object p1, p1, Lorg/rabochaya/projects/ObjectListing$Item;->row:Lorg/rabochaya/projects/ObjectTree$Row;

    iget-boolean p1, p1, Lorg/rabochaya/projects/ObjectTree$Row;->folder:Z

    if-eqz p1, :cond_0

    const/4 p1, -0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    return p1

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectListing$1;->val$options:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v0, v0, Lorg/rabochaya/projects/ObjectListing$Options;->sort:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    iget v0, p1, Lorg/rabochaya/projects/ObjectListing$Item;->kind:I

    iget v1, p2, Lorg/rabochaya/projects/ObjectListing$Item;->kind:I

    invoke-static {v0, v1}, Ljava/lang/Integer;->compare(II)I

    move-result v0

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    if-nez v0, :cond_3

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectListing$1;->val$options:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v1, v1, Lorg/rabochaya/projects/ObjectListing$Options;->sort:I

    if-eqz v1, :cond_3

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectListing$1;->val$collator:Ljava/text/Collator;

    iget-object v1, p1, Lorg/rabochaya/projects/ObjectListing$Item;->row:Lorg/rabochaya/projects/ObjectTree$Row;

    iget-object v1, v1, Lorg/rabochaya/projects/ObjectTree$Row;->name:Ljava/lang/String;

    iget-object v2, p2, Lorg/rabochaya/projects/ObjectListing$Item;->row:Lorg/rabochaya/projects/ObjectTree$Row;

    iget-object v2, v2, Lorg/rabochaya/projects/ObjectTree$Row;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectListing$1;->val$options:Lorg/rabochaya/projects/ObjectListing$Options;

    iget v1, v1, Lorg/rabochaya/projects/ObjectListing$Options;->sort:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_3

    neg-int v0, v0

    :cond_3
    if-nez v0, :cond_4

    iget p1, p1, Lorg/rabochaya/projects/ObjectListing$Item;->order:I

    iget p2, p2, Lorg/rabochaya/projects/ObjectListing$Item;->order:I

    invoke-static {p1, p2}, Ljava/lang/Integer;->compare(II)I

    move-result v0

    :cond_4
    return v0
.end method
