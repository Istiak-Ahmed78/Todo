import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  // For your reference print the AppDoc directory
  print(directory.path);
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/data.txt');
}

Future<File> writeContent(String data) async {
  final file = await _localFile;
  // Write the file
  return file.writeAsString(data);
}

Future<String> readcontent() async {
  try {
    final file = await _localFile;
    // Read the file
    String contents = await file.readAsString();
    return contents;
  } catch (e) {
    // If there is an error reading, return a default String
    return 'Error';
  }
}
