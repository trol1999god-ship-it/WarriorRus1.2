.class Lorg/rabochaya/projects/TileRegion$1;
.super Ljava/lang/Object;
.source "TileRegion.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/TileRegion;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "[I>;"
    }
.end annotation


# instance fields
.field r:I

.field final synthetic this$0:Lorg/rabochaya/projects/TileRegion;

.field x:I

.field y:I


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/TileRegion;)V
    .locals 2

    .line 17
    iput-object p1, p0, Lorg/rabochaya/projects/TileRegion$1;->this$0:Lorg/rabochaya/projects/TileRegion;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput p1, p0, Lorg/rabochaya/projects/TileRegion$1;->r:I

    iget-object v0, p0, Lorg/rabochaya/projects/TileRegion$1;->this$0:Lorg/rabochaya/projects/TileRegion;

    invoke-static {v0}, Lorg/rabochaya/projects/TileRegion;->access$000(Lorg/rabochaya/projects/TileRegion;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    const/4 v1, 0x1

    aget v0, v0, v1

    iput v0, p0, Lorg/rabochaya/projects/TileRegion$1;->x:I

    iget-object v0, p0, Lorg/rabochaya/projects/TileRegion$1;->this$0:Lorg/rabochaya/projects/TileRegion;

    invoke-static {v0}, Lorg/rabochaya/projects/TileRegion;->access$000(Lorg/rabochaya/projects/TileRegion;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [I

    const/4 v0, 0x3

    aget p1, p1, v0

    iput p1, p0, Lorg/rabochaya/projects/TileRegion$1;->y:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 17
    iget v0, p0, Lorg/rabochaya/projects/TileRegion$1;->r:I

    iget-object v1, p0, Lorg/rabochaya/projects/TileRegion$1;->this$0:Lorg/rabochaya/projects/TileRegion;

    invoke-static {v1}, Lorg/rabochaya/projects/TileRegion;->access$000(Lorg/rabochaya/projects/TileRegion;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 17
    invoke-virtual {p0}, Lorg/rabochaya/projects/TileRegion$1;->next()[I

    move-result-object v0

    return-object v0
.end method

.method public next()[I
    .locals 5

    .line 17
    invoke-virtual {p0}, Lorg/rabochaya/projects/TileRegion$1;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/TileRegion$1;->this$0:Lorg/rabochaya/projects/TileRegion;

    invoke-static {v0}, Lorg/rabochaya/projects/TileRegion;->access$000(Lorg/rabochaya/projects/TileRegion;)Ljava/util/ArrayList;

    move-result-object v0

    iget v1, p0, Lorg/rabochaya/projects/TileRegion$1;->r:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    const/4 v1, 0x0

    aget v1, v0, v1

    iget v2, p0, Lorg/rabochaya/projects/TileRegion$1;->x:I

    iget v3, p0, Lorg/rabochaya/projects/TileRegion$1;->y:I

    filled-new-array {v1, v2, v3}, [I

    move-result-object v1

    iget v2, p0, Lorg/rabochaya/projects/TileRegion$1;->x:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iput v2, p0, Lorg/rabochaya/projects/TileRegion$1;->x:I

    const/4 v4, 0x2

    aget v4, v0, v4

    if-le v2, v4, :cond_0

    aget v2, v0, v3

    iput v2, p0, Lorg/rabochaya/projects/TileRegion$1;->x:I

    iget v2, p0, Lorg/rabochaya/projects/TileRegion$1;->y:I

    add-int/2addr v2, v3

    iput v2, p0, Lorg/rabochaya/projects/TileRegion$1;->y:I

    const/4 v4, 0x4

    aget v0, v0, v4

    if-le v2, v0, :cond_0

    iget v0, p0, Lorg/rabochaya/projects/TileRegion$1;->r:I

    add-int/2addr v0, v3

    iput v0, p0, Lorg/rabochaya/projects/TileRegion$1;->r:I

    invoke-virtual {p0}, Lorg/rabochaya/projects/TileRegion$1;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/TileRegion$1;->this$0:Lorg/rabochaya/projects/TileRegion;

    invoke-static {v0}, Lorg/rabochaya/projects/TileRegion;->access$000(Lorg/rabochaya/projects/TileRegion;)Ljava/util/ArrayList;

    move-result-object v0

    iget v2, p0, Lorg/rabochaya/projects/TileRegion$1;->r:I

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    aget v0, v0, v3

    iput v0, p0, Lorg/rabochaya/projects/TileRegion$1;->x:I

    iget-object v0, p0, Lorg/rabochaya/projects/TileRegion$1;->this$0:Lorg/rabochaya/projects/TileRegion;

    invoke-static {v0}, Lorg/rabochaya/projects/TileRegion;->access$000(Lorg/rabochaya/projects/TileRegion;)Ljava/util/ArrayList;

    move-result-object v0

    iget v2, p0, Lorg/rabochaya/projects/TileRegion$1;->r:I

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    const/4 v2, 0x3

    aget v0, v0, v2

    iput v0, p0, Lorg/rabochaya/projects/TileRegion$1;->y:I

    :cond_0
    return-object v1

    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public remove()V
    .locals 1

    .line 17
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
