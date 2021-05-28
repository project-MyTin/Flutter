import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar(String title, String body, String type) {
  Get.snackbar(
    title,
    body,
    snackPosition: SnackPosition.TOP,
    backgroundColor: type == "warning" ? Colors.redAccent : Colors.lightBlueAccent,
    colorText: Colors.white,
    onTap: (snack) => Get.back(),
    animationDuration: Duration(milliseconds: 700),
    icon: Icon(
      {"warning": Icons.warning, "info": Icons.info}[type],
      color: Colors.white,
    ),
  );
}
