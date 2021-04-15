import 'package:get/get.dart';

class RoutineAddController extends GetxController{
  int part = 1;

  void next() {
    part++;
    update();
  }
}