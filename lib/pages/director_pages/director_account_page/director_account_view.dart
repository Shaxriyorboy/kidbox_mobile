import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_account_page/director_account_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/director_account_page/director_device_page/director_device_page.dart';
import 'package:kidbox_mobile/pages/director_pages/director_account_page/director_edit_page/director_edit_page.dart';
import 'package:kidbox_mobile/pages/director_pages/director_account_page/director_report_page/director_report_page.dart';
import 'package:kidbox_mobile/pages/director_pages/director_album_page/director_album_page.dart';
import 'package:kidbox_mobile/pages/director_pages/director_notice_page/director_notice_page.dart';
import 'package:kidbox_mobile/pages/language_page/change_language_page.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/show_alert_dialog.dart';

/// directorInfo ui
class DirectorInfo extends StatelessWidget {
  DirectorAccountController controller;
   DirectorInfo({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.h,
      color: AppColors.mainWhiteColor,
      padding: EdgeInsets.only(top: 55.h, left: 15.w, right: 15.w, bottom: 30.h),
      child: Row(
        children: [
          /// director image
          Hero(
            tag: "director",
            child: CircleAvatar(
              radius: 37.5.r,
              child: Image.asset(
                     "assets/images/user_avatar/user2.png",
                fit: BoxFit.fill,
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
                controller.name,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.mainColorBlack,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                controller.phoneNumber,
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
                 // Get.to(CustomPageRoute((const DirectorEditPage()),));
                 Navigator.push(context, CustomPageRoute(( DirectorEditPage()),));

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

/// KindergartenInfo ui
class KindergartenInfo extends StatelessWidget {
  DirectorAccountController controller;
   KindergartenInfo({
    Key? key,required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 166.h,
      width: 1.sw,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 83.h,
            width: 1.sw,
            decoration: BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: const Color(0xFFB3B3B3), width: 1.sp)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "center_name".tr,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
                Text(
                  controller.centerName,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 1.sw,
            height: 83.h,
            //padding: EdgeInsets.symmetric(vertical: 19.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "location".tr,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),

                Text(
                  controller.location,
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

/// DirectorFunction ui
class DirectorFunction extends StatelessWidget {

   const DirectorFunction({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        color: AppColors.mainWhiteColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// my notices
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Get.to(() =>  const DirectorNoticePage(),
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
                Get.to(() =>  const DirectorAlbumPage(),
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
                      "my_album".tr,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),

                    /// My Albums Icon
                    Image(
                      image: const AssetImage(
                        "assets/images/my_album_icon.png",
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
                        BorderSide(color: const Color(0xFFB3B3B3), width: 1.sp))),
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
                Get.to(() =>  DirectorReportPage(),
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
                      "report".tr,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),

                    /// report icon
                    Image(
                      image: const AssetImage(
                        "assets/images/report_icon.png",
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
                Get.to(() =>  const DirectorDevicePage(),
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
                    border: Border(
                        bottom:
                            BorderSide(color: const Color(0xFFB3B3B3), width: 1.sp))),
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
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap:(){
                showAlertDialog(
                    title: 'log_out'.tr, confirm: () {},
                    context: context, body: 'dou_you_log_out'.tr);
              },
              radius: 1000,
              splashColor: Colors.grey.shade200,
              child: Container(
                height: 62.h,
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                alignment: Alignment.center,
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
