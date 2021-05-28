import 'package:http/http.dart';

Future<bool> postMotion(var motion) async {
  final response = await post(
    Uri.parse("http://3.34.209.123/motion"),
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: motion,
  );
  print(response);
  return true;
}


class MotionPost {
  String name;
  List<String> parts;
  String difficulty;
  var file;
  int time;
  String url;
  String type;
  String description;

  MotionPost.fromMap(Map<String, dynamic> map)
      : name = map["name"],
        parts = map["parts"],
        difficulty = map["difficulty"],
        file = map["file"],
        time = map["time"],
        url = map["url"],
        type = map["type"],
        description = map["description"];
}
