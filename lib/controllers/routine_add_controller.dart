import 'package:get/get.dart';

class RoutineAddController extends GetxController{
  int part = 1;

  void next() {
    part++;
    update();
  }

  void submit() {
    part = 1;
    update();
  }
}