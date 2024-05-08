import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/services/log_service.dart';

class NurseScheduleController extends GetxController {
  PageController pageController = PageController(initialPage: 0);

  Map<String, Map<String, String>> titles = {};

  Future<void> mergeToMap(String weekday) async {
    Map<String, String> data = {};
    for (TextEditingController item in titleControllers) {
      if (item.text.isNotEmpty) {
        data.addAll({Random().nextInt(100).toString(): item.text});
      }
      update();
    }
    titles.addAll({weekday: data});
    update();
    LogService.w(titles[weekday].toString());
  }

  Future<void> cleanUpController() async {
    for (TextEditingController item in titleControllers) {
      item.clear();
      update();
    }
  }

  int fieldNumber1 = 1;
  int fieldNumber2 = 1;
  int fieldNumber3 = 1;
  int fieldNumber4 = 1;
  int fieldNumber5 = 1;

  DateTime? date1;
  DateTime? date2;
  DateTime? date3;
  DateTime? date4;
  DateTime? date5;

  final titleController1 = TextEditingController();
  final titleController2 = TextEditingController();
  final titleController3 = TextEditingController();
  final titleController4 = TextEditingController();
  final titleController5 = TextEditingController();

  late List<int> fieldNumbers = [
    fieldNumber1,
    fieldNumber2,
    fieldNumber3,
    fieldNumber4,
    fieldNumber5
  ];

  late List<DateTime?> dateList = [
    date1,
    date2,
    date3,
    date4,
    date5,
  ];

  late List<TextEditingController> titleControllers = [
    titleController1,
    titleController2,
    titleController3,
    titleController4,
    titleController5,
  ];



  void changeDateTime(DateTime newDate,int index){
    dateList[index] = newDate;
    update();
  }

  /// #Dialog for date picker
  void showDialog(Widget child, BuildContext context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216.h,
          padding: EdgeInsets.only(top: 6.h),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: child,
        ));
  }
}
