import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

class DirectorDeviceController extends GetxController {
  Future<void> showSessionDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.symmetric(horizontal: 10.w),
          title:  Text("end_other_session".tr,textAlign: TextAlign.center,style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w600,color: AppColors.mainColorBlack,),),
          alignment:Alignment.center ,
          actionsAlignment: MainAxisAlignment.spaceAround,
          content: Text("Do you want end other session?",textAlign: TextAlign.center,),
          actions: <Widget>[
            TextButton(onPressed: () {
              Get.back();
            }, child: Text("cancel".tr,style: TextStyle(color: Colors.black,fontSize: 22.sp,fontWeight: FontWeight.w500),),),

            TextButton(onPressed: () {}, child: Text("ok".tr,style: TextStyle(color: Colors.black,fontSize: 22.sp,fontWeight: FontWeight.w500),),),

          ],
        );
      },
    );
  }
}
