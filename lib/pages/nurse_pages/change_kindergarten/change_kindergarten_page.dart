import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/role_view.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/show_alert_dialog.dart';

import 'change_kindergarten_controller.dart';

class ChangeKindergartenPage extends StatelessWidget {
  const ChangeKindergartenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeKindergartenController>(
        init: ChangeKindergartenController(),
        builder: (ctrl) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.mainBackgroundColor,
            body: Column(
              children: [
                ListTile(
                  dense: true,
                  contentPadding:
                      EdgeInsets.only(top: 55.h, left: 15.w, right: 15.w),
                  title: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_sharp,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Change Kindergarten",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20.sp),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 19.h,
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.h, right: 15.w, left: 15.w),
                  padding: EdgeInsets.only(
                      top: 30.h, right: 15.w, left: 15.w, bottom: 30.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: FadeInDown(
                    from: 50,
                    duration: const Duration(milliseconds: 250),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),

                        /// #ChooseCityOrTown
                        dropDownButton(["One", "Two", "Three"], ctrl,
                            ctrl.chooseCityOrTown, ctrl.changeChooseCityOrTown),

                        /// #ChooseDistrict
                        dropDownButton(["One", "Two", "Three"], ctrl,
                            ctrl.chooseDistrict, ctrl.changeChooseDistrict),

                        /// #NameOfKindergarten
                        dropDownButton(
                            ["One", "Two", "Three"],
                            ctrl,
                            ctrl.nameOfKindergarten,
                            ctrl.changeNameOfKindergarten),
                        SizedBox(
                          height: 15.h,
                        ),

                        /// #Button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0, backgroundColor: AppColors.mainColorOrange,
                              fixedSize: Size(200.w, 50.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              )),
                          onPressed: () {
                            showAlertDialog(
                                context: context,
                                title: "Change Kindergarten",
                                body:
                                    "Do you really want to change your kindergarten?",
                                confirm: () {});
                          },
                          child: Text(
                            "Change",
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
