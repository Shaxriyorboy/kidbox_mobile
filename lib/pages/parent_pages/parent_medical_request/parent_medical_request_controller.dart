import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ParentMedicalRequestController extends GetxController {
  final frequenController = TextEditingController();
  String frequency = "frequency";
  DateTime startdate = DateTime.now();
  DateTime finishdate = DateTime.now();

  void changeFrequency(String? newValue) {
    frequency = newValue ?? frequency;
    update();
  }

  void changeStartDateTime(DateTime newDate) {
    startdate = newDate;
    update();
  }

  void changeFinishDateTime(DateTime newDate) {
    finishdate = newDate;
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
