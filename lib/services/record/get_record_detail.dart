import 'dart:convert';

import 'package:http/http.dart';
import 'package:mytin/models/record_data.dart';

Future<RecordData> loadRecordDetail(int year, int month, int day) async {
  final String s3Url = "https://mytin-bucket.s3.ap-northeast-2.amazonaws.com/";
  final response = await get(
      Uri.parse("http://3.34.209.123/calendar/detail?y=$year&m=$month&d=$day"));
  final parsedRes = json.decode(response.body);

  if(parsedRes["statusCode"] == "10000") {
    final record = parsedRes["data"];
    return RecordData.fromMap({
      "totalTime": record["routine_total_time"],
      "totalExp": record["exp"],
      "countRoutine": record["routine_num"],
      "countMotion": record["motion_num"],
      "motionList": [
        for(var motion in record["motion_list"])
          RecordTile.fromMap({
            "id": motion["motion_id"],
            "name": motion["motion_name"],
            "imageUrl": s3Url + motion["motion_file"],
            "time": motion["motion_time"],
          }),
      ],
      "routineList": [
        for(var routine in record["routine_list"])
          RecordTile.fromMap({
            "id": routine["routine_id"],
            "name": routine["routine_name"],
            "imageUrl": s3Url + routine["routine_file"],
            "time": routine["routine_time"],
          }),
      ],
    });
  } else return null;
}
