.class Lorg/rabochaya/projects/ProjectsActivity$22;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->more()V
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

    .line 133
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$22;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    .line 133
    if-nez p2, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$22;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {p1}, Lorg/rabochaya/projects/ProjectsActivity;->access$2700(Lorg/rabochaya/projects/ProjectsActivity;)V

    :cond_0
    const/4 p1, 0x1

    if-ne p2, p1, :cond_1

    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$22;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$800(Lorg/rabochaya/projects/ProjectsActivity;Z)V

    :cond_1
    const/4 p1, 0x2

    if-ne p2, p1, :cond_2

    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$22;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iget-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$22;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {p2}, Lorg/rabochaya/projects/ProjectsActivity;->access$200(Lorg/rabochaya/projects/ProjectsActivity;)J

    move-result-wide v0

    iget-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$22;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {p2}, Lorg/rabochaya/projects/ProjectsActivity;->access$400(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/KmlProject;

    move-result-object p2

    invoke-virtual {p2}, Lorg/rabochaya/projects/KmlProject;->root()Lorg/w3c/dom/Element;

    move-result-object p2

    invoke-static {p2}, Lorg/rabochaya/projects/KmlProject;->name(Lorg/w3c/dom/Element;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, v0, v1, p2}, Lorg/rabochaya/projects/ProjectsActivity;->access$1800(Lorg/rabochaya/projects/ProjectsActivity;JLjava/lang/String;)V

    return-void

    :cond_2
    const/4 v0, 0x4
    if-ne p2, v0, :formats

    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$22;->this$0:Lorg/rabochaya/projects/ProjectsActivity;
    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectsActivity;->showFolderSort()V
    return-void

    :formats
    const/4 v0, 0x5
    if-ne p2, v0, :multiselect
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$22;->this$0:Lorg/rabochaya/projects/ProjectsActivity;
    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectsActivity;->showFolderDisplay()V
    return-void

    :multiselect
    const/4 v0, 0x6
    if-ne p2, v0, :export
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$22;->this$0:Lorg/rabochaya/projects/ProjectsActivity;
    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectsActivity;->openFolderSelection()V
    return-void

    :export
    const/4 p1, 0x3
    if-ne p2, p1, :done

    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$22;->this$0:Lorg/rabochaya/projects/ProjectsActivity;
    invoke-static {p1}, Lorg/rabochaya/projects/ProjectsActivity;->access$200(Lorg/rabochaya/projects/ProjectsActivity;)J
    move-result-wide v0
    invoke-static {p1, v0, v1}, Lorg/rabochaya/projects/FormatExportActivity;->open(Landroid/app/Activity;J)V

    :done
    return-void
.end method
