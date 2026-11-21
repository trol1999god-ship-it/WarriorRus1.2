.class public final Lorg/rabochaya/projects/MapCatalog;
.super Ljava/lang/Object;
.source "MapCatalog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/rabochaya/projects/MapCatalog$Entry;
    }
.end annotation


# static fields
.field private static final ALL:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/MapCatalog$Entry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 6
    invoke-static {}, Lorg/rabochaya/projects/MapCatalog;->build()Ljava/util/List;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/MapCatalog;->ALL:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static build()Ljava/util/List;
    .locals 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/MapCatalog$Entry;",
            ">;"
        }
    .end annotation

    .line 6
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 7
    const/16 v2, 0x18

    new-array v3, v2, [Ljava/lang/String;

    .line 8
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    const/4 v5, 0x1

    aput-object v4, v3, v5

    .line 9
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    const/4 v6, 0x2

    aput-object v4, v3, v6

    .line 10
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    const/4 v7, 0x3

    aput-object v4, v3, v7

    .line 11
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    const/4 v8, 0x4

    aput-object v4, v3, v8

    .line 12
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    const/4 v9, 0x5

    aput-object v4, v3, v9

    .line 13
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    const/4 v10, 0x6

    aput-object v4, v3, v10

    .line 14
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    const/4 v11, 0x7

    aput-object v4, v3, v11

    .line 15
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    const/16 v12, 0x8

    aput-object v4, v3, v12

    .line 16
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    const/16 v13, 0x9

    aput-object v4, v3, v13

    .line 17
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 18
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    const/16 v15, 0xb

    aput-object v4, v3, v15

    .line 19
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    const/16 v16, 0xc

    aput-object v4, v3, v16

    .line 20
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    const/16 v17, 0xd

    aput-object v4, v3, v17

    .line 21
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    const/16 v18, 0xe

    aput-object v4, v3, v18

    .line 22
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    const/16 v19, 0xf

    aput-object v4, v3, v19

    .line 23
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    const/16 v20, 0x10

    aput-object v4, v3, v20

    .line 24
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    const/16 v21, 0x11

    aput-object v4, v3, v21

    .line 25
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    const/16 v22, 0x12

    aput-object v4, v3, v22

    .line 26
    const/16 v4, 0x13

    const-string v23, "https://ecn.t0.tiles.virtualearth.net/tiles/r{q}.png?g=14388&n=z"

    aput-object v23, v3, v4

    .line 27
    const-string v4, "Roads Map"

    const-string v15, "Microsoft"

    const/4 v14, 0x0

    invoke-static {v4, v15, v3, v14, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "BINGMAP"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "BINGMAP"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v15, "BINGMAP"

    const-string v14, "Bing Maps"

    invoke-direct {v3, v15, v14, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    new-array v3, v2, [Ljava/lang/String;

    .line 30
    const-string v4, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    aput-object v4, v3, v5

    .line 31
    const-string v4, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    aput-object v4, v3, v6

    .line 32
    const-string v4, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    aput-object v4, v3, v7

    .line 33
    const-string v4, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    aput-object v4, v3, v8

    .line 34
    const-string v4, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    aput-object v4, v3, v9

    .line 35
    const-string v4, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    aput-object v4, v3, v10

    .line 36
    const-string v4, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    aput-object v4, v3, v11

    .line 37
    const-string v4, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    aput-object v4, v3, v12

    .line 38
    const-string v4, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    aput-object v4, v3, v13

    .line 39
    const-string v4, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 40
    const-string v4, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 41
    const-string v4, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    aput-object v4, v3, v16

    .line 42
    const-string v4, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    aput-object v4, v3, v17

    .line 43
    const-string v4, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    aput-object v4, v3, v18

    .line 44
    const-string v4, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    aput-object v4, v3, v19

    .line 45
    const-string v4, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    aput-object v4, v3, v20

    .line 46
    const-string v4, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    aput-object v4, v3, v21

    .line 47
    const-string v4, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    aput-object v4, v3, v22

    .line 48
    const/16 v4, 0x13

    const-string v14, "https://ak.dynamic.t0.tiles.virtualearth.net/comp/ch/{q}?it=G,LC,BX,RL&shading=t&og=2461&cstl=vbp2&n=z"

    aput-object v14, v3, v4

    .line 49
    const-string v4, "Terrain Map"

    const-string v14, "Microsoft"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "BINGTERRAIN"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "BINGTERRAIN"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "BINGTERRAIN"

    const-string v15, "Bing Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    new-array v3, v2, [Ljava/lang/String;

    .line 52
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v5

    .line 53
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v6

    .line 54
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v7

    .line 55
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v8

    .line 56
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v9

    .line 57
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v10

    .line 58
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v11

    .line 59
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v12

    .line 60
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v13

    .line 61
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 62
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 63
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v16

    .line 64
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v17

    .line 65
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v18

    .line 66
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v19

    .line 67
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v20

    .line 68
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v21

    .line 69
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v22

    .line 70
    const/16 v4, 0x13

    const-string v14, "https://ecn.t0.tiles.virtualearth.net/tiles/a{q}.jpeg?g=14388&n=z"

    aput-object v14, v3, v4

    .line 71
    const-string v4, "Aerial Map"

    const-string v14, "Microsoft"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "BINGSAT"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "BINGSAT"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "BINGSAT"

    const-string v15, "Bing Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    new-array v3, v2, [Ljava/lang/String;

    .line 74
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v5

    .line 75
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v6

    .line 76
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v7

    .line 77
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v8

    .line 78
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v9

    .line 79
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v10

    .line 80
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v11

    .line 81
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v12

    .line 82
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v13

    .line 83
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 84
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 85
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v16

    .line 86
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v17

    .line 87
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v18

    .line 88
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v19

    .line 89
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v20

    .line 90
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v21

    .line 91
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    aput-object v4, v3, v22

    .line 92
    const/16 v4, 0x13

    const-string v14, "https://ecn.t0.tiles.virtualearth.net/tiles/h{q}.jpeg?g=14388&n=z"

    aput-object v14, v3, v4

    .line 93
    const-string v4, "Hybrid Map"

    const-string v14, "Microsoft"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "BINGHYB"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "BINGHYB"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "BINGHYB"

    const-string v15, "Bing Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    new-array v3, v2, [Ljava/lang/String;

    .line 96
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/pt{q}.png?g=14388&n=z&productSet=mmNT"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 97
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/pt{q}.png?g=14388&n=z&productSet=mmNT"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 98
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/pt{q}.png?g=14388&n=z&productSet=mmNT"

    aput-object v4, v3, v16

    .line 99
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/pt{q}.png?g=14388&n=z&productSet=mmNT"

    aput-object v4, v3, v17

    .line 100
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/pt{q}.png?g=14388&n=z&productSet=mmNT"

    aput-object v4, v3, v18

    .line 101
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/pt{q}.png?g=14388&n=z&productSet=mmNT"

    aput-object v4, v3, v19

    .line 102
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/pt{q}.png?g=14388&n=z&productSet=mmNT"

    aput-object v4, v3, v20

    .line 103
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/pt{q}.png?g=14388&n=z&productSet=mmNT"

    aput-object v4, v3, v21

    .line 104
    const-string v4, "https://ecn.t0.tiles.virtualearth.net/tiles/pt{q}.png?g=14388&n=z&productSet=mmNT"

    aput-object v4, v3, v22

    .line 105
    const/16 v4, 0x13

    const-string v14, "https://ecn.t0.tiles.virtualearth.net/tiles/pt{q}.png?g=14388&n=z&productSet=mmNT"

    aput-object v14, v3, v4

    .line 106
    const-string v4, "Transports Layer"

    const-string v14, "Microsoft"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "BINGPT"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "BINGPT"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "BINGPT"

    const-string v15, "Bing Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 108
    new-array v3, v2, [Ljava/lang/String;

    .line 109
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v5

    .line 110
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v6

    .line 111
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v7

    .line 112
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v8

    .line 113
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v9

    .line 114
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v10

    .line 115
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v11

    .line 116
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v12

    .line 117
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v13

    .line 118
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 119
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 120
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v16

    .line 121
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v17

    .line 122
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v18

    .line 123
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v19

    .line 124
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v20

    .line 125
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v21

    .line 126
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v22

    .line 127
    const/16 v4, 0x13

    const-string v14, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    aput-object v14, v3, v4

    .line 128
    const/16 v4, 0x14

    const-string v14, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}"

    aput-object v14, v3, v4

    .line 129
    const-string v4, "ESRI \u2014 \u0441\u043f\u0443\u0442\u043d\u0438\u043a"

    const-string v14, "Source: Esri, Vantor, Earthstar Geographics, and the GIS User Community"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "ESRI_WORLD_IMAGERY"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "ESRI_WORLD_IMAGERY"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "ESRI_WORLD_IMAGERY"

    const-string v15, "ESRI Community Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 131
    new-array v3, v2, [Ljava/lang/String;

    .line 132
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v5

    .line 133
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v6

    .line 134
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v7

    .line 135
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v8

    .line 136
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v9

    .line 137
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v10

    .line 138
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v11

    .line 139
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v12

    .line 140
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v13

    .line 141
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 142
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 143
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v16

    .line 144
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v17

    .line 145
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v18

    .line 146
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v19

    .line 147
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v20

    .line 148
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v21

    .line 149
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v22

    .line 150
    const/16 v4, 0x13

    const-string v14, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v14, v3, v4

    .line 151
    const-string v4, "ESRI \u2014 \u0442\u043e\u043f\u043e\u0433\u0440\u0430\u0444\u0438\u0447\u0435\u0441\u043a\u0430\u044f"

    const-string v14, "Sources: Esri, HERE, Garmin, Intermap, increment P Corp., GEBCO, USGS, FAO, NPS, NRCAN, GeoBase, IGN, Kadaster NL, Ordnance Survey, Esri Japan, METI, Esri China (Hong Kong), (c) OpenStreetMap contributors, and the GIS User Community"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "ESRI_WORLD_TOPO"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "ESRI_WORLD_TOPO"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "ESRI_WORLD_TOPO"

    const-string v15, "ESRI Community Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 153
    new-array v3, v2, [Ljava/lang/String;

    .line 154
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v5

    .line 155
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v6

    .line 156
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v7

    .line 157
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v8

    .line 158
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v9

    .line 159
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v10

    .line 160
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v11

    .line 161
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v12

    .line 162
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v13

    .line 163
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 164
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 165
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v16

    .line 166
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v17

    .line 167
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v18

    .line 168
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v19

    .line 169
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v20

    .line 170
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v21

    .line 171
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v22

    .line 172
    const/16 v4, 0x13

    const-string v14, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v14, v3, v4

    .line 173
    const-string v4, "ESRI \u2014 \u0443\u043b\u0438\u0446\u044b"

    const-string v14, "Sources: Esri, HERE, Garmin, USGS, Intermap, INCREMENT P, NRCan, Esri Japan, METI, Esri China (Hong Kong), Esri Korea, Esri (Thailand), NGCC, (c) OpenStreetMap contributors, and the GIS User Community"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "ESRI_WORLD_STREETS"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "ESRI_WORLD_STREETS"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "ESRI_WORLD_STREETS"

    const-string v15, "ESRI Community Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 175
    new-array v3, v2, [Ljava/lang/String;

    .line 176
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v5

    .line 177
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v6

    .line 178
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v7

    .line 179
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v8

    .line 180
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v9

    .line 181
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v10

    .line 182
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v11

    .line 183
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v12

    .line 184
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v13

    .line 185
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 186
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 187
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v16

    .line 188
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v17

    .line 189
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v18

    .line 190
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v19

    .line 191
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/NatGeo_World_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v20

    .line 192
    const-string v4, "ESRI \u2014 National Geographic"

    const-string v14, "National Geographic, Esri, Garmin, HERE, UNEP-WCMC, USGS, NASA, ESA, METI, NRCAN, GEBCO, NOAA, increment P Corp."

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "ESRI_NATGEO"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "ESRI_NATGEO"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "ESRI_NATGEO"

    const-string v15, "ESRI Community Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 194
    new-array v3, v2, [Ljava/lang/String;

    .line 195
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v5

    .line 196
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v6

    .line 197
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v7

    .line 198
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v8

    .line 199
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v9

    .line 200
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v10

    .line 201
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v11

    .line 202
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v12

    .line 203
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v13

    .line 204
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 205
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 206
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v16

    .line 207
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Terrain_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v17

    .line 208
    const-string v4, "ESRI \u2014 \u0440\u0435\u043b\u044c\u0435\u0444 (\u043a\u0430\u0440\u0442\u0430)"

    const-string v14, "Sources: Esri, USGS, NOAA"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "ESRI_TERRAIN"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "ESRI_TERRAIN"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "ESRI_TERRAIN"

    const-string v15, "ESRI Community Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 210
    new-array v3, v2, [Ljava/lang/String;

    .line 211
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v5

    .line 212
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v6

    .line 213
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v7

    .line 214
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v8

    .line 215
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v9

    .line 216
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v10

    .line 217
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v11

    .line 218
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v12

    .line 219
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v13

    .line 220
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 221
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 222
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v16

    .line 223
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Shaded_Relief/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v17

    .line 224
    const-string v4, "ESRI \u2014 \u043e\u0442\u043c\u044b\u0432\u043a\u0430 \u0440\u0435\u043b\u044c\u0435\u0444\u0430"

    const-string v14, "Copyright:(c) 2014 Esri"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "ESRI_SHADED_RELIEF"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "ESRI_SHADED_RELIEF"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "ESRI_SHADED_RELIEF"

    const-string v15, "ESRI Community Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 226
    new-array v3, v2, [Ljava/lang/String;

    .line 227
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Physical_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v5

    .line 228
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Physical_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v6

    .line 229
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Physical_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v7

    .line 230
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Physical_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v8

    .line 231
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Physical_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v9

    .line 232
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Physical_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v10

    .line 233
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Physical_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v11

    .line 234
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/World_Physical_Map/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v12

    .line 235
    const-string v4, "ESRI \u2014 \u0444\u0438\u0437\u0438\u0447\u0435\u0441\u043a\u0430\u044f \u043a\u0430\u0440\u0442\u0430"

    const-string v14, "Source: US National Park Service"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "ESRI_PHYSICAL"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "ESRI_PHYSICAL"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "ESRI_PHYSICAL"

    const-string v15, "ESRI Community Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 237
    new-array v3, v2, [Ljava/lang/String;

    .line 238
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Ocean/World_Ocean_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v5

    .line 239
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Ocean/World_Ocean_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v6

    .line 240
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Ocean/World_Ocean_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v7

    .line 241
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Ocean/World_Ocean_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v8

    .line 242
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Ocean/World_Ocean_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v9

    .line 243
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Ocean/World_Ocean_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v10

    .line 244
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Ocean/World_Ocean_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v11

    .line 245
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Ocean/World_Ocean_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v12

    .line 246
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Ocean/World_Ocean_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v13

    .line 247
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Ocean/World_Ocean_Base/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 248
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Ocean/World_Ocean_Base/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 249
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Ocean/World_Ocean_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v16

    .line 250
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Ocean/World_Ocean_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v17

    .line 251
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Ocean/World_Ocean_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v18

    .line 252
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Ocean/World_Ocean_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v19

    .line 253
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Ocean/World_Ocean_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v20

    .line 254
    const-string v4, "ESRI \u2014 \u043e\u043a\u0435\u0430\u043d\u044b"

    const-string v14, "Esri, Garmin, GEBCO, NOAA NGDC, and other contributors"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "ESRI_OCEAN"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "ESRI_OCEAN"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "ESRI_OCEAN"

    const-string v15, "ESRI Community Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 256
    new-array v3, v2, [Ljava/lang/String;

    .line 257
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v5

    .line 258
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v6

    .line 259
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v7

    .line 260
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v8

    .line 261
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v9

    .line 262
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v10

    .line 263
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v11

    .line 264
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v12

    .line 265
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v13

    .line 266
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 267
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 268
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v16

    .line 269
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v17

    .line 270
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v18

    .line 271
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v19

    .line 272
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v20

    .line 273
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v21

    .line 274
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v22

    .line 275
    const/16 v4, 0x13

    const-string v14, "https://services.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}"

    aput-object v14, v3, v4

    .line 276
    const-string v4, "ESRI \u2014 \u0441\u0432\u0435\u0442\u043b\u0430\u044f \u043e\u0441\u043d\u043e\u0432\u0430"

    const-string v14, "Esri, HERE, Garmin, (c) OpenStreetMap contributors, and the GIS user community"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "ESRI_LIGHT_GRAY"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "ESRI_LIGHT_GRAY"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "ESRI_LIGHT_GRAY"

    const-string v15, "ESRI Community Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 278
    new-array v3, v2, [Ljava/lang/String;

    .line 279
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v5

    .line 280
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v6

    .line 281
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v7

    .line 282
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v8

    .line 283
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v9

    .line 284
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v10

    .line 285
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v11

    .line 286
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v12

    .line 287
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v13

    .line 288
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 289
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 290
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v16

    .line 291
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v17

    .line 292
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v18

    .line 293
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v19

    .line 294
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v20

    .line 295
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v21

    .line 296
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v22

    .line 297
    const/16 v4, 0x13

    const-string v14, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v14, v3, v4

    .line 298
    const/16 v4, 0x14

    const-string v14, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v14, v3, v4

    .line 299
    const/16 v4, 0x15

    const-string v14, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v14, v3, v4

    .line 300
    const/16 v4, 0x16

    const-string v14, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v14, v3, v4

    .line 301
    const/16 v4, 0x17

    const-string v14, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/MapServer/tile/{z}/{y}/{x}"

    aput-object v14, v3, v4

    .line 302
    const-string v4, "ESRI Places Layer \u2014 \u043d\u0430\u0437\u0432\u0430\u043d\u0438\u044f \u0438 \u0433\u0440\u0430\u043d\u0438\u0446\u044b"

    const-string v14, "Esri, HERE, Garmin, \u00a9 OpenStreetMap contributors, and the GIS user community"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "ESRI_PLACES_LAYER"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "ESRI_PLACES_LAYER"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "ESRI_PLACES_LAYER"

    const-string v15, "ESRI Community Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 304
    new-array v3, v2, [Ljava/lang/String;

    .line 305
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v5

    .line 306
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v6

    .line 307
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v7

    .line 308
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v8

    .line 309
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v9

    .line 310
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v10

    .line 311
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v11

    .line 312
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v12

    .line 313
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v13

    .line 314
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 315
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 316
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v16

    .line 317
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v17

    .line 318
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v18

    .line 319
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v19

    .line 320
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v20

    .line 321
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v21

    .line 322
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v22

    .line 323
    const/16 v4, 0x13

    const-string v14, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v14, v3, v4

    .line 324
    const/16 v4, 0x14

    const-string v14, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v14, v3, v4

    .line 325
    const/16 v4, 0x15

    const-string v14, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v14, v3, v4

    .line 326
    const/16 v4, 0x16

    const-string v14, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v14, v3, v4

    .line 327
    const/16 v4, 0x17

    const-string v14, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Transportation/MapServer/tile/{z}/{y}/{x}"

    aput-object v14, v3, v4

    .line 328
    const-string v4, "ESRI Roads Layer \u2014 \u0434\u043e\u0440\u043e\u0433\u0438 \u0438 \u0443\u043b\u0438\u0446\u044b"

    const-string v14, "Esri, HERE, Garmin, \u00a9 OpenStreetMap contributors, and the GIS user community"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "ESRI_ROADS_LAYER"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "ESRI_ROADS_LAYER"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "ESRI_ROADS_LAYER"

    const-string v15, "ESRI Community Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 330
    new-array v3, v2, [Ljava/lang/String;

    .line 331
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Reference_Overlay/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v5

    .line 332
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Reference_Overlay/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v6

    .line 333
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Reference_Overlay/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v7

    .line 334
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Reference_Overlay/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v8

    .line 335
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Reference_Overlay/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v9

    .line 336
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Reference_Overlay/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v10

    .line 337
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Reference_Overlay/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v11

    .line 338
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Reference_Overlay/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v12

    .line 339
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Reference_Overlay/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v13

    .line 340
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Reference_Overlay/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 341
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Reference_Overlay/MapServer/tile/{z}/{y}/{x}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 342
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Reference_Overlay/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v16

    .line 343
    const-string v4, "https://services.arcgisonline.com/ArcGIS/rest/services/Reference/World_Reference_Overlay/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v17

    .line 344
    const-string v4, "ESRI Reference Layer \u2014 \u043f\u043e\u0434\u043f\u0438\u0441\u0438 \u0440\u0435\u043b\u044c\u0435\u0444\u0430"

    const-string v14, "Esri, Garmin, USGS, NPS"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "ESRI_REFERENCE_LAYER"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "ESRI_REFERENCE_LAYER"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "ESRI_REFERENCE_LAYER"

    const-string v15, "ESRI Community Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 346
    new-array v3, v2, [Ljava/lang/String;

    .line 347
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v5

    .line 348
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v6

    .line 349
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v7

    .line 350
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v8

    .line 351
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v9

    .line 352
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v10

    .line 353
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v11

    .line 354
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v12

    .line 355
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v13

    .line 356
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 357
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 358
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v16

    .line 359
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v17

    .line 360
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v18

    .line 361
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v19

    .line 362
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v20

    .line 363
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v21

    .line 364
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v22

    .line 365
    const/16 v4, 0x13

    const-string v14, "https://mt0.google.com/vt/lyrs=m@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v14, v3, v4

    .line 366
    const-string v4, "Google Map"

    const-string v14, "\u00a9 Google \u00b7 www.google.com/maps"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v15}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "GMAPS"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 367
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "GMAPS"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "GMAPS"

    const-string v15, "Google Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 368
    new-array v3, v2, [Ljava/lang/String;

    .line 369
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v5

    .line 370
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v6

    .line 371
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v7

    .line 372
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v8

    .line 373
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v9

    .line 374
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v10

    .line 375
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v11

    .line 376
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v12

    .line 377
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v13

    .line 378
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 379
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 380
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v16

    .line 381
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v17

    .line 382
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v18

    .line 383
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v19

    .line 384
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v20

    .line 385
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v21

    .line 386
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v22

    .line 387
    const/16 v4, 0x13

    const-string v14, "https://mt0.google.com/vt/lyrs=m@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v14, v3, v4

    .line 388
    const-string v4, "Google Bike"

    const-string v14, "\u00a9 Google \u00b7 www.google.com/maps"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v15}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "GMBIKE"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 389
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "GMBIKE"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "GMBIKE"

    const-string v15, "Google Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 390
    new-array v3, v2, [Ljava/lang/String;

    .line 391
    const-string v4, "https://mt0.google.com/vt/lyrs=t@132,r@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v5

    .line 392
    const-string v4, "https://mt0.google.com/vt/lyrs=t@132,r@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v6

    .line 393
    const-string v4, "https://mt0.google.com/vt/lyrs=t@132,r@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v7

    .line 394
    const-string v4, "https://mt0.google.com/vt/lyrs=t@132,r@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v8

    .line 395
    const-string v4, "https://mt0.google.com/vt/lyrs=t@132,r@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v9

    .line 396
    const-string v4, "https://mt0.google.com/vt/lyrs=t@132,r@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v10

    .line 397
    const-string v4, "https://mt0.google.com/vt/lyrs=t@132,r@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v11

    .line 398
    const-string v4, "https://mt0.google.com/vt/lyrs=t@132,r@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v12

    .line 399
    const-string v4, "https://mt0.google.com/vt/lyrs=t@132,r@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v13

    .line 400
    const-string v4, "https://mt0.google.com/vt/lyrs=t@132,r@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 401
    const-string v4, "https://mt0.google.com/vt/lyrs=t@132,r@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 402
    const-string v4, "https://mt0.google.com/vt/lyrs=t@132,r@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v16

    .line 403
    const-string v4, "https://mt0.google.com/vt/lyrs=t@132,r@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v17

    .line 404
    const-string v4, "https://mt0.google.com/vt/lyrs=t@132,r@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v18

    .line 405
    const-string v4, "https://mt0.google.com/vt/lyrs=t@132,r@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v19

    .line 406
    const-string v4, "Google Terrain"

    const-string v14, "\u00a9 Google \u00b7 www.google.com/maps"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v15}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "GTERR"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 407
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "GTERR"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "GTERR"

    const-string v15, "Google Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 408
    new-array v3, v2, [Ljava/lang/String;

    .line 409
    const-string v4, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v5

    .line 410
    const-string v4, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v6

    .line 411
    const-string v4, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v7

    .line 412
    const-string v4, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v8

    .line 413
    const-string v4, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v9

    .line 414
    const-string v4, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v10

    .line 415
    const-string v4, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v11

    .line 416
    const-string v4, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v12

    .line 417
    const-string v4, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v13

    .line 418
    const-string v4, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 419
    const-string v4, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 420
    const-string v4, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v16

    .line 421
    const-string v4, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v17

    .line 422
    const-string v4, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v18

    .line 423
    const-string v4, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v19

    .line 424
    const-string v4, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v20

    .line 425
    const-string v4, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v21

    .line 426
    const-string v4, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v22

    .line 427
    const/16 v4, 0x13

    const-string v14, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v14, v3, v4

    .line 428
    const/16 v4, 0x14

    const-string v14, "https://mt0.google.com/vt/lyrs=s&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v14, v3, v4

    .line 429
    const-string v4, "Google Satellite"

    const-string v14, "\u00a9 Google \u00b7 www.google.com/maps"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v15}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "GEARTH"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 430
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "GEARTH"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "GEARTH"

    const-string v15, "Google Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 431
    new-array v3, v2, [Ljava/lang/String;

    .line 432
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v5

    .line 433
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v6

    .line 434
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v7

    .line 435
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v8

    .line 436
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v9

    .line 437
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v10

    .line 438
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v11

    .line 439
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v12

    .line 440
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v13

    .line 441
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 442
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 443
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v16

    .line 444
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v17

    .line 445
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v18

    .line 446
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v19

    .line 447
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v20

    .line 448
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v21

    .line 449
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v22

    .line 450
    const/16 v4, 0x13

    const-string v14, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&opts=r&x={x}&y={y}&z={z}&s={s}"

    aput-object v14, v3, v4

    .line 451
    const-string v4, "Google Transit"

    const-string v14, "\u00a9 Google \u00b7 www.google.com/maps"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v15}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "GMPT"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 452
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "GMPT"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "GMPT"

    const-string v15, "Google Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 453
    new-array v3, v2, [Ljava/lang/String;

    .line 454
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v5

    .line 455
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v6

    .line 456
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v7

    .line 457
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v8

    .line 458
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v9

    .line 459
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v10

    .line 460
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v11

    .line 461
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v12

    .line 462
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v13

    .line 463
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 464
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 465
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v16

    .line 466
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v17

    .line 467
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v18

    .line 468
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v19

    .line 469
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v20

    .line 470
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v21

    .line 471
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v22

    .line 472
    const/16 v4, 0x13

    const-string v14, "https://mt0.google.com/vt/lyrs=m@689000000&hl=x-local&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v14, v3, v4

    .line 473
    const-string v4, "Google Map (Localized)"

    const-string v14, "\u00a9 Google \u00b7 www.google.com/maps"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v15}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "GMAPSLOC"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 474
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "GMAPSLOC"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "GMAPSLOC"

    const-string v15, "Google Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 475
    new-array v3, v2, [Ljava/lang/String;

    .line 476
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v5

    .line 477
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v6

    .line 478
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v7

    .line 479
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v8

    .line 480
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v9

    .line 481
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v10

    .line 482
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v11

    .line 483
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v12

    .line 484
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v13

    .line 485
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 486
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 487
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v16

    .line 488
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v17

    .line 489
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v18

    .line 490
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v19

    .line 491
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v20

    .line 492
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v21

    .line 493
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v22

    .line 494
    const/16 v4, 0x13

    const-string v14, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v14, v3, v4

    .line 495
    const/16 v4, 0x14

    const-string v14, "https://mt0.google.com/vt/lyrs=h@689000000&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v14, v3, v4

    .line 496
    const-string v4, "Google Roads Layer"

    const-string v14, "\u00a9 Google \u00b7 www.google.com/maps"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v15}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "GROADS"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 497
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "GROADS"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "GROADS"

    const-string v15, "Google Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 498
    new-array v3, v2, [Ljava/lang/String;

    .line 499
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v5

    .line 500
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v6

    .line 501
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v7

    .line 502
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v8

    .line 503
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v9

    .line 504
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v10

    .line 505
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v11

    .line 506
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v12

    .line 507
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v13

    .line 508
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 509
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 510
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v16

    .line 511
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v17

    .line 512
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v18

    .line 513
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v19

    .line 514
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v20

    .line 515
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v21

    .line 516
    const-string v4, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v22

    .line 517
    const/16 v4, 0x13

    const-string v14, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v14, v3, v4

    .line 518
    const/16 v4, 0x14

    const-string v14, "https://mt0.google.com/vt/lyrs=h@689000000,bike&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v14, v3, v4

    .line 519
    const-string v4, "Google Bike Layer"

    const-string v14, "\u00a9 Google \u00b7 www.google.com/maps"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v15}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "GBIKEL"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 520
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "GBIKEL"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "GBIKEL"

    const-string v15, "Google Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 521
    new-array v3, v2, [Ljava/lang/String;

    .line 522
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v5

    .line 523
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v6

    .line 524
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v7

    .line 525
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v8

    .line 526
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v9

    .line 527
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v10

    .line 528
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v11

    .line 529
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v12

    .line 530
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v13

    .line 531
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 532
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 533
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v16

    .line 534
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v17

    .line 535
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v18

    .line 536
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v19

    .line 537
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v20

    .line 538
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v21

    .line 539
    const-string v4, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v4, v3, v22

    .line 540
    const/16 v4, 0x13

    const-string v14, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v14, v3, v4

    .line 541
    const/16 v4, 0x14

    const-string v14, "https://mt0.google.com/vt/lyrs=m@689000000,transit&hl=en&src=app&x={x}&y={y}&z={z}&s={s}"

    aput-object v14, v3, v4

    .line 542
    const-string v4, "Google Roads & Transit Layer"

    const-string v14, "\u00a9 Google \u00b7 www.google.com/maps"

    const/4 v15, 0x0

    invoke-static {v4, v14, v3, v15, v15}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "GROADSPTL"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 543
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "GROADSPTL"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v14, "GROADSPTL"

    const-string v15, "Google Maps"

    invoke-direct {v3, v14, v15, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 544
    new-array v3, v2, [Ljava/lang/String;

    .line 545
    const-string v4, "https://tile.openstreetmap.org/{z}/{x}/{y}.png"

    aput-object v4, v3, v5

    .line 546
    aput-object v4, v3, v6

    .line 547
    aput-object v4, v3, v7

    .line 548
    aput-object v4, v3, v8

    .line 549
    aput-object v4, v3, v9

    .line 550
    aput-object v4, v3, v10

    .line 551
    aput-object v4, v3, v11

    .line 552
    aput-object v4, v3, v12

    .line 553
    aput-object v4, v3, v13

    .line 554
    const/16 v14, 0xa

    aput-object v4, v3, v14

    .line 555
    const/16 v14, 0xb

    aput-object v4, v3, v14

    .line 556
    aput-object v4, v3, v16

    .line 557
    aput-object v4, v3, v17

    .line 558
    aput-object v4, v3, v18

    .line 559
    aput-object v4, v3, v19

    .line 560
    aput-object v4, v3, v20

    .line 561
    aput-object v4, v3, v21

    .line 562
    aput-object v4, v3, v22

    .line 563
    const-string v14, "OpenStreetMap \u2014 \u043f\u0440\u044f\u043c\u043e\u0439 \u0441\u0435\u0440\u0432\u0435\u0440"

    const-string v15, "OpenStreetMap contributors"

    const/4 v13, 0x0

    invoke-static {v14, v15, v3, v13, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v13, "OSMOMSROADS"

    invoke-interface {v1, v13, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 564
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v13, "OSMOMSROADS"

    invoke-interface {v1, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/rabochaya/projects/TileSource;

    const-string v14, "OSMOMSROADS"

    const-string v15, "OpenStreetMap Maps"

    invoke-direct {v3, v14, v15, v13}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 565
    new-array v3, v2, [Ljava/lang/String;

    .line 566
    const-string v13, "https://a.tile.opentopomap.org/{z}/{x}/{y}.png"

    aput-object v13, v3, v5

    .line 567
    aput-object v13, v3, v6

    .line 568
    aput-object v13, v3, v7

    .line 569
    aput-object v13, v3, v8

    .line 570
    aput-object v13, v3, v9

    .line 571
    aput-object v13, v3, v10

    .line 572
    aput-object v13, v3, v11

    .line 573
    aput-object v13, v3, v12

    .line 574
    const/16 v14, 0x9

    aput-object v13, v3, v14

    .line 575
    const/16 v14, 0xa

    aput-object v13, v3, v14

    .line 576
    const/16 v14, 0xb

    aput-object v13, v3, v14

    .line 577
    aput-object v13, v3, v16

    .line 578
    aput-object v13, v3, v17

    .line 579
    aput-object v13, v3, v18

    .line 580
    aput-object v13, v3, v19

    .line 581
    aput-object v13, v3, v20

    .line 582
    const-string v14, "https://a.tile-cyclosm.openstreetmap.fr/cyclosm/{z}/{x}/{y}.png"

    aput-object v14, v3, v21

    .line 583
    const-string v14, "Open Topo Map"

    const-string v15, "OpenStreetMap contributors"

    const/4 v12, 0x0

    invoke-static {v14, v15, v3, v12, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v12, "OSMOTM"

    invoke-interface {v1, v12, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 584
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v12, "OSMOTM"

    invoke-interface {v1, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/rabochaya/projects/TileSource;

    const-string v14, "OSMOTM"

    const-string v15, "OpenStreetMap Maps"

    invoke-direct {v3, v14, v15, v12}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 585
    new-array v3, v2, [Ljava/lang/String;

    .line 586
    aput-object v4, v3, v5

    .line 587
    aput-object v4, v3, v6

    .line 588
    aput-object v4, v3, v7

    .line 589
    aput-object v4, v3, v8

    .line 590
    aput-object v4, v3, v9

    .line 591
    aput-object v4, v3, v10

    .line 592
    aput-object v4, v3, v11

    .line 593
    const/16 v12, 0x8

    aput-object v4, v3, v12

    .line 594
    const/16 v12, 0x9

    aput-object v4, v3, v12

    .line 595
    const/16 v12, 0xa

    aput-object v4, v3, v12

    .line 596
    const/16 v12, 0xb

    aput-object v4, v3, v12

    .line 597
    aput-object v4, v3, v16

    .line 598
    aput-object v4, v3, v17

    .line 599
    aput-object v4, v3, v18

    .line 600
    aput-object v4, v3, v19

    .line 601
    aput-object v4, v3, v20

    .line 602
    aput-object v4, v3, v21

    .line 603
    aput-object v4, v3, v22

    .line 604
    const/16 v12, 0x13

    aput-object v4, v3, v12

    .line 605
    const-string v12, "Standard Carto"

    const-string v14, "OpenStreetMap contributors"

    const/4 v15, 0x0

    invoke-static {v12, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v12, "OSMMPN"

    invoke-interface {v1, v12, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 606
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v12, "OSMMPN"

    invoke-interface {v1, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/rabochaya/projects/TileSource;

    const-string v14, "OSMMPN"

    const-string v15, "OpenStreetMap Maps"

    invoke-direct {v3, v14, v15, v12}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 607
    new-array v3, v2, [Ljava/lang/String;

    .line 608
    const-string v12, "https://a.tile.thunderforest.com/cycle/{z}/{x}/{y}.png"

    aput-object v12, v3, v5

    .line 609
    const-string v12, "https://a.tile.thunderforest.com/cycle/{z}/{x}/{y}.png"

    aput-object v12, v3, v6

    .line 610
    const-string v12, "https://a.tile.thunderforest.com/cycle/{z}/{x}/{y}.png"

    aput-object v12, v3, v7

    .line 611
    const-string v12, "https://a.tile.thunderforest.com/cycle/{z}/{x}/{y}.png"

    aput-object v12, v3, v8

    .line 612
    const-string v12, "https://a.tile.thunderforest.com/cycle/{z}/{x}/{y}.png"

    aput-object v12, v3, v9

    .line 613
    const-string v12, "https://a.tile.thunderforest.com/cycle/{z}/{x}/{y}.png"

    aput-object v12, v3, v10

    .line 614
    const-string v12, "https://a.tile.thunderforest.com/cycle/{z}/{x}/{y}.png"

    aput-object v12, v3, v11

    .line 615
    const-string v12, "https://a.tile.thunderforest.com/cycle/{z}/{x}/{y}.png"

    const/16 v14, 0x8

    aput-object v12, v3, v14

    .line 616
    const-string v12, "https://a.tile.thunderforest.com/cycle/{z}/{x}/{y}.png"

    const/16 v14, 0x9

    aput-object v12, v3, v14

    .line 617
    const-string v12, "https://a.tile.thunderforest.com/cycle/{z}/{x}/{y}.png"

    const/16 v14, 0xa

    aput-object v12, v3, v14

    .line 618
    const-string v12, "https://a.tile.thunderforest.com/cycle/{z}/{x}/{y}.png"

    const/16 v14, 0xb

    aput-object v12, v3, v14

    .line 619
    const-string v12, "https://a.tile.thunderforest.com/cycle/{z}/{x}/{y}.png"

    aput-object v12, v3, v16

    .line 620
    const-string v12, "https://a.tile.thunderforest.com/cycle/{z}/{x}/{y}.png"

    aput-object v12, v3, v17

    .line 621
    const-string v12, "https://a.tile.thunderforest.com/cycle/{z}/{x}/{y}.png"

    aput-object v12, v3, v18

    .line 622
    const-string v12, "https://a.tile.thunderforest.com/cycle/{z}/{x}/{y}.png"

    aput-object v12, v3, v19

    .line 623
    const-string v12, "https://a.tile.thunderforest.com/cycle/{z}/{x}/{y}.png"

    aput-object v12, v3, v20

    .line 624
    const-string v12, "https://a.tile.thunderforest.com/cycle/{z}/{x}/{y}.png"

    aput-object v12, v3, v21

    .line 625
    const-string v12, "Cycle/Hike Map"

    const-string v14, "OpenStreetMap contributors"

    const/4 v15, 0x0

    invoke-static {v12, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v12, "OSMCYC"

    invoke-interface {v1, v12, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 626
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v12, "OSMCYC"

    invoke-interface {v1, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/rabochaya/projects/TileSource;

    const-string v14, "OSMCYC"

    const-string v15, "OpenStreetMap Maps"

    invoke-direct {v3, v14, v15, v12}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 627
    new-array v3, v2, [Ljava/lang/String;

    .line 628
    const-string v12, "https://a.tile.thunderforest.com/transport/{z}/{x}/{y}.png"

    aput-object v12, v3, v5

    .line 629
    const-string v12, "https://a.tile.thunderforest.com/transport/{z}/{x}/{y}.png"

    aput-object v12, v3, v6

    .line 630
    const-string v12, "https://a.tile.thunderforest.com/transport/{z}/{x}/{y}.png"

    aput-object v12, v3, v7

    .line 631
    const-string v12, "https://a.tile.thunderforest.com/transport/{z}/{x}/{y}.png"

    aput-object v12, v3, v8

    .line 632
    const-string v12, "https://a.tile.thunderforest.com/transport/{z}/{x}/{y}.png"

    aput-object v12, v3, v9

    .line 633
    const-string v12, "https://a.tile.thunderforest.com/transport/{z}/{x}/{y}.png"

    aput-object v12, v3, v10

    .line 634
    const-string v12, "https://a.tile.thunderforest.com/transport/{z}/{x}/{y}.png"

    aput-object v12, v3, v11

    .line 635
    const-string v12, "https://a.tile.thunderforest.com/transport/{z}/{x}/{y}.png"

    const/16 v14, 0x8

    aput-object v12, v3, v14

    .line 636
    const-string v12, "https://a.tile.thunderforest.com/transport/{z}/{x}/{y}.png"

    const/16 v14, 0x9

    aput-object v12, v3, v14

    .line 637
    const-string v12, "https://a.tile.thunderforest.com/transport/{z}/{x}/{y}.png"

    const/16 v14, 0xa

    aput-object v12, v3, v14

    .line 638
    const-string v12, "https://a.tile.thunderforest.com/transport/{z}/{x}/{y}.png"

    const/16 v14, 0xb

    aput-object v12, v3, v14

    .line 639
    const-string v12, "https://a.tile.thunderforest.com/transport/{z}/{x}/{y}.png"

    aput-object v12, v3, v16

    .line 640
    const-string v12, "https://a.tile.thunderforest.com/transport/{z}/{x}/{y}.png"

    aput-object v12, v3, v17

    .line 641
    const-string v12, "https://a.tile.thunderforest.com/transport/{z}/{x}/{y}.png"

    aput-object v12, v3, v18

    .line 642
    const-string v12, "https://a.tile.thunderforest.com/transport/{z}/{x}/{y}.png"

    aput-object v12, v3, v19

    .line 643
    const-string v12, "https://a.tile.thunderforest.com/transport/{z}/{x}/{y}.png"

    aput-object v12, v3, v20

    .line 644
    const-string v12, "https://a.tile.thunderforest.com/transport/{z}/{x}/{y}.png"

    aput-object v12, v3, v21

    .line 645
    const-string v12, "https://a.tile.thunderforest.com/transport/{z}/{x}/{y}.png"

    aput-object v12, v3, v22

    .line 646
    const-string v12, "Transport Map"

    const-string v14, "OpenStreetMap contributors"

    const/4 v15, 0x0

    invoke-static {v12, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v12, "OSMTSP"

    invoke-interface {v1, v12, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 647
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v12, "OSMTSP"

    invoke-interface {v1, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/rabochaya/projects/TileSource;

    const-string v14, "OSMTSP"

    const-string v15, "OpenStreetMap Maps"

    invoke-direct {v3, v14, v15, v12}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 648
    new-array v3, v2, [Ljava/lang/String;

    .line 649
    const-string v12, "https://tile.waymarkedtrails.org/hiking/{z}/{x}/{y}.png"

    aput-object v12, v3, v5

    .line 650
    const-string v12, "https://tile.waymarkedtrails.org/hiking/{z}/{x}/{y}.png"

    aput-object v12, v3, v6

    .line 651
    const-string v12, "https://tile.waymarkedtrails.org/hiking/{z}/{x}/{y}.png"

    aput-object v12, v3, v7

    .line 652
    const-string v12, "https://tile.waymarkedtrails.org/hiking/{z}/{x}/{y}.png"

    aput-object v12, v3, v8

    .line 653
    const-string v12, "https://tile.waymarkedtrails.org/hiking/{z}/{x}/{y}.png"

    aput-object v12, v3, v9

    .line 654
    const-string v12, "https://tile.waymarkedtrails.org/hiking/{z}/{x}/{y}.png"

    aput-object v12, v3, v10

    .line 655
    const-string v12, "https://tile.waymarkedtrails.org/hiking/{z}/{x}/{y}.png"

    aput-object v12, v3, v11

    .line 656
    const-string v12, "https://tile.waymarkedtrails.org/hiking/{z}/{x}/{y}.png"

    const/16 v14, 0x8

    aput-object v12, v3, v14

    .line 657
    const-string v12, "https://tile.waymarkedtrails.org/hiking/{z}/{x}/{y}.png"

    const/16 v14, 0x9

    aput-object v12, v3, v14

    .line 658
    const-string v12, "https://tile.waymarkedtrails.org/hiking/{z}/{x}/{y}.png"

    const/16 v14, 0xa

    aput-object v12, v3, v14

    .line 659
    const-string v12, "https://tile.waymarkedtrails.org/hiking/{z}/{x}/{y}.png"

    const/16 v14, 0xb

    aput-object v12, v3, v14

    .line 660
    const-string v12, "https://tile.waymarkedtrails.org/hiking/{z}/{x}/{y}.png"

    aput-object v12, v3, v16

    .line 661
    const-string v12, "https://tile.waymarkedtrails.org/hiking/{z}/{x}/{y}.png"

    aput-object v12, v3, v17

    .line 662
    const-string v12, "https://tile.waymarkedtrails.org/hiking/{z}/{x}/{y}.png"

    aput-object v12, v3, v18

    .line 663
    const-string v12, "https://tile.waymarkedtrails.org/hiking/{z}/{x}/{y}.png"

    aput-object v12, v3, v19

    .line 664
    const-string v12, "https://tile.waymarkedtrails.org/hiking/{z}/{x}/{y}.png"

    aput-object v12, v3, v20

    .line 665
    const-string v12, "Hiking Trails Layer"

    const-string v14, "OpenStreetMap contributors"

    const/4 v15, 0x0

    invoke-static {v12, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v12, "OSMWMHC"

    invoke-interface {v1, v12, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 666
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v12, "OSMWMHC"

    invoke-interface {v1, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/rabochaya/projects/TileSource;

    const-string v14, "OSMWMHC"

    const-string v15, "OpenStreetMap Maps"

    invoke-direct {v3, v14, v15, v12}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 667
    new-array v3, v2, [Ljava/lang/String;

    .line 668
    const-string v12, "https://tile.waymarkedtrails.org/cycling/{z}/{x}/{y}.png"

    aput-object v12, v3, v5

    .line 669
    const-string v12, "https://tile.waymarkedtrails.org/cycling/{z}/{x}/{y}.png"

    aput-object v12, v3, v6

    .line 670
    const-string v12, "https://tile.waymarkedtrails.org/cycling/{z}/{x}/{y}.png"

    aput-object v12, v3, v7

    .line 671
    const-string v12, "https://tile.waymarkedtrails.org/cycling/{z}/{x}/{y}.png"

    aput-object v12, v3, v8

    .line 672
    const-string v12, "https://tile.waymarkedtrails.org/cycling/{z}/{x}/{y}.png"

    aput-object v12, v3, v9

    .line 673
    const-string v12, "https://tile.waymarkedtrails.org/cycling/{z}/{x}/{y}.png"

    aput-object v12, v3, v10

    .line 674
    const-string v12, "https://tile.waymarkedtrails.org/cycling/{z}/{x}/{y}.png"

    aput-object v12, v3, v11

    .line 675
    const-string v12, "https://tile.waymarkedtrails.org/cycling/{z}/{x}/{y}.png"

    const/16 v14, 0x8

    aput-object v12, v3, v14

    .line 676
    const-string v12, "https://tile.waymarkedtrails.org/cycling/{z}/{x}/{y}.png"

    const/16 v14, 0x9

    aput-object v12, v3, v14

    .line 677
    const-string v12, "https://tile.waymarkedtrails.org/cycling/{z}/{x}/{y}.png"

    const/16 v14, 0xa

    aput-object v12, v3, v14

    .line 678
    const-string v12, "https://tile.waymarkedtrails.org/cycling/{z}/{x}/{y}.png"

    const/16 v14, 0xb

    aput-object v12, v3, v14

    .line 679
    const-string v12, "https://tile.waymarkedtrails.org/cycling/{z}/{x}/{y}.png"

    aput-object v12, v3, v16

    .line 680
    const-string v12, "https://tile.waymarkedtrails.org/cycling/{z}/{x}/{y}.png"

    aput-object v12, v3, v17

    .line 681
    const-string v12, "https://tile.waymarkedtrails.org/cycling/{z}/{x}/{y}.png"

    aput-object v12, v3, v18

    .line 682
    const-string v12, "https://tile.waymarkedtrails.org/cycling/{z}/{x}/{y}.png"

    aput-object v12, v3, v19

    .line 683
    const-string v12, "https://tile.waymarkedtrails.org/cycling/{z}/{x}/{y}.png"

    aput-object v12, v3, v20

    .line 684
    const-string v12, "Cycling Paths Layer"

    const-string v14, "OpenStreetMap contributors"

    const/4 v15, 0x0

    invoke-static {v12, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v12, "OSMWMCC"

    invoke-interface {v1, v12, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 685
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v12, "OSMWMCC"

    invoke-interface {v1, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/rabochaya/projects/TileSource;

    const-string v14, "OSMWMCC"

    const-string v15, "OpenStreetMap Maps"

    invoke-direct {v3, v14, v15, v12}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 686
    new-array v3, v2, [Ljava/lang/String;

    .line 687
    const-string v12, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    aput-object v12, v3, v5

    .line 688
    const-string v12, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    aput-object v12, v3, v6

    .line 689
    const-string v12, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    aput-object v12, v3, v7

    .line 690
    const-string v12, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    aput-object v12, v3, v8

    .line 691
    const-string v12, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    aput-object v12, v3, v9

    .line 692
    const-string v12, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    aput-object v12, v3, v10

    .line 693
    const-string v12, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    aput-object v12, v3, v11

    .line 694
    const-string v12, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    const/16 v14, 0x8

    aput-object v12, v3, v14

    .line 695
    const-string v12, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    const/16 v14, 0x9

    aput-object v12, v3, v14

    .line 696
    const-string v12, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    const/16 v14, 0xa

    aput-object v12, v3, v14

    .line 697
    const-string v12, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    const/16 v14, 0xb

    aput-object v12, v3, v14

    .line 698
    const-string v12, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    aput-object v12, v3, v16

    .line 699
    const-string v12, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    aput-object v12, v3, v17

    .line 700
    const-string v12, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    aput-object v12, v3, v18

    .line 701
    const-string v12, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    aput-object v12, v3, v19

    .line 702
    const-string v12, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    aput-object v12, v3, v20

    .line 703
    const-string v12, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    aput-object v12, v3, v21

    .line 704
    const-string v12, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    aput-object v12, v3, v22

    .line 705
    const/16 v12, 0x13

    const-string v14, "https://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"

    aput-object v14, v3, v12

    .line 706
    const-string v12, "Humanitarian map"

    const-string v14, "OpenStreetMap contributors"

    const/4 v15, 0x0

    invoke-static {v12, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v12, "OSMHOT"

    invoke-interface {v1, v12, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 707
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v12, "OSMHOT"

    invoke-interface {v1, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/rabochaya/projects/TileSource;

    const-string v14, "OSMHOT"

    const-string v15, "OpenStreetMap Maps"

    invoke-direct {v3, v14, v15, v12}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 708
    new-array v3, v2, [Ljava/lang/String;

    .line 709
    const-string v12, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    aput-object v12, v3, v5

    .line 710
    const-string v12, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    aput-object v12, v3, v6

    .line 711
    const-string v12, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    aput-object v12, v3, v7

    .line 712
    const-string v12, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    aput-object v12, v3, v8

    .line 713
    const-string v12, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    aput-object v12, v3, v9

    .line 714
    const-string v12, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    aput-object v12, v3, v10

    .line 715
    const-string v12, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    aput-object v12, v3, v11

    .line 716
    const-string v12, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    const/16 v14, 0x8

    aput-object v12, v3, v14

    .line 717
    const-string v12, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    const/16 v14, 0x9

    aput-object v12, v3, v14

    .line 718
    const-string v12, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    const/16 v14, 0xa

    aput-object v12, v3, v14

    .line 719
    const-string v12, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    const/16 v14, 0xb

    aput-object v12, v3, v14

    .line 720
    const-string v12, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    aput-object v12, v3, v16

    .line 721
    const-string v12, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    aput-object v12, v3, v17

    .line 722
    const-string v12, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    aput-object v12, v3, v18

    .line 723
    const-string v12, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    aput-object v12, v3, v19

    .line 724
    const-string v12, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    aput-object v12, v3, v20

    .line 725
    const-string v12, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    aput-object v12, v3, v21

    .line 726
    const-string v12, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    aput-object v12, v3, v22

    .line 727
    const/16 v12, 0x13

    const-string v14, "https://a.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png"

    aput-object v14, v3, v12

    .line 728
    const-string v12, "OSM France"

    const-string v14, "OpenStreetMap contributors"

    const/4 v15, 0x0

    invoke-static {v12, v14, v3, v15, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v12, "OSMFR"

    invoke-interface {v1, v12, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 729
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v12, "OSMFR"

    invoke-interface {v1, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/rabochaya/projects/TileSource;

    const-string v14, "OSMFR"

    const-string v15, "OpenStreetMap Maps"

    invoke-direct {v3, v14, v15, v12}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 730
    new-array v3, v2, [Ljava/lang/String;

    .line 731
    aput-object v13, v3, v5

    .line 732
    aput-object v13, v3, v6

    .line 733
    aput-object v13, v3, v7

    .line 734
    aput-object v13, v3, v8

    .line 735
    aput-object v13, v3, v9

    .line 736
    aput-object v13, v3, v10

    .line 737
    aput-object v13, v3, v11

    .line 738
    const/16 v12, 0x8

    aput-object v13, v3, v12

    .line 739
    const/16 v12, 0x9

    aput-object v13, v3, v12

    .line 740
    const/16 v12, 0xa

    aput-object v13, v3, v12

    .line 741
    const/16 v12, 0xb

    aput-object v13, v3, v12

    .line 742
    aput-object v13, v3, v16

    .line 743
    aput-object v13, v3, v17

    .line 744
    aput-object v13, v3, v18

    .line 745
    aput-object v13, v3, v19

    .line 746
    aput-object v13, v3, v20

    .line 747
    aput-object v13, v3, v21

    .line 748
    const-string v12, "Hike/Bike Map"

    const-string v13, "OpenStreetMap contributors (CC-BY-SA)"

    const/4 v14, 0x0

    invoke-static {v12, v13, v3, v14, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v12, "OSMHBMAP"

    invoke-interface {v1, v12, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 749
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v12, "OSMHBMAP"

    invoke-interface {v1, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/rabochaya/projects/TileSource;

    const-string v13, "OSMHBMAP"

    const-string v14, "OpenStreetMap Maps"

    invoke-direct {v3, v13, v14, v12}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 750
    new-array v3, v2, [Ljava/lang/String;

    .line 751
    const-string v12, "https://a.tile.thunderforest.com/landscape/{z}/{x}/{y}.png"

    aput-object v12, v3, v5

    .line 752
    const-string v12, "https://a.tile.thunderforest.com/landscape/{z}/{x}/{y}.png"

    aput-object v12, v3, v6

    .line 753
    const-string v12, "https://a.tile.thunderforest.com/landscape/{z}/{x}/{y}.png"

    aput-object v12, v3, v7

    .line 754
    const-string v12, "https://a.tile.thunderforest.com/landscape/{z}/{x}/{y}.png"

    aput-object v12, v3, v8

    .line 755
    const-string v12, "https://a.tile.thunderforest.com/landscape/{z}/{x}/{y}.png"

    aput-object v12, v3, v9

    .line 756
    const-string v12, "https://a.tile.thunderforest.com/landscape/{z}/{x}/{y}.png"

    aput-object v12, v3, v10

    .line 757
    const-string v12, "https://a.tile.thunderforest.com/landscape/{z}/{x}/{y}.png"

    aput-object v12, v3, v11

    .line 758
    const-string v12, "https://a.tile.thunderforest.com/landscape/{z}/{x}/{y}.png"

    const/16 v13, 0x8

    aput-object v12, v3, v13

    .line 759
    const-string v12, "https://a.tile.thunderforest.com/landscape/{z}/{x}/{y}.png"

    const/16 v13, 0x9

    aput-object v12, v3, v13

    .line 760
    const-string v12, "https://a.tile.thunderforest.com/landscape/{z}/{x}/{y}.png"

    const/16 v13, 0xa

    aput-object v12, v3, v13

    .line 761
    const-string v12, "https://a.tile.thunderforest.com/landscape/{z}/{x}/{y}.png"

    const/16 v13, 0xb

    aput-object v12, v3, v13

    .line 762
    const-string v12, "https://a.tile.thunderforest.com/landscape/{z}/{x}/{y}.png"

    aput-object v12, v3, v16

    .line 763
    const-string v12, "https://a.tile.thunderforest.com/landscape/{z}/{x}/{y}.png"

    aput-object v12, v3, v17

    .line 764
    const-string v12, "https://a.tile.thunderforest.com/landscape/{z}/{x}/{y}.png"

    aput-object v12, v3, v18

    .line 765
    const-string v12, "https://a.tile.thunderforest.com/landscape/{z}/{x}/{y}.png"

    aput-object v12, v3, v19

    .line 766
    const-string v12, "https://a.tile.thunderforest.com/landscape/{z}/{x}/{y}.png"

    aput-object v12, v3, v20

    .line 767
    const-string v12, "https://a.tile.thunderforest.com/landscape/{z}/{x}/{y}.png"

    aput-object v12, v3, v21

    .line 768
    const-string v12, "Landscape Map"

    const-string v13, "OpenStreetMap contributors"

    const/4 v14, 0x0

    invoke-static {v12, v13, v3, v14, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v12, "OSMLAND"

    invoke-interface {v1, v12, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 769
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v12, "OSMLAND"

    invoke-interface {v1, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/rabochaya/projects/TileSource;

    const-string v13, "OSMLAND"

    const-string v14, "OpenStreetMap Maps"

    invoke-direct {v3, v13, v14, v12}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 770
    new-array v3, v2, [Ljava/lang/String;

    .line 771
    const-string v12, "https://a.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png"

    aput-object v12, v3, v5

    .line 772
    const-string v12, "https://a.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png"

    aput-object v12, v3, v6

    .line 773
    const-string v12, "https://a.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png"

    aput-object v12, v3, v7

    .line 774
    const-string v12, "https://a.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png"

    aput-object v12, v3, v8

    .line 775
    const-string v12, "https://a.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png"

    aput-object v12, v3, v9

    .line 776
    const-string v12, "https://a.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png"

    aput-object v12, v3, v10

    .line 777
    const-string v12, "https://a.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png"

    aput-object v12, v3, v11

    .line 778
    const-string v12, "https://a.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png"

    const/16 v13, 0x8

    aput-object v12, v3, v13

    .line 779
    const-string v12, "https://a.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png"

    const/16 v13, 0x9

    aput-object v12, v3, v13

    .line 780
    const-string v12, "https://a.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png"

    const/16 v13, 0xa

    aput-object v12, v3, v13

    .line 781
    const-string v12, "https://a.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png"

    const/16 v13, 0xb

    aput-object v12, v3, v13

    .line 782
    const-string v12, "https://a.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png"

    aput-object v12, v3, v16

    .line 783
    const-string v12, "https://a.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png"

    aput-object v12, v3, v17

    .line 784
    const-string v12, "https://a.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png"

    aput-object v12, v3, v18

    .line 785
    const-string v12, "https://a.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png"

    aput-object v12, v3, v19

    .line 786
    const-string v12, "https://a.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png"

    aput-object v12, v3, v20

    .line 787
    const-string v12, "https://a.tile.thunderforest.com/outdoors/{z}/{x}/{y}.png"

    aput-object v12, v3, v21

    .line 788
    const-string v12, "Outdoor Map"

    const-string v13, "OpenStreetMap contributors"

    const/4 v14, 0x0

    invoke-static {v12, v13, v3, v14, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v12, "OSMOUTD"

    invoke-interface {v1, v12, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 789
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v12, "OSMOUTD"

    invoke-interface {v1, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/rabochaya/projects/TileSource;

    const-string v13, "OSMOUTD"

    const-string v14, "OpenStreetMap Maps"

    invoke-direct {v3, v13, v14, v12}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 790
    new-array v3, v2, [Ljava/lang/String;

    .line 791
    const-string v12, "https://tileproxy.cloud.mapquest.com/tiles/1.0.0/map/{z}/{x}/{y}.png"

    aput-object v12, v3, v5

    .line 792
    const-string v12, "https://tileproxy.cloud.mapquest.com/tiles/1.0.0/map/{z}/{x}/{y}.png"

    aput-object v12, v3, v6

    .line 793
    const-string v12, "https://tileproxy.cloud.mapquest.com/tiles/1.0.0/map/{z}/{x}/{y}.png"

    aput-object v12, v3, v7

    .line 794
    const-string v12, "https://tileproxy.cloud.mapquest.com/tiles/1.0.0/map/{z}/{x}/{y}.png"

    aput-object v12, v3, v8

    .line 795
    const-string v12, "https://tileproxy.cloud.mapquest.com/tiles/1.0.0/map/{z}/{x}/{y}.png"

    aput-object v12, v3, v9

    .line 796
    const-string v12, "https://tileproxy.cloud.mapquest.com/tiles/1.0.0/map/{z}/{x}/{y}.png"

    aput-object v12, v3, v10

    .line 797
    const-string v12, "https://tileproxy.cloud.mapquest.com/tiles/1.0.0/map/{z}/{x}/{y}.png"

    aput-object v12, v3, v11

    .line 798
    const-string v12, "https://tileproxy.cloud.mapquest.com/tiles/1.0.0/map/{z}/{x}/{y}.png"

    const/16 v13, 0x8

    aput-object v12, v3, v13

    .line 799
    const-string v12, "https://tileproxy.cloud.mapquest.com/tiles/1.0.0/map/{z}/{x}/{y}.png"

    const/16 v13, 0x9

    aput-object v12, v3, v13

    .line 800
    const-string v12, "https://tileproxy.cloud.mapquest.com/tiles/1.0.0/map/{z}/{x}/{y}.png"

    const/16 v13, 0xa

    aput-object v12, v3, v13

    .line 801
    const-string v12, "https://tileproxy.cloud.mapquest.com/tiles/1.0.0/map/{z}/{x}/{y}.png"

    const/16 v13, 0xb

    aput-object v12, v3, v13

    .line 802
    const-string v12, "https://tileproxy.cloud.mapquest.com/tiles/1.0.0/map/{z}/{x}/{y}.png"

    aput-object v12, v3, v16

    .line 803
    const-string v12, "https://tileproxy.cloud.mapquest.com/tiles/1.0.0/map/{z}/{x}/{y}.png"

    aput-object v12, v3, v17

    .line 804
    const-string v12, "https://tileproxy.cloud.mapquest.com/tiles/1.0.0/map/{z}/{x}/{y}.png"

    aput-object v12, v3, v18

    .line 805
    const-string v12, "https://tileproxy.cloud.mapquest.com/tiles/1.0.0/map/{z}/{x}/{y}.png"

    aput-object v12, v3, v19

    .line 806
    const-string v12, "https://tileproxy.cloud.mapquest.com/tiles/1.0.0/map/{z}/{x}/{y}.png"

    aput-object v12, v3, v20

    .line 807
    const-string v12, "https://tileproxy.cloud.mapquest.com/tiles/1.0.0/map/{z}/{x}/{y}.png"

    aput-object v12, v3, v21

    .line 808
    const-string v12, "https://tileproxy.cloud.mapquest.com/tiles/1.0.0/map/{z}/{x}/{y}.png"

    aput-object v12, v3, v22

    .line 809
    const-string v12, "MapQuest Open"

    const-string v13, "OpenStreetMap contributors"

    const/4 v14, 0x0

    invoke-static {v12, v13, v3, v14, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v12, "OSMMPQ"

    invoke-interface {v1, v12, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 810
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v12, "OSMMPQ"

    invoke-interface {v1, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/rabochaya/projects/TileSource;

    const-string v13, "OSMMPQ"

    const-string v14, "OpenStreetMap Maps"

    invoke-direct {v3, v13, v14, v12}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 811
    new-array v3, v2, [Ljava/lang/String;

    .line 812
    const-string v12, "https://tiles.wmflabs.org/hillshading/{z}/{x}/{y}.png"

    aput-object v12, v3, v5

    .line 813
    const-string v12, "https://tiles.wmflabs.org/hillshading/{z}/{x}/{y}.png"

    aput-object v12, v3, v6

    .line 814
    const-string v12, "https://tiles.wmflabs.org/hillshading/{z}/{x}/{y}.png"

    aput-object v12, v3, v7

    .line 815
    const-string v12, "https://tiles.wmflabs.org/hillshading/{z}/{x}/{y}.png"

    aput-object v12, v3, v8

    .line 816
    const-string v12, "https://tiles.wmflabs.org/hillshading/{z}/{x}/{y}.png"

    aput-object v12, v3, v9

    .line 817
    const-string v12, "https://tiles.wmflabs.org/hillshading/{z}/{x}/{y}.png"

    aput-object v12, v3, v10

    .line 818
    const-string v12, "https://tiles.wmflabs.org/hillshading/{z}/{x}/{y}.png"

    aput-object v12, v3, v11

    .line 819
    const-string v12, "https://tiles.wmflabs.org/hillshading/{z}/{x}/{y}.png"

    const/16 v13, 0x8

    aput-object v12, v3, v13

    .line 820
    const-string v12, "https://tiles.wmflabs.org/hillshading/{z}/{x}/{y}.png"

    const/16 v13, 0x9

    aput-object v12, v3, v13

    .line 821
    const-string v12, "https://tiles.wmflabs.org/hillshading/{z}/{x}/{y}.png"

    const/16 v13, 0xa

    aput-object v12, v3, v13

    .line 822
    const-string v12, "https://tiles.wmflabs.org/hillshading/{z}/{x}/{y}.png"

    const/16 v13, 0xb

    aput-object v12, v3, v13

    .line 823
    const-string v12, "https://tiles.wmflabs.org/hillshading/{z}/{x}/{y}.png"

    aput-object v12, v3, v16

    .line 824
    const-string v12, "https://tiles.wmflabs.org/hillshading/{z}/{x}/{y}.png"

    aput-object v12, v3, v17

    .line 825
    const-string v12, "https://tiles.wmflabs.org/hillshading/{z}/{x}/{y}.png"

    aput-object v12, v3, v18

    .line 826
    const-string v12, "https://tiles.wmflabs.org/hillshading/{z}/{x}/{y}.png"

    aput-object v12, v3, v19

    .line 827
    const-string v12, "https://tiles.wmflabs.org/hillshading/{z}/{x}/{y}.png"

    aput-object v12, v3, v20

    .line 828
    const-string v12, "https://tiles.wmflabs.org/hillshading/{z}/{x}/{y}.png"

    aput-object v12, v3, v21

    .line 829
    const-string v12, "Hillshade Layer"

    const-string v13, "OpenStreetMap contributors"

    const/4 v14, 0x0

    invoke-static {v12, v13, v3, v14, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v12, "OSMSHD"

    invoke-interface {v1, v12, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 830
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v12, "OSMSHD"

    invoke-interface {v1, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/rabochaya/projects/TileSource;

    const-string v13, "OSMSHD"

    const-string v14, "OpenStreetMap Maps"

    invoke-direct {v3, v13, v14, v12}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 831
    new-array v3, v2, [Ljava/lang/String;

    .line 832
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/asterc/x={x}&y={y}&z={z}"

    aput-object v12, v3, v5

    .line 833
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/asterc/x={x}&y={y}&z={z}"

    aput-object v12, v3, v6

    .line 834
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/asterc/x={x}&y={y}&z={z}"

    aput-object v12, v3, v7

    .line 835
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/asterc/x={x}&y={y}&z={z}"

    aput-object v12, v3, v8

    .line 836
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/asterc/x={x}&y={y}&z={z}"

    aput-object v12, v3, v9

    .line 837
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/asterc/x={x}&y={y}&z={z}"

    aput-object v12, v3, v10

    .line 838
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/asterc/x={x}&y={y}&z={z}"

    aput-object v12, v3, v11

    .line 839
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/asterc/x={x}&y={y}&z={z}"

    const/16 v13, 0x8

    aput-object v12, v3, v13

    .line 840
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/asterc/x={x}&y={y}&z={z}"

    const/16 v13, 0x9

    aput-object v12, v3, v13

    .line 841
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/asterc/x={x}&y={y}&z={z}"

    const/16 v13, 0xa

    aput-object v12, v3, v13

    .line 842
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/asterc/x={x}&y={y}&z={z}"

    const/16 v13, 0xb

    aput-object v12, v3, v13

    .line 843
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/asterc/x={x}&y={y}&z={z}"

    aput-object v12, v3, v16

    .line 844
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/asterc/x={x}&y={y}&z={z}"

    aput-object v12, v3, v17

    .line 845
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/asterc/x={x}&y={y}&z={z}"

    aput-object v12, v3, v18

    .line 846
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/asterc/x={x}&y={y}&z={z}"

    aput-object v12, v3, v19

    .line 847
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/asterc/x={x}&y={y}&z={z}"

    aput-object v12, v3, v20

    .line 848
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/asterc/x={x}&y={y}&z={z}"

    aput-object v12, v3, v21

    .line 849
    const-string v12, "Contours Layer"

    const-string v13, "OpenStreetMap contributors"

    const/4 v14, 0x0

    invoke-static {v12, v13, v3, v14, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v12, "OSMOMSCTR"

    invoke-interface {v1, v12, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 850
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v12, "OSMOMSCTR"

    invoke-interface {v1, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/rabochaya/projects/TileSource;

    const-string v13, "OSMOMSCTR"

    const-string v14, "OpenStreetMap Maps"

    invoke-direct {v3, v13, v14, v12}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 851
    new-array v3, v2, [Ljava/lang/String;

    .line 852
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/hybrid/x={x}&y={y}&z={z}"

    aput-object v12, v3, v5

    .line 853
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/hybrid/x={x}&y={y}&z={z}"

    aput-object v12, v3, v6

    .line 854
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/hybrid/x={x}&y={y}&z={z}"

    aput-object v12, v3, v7

    .line 855
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/hybrid/x={x}&y={y}&z={z}"

    aput-object v12, v3, v8

    .line 856
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/hybrid/x={x}&y={y}&z={z}"

    aput-object v12, v3, v9

    .line 857
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/hybrid/x={x}&y={y}&z={z}"

    aput-object v12, v3, v10

    .line 858
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/hybrid/x={x}&y={y}&z={z}"

    aput-object v12, v3, v11

    .line 859
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/hybrid/x={x}&y={y}&z={z}"

    const/16 v13, 0x8

    aput-object v12, v3, v13

    .line 860
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/hybrid/x={x}&y={y}&z={z}"

    const/16 v13, 0x9

    aput-object v12, v3, v13

    .line 861
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/hybrid/x={x}&y={y}&z={z}"

    const/16 v13, 0xa

    aput-object v12, v3, v13

    .line 862
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/hybrid/x={x}&y={y}&z={z}"

    const/16 v13, 0xb

    aput-object v12, v3, v13

    .line 863
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/hybrid/x={x}&y={y}&z={z}"

    aput-object v12, v3, v16

    .line 864
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/hybrid/x={x}&y={y}&z={z}"

    aput-object v12, v3, v17

    .line 865
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/hybrid/x={x}&y={y}&z={z}"

    aput-object v12, v3, v18

    .line 866
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/hybrid/x={x}&y={y}&z={z}"

    aput-object v12, v3, v19

    .line 867
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/hybrid/x={x}&y={y}&z={z}"

    aput-object v12, v3, v20

    .line 868
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/hybrid/x={x}&y={y}&z={z}"

    aput-object v12, v3, v21

    .line 869
    const-string v12, "Roads Layer"

    const-string v13, "OpenStreetMap contributors"

    const/4 v14, 0x0

    invoke-static {v12, v13, v3, v14, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v12, "OSMOMSHYB"

    invoke-interface {v1, v12, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 870
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v12, "OSMOMSHYB"

    invoke-interface {v1, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/rabochaya/projects/TileSource;

    const-string v13, "OSMOMSHYB"

    const-string v14, "OpenStreetMap Maps"

    invoke-direct {v3, v13, v14, v12}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 871
    new-array v3, v2, [Ljava/lang/String;

    .line 872
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/adminb/x={x}&y={y}&z={z}"

    aput-object v12, v3, v5

    .line 873
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/adminb/x={x}&y={y}&z={z}"

    aput-object v12, v3, v6

    .line 874
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/adminb/x={x}&y={y}&z={z}"

    aput-object v12, v3, v7

    .line 875
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/adminb/x={x}&y={y}&z={z}"

    aput-object v12, v3, v8

    .line 876
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/adminb/x={x}&y={y}&z={z}"

    aput-object v12, v3, v9

    .line 877
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/adminb/x={x}&y={y}&z={z}"

    aput-object v12, v3, v10

    .line 878
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/adminb/x={x}&y={y}&z={z}"

    aput-object v12, v3, v11

    .line 879
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/adminb/x={x}&y={y}&z={z}"

    const/16 v13, 0x8

    aput-object v12, v3, v13

    .line 880
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/adminb/x={x}&y={y}&z={z}"

    const/16 v13, 0x9

    aput-object v12, v3, v13

    .line 881
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/adminb/x={x}&y={y}&z={z}"

    const/16 v13, 0xa

    aput-object v12, v3, v13

    .line 882
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/adminb/x={x}&y={y}&z={z}"

    const/16 v13, 0xb

    aput-object v12, v3, v13

    .line 883
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/adminb/x={x}&y={y}&z={z}"

    aput-object v12, v3, v16

    .line 884
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/adminb/x={x}&y={y}&z={z}"

    aput-object v12, v3, v17

    .line 885
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/adminb/x={x}&y={y}&z={z}"

    aput-object v12, v3, v18

    .line 886
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/adminb/x={x}&y={y}&z={z}"

    aput-object v12, v3, v19

    .line 887
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/adminb/x={x}&y={y}&z={z}"

    aput-object v12, v3, v20

    .line 888
    const-string v12, "https://korona.geog.uni-heidelberg.de/tiles/adminb/x={x}&y={y}&z={z}"

    aput-object v12, v3, v21

    .line 889
    const-string v12, "Admin Boundaries Layer"

    const-string v13, "OpenStreetMap contributors"

    const/4 v14, 0x0

    invoke-static {v12, v13, v3, v14, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v12, "OSMOMSAB"

    invoke-interface {v1, v12, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 890
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v12, "OSMOMSAB"

    invoke-interface {v1, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/rabochaya/projects/TileSource;

    const-string v13, "OSMOMSAB"

    const-string v14, "OpenStreetMap Maps"

    invoke-direct {v3, v13, v14, v12}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 891
    new-array v3, v2, [Ljava/lang/String;

    .line 892
    aput-object v4, v3, v5

    .line 893
    aput-object v4, v3, v6

    .line 894
    aput-object v4, v3, v7

    .line 895
    aput-object v4, v3, v8

    .line 896
    aput-object v4, v3, v9

    .line 897
    aput-object v4, v3, v10

    .line 898
    const-string v4, "https://tiles.nakarte.me/topomapper/{z}/{x}/{y}"

    aput-object v4, v3, v11

    .line 899
    const-string v4, "https://tiles.nakarte.me/topomapper/{z}/{x}/{y}"

    const/16 v12, 0x8

    aput-object v4, v3, v12

    .line 900
    const-string v4, "https://tiles.nakarte.me/topomapper/{z}/{x}/{y}"

    const/16 v12, 0x9

    aput-object v4, v3, v12

    .line 901
    const-string v4, "https://tiles.nakarte.me/topomapper/{z}/{x}/{y}"

    const/16 v12, 0xa

    aput-object v4, v3, v12

    .line 902
    const-string v4, "https://tiles.nakarte.me/topomapper/{z}/{x}/{y}"

    const/16 v12, 0xb

    aput-object v4, v3, v12

    .line 903
    const-string v4, "https://tiles.nakarte.me/topomapper/{z}/{x}/{y}"

    aput-object v4, v3, v16

    .line 904
    const-string v4, "https://tiles.nakarte.me/topomapper/{z}/{x}/{y}"

    aput-object v4, v3, v17

    .line 905
    const-string v4, "Soviet Military Map \u2014 AtloMaps"

    const-string v12, "AtloMaps; \u043e\u0431\u0437\u043e\u0440: OpenStreetMap contributors"

    const/4 v13, 0x0

    invoke-static {v4, v12, v3, v13, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "SMMAP"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 906
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "SMMAP"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v12, "SMMAP"

    const-string v13, "\u0421\u043e\u0432\u0435\u0442\u0441\u043a\u0438\u0435 \u0442\u043e\u043f\u043e\u043a\u0430\u0440\u0442\u044b \u2014 \u043d\u0435\u0437\u0430\u0432\u0438\u0441\u0438\u043c\u044b\u0439 \u0438\u0441\u0442\u043e\u0447\u043d\u0438\u043a"

    invoke-direct {v3, v12, v13, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 907
    new-array v3, v2, [Ljava/lang/String;

    .line 908
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v5

    .line 909
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v6

    .line 910
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v7

    .line 911
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v8

    .line 912
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v9

    .line 913
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v10

    .line 914
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v11

    .line 915
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0x8

    aput-object v4, v3, v12

    .line 916
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0x9

    aput-object v4, v3, v12

    .line 917
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0xa

    aput-object v4, v3, v12

    .line 918
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0xb

    aput-object v4, v3, v12

    .line 919
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v16

    .line 920
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v17

    .line 921
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v18

    .line 922
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v19

    .line 923
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v20

    .line 924
    const-string v4, "USGS Topo Map"

    const-string v12, "USGS"

    const/4 v13, 0x0

    invoke-static {v4, v12, v3, v13, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "USGSTOPO"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 925
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "USGSTOPO"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v12, "USGSTOPO"

    const-string v13, "USGS Maps (USA)"

    invoke-direct {v3, v12, v13, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 926
    new-array v3, v2, [Ljava/lang/String;

    .line 927
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v5

    .line 928
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v6

    .line 929
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v7

    .line 930
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v8

    .line 931
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v9

    .line 932
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v10

    .line 933
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v11

    .line 934
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0x8

    aput-object v4, v3, v12

    .line 935
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSTopo/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0x9

    aput-object v4, v3, v12

    .line 936
    const-string v4, "https://services.arcgisonline.com/arcgis/rest/services/USA_Topo_Maps/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0xa

    aput-object v4, v3, v12

    .line 937
    const-string v4, "https://services.arcgisonline.com/arcgis/rest/services/USA_Topo_Maps/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0xb

    aput-object v4, v3, v12

    .line 938
    const-string v4, "https://services.arcgisonline.com/arcgis/rest/services/USA_Topo_Maps/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v16

    .line 939
    const-string v4, "https://services.arcgisonline.com/arcgis/rest/services/USA_Topo_Maps/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v17

    .line 940
    const-string v4, "https://services.arcgisonline.com/arcgis/rest/services/USA_Topo_Maps/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v18

    .line 941
    const-string v4, "https://services.arcgisonline.com/arcgis/rest/services/USA_Topo_Maps/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v19

    .line 942
    const-string v4, "USGS Topo Scan"

    const-string v12, "USGS"

    const/4 v13, 0x0

    invoke-static {v4, v12, v3, v13, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "USGSSCAN"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 943
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "USGSSCAN"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v12, "USGSSCAN"

    const-string v13, "USGS Maps (USA)"

    invoke-direct {v3, v12, v13, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 944
    new-array v3, v2, [Ljava/lang/String;

    .line 945
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v5

    .line 946
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v6

    .line 947
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v7

    .line 948
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v8

    .line 949
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v9

    .line 950
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v10

    .line 951
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v11

    .line 952
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryTopo/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0x8

    aput-object v4, v3, v12

    .line 953
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryTopo/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0x9

    aput-object v4, v3, v12

    .line 954
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryTopo/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0xa

    aput-object v4, v3, v12

    .line 955
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryTopo/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0xb

    aput-object v4, v3, v12

    .line 956
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v16

    .line 957
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v17

    .line 958
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v18

    .line 959
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v19

    .line 960
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryTopo/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v20

    .line 961
    const-string v4, "USGS Imagery Topo"

    const-string v12, "USGS"

    const/4 v13, 0x0

    invoke-static {v4, v12, v3, v13, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "USGSIMGTOPO"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 962
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "USGSIMGTOPO"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v12, "USGSIMGTOPO"

    const-string v13, "USGS Maps (USA)"

    invoke-direct {v3, v12, v13, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 963
    new-array v3, v2, [Ljava/lang/String;

    .line 964
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryOnly/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v5

    .line 965
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryOnly/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v6

    .line 966
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryOnly/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v7

    .line 967
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryOnly/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v8

    .line 968
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryOnly/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v9

    .line 969
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryOnly/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v10

    .line 970
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryOnly/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v11

    .line 971
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryOnly/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0x8

    aput-object v4, v3, v12

    .line 972
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryOnly/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0x9

    aput-object v4, v3, v12

    .line 973
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryOnly/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0xa

    aput-object v4, v3, v12

    .line 974
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryOnly/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0xb

    aput-object v4, v3, v12

    .line 975
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryOnly/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v16

    .line 976
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryOnly/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v17

    .line 977
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryOnly/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v18

    .line 978
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryOnly/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v19

    .line 979
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryOnly/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v20

    .line 980
    const-string v4, "USGS Imagery"

    const-string v12, "USGS"

    const/4 v13, 0x0

    invoke-static {v4, v12, v3, v13, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "USGSIMG"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 981
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "USGSIMG"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v12, "USGSIMG"

    const-string v13, "USGS Maps (USA)"

    invoke-direct {v3, v12, v13, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 982
    new-array v3, v2, [Ljava/lang/String;

    .line 983
    const-string v4, "https://carto.nationalmap.gov/arcgis/rest/services/transportation/MapServer/export?dpi=96&transparent=true&format=png&layers=show:0&bbox={bbox}&bboxSR=102113&imageSR=102113&size=256,256&f=image"

    aput-object v4, v3, v5

    .line 984
    const-string v4, "https://carto.nationalmap.gov/arcgis/rest/services/transportation/MapServer/export?dpi=96&transparent=true&format=png&layers=show:0&bbox={bbox}&bboxSR=102113&imageSR=102113&size=256,256&f=image"

    aput-object v4, v3, v6

    .line 985
    const-string v4, "https://carto.nationalmap.gov/arcgis/rest/services/transportation/MapServer/export?dpi=96&transparent=true&format=png&layers=show:0&bbox={bbox}&bboxSR=102113&imageSR=102113&size=256,256&f=image"

    aput-object v4, v3, v7

    .line 986
    const-string v4, "https://carto.nationalmap.gov/arcgis/rest/services/transportation/MapServer/export?dpi=96&transparent=true&format=png&layers=show:0&bbox={bbox}&bboxSR=102113&imageSR=102113&size=256,256&f=image"

    aput-object v4, v3, v8

    .line 987
    const-string v4, "https://carto.nationalmap.gov/arcgis/rest/services/transportation/MapServer/export?dpi=96&transparent=true&format=png&layers=show:0&bbox={bbox}&bboxSR=102113&imageSR=102113&size=256,256&f=image"

    aput-object v4, v3, v9

    .line 988
    const-string v4, "https://carto.nationalmap.gov/arcgis/rest/services/transportation/MapServer/export?dpi=96&transparent=true&format=png&layers=show:0&bbox={bbox}&bboxSR=102113&imageSR=102113&size=256,256&f=image"

    aput-object v4, v3, v10

    .line 989
    const-string v4, "https://carto.nationalmap.gov/arcgis/rest/services/transportation/MapServer/export?dpi=96&transparent=true&format=png&layers=show:0&bbox={bbox}&bboxSR=102113&imageSR=102113&size=256,256&f=image"

    aput-object v4, v3, v11

    .line 990
    const-string v4, "https://carto.nationalmap.gov/arcgis/rest/services/transportation/MapServer/export?dpi=96&transparent=true&format=png&layers=show:0&bbox={bbox}&bboxSR=102113&imageSR=102113&size=256,256&f=image"

    const/16 v12, 0x8

    aput-object v4, v3, v12

    .line 991
    const-string v4, "https://carto.nationalmap.gov/arcgis/rest/services/transportation/MapServer/export?dpi=96&transparent=true&format=png&layers=show:0&bbox={bbox}&bboxSR=102113&imageSR=102113&size=256,256&f=image"

    const/16 v12, 0x9

    aput-object v4, v3, v12

    .line 992
    const-string v4, "https://carto.nationalmap.gov/arcgis/rest/services/transportation/MapServer/export?dpi=96&transparent=true&format=png&layers=show:0&bbox={bbox}&bboxSR=102113&imageSR=102113&size=256,256&f=image"

    const/16 v12, 0xa

    aput-object v4, v3, v12

    .line 993
    const-string v4, "https://carto.nationalmap.gov/arcgis/rest/services/transportation/MapServer/export?dpi=96&transparent=true&format=png&layers=show:0,26&bbox={bbox}&bboxSR=102113&imageSR=102113&size=256,256&f=image"

    const/16 v12, 0xb

    aput-object v4, v3, v12

    .line 994
    const-string v4, "https://carto.nationalmap.gov/arcgis/rest/services/transportation/MapServer/export?dpi=96&transparent=true&format=png&layers=show:0,26&bbox={bbox}&bboxSR=102113&imageSR=102113&size=256,256&f=image"

    aput-object v4, v3, v16

    .line 995
    const-string v4, "https://carto.nationalmap.gov/arcgis/rest/services/transportation/MapServer/export?dpi=96&transparent=true&format=png&layers=show:0,26&bbox={bbox}&bboxSR=102113&imageSR=102113&size=256,256&f=image"

    aput-object v4, v3, v17

    .line 996
    const-string v4, "https://carto.nationalmap.gov/arcgis/rest/services/transportation/MapServer/export?dpi=96&transparent=true&format=png&layers=show:0,26&bbox={bbox}&bboxSR=102113&imageSR=102113&size=256,256&f=image"

    aput-object v4, v3, v18

    .line 997
    const-string v4, "https://carto.nationalmap.gov/arcgis/rest/services/transportation/MapServer/export?dpi=96&transparent=true&format=png&layers=show:0,13&bbox={bbox}&bboxSR=102113&imageSR=102113&size=256,256&f=image"

    aput-object v4, v3, v19

    .line 998
    const-string v4, "https://carto.nationalmap.gov/arcgis/rest/services/transportation/MapServer/export?dpi=96&transparent=true&format=png&layers=show:0,13&bbox={bbox}&bboxSR=102113&imageSR=102113&size=256,256&f=image"

    aput-object v4, v3, v20

    .line 999
    const-string v4, "https://carto.nationalmap.gov/arcgis/rest/services/transportation/MapServer/export?dpi=96&transparent=true&format=png&layers=show:0,13&bbox={bbox}&bboxSR=102113&imageSR=102113&size=256,256&f=image"

    aput-object v4, v3, v21

    .line 1000
    const-string v4, "https://carto.nationalmap.gov/arcgis/rest/services/transportation/MapServer/export?dpi=96&transparent=true&format=png&layers=show:0,13&bbox={bbox}&bboxSR=102113&imageSR=102113&size=256,256&f=image"

    aput-object v4, v3, v22

    .line 1001
    const-string v4, "USGS Roads Layer"

    const-string v12, "USGS"

    const/4 v13, 0x0

    invoke-static {v4, v12, v3, v13, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "USGSRDL"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1002
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "USGSRDL"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v12, "USGSRDL"

    const-string v13, "USGS Maps (USA)"

    invoke-direct {v3, v12, v13, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1003
    new-array v3, v2, [Ljava/lang/String;

    .line 1004
    const-string v4, "https://elevation.nationalmap.gov/arcgis/rest/services/3DEPElevation/ImageServer/exportImage?f=image&bandIds=&renderingRule=%7B%22rasterFunction%22%3A%22Contour%2025%22%7D&bbox={bbox}&imageSR=102100&bboxSR=102100&size=256%2C256"

    const/16 v12, 0x8

    aput-object v4, v3, v12

    .line 1005
    const-string v4, "https://elevation.nationalmap.gov/arcgis/rest/services/3DEPElevation/ImageServer/exportImage?f=image&bandIds=&renderingRule=%7B%22rasterFunction%22%3A%22Contour%2025%22%7D&bbox={bbox}&imageSR=102100&bboxSR=102100&size=256%2C256"

    const/16 v12, 0x9

    aput-object v4, v3, v12

    .line 1006
    const-string v4, "https://elevation.nationalmap.gov/arcgis/rest/services/3DEPElevation/ImageServer/exportImage?f=image&bandIds=&renderingRule=%7B%22rasterFunction%22%3A%22Contour%2025%22%7D&bbox={bbox}&imageSR=102100&bboxSR=102100&size=256%2C256"

    const/16 v12, 0xa

    aput-object v4, v3, v12

    .line 1007
    const-string v4, "https://elevation.nationalmap.gov/arcgis/rest/services/3DEPElevation/ImageServer/exportImage?f=image&bandIds=&renderingRule=%7B%22rasterFunction%22%3A%22Contour%2025%22%7D&bbox={bbox}&imageSR=102100&bboxSR=102100&size=256%2C256"

    const/16 v12, 0xb

    aput-object v4, v3, v12

    .line 1008
    const-string v4, "https://elevation.nationalmap.gov/arcgis/rest/services/3DEPElevation/ImageServer/exportImage?f=image&bandIds=&renderingRule=%7B%22rasterFunction%22%3A%22Contour%2025%22%7D&bbox={bbox}&imageSR=102100&bboxSR=102100&size=256%2C256"

    aput-object v4, v3, v16

    .line 1009
    const-string v4, "https://elevation.nationalmap.gov/arcgis/rest/services/3DEPElevation/ImageServer/exportImage?f=image&bandIds=&renderingRule=%7B%22rasterFunction%22%3A%22Contour%2025%22%7D&bbox={bbox}&imageSR=102100&bboxSR=102100&size=256%2C256"

    aput-object v4, v3, v17

    .line 1010
    const-string v4, "https://elevation.nationalmap.gov/arcgis/rest/services/3DEPElevation/ImageServer/exportImage?f=image&bandIds=&renderingRule=%7B%22rasterFunction%22%3A%22Contour%2025%22%7D&bbox={bbox}&imageSR=102100&bboxSR=102100&size=256%2C256"

    aput-object v4, v3, v18

    .line 1011
    const-string v4, "https://elevation.nationalmap.gov/arcgis/rest/services/3DEPElevation/ImageServer/exportImage?f=image&bandIds=&renderingRule=%7B%22rasterFunction%22%3A%22Contour%2025%22%7D&bbox={bbox}&imageSR=102100&bboxSR=102100&size=256%2C256"

    aput-object v4, v3, v19

    .line 1012
    const-string v4, "https://elevation.nationalmap.gov/arcgis/rest/services/3DEPElevation/ImageServer/exportImage?f=image&bandIds=&renderingRule=%7B%22rasterFunction%22%3A%22Contour%2025%22%7D&bbox={bbox}&imageSR=102100&bboxSR=102100&size=256%2C256"

    aput-object v4, v3, v20

    .line 1013
    const-string v4, "https://elevation.nationalmap.gov/arcgis/rest/services/3DEPElevation/ImageServer/exportImage?f=image&bandIds=&renderingRule=%7B%22rasterFunction%22%3A%22Contour%2025%22%7D&bbox={bbox}&imageSR=102100&bboxSR=102100&size=256%2C256"

    aput-object v4, v3, v21

    .line 1014
    const-string v4, "https://elevation.nationalmap.gov/arcgis/rest/services/3DEPElevation/ImageServer/exportImage?f=image&bandIds=&renderingRule=%7B%22rasterFunction%22%3A%22Contour%2025%22%7D&bbox={bbox}&imageSR=102100&bboxSR=102100&size=256%2C256"

    aput-object v4, v3, v22

    .line 1015
    const-string v4, "USGS Contours Layer"

    const-string v12, "USGS"

    const/4 v13, 0x0

    invoke-static {v4, v12, v3, v13, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "USGSCTL"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1016
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "USGSCTL"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v12, "USGSCTL"

    const-string v13, "USGS Maps (USA)"

    invoke-direct {v3, v12, v13, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1017
    new-array v3, v2, [Ljava/lang/String;

    .line 1018
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSHydroCached/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v5

    .line 1019
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSHydroCached/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v6

    .line 1020
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSHydroCached/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v7

    .line 1021
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSHydroCached/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v8

    .line 1022
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSHydroCached/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v9

    .line 1023
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSHydroCached/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v10

    .line 1024
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSHydroCached/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v11

    .line 1025
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSHydroCached/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0x8

    aput-object v4, v3, v12

    .line 1026
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSHydroCached/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0x9

    aput-object v4, v3, v12

    .line 1027
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSHydroCached/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0xa

    aput-object v4, v3, v12

    .line 1028
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSHydroCached/MapServer/tile/{z}/{y}/{x}"

    const/16 v12, 0xb

    aput-object v4, v3, v12

    .line 1029
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSHydroCached/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v16

    .line 1030
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSHydroCached/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v17

    .line 1031
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSHydroCached/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v18

    .line 1032
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSHydroCached/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v19

    .line 1033
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSHydroCached/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v20

    .line 1034
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSHydroCached/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v21

    .line 1035
    const-string v4, "https://basemap.nationalmap.gov/arcgis/rest/services/USGSHydroCached/MapServer/tile/{z}/{y}/{x}"

    aput-object v4, v3, v22

    .line 1036
    const-string v4, "USGS Hydro Layer"

    const-string v12, "USGS"

    const/4 v13, 0x0

    invoke-static {v4, v12, v3, v13, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "USGSHYD"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1037
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "USGSHYD"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v12, "USGSHYD"

    const-string v13, "USGS Maps (USA)"

    invoke-direct {v3, v12, v13, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1038
    new-array v3, v2, [Ljava/lang/String;

    .line 1039
    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v5

    .line 1040
    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v6

    .line 1041
    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v7

    .line 1042
    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v8

    .line 1043
    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v9

    .line 1044
    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v10

    .line 1045
    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v11

    .line 1046
    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    const/16 v12, 0x8

    aput-object v4, v3, v12

    .line 1047
    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    const/16 v12, 0x9

    aput-object v4, v3, v12

    .line 1048
    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    const/16 v12, 0xa

    aput-object v4, v3, v12

    .line 1049
    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    const/16 v12, 0xb

    aput-object v4, v3, v12

    .line 1050
    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v16

    .line 1051
    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v17

    .line 1052
    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v18

    .line 1053
    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v19

    .line 1054
    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v20

    .line 1055
    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v21

    .line 1056
    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v22

    .line 1057
    const/16 v4, 0x13

    const-string v12, "https://core-renderer-tiles.maps.yandex.net/tiles?l=map&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v12, v3, v4

    .line 1058
    const-string v4, "\u042f\u043d\u0434\u0435\u043a\u0441 \u2014 \u0441\u0445\u0435\u043c\u0430"

    const-string v12, "\u00a9 \u042f\u043d\u0434\u0435\u043a\u0441"

    invoke-static {v4, v12, v3, v5, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "YANDEX_MAP"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1059
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "YANDEX_MAP"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v12, "YANDEX_MAP"

    const-string v13, "\u042f\u043d\u0434\u0435\u043a\u0441 \u041a\u0430\u0440\u0442\u044b"

    invoke-direct {v3, v12, v13, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1060
    new-array v3, v2, [Ljava/lang/String;

    .line 1061
    const-string v4, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v5

    .line 1062
    const-string v4, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v6

    .line 1063
    const-string v4, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v7

    .line 1064
    const-string v4, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v8

    .line 1065
    const-string v4, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v9

    .line 1066
    const-string v4, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v10

    .line 1067
    const-string v4, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v11

    .line 1068
    const-string v4, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    const/16 v12, 0x8

    aput-object v4, v3, v12

    .line 1069
    const-string v4, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    const/16 v12, 0x9

    aput-object v4, v3, v12

    .line 1070
    const-string v4, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    const/16 v12, 0xa

    aput-object v4, v3, v12

    .line 1071
    const-string v4, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    const/16 v12, 0xb

    aput-object v4, v3, v12

    .line 1072
    const-string v4, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v16

    .line 1073
    const-string v4, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v17

    .line 1074
    const-string v4, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v18

    .line 1075
    const-string v4, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v19

    .line 1076
    const-string v4, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v20

    .line 1077
    const-string v4, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v21

    .line 1078
    const-string v4, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v3, v22

    .line 1079
    const/16 v4, 0x13

    const-string v12, "https://sat01.maps.yandex.net/tiles?l=sat&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v12, v3, v4

    .line 1080
    const-string v4, "\u042f\u043d\u0434\u0435\u043a\u0441 \u2014 \u0441\u043f\u0443\u0442\u043d\u0438\u043a"

    const-string v12, "\u00a9 \u042f\u043d\u0434\u0435\u043a\u0441"

    invoke-static {v4, v12, v3, v5, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "YANDEX_SAT"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1081
    new-instance v3, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v4, "YANDEX_SAT"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v12, "YANDEX_SAT"

    const-string v13, "\u042f\u043d\u0434\u0435\u043a\u0441 \u041a\u0430\u0440\u0442\u044b"

    invoke-direct {v3, v12, v13, v4}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1082
    new-array v2, v2, [Ljava/lang/String;

    .line 1083
    const-string v3, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v3, v2, v5

    .line 1084
    const-string v3, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v3, v2, v6

    .line 1085
    const-string v3, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v3, v2, v7

    .line 1086
    const-string v3, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v3, v2, v8

    .line 1087
    const-string v3, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v3, v2, v9

    .line 1088
    const-string v3, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v3, v2, v10

    .line 1089
    const-string v3, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v3, v2, v11

    .line 1090
    const-string v3, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    const/16 v4, 0x8

    aput-object v3, v2, v4

    .line 1091
    const-string v3, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    const/16 v4, 0x9

    aput-object v3, v2, v4

    .line 1092
    const-string v3, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    const/16 v4, 0xa

    aput-object v3, v2, v4

    .line 1093
    const-string v3, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    const/16 v4, 0xb

    aput-object v3, v2, v4

    .line 1094
    const-string v3, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v3, v2, v16

    .line 1095
    const-string v3, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v3, v2, v17

    .line 1096
    const-string v3, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v3, v2, v18

    .line 1097
    const-string v3, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v3, v2, v19

    .line 1098
    const-string v3, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v3, v2, v20

    .line 1099
    const-string v3, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v3, v2, v21

    .line 1100
    const-string v3, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v3, v2, v22

    .line 1101
    const/16 v3, 0x13

    const-string v4, "https://core-renderer-tiles.maps.yandex.net/tiles?l=skl&x={x}&y={y}&z={z}&lang=ru_RU"

    aput-object v4, v2, v3

    .line 1102
    const-string v3, "\u042f\u043d\u0434\u0435\u043a\u0441 \u2014 \u0434\u043e\u0440\u043e\u0433\u0438 \u0438 \u043f\u043e\u0434\u043f\u0438\u0441\u0438 (\u043f\u0440\u043e\u0437\u0440\u0430\u0447\u043d\u044b\u0439 \u0441\u043b\u043e\u0439)"

    const-string v4, "\u00a9 \u042f\u043d\u0434\u0435\u043a\u0441"

    invoke-static {v3, v4, v2, v5, v5}, Lorg/rabochaya/projects/TileSource;->builtin(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;ZZ)Lorg/rabochaya/projects/TileSource;

    move-result-object v2

    const-string v3, "YANDEX_LABELS"

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1103
    new-instance v2, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v3, "YANDEX_LABELS"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/rabochaya/projects/TileSource;

    const-string v4, "YANDEX_LABELS"

    const-string v8, "\u042f\u043d\u0434\u0435\u043a\u0441 \u041a\u0430\u0440\u0442\u044b"

    invoke-direct {v2, v4, v8, v3}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1104
    new-instance v2, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v3, "ESRI_WORLD_IMAGERY"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/rabochaya/projects/TileSource;

    const-string v4, "ESRI_ROADS_LAYER"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    const-string v8, "ESRI_PLACES_LAYER"

    invoke-interface {v1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/rabochaya/projects/TileSource;

    new-array v7, v7, [Lorg/rabochaya/projects/TileSource;

    const/4 v9, 0x0

    aput-object v3, v7, v9

    aput-object v4, v7, v5

    aput-object v8, v7, v6

    const-string v3, "ESRI \u2014 \u0441\u043f\u0443\u0442\u043d\u0438\u043a, \u0434\u043e\u0440\u043e\u0433\u0438 \u0438 \u043d\u0430\u0437\u0432\u0430\u043d\u0438\u044f"

    invoke-static {v3, v7}, Lorg/rabochaya/projects/TileSource;->composite(Ljava/lang/String;[Lorg/rabochaya/projects/TileSource;)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "ESRI_IMAGERY_LABELS"

    const-string v7, "ESRI Community Maps"

    invoke-direct {v2, v4, v7, v3}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1105
    new-instance v2, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v3, "GEARTH"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/rabochaya/projects/TileSource;

    const-string v4, "GROADS"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/TileSource;

    new-array v7, v6, [Lorg/rabochaya/projects/TileSource;

    const/4 v8, 0x0

    aput-object v3, v7, v8

    aput-object v4, v7, v5

    const-string v3, "Google Hybrid"

    invoke-static {v3, v7}, Lorg/rabochaya/projects/TileSource;->composite(Ljava/lang/String;[Lorg/rabochaya/projects/TileSource;)Lorg/rabochaya/projects/TileSource;

    move-result-object v3

    const-string v4, "GHYBRID"

    const-string v7, "Google Maps"

    invoke-direct {v2, v4, v7, v3}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1106
    new-instance v2, Lorg/rabochaya/projects/MapCatalog$Entry;

    const-string v3, "YANDEX_SAT"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/rabochaya/projects/TileSource;

    const-string v4, "YANDEX_LABELS"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/rabochaya/projects/TileSource;

    new-array v4, v6, [Lorg/rabochaya/projects/TileSource;

    const/4 v6, 0x0

    aput-object v3, v4, v6

    aput-object v1, v4, v5

    const-string v1, "\u042f\u043d\u0434\u0435\u043a\u0441 \u2014 \u0433\u0438\u0431\u0440\u0438\u0434"

    invoke-static {v1, v4}, Lorg/rabochaya/projects/TileSource;->composite(Ljava/lang/String;[Lorg/rabochaya/projects/TileSource;)Lorg/rabochaya/projects/TileSource;

    move-result-object v1

    const-string v3, "YANDEX_HYBRID"

    const-string v4, "\u042f\u043d\u0434\u0435\u043a\u0441 \u041a\u0430\u0440\u0442\u044b"

    invoke-direct {v2, v3, v4, v1}, Lorg/rabochaya/projects/MapCatalog$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/rabochaya/projects/TileSource;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1107
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static entries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/MapCatalog$Entry;",
            ">;"
        }
    .end annotation

    .line 6
    sget-object v0, Lorg/rabochaya/projects/MapCatalog;->ALL:Ljava/util/List;

    return-object v0
.end method

.method public static find(Ljava/lang/String;)Lorg/rabochaya/projects/TileSource;
    .locals 3

    .line 1108
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

    iget-object p0, v1, Lorg/rabochaya/projects/MapCatalog$Entry;->source:Lorg/rabochaya/projects/TileSource;

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method
