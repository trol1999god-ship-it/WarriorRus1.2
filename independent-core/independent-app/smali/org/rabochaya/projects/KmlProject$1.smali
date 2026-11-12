.class Lorg/rabochaya/projects/KmlProject$1;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "KmlProject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/rabochaya/projects/KmlProject;->parse([B)Lorg/rabochaya/projects/KmlProject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$limits:[I


# direct methods
.method constructor <init>([I)V
    .locals 0

    .line 133
    iput-object p1, p0, Lorg/rabochaya/projects/KmlProject$1;->val$limits:[I

    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 137
    iget-object p1, p0, Lorg/rabochaya/projects/KmlProject$1;->val$limits:[I

    const/4 p2, 0x0

    aget p3, p1, p2

    add-int/lit8 p3, p3, -0x1

    aput p3, p1, p2

    return-void
.end method

.method public error(Lorg/xml/sax/SAXParseException;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 139
    throw p1
.end method

.method public fatalError(Lorg/xml/sax/SAXParseException;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 140
    throw p1
.end method

.method public resolveEntity(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 138
    new-instance p1, Lorg/xml/sax/SAXException;

    const-string p2, "\u0412\u043d\u0435\u0448\u043d\u0438\u0435 \u0441\u0443\u0449\u043d\u043e\u0441\u0442\u0438 \u0437\u0430\u043f\u0440\u0435\u0449\u0435\u043d\u044b"

    invoke-direct {p1, p2}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .line 135
    iget-object p1, p0, Lorg/rabochaya/projects/KmlProject$1;->val$limits:[I

    const/4 p2, 0x0

    aget p3, p1, p2

    const/4 p4, 0x1

    add-int/2addr p3, p4

    aput p3, p1, p2

    const/16 p1, 0x40

    if-gt p3, p1, :cond_0

    iget-object p1, p0, Lorg/rabochaya/projects/KmlProject$1;->val$limits:[I

    aget p2, p1, p4

    add-int/2addr p2, p4

    aput p2, p1, p4

    const p1, 0xc350

    if-gt p2, p1, :cond_0

    .line 136
    return-void

    .line 135
    :cond_0
    new-instance p1, Lorg/xml/sax/SAXException;

    const-string p2, "\u041f\u0440\u0435\u0432\u044b\u0448\u0435\u043d\u044b \u043f\u0440\u0435\u0434\u0435\u043b\u044b \u0441\u0442\u0440\u0443\u043a\u0442\u0443\u0440\u044b KML"

    invoke-direct {p1, p2}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
