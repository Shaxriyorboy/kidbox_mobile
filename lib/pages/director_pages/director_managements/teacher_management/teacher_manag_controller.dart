import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

class DirTeacherManageController extends GetxController {
  bool isSelected = false;
  List<bool> checkList = List.generate(10, (index) => false);

  void chooseGroup(int index) {
    for (int i = 0; i < checkList.length; i++) {
      if (i == index) {
        checkList[i] = true;
      } else {
        checkList[i] = false;
      }
    }
    isSelected = true;
    update();
  }

  void cancelChoosingGroup() {
    for (int i = 0; i < checkList.length; i++) {
      checkList[i] = false;
    }
    isSelected = false;
    update();
    Get.back();
  }
}
