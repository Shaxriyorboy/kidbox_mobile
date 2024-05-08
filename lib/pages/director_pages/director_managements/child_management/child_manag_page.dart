import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/child_management/child_approved.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/child_management/child_invite.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/child_management/child_manag_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/child_management/child_standby.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/director_views_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/director_management_views.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

class DirChildManagePage extends StatefulWidget {
  const DirChildManagePage({Key? key}) : super(key: key);

  @override
  State<DirChildManagePage> createState() => _DirChildManagePageState();
}

class _DirChildManagePageState extends State<DirChildManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DirChildManageController>(
          init: DirChildManageController(),
          builder: (controller) {
            return Container(
              color: AppColors.mainBackgroundColor,
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 60.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// back button
                  Row(
                    children: [
                      /// back button
                      IconButton(
                        color: AppColors.mainColorBlack,
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      Text('child_manag'.tr,
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: AppColors.mainColorBlack,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(height: 34.h),

                  /// Tab Bar
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDEDED),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: TabBarCustom(),
                  ),
                  SizedBox(height: 30.h),
                  Expanded(
                      child: TabBarView(
                          controller:
                              Get.find<DirViewsController>().tabController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                        ChildApproved(),
                        ChildStandby(),
                        ChildInvite()
                      ])),
                ],
              ),
            );
          }),
    );
  }
}
