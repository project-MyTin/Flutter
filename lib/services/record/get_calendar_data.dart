import 'dart:convert';

import 'package:http/http.dart';

Future<Map<String, dynamic>> loadCalendarData(int year, int month) async {
  final response = await get(
      Uri.parse("http://3.34.209.123/calendar?y=$year&m=$month"));
  final parsedRes = json.decode(response.body);
  return {
    "list": parsedRes["data"]["result"]["total_list"],
    "maxValue": parsedRes["data"]["result"]["max"],
  };
}
