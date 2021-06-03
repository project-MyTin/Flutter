import 'dart:io';

import 'package:date_util/date_util.dart';
import 'package:get/get.dart';
import 'package:mytin/dummies/rank_list_dummy.dart';
import 'package:mytin/models/rank_tile.dart';
import 'package:mytin/services/record/get_calendar_data.dart';

class RankController extends GetxController {
  final DateTime now = DateTime.now();
  List<RankTile> todayUserList = [];
  List<RankTile> weekUserList = [];
  List<RankTile> monthUserList = [];
  RankTile userInfo = RankTile.fromMap({
    "name": "나",
    "imageUrl":
        "https://cdn.crowdpic.net/list-thumb/thumb_l_6397644C272DE552A4269960FFA7EEB4.jpg",
    "value": 0,
  });

  @override
  Future<void> onInit() async {
    List values = await loadCalendarData(now.year, now.month, true);
    List weekValues = values.sublist(
        now.day - now.weekday - 1 < 0 ? 0 : now.day - now.weekday - 1,
        now.day + (7 - now.weekday) >= values.length
            ? values.length - 1
            : now.day + (7 - now.weekday));

    todayUserList = insertAndSort(todayUsers, values[now.day - 1]);
    weekUserList = insertAndSort(weekUsers, weekValues.reduce((a, b) => a + b));
    monthUserList = insertAndSort(monthUsers, values.reduce((a, b) => a + b));
    update();
    super.onInit();
  }

  List<RankTile> insertAndSort(List<RankTile> outList, int userValue) {
    List<RankTile> tempList = List<RankTile>.from(outList);
    tempList.add(RankTile.fromMap({
      "name": userInfo.name,
      "imageUrl": userInfo.imageUrl,
      "value": userValue,
    }));
    tempList.sort((a, b) => b.value.compareTo(a.value));
    return tempList;
  }
}
