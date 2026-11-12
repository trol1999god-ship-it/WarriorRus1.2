.class public final synthetic Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda76;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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

    iput-object p1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda76;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iput-wide p2, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda76;->f$1:J

    iput-object p4, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda76;->f$2:Ljava/lang/String;

    iput-object p5, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda76;->f$3:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 7

    .line 0
    iget-object v0, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda76;->f$0:Lorg/rabochaya/projects/LocalMapActivity;

    iget-wide v1, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda76;->f$1:J

    iget-object v3, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda76;->f$2:Ljava/lang/String;

    iget-object v4, p0, Lorg/rabochaya/projects/LocalMapActivity$$ExternalSyntheticLambda76;->f$3:Ljava/lang/String;

    move-object v5, p1

    move v6, p2

    invoke-virtual/range {v0 .. v6}, Lorg/rabochaya/projects/LocalMapActivity;->lambda$confirmHillshade$61$org-rabochaya-projects-LocalMapActivity(JLjava/lang/String;Ljava/lang/String;Landroid/content/DialogInterface;I)V

    return-void
.end method
