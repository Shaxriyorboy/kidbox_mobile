import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/login_page_parent/parent_login_controller.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_medical_request/parent_medical_request_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

import '../../log_in_pages/role_page/role_view.dart';

class ParentMedRequest extends StatelessWidget {
  const ParentMedRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ChildAccountInfoForAppBar extends StatelessWidget {
  const ChildAccountInfoForAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// director image
        CircleAvatar(
          radius: 37.5.r,
          backgroundColor: Colors.blue,
        ),
        SizedBox(
          width: 20.w,
        ),

        /// name and group name
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Child name // Qaysi bolasini nomidan so'rov jo'natayotganini bilish uchun
            Text(
              "Hojiboyeva T.B",
              style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.mainColorBlack,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 6.h,
            ),
            //group name
            Text(
              "Banana group",
              style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.mainColorBlack,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        const Spacer(),

        /// edit icon
      ],
    );
  }
}

class TextFieldForMedicalRequest extends StatelessWidget {
  String hintText;

  TextFieldForMedicalRequest({Key? key, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      height: 48.h,
      decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.circular(10.r)),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          // fillColor: Colors.blue.shade100,
          border: InputBorder.none,
          hintText: hintText.tr,
        ),
      ),
    );
  }
}

// for button save
class ButtonForSave extends StatelessWidget {
  final String buttonText;

  const ButtonForSave({Key? key, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)), backgroundColor: AppColors.mainColorOrange,
        minimumSize: Size(90.w, 45.h),
        elevation: 0,
      ),
      onPressed: () {},
      child: Text(
        buttonText,
        style: TextStyle(
            fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),
      ),
    );
  }
}

// for option frequency
Widget dropDownButton(
    List list, var controller, String value, void Function(String?) function) {
  return Container(
    height: 60.h,
    alignment: Alignment.center,
    margin: EdgeInsets.only(bottom: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(10.r)),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        alignment: Alignment.center,
        borderRadius: BorderRadius.circular(10.r),
        isExpanded: true,
        hint: Text(value),
        style: TextStyle(
            fontSize: 16.sp, color: Colors.black, fontFamily: "Poppins"),
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        onChanged: function,
        items: ["1 time", "2 time", "3 time", "4 time", "5 time"]
            .map((String tag) {
          return DropdownMenuItem<String>(
            value: tag,
            child: Text(
              tag,
            ),
          );
        }).toList(),
      ),
    ),
  );
}

/// for Choose data
Widget chosenDateForMedicalRequest(BuildContext context,
    ParentMedicalRequestController controller, String fromTo) {
  return GestureDetector(
    onTap: () => controller.showDialog(
      CupertinoDatePicker(
        // initialDateTime: controller.date,
        mode: CupertinoDatePickerMode.date,
        use24hFormat: true,
        onDateTimeChanged: (DateTime newDate) {
          if (fromTo == "Start") {
            controller.changeStartDateTime(newDate);
          } else {
            controller.changeFinishDateTime(newDate);
          }
        },
      ),
      context,
    ),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      height: 48.h,
      width: 384.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.mainWhiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$fromTo date"),
          fromTo == "Start"
              ? Text("${controller.startdate.toString().substring(0, 10)}")
              : Text("${controller.finishdate.toString().substring(0, 10)}")
        ],
      ),
    ),
  );
}
