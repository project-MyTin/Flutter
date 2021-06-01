import 'dart:convert';

import 'package:http/http.dart';

Future<void> postRecord(int id, int time) async {
  final response = await post(
    Uri.parse("http://3.34.209.123/routine/record"),
    body: {"id": "$id", "total_time": "$time"},
    // body: {"id": id, "total_time": time},  // JSON 은 문자열만!
  );
  final parsedRes = json.decode(response.body);
  print(parsedRes);
}
