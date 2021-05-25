import 'package:flutter/material.dart';
import 'package:mytin/widgets/page_bottom_navigation_bar.dart';

class RecordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
              Text("5월"),
              Text("2021년"),
              IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: () {}),
            ],
          )
        ],
      ),
      bottomNavigationBar: PageBottomNavigationBar(),
    ));
  }
}
