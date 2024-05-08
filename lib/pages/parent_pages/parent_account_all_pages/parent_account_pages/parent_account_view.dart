import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/language_page/change_language_page.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_account_all_pages/parent_account_edit_page/parent_account_edit_page.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_account_all_pages/parent_account_pages/parent_account_controller.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_account_all_pages/parent_device_info_pages/parent_device_page.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_leave_page/parent_leave_page.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_report_pages/parent_all_report_pages/parent_all_report_page.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/show_alert_dialog.dart';

/// directorInfo ui
class ParentInfo extends StatelessWidget {
  const ParentInfo({Key? key}) : super(key: key);

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
            tag: "Parent",
            child: CircleAvatar(
              radius: 37.5.r,
              child: Image.asset("assets/images/child_avatar1.png",fit: BoxFit.cover,),
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
                  Navigator.push(context, CustomPageRoute((const ParentEditPage())));

                },
                radius: 1000,
                borderRadius: BorderRadius.circular(64.h),
                enableFeedback: true,
                //customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80),
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
  const KindergartenInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        children: [
          infoItem(context,"Child name","Sadullayev Ergash"),
          infoItem(context,"Date of birth","12/06/2018"),
          infoItem(context,"Gender","Male"),
          infoItem(context,"center_name".tr,"\"Cinco\""),
          infoItem(context,"Group Name","Minion"),
          infoItem(context,"Nurse name","Kamila Ergasheva"),
          infoItem(context,"Nurse number","+998 (99) 321-54-76"),
        ],
      ),
    );
  }

  Container infoItem(BuildContext context,String title,String info) {
    return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 19.h),
          decoration: BoxDecoration(
            border: title != "Nurse number"? Border(
                bottom:
                BorderSide(color: const Color(0xFFB3B3B3), width: 1.sp)):null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                info,
                style:
                TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        );
  }
}

/// DirectorFunction ui
class ParentFunction extends StatelessWidget {
  ParentAccountController controller;
  ParentFunction({Key? key,required this.controller}) : super(key: key);

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
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Get.to(() =>  ParentReportPage(),
                    transition:
                    Transition.rightToLeftWithFade,
                    duration:
                    const Duration(milliseconds: 300));

              },
              radius: 1000,
              splashColor: Colors.grey.shade200,
              child: Container(
                padding: EdgeInsets.only(
                    top: 24.h, bottom: 16.h, left: 15.w, right: 15.w),
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
                Get.to(() =>  const ParentDevicePage(),
                    transition:
                    Transition.rightToLeftWithFade,
                    duration:
                    const Duration(milliseconds: 300));

              },
              radius: 1000,
              splashColor: Colors.grey.shade200,
              child: Container(
                padding: EdgeInsets.only(
                    top: 16.h, bottom: 16.h, left: 15.w, right: 15.w),
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
              onTap: () {
                showAlertDialog(context: context, title: "log_out", body: "Do you want to log out?", confirm: ()=> Get.to(ParentLeavePage()));
                // controller.showLogOutDialog(context,"log_out","Do you want to log out");
              },
              radius: 1000,
              splashColor: Colors.grey.shade200,
              child: Container(
                padding: EdgeInsets.only(
                    top: 16.h, bottom: 24.h, left: 15.w, right: 15.w),
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