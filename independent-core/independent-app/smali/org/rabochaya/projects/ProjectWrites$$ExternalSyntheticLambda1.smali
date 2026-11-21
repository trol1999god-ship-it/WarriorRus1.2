.class public final synthetic Lorg/rabochaya/projects/ProjectWrites$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lorg/rabochaya/projects/ProjectWrites$AttachmentEdit;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:[B


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;[B)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/ProjectWrites$$ExternalSyntheticLambda1;->f$0:Ljava/lang/String;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectWrites$$ExternalSyntheticLambda1;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lorg/rabochaya/projects/ProjectWrites$$ExternalSyntheticLambda1;->f$2:[B

    return-void
.end method


# virtual methods
.method public final apply(Lorg/rabochaya/projects/KmlProject;Lorg/w3c/dom/Element;)V
    .locals 3

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectWrites$$ExternalSyntheticLambda1;->f$0:Ljava/lang/String;

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectWrites$$ExternalSyntheticLambda1;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectWrites$$ExternalSyntheticLambda1;->f$2:[B

    invoke-static {v0, v1, v2, p1, p2}, Lorg/rabochaya/projects/ProjectWrites;->lambda$addAttachment$0(Ljava/lang/String;Ljava/lang/String;[BLorg/rabochaya/projects/KmlProject;Lorg/w3c/dom/Element;)V

    return-void
.end method
