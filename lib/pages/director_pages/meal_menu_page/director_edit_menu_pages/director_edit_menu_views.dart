import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddMenuForDay extends StatelessWidget {
  String weekDays;
  AddMenuForDay({Key? key,required this.weekDays}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              weekDays,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.sp),
            ),
            SizedBox(
              height: 15.h,
            ),
            AddMenuItem(eatingTime: "breakfast"),
            SizedBox(
              height: 24.h,
            ),
            AddMenuItem(eatingTime: "lunch"),
            SizedBox(
              height: 24.h,
            ),
            AddMenuItem(eatingTime: "afternoon_tea"),
          ],
        ),
      ),
    );
  }
}


class AddMenuItem extends StatelessWidget {
  String eatingTime;
  AddMenuItem({Key? key,required this.eatingTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
      ),
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.w, top: 16.h, bottom: 10.h),
            child: Text(
              eatingTime.tr,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ),
          Divider(color: Colors.black, height: 0),
          TextField(
            maxLines: null,
            textInputAction: TextInputAction.newline,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
              border: InputBorder.none,
              hintText: "enter_meal".tr,
              hintStyle:
              TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}




class BackAndCheckIcons extends StatelessWidget {
  const BackAndCheckIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          Container(
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: Colors.black.withOpacity(0.25),
            ),
            height: 48.w,
            width: 48.w,
            alignment: Alignment.center,
          ),
          Spacer(),
          Container(
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.check_circle_outline,
                color: Colors.white,
                size: 28,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: Colors.black.withOpacity(0.25),
            ),
            height: 48.w,
            width: 48.w,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}

class BackgroundImages extends StatelessWidget {
  const BackgroundImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            alignment: Alignment.topCenter,
            image: AssetImage(
              "assets/images/beckground_image_meal3.png",
            ),
            fit: BoxFit.fitWidth,
            height: 360.h,
          ),
        ),
        Expanded(
          child: Image(
            image: AssetImage(
                "assets/images/beckground_image_meal2.png"),
            fit: BoxFit.fitHeight,
            height: 360.h,
          ),
        ),
        Expanded(
          child: Image(
            image: AssetImage(
              "assets/images/beckground_image_meal1.png",
            ),
            fit: BoxFit.fitWidth,
            height: 360.h,
          ),
        ),
      ],
    );
  }
}

