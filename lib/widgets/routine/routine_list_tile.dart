import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytin/models/routine_tile.dart';

class RoutineListTile extends StatelessWidget {
  final RoutineTile routine;

  RoutineListTile(this.routine);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return Container(
      child: Row(
        children: [
          buildImageBox(width),
          Container(
            width: 0.6 * width,
            padding: EdgeInsets.fromLTRB(0.03 * width, 0.02 * width, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(routine.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 0.04 * width)),
                Text(
                  routine.description,
                  style: TextStyle(fontSize: 0.03 * width),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 0.025 * width),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoColumn("소요시간", "10분", width),
                    buildInfoColumn("난이도", "상급", width),
                    buildInfoColumn("권한", "공식", width),
                    buildInfoColumn("유형", "다이어트", width),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      // padding: EdgeInsets.fromLTRB(
      //     0.035 * width, 0.02 * width, 0.035 * width, 0.02 * width),
      margin:
          EdgeInsets.fromLTRB(0.03 * width, 0.015 * height, 0.03 * width, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromARGB(255, 220, 220, 220)),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.6,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
    );
  }

  Container buildImageBox(double width) {
    return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.horizontal(left: Radius.circular(15)),
            image: DecorationImage(
                image: NetworkImage(routine.imageUrl), fit: BoxFit.cover),
          ),
          height: 0.3 * width,
          width: 0.26 * width,
        );
  }

  Column buildInfoColumn(String key, String value, double width) {
    return Column(
      children: [
        Text(key, style: TextStyle(fontSize: 0.024 * width, color: Colors.grey)),
        Text(value, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
