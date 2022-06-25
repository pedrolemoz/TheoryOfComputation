import 'dart:io';

class FileUtils {
  static Future<void> createOutputFile({
    required String fileName,
    required Iterable<String> contents,
  }) async {
    final file = File(fileName);
    final contentToWrite = contents.reduce((a, b) => a += '\n$b');
    await file.writeAsString(contentToWrite);
  }
}
