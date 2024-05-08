import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/role_view.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/show_alert_dialog.dart';
import 'nurse_login_controller.dart';

class LoginNursePage extends StatelessWidget {
  const LoginNursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<LoginNurseController>(
      init: LoginNurseController(),
        builder: (ctrl) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.mainColorOrange,
        body: Container(
          margin: EdgeInsets.only(top: 75.h, right: 15.w, left: 15.w,),
          padding: EdgeInsets.only(top: 56.h, right: 15.w, left: 15.w, bottom: 30.h,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.white,
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
                    textFiled(ctrl.textController, ctrl.fullName),

                    /// #Choose city or town
                    dropDownButton(
                        [], ctrl, ctrl.chooseCityOrTown, ctrl.changeCityOrTown),

                    /// #Choose district
                    dropDownButton(
                        [], ctrl, ctrl.chooseDistrict, ctrl.changeDistrict),

                    /// #Name of kindergarten
                    dropDownButton([], ctrl, ctrl.nameOfKindergarten,
                        ctrl.changeNameOfKindergarten),
                    SizedBox(
                      height: 15.h,
                    ),

                    /// #Button
                    elevatedButton(mainRole: "Nurse"),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        floatingActionButton: buildAvatarButton(context, ctrl.userAvatars, ctrl),
      );
    });
  }
}
