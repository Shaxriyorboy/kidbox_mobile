import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/role_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/role_view.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_account_all_pages/parent_account_edit_page/parent_account_edit_page_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/show_alert_dialog.dart';

/// directorImage ui
class ParentEditImage extends StatelessWidget {
  ParentEditController ctrl;
  ParentEditImage({Key? key,required this.ctrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.h,
      color: AppColors.mainWhiteColor,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 4.h, bottom: 22.h),
      child: Hero(
        tag: "Parent",
        child: GestureDetector(
          onTap: (){
            showMaterialDialog(context, ctrl.childAvatars, Get.find<RoleController>(),);
          },
          child: Container(
            height: 109.h,
            width: 109.h,
            decoration: BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.circular(109.h),
              //image:
            ),
            child: Image.asset(
              (ctrl.avatarPicture.isEmpty)
                  ? "assets/images/child_avatar1.png"
                  :ctrl.avatarPicture,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

/// Parent info ui
class ParentEditInfo extends StatelessWidget {
  const ParentEditInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 157.h,
      width: 1.sw,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        children: [
          Container(
            height: 83.h,
            width: 1.sw,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: const Color(0xFFB3B3B3), width: 1.sp))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "name".tr,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 6.h,
                ),

                /// text fil qushaman
                TextField(
                  scrollPadding: EdgeInsets.zero,
                  textInputAction: TextInputAction.next,
                  style:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  decoration: const InputDecoration(
                    filled: true,

                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 1.sw,
            height: 74.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "phone_number".tr,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 6.h,
                ),
                /// input phone number place
                TextField(
                  scrollPadding: EdgeInsets.zero,
                  textInputAction: TextInputAction.next,
                  style:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  decoration: const InputDecoration(
                    filled: true,

                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// KindergartenInfo ui
class KindergartenEditInfo extends StatelessWidget {
  const KindergartenEditInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 247.h,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.circular(15.r)),
      child: Column(
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
                  "Child name",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 6.h,
                ),
                /// input center name place
                TextField(
                  scrollPadding: EdgeInsets.zero,
                  textInputAction: TextInputAction.next,
                  style:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  decoration: const InputDecoration(
                    filled: true,

                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 1.sw,
            height: 81.h,
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
                  "Birth Day".tr,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 6.h,
                ),
                /// input location name place
                TextField(
                  scrollPadding: EdgeInsets.zero,
                  textInputAction: TextInputAction.next,
                  style:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  decoration: const InputDecoration(
                    filled: true,

                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 1.sw,
            height: 83.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Gender",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 6.h,
                ),
                /// input kindergarten phone number  place
                TextField(
                  scrollPadding: EdgeInsets.zero,
                  textInputAction: TextInputAction.next,
                  style:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  decoration: const InputDecoration(
                    filled: true,

                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
