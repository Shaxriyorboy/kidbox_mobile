import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_account_page/director_report_page/director_report_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:lottie/lottie.dart';

import 'director_report_view.dart';

class DirectorReportPage extends StatelessWidget {
  DirectorReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DirectorReportController>(
        init: DirectorReportController(),
        builder: (_controller) => Scaffold(

              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                color: const Color(0xFFF7F7F7),
                height: 1.sh,
                width: 1.sw,
                child: Column(
                  children: [
                    SizedBox(
                      height: 65.h,
                    ),
                    /// Report back buttonText
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_back_ios_sharp,
                            size: 19.64.h,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10.w,),
                          Text(
                            "reports".tr,
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: AppColors.mainColorBlack,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      /// back to DirectorAccountPage
                      onTap: () {
                        Get.back();
                      },
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    /// Scroll UI
                    if(_controller.selectItem.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomPanel(controller: _controller, index: index,);
                        },
                      ),
                    )
                    else Column(
                      children: [
                        Center(
                          child: Lottie.asset("assets/lottie_animations/album_null_page.json"),
                        ),
                        SizedBox(height: 50.h,),
                        Text("Report not found",style: TextStyle(fontSize: 16.sp),)
                      ],
                    ),
                  ],
                ),
              )

            ));
  }
}
