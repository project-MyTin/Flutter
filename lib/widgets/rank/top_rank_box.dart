import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mytin/models/rank_tile.dart';

class TopRankBox extends StatelessWidget {
  final RankTile rankTile;

  TopRankBox(this.rankTile);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(MdiIcons.crown),
      ]
    );
  }
}
