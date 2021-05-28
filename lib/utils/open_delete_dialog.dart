import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytin/controllers/motion_list_controller.dart';
import 'package:mytin/screens/screen_routine_and_motion.dart';
import 'package:mytin/services/delete_motion.dart';
import 'package:mytin/utils/show_snack_bar.dart';

void openDeleteDialog(String text, int id) {
  Get.defaultDialog(
    title: "정말 삭제하시나요?",
    middleText: "삭제하신 $text은 다시 복구할 수 없습니다.",
    middleTextStyle: TextStyle(color: Colors.grey, fontSize: 14),
    cancel: TextButton(onPressed: () => Get.back(), child: Text("취소")),
    confirm: TextButton(
        onPressed: () async {
          if (text == "동작") {
            final res = await deleteMotion(id);
            Get.put(MotionListController());
            Get.find<MotionListController>().loadMotions();
          }
          Get.offAll(() => RoutineAndMotionPage(index: text == "루틴" ? 0 : 1));
          showSnackBar("삭제 완료", "선택하신 $text이 정상적으로 삭제되었습니다.", "info");
        },
        child: Text("삭제", style: TextStyle(color: Colors.red))),
  );
}
