import 'package:dio/dio.dart';

Future<int> putRoutine(int id, Map<String, dynamic> map) async {
  final String filePath = map["img"].path;
  final String fileName = filePath.split("/").last;
  map["img"] = await MultipartFile.fromFile(filePath, filename: fileName);
  final response = await Dio().put(
      "http://3.34.209.123/routine/$id",
      data: FormData.fromMap(map)
  );
  return response.statusCode;
}
