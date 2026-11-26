.class final Lorg/rabochaya/projects/ProjectsActivity$FolderSort;
.super Ljava/lang/Object;
.implements Landroid/content/DialogInterface$OnClickListener;

.field private final owner:Lorg/rabochaya/projects/ProjectsActivity;

.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity;)V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$FolderSort;->owner:Lorg/rabochaya/projects/ProjectsActivity;
    return-void
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$FolderSort;->owner:Lorg/rabochaya/projects/ProjectsActivity;
    invoke-virtual {v0, p2}, Lorg/rabochaya/projects/ProjectsActivity;->setFolderSort(I)V
    return-void
.end method
