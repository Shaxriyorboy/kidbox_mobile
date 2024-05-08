import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';


class NameAndAvatar extends StatelessWidget {
  const NameAndAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.only(right: 15.w,left: 15.w, top: 55.h, bottom: 0),
      title: Text(
      "${"name".tr} : Farida",
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
    ),
      subtitle: Text("${"kindergarten".tr} : Delfinchiik",
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.colorTextLightGrey),),
      trailing: Container(
        height: 58.h,width: 58.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.mainColorOrange,width: 2.r),
          image: const DecorationImage(
            image: AssetImage("assets/images/image.png"),
          ),
        ),
      ),
    );
  }
}


