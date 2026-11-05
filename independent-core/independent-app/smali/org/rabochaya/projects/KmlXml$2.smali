.class Lorg/rabochaya/projects/KmlXml$2;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "KmlXml.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/KmlXml;->write(Lorg/w3c/dom/Document;)[B
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

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

    .line 27
    new-instance p1, Lorg/xml/sax/SAXException;

    const-string p2, "\u0412\u043d\u0435\u0448\u043d\u0438\u0435 \u0441\u0443\u0449\u043d\u043e\u0441\u0442\u0438 XML \u0437\u0430\u043f\u0440\u0435\u0449\u0435\u043d\u044b"

    invoke-direct {p1, p2}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
