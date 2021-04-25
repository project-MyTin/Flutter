import 'package:flutter/material.dart';
import 'package:mytin/widgets/progress_page_icon.dart';

class AddPageHeader extends StatelessWidget {
  final String title, subText;
  final int part;
  final Function backPageFunc;

  AddPageHeader({this.title, this.subText, this.part, this.backPageFunc});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;

    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
              size: 0.04 * height,
            ),
            onPressed: () => backPageFunc(),
          ),
        ),
        ProgressPageIcon([1, 1, 1, 2, 3][part], 3, 0.41),
        Text(
          title,
          style: TextStyle(
              fontSize: 0.045 * height, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 0.007 * height),
        Text(
          subText,
          style: TextStyle(
            fontSize: 0.018 * height,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
