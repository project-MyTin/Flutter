import 'package:dio/dio.dart';

Future<bool> postMotion(Map<String, dynamic> map) async {
  final String filePath = map["img"].path;
  final String fileName = filePath.split("/").last;
  map["img"] = await MultipartFile.fromFile(filePath, filename: fileName);
  final response = await Dio().post(
      "http://3.34.209.123/motion",
      data: FormData.fromMap(map)
  );
  print(response);
  return true;
}
