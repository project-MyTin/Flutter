import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/screens/rank/screen_rank.dart';
import 'package:mytin/widgets/page_bottom_navigation_bar.dart';

class RankTabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              Tab(text: "시간 별"),
              Tab(text: "유형 별"),
              Tab(text: "부위 별"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RankPage(),
            RankPage(),
            RankPage(),
          ],
        ),
        bottomNavigationBar: PageBottomNavigationBar(),
      ),
    );
  }
}
