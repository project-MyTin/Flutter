import 'package:flutter/material.dart';

class SliverListHeader extends StatelessWidget {
  final String title, subText;
  final Function searchFunc;

  SliverListHeader(this.title, this.subText, this.searchFunc);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height, width = screenSize.width;

    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(icon: Icon(Icons.keyboard_backspace), onPressed: () {}),
            Padding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 0.036 * height, fontWeight: FontWeight.bold)),
                  Text(subText),
                ],
              ),
              padding: EdgeInsets.fromLTRB(0.03 * width, 0, 0, 0),
            ),
          ],
        ),
        color: Colors.white,
        padding: EdgeInsets.all(0.03 * width),
      ),
    );
  }
}
