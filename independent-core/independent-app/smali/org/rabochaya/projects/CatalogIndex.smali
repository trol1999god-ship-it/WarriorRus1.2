.class public final Lorg/rabochaya/projects/CatalogIndex;
.super Ljava/lang/Object;
.source "CatalogIndex.java"


# static fields
.field private static final ORDER:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 5
    const-string v5, "Google Maps"

    const-string v6, "USGS Maps (USA)"

    const-string v0, "\u042f\u043d\u0434\u0435\u043a\u0441 \u041a\u0430\u0440\u0442\u044b"

    const-string v1, "ESRI Community Maps"

    const-string v2, "\u0421\u043e\u0432\u0435\u0442\u0441\u043a\u0438\u0435 \u0442\u043e\u043f\u043e\u043a\u0430\u0440\u0442\u044b \u2014 \u043d\u0435\u0437\u0430\u0432\u0438\u0441\u0438\u043c\u044b\u0439 \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a"

    const-string v3, "OpenStreetMap Maps"

    const-string v4, "Bing Maps"

    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/CatalogIndex;->ORDER:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static entries(Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/MapCatalog$Entry;",
            ">;"
        }
    .end annotation

    .line 8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, Lorg/rabochaya/projects/MapCatalog;->entries()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/MapCatalog$Entry;

    iget-object v3, v2, Lorg/rabochaya/projects/MapCatalog$Entry;->group:Ljava/lang/String;

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static find(Ljava/lang/String;)Lorg/rabochaya/projects/MapCatalog$Entry;
    .locals 3

    .line 9
    invoke-static {}, Lorg/rabochaya/projects/MapCatalog;->entries()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/MapCatalog$Entry;

    iget-object v2, v1, Lorg/rabochaya/projects/MapCatalog$Entry;->key:Ljava/lang/String;

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static groups()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 7
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-static {}, Lorg/rabochaya/projects/MapCatalog;->entries()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/rabochaya/projects/MapCatalog$Entry;

    iget-object v2, v2, Lorg/rabochaya/projects/MapCatalog$Entry;->group:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sget-object v2, Lorg/rabochaya/projects/CatalogIndex;->ORDER:[Ljava/lang/String;

    array-length v3, v2

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v3, :cond_2

    aget-object v5, v2, v4

    invoke-virtual {v0, v5}, Ljava/util/LinkedHashSet;->remove(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_2
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static preview(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 11
    const-string v0, "BINGHYB"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "hybr"

    if-eqz v0, :cond_0

    return-object v1

    .line 12
    :cond_0
    const-string v0, "BINGMAP"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v2, "road"

    if-eqz v0, :cond_1

    return-object v2

    .line 13
    :cond_1
    const-string v0, "BINGPT"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    return-object v2

    .line 14
    :cond_2
    const-string v0, "BINGSAT"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v3, "sate"

    if-eqz v0, :cond_3

    return-object v3

    .line 15
    :cond_3
    const-string v0, "BINGTERRAIN"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v4, "topo"

    if-eqz v0, :cond_4

    return-object v4

    .line 16
    :cond_4
    const-string v0, "ESRI_IMAGERY_LABELS"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    return-object v1

    .line 17
    :cond_5
    const-string v0, "ESRI_LIGHT_GRAY"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    return-object v2

    .line 18
    :cond_6
    const-string v0, "ESRI_NATGEO"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-object v4

    .line 19
    :cond_7
    const-string v0, "ESRI_OCEAN"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    return-object v4

    .line 20
    :cond_8
    const-string v0, "ESRI_PHYSICAL"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-object v4

    .line 21
    :cond_9
    const-string v0, "ESRI_PLACES_LAYER"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    return-object v2

    .line 22
    :cond_a
    const-string v0, "ESRI_REFERENCE_LAYER"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    return-object v2

    .line 23
    :cond_b
    const-string v0, "ESRI_ROADS_LAYER"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    return-object v2

    .line 24
    :cond_c
    const-string v0, "ESRI_SHADED_RELIEF"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    return-object v4

    .line 25
    :cond_d
    const-string v0, "ESRI_TERRAIN"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    return-object v4

    .line 26
    :cond_e
    const-string v0, "ESRI_WORLD_IMAGERY"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    return-object v3

    .line 27
    :cond_f
    const-string v0, "ESRI_WORLD_STREETS"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    return-object v2

    .line 28
    :cond_10
    const-string v0, "ESRI_WORLD_TOPO"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    return-object v4

    .line 29
    :cond_11
    const-string v0, "GBIKEL"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    return-object v2

    .line 30
    :cond_12
    const-string v0, "GEARTH"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    return-object v3

    .line 31
    :cond_13
    const-string v0, "GHYBRID"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    return-object v1

    .line 32
    :cond_14
    const-string v0, "GMAPS"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    return-object v2

    .line 33
    :cond_15
    const-string v0, "GMAPSLOC"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    return-object v2

    .line 34
    :cond_16
    const-string v0, "GMBIKE"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    return-object v2

    .line 35
    :cond_17
    const-string v0, "GMPT"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    return-object v2

    .line 36
    :cond_18
    const-string v0, "GROADS"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    return-object v2

    .line 37
    :cond_19
    const-string v0, "GROADSPTL"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    return-object v2

    .line 38
    :cond_1a
    const-string v0, "GTERR"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    return-object v4

    .line 39
    :cond_1b
    const-string v0, "OSMCYC"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    return-object v4

    .line 40
    :cond_1c
    const-string v0, "OSMFR"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    return-object v2

    .line 41
    :cond_1d
    const-string v0, "OSMHBMAP"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    return-object v2

    .line 42
    :cond_1e
    const-string v0, "OSMHOT"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1f

    return-object v2

    .line 43
    :cond_1f
    const-string v0, "OSMLAND"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    return-object v4

    .line 44
    :cond_20
    const-string v0, "OSMMPN"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    return-object v2

    .line 45
    :cond_21
    const-string v0, "OSMMPQ"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    return-object v2

    .line 46
    :cond_22
    const-string v0, "OSMOMSAB"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_23

    return-object v2

    .line 47
    :cond_23
    const-string v0, "OSMOMSCTR"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v5, "cont"

    if-eqz v0, :cond_24

    return-object v5

    .line 48
    :cond_24
    const-string v0, "OSMOMSHYB"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_25

    return-object v2

    .line 49
    :cond_25
    const-string v0, "OSMOMSROADS"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    return-object v2

    .line 50
    :cond_26
    const-string v0, "OSMOTM"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    return-object v4

    .line 51
    :cond_27
    const-string v0, "OSMOUTD"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    return-object v4

    .line 52
    :cond_28
    const-string v0, "OSMSHD"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    const-string p0, "hill"

    return-object p0

    .line 53
    :cond_29
    const-string v0, "OSMTSP"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    return-object v2

    .line 54
    :cond_2a
    const-string v0, "OSMWMCC"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2b

    return-object v2

    .line 55
    :cond_2b
    const-string v0, "OSMWMHC"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    return-object v2

    .line 56
    :cond_2c
    const-string v0, "SMMAP"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2d

    return-object v4

    .line 57
    :cond_2d
    const-string v0, "USGSCTL"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    return-object v5

    .line 58
    :cond_2e
    const-string v0, "USGSHYD"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    return-object v2

    .line 59
    :cond_2f
    const-string v0, "USGSIMG"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    return-object v3

    .line 60
    :cond_30
    const-string v0, "USGSIMGTOPO"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_31

    return-object v1

    .line 61
    :cond_31
    const-string v0, "USGSRDL"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    return-object v2

    .line 62
    :cond_32
    const-string v0, "USGSSCAN"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_33

    return-object v4

    .line 63
    :cond_33
    const-string v0, "USGSTOPO"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    return-object v4

    .line 64
    :cond_34
    const-string v0, "YANDEX_HYBRID"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_35

    return-object v1

    .line 65
    :cond_35
    const-string v0, "YANDEX_LABELS"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    return-object v2

    .line 66
    :cond_36
    const-string v0, "YANDEX_MAP"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    return-object v2

    .line 67
    :cond_37
    const-string v0, "YANDEX_SAT"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_38

    return-object v3

    .line 68
    :cond_38
    return-object v2
.end method
