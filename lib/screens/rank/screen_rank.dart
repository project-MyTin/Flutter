import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/rank_controller.dart';
import 'package:mytin/dummies/rank_list_dummy.dart';
import 'package:mytin/models/rank_tile.dart';
import 'package:mytin/widgets/rank/low_rank_box.dart';
import 'package:mytin/widgets/rank/top_rank_box.dart';

class RankPage extends StatelessWidget {
  final List<RankTile> userList;
  final int index;

  RankPage(this.userList, this.index);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TopRankBox(userList.length > 1 ? userList[1] : noneUser, 2),
                  TopRankBox(userList.length > 0 ? userList[0] : noneUser, 1),
                  TopRankBox(userList.length > 2 ? userList[2] : noneUser, 3),
                ],
              ),
              SizedBox(height: Get.height * 0.03),
              for (int i = 3; i < userList.length; i++)
                Padding(
                  padding: EdgeInsets.only(
                      top: Get.height * 0.003, bottom: Get.height * 0.003),
                  child: LowRankBox(userList[i], false, i + 1),
                ),
              SizedBox(height: Get.height * 0.086),
              if (userList.length < 10)
                SizedBox(height: Get.height * (0.086 * (9 - userList.length))),
            ],
          ),
        ),
        if (userList.length > 0)
          LowRankBox(userList[Get.find<RankController>().userIndexList[index]],
              true, Get.find<RankController>().userIndexList[index] + 1),
      ],
    );
  }
}
