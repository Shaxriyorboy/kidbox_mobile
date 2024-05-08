
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'parent_notice_controller.dart';
import 'parent_notice_view.dart';
import 'parent_notice_view.dart';

class ParentNoticePage extends StatefulWidget {
  const ParentNoticePage({Key? key}) : super(key: key);

  @override
  State<ParentNoticePage> createState() => _ParentNoticePageState();
}

class _ParentNoticePageState extends State<ParentNoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: GetBuilder<ParentNoticeController>(
        init: ParentNoticeController(),
          builder: (ctrl) {
            return Container(
              padding: EdgeInsets.only(left: 15.w, right: 15.w,top: 55.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  /// #AppBar
                  ListTile(
                    dense: true,
                    contentPadding:  EdgeInsets.zero,
                    title: const Text(""),
                    subtitle:const Text(""),
                    leading: Text("notice".tr, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
                    ),
                    trailing: Container(
                      height: 58.w,
                      width: 58.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: AppColors.mainColorOrange, width: 2.r),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/image.png"),
                        ),
                      ),
                    ),
                  ),
                  /// #ListView
                  buildListview(),
                ],
              ),
            );
          }),
    );
  }
}