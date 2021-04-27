import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar(String title, String body, String type) {
  Get.snackbar(
    title,
    body,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: type == "warning" ? Colors.redAccent : Colors.lightGreen,
    colorText: Colors.white,
    onTap: (snack) => Get.back(),
    animationDuration: Duration(milliseconds: 700),
    icon: Icon(
      type == "warning" ? Icons.warning : Icons.info,
      color: Colors.white,
    ),
  );
}
