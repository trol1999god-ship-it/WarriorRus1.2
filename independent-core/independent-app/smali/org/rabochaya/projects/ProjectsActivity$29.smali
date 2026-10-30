.class Lorg/rabochaya/projects/ProjectsActivity$29;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->confirmDelete(JLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ProjectsActivity;

.field final synthetic val$id:J


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 146
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$29;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iput-wide p2, p0, Lorg/rabochaya/projects/ProjectsActivity$29;->val$id:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 146
    iget-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$29;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    new-instance p2, Lorg/rabochaya/projects/ProjectsActivity$29$1;

    invoke-direct {p2, p0}, Lorg/rabochaya/projects/ProjectsActivity$29$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity$29;)V

    const-string v0, "\u0423\u0434\u0430\u043b\u0435\u043d\u0438\u0435 \u043f\u0440\u043e\u0435\u043a\u0442\u0430\u2026"

    invoke-static {p1, v0, p2}, Lorg/rabochaya/projects/ProjectsActivity;->access$3300(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/String;Lorg/rabochaya/projects/ProjectsActivity$Task;)V

    return-void
.end method
