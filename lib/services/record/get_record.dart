import 'dart:convert';

import 'package:http/http.dart';

Future<void> loadRecord() async {
  final String s3Url = "https://mytin-bucket.s3.ap-northeast-2.amazonaws.com/";
  final response = await get(Uri.parse("http://3.34.209.123/calendar/detail?y=2021&m=5&d=31"));
  final parsedRes = json.decode(response.body);
  print(parsedRes);
}
