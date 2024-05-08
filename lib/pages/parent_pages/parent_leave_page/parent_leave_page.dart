import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_leave_page/parent_leave_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:lottie/lottie.dart';

class ParentLeavePage extends StatelessWidget {
  const ParentLeavePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ParentLeaveController>(
        init: ParentLeaveController(),
        builder: (controller) {
          return Scaffold(
            body: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.only(left: 15.w, right: 15.w,top: 55.h),
                  dense: true,
                  title: Text(
                    "name".tr + " : Farida",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainColorBlack),
                  ),
                  trailing: Container(
                    height: 58.w,
                    width: 58.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColors.mainColorOrange, width: 2.r),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/image.png"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(20.r),
                    child: Center(
                      child: Lottie.asset(
                          "assets/lottie_animations/child_leave.json"),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text("Your child left the kidergarten.",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),),
                ),
              ],
            ),
          );
        });
  }
}
