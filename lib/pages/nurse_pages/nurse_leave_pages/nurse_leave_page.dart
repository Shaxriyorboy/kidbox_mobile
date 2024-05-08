import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/nurse_pages/change_kindergarten/change_kindergarten_page.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_leave_pages/nurse_leave_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/show_alert_dialog.dart';
import 'package:lottie/lottie.dart';

class NurseLeavePage extends StatefulWidget {
  const NurseLeavePage({Key? key}) : super(key: key);

  @override
  State<NurseLeavePage> createState() => _NurseLeavePageState();
}

class _NurseLeavePageState extends State<NurseLeavePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NurseLeaveController>(
        init: NurseLeaveController(),
        builder: (controller) {
          return Scaffold(
            body: Column(
              children: [
                ListTile(
                  contentPadding:
                      EdgeInsets.only(left: 15.w, right: 15.w, top: 55.h),
                  dense: true,
                  title: Text(
                    "name".tr + " : Farida",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.mainColorBlack),
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
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Lottie.asset(
                        "assets/lottie_animations/nurse_leaving.json"),
                  ),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                  child: Text("+Add",style: TextStyle(fontWeight: FontWeight.w600),),
                  color: AppColors.mainColorOrange,
                  onPressed: () {
                    showAlertDialog(context: context, title: "Change Kindergarten", body: "Do you wont to change kindergarten", confirm: ()=> Get.to(ChangeKindergartenPage()));
                  },
                ),
                SizedBox(height: 20.h,),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Click add to register the current center.",
                        style:
                            TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600,color: Colors.blue,),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "If your center is not using the kidbox_mobile yet, recommend to the director",
                        style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
