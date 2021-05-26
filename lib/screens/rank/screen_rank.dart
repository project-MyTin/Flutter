import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/dummies/rank_list_dummy.dart';
import 'package:mytin/widgets/rank/low_rank_box.dart';
import 'package:mytin/widgets/rank/top_rank_box.dart';

class RankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TopRankBox(rankTileList[1]),
                  TopRankBox(rankTileList[0]),
                  TopRankBox(rankTileList[2]),
                ],
              ),
              SizedBox(height: Get.height * 0.03),
              for (int i = 3; i < rankTileList.length; i++)
                Padding(
                  padding: EdgeInsets.only(
                      top: Get.height * 0.003, bottom: Get.height * 0.003),
                  child: LowRankBox(rankTileList[i], false),
                ),
              SizedBox(height: Get.height * 0.086)
            ],
          ),
        ),
        LowRankBox(rankTileList[1], true)
      ],
    );
  }
}
