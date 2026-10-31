.class public final Lorg/rabochaya/projects/GeometryMapState;
.super Ljava/lang/Object;
.source "GeometryMapState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/GeometryMapState$Snapshot;
    }
.end annotation


# static fields
.field private static final MAX_HISTORY:I = 0x20

.field private static final MAX_HISTORY_CHARS:I = 0x3d0900


# instance fields
.field private final history:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Lorg/rabochaya/projects/GeometryMapState$Snapshot;",
            ">;"
        }
    .end annotation
.end field

.field private historyChars:I

.field public final incompleteAllowed:Z

.field private points:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[D>;"
        }
    .end annotation
.end field

.field private selected:I

.field private text:Ljava/lang/String;

.field public final type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 3

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const/4 v0, -0x1

    iput v0, p0, Lorg/rabochaya/projects/GeometryMapState;->selected:I

    .line 13
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/GeometryMapState;->history:Ljava/util/Deque;

    .line 19
    const-string v0, "Point"

    const-string v1, "LineString"

    const-string v2, "Polygon"

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 20
    if-eqz p3, :cond_1

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041d\u0435\u043f\u043e\u043b\u043d\u044b\u0439 \u0432\u0432\u043e\u0434 \u0440\u0430\u0437\u0440\u0435\u0448\u0451\u043d \u0442\u043e\u043b\u044c\u043a\u043e \u0434\u043b\u044f \u043d\u043e\u0432\u043e\u0433\u043e \u0432\u043d\u0443\u0442\u0440\u0435\u043d\u043d\u0435\u0433\u043e \u043a\u043e\u043d\u0442\u0443\u0440\u0430"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 21
    :cond_1
    :goto_0
    iput-object p2, p0, Lorg/rabochaya/projects/GeometryMapState;->type:Ljava/lang/String;

    iput-boolean p3, p0, Lorg/rabochaya/projects/GeometryMapState;->incompleteAllowed:Z

    .line 22
    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryMapState;->read(Ljava/lang/String;)Ljava/util/List;

    move-result-object p2

    iput-object p2, p0, Lorg/rabochaya/projects/GeometryMapState;->points:Ljava/util/List;

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryMapState;->text:Ljava/lang/String;

    .line 23
    return-void

    .line 19
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041d\u0435\u0438\u0437\u0432\u0435\u0441\u0442\u043d\u0430\u044f \u0433\u0435\u043e\u043c\u0435\u0442\u0440\u0438\u044f"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private change(Ljava/util/List;I)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[D>;I)V"
        }
    .end annotation

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/16 v2, 0x20

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [D

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_0

    const/16 v3, 0xa

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_0
    const/4 v3, 0x1

    aget-wide v3, v1, v3

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x0

    aget-wide v4, v1, v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x2

    aget-wide v3, v1, v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 50
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/rabochaya/projects/GeometryMapState;->read(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 51
    iget-object v1, p0, Lorg/rabochaya/projects/GeometryMapState;->text:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iput p2, p0, Lorg/rabochaya/projects/GeometryMapState;->selected:I

    return-void

    .line 52
    :cond_2
    iget-object v1, p0, Lorg/rabochaya/projects/GeometryMapState;->history:Ljava/util/Deque;

    new-instance v3, Lorg/rabochaya/projects/GeometryMapState$Snapshot;

    iget-object v4, p0, Lorg/rabochaya/projects/GeometryMapState;->text:Ljava/lang/String;

    iget v5, p0, Lorg/rabochaya/projects/GeometryMapState;->selected:I

    invoke-direct {v3, v4, v5}, Lorg/rabochaya/projects/GeometryMapState$Snapshot;-><init>(Ljava/lang/String;I)V

    invoke-interface {v1, v3}, Ljava/util/Deque;->addLast(Ljava/lang/Object;)V

    iget v1, p0, Lorg/rabochaya/projects/GeometryMapState;->historyChars:I

    iget-object v3, p0, Lorg/rabochaya/projects/GeometryMapState;->text:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v1, v3

    iput v1, p0, Lorg/rabochaya/projects/GeometryMapState;->historyChars:I

    .line 53
    :goto_1
    iget-object v1, p0, Lorg/rabochaya/projects/GeometryMapState;->history:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->size()I

    move-result v1

    if-gt v1, v2, :cond_4

    iget v1, p0, Lorg/rabochaya/projects/GeometryMapState;->historyChars:I

    const v3, 0x3d0900

    if-le v1, v3, :cond_3

    goto :goto_2

    .line 54
    :cond_3
    iput-object v0, p0, Lorg/rabochaya/projects/GeometryMapState;->points:Ljava/util/List;

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryMapState;->text:Ljava/lang/String;

    iput p2, p0, Lorg/rabochaya/projects/GeometryMapState;->selected:I

    .line 55
    return-void

    .line 53
    :cond_4
    :goto_2
    iget-object v1, p0, Lorg/rabochaya/projects/GeometryMapState;->history:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->removeFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/GeometryMapState$Snapshot;

    iget v3, p0, Lorg/rabochaya/projects/GeometryMapState;->historyChars:I

    iget-object v1, v1, Lorg/rabochaya/projects/GeometryMapState$Snapshot;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v3, v1

    iput v3, p0, Lorg/rabochaya/projects/GeometryMapState;->historyChars:I

    goto :goto_1
.end method

.method private static coordinate(DDD)[D
    .locals 1

    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p0, p1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p4, p5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "Point"

    invoke-static {p0, p1}, Lorg/rabochaya/projects/GeometryCoordinates;->parse(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [D

    return-object p0
.end method

.method private copy()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "[D>;"
        }
    .end annotation

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryMapState;->points:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [D

    invoke-virtual {v2}, [D->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [D

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private read(Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "[D>;"
        }
    .end annotation

    .line 25
    if-eqz p1, :cond_5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const v1, 0x7a120

    if-gt v0, v1, :cond_5

    .line 27
    iget-boolean v0, p0, Lorg/rabochaya/projects/GeometryMapState;->incompleteAllowed:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapState;->type:Ljava/lang/String;

    invoke-static {p1, v0}, Lorg/rabochaya/projects/GeometryCoordinates;->parse(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    goto :goto_1

    .line 29
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 30
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    const-string v2, "[\\r\\n]+"

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length v2, p1

    move v3, v1

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, p1, v3

    .line 31
    const-string v5, "Point"

    invoke-static {v4, v5}, Lorg/rabochaya/projects/GeometryCoordinates;->parse(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [D

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    const/16 v5, 0x2710

    if-gt v4, v5, :cond_1

    .line 30
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 32
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u041f\u0440\u0435\u0434\u0435\u043b \u2014 10 000 \u0432\u0435\u0440\u0448\u0438\u043d"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 35
    :cond_2
    move-object p1, v0

    :goto_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [D

    invoke-virtual {v2}, [D->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [D

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 36
    :cond_3
    const-string p1, "Polygon"

    iget-object v2, p0, Lorg/rabochaya/projects/GeometryMapState;->type:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    const/4 v2, 0x1

    if-le p1, v2, :cond_4

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [D

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v1, v2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [D

    invoke-static {p1, v1}, Ljava/util/Arrays;->equals([D[D)Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    sub-int/2addr p1, v2

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 37
    :cond_4
    return-object v0

    .line 25
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0434\u043b\u0438\u043d\u043d\u044b\u0439 \u0441\u043f\u0438\u0441\u043e\u043a \u043a\u043e\u043e\u0440\u0434\u0438\u043d\u0430\u0442"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public canUndo()Z
    .locals 1

    .line 44
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapState;->history:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public complete()Z
    .locals 2

    .line 46
    :try_start_0
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapState;->text:Ljava/lang/String;

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryMapState;->type:Ljava/lang/String;

    invoke-static {v0, v1}, Lorg/rabochaya/projects/GeometryCoordinates;->parse(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    return v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    return v0
.end method

.method public delete()V
    .locals 3

    .line 70
    iget v0, p0, Lorg/rabochaya/projects/GeometryMapState;->selected:I

    if-ltz v0, :cond_1

    .line 71
    const-string v0, "Point"

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryMapState;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 72
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryMapState;->copy()Ljava/util/List;

    move-result-object v0

    iget v1, p0, Lorg/rabochaya/projects/GeometryMapState;->selected:I

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    iget v1, p0, Lorg/rabochaya/projects/GeometryMapState;->selected:I

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-direct {p0, v0, v1}, Lorg/rabochaya/projects/GeometryMapState;->change(Ljava/util/List;I)V

    .line 73
    return-void

    .line 71
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u041d\u0435\u043b\u044c\u0437\u044f \u0443\u0434\u0430\u043b\u0438\u0442\u044c \u0435\u0434\u0438\u043d\u0441\u0442\u0432\u0435\u043d\u043d\u0443\u044e \u0432\u0435\u0440\u0448\u0438\u043d\u0443 \u043c\u0435\u0442\u043a\u0438"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u0421\u043d\u0430\u0447\u0430\u043b\u0430 \u0432\u044b\u0431\u0435\u0440\u0438\u0442\u0435 \u0432\u0435\u0440\u0448\u0438\u043d\u0443"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public insert(DD)V
    .locals 8

    .line 65
    const-string v0, "Point"

    iget-object v1, p0, Lorg/rabochaya/projects/GeometryMapState;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 66
    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryMapState;->size()I

    move-result v0

    const/16 v1, 0x2710

    if-ge v0, v1, :cond_1

    .line 67
    iget v0, p0, Lorg/rabochaya/projects/GeometryMapState;->selected:I

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryMapState;->size()I

    move-result v0

    goto :goto_0

    :cond_0
    iget v0, p0, Lorg/rabochaya/projects/GeometryMapState;->selected:I

    add-int/lit8 v0, v0, 0x1

    :goto_0
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryMapState;->copy()Ljava/util/List;

    move-result-object v1

    const-wide/16 v6, 0x0

    move-wide v2, p1

    move-wide v4, p3

    invoke-static/range {v2 .. v7}, Lorg/rabochaya/projects/GeometryMapState;->coordinate(DDD)[D

    move-result-object p1

    invoke-interface {v1, v0, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    invoke-direct {p0, v1, v0}, Lorg/rabochaya/projects/GeometryMapState;->change(Ljava/util/List;I)V

    .line 68
    return-void

    .line 66
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041f\u0440\u0435\u0434\u0435\u043b \u2014 10 000 \u0432\u0435\u0440\u0448\u0438\u043d"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 65
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u0423 \u043c\u0435\u0442\u043a\u0438 \u0442\u043e\u043b\u044c\u043a\u043e \u043e\u0434\u043d\u0430 \u0432\u0435\u0440\u0448\u0438\u043d\u0430"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public move(IDD)V
    .locals 8

    .line 60
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapState;->points:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    const/4 v1, 0x2

    aget-wide v6, v0, v1

    move-wide v2, p2

    move-wide v4, p4

    invoke-static/range {v2 .. v7}, Lorg/rabochaya/projects/GeometryMapState;->coordinate(DDD)[D

    move-result-object p2

    .line 61
    invoke-static {v0, p2}, Ljava/util/Arrays;->equals([D[D)Z

    move-result p3

    if-eqz p3, :cond_0

    return-void

    .line 62
    :cond_0
    invoke-direct {p0}, Lorg/rabochaya/projects/GeometryMapState;->copy()Ljava/util/List;

    move-result-object p3

    invoke-interface {p3, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0, p3, p1}, Lorg/rabochaya/projects/GeometryMapState;->change(Ljava/util/List;I)V

    .line 63
    return-void
.end method

.method public point(I)[D
    .locals 1

    .line 40
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapState;->points:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [D

    invoke-virtual {p1}, [D->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [D

    return-object p1
.end method

.method public select(I)V
    .locals 1

    .line 43
    const/4 v0, -0x1

    if-lt p1, v0, :cond_0

    invoke-virtual {p0}, Lorg/rabochaya/projects/GeometryMapState;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iput p1, p0, Lorg/rabochaya/projects/GeometryMapState;->selected:I

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u0412\u0435\u0440\u0448\u0438\u043d\u0430 \u043d\u0435 \u043d\u0430\u0439\u0434\u0435\u043d\u0430"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public selected()I
    .locals 1

    .line 42
    iget v0, p0, Lorg/rabochaya/projects/GeometryMapState;->selected:I

    return v0
.end method

.method public size()I
    .locals 1

    .line 39
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapState;->points:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public text()Ljava/lang/String;
    .locals 1

    .line 41
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapState;->text:Ljava/lang/String;

    return-object v0
.end method

.method public undo()V
    .locals 3

    .line 75
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapState;->history:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 76
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapState;->history:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->removeLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/rabochaya/projects/GeometryMapState$Snapshot;

    iget v1, p0, Lorg/rabochaya/projects/GeometryMapState;->historyChars:I

    iget-object v2, v0, Lorg/rabochaya/projects/GeometryMapState$Snapshot;->text:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, p0, Lorg/rabochaya/projects/GeometryMapState;->historyChars:I

    iget-object v1, v0, Lorg/rabochaya/projects/GeometryMapState$Snapshot;->text:Ljava/lang/String;

    invoke-direct {p0, v1}, Lorg/rabochaya/projects/GeometryMapState;->read(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryMapState;->points:Ljava/util/List;

    iget-object v1, v0, Lorg/rabochaya/projects/GeometryMapState$Snapshot;->text:Ljava/lang/String;

    iput-object v1, p0, Lorg/rabochaya/projects/GeometryMapState;->text:Ljava/lang/String;

    iget v0, v0, Lorg/rabochaya/projects/GeometryMapState$Snapshot;->selected:I

    iput v0, p0, Lorg/rabochaya/projects/GeometryMapState;->selected:I

    .line 77
    return-void

    .line 75
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\u041d\u0435\u0442 \u0434\u0435\u0439\u0441\u0442\u0432\u0438\u0439 \u0434\u043b\u044f \u043e\u0442\u043c\u0435\u043d\u044b"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public undoCount()I
    .locals 1

    .line 45
    iget-object v0, p0, Lorg/rabochaya/projects/GeometryMapState;->history:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->size()I

    move-result v0

    return v0
.end method
