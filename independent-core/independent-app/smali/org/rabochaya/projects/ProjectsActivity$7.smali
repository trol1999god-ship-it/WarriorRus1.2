.class Lorg/rabochaya/projects/ProjectsActivity$7;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->flushPending()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ProjectsActivity;

.field final synthetic val$intent:Landroid/content/Intent;

.field final synthetic val$request:I


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity;ILandroid/content/Intent;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 56
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$7;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iput p2, p0, Lorg/rabochaya/projects/ProjectsActivity$7;->val$request:I

    iput-object p3, p0, Lorg/rabochaya/projects/ProjectsActivity$7;->val$intent:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 56
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$7;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iget v1, p0, Lorg/rabochaya/projects/ProjectsActivity$7;->val$request:I

    const/4 v2, -0x1

    iget-object v3, p0, Lorg/rabochaya/projects/ProjectsActivity$7;->val$intent:Landroid/content/Intent;

    invoke-virtual {v0, v1, v2, v3}, Lorg/rabochaya/projects/ProjectsActivity;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method
