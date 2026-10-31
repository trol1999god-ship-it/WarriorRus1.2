.class Lorg/rabochaya/projects/ObjectManagerActivity$2;
.super Landroid/app/AlertDialog$Builder;
.source "ObjectManagerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/ObjectManagerActivity;->dialog()Landroid/app/AlertDialog$Builder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/rabochaya/projects/ObjectManagerActivity;


# direct methods
.method constructor <init>(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/content/Context;)V
    .locals 0

    .line 51
    iput-object p1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$2;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-direct {p0, p2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public create()Landroid/app/AlertDialog;
    .locals 3

    .line 51
    invoke-super {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Landroid/view/Window;->setSoftInputMode(I)V

    return-object v0
.end method

.method public show()Landroid/app/AlertDialog;
    .locals 2

    .line 51
    invoke-super {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    iget-object v1, p0, Lorg/rabochaya/projects/ObjectManagerActivity$2;->this$0:Lorg/rabochaya/projects/ObjectManagerActivity;

    invoke-static {v1, v0}, Lorg/rabochaya/projects/ObjectManagerActivity;->access$100(Lorg/rabochaya/projects/ObjectManagerActivity;Landroid/app/AlertDialog;)V

    return-object v0
.end method
