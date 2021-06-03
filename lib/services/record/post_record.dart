import 'dart:convert';

import 'package:http/http.dart';

Future<dynamic> postRecord(int id, int time) async {
  final response = await post(
    Uri.parse("http://3.34.209.123/routine/record"),
    body: {"id": "$id", "total_time": "$time"},
    // body: {"id": id, "total_time": time},  // JSON 은 문자열만!
  );
  return json.decode(response.body);
}
