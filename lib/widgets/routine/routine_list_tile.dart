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
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.horizontal(left: Radius.circular(15)),
              image: DecorationImage(
                  image: NetworkImage(routine.imageUrl), fit: BoxFit.cover),
            ),
            height: 0.3 * width,
            width: 0.25 * width,
          ),
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
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 0.02 * height),
                    Icon(Icons.signal_cellular_alt_rounded),
                    Text("상급")
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      // padding: EdgeInsets.fromLTRB(
      //     0.035 * width, 0.02 * width, 0.035 * width, 0.02 * width),
      margin: EdgeInsets.fromLTRB(0.03 * width, 0.015 * height, 0.03 * width, 0),
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
}
