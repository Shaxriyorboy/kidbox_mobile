import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/no_data.dart';
import 'nurse_add_notice/nurse_add_notice_page.dart';
import 'nurse_notice_controller.dart';
import 'nurse_notice_view.dart';

class NurseNoticePage extends StatefulWidget {
  const NurseNoticePage({Key? key}) : super(key: key);

  @override
  State<NurseNoticePage> createState() => _NurseNoticePageState();
}

class _NurseNoticePageState extends State<NurseNoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: GetBuilder<NurseNoticeController>(
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
                  /// #Button
                  TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () => Get.to(const NurseAddNoticePage()),
                    child: Text("add_notice".tr, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  /// #Not Found
                  (!true)? addItem(goToPage: const NurseAddNoticePage()):
                  /// #ListTile
                  buildListTile(),
                ],
              ),
            );
          }),
    );
  }
}