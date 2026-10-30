.class Lorg/rabochaya/projects/ProjectsActivity$20;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Lorg/rabochaya/projects/ProjectsActivity$Task;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->importUri(Landroid/net/Uri;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ProjectsActivity;

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity;Landroid/net/Uri;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 122
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$20;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$20;->val$uri:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 124
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$20;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-virtual {v0}, Lorg/rabochaya/projects/ProjectsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$20;->val$uri:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v0

    .line 125
    if-eqz v0, :cond_4

    :try_start_0
    new-instance v1, Ljava/io/PushbackInputStream;

    const/4 v2, 0x2

    invoke-direct {v1, v0, v2}, Ljava/io/PushbackInputStream;-><init>(Ljava/io/InputStream;I)V

    invoke-virtual {v1}, Ljava/io/PushbackInputStream;->read()I

    move-result v2

    invoke-virtual {v1}, Ljava/io/PushbackInputStream;->read()I

    move-result v3

    if-ltz v3, :cond_0

    invoke-virtual {v1, v3}, Ljava/io/PushbackInputStream;->unread(I)V

    :cond_0
    if-ltz v2, :cond_1

    invoke-virtual {v1, v2}, Ljava/io/PushbackInputStream;->unread(I)V

    .line 126
    :cond_1
    const/16 v4, 0x50

    if-ne v2, v4, :cond_2

    const/16 v2, 0x4b

    if-ne v3, v2, :cond_2

    const/4 v2, 0x1

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :goto_0
    invoke-static {v1, v2}, Lorg/rabochaya/projects/KmlProject;->read(Ljava/io/InputStream;Z)Lorg/rabochaya/projects/KmlProject;

    move-result-object v1

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity$20;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v2}, Lorg/rabochaya/projects/ProjectsActivity;->access$000(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/ProjectStore;

    move-result-object v2

    iget-object v3, p0, Lorg/rabochaya/projects/ProjectsActivity$20;->val$uri:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lorg/rabochaya/projects/ProjectStore;->insert(Lorg/rabochaya/projects/KmlProject;Ljava/lang/String;)J

    move-result-wide v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 127
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 128
    :cond_3
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$20;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    invoke-static {v0}, Lorg/rabochaya/projects/ProjectsActivity;->access$000(Lorg/rabochaya/projects/ProjectsActivity;)Lorg/rabochaya/projects/ProjectStore;

    move-result-object v0

    invoke-virtual {v0, v1, v2}, Lorg/rabochaya/projects/ProjectStore;->load(J)Lorg/rabochaya/projects/KmlProject;

    move-result-object v0

    iget-object v3, p0, Lorg/rabochaya/projects/ProjectsActivity$20;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    new-instance v4, Lorg/rabochaya/projects/ProjectsActivity$20$1;

    invoke-direct {v4, p0, v1, v2, v0}, Lorg/rabochaya/projects/ProjectsActivity$20$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity$20;JLorg/rabochaya/projects/KmlProject;)V

    invoke-static {v3, v4}, Lorg/rabochaya/projects/ProjectsActivity;->access$1500(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/Runnable;)V

    .line 129
    return-void

    .line 124
    :catchall_0
    move-exception v1

    goto :goto_1

    .line 125
    :cond_4
    :try_start_1
    new-instance v1, Ljava/io/IOException;

    const-string v2, "\u041d\u0435 \u0443\u0434\u0430\u043b\u043e\u0441\u044c \u043e\u0442\u043a\u0440\u044b\u0442\u044c \u0444\u0430\u0439\u043b"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 124
    :goto_1
    if-eqz v0, :cond_5

    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v0

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_5
    :goto_2
    throw v1
.end method
