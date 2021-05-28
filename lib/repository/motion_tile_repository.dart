import 'dart:convert';

import 'package:http/http.dart';
import 'package:mytin/models/motion_tile.dart';

Future<dynamic> loadMotionList() async {
  final String s3Url = "https://mytin-bucket.s3.ap-northeast-2.amazonaws.com/";
  final response = await get("http://3.34.209.123/motion?q=");
  final parsedRes = json.decode(response.body);

  if (parsedRes["data"] == []) return [];
  final List motionsJson = parsedRes["data"]["result"];
  List<MotionTile> tileList = [];

  for (int i = 0; i < motionsJson.length; i++) {
    tileList.add(MotionTile.fromJson({
      "id": motionsJson[i]["motion_id"],
      "name": motionsJson[i]["name"],
      "part": motionsJson[i]["parts"][0],
      "difficulty": motionsJson[i]["difficulty"],
      "imageUrl": s3Url + motionsJson[i]["file"],
    }));
  }
  return tileList;
}
