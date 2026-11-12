.class public final Lorg/rabochaya/projects/GeometryMapUndoDraft;
.super Ljava/lang/Object;
.source "GeometryMapUndoDraft.java"


# instance fields
.field private final adding:Z

.field private final feature:Ljava/lang/String;

.field private final hole:Z

.field private final key:Ljava/lang/String;

.field private final project:J

.field private final session:Ljava/lang/String;

.field private final snapshot:Lorg/rabochaya/projects/GeometryMapState;

.field private final stamp:Ljava/lang/String;

.field private final token:Ljava/lang/String;

.field private final type:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/GeometryMapState;)V
    .locals 2

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_2

    if-eqz p3, :cond_2

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1000

    if-gt v0, v1, :cond_2

    if-eqz p4, :cond_2

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x80

    if-gt v0, v1, :cond_2

    if-eqz p5, :cond_2

    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x200

    if-gt v0, v1, :cond_2

    const-string v0, "\\d+(?:\\.\\d+)*(?:/(?:outer|inner/\\d+))?"

    invoke-virtual {p5, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    if-eqz p6, :cond_2

    const-string v0, "[a-f0-9]{64}"

    invoke-virtual {p6, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    if-eqz p7, :cond_2

    const-string v0, "Polygon"

    iget-object v1, p7, Lorg/rabochaya/projects/GeometryMapState;->type:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "/"

    invoke-virtual {p5, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_0
    iget-boolean v0, p7, Lorg/rabochaya/projects/GeometryMapState;->incompleteAllowed:Z

    if-eqz v0, :cond_1

    const-string v0, "/outer"

    invoke-virtual {p5, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 11
    :cond_1
    iput-wide p1, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->project:J

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->feature:Ljava/lang/String;

    iput-object p4, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->session:Ljava/lang/String;

    iput-object p5, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->key:Ljava/lang/String;

    iput-object p6, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->token:Ljava/lang/String;

    iget-object p1, p7, Lorg/rabochaya/projects/GeometryMapState;->type:Ljava/lang/String;

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->type:Ljava/lang/String;

    const-string p1, "/inner/"

    invoke-virtual {p5, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    iput-boolean p1, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->hole:Z

    iget-boolean p1, p7, Lorg/rabochaya/projects/GeometryMapState;->incompleteAllowed:Z

    iput-boolean p1, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->adding:Z

    invoke-virtual {p7}, Lorg/rabochaya/projects/GeometryMapState;->text()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/rabochaya/projects/VertexEditDraft;->stamp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->stamp:Ljava/lang/String;

    invoke-virtual {p7}, Lorg/rabochaya/projects/GeometryMapState;->snapshotCopy()Lorg/rabochaya/projects/GeometryMapState;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->snapshot:Lorg/rabochaya/projects/GeometryMapState;

    .line 12
    return-void

    .line 10
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u0430\u044f \u0438\u0441\u0442\u043e\u0440\u0438\u044f \u0440\u0435\u0434\u0430\u043a\u0442\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u044f"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public restore(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)Lorg/rabochaya/projects/GeometryMapState;
    .locals 2

    .line 14
    iget-wide v0, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->project:J

    cmp-long p1, v0, p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->feature:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->session:Ljava/lang/String;

    invoke-virtual {p1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->key:Ljava/lang/String;

    invoke-virtual {p1, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->token:Ljava/lang/String;

    invoke-virtual {p1, p6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->token:Ljava/lang/String;

    invoke-virtual {p1, p7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->type:Ljava/lang/String;

    invoke-virtual {p1, p8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->hole:Z

    if-ne p1, p9, :cond_1

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->adding:Z

    if-ne p1, p10, :cond_1

    if-eqz p11, :cond_1

    invoke-virtual {p11}, Ljava/lang/String;->length()I

    move-result p1

    const p2, 0x7a120

    if-gt p1, p2, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->stamp:Ljava/lang/String;

    invoke-static {p11}, Lorg/rabochaya/projects/VertexEditDraft;->stamp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 15
    :cond_0
    iget-object p1, p0, Lorg/rabochaya/projects/GeometryMapUndoDraft;->snapshot:Lorg/rabochaya/projects/GeometryMapState;

    invoke-virtual {p1}, Lorg/rabochaya/projects/GeometryMapState;->snapshotCopy()Lorg/rabochaya/projects/GeometryMapState;

    move-result-object p1

    return-object p1

    .line 14
    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method
