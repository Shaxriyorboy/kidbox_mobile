import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/show_alert_dialog.dart';
import 'nurse_account_controller.dart';
import 'nurse_account_view.dart';

class NurseAccountPage extends StatefulWidget {
  const NurseAccountPage({Key? key}) : super(key: key);

  @override
  State<NurseAccountPage> createState() => _NurseAccountPageState();
}

class _NurseAccountPageState extends State<NurseAccountPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NurseAccountController>(
        init: NurseAccountController(),
        builder: (ctrl) {
          return FadeInUp(
            duration: const Duration(milliseconds: 300),
            child: Scaffold(
              backgroundColor: AppColors.mainBackgroundColor,
              body: Column(
                children: [
                  /// nurse info
                  const NurseInfo(),

                  Expanded(child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        /// group info
                        const GroupInfo(),
                        SizedBox(
                          height: 30.h,
                        ),
                        /// nurse functions
                        NurseFunction(controller: ctrl),
                        SizedBox(height: 30.h,),
                        MaterialButton(onPressed: (){
                          showAlertDialog(context: context, title: "delete_account".tr, body: "dou_you_delete_account".tr, confirm: (){});
                        },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r)
                          ),
                          height: 64.h,
                          color: AppColors.mainWhiteColor,
                          child: Row(
                            children: [
                              Text(
                                "delete_account".tr,
                                style: TextStyle(
                                    fontSize: 18.sp, fontWeight: FontWeight.w600,color: Colors.red),
                              ),
                              const Spacer(),
                              Image(
                                image: const AssetImage("assets/images/delete_account_icon.png"),
                                width: 26.w,
                                height: 26.h,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 132.h,)
                      ],
                    ),
                  )),

                ],
              ),
            ),
          );
        });
  }
}
