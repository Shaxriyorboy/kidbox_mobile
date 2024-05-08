import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/role_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/role_view.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

import 'nurse_edit_controller.dart';

/// NurseImage ui
class NurseEditImage extends StatelessWidget {
  NurseEditController ctrl;
  NurseEditImage({Key? key,required this.ctrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.h,
      color: AppColors.mainWhiteColor,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(top: 4.h, bottom: 20.h),
      child: Hero(
        tag: "nurse",
        child: GestureDetector(
          onTap: (){
            showMaterialDialog(context, ctrl.childAvatars,Get.find<RoleController>());
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
                  ? "assets/images/user_avatar/user2.png"
                  :ctrl.avatarPicture,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

/// nurse info ui
class NurseEditInfo extends StatelessWidget {
  NurseEditController controller;
   NurseEditInfo({
    Key? key,required this.controller
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
                  controller: controller.nameController,
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
                  controller: controller.phoneController,
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


