import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/role_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/role_view.dart';

/// #ShowAlertDialog
void showAlertDialog(
    {required BuildContext context,
    required String title,
    required String body,
    required Function() confirm}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        actionsPadding: EdgeInsets.zero,
        backgroundColor: Colors.white,
        buttonPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
        content: Container(
          constraints: BoxConstraints(minWidth: 100.w, maxHeight: 250.h),
          child: SingleChildScrollView(
            //padding: EdgeInsets.only(top: 40.h),
            physics: const BouncingScrollPhysics(),
            child: Text(
              body,
              style: TextStyle(fontSize: 18.sp),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        actions: [
          Column(
            children: [
              Container(
                height: 60.h,
                margin: EdgeInsets.only(top: 1.h),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.grey, width: 0.5.h))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "cancel".tr,
                        style: TextStyle(fontSize: 19.sp, color: Colors.red),
                      ),
                    ),
                    SizedBox(
                        height: 65.h,
                        child: const VerticalDivider(
                          color: Colors.grey,
                          thickness: 0.5,
                          width: 1,
                          indent: 0,
                        )),
                    TextButton(
                      onPressed: confirm,
                      child: Text(
                        "confirm".tr,
                        style: TextStyle(fontSize: 19.sp, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      );
    },
  );
}

/// #BuildAvatarButton
Widget buildAvatarButton(
    BuildContext context, List listAvatars, var controller) {
  return ElevatedButton(
    onPressed: () => showMaterialDialog(
      context,
      listAvatars,
      controller,
    ),
    child: Image.asset(
      (controller.avatar.isEmpty)
          ? "assets/images/add_user.png"
          : controller.avatar,
    ),
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.all(controller.avatar.isEmpty ? 20.w : 5.w), backgroundColor: Colors.white,
      shape: const CircleBorder(),
      fixedSize: Size(80.w, 80.w),
    ),
  );
}
