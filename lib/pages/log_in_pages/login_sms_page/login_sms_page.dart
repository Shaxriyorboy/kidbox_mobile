import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/role_page.dart';
import 'package:kidbox_mobile/pages/log_in_pages/login_sms_page/login_sms_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginSmsPage extends StatefulWidget {
  const LoginSmsPage({Key? key}) : super(key: key);

  @override
  _LoginSmsPageState createState() => _LoginSmsPageState();
}

class _LoginSmsPageState extends State<LoginSmsPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginSmsController>(
        init: LoginSmsController(),
        builder: (_controller) => Scaffold(
              body: Container(
                color: AppColors.mainColorOrange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    /// sms ui
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 80.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /// sms logo
                          Text(
                            "sms_code".tr,
                            style: TextStyle(
                                color: AppColors.mainColorBlack,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 60.h,
                          ),

                          /// sms definition
                          SizedBox(
                              width: 279.w,
                              child: Text(
                                "enter_sms_definition".tr,
                                style: TextStyle(
                                    color: AppColors.mainColorBlack,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "+998935701771",
                            style: TextStyle(
                                color: AppColors.mainColorBlack,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 29.h,
                          ),

                          /// input text field
                          SizedBox(
                            height: 60.h,
                            child: PinCodeTextField(
                              textStyle: TextStyle(fontSize: 25.sp),
                              keyboardType: TextInputType.number,
                              length: 4,
                              obscureText: false,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                fieldOuterPadding: EdgeInsets.zero,
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(12.r),
                                activeColor: AppColors.transparent,
                                errorBorderColor: AppColors.transparent,
                                inactiveColor: AppColors.colorGrey,
                                inactiveFillColor: AppColors.colorGrey,
                                fieldHeight: 60.h,
                                fieldWidth: 57.w,
                                activeFillColor: AppColors.colorGrey,
                              ),
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              enableActiveFill: true,
                              onCompleted: (v) {},
                              onChanged: (value) {},
                              appContext: context,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 30.h,
                    ),

                    /// resend sms code
                    FadeInDown(
                      from: 25,
                      duration: const Duration(milliseconds: 500),
                      child: Column(
                        children: [
                          // Error #Text
                          _controller.errorText != ''
                              ? AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 500),
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 8.h),
                                    child: Text(
                                      _controller.errorText,
                                      key: ValueKey(_controller.errorText),
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 16.sp),
                                    ),
                                  ))
                              : const SizedBox.shrink(),

                          _controller.currentSeconds == 0
                              ? RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "resend_code".tr,
                                          style: TextStyle(
                                              color:
                                                  AppColors.colorTextLightGrey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.sp),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              _controller.startTimeout();
                                            }),
                                    ],
                                  ),
                                )
                              : const SizedBox.shrink(),
                          SizedBox(
                            height: 10.h,
                          ),
                          _controller.timerText.toString() != "00 : 00"
                              ? Text(
                                  _controller.timerText.toString(),
                                  style: TextStyle(
                                      color: AppColors.colorTextLightGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 210.h,
                    ),

                    ///get started button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)), backgroundColor: AppColors.colorGrey,
                          elevation: 0,
                          fixedSize: Size(252.w, 50.h)),
                      onPressed: () {
                        Get.to(() => const RolePage());
                      },
                      child: Text(
                        "next".tr,
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.mainColorBlack,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    SizedBox(
                      height: 120.h,
                    )
                  ],
                ),
              ),
              resizeToAvoidBottomInset: false,
            ));
  }
}
