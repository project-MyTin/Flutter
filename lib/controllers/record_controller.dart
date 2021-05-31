import 'package:get/get.dart';

enum MODE { DAY, WEEK, MONTH }

class RecordController extends GetxController {
  MODE mode = MODE.DAY;
  int currentViewMonth = DateTime.now().month;
  int currentViewYear = DateTime.now().year;
  List<bool> isPanelsOpen = [false, false];

  void setPanelOpen(int index, bool isOpen) {
    isPanelsOpen[index] = !isOpen;
    update();
  }
}
