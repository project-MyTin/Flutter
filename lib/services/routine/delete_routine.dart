import 'package:http/http.dart';

Future<int> deleteRoutine(int id) async {
  final response = await delete(Uri.parse("http://3.34.209.123/routine/$id"));
  print(response.statusCode);
  return response.statusCode;
}
