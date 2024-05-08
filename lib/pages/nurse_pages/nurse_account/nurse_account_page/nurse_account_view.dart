import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/language_page/change_language_page.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_account/nurse_device_page/nurse_device_page.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_account/nurse_edit_page/nurse_edit_page.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_leave_pages/nurse_leave_page.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_notice_page/nurse_notice_page.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/show_alert_dialog.dart';

import 'nurse_account_controller.dart';

/// NurseInfo ui
class NurseInfo extends StatelessWidget {
  const NurseInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.h,
      color: AppColors.mainWhiteColor,
      padding: EdgeInsets.only(top: 55.h, left: 15.w, right: 15.w, bottom: 30.h),
      child: Row(
        children: [
          /// nurse image
          Hero(
            tag: "nurse",
            child: GestureDetector(
              onTap: (){

              },
              child: CircleAvatar(
                radius: 37.5.r,
                child: Image.asset(
                      "assets/images/user_avatar/user2.png",

                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),

          /// name and phone number
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Saydullayev Ergash",
                style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.mainColorBlack,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                "+998 (99) 123-45-67",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.mainColorBlack,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          const Spacer(),

          /// edit icon
          Container(
            width: 32.w,
            height: 32.w,
            decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(64.h)),
            child: Material(
              color: Colors.transparent,
              /// pass to Edit page
              child: InkWell(
                onTap: () {

                  Navigator.push(context, CustomPageRoute((const NurseEditPage())));

                },
                radius: 1000,
                borderRadius: BorderRadius.circular(64.h),
                enableFeedback: true,
                overlayColor: MaterialStateProperty.all(Colors.grey),
                splashColor: Colors.grey,
                child: Image(
                  image: const AssetImage("assets/images/edit_icon.png"),
                  width: 32.w,
                  height: 32.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// GroupInfo ui
class GroupInfo extends StatelessWidget {
  const GroupInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        children: [
          /// Center Name
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 19.h),
            decoration: BoxDecoration(
              border: Border(
                  bottom:
                  BorderSide(color: const Color(0xFFB3B3B3), width: 1.sp)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "center_name".tr,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  "Garden",
                  style:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 19.h),
            decoration: BoxDecoration(
              border: Border(
                  bottom:
                  BorderSide(color: const Color(0xFFB3B3B3), width: 1.sp)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "group_name".tr,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  "\"Cinco\"",
                  style:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 19.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "location".tr,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  "Toshkent, Yunusobod, A.Temur, 60A",
                  style:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// NurseFunction ui
class NurseFunction extends StatelessWidget {
  NurseAccountController controller;
  NurseFunction({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        color: AppColors.mainWhiteColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Get.to(() =>  const NurseNoticePage(),
                    transition:
                    Transition.rightToLeftWithFade,
                    duration:
                    const Duration(milliseconds: 300));
                },
              radius: 1000,
              splashColor: Colors.grey.shade200,
              child: Container(
                height: 62.h,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                        bottom:
                        BorderSide(color: const Color(0xFFB3B3B3), width: 1.sp))),
                child: Row(
                  children: [
                    Text(
                      "my_notices".tr,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),

                    /// My Notices Icon
                    Image(
                      image: const AssetImage(
                        "assets/images/my_notice_icon.png",
                      ),
                      width: 26.w,
                      height: 26.h,
                      color: AppColors.mainColorBlack,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Get.to(() =>  const NextLanguagePage(),
                    transition:
                    Transition.rightToLeftWithFade,
                    duration:
                    const Duration(milliseconds: 300));

              },
              radius: 1000,
              splashColor: Colors.grey.shade200,
              child: Container(
                height: 62.h,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                        bottom:
                        BorderSide(color: const Color(0xFFB3B3B3), width: 1.sp))
                ),
                child: Row(
                  children: [
                    Text(
                      "language".tr,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),

                    /// Language
                    Image(
                      image: const AssetImage(
                        "assets/images/language_icon.png",
                      ),
                      width: 26.w,
                      height: 26.h,
                      color: AppColors.mainColorBlack,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Get.to(() =>const NurseDevicePage(),
                    transition:
                    Transition.rightToLeftWithFade,
                    duration:
                    const Duration(milliseconds: 300));

              },
              radius: 1000,
              splashColor: Colors.grey.shade200,
              child: Container(
                height: 62.h,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                        bottom:
                        BorderSide(color: const Color(0xFFB3B3B3), width: 1.sp))
                ),
                child: Row(
                  children: [
                    Text(
                      "devices".tr,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Image(
                      image: const AssetImage("assets/images/devices_icon.png"),
                      width: 26.w,
                      height: 26.h,
                      color: AppColors.mainColorBlack,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ///Log Out button
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
               showAlertDialog(context: context, title:"log_out", body: "dou_you_log_out", confirm: ()=>Get.to(NurseLeavePage()));
              },
              radius: 1000,
              splashColor: Colors.grey.shade200,
              child: Container(
                height: 62.h,alignment: Alignment.center,
                padding: EdgeInsets.only(
                     left: 15.w, right: 15.w,),
                child: Row(
                  children: [
                    Text(
                      "log_out".tr,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Image(
                      image: const AssetImage("assets/images/log_out_icon.png"),
                      width: 26.w,
                      height: 26.h,
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

/// Custom Hero animation
class CustomPageRoute<T> extends PageRoute<T> {
  final Widget child;

  CustomPageRoute(this.child);

  @override
  Color get barrierColor => Colors.grey;

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation,) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
