import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/bottom_page_controller.dart';

class PageBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomPageController>(
      builder: (ctr) => BottomNavigationBar(
        onTap: (value) => ctr.setIndex(value),
        currentIndex: ctr.index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
          BottomNavigationBarItem(icon: Icon(Icons.directions_run), label: "운동"),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: "기록"),
          BottomNavigationBarItem(icon: Icon(Icons.assessment), label: "랭킹"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "프로필"),
        ],
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.black.withOpacity(0.6),
      ),
    );
  }
}
