import java.io {
    BufferedReader,
    RandomAccessFile
}
import java.nio.channels {
    FileChannel
}
import java.nio {
    ByteBuffer
}
import java.nio.charset {
    Charset,
    StandardCharsets
}
import java.nio.file {
    Files,
    Paths
}
shared void run() {
    value file = "resource/books.xml";
    value x1 = system.nanoseconds;
    print(fileIORead(file));
    value x2 = system.nanoseconds;
    print(fileNIORead(file));
    value x3 = system.nanoseconds;
    print(fileNewRead(file));
    value x4 = system.nanoseconds;
    print(x2-x1);
    print(x3-x2);
    print(x4-x3);
}

shared String fileIORead(String file) {
    value content = StringBuilder();
    value charset = Charset.forName(StandardCharsets.utf8.name());
    value newLine = "\n";
    try (BufferedReader br = Files.newBufferedReader(Paths.get(file), charset)) {
        while (true) {
            String? line = br.readLine();
            if (is String line) {
                content.append(line).append(newLine);
            }
            else {
                break;
            }
        }
    }
    return content.string.trimmed;
}

shared String fileNIORead(String file) {
    value content = StringBuilder();
    try (RandomAccessFile rFile = RandomAccessFile(file, "r"), FileChannel fc = rFile.channel) {
        value charset = Charset.forName(StandardCharsets.utf8.name());
        value buffer = ByteBuffer.allocate(2048);
        while (fc.read(buffer) >= 0) {
            buffer.flip();
            content.append(charset.decode(buffer).string);
            buffer.flip();
        }
    }
    return content.string;
}

"Much slower"
shared String fileNewRead(String file) {
    value content = StringBuilder();
    value newLine = "\n";
    Files.lines(Paths.get(file)).forEachOrdered((line) => content.append(line.string).append(newLine));
    return content.string.trimmed;
}