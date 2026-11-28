.class public final Lorg/rabochaya/projects/GeometryPartChoiceDraft;
.super Ljava/lang/Object;
.source "GeometryPartChoiceDraft.java"


# instance fields
.field public final addingHole:Z

.field public final feature:Ljava/lang/String;

.field public final mainStamp:Ljava/lang/String;

.field public final onMap:Z

.field public final project:J

.field public final session:Ljava/lang/String;

.field public final sourceHole:Z

.field public final sourceKey:Ljava/lang/String;

.field public final sourceToken:Ljava/lang/String;

.field public final sourceType:Ljava/lang/String;

.field public final targetHole:Z

.field public final targetKey:Ljava/lang/String;

.field public final targetToken:Ljava/lang/String;

.field public final targetType:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_1

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1000

    if-gt v0, v1, :cond_1

    if-eqz p4, :cond_1

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x80

    if-gt v0, v1, :cond_1

    invoke-static {p5, p7}, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->key(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p11, p13}, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->key(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p5, p11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p6}, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->hash(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p12}, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->hash(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p10}, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->hash(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p8, :cond_0

    const-string v0, "Polygon"

    invoke-virtual {v0, p7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "/outer"

    invoke-virtual {p5, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 9
    :cond_0
    iput-wide p1, p0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->project:J

    iput-object p3, p0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->feature:Ljava/lang/String;

    iput-object p4, p0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->session:Ljava/lang/String;

    iput-object p5, p0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->sourceKey:Ljava/lang/String;

    iput-object p6, p0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->sourceToken:Ljava/lang/String;

    iput-object p7, p0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->sourceType:Ljava/lang/String;

    iput-boolean p8, p0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->addingHole:Z

    iput-boolean p9, p0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->onMap:Z

    iput-object p10, p0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->mainStamp:Ljava/lang/String;

    iput-object p11, p0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->targetKey:Ljava/lang/String;

    iput-object p12, p0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->targetToken:Ljava/lang/String;

    iput-object p13, p0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->targetType:Ljava/lang/String;

    const-string p1, "/inner/"

    invoke-virtual {p5, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    iput-boolean p2, p0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->sourceHole:Z

    invoke-virtual {p11, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    iput-boolean p1, p0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->targetHole:Z

    .line 10
    return-void

    .line 8
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u043e\u0435 \u043d\u0430\u043c\u0435\u0440\u0435\u043d\u0438\u0435 \u0441\u043c\u0435\u043d\u044b \u043a\u043e\u043d\u0442\u0443\u0440\u0430"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static hash(Ljava/lang/String;)Z
    .locals 1

    .line 6
    if-eqz p0, :cond_0

    const-string v0, "[a-f0-9]{64}"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static key(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .line 5
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x200

    if-gt v0, v1, :cond_2

    const-string v0, "\\d+(?:\\.\\d+)*(?:/(?:outer|inner/\\d+))?"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "Point"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "Polygon"

    if-nez v0, :cond_0

    const-string v0, "LineString"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "/"

    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_2

    :cond_1
    const/4 p0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public inSession(JLjava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .line 11
    iget-wide v0, p0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->project:J

    cmp-long p1, v0, p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->feature:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->session:Ljava/lang/String;

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

.method public matches(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 3

    .line 12
    move-object v0, p0

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->inSession(JLjava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->sourceKey:Ljava/lang/String;

    move-object v2, p5

    invoke-virtual {v1, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->sourceToken:Ljava/lang/String;

    move-object v2, p6

    invoke-virtual {v1, p6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->sourceToken:Ljava/lang/String;

    move-object v2, p7

    invoke-virtual {v1, p7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->sourceType:Ljava/lang/String;

    move-object v2, p8

    invoke-virtual {v1, p8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-boolean v1, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->sourceHole:Z

    move v2, p9

    if-ne v1, v2, :cond_0

    iget-boolean v1, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->addingHole:Z

    move v2, p10

    if-ne v1, v2, :cond_0

    iget-boolean v1, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->onMap:Z

    move v2, p11

    if-ne v1, v2, :cond_0

    if-eqz p12, :cond_0

    invoke-virtual {p12}, Ljava/lang/String;->length()I

    move-result v1

    const v2, 0x7a120

    if-gt v1, v2, :cond_0

    iget-object v1, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->mainStamp:Ljava/lang/String;

    invoke-static {p12}, Lorg/rabochaya/projects/VertexEditDraft;->stamp(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->targetKey:Ljava/lang/String;

    move-object/from16 v2, p13

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->targetToken:Ljava/lang/String;

    move-object/from16 v2, p14

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->targetType:Ljava/lang/String;

    move-object/from16 v2, p15

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-boolean v1, v0, Lorg/rabochaya/projects/GeometryPartChoiceDraft;->targetHole:Z

    move/from16 v2, p16

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method
