.class Lorg/rabochaya/projects/ProjectsActivity$26$2;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity$26;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/rabochaya/projects/ProjectsActivity$26;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity$26;)V
    .locals 0

    .line 138
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$26$2;->this$1:Lorg/rabochaya/projects/ProjectsActivity$26;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 138
    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$26$2;->this$1:Lorg/rabochaya/projects/ProjectsActivity$26;

    iget-object p1, p1, Lorg/rabochaya/projects/ProjectsActivity$26;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    new-instance p2, Lorg/rabochaya/projects/ProjectsActivity$26$2$1;

    invoke-direct {p2, p0}, Lorg/rabochaya/projects/ProjectsActivity$26$2$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity$26$2;)V

    invoke-static {p1, p2}, Lorg/rabochaya/projects/ProjectsActivity;->access$2200(Lorg/rabochaya/projects/ProjectsActivity;Lorg/rabochaya/projects/ProjectsActivity$Task;)V

    return-void
.end method
