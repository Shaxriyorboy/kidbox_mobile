import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddChildController extends GetxController{
  String gender = "gender".tr;

  void changeGenderDropdown(String? newValue){
    gender = newValue ?? gender;
    update();
  }

  DateTime date = DateTime(2016, 10, 26);
  bool isChooseDate = false;


  void changeDateTime(DateTime newDate){
    date = newDate;
    isChooseDate = true;
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