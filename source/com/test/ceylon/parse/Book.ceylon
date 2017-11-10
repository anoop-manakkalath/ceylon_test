import javax.xml.bind.annotation {
    xmlRootElement,
    xmlAccessorType,
    xmlAccessType,
    xmlElement
}

xmlRootElement {name="book";}
xmlAccessorType(\IxmlAccessType.field)
shared class Book(author, title, genre, price, publish_date, description) {

    shared xmlElement String author;
    shared xmlElement String title;
    shared xmlElement String genre;
    shared xmlElement Float price;
    shared xmlElement String publish_date;
    shared xmlElement  String description;
}