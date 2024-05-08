import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/log_in_pages/log_in_page_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/services/log_service.dart';

import 'login_sms_page/login_sms_page.dart';

/// Button - Get started
class ElevatedButtonCustom extends StatelessWidget {
  String text;
  final Function() onPressed;

  ElevatedButtonCustom({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(252.w, 50.h), backgroundColor: AppColors.mainColorOrange,
          padding: EdgeInsets.symmetric(vertical: 15.h),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          )),
      onPressed: onPressed,
      child: Text(
        text.tr,
        style: TextStyle(
            color: AppColors.mainColorBlack,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp),
      ),
    );
  }
}

/// TextFormField

class TextFieldCustom extends StatelessWidget {
  LogInController controller;
  Color color;

  TextFieldCustom({required this.controller, required this.color, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(11.r),
        ),
        child: TextField(
          onChanged: (text) {
            if (text.length == 11) {
              FocusScope.of(context).unfocus();
              controller.phoneNumber += text;
              controller.lengthNumber = 11;
              controller.phoneNumber =
                  controller.phoneNumber.replaceAll(' ', "");
              controller.update();
            }
          },
          controller: controller.textEditingController,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: SizedBox(
                width: 116.w,
                child: Row(
                  children: [
                    /// Flag
                    Image.asset(
                      'assets/images/im_flag_uzb.png',
                      width: 32.w,
                      height: 32.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),

                    /// Prefix Number
                    Text(
                      '+998',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.mainColorBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 14.w,
                    ),

                    /// Divider
                    VerticalDivider(
                      color: const Color(0xFFC4C4C4),
                      indent: 15.h,
                      endIndent: 15.h,
                      thickness: 0.5,
                    )
                  ],
                ),
              )),
          inputFormatters: [
            controller.numberMaskFormat,
          ],
          cursorColor: AppColors.colorTextLightGrey,
          keyboardType: TextInputType.phone,
          maxLines: 1,
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(
              color: AppColors.mainColorBlack, fontWeight: FontWeight.w500),
        ));
  }
}
