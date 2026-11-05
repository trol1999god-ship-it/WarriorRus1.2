.class Lorg/rabochaya/projects/ProjectsActivity$28$1;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Lorg/rabochaya/projects/ProjectsActivity$Task;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity$28;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/rabochaya/projects/ProjectsActivity$28;

.field final synthetic val$which:I


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity$28;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 145
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$28$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$28;

    iput p2, p0, Lorg/rabochaya/projects/ProjectsActivity$28$1;->val$which:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 145
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$28$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$28;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$28;->val$targets:Ljava/util/List;

    iget v1, p0, Lorg/rabochaya/projects/ProjectsActivity$28$1;->val$which:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$28$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$28;

    iget-object v1, v1, Lorg/rabochaya/projects/ProjectsActivity$28;->val$e:Lorg/w3c/dom/Element;

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    return-void
.end method
