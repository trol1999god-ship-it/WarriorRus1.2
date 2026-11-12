.class public final synthetic Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda86;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lorg/rabochaya/projects/LocalMapActivity;

.field public final synthetic f$1:J

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lorg/rabochaya/projects/LocalMapActivity;JLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda86;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iput-wide p2, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda86;->f$1:J

    iput-object p4, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda86;->f$2:Ljava/lang/String;

    iput-object p5, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda86;->f$3:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda86;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iget-wide v1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda86;->f$1:J

    iget-object v3, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda86;->f$2:Ljava/lang/String;

    iget-object v4, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda86;->f$3:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/rabochaya/projects/LocalMapActivity;->lambda$buildHillshade$64$org-rabochaya-projects-LocalMapActivity(JLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method
