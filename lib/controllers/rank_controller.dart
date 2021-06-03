import 'package:get/get.dart';
import 'package:mytin/dummies/rank_list_dummy.dart';
import 'package:mytin/models/rank_tile.dart';
import 'package:mytin/services/record/get_calendar_data.dart';

class RankController extends GetxController {
  final DateTime now = DateTime.now();
  List<RankTile> todayUserList = [];
  List<RankTile> weekUserList = [];
  List<RankTile> monthUserList = [];
  List<int> userIndexList = [];
  RankTile userInfo = RankTile.fromMap({
    "name": "나",
    "imageUrl":
        "https://user-images.githubusercontent.com/48408417/120622923-351c8000-c49a-11eb-9a1c-60032de68cd4.jpg",
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
    print(userIndexList);
    super.onInit();
  }

  List<RankTile> insertAndSort(List<RankTile> outList, int userValue) {
    List<RankTile> tempList = List<RankTile>.from(outList);
    final user = RankTile.fromMap({
      "name": userInfo.name,
      "imageUrl": userInfo.imageUrl,
      "value": userValue,
    });
    tempList.add(user);
    tempList.sort((a, b) => b.value.compareTo(a.value));
    userIndexList.add(tempList.indexOf(user));
    return tempList;
  }
}
