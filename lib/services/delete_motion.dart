import 'package:http/http.dart';

Future<int> deleteMotion(int id) async {
  final response = await delete(Uri.parse("http://3.34.209.123/motion/$id"));
  print(response.statusCode);
  return response.statusCode;
}
