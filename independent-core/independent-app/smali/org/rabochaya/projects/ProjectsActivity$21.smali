.class Lorg/rabochaya/projects/ProjectsActivity$21;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Lorg/rabochaya/projects/ProjectsActivity$Task;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ProjectsActivity;

.field final synthetic val$id:J

.field final synthetic val$kmz:Z

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity;JLandroid/net/Uri;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 132
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$21;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iput-wide p2, p0, Lorg/rabochaya/projects/ProjectsActivity$21;->val$id:J

    iput-object p4, p0, Lorg/rabochaya/projects/ProjectsActivity$21;->val$uri:Landroid/net/Uri;

    iput-boolean p5, p0, Lorg/rabochaya/projects/ProjectsActivity$21;->val$kmz:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 132
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$21;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$000(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/ProjectStore;

    move-result-object v0

    iget-wide v1, p0, Lorg/rabochaya/projects/ProjectsActivity$21;->val$id:J

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$21;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-virtual {v1}, Lorg/rabochaya/projects/ProjectsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity$21;->val$uri:Landroid/net/Uri;

    const-string v3, "wt"

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v1

    if-eqz v1, :cond_2

    :try_start_0
    iget-boolean v2, p0, Lorg/rabochaya/projects/ProjectsActivity$21;->val$kmz:Z

    if-eqz v2, :cond_0

    invoke-virtual {v0, v1}, Lorg/rabochaya/projects/KmlProject;->kmz(Ljava/io/OutputStream;)V

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lorg/rabochaya/projects/KmlProject;->xml()[B

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    :cond_1
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$21;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    new-instance v1, Lorg/rabochaya/projects/ProjectsActivity$21$1;

    invoke-direct {v1, p0}, Lorg/rabochaya/projects/ProjectsActivity$21$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity$21;)V

    invoke-static {v0, v1}, Lorg/rabochaya/projects/ProjectsActivity;->access$1500(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception v0

    goto :goto_1

    :cond_2
    :try_start_1
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u0441\u043e\u0437\u0434\u0430\u0442\u044c \u0444\u0430\u0439\u043b"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    if-eqz v1, :cond_3

    :try_start_2
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v1

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_2
    throw v0
.end method
