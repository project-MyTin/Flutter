import 'dart:convert';

import 'package:http/http.dart';
import 'package:mytin/models/routine_detail.dart';

Future<RoutineDetail> loadRoutineDetail(int id) async {
  final String s3Url = "https://mytin-bucket.s3.ap-northeast-2.amazonaws.com/";
  // final response = await get(Uri.parse("http://3.34.209.123/routine/detail/$id"));
  final response = await get(Uri.parse("http://3.34.209.123/routine/detail/24"));
  // fixme : 지대로 id 받아오세요
  final parsedRes = json.decode(response.body);
  final routine = parsedRes["data"]["detail"];
  int routineTime = 0;

  for (var motion in routine["motions"]) {
    routineTime += motion["motion_time"] * motion["numOfMotion"];
  }

  print(routine);

  return RoutineDetail.fromMap({
    "id": routine["id"],
    "name": routine["name"],
    "description": routine["description"],
    // "publisher": routine["publisher"],
    "publisher": "마이틴",
    "materials": [routine["materials"] as String],
    "motions": [
      for (var motion in routine["motions"])
        MotionElement.fromMap({
          "name": motion["motion_name"],
          "part": motion["motion_parts"][0],
          "count": motion["numOfMotion"],
          "imageUrl": motion["motion_file"],
          "time": motion["motion_time"],
          // "id": motion["_id"] as int,
        }),
    ],
    "time": routineTime,
    "authority": Authority.admin,
    "difficulty": routine["difficulty"],
    "type": routine["type"],
    "breakTime": routine["break_time"],
    "imageUrl": s3Url + routine["file"],
  });
}
