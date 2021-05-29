import 'dart:io';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

Future<File> fileFromImageUrl(String url) async {
  final response = await get(Uri.parse(url));
  final documentDirectory = await getApplicationDocumentsDirectory();
  final file = File(join(documentDirectory.path, url.split("/").last));
  file.writeAsBytesSync(response.bodyBytes);
  return file;
}