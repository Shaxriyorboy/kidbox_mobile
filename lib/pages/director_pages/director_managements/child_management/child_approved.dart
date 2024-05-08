import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/director_views_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/director_management_views.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'child_manag_controller.dart';

class ChildApproved extends StatelessWidget {

  ChildApproved({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// DropDown - All classes
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.mainWhiteColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: ExpansionCustom(title: 'View all classes'),
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
                return  CustomProfileTile(isChild: true);
              }),
        ))
      ],
    );
  }
}
