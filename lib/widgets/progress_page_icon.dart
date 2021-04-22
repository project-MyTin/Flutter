import 'package:flutter/material.dart';

class ProgressPageIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Icon(Icons.circle),
        Expanded(child: Divider()),
        Icon(Icons.circle),
        Expanded(child: Divider()),
        Icon(Icons.circle),
        Expanded(child: Divider()),
        Icon(Icons.circle),
        Expanded(child: Divider()),
      ],
    );
  }
}
  