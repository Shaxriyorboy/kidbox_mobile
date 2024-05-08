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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () => Get.back(),
          style: ElevatedButton.styleFrom(
            elevation: 0, backgroundColor: Colors.black.withOpacity(0.25),
            padding: EdgeInsets.only(left: 6.w),
            fixedSize: Size(45.w,45.w),
            shape: const CircleBorder(),
          ),
          child: Icon(Icons.arrow_back_ios,size: 25.sp,color: Colors.white,),
        ),
        ElevatedButton(
          onPressed: () => Get.back(),
          style: ElevatedButton.styleFrom(
            elevation: 0, backgroundColor: Colors.black.withOpacity(0.25),
            fixedSize: Size(45.w,45.w),
            shape: const CircleBorder(),
          ),
          child: Icon(Icons.check_circle_outline,size: 31.sp,color: Colors.white,),
        ),
      ],
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
            image: const AssetImage(
              "assets/images/beckground_image_meal3.png",
            ),
            fit: BoxFit.fitWidth,
            height: 360.h,
          ),
        ),
        Expanded(
          child: Image(
            image: const AssetImage(
                "assets/images/beckground_image_meal2.png"),
            fit: BoxFit.fitWidth,
            height: 360.h,
          ),
        ),
        Expanded(
          child: Image(
            image: const AssetImage(
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

