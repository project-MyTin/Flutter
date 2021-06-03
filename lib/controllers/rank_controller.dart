import 'dart:io';

import 'package:get/get.dart';
import 'package:mytin/dummies/rank_list_dummy.dart';
import 'package:mytin/models/rank_tile.dart';
import 'package:mytin/services/record/get_calendar_data.dart';

class RankController extends GetxController {
  List<RankTile> todayUserList = [];
  List<RankTile> weekUserList = [];
  List<RankTile> monthUserList = [];
  RankTile userInfo = RankTile.fromMap({
    "name": "나",
    "imageUrl": "https://cdn.crowdpic.net/list-thumb/thumb_l_6397644C272DE552A4269960FFA7EEB4.jpg",
    "value": 0,
  });

  @override
  Future<void> onInit() async {
    print("뭐지");
    List values = await loadCalendarData(DateTime.now().year, DateTime.now().month, true);
    this.todayUserList = List<RankTile>.from(todayUsers);
    userInfo.value = values[DateTime.now().day -1] + 100;
    todayUserList.add(userInfo);
    todayUserList.sort((a, b) => b.value.compareTo(a.value));
    this.weekUserList = weekUsers;
    this.monthUserList = monthUsers;
    update();
    super.onInit();
  }
}