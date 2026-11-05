.class Lorg/rabochaya/projects/ProjectsActivity$13;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->showFolder()V
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

    .line 89
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$13;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 89
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$13;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$2000(Lorg/rabochaya/projects/ProjectsActivity;)V

    return-void
.end method
