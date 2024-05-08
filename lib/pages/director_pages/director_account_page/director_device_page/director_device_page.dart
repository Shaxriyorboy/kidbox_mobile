import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

import 'director_device_controller.dart';
import 'director_device_view.dart';
class DirectorDevicePage extends StatelessWidget {
  const DirectorDevicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return GetBuilder<DirectorDeviceController>(
        init: DirectorDeviceController(),
        builder: (ctrl) {
          return Scaffold(
            backgroundColor: AppColors.mainBackgroundColor,
            body: Container(
              padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 46.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("current_session".tr,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500,color: AppColors.mainColorBlack),),
                  SizedBox(height: 10.h,),

                  /// Current session
                  DiredtorCurrentSession(controller: ctrl),
                  SizedBox(height: 30.h,),
                  Text("active_session".tr,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500,color: AppColors.mainColorBlack),),
                  SizedBox(height: 10.h,),

                  /// Active session
                  const Expanded(
                    child: DiredtorActiveSession(),
                  ),
                  SizedBox(height: 10.h,)
                ],
              ),
            ),
          );
        });

  }
}
