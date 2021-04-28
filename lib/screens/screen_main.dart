import 'package:flutter/material.dart';
import 'package:mytin/widgets/page_bottom_navigation_bar.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("메인 페이지")
            ],
          ),
        ),
        bottomNavigationBar: PageBottomNavigationBar(1),
      ),
    );
  }
}
