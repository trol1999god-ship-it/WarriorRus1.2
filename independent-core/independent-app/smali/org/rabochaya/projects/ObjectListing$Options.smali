.class public final Lorg/rabochaya/projects/ObjectListing$Options;
.super Ljava/lang/Object;
.source "ObjectListing.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/ObjectListing;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Options"
.end annotation


# instance fields
.field public final dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

.field public final foldersFirst:Z

.field public final kind:I

.field public final query:Ljava/lang/String;

.field public final recursive:Z

.field public final searchField:I

.field public final sort:I

.field public final visibility:I


# direct methods
.method public constructor <init>(Ljava/lang/String;IIIZZ)V
    .locals 8

    .line 11
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-direct/range {v0 .. v7}, Lorg/rabochaya/projects/ObjectListing$Options;-><init>(Ljava/lang/String;IIIZZI)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIIZZI)V
    .locals 11

    .line 12
    const-string v9, ""

    const-string v10, ""

    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    invoke-direct/range {v0 .. v10}, Lorg/rabochaya/projects/ObjectListing$Options;-><init>(Ljava/lang/String;IIIZZIILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIIZZIILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lorg/rabochaya/projects/KmlTimeFilter$Query;

    invoke-direct {v0, p8, p9, p10}, Lorg/rabochaya/projects/KmlTimeFilter$Query;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    if-ltz p7, :cond_0

    sget-object p8, Lorg/rabochaya/projects/ObjectListing;->SEARCH_FIELDS:[Ljava/lang/String;

    array-length p8, p8

    if-ge p7, p8, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p8

    const/16 p9, 0x100

    if-gt p8, p9, :cond_0

    if-ltz p2, :cond_0

    sget-object p8, Lorg/rabochaya/projects/ObjectListing;->KINDS:[Ljava/lang/String;

    array-length p8, p8

    if-ge p2, p8, :cond_0

    if-ltz p3, :cond_0

    sget-object p8, Lorg/rabochaya/projects/ObjectListing;->VISIBILITY:[Ljava/lang/String;

    array-length p8, p8

    if-ge p3, p8, :cond_0

    if-ltz p4, :cond_0

    sget-object p8, Lorg/rabochaya/projects/ObjectListing;->SORTS:[Ljava/lang/String;

    array-length p8, p8

    if-ge p4, p8, :cond_0

    iput p7, p0, Lorg/rabochaya/projects/ObjectListing$Options;->searchField:I

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/rabochaya/projects/ObjectListing$Options;->query:Ljava/lang/String;

    iput p2, p0, Lorg/rabochaya/projects/ObjectListing$Options;->kind:I

    iput p3, p0, Lorg/rabochaya/projects/ObjectListing$Options;->visibility:I

    iput p4, p0, Lorg/rabochaya/projects/ObjectListing$Options;->sort:I

    iput-boolean p5, p0, Lorg/rabochaya/projects/ObjectListing$Options;->recursive:Z

    iput-boolean p6, p0, Lorg/rabochaya/projects/ObjectListing$Options;->foldersFirst:Z

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u041d\u0435\u0434\u043e\u043f\u0443\u0441\u0442\u0438\u043c\u044b\u0435 \u043d\u0430\u0441\u0442\u0440\u043e\u0439\u043a\u0438 \u0441\u043f\u0438\u0441\u043a\u0430"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static defaults()Lorg/rabochaya/projects/ObjectListing$Options;
    .locals 8

    .line 14
    new-instance v7, Lorg/rabochaya/projects/ObjectListing$Options;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v1, ""

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lorg/rabochaya/projects/ObjectListing$Options;-><init>(Ljava/lang/String;IIIZZ)V

    return-object v7
.end method


# virtual methods
.method public filtered()Z
    .locals 1

    .line 15
    iget-object v0, p0, Lorg/rabochaya/projects/ObjectListing$Options;->query:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lorg/rabochaya/projects/ObjectListing$Options;->kind:I

    if-nez v0, :cond_1

    iget v0, p0, Lorg/rabochaya/projects/ObjectListing$Options;->visibility:I

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lorg/rabochaya/projects/ObjectListing$Options;->recursive:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/rabochaya/projects/ObjectListing$Options;->dates:Lorg/rabochaya/projects/KmlTimeFilter$Query;

    iget v0, v0, Lorg/rabochaya/projects/KmlTimeFilter$Query;->mode:I

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method
