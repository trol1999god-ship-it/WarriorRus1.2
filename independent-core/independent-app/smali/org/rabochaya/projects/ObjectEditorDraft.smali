.class public final Lorg/rabochaya/projects/ObjectEditorDraft;
.super Ljava/lang/Object;
.source "ObjectEditorDraft.java"


# instance fields
.field public final end:I

.field public final key:Ljava/lang/String;

.field public final operation:Ljava/lang/String;

.field public final project:J

.field public final start:I

.field public final text:Ljava/lang/String;

.field public final token:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V
    .locals 2

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const-string v0, "rename"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "description"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "create"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041d\u0435\u0438\u0437\u0432\u0435\u0441\u0442\u043d\u044b\u0439 \u0440\u0435\u0434\u0430\u043a\u0442\u043e\u0440"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 8
    :cond_1
    :goto_0
    if-eqz p6, :cond_2

    invoke-virtual {p6}, Ljava/lang/String;->length()I

    move-result v0

    const v1, 0x186a0

    if-gt v0, v1, :cond_2

    .line 9
    iput-wide p1, p0, Lorg/rabochaya/projects/ObjectEditorDraft;->project:J

    iput-object p3, p0, Lorg/rabochaya/projects/ObjectEditorDraft;->operation:Ljava/lang/String;

    iput-object p4, p0, Lorg/rabochaya/projects/ObjectEditorDraft;->key:Ljava/lang/String;

    iput-object p5, p0, Lorg/rabochaya/projects/ObjectEditorDraft;->token:Ljava/lang/String;

    iput-object p6, p0, Lorg/rabochaya/projects/ObjectEditorDraft;->text:Ljava/lang/String;

    invoke-virtual {p6}, Ljava/lang/String;->length()I

    move-result p1

    invoke-static {p7, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 p2, 0x0

    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lorg/rabochaya/projects/ObjectEditorDraft;->start:I

    invoke-virtual {p6}, Ljava/lang/String;->length()I

    move-result p1

    invoke-static {p8, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lorg/rabochaya/projects/ObjectEditorDraft;->end:I

    .line 10
    return-void

    .line 8
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u0431\u043e\u043b\u044c\u0448\u043e\u0439 \u0447\u0435\u0440\u043d\u043e\u0432\u0438\u043a"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public matches(JLorg/w3c/dom/Element;)Z
    .locals 4

    .line 12
    iget-wide v0, p0, Lorg/rabochaya/projects/ObjectEditorDraft;->project:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    if-lez v0, :cond_6

    iget-wide v2, p0, Lorg/rabochaya/projects/ObjectEditorDraft;->project:J

    cmp-long p1, v2, p1

    if-nez p1, :cond_6

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectEditorDraft;->token:Ljava/lang/String;

    if-eqz p1, :cond_6

    if-nez p3, :cond_0

    goto :goto_1

    .line 13
    :cond_0
    :try_start_0
    iget-object p1, p0, Lorg/rabochaya/projects/ObjectEditorDraft;->token:Ljava/lang/String;

    invoke-static {p3}, Lorg/rabochaya/projects/ObjectTree;->token(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    return v1

    :cond_1
    iget-object p1, p0, Lorg/rabochaya/projects/ObjectEditorDraft;->key:Ljava/lang/String;

    invoke-static {p3, p1}, Lorg/rabochaya/projects/ObjectTree;->resolve(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object p1

    .line 14
    iget-object p2, p0, Lorg/rabochaya/projects/ObjectEditorDraft;->operation:Ljava/lang/String;

    const-string p3, "create"

    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 p3, 0x1

    if-nez p2, :cond_3

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectEditorDraft;->key:Ljava/lang/String;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lorg/rabochaya/projects/ObjectEditorDraft;->key:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_2

    move v1, p3

    :cond_2
    return v1

    .line 15
    :cond_3
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object p1

    const-string p2, "Document"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_4

    const-string p2, "Folder"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_4

    const-string p2, "kml"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p1, :cond_5

    :cond_4
    move v1, p3

    :cond_5
    return v1

    .line 16
    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    :goto_0
    return v1

    .line 12
    :cond_6
    :goto_1
    return v1
.end method
