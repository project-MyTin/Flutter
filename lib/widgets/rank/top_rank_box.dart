import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mytin/models/rank_tile.dart';

class TopRankBox extends StatelessWidget {
  final RankTile rankTile;

  TopRankBox(this.rankTile);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          MdiIcons.crown,
          size: Get.height * 0.04,
          color: rankTile.rankNumber == 1
              ? Color.fromRGBO(0xF8, 0xA5, 0x00, 1)
              : rankTile.rankNumber == 2
                  ? Colors.grey.withOpacity(0.4)
                  : Color.fromRGBO(0x70, 0x37, 0x37, 1),
        ),
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              height: Get.height * 0.09,
              width: Get.height * 0.09,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue),
                  image: DecorationImage(
                      image: NetworkImage(rankTile.imageUrl),
                      fit: BoxFit.cover)),
            ),
            Container(
              height: Get.height * 0.03,
              width: Get.height * 0.03,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
              alignment: Alignment.center,
              child: Text(rankTile.rankNumber.toString(),
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.014),
        Text(rankTile.name, style: TextStyle(fontSize: Get.height * 0.019)),
        SizedBox(height: Get.height * 0.005),
        Text(rankTile.value.toString() + " 분",
            style: TextStyle(color: Colors.black.withOpacity(0.4))),
        if (rankTile.rankNumber == 1) SizedBox(height: Get.height * 0.05),
      ],
    );
  }
}
