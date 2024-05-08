import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/log_in_pages/log_in_page_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/is_loading.dart';
import 'log_in_views.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogInController>(
        init: LogInController(),
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Container(
                  color: AppColors.mainColorOrange,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// kidbox_mobile Text
                      Text(
                        "kidbox_mobile",
                        style: TextStyle(
                            color: AppColors.mainColorBlack,
                            fontWeight: FontWeight.w700,
                            fontSize: 40.sp),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),

                      /// White Container
                      Container(
                        width: 354.w,
                        margin: EdgeInsets.symmetric(horizontal: 30.w),
                        padding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 8.w),
                        // Decoration of Container
                        decoration: BoxDecoration(
                            color: AppColors.mainWhiteColor,
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /// Text - LogIn
                            Text(
                              'log_in'.tr,
                              style: TextStyle(
                                  fontSize: 30.sp,
                                  color: AppColors.mainColorBlack,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 20.h),

                            /// Text - Mobile number
                            Container(
                                width: 354.w,
                                alignment: Alignment.centerLeft,
                                padding:
                                    EdgeInsets.only(left: 12.w, bottom: 5.w),
                                child: Text("mobile_num".tr,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppColors.colorTextLightGrey),
                                    textAlign: TextAlign.start)),

                            /// TextFormField
                            TextFieldCustom(
                                controller: controller,
                                color: AppColors.colorGrey),

                            SizedBox(height: 30.h),

                            /// Button - Get started
                            ElevatedButtonCustom(
                                text: "get_started".tr,
                                onPressed: () {
                                  controller.apiSmsCode();
                                },),
                            SizedBox(height: 8.h)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Visibility(
                    visible: controller.isLoading,
                    child: IsLoadingPage(
                      backgroundColor: Colors.black.withOpacity(0.6),
                    ))
              ],
            ),
          );
        });
  }
}
