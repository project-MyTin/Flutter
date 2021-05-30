import 'dart:convert';

import 'package:http/http.dart';
import 'package:mytin/models/routine_detail.dart';
import 'package:mytin/models/routine_tile.dart';

Future<List<RoutineTile>> loadRoutineList() async {
  final String s3Url = "https://mytin-bucket.s3.ap-northeast-2.amazonaws.com/";
  final response = await get(Uri.parse("http://3.34.209.123/routine?q="));
  final parsedRes = json.decode(response.body);

  if (parsedRes["data"] == null) return [];
  final List routinesJson = parsedRes["data"]["result"];
  List<RoutineTile> tileList = [];

  for (var routine in routinesJson) {
    tileList.add(RoutineTile.fromMap({
      "id": routine["routine_id"],
      "name": routine["name"],
      "description": routine["description"],
      "time": 10,
      "authority": Authority.admin,
      "difficulty": routine["difficulty"],
      "type": routine["type"],
      "imageUrl": s3Url + routine["file"],
    }));
  }
  return tileList;
}
