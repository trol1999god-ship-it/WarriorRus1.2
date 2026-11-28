.class Lorg/rabochaya/projects/ProjectsActivity$23;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->assets()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ProjectsActivity;

.field final synthetic val$names:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity;[Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 134
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$23;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$23;->val$names:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 134
    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$23;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$23;->val$names:[Ljava/lang/String;

    aget-object p2, v0, p2

    invoke-static {p1, p2}, Lorg/rabochaya/projects/ProjectsActivity;->access$2800(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/String;)V

    return-void
.end method
