import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/director_management_views.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

class NurseChildManagePage extends StatefulWidget {

  const NurseChildManagePage({Key? key}) : super(key: key);

  @override
  State<NurseChildManagePage> createState() => _NurseChildManagePageState();
}

class _NurseChildManagePageState extends State<NurseChildManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 55.h),
        child: Column(

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
        ),
      ),
    );
  }
}
