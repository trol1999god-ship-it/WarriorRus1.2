.class public final Lorg/rabochaya/projects/WorkspaceUi$Item;
.super Ljava/lang/Object;
.source "WorkspaceUi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/WorkspaceUi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Item"
.end annotation


# instance fields
.field final action:Ljava/lang/Runnable;

.field final title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/WorkspaceUi$Item;->title:Ljava/lang/String;

    iput-object p2, p0, Lorg/rabochaya/projects/WorkspaceUi$Item;->action:Ljava/lang/Runnable;

    return-void
.end method
