import javax.xml.bind.annotation {
    xmlRootElement,
    xmlElement,
    xmlAccessType,
    xmlAccessorType
}

xmlRootElement {name = "catalog";}
xmlAccessorType(\IxmlAccessType.field)
shared class Catalog(catalog) {

    shared xmlElement {name="book";} List<Book> catalog;
}