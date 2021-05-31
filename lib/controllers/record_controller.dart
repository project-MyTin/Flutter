import 'package:get/get.dart';

enum MODE { DAY, WEEK, MONTH }

class RecordController extends GetxController {
  final int leftmostIndex = (2021 * 12) + 5;
  final int leftmostMotionYear = 202105;
  final int rightmostMotionYear = 203005;
  MODE mode = MODE.DAY;
  int currentViewMonth = DateTime.now().month;
  int currentViewYear = DateTime.now().year;
  int monthIndex;
  List<bool> isPanelsOpen = [false, false];

  @override
  void onInit() {
    monthIndex = (currentViewYear * 12) + currentViewMonth - leftmostIndex;
    super.onInit();
  }

  void setPanelOpen(int index, bool isOpen) {
    isPanelsOpen[index] = !isOpen;
    update();
  }

  void changeMonth(int newIndex) {
    if(newIndex > monthIndex) {
      if(currentViewMonth > 11) {
        currentViewYear++;
        currentViewMonth = 1;
      } else {
        currentViewMonth++;
      }
    }else {
      if(currentViewMonth < 2) {
        currentViewYear--;
        currentViewMonth = 12;
      } else {
        currentViewMonth--;
      }
    }
    monthIndex = newIndex;
    update();
  }
}
