import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar(String title, String body, String type) {
  Get.snackbar(
    title,
    body,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: type == "warning" ? Colors.redAccent : Colors.lightGreen,
    colorText: Colors.white,
    animationDuration: Duration(milliseconds: 600),
    icon: Icon(
      type == "warning" ? Icons.warning : Icons.info,
      color: Colors.white,
    ),
  );
}
