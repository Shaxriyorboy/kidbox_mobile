import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../services/constants/app_colors.dart';
import '../../../log_in_pages/log_in_page_controller.dart';
import '../../../log_in_pages/log_in_views.dart';
import '../director_management_views.dart';

class TeacherInvite extends StatelessWidget {
  const TeacherInvite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.h),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            /// Text
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  'lorem_ipsum'.tr,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                )),
            SizedBox(height: 65.h),

            /// Expansion
            ClipRRect(
              borderRadius: BorderRadius.circular(11.r),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.mainWhiteColor,
                  borderRadius: BorderRadius.circular(11.r),
                ),
                alignment: Alignment.center,
                child: ExpansionCustom(title: 'group'.tr),
              ),
            ),

            SizedBox(height: 20.h),

            TextFieldCustom(
                controller: Get.find<LogInController>(),
                color: AppColors.mainWhiteColor),
            SizedBox(height: 40.h),
            ElevatedButtonCustom(text: "send_invitation".tr, onPressed: () {})
          ],
        ),
      ),
    );
  }
}
