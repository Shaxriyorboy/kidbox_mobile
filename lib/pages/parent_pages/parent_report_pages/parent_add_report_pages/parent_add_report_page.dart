import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_report_pages/parent_add_report_pages/parent_add_report_controller.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_report_pages/parent_add_report_pages/parent_add_report_views.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

class ParentAddReportPage extends StatefulWidget {
  const ParentAddReportPage({Key? key}) : super(key: key);

  @override
  State<ParentAddReportPage> createState() => _ParentAddReportPageState();
}

class _ParentAddReportPageState extends State<ParentAddReportPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ParentAddReportController>(
      init: ParentAddReportController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.mainBackgroundColor,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "reports".tr,
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.mainColorBlack,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      height: 64.w,
                      width: 64.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.r),
                        image: DecorationImage(
                            image: AssetImage("assets/images/child_avatar1.png")),
                      ),
                    ),
                    title: Text(
                      "Hojiboyeva T.B",
                      style:
                          TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      "Banana group",
                      style:
                          TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text("Adding image"),

                  /// #Add Notice
                  createAlbum(controller, context),

                  Text("Content"),
                  SizedBox(
                    height: 8.h,
                  ),

                  ///Add Content
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Colors.white,
                    ),
                    child: TextField(
                      style:
                          TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                      maxLines: 8,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10.h),
                          border: InputBorder.none,
                          hintText: "Write down your report here...",
                          hintStyle: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500)),
                    ),
                  ),

                  SizedBox(
                    height: 30.h,
                  ),

                  /// Send Button
                  MaterialButton(
                    height: 44.h,
                    minWidth: 120.w,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                    onPressed: () {},
                    child: Text(
                      "Send",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
