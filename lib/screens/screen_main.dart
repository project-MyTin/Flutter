import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mytin/widgets/page_bottom_navigation_bar.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width, height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              buildMainPageHeader(height, width),
            ],
          ),
        ),
        bottomNavigationBar: PageBottomNavigationBar(1),
      ),
    );
  }

  Container buildMainPageHeader(double height, double width) {
    return Container(
      color: Colors.blue.withOpacity(0.3),
      width: width,
      height: 0.4 * height,
      child: Column(
            children: [
              SizedBox(height: 0.04 * height),
              SvgPicture.asset(
                "images/undraw_fitness_tracker_3033.svg",
                width: 0.7 * width,
              ),
              Container(
                // decoration: ,
              ),
              // Stack(
              //   children: [
              //     // Positioned(
              //     //   top: 0.6 * height,
              //     //   child: Container(
              //     //     child: Text("d"),
              //     //     height: 0.4 * height,
              //     //     width: width,
              //     //     decoration: BoxDecoration(
              //     //       color: Colors.white,
              //     //       borderRadius: BorderRadius.all(Radius.circular(20)),
              //     //     ),
              //     //   ),
              //     // ),
              //   ],
              // ),

            ],
          ),
    );
  }
}
