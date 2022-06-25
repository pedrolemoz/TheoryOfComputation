import 'dart:io';

createFile({
  required String nameFile,
  required String content,
}) async {
  final file = File(nameFile);
  file.writeAsStringSync(content);
}
