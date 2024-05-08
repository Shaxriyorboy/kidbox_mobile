import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'language_controller.dart';
class NextLanguagePage extends StatelessWidget {
  const NextLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
        init: LanguageController(),
        builder: (_controller) {
          return Scaffold(
              body: Container(

                color: const Color(0xFFF7F7F7),

                height: 1.sh,
                width: 1.sw,
                child: Column(
                  children: [
                    SizedBox(
                      height: 72.h,
                    ),
                    /// Report back buttonText
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 16.w,),
                          Icon(
                            Icons.arrow_back_ios_sharp,
                            size: 19.64.h,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10.w,),
                          Text(
                            "languages".tr,
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: AppColors.mainColorBlack,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      /// back to after previous
                      onTap: () {
                        Get.back();
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.mainWhiteColor,
                          borderRadius: BorderRadius.circular(15.r)

                      ),


                      child: Column(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                               Get.back();

                              },
                              radius: 1000,
                              splashColor: Colors.grey.shade200,
                              child: Container(
                                height: 62.h,
                                margin: EdgeInsets.symmetric(horizontal: 15.w),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                        bottom:
                                        BorderSide(color: const Color(0xFFB3B3B3), width: 1.sp))),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20.r,
                                      backgroundImage: const AssetImage("assets/images/im_flag_uzb.png"),
                                    ),
                                    SizedBox(width: 16.w,),
                                    Text(
                                      "uzbek".tr,
                                      style: TextStyle(
                                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                              Get.back();

                              },
                              radius: 1000,
                              splashColor: Colors.grey.shade200,
                              child: Container(
                                height: 62.h,
                                margin: EdgeInsets.symmetric(horizontal: 15.w),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                        bottom:
                                        BorderSide(color: const Color(0xFFB3B3B3), width: 1.sp))),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20.r,
                                      backgroundImage: const AssetImage("assets/images/im_flag_russia.png"),
                                    ),
                                    SizedBox(width: 16.w,),
                                    Text(
                                      "russia".tr,
                                      style: TextStyle(
                                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Get.back();

                              },
                              radius: 1000,
                              splashColor: Colors.grey.shade200,
                              child: Container(
                                height: 62.h,
                                margin: EdgeInsets.symmetric(horizontal: 15.w),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20.r,
                                      backgroundImage: const AssetImage("assets/images/im_flag_england.png"),
                                    ),
                                    SizedBox(width: 16.w,),
                                    Text(
                                      "england".tr,
                                      style: TextStyle(
                                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),



                  ],
                ),
              )
          );
        });
  }
}
