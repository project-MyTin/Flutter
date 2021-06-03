import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/rank_controller.dart';
import 'package:mytin/screens/rank/screen_rank.dart';
import 'package:mytin/widgets/page_bottom_navigation_bar.dart';

class RankTabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(RankController());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TabBar(
            labelColor: Colors.lightBlue,
            unselectedLabelColor: Colors.black,
            labelStyle: TextStyle(fontSize: Get.height * 0.018),
            indicatorColor: Colors.lightBlue,
            indicatorWeight: Get.height * 0.005,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: "오늘의 랭킹"),
              Tab(text: "이번주 랭킹"),
              Tab(text: "이번달 랭킹"),
            ],
          ),
        ),
        body: GetBuilder<RankController>(
          builder: (ctr) => TabBarView(
            children: [
              RankPage(ctr.todayUserList, 0),
              RankPage(ctr.weekUserList, 1),
              RankPage(ctr.monthUserList, 2),
            ],
          ),
        ),
        bottomNavigationBar: PageBottomNavigationBar(),
      ),
    );
  }
}
