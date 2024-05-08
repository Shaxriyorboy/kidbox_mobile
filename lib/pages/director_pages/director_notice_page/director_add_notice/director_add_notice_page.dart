import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_notice_page/director_add_notice/director_add_notice_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'director_add_notice_view.dart';

class DirectorAddNoticePage extends StatelessWidget {
  const DirectorAddNoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DirectorAddNoticeController>(
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
                SizedBox(height: 20.h,),
                /// #Groups
                choseClass(ctrl,context),
              ],
            ),
          );
        }
    );
  }
}