.class public interface abstract Lorg/rabochaya/projects/LocalMapView$Listener;
.super Ljava/lang/Object;
.source "LocalMapView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/LocalMapView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Listener"
.end annotation


# virtual methods
.method public abstract center(DDD)V
.end method

.method public abstract draftChanged(I)V
.end method

.method public abstract error(Ljava/lang/String;)V
.end method

.method public abstract longPressed(DD)V
.end method

.method public abstract picked(Lorg/rabochaya/projects/KmlProject$Feature;)V
.end method

.method public abstract settled(DDD)V
.end method
