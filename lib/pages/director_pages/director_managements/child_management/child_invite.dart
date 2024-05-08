import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/child_management/child_manag_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/director_views_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/director_management_views.dart';
import 'package:kidbox_mobile/pages/log_in_pages/log_in_page_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/log_in_views.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';


class ChildInvite extends StatelessWidget {

  ChildInvite({ Key? key}) : super(key: key);

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

            /// Dropdown
            ClipRRect(
              borderRadius: BorderRadius.circular(11.r),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.mainWhiteColor,
                  borderRadius: BorderRadius.circular(11.r),
                ),
                alignment: Alignment.center,
                child: ExpansionCustom(title: 'Group'),
              ),
            ),

            SizedBox(height: 20.h),

            TextFieldCustom(
                controller: Get.find<LogInController>(),
                color: AppColors.mainWhiteColor),
            SizedBox(height: 40.h),
            ElevatedButtonCustom(text: "Send invitation", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
