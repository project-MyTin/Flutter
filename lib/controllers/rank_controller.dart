import 'package:get/get.dart';
import 'package:mytin/dummies/rank_list_dummy.dart';
import 'package:mytin/models/rank_tile.dart';

class RankController extends GetxController {
  List<RankTile> todayUserList = [];
  List<RankTile> weekUserList = [];
  List<RankTile> monthUserList = [];

  @override
  void onInit() {
    this.todayUserList = todayUsers;
    this.weekUserList = todayUsers;
    this.monthUserList = todayUsers;
    super.onInit();
  }
}