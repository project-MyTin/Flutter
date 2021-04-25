import 'package:flutter/material.dart';

class SliverListHeader extends StatelessWidget {
  final String title, subText;
  final Function searchFunc;

  SliverListHeader(this.title, this.subText, this.searchFunc);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;

    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(icon: Icon(Icons.keyboard_backspace), onPressed: () {}),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 0.036 * height, fontWeight: FontWeight.bold)),
                Text(subText),
                SizedBox(height: 0.04 * height),
              ],
            ),
          ],
        ),
        color: Colors.white,
        // width: width,
      ),
    );
  }
}
