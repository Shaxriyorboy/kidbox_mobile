import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'main_page_controller.dart';

class MainPage extends StatelessWidget {
  final String? role;
  const MainPage({Key? key, this.role}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
        init: MainPageController(),
        builder: (ctrl) {
          return Scaffold(
            extendBody: true,
            backgroundColor: AppColors.mainBackgroundColor,
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: ctrl.pageController,
              children:
                (role == "Parents")? ctrl.parents :
                (role == "Nurse")? ctrl.nurse :
                ctrl.director,
            ),
            bottomNavigationBar: Container(
              margin: EdgeInsets.only(left: 55.w, right: 55.w, bottom: 30.h),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        spreadRadius: 0.01,
                        blurStyle: BlurStyle.normal,
                        offset: const Offset(0, 3),
                        blurRadius: 5.r),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [0, 1, 2, 3].map((e) => ctrl.button(e)).toList(),
              ),
            ),
          );
        });
  }
}
