.class public final Lorg/rabochaya/projects/GeometryCloseDraft;
.super Ljava/lang/Object;
.source "GeometryCloseDraft.java"


# instance fields
.field public final addingHole:Z

.field public final feature:Ljava/lang/String;

.field public final hole:Z

.field public final key:Ljava/lang/String;

.field public final mainStamp:Ljava/lang/String;

.field public final onMap:Z

.field public final project:J

.field public final session:Ljava/lang/String;

.field public final token:Ljava/lang/String;

.field public final type:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;)V
    .locals 2

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_3

    if-eqz p3, :cond_3

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1000

    if-gt v0, v1, :cond_3

    if-eqz p4, :cond_3

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x80

    if-gt v0, v1, :cond_3

    if-eqz p5, :cond_3

    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x200

    if-gt v0, v1, :cond_3

    const-string v0, "\\d+(?:\\.\\d+)*(?:/(?:outer|inner/\\d+))?"

    invoke-virtual {p5, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    if-eqz p6, :cond_3

    const-string v0, "[a-f0-9]{64}"

    invoke-virtual {p6, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    if-eqz p10, :cond_3

    invoke-virtual {p10, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "Point"

    invoke-virtual {v0, p7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "Polygon"

    if-nez v0, :cond_0

    const-string v0, "LineString"

    invoke-virtual {v0, p7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {v1, p7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_0
    const-string v0, "/"

    invoke-virtual {p5, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {v1, p7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_1
    if-eqz p8, :cond_2

    invoke-virtual {v1, p7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "/outer"

    invoke-virtual {p5, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 7
    :cond_2
    iput-wide p1, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->project:J

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->feature:Ljava/lang/String;

    iput-object p4, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->session:Ljava/lang/String;

    iput-object p5, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->key:Ljava/lang/String;

    iput-object p6, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->token:Ljava/lang/String;

    iput-object p7, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->type:Ljava/lang/String;

    iput-boolean p8, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->addingHole:Z

    iput-boolean p9, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->onMap:Z

    iput-object p10, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->mainStamp:Ljava/lang/String;

    const-string p1, "/inner/"

    invoke-virtual {p5, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    iput-boolean p1, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->hole:Z

    .line 8
    return-void

    .line 6
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u043e\u0435 \u043d\u0430\u043c\u0435\u0440\u0435\u043d\u0438\u0435 \u0437\u0430\u043a\u0440\u044b\u0442\u0438\u044f \u0440\u0435\u0434\u0430\u043a\u0442\u043e\u0440\u0430"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public inSession(JLjava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .line 9
    iget-wide v0, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->project:J

    cmp-long p1, v0, p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->feature:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->session:Ljava/lang/String;

    invoke-virtual {p1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public matches(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZLjava/lang/String;)Z
    .locals 0

    .line 11
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/rabochaya/projects/GeometryCloseDraft;->inSession(JLjava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->key:Ljava/lang/String;

    invoke-virtual {p1, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->token:Ljava/lang/String;

    invoke-virtual {p1, p6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->type:Ljava/lang/String;

    invoke-virtual {p1, p7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->hole:Z

    if-ne p1, p8, :cond_0

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->addingHole:Z

    if-ne p1, p9, :cond_0

    iget-boolean p1, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->onMap:Z

    if-ne p1, p10, :cond_0

    if-eqz p11, :cond_0

    invoke-virtual {p11}, Ljava/lang/String;->length()I

    move-result p1

    const p2, 0x7a120

    if-gt p1, p2, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryCloseDraft;->mainStamp:Ljava/lang/String;

    invoke-static {p11}, Lorg/rabochaya/projects/VertexEditDraft;->stamp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
