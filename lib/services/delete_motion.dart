import 'package:http/http.dart';

Future<int> deleteMotion(int id) async {
  final response =
      await delete(Uri.parse("http://3.34.209.123/motion"), body: {"id": id.toString()});
  // fixme : 404 에러
  print(response.statusCode);
  return response.statusCode;
}
