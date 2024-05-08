

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/role_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/role_view.dart';

import 'choose_controller.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseController>(
      init: ChooseController(),
        builder: (ctrl) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xFFFFD770),
            body: WillPopScope(
              onWillPop: () async{
                /// jump again parent page
                Get.find<RoleController>().pageController.jumpToPage(0);
                return false;
              },
              child: Container(
                margin: EdgeInsets.only(top: 75.h, right: 15.w, left: 15.w),
                padding: EdgeInsets.only(top: 56.h,right: 15.w,left: 15.w,bottom: 30.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: FadeInDown(
                  from: 50,
                  duration: const Duration(milliseconds: 250),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        /// #ChooseCityOrTown
                        dropDownButton([], ctrl, ctrl.chooseCityOrTown, ctrl.changeChooseCityOrTown),

                        /// #ChooseDistrict
                        dropDownButton([], ctrl, ctrl.chooseDistrict, ctrl.changeChooseDistrict),

                        /// #NameOfKindergarten
                        dropDownButton([], ctrl, ctrl.nameOfKindergarten, ctrl.changeNameOfKindergarten),
                        SizedBox(height: 15.h,),

                        /// #Button
                        elevatedButton(mainRole: "Parents"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
