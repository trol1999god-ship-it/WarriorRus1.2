.class public final Lorg/rabochaya/projects/KmlProject$Feature;
.super Ljava/lang/Object;
.source "KmlProject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/KmlProject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Feature"
.end annotation


# instance fields
.field public color:I

.field public element:Lorg/w3c/dom/Element;

.field public name:Ljava/lang/String;

.field public final shapes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/rabochaya/projects/KmlProject$Geometry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const v0, -0x193ba6

    iput v0, p0, Lorg/rabochaya/projects/KmlProject$Feature;->color:I

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/rabochaya/projects/KmlProject$Feature;->shapes:Ljava/util/List;

    return-void
.end method
