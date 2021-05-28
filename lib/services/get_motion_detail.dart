import 'dart:convert';

import 'package:http/http.dart';
import 'package:mytin/dummies/motion_detail_dummy.dart';
import 'package:mytin/models/motion_detail.dart';

Future<MotionDetail> loadMotionDetail(int id) async {
  final String s3Url = "https://mytin-bucket.s3.ap-northeast-2.amazonaws.com/";
  final response = await get(Uri.parse("http://3.34.209.123/motion/detail/$id"));
  final parsedRes = json.decode(response.body);
  final motion = parsedRes["data"]["detail"];
  return MotionDetail.fromJson({
    "id": id,
    "name": motion["name"],
    "part": motion["parts"][0],
    "difficulty": motion["difficulty"],
    // "imageUrl": s3Url + motion["file"],
    // fixme : image 403 오류 해결
    "imageUrl": currentMotion.imageUrl,
    "time": motion["time"],
    "referenceUrl": motion["url"],
    "type": motion["type"],
    "description": motion["description"],
    "publisher": "마이틴",
  });
}