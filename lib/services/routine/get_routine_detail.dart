import 'dart:convert';

import 'package:http/http.dart';
import 'package:mytin/dummies/routine_detail_dummy.dart';
import 'package:mytin/models/routine_detail.dart';

Future<RoutineDetail> loadRoutineDetail(int id) async {
  final String s3Url = "https://mytin-bucket.s3.ap-northeast-2.amazonaws.com/";
  final response = await get(Uri.parse("http://3.34.209.123/routine/detail/$id"));
  final parsedRes = json.decode(response.body);
  final routine = parsedRes["data"]["detail"];
  return currentRoutine;
  // return RoutineDetail.fromMap({
  //   "id": routine[""],
  //   "name": routine[""],
  //   "description": routine[""],
  //   "publisher": routine[""],
  //   "materials": routine[""],
  //   "motions": [
  //     MotionElement.fromMap({
  //       "name": routine[""],
  //       "part": routine[""],
  //       "count": routine[""],
  //       "imageUrl": routine[""],
  //       "time": routine[""],
  //     }),
  //   ],
  //   "time": routine[""],
  //   "authority": Authority.admin,
  //   "difficulty": routine[""],
  //   "type": routine[""],
  //   "breakTime": routine[""],
  //   "imageUrl": routine[""],
  // });
}