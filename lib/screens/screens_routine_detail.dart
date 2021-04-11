import 'package:flutter/material.dart';
import 'package:mytin/dummies/routine_detail_dummy.dart';

class RoutineDetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width,
        height = screenSize.height;

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(routine.name),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined),
              onPressed: () => print("나 나갈래!"),
            ),
            actions: [
              IconButton(icon: Icon(Icons.delete), onPressed: () => print("지울래!")),
              IconButton(icon: Icon(Icons.edit), onPressed: () => print("수정할래!"))
            ],
          ),
          body: Column(
            children: [

            ],
          ),
          bottomNavigationBar: TextButton(
            child: Text("시작하기"),
            onPressed: () => print("시작좀 하자!"),
          ),
        )
    );
  }
}
