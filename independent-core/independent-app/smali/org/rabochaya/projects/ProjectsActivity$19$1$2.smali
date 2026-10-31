.class Lorg/rabochaya/projects/ProjectsActivity$19$1$2;
.super Ljava/lang/Object;
.source "ProjectsActivity.java"

# interfaces
.implements Lorg/rabochaya/projects/ProjectMapView$Pick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ProjectsActivity$19$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lorg/rabochaya/projects/ProjectsActivity$19$1;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ProjectsActivity$19$1;)V
    .locals 0

    .line 115
    iput-object p1, p0, Lorg/rabochaya/projects/ProjectsActivity$19$1$2;->this$2:Lorg/rabochaya/projects/ProjectsActivity$19$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public picked(Lorg/rabochaya/projects/KmlProject$Feature;)V
    .locals 1

    .line 115
    iget-object v0, p0, Lorg/rabochaya/projects/ProjectsActivity$19$1$2;->this$2:Lorg/rabochaya/projects/ProjectsActivity$19$1;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$19$1;->this$1:Lorg/rabochaya/projects/ProjectsActivity$19;

    iget-object v0, v0, Lorg/rabochaya/projects/ProjectsActivity$19;->this$0:Lorg/rabochaya/projects/ProjectsActivity;

    iget-object p1, p1, Lorg/rabochaya/projects/KmlProject$Feature;->element:Lorg/w3c/dom/Element;

    invoke-static {v0, p1}, Lorg/rabochaya/projects/ProjectsActivity;->access$2300(Lorg/rabochaya/projects/ProjectsActivity;Lorg/w3c/dom/Element;)V

    return-void
.end method
