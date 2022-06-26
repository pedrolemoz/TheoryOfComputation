import 'dart:io';
import 'package:path/path.dart' as path;

class FileUtils {
  static Future<void> createOutputFile({
    required String fileName,
    required Iterable<String> contents,
  }) async {
    print('Creating $fileName');
    final filePath = path.join(Directory.current.path, 'output', fileName);
    final file = await File(filePath).create(recursive: true);
    final contentToWrite = contents.reduce((a, b) => a += '\n$b');
    await file.writeAsString(contentToWrite);
  }
}
