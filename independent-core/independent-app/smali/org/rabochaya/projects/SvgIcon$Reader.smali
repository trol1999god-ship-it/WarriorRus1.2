.class final Lorg/rabochaya/projects/SvgIcon$Reader;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "SvgIcon.java"

# interfaces
.implements Lorg/xml/sax/ext/LexicalHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/SvgIcon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Reader"
.end annotation


# instance fields
.field final containers:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field depth:I

.field nodes:I

.field pixelHeight:D

.field pixelWidth:D

.field segments:I

.field final shapes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lorg/rabochaya/projects/SvgIcon$Shape;",
            ">;"
        }
    .end annotation
.end field

.field final stack:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Lorg/rabochaya/projects/SvgIcon$Paint;",
            ">;"
        }
    .end annotation
.end field

.field view:[D


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/SvgIcon$Reader;->shapes:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/SvgIcon$Reader;->stack:Ljava/util/ArrayDeque;

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/SvgIcon$Reader;->containers:Ljava/util/ArrayDeque;

    return-void
.end method

.method synthetic constructor <init>(Lorg/rabochaya/projects/SvgIcon$1;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lorg/rabochaya/projects/SvgIcon$Reader;-><init>()V

    return-void
.end method


# virtual methods
.method public characters([CII)V
    .locals 2

    .line 42
    move v0, p2

    :goto_0
    add-int v1, p2, p3

    if-ge v0, v1, :cond_1

    aget-char v1, p1, v0

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-eqz v1, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->access$100()Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1

    :cond_1
    return-void
.end method

.method public comment([CII)V
    .locals 0

    .line 44
    return-void
.end method

.method public endCDATA()V
    .locals 0

    .line 44
    return-void
.end method

.method public endDTD()V
    .locals 0

    .line 44
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 41
    iget-object p1, p0, Lorg/rabochaya/projects/SvgIcon$Reader;->stack:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    iget-object p1, p0, Lorg/rabochaya/projects/SvgIcon$Reader;->containers:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    iget p1, p0, Lorg/rabochaya/projects/SvgIcon$Reader;->depth:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lorg/rabochaya/projects/SvgIcon$Reader;->depth:I

    return-void
.end method

.method public endEntity(Ljava/lang/String;)V
    .locals 0

    .line 44
    return-void
.end method

.method public error(Lorg/xml/sax/SAXParseException;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 45
    throw p1
.end method

.method public fatalError(Lorg/xml/sax/SAXParseException;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 45
    throw p1
.end method

.method public processingInstruction(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 43
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->access$100()Ljava/lang/IllegalArgumentException;

    move-result-object p1

    throw p1
.end method

.method public startCDATA()V
    .locals 0

    .line 44
    return-void
.end method

.method public startDTD(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 44
    new-instance p1, Lorg/xml/sax/SAXException;

    const-string p2, "DTD forbidden"

    invoke-direct {p1, p2}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 26

    .line 24
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    iget v3, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->depth:I

    const/4 v4, 0x1

    add-int/2addr v3, v4

    iput v3, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->depth:I

    const/16 v5, 0x10

    if-gt v3, v5, :cond_36

    iget v3, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->nodes:I

    add-int/2addr v3, v4

    iput v3, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->nodes:I

    const/16 v5, 0x100

    if-gt v3, v5, :cond_36

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "http://www.w3.org/2000/svg"

    move-object/from16 v5, p1

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_36

    :cond_0
    iget-object v3, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->containers:Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->containers:Ljava/util/ArrayDeque;

    invoke-virtual {v3}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_36

    .line 25
    :cond_1
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const/4 v6, 0x0

    :goto_0
    invoke-interface/range {p4 .. p4}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v7

    if-ge v6, v7, :cond_4

    invoke-interface {v2, v6}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v2, v6}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v2, v6}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v3, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_2

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_2
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->access$100()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1

    :cond_3
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->access$100()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1

    .line 26
    :cond_4
    const-string v2, "svg"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    const-string v7, "g"

    if-nez v6, :cond_6

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    goto :goto_1

    :cond_5
    const/4 v6, 0x0

    goto :goto_2

    :cond_6
    :goto_1
    move v6, v4

    :goto_2
    iget v8, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->depth:I

    if-ne v8, v4, :cond_7

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8

    :cond_7
    iget v8, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->depth:I

    if-le v8, v4, :cond_9

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_8

    goto :goto_3

    :cond_8
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->access$100()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1

    .line 27
    :cond_9
    :goto_3
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v8, "polygon"

    const-string v9, "line"

    const-string v10, "ellipse"

    const-string v11, "rect"

    const-string v12, "path"

    const-string v13, "circle"

    const-string v14, "fill stroke stroke-width fill-rule"

    if-eqz v2, :cond_a

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, " viewBox width height"

    :goto_4
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    goto/16 :goto_6

    :cond_a
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    goto/16 :goto_6

    :cond_b
    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, " d opacity fill-opacity stroke-opacity"

    goto :goto_4

    :cond_c
    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, " x y width height opacity fill-opacity stroke-opacity"

    goto :goto_4

    :cond_d
    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, " cx cy r opacity fill-opacity stroke-opacity"

    goto :goto_4

    :cond_e
    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, " cx cy rx ry opacity fill-opacity stroke-opacity"

    goto :goto_4

    :cond_f
    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, " x1 y1 x2 y2 opacity fill-opacity stroke-opacity"

    goto :goto_4

    :cond_10
    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_12

    const-string v2, "polyline"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_11

    goto :goto_5

    :cond_11
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->access$100()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1

    :cond_12
    :goto_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v7, " points opacity fill-opacity stroke-opacity"

    goto/16 :goto_4

    .line 28
    :goto_6
    const-string v2, "style"

    invoke-interface {v3, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_17

    if-nez v6, :cond_16

    new-instance v15, Ljava/util/HashSet;

    invoke-direct {v15}, Ljava/util/HashSet;-><init>()V

    const-string v4, ";"

    const/4 v5, -0x1

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v2

    array-length v4, v2

    const/4 v7, 0x0

    :goto_7
    if-ge v7, v4, :cond_17

    aget-object v5, v2, v7

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->isEmpty()Z

    move-result v17

    if-eqz v17, :cond_13

    move-object/from16 v17, v2

    move/from16 v18, v4

    goto :goto_8

    :cond_13
    move-object/from16 v17, v2

    const-string v2, ":"

    move/from16 v18, v4

    const/4 v4, -0x1

    invoke-virtual {v5, v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v2

    array-length v5, v2

    const/4 v4, 0x2

    if-ne v5, v4, :cond_15

    const/4 v4, 0x0

    aget-object v5, v2, v4

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    aget-object v2, v2, v5

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    const-string v24, "fill-opacity"

    const-string v25, "stroke-opacity"

    const-string v19, "fill"

    const-string v20, "stroke"

    const-string v21, "stroke-width"

    const-string v22, "fill-rule"

    const-string v23, "opacity"

    filled-new-array/range {v19 .. v25}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_14

    invoke-interface {v15, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_14

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_8
    add-int/lit8 v7, v7, 0x1

    move-object/from16 v2, v17

    move/from16 v4, v18

    const/4 v5, -0x1

    goto :goto_7

    :cond_14
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->access$100()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1

    :cond_15
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->access$100()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1

    :cond_16
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->access$100()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1

    .line 29
    :cond_17
    new-instance v2, Ljava/util/HashSet;

    const-string v4, " "

    invoke-virtual {v14, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_9
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_19

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v2, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_18

    goto :goto_9

    :cond_18
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->access$100()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1

    .line 30
    :cond_19
    iget-object v2, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->stack:Ljava/util/ArrayDeque;

    invoke-virtual {v2}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1a

    new-instance v2, Lorg/rabochaya/projects/SvgIcon$Paint;

    invoke-direct {v2}, Lorg/rabochaya/projects/SvgIcon$Paint;-><init>()V

    goto :goto_a

    :cond_1a
    new-instance v2, Lorg/rabochaya/projects/SvgIcon$Paint;

    iget-object v5, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->stack:Ljava/util/ArrayDeque;

    invoke-virtual {v5}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/rabochaya/projects/SvgIcon$Paint;

    invoke-direct {v2, v5}, Lorg/rabochaya/projects/SvgIcon$Paint;-><init>(Lorg/rabochaya/projects/SvgIcon$Paint;)V

    :goto_a
    const-string v5, "fill"

    invoke-interface {v3, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1b

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lorg/rabochaya/projects/SvgIcon;->access$200(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    iput-object v5, v2, Lorg/rabochaya/projects/SvgIcon$Paint;->fill:Ljava/lang/Integer;

    :cond_1b
    const-string v5, "stroke"

    invoke-interface {v3, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1c

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lorg/rabochaya/projects/SvgIcon;->access$200(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    iput-object v5, v2, Lorg/rabochaya/projects/SvgIcon$Paint;->stroke:Ljava/lang/Integer;

    :cond_1c
    const-string v5, "stroke-width"

    iget-wide v14, v2, Lorg/rabochaya/projects/SvgIcon$Paint;->width:D

    invoke-static {v3, v5, v14, v15}, Lorg/rabochaya/projects/SvgIcon;->access$300(Ljava/util/Map;Ljava/lang/String;D)D

    move-result-wide v14

    invoke-static {v14, v15}, Lorg/rabochaya/projects/SvgIcon;->access$400(D)D

    move-result-wide v14

    iput-wide v14, v2, Lorg/rabochaya/projects/SvgIcon$Paint;->width:D

    const-string v5, "fill-rule"

    invoke-interface {v3, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1f

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v7, "evenodd"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1e

    const-string v7, "nonzero"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1d

    goto :goto_b

    :cond_1d
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->access$100()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1

    :cond_1e
    :goto_b
    const-string v7, "evenodd"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    iput-boolean v5, v2, Lorg/rabochaya/projects/SvgIcon$Paint;->evenOdd:Z

    .line 31
    :cond_1f
    iget v5, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->depth:I

    const-string v7, "height"

    const-string v14, "width"

    const/4 v15, 0x4

    move-object/from16 v16, v8

    move-object/from16 v17, v9

    const/4 v8, 0x1

    if-ne v5, v8, :cond_24

    const-string v5, "viewBox"

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    if-nez v5, :cond_20

    invoke-interface {v3, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lorg/rabochaya/projects/SvgIcon;->access$500(Ljava/lang/String;)D

    move-result-wide v8

    iput-wide v8, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->pixelWidth:D

    invoke-interface {v3, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lorg/rabochaya/projects/SvgIcon;->access$500(Ljava/lang/String;)D

    move-result-wide v8

    iput-wide v8, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->pixelHeight:D

    iget-wide v8, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->pixelWidth:D

    move-object/from16 v21, v4

    iget-wide v4, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->pixelHeight:D

    move-object/from16 v22, v10

    new-array v10, v15, [D

    const-wide/16 v18, 0x0

    const/16 v23, 0x0

    aput-wide v18, v10, v23

    const/16 v24, 0x1

    aput-wide v18, v10, v24

    const/16 v24, 0x2

    aput-wide v8, v10, v24

    const/4 v8, 0x3

    aput-wide v4, v10, v8

    iput-object v10, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->view:[D

    goto :goto_e

    :cond_20
    move-object/from16 v21, v4

    move-object/from16 v22, v10

    const/16 v23, 0x0

    invoke-static {v5, v15}, Lorg/rabochaya/projects/SvgIcon;->access$600(Ljava/lang/String;I)[D

    move-result-object v4

    iput-object v4, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->view:[D

    iget-object v4, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->view:[D

    array-length v4, v4

    if-ne v4, v15, :cond_23

    iget-object v4, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->view:[D

    const/4 v5, 0x2

    aget-wide v8, v4, v5

    const-wide/16 v4, 0x0

    cmpg-double v8, v8, v4

    if-lez v8, :cond_23

    iget-object v8, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->view:[D

    const/4 v9, 0x3

    aget-wide v18, v8, v9

    cmpg-double v8, v18, v4

    if-lez v8, :cond_23

    invoke-interface {v3, v14}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_21

    invoke-interface {v3, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lorg/rabochaya/projects/SvgIcon;->access$500(Ljava/lang/String;)D

    move-result-wide v4

    goto :goto_c

    :cond_21
    iget-object v4, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->view:[D

    const/4 v5, 0x2

    aget-wide v8, v4, v5

    move-wide v4, v8

    :goto_c
    iput-wide v4, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->pixelWidth:D

    invoke-interface {v3, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_22

    invoke-interface {v3, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lorg/rabochaya/projects/SvgIcon;->access$500(Ljava/lang/String;)D

    move-result-wide v4

    goto :goto_d

    :cond_22
    iget-object v4, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->view:[D

    const/4 v5, 0x3

    aget-wide v8, v4, v5

    move-wide v4, v8

    :goto_d
    iput-wide v4, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->pixelHeight:D

    goto :goto_e

    :cond_23
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->access$100()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1

    :cond_24
    move-object/from16 v21, v4

    move-object/from16 v22, v10

    const/16 v23, 0x0

    .line 32
    :goto_e
    if-nez v6, :cond_35

    const-string v4, "opacity"

    invoke-static {v3, v4}, Lorg/rabochaya/projects/SvgIcon;->access$700(Ljava/util/Map;Ljava/lang/String;)D

    move-result-wide v4

    iget-object v8, v2, Lorg/rabochaya/projects/SvgIcon$Paint;->fill:Ljava/lang/Integer;

    const-string v9, "fill-opacity"

    invoke-static {v3, v9}, Lorg/rabochaya/projects/SvgIcon;->access$700(Ljava/util/Map;Ljava/lang/String;)D

    move-result-wide v9

    mul-double/2addr v9, v4

    invoke-static {v8, v9, v10}, Lorg/rabochaya/projects/SvgIcon;->access$800(Ljava/lang/Integer;D)Ljava/lang/Integer;

    move-result-object v8

    iput-object v8, v2, Lorg/rabochaya/projects/SvgIcon$Paint;->fill:Ljava/lang/Integer;

    iget-object v8, v2, Lorg/rabochaya/projects/SvgIcon$Paint;->stroke:Ljava/lang/Integer;

    const-string v9, "stroke-opacity"

    invoke-static {v3, v9}, Lorg/rabochaya/projects/SvgIcon;->access$700(Ljava/util/Map;Ljava/lang/String;)D

    move-result-wide v9

    mul-double/2addr v4, v9

    invoke-static {v8, v4, v5}, Lorg/rabochaya/projects/SvgIcon;->access$800(Ljava/lang/Integer;D)Ljava/lang/Integer;

    move-result-object v4

    iput-object v4, v2, Lorg/rabochaya/projects/SvgIcon$Paint;->stroke:Ljava/lang/Integer;

    .line 33
    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_26

    const-string v1, "d"

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_25

    goto/16 :goto_13

    :cond_25
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->access$100()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1

    .line 34
    :cond_26
    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const-string v5, "M"

    if-eqz v4, :cond_28

    const-string v1, "x"

    const-wide/16 v8, 0x0

    invoke-static {v3, v1, v8, v9}, Lorg/rabochaya/projects/SvgIcon;->access$300(Ljava/util/Map;Ljava/lang/String;D)D

    move-result-wide v10

    const-string v1, "y"

    invoke-static {v3, v1, v8, v9}, Lorg/rabochaya/projects/SvgIcon;->access$300(Ljava/util/Map;Ljava/lang/String;D)D

    move-result-wide v12

    invoke-static {v3, v14, v8, v9}, Lorg/rabochaya/projects/SvgIcon;->access$300(Ljava/util/Map;Ljava/lang/String;D)D

    move-result-wide v14

    invoke-static {v14, v15}, Lorg/rabochaya/projects/SvgIcon;->access$400(D)D

    move-result-wide v14

    invoke-static {v3, v7, v8, v9}, Lorg/rabochaya/projects/SvgIcon;->access$300(Ljava/util/Map;Ljava/lang/String;D)D

    move-result-wide v3

    invoke-static {v3, v4}, Lorg/rabochaya/projects/SvgIcon;->access$400(D)D

    move-result-wide v3

    cmpl-double v1, v14, v8

    if-eqz v1, :cond_27

    cmpl-double v1, v3, v8

    if-eqz v1, :cond_27

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10, v11}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v7, v21

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v12, v13}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "h"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v14, v15}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "v"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "h"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    neg-double v3, v14

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "z"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_13

    :cond_27
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->access$100()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1

    .line 35
    :cond_28
    move-object/from16 v7, v21

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2f

    move-object/from16 v4, v22

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_29

    goto/16 :goto_10

    .line 36
    :cond_29
    move-object/from16 v4, v17

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2a

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "x1"

    const-wide/16 v8, 0x0

    invoke-static {v3, v4, v8, v9}, Lorg/rabochaya/projects/SvgIcon;->access$300(Ljava/util/Map;Ljava/lang/String;D)D

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "y1"

    invoke-static {v3, v4, v8, v9}, Lorg/rabochaya/projects/SvgIcon;->access$300(Ljava/util/Map;Ljava/lang/String;D)D

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "L"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "x2"

    invoke-static {v3, v4, v8, v9}, Lorg/rabochaya/projects/SvgIcon;->access$300(Ljava/util/Map;Ljava/lang/String;D)D

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "y2"

    invoke-static {v3, v4, v8, v9}, Lorg/rabochaya/projects/SvgIcon;->access$300(Ljava/util/Map;Ljava/lang/String;D)D

    move-result-wide v3

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_13

    .line 37
    :cond_2a
    const-string v4, "points"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const/16 v4, 0x2000

    invoke-static {v3, v4}, Lorg/rabochaya/projects/SvgIcon;->access$600(Ljava/lang/String;I)[D

    move-result-object v3

    array-length v4, v3

    if-lt v4, v15, :cond_2e

    array-length v4, v3

    const/4 v7, 0x2

    rem-int/2addr v4, v7

    if-nez v4, :cond_2e

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v5, v23

    :goto_f
    array-length v7, v3

    if-ge v5, v7, :cond_2c

    if-lez v5, :cond_2b

    const/16 v7, 0x4c

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_2b
    aget-wide v7, v3, v5

    invoke-virtual {v4, v7, v8}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x20

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    add-int/lit8 v8, v5, 0x1

    aget-wide v8, v3, v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    add-int/lit8 v5, v5, 0x2

    goto :goto_f

    :cond_2c
    move-object/from16 v3, v16

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2d

    const/16 v1, 0x7a

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_2d
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_13

    :cond_2e
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->access$100()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1

    .line 35
    :cond_2f
    :goto_10
    const-string v4, "cx"

    const-wide/16 v8, 0x0

    invoke-static {v3, v4, v8, v9}, Lorg/rabochaya/projects/SvgIcon;->access$300(Ljava/util/Map;Ljava/lang/String;D)D

    move-result-wide v10

    const-string v4, "cy"

    invoke-static {v3, v4, v8, v9}, Lorg/rabochaya/projects/SvgIcon;->access$300(Ljava/util/Map;Ljava/lang/String;D)D

    move-result-wide v14

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_30

    const-string v4, "r"

    goto :goto_11

    :cond_30
    const-string v4, "rx"

    :goto_11
    invoke-static {v3, v4, v8, v9}, Lorg/rabochaya/projects/SvgIcon;->access$300(Ljava/util/Map;Ljava/lang/String;D)D

    move-result-wide v16

    invoke-static/range {v16 .. v17}, Lorg/rabochaya/projects/SvgIcon;->access$400(D)D

    move-result-wide v8

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_31

    move-wide v3, v8

    const-wide/16 v12, 0x0

    goto :goto_12

    :cond_31
    const-string v1, "ry"

    const-wide/16 v12, 0x0

    invoke-static {v3, v1, v12, v13}, Lorg/rabochaya/projects/SvgIcon;->access$300(Ljava/util/Map;Ljava/lang/String;D)D

    move-result-wide v3

    invoke-static {v3, v4}, Lorg/rabochaya/projects/SvgIcon;->access$400(D)D

    move-result-wide v3

    :goto_12
    cmpl-double v1, v8, v12

    if-eqz v1, :cond_34

    cmpl-double v1, v3, v12

    if-eqz v1, :cond_34

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sub-double/2addr v10, v8

    invoke-virtual {v1, v10, v11}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v14, v15}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "a"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, " 0 1 0 "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-wide/high16 v10, 0x4000000000000000L    # 2.0

    mul-double/2addr v10, v8

    invoke-virtual {v1, v10, v11}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, " 0a"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " 0 1 0 "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-wide/high16 v3, -0x4000000000000000L    # -2.0

    mul-double/2addr v8, v3

    invoke-virtual {v1, v8, v9}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " 0z"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 38
    :goto_13
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_32

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    goto :goto_14

    :cond_32
    invoke-static {v1}, Lorg/rabochaya/projects/SvgPath;->parse(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    :goto_14
    iget v3, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->segments:I

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    add-int/2addr v3, v4

    iput v3, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->segments:I

    iget v3, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->segments:I

    const/16 v4, 0x1000

    if-gt v3, v4, :cond_33

    iget-object v3, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->shapes:Ljava/util/ArrayList;

    new-instance v4, Lorg/rabochaya/projects/SvgIcon$Shape;

    const/4 v5, 0x0

    invoke-direct {v4, v1, v2, v5}, Lorg/rabochaya/projects/SvgIcon$Shape;-><init>(Ljava/util/List;Lorg/rabochaya/projects/SvgIcon$Paint;Lorg/rabochaya/projects/SvgIcon$1;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_15

    :cond_33
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->access$100()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1

    .line 35
    :cond_34
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->access$100()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1

    .line 39
    :cond_35
    :goto_15
    iget-object v1, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->stack:Ljava/util/ArrayDeque;

    invoke-virtual {v1, v2}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    iget-object v1, v0, Lorg/rabochaya/projects/SvgIcon$Reader;->containers:Ljava/util/ArrayDeque;

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    .line 40
    return-void

    .line 24
    :cond_36
    invoke-static {}, Lorg/rabochaya/projects/SvgIcon;->access$100()Ljava/lang/IllegalArgumentException;

    move-result-object v1

    throw v1
.end method

.method public startEntity(Ljava/lang/String;)V
    .locals 0

    .line 44
    return-void
.end method
