import javax.xml.bind.annotation {
    xmlRootElement,
    xmlAccessorType,
    xmlAccessType,
    xmlElement
}

xmlRootElement {name="book";}
xmlAccessorType(\IxmlAccessType.field)
shared class Book(author, title, genre, price, publishDate, description) {

    shared xmlElement String author;
    shared xmlElement String title;
    shared xmlElement String genre;
    shared xmlElement Float price;
    shared xmlElement {name="publish_date";} String publishDate;
    shared xmlElement String description;
}