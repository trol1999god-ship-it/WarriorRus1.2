.class Lorg/rabochaya/projects/ProjectsActivity$24;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Lorg/rabochaya/projects/ProjectsActivity$Task;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity;->previewAsset(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ProjectsActivity;

.field final synthetic val$bytes:[B

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity;[BLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 135
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$24;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iput-object p2, p0, Lorg/rabochaya/projects/ProjectsActivity$24;->val$bytes:[B

    iput-object p3, p0, Lorg/rabochaya/projects/ProjectsActivity$24;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 135
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity$24;->val$bytes:[B

    iget-object v3, p0, Lorg/rabochaya/projects/ProjectsActivity$24;->val$bytes:[B

    array-length v3, v3

    const/4 v4, 0x0

    invoke-static {v2, v4, v3, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-lez v2, :cond_2

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-lez v2, :cond_2

    iput-boolean v4, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    :goto_0
    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    div-int/2addr v1, v2

    const/16 v2, 0x800

    if-gt v1, v2, :cond_1

    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    div-int/2addr v1, v3

    if-le v1, v2, :cond_0

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$24;->val$bytes:[B

    iget-object v2, p0, Lorg/rabochaya/projects/ProjectsActivity$24;->val$bytes:[B

    array-length v2, v2

    invoke-static {v1, v4, v2, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_2

    :cond_1
    :goto_1
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    mul-int/lit8 v1, v1, 0x2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_2
    iget-object v1, p0, Lorg/rabochaya/projects/ProjectsActivity$24;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    new-instance v2, Lorg/rabochaya/projects/ProjectsActivity$24$1;

    invoke-direct {v2, p0, v0}, Lorg/rabochaya/projects/ProjectsActivity$24$1;-><init>(Lorg/rabochaya/projects/ProjectsActivity$24;Landroid/graphics/Bitmap;)V

    invoke-static {v1, v2}, Lorg/rabochaya/projects/ProjectsActivity;->access$1500(Lorg/rabochaya/projects/ProjectsActivity;Ljava/lang/Runnable;)V

    return-void
.end method
