
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:lottie/lottie.dart';
import 'calendar.dart';

   /// #AddItem
   Widget addItem({required Widget goToPage}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /// #Lottie
        Lottie.asset("assets/lottie_animations/album_null_page.json",
            height: 400.h,
            width: 1.sw
        ),
        const Text("Not found"),
      ],
    );
   }


   /// #NoItem
   Widget unAuthorized(){
  return Scaffold(
    backgroundColor: AppColors.mainBackgroundColor,
    body: Column(
      children: [
        ///#ListTile for name and Avatar
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.only(right: 15.w,left: 15.w, top: 55.h, bottom: 0),
          title: Text(
            "${"name".tr} : Farida",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
          ),
          subtitle: Text("${"kindergarten".tr} : Delfinchiik",
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.colorTextLightGrey),),
          trailing: Container(
            height: 58.h,width: 58.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.mainColorOrange,width: 2.r),
              image: const DecorationImage(
                image: AssetImage("assets/images/image.png"),
              ),
            ),
          ),
        ),

        ///#Calendar
        Calendar(),

        ///#Lottie
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Center(
              child: Lottie.asset("assets/lottie_animations/pending_page_anim.json"),
            ),
          ),
        ),

        ///#Pending Text
        Center(
          child: Text(
            "pending_auth".tr,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.sp),
          ),
        ),
        SizedBox(height: 182.h,),
      ],
    ),
  );
}