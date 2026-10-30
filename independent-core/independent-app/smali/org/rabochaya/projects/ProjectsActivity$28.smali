.class Lorg/rabochaya/projects/ProjectsActivity$28;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->move(Lorg/w3c/dom/Element;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ProjectsActivity;

.field final synthetic val$e:Lorg/w3c/dom/Element;

.field final synthetic val$targets:Ljava/util/List;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity;Ljava/util/List;Lorg/w3c/dom/Element;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 145
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$28;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$28;->val$targets:Ljava/util/List;

    iput-object p3, p0, Lorg/rabochaya/projects/ProjectsActivity$28;->val$e:Lorg/w3c/dom/Element;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 145
    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$28;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    new-instance v0, Lorg/rabochaya/projects/ProjectsActivity$28$1;

    invoke-direct {v0, p0, p2}, Lorg/rabochaya/projects/ProjectsActivity$28$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity$28;I)V

    invoke-static {p1, v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$2200(Lorg/rabochaya/projects/ProjectsActivity;Lorg/rabochaya/projects/ProjectsActivity$Task;)V

    return-void
.end method
