import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'nurse_add_notice_controller.dart';
import 'nurse_add_notice_view.dart';

class NurseAddNoticePage extends StatefulWidget {
  const NurseAddNoticePage({Key? key}) : super(key: key);

  @override
  State<NurseAddNoticePage> createState() => _NurseAddNoticePageState();
}

class _NurseAddNoticePageState extends State<NurseAddNoticePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NurseAddNoticeController>(
        builder: (ctrl) {
          return Scaffold(
            backgroundColor: AppColors.mainBackgroundColor,
            body: ListView(
              padding: EdgeInsets.only(top: 45.h,right: 15.w,left: 15.w),
              physics: const BouncingScrollPhysics(),
              children: [
                /// #AppBar
                appBarNotice(),
                /// #Add Notice
                createNotice(ctrl,context),
                /// #Body
                Text("body".tr,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                textFiled(ctrl.bodyController,ctrl.body),
                /// #Title
                Text("title".tr,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                textFiled(ctrl.titleController, ctrl.title),
              ],
            ),
          );
        }
    );
  }
}