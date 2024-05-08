import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/role_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/role_view.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'director_add_group_controller.dart';

class DirectorAddGroupPage extends StatelessWidget {
  const DirectorAddGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainColorOrange,
      body: GetBuilder<DirectorAddGroupController>(
          init: DirectorAddGroupController(),
          builder: (ctrl) {
            return WillPopScope(
              onWillPop: () async{
                /// jump again parent page
                Get.find<RoleController>().pageController.jumpToPage(3);
                return false;
              },
              child: Container(
                margin: EdgeInsets.only(top: 75.h, right: 15.w, left: 15.w),
                padding: EdgeInsets.only(right: 15.w, left: 15.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.white),
                child: FadeInDown(
                  from: 50,
                  duration: const Duration(milliseconds: 250),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 56.h,
                          ),

                          /// #FullName
                          ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: ctrl.groupNumber,
                              itemBuilder: (context, index) {
                                return textFiled(
                                    ctrl.txtController[index], ctrl.groupName);
                              }),

                          /// #TextButton
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (ctrl.groupNumber < 10)
                                TextButton(
                                  onPressed: () {
                                    ctrl.groupNumber++;
                                    ctrl.update();
                                  },
                                  child: const Text("+ Add Group"),
                                ),
                              if (ctrl.groupNumber > 1)
                                TextButton(
                                  onPressed: () {
                                    ctrl.groupNumber--;
                                    ctrl.update();
                                  },
                                  child: const Text("Delete"),
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),

                          /// #Button
                          Center(child: elevatedButton(mainRole: "Director")),
                          SizedBox(
                            height: 30.h,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
