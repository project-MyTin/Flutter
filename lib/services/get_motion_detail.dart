import 'package:http/http.dart';

Future<void> loadMotionDetail(int id) async {
  final response = await get(Uri.parse("http://mytin.com/motion/detail/$id"));
  print(response);
}