import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/models/rank_tile.dart';

class LowRankBox extends StatelessWidget {
  final RankTile rankTile;
  final bool isMe;

  LowRankBox(this.rankTile, this.isMe);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isMe ? Colors.lightBlue : Colors.white,
      height: Get.height * 0.08,
      child: Row(
        children: [
          SizedBox(width: Get.width * 0.04),
          Text(rankTile.rankNumber.toString()),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(rankTile.imageUrl), fit: BoxFit.cover),
                shape: BoxShape.circle),
            height: Get.width * 0.03,
            width: Get.width * 0.03,
          ),
          Text(rankTile.name),
          Spacer(),
          Text(rankTile.value.toString()),
          SizedBox(width: Get.width * 0.04),
        ],
      ),
    );
  }
}
