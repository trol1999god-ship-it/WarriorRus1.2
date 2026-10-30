.class Lorg/rabochaya/projects/KmlProject$2;
.super Ljava/lang/Object;
.source "KmlProject.java"

# interfaces
.implements Lorg/xml/sax/EntityResolver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/KmlProject;->parse([B)Lorg/rabochaya/projects/KmlProject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public resolveEntity(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 146
    new-instance p1, Lorg/xml/sax/SAXException;

    const-string p2, "\u0412\u043d\u0435\u0448\u043d\u0438\u0435 \u0441\u0443\u0449\u043d\u043e\u0441\u0442\u0438 \u0437\u0430\u043f\u0440\u0435\u0449\u0435\u043d\u044b"

    invoke-direct {p1, p2}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
