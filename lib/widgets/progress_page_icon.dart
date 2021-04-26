/*
 전체 단계(allPart)과 현재 단계(currentPart)을 입력받아,
 현재 단계를 표시하는
 */
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
          EdgeInsets.fromLTRB(rowPadding * width, 0.01 * height, rowPadding * width, 0.025 * height),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0.0005 * height, 0, 0),
            child: Divider(thickness: 0.002 * height, color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < allPart; i++)
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (i < currentPart) ? Colors.grey : Colors.white,
                      border: Border.all(color: Colors.grey, width: 0.002 * height)),
                  width: 0.04 * width,
                  height: 0.04 * width,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
