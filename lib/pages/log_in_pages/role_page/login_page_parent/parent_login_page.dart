import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/role_view.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/show_alert_dialog.dart';
import 'parent_login_controller.dart';

class ParentLogin extends StatelessWidget {
  const ParentLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ParentLoginController>(
      init: ParentLoginController(),
      builder: ((ctrl) => Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.mainColorOrange,
            body: Container(
              margin: EdgeInsets.only(top: 75.h, right: 15.w, left: 15.w),
              padding: EdgeInsets.only(
                  top: 56.h, right: 15.w, left: 15.w, bottom: 30.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: FadeInDown(
                from: 50,
                duration: const Duration(milliseconds: 250),
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        /// #FullName
                        textFiled(ctrl.fullNameController, ctrl.fullName),

                        /// #ChildName
                        textFiled(ctrl.childNameController, ctrl.childName),

                        /// #GenderDropdown
                        dropDownButton(ctrl.ganderList, ctrl, ctrl.gender,
                            ctrl.changeGenderDropdown),

                        /// #Date time
                        datePicker(context, ctrl),
                        SizedBox(
                          height: 25.h,
                        ),

                        /// #Button
                        elevatedButton(role: 1),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerTop,
            floatingActionButton:
                buildAvatarButton(context, ctrl.childAvatars, ctrl),
          )),
    );
  }
}
