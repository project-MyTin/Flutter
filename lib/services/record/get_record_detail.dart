import 'dart:convert';

import 'package:http/http.dart';

Future<void> loadRecordDetail(int year, int month, int day) async {
  final String s3Url = "https://mytin-bucket.s3.ap-northeast-2.amazonaws.com/";
  final response = await get(Uri.parse("http://3.34.209.123/calendar/detail?y=$year&m=$month&d=$day"));
  final parsedRes = json.decode(response.body);
  print(parsedRes);
}
