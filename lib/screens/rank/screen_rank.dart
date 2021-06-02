import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/dummies/rank_list_dummy.dart';
import 'package:mytin/models/rank_tile.dart';
import 'package:mytin/widgets/rank/low_rank_box.dart';
import 'package:mytin/widgets/rank/top_rank_box.dart';

class RankPage extends StatelessWidget {
  final List<RankTile> userList;

  RankPage(this.userList);

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
                  child: LowRankBox(userList[i], false, i),
                ),
              SizedBox(height: Get.height * 0.036),
              if(userList.length < 7) SizedBox(height: Get.height * (0.086 * (7 - userList.length))),
            ],
          ),
        ),
        LowRankBox(userList[0], true, 0),
      ],
    );
  }
}
