import 'package:flutter/material.dart';

class ProgressPageIcon extends StatelessWidget {
  final int currentPart, allPart;
  final double rowPadding;

  ProgressPageIcon(this.currentPart, this.allPart, this.rowPadding);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return Padding(
      padding:
          EdgeInsets.fromLTRB(rowPadding * width, 0.01 * height, rowPadding * width, 0.01 * height),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0.0015 * height, 0, 0),
            child: Divider(thickness: 0.003 * height, color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < allPart; i++)
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (i < currentPart) ? Colors.grey : Colors.white,
                      border: Border.all(color: Colors.grey, width: 0.004 * height)),
                  width: 0.045 * width,
                  height: 0.045 * width,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
