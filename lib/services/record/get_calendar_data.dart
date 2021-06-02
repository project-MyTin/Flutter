import 'dart:convert';

import 'package:http/http.dart';

Future<List> loadCalendarData(int year, int month, [bool getOrigin = false]) async {
  final response =
      await get(Uri.parse("http://3.34.209.123/calendar?y=$year&m=$month"));
  final parsedRes = json.decode(response.body);
  final maxValue = parsedRes["data"]["result"]["max"];
  final List values = parsedRes["data"]["result"]["total_list"];
  if (getOrigin) {
    return values;
  } else {
    return maxValue > 0
        ? values.map((item) => item / maxValue).toList()
        : values.map((_) => 0.0).toList();
  }
}
