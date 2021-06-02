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
    "imageUrl": "",
    "value": 0,
  });

  @override
  Future<void> onInit() async {
    List values = await loadCalendarData(DateTime.now().year, DateTime.now().month, true);
    this.todayUserList = todayUsers;
    userInfo.value = values[DateTime.now().day -1] + 100;
    todayUserList.add(userInfo);
    todayUserList.sort((a, b) => b.value.compareTo(a.value));
    todayUserList.forEach((element) {print(element.value);});
    this.weekUserList = weekUsers;
    this.monthUserList = monthUsers;
    update();
    super.onInit();
  }
}