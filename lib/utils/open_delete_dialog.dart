import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/utils/show_snack_bar.dart';

void openDeleteDialog(String text) {
  Get.defaultDialog(
    title: "정말 삭제하시나요?",
    middleText: "삭제하신 $text은 다시 복구할 수 없습니다.",
    middleTextStyle: TextStyle(color: Colors.grey, fontSize: 14),
    cancel: TextButton(
        onPressed: () => Get.back(), child: Text("취소")),
    confirm: TextButton(
        onPressed: () {
          // TODO 삭제 요청
          Get.back();
          Get.back();
          showSnackBar("삭제 완료", "선택하신 $text이 정상적으로 삭제되었습니다.", "info");
        },
        child: Text("삭제", style: TextStyle(color: Colors.red))),
  );
}