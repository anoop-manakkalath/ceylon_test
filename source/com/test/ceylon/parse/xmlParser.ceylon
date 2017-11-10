import javax.xml.bind {
    JAXBContext
}
import java.io {
    File
}
shared void run() {
    value jc = JAXBContext.newInstance(`Catalog`);
    value unmarshaller = jc.createUnmarshaller();
    value books = unmarshaller.unmarshal(File("resource/books.xml"));
    if (is Catalog books) {
        books.catalog.map((it) => it.title + " by " + it.author).each((name) => print(name));
    }
}