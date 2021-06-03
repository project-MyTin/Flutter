import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/models/rank_tile.dart';

class LowRankBox extends StatelessWidget {
  final RankTile rankTile;
  final int rankNumber;
  final bool isMe;

  LowRankBox(this.rankTile, this.isMe, this.rankNumber);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isMe ? Colors.lightBlue : Colors.white,
      height: Get.height * 0.08,
      child: Row(
        children: [
          SizedBox(width: Get.width * 0.04),
          Text(rankNumber.toString(),
              style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                  fontSize: Get.height * 0.022)),
          SizedBox(width: Get.width * 0.02),
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(rankTile.imageUrl), fit: BoxFit.cover),
                shape: BoxShape.circle),
            height: Get.height * 0.08,
            width: Get.height * 0.06,
          ),
          SizedBox(width: Get.width * 0.02),
          Text(rankTile.name,
              style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                  fontSize: Get.height * 0.019)),
          Spacer(),
          Text(rankTile.value.toString() + " 분",
              style: TextStyle(
                  color: isMe ? Colors.white : Colors.black.withOpacity(0.4))),
          SizedBox(width: Get.width * 0.04),
        ],
      ),
    );
  }
}
