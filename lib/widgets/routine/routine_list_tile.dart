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
      child: ListTile(
        leading: Image.network(routine.imageUrl),
        title: Text(routine.name),
        subtitle: Column(
          children: [
            Text(routine.description),
          ],
        ),
      ),
      margin: EdgeInsets.all(0.005 * height),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color.fromARGB(255, 220, 220, 220)),
          borderRadius: BorderRadius.all(Radius.circular(15))),
    );
  }
}
