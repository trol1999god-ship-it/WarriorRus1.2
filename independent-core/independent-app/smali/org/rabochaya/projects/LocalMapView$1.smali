.class Lorg/rabochaya/projects/LocalMapView$1;
.super Ljava/lang/Object;
.source "LocalMapView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/LocalMapView;->setSymbols(Lorg/rabochaya/projects/KmlSymbolAssets;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/LocalMapView;

.field final synthetic val$assets:Lorg/rabochaya/projects/KmlSymbolAssets;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/LocalMapView;Lorg/rabochaya/projects/KmlSymbolAssets;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 10
    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapView$1;->this$0:Lorg/rabochaya/projects/LocalMapView;

    iput-object p2, p0, Lorg/rabochaya/projects/LocalMapView$1;->val$assets:Lorg/rabochaya/projects/KmlSymbolAssets;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 10
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$1;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v1}, Lorg/rabochaya/projects/LocalMapView;->access$100(Lorg/rabochaya/projects/LocalMapView;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    move-object v3, v2

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/rabochaya/projects/KmlProject$Feature;

    iget-object v5, p0, Lorg/rabochaya/projects/LocalMapView$1;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v5}, Lorg/rabochaya/projects/LocalMapView;->access$200(Lorg/rabochaya/projects/LocalMapView;)Z

    move-result v5

    if-eqz v5, :cond_1

    goto/16 :goto_3

    :cond_1
    iget-object v5, p0, Lorg/rabochaya/projects/LocalMapView$1;->this$0:Lorg/rabochaya/projects/LocalMapView;

    invoke-static {v5}, Lorg/rabochaya/projects/LocalMapView;->access$300(Lorg/rabochaya/projects/LocalMapView;)Ljava/util/IdentityHashMap;

    move-result-object v5

    iget-object v6, v4, Lorg/rabochaya/projects/KmlProject$Feature;->element:Lorg/w3c/dom/Element;

    invoke-virtual {v5, v6}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/rabochaya/projects/KmlComponentStyle;

    if-eqz v5, :cond_0

    iget-object v6, v5, Lorg/rabochaya/projects/KmlComponentStyle;->symbol:Ljava/util/Map;

    const-string v7, "href"

    invoke-interface {v6, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, v5, Lorg/rabochaya/projects/KmlComponentStyle;->symbol:Ljava/util/Map;

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_2

    goto :goto_0

    :cond_2
    :try_start_0
    invoke-virtual {v0}, Ljava/util/IdentityHashMap;->size()I

    move-result v6

    const/16 v8, 0x20

    if-ge v6, v8, :cond_3

    iget-object v6, p0, Lorg/rabochaya/projects/LocalMapView$1;->val$assets:Lorg/rabochaya/projects/KmlSymbolAssets;

    iget-object v8, v4, Lorg/rabochaya/projects/KmlProject$Feature;->element:Lorg/w3c/dom/Element;

    iget-object v9, v5, Lorg/rabochaya/projects/KmlComponentStyle;->symbol:Ljava/util/Map;

    invoke-interface {v9, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v6, v8, v7}, Lorg/rabochaya/projects/KmlSymbolAssets;->read(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/rabochaya/projects/SvgIcon;

    move-result-object v6

    invoke-static {v6}, Lorg/rabochaya/projects/SvgRaster;->render(Lorg/rabochaya/projects/SvgIcon;)Landroid/graphics/Bitmap;

    move-result-object v6
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    new-instance v7, Lorg/rabochaya/projects/LocalMapView$SymbolImage;

    iget-object v8, v5, Lorg/rabochaya/projects/KmlComponentStyle;->symbol:Ljava/util/Map;

    iget-object v5, v5, Lorg/rabochaya/projects/KmlComponentStyle;->icon:Ljava/lang/Integer;

    invoke-direct {v7, v6, v8, v5}, Lorg/rabochaya/projects/LocalMapView$SymbolImage;-><init>(Landroid/graphics/Bitmap;Ljava/util/Map;Ljava/lang/Integer;)V

    iget-object v4, v4, Lorg/rabochaya/projects/KmlProject$Feature;->element:Lorg/w3c/dom/Element;

    invoke-virtual {v0, v4, v7}, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catch_0
    move-exception v3

    goto :goto_1

    :cond_3
    :try_start_2
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "SVG: \u043f\u0440\u0435\u0434\u0435\u043b32 \u043e\u0434\u043d\u043e\u0432\u0440\u0435\u043c\u0435\u043d\u043d\u043e \u043e\u0442\u043e\u0431\u0440\u0430\u0436\u0430\u0435\u043c\u044b\u0445 \u0437\u043d\u0430\u0447\u043a\u043e\u0432"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v3

    move-object v6, v2

    :goto_1
    :try_start_3
    invoke-virtual {v3}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v6, :cond_0

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->recycle()V

    goto/16 :goto_0

    :catchall_1
    move-exception v0

    move-object v2, v6

    :goto_2
    if-eqz v2, :cond_4

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    :cond_4
    throw v0

    :cond_5
    :goto_3
    iget-object v1, p0, Lorg/rabochaya/projects/LocalMapView$1;->this$0:Lorg/rabochaya/projects/LocalMapView;

    new-instance v2, Lorg/rabochaya/projects/LocalMapView$1$1;

    invoke-direct {v2, p0, v0, v3}, Lorg/rabochaya/projects/LocalMapView$1$1;-><init>(Lorg/rabochaya/projects/LocalMapView$1;Ljava/util/IdentityHashMap;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lorg/rabochaya/projects/LocalMapView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
