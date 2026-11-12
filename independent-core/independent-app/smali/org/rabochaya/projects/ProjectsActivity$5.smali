.class Lorg/rabochaya/projects/ProjectsActivity$5;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->frame(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ProjectsActivity;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity;)V
    .locals 0

    .line 53
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$5;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 53
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$5;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$800(Lorg/rabochaya/projects/ProjectsActivity;Z)V

    return-void
.end method
