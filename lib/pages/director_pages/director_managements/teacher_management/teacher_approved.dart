import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../services/constants/app_colors.dart';
import '../director_management_views.dart';

class TeacherApproved extends StatelessWidget {
  const TeacherApproved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Expansion - All classes
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.mainWhiteColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: ExpansionCustom(title: "view_all_classes".tr),
          ),
        ),
        SizedBox(height: 30.h),

        /// Children name list
        Expanded(
            child: Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          decoration: BoxDecoration(
            color: AppColors.mainWhiteColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: ListView.builder(
              itemCount: 20,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 20.h),
              itemBuilder: (ctx, index) {
                return CustomProfileTile(isChild: false);
              }),
        ))
      ],
    );
  }
}
