.class public final enum Lorg/rabochaya/projects/OziCalibration$Encoding;
.super Ljava/lang/Enum;
.source "OziCalibration.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/rabochaya/projects/OziCalibration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Encoding"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/rabochaya/projects/OziCalibration$Encoding;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/rabochaya/projects/OziCalibration$Encoding;

.field public static final enum UTF8:Lorg/rabochaya/projects/OziCalibration$Encoding;

.field public static final enum WINDOWS1251:Lorg/rabochaya/projects/OziCalibration$Encoding;


# instance fields
.field final charset:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lorg/rabochaya/projects/OziCalibration$Encoding;
    .locals 3

    .line 5
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/rabochaya/projects/OziCalibration$Encoding;

    sget-object v1, Lorg/rabochaya/projects/OziCalibration$Encoding;->UTF8:Lorg/rabochaya/projects/OziCalibration$Encoding;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lorg/rabochaya/projects/OziCalibration$Encoding;->WINDOWS1251:Lorg/rabochaya/projects/OziCalibration$Encoding;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 5
    new-instance v0, Lorg/rabochaya/projects/OziCalibration$Encoding;

    const/4 v1, 0x0

    const-string v2, "UTF-8"

    const-string v3, "UTF8"

    invoke-direct {v0, v3, v1, v2}, Lorg/rabochaya/projects/OziCalibration$Encoding;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/rabochaya/projects/OziCalibration$Encoding;->UTF8:Lorg/rabochaya/projects/OziCalibration$Encoding;

    new-instance v0, Lorg/rabochaya/projects/OziCalibration$Encoding;

    const/4 v1, 0x1

    const-string v2, "windows-1251"

    const-string v3, "WINDOWS1251"

    invoke-direct {v0, v3, v1, v2}, Lorg/rabochaya/projects/OziCalibration$Encoding;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/rabochaya/projects/OziCalibration$Encoding;->WINDOWS1251:Lorg/rabochaya/projects/OziCalibration$Encoding;

    invoke-static {}, Lorg/rabochaya/projects/OziCalibration$Encoding;->$values()[Lorg/rabochaya/projects/OziCalibration$Encoding;

    move-result-object v0

    sput-object v0, Lorg/rabochaya/projects/OziCalibration$Encoding;->$VALUES:[Lorg/rabochaya/projects/OziCalibration$Encoding;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 5
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lorg/rabochaya/projects/OziCalibration$Encoding;->charset:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/rabochaya/projects/OziCalibration$Encoding;
    .locals 1

    .line 5
    const-class v0, Lorg/rabochaya/projects/OziCalibration$Encoding;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/rabochaya/projects/OziCalibration$Encoding;

    return-object p0
.end method

.method public static values()[Lorg/rabochaya/projects/OziCalibration$Encoding;
    .locals 1

    .line 5
    sget-object v0, Lorg/rabochaya/projects/OziCalibration$Encoding;->$VALUES:[Lorg/rabochaya/projects/OziCalibration$Encoding;

    invoke-virtual {v0}, [Lorg/rabochaya/projects/OziCalibration$Encoding;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/rabochaya/projects/OziCalibration$Encoding;

    return-object v0
.end method
