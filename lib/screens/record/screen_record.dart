import 'package:flutter/material.dart';
import 'package:mytin/widgets/page_bottom_navigation_bar.dart';
import 'package:mytin/widgets/record/main_data_record.dart';

class RecordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
                Text("5월"),
                Text("2021년"),
                IconButton(
                    icon: Icon(Icons.arrow_forward_ios), onPressed: () {}),
                Spacer(),
                TextButton(onPressed: () {}, child: Text("D")),
                TextButton(onPressed: () {}, child: Text("W")),
                TextButton(onPressed: () {}, child: Text("M")),
              ],
            ),
            MainDataRecord({
              "totalTime": 10,
              "totalExp": 10,
              "countRoutine": 10,
              "countMotion": 10,
            }),
          ],
        ),
        bottomNavigationBar: PageBottomNavigationBar(),
      ),
    );
  }
}
