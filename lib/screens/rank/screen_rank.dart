import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/dummies/rank_list_dummy.dart';
import 'package:mytin/widgets/rank/top_rank_box.dart';

class RankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
