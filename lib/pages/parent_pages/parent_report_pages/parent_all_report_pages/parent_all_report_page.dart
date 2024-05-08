import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_report_pages/parent_add_report_pages/parent_add_report_page.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_report_pages/parent_all_report_pages/parent_all_report_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/no_data.dart';

import 'parent_all_report_view.dart';

class ParentReportPage extends StatelessWidget {
  ParentReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBackgroundColor,
        body: GetBuilder<ParentReportController>(
          builder: (ctrl) {
            return (false)
                ? addItem(goToPage: ParentAddReportPage())
                : Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              color: const Color(0xFFF7F7F7),
              height: 1.sh,
              width: 1.sw,
              child: Column(
                children: [
                  SizedBox(
                    height: 55.h,
                  ),

                  /// Report back buttonText
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(

                        /// back to DirectorAccountPage
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_sharp,
                          size: 19.64.h,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "reports".tr,
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.mainColorBlack,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          Get.to(() => ParentAddReportPage(),
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 300));
                        },
                        child: Text("+Add Report"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),

                  /// Scroll UI
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomPanel(
                          controller: ctrl,
                          index: index,
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        )
    );

    // mana shu gagar bo'lmasa degan page



  }
}
