import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_all_groups_pages/director_all_groups_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/show_alert_dialog.dart';

import '../../log_in_pages/role_page/role_view.dart';

class DirectorAllGroupsPage extends StatefulWidget {
  const DirectorAllGroupsPage({Key? key}) : super(key: key);

  @override
  State<DirectorAllGroupsPage> createState() => _DirectorAllGroupsPageState();
}

class _DirectorAllGroupsPageState extends State<DirectorAllGroupsPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DirectorAllGroupsController>(
        init: DirectorAllGroupsController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.mainBackgroundColor,
            body: Container(
              height: 1.sh,
              width: 1.sw,
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 55.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  /// #AppBar
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "groups".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20.sp),
                        ),
                      ],
                    ),
                    trailing: TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        showAddAlertDialog(
                            context: context,
                            title: "Add group",
                            controller: controller,
                            confirm: () {});
                      },
                      child: Text(
                        "+ Add group".tr,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  /// #Listview builder for ALL GROUPS
                  Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 18.h),
                          height: 82.h,
                          width: 1.sw,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 82.h,
                                width: 120.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.r),
                                      bottomLeft: Radius.circular(8.r)),
                                  color: AppColors.mainColorOrange,
                                ),
                                child: Text(
                                  "Banana",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Asadullo Shonazarov",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "24 children",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF4D4D4D)),
                                  ),
                                ],
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  showAlertDialog(
                                      context: context,
                                      title:
                                          "dialog_header_for_deleting_classes"
                                              .tr,
                                      body:
                                          "dialog_body_for_deleting_classes".tr,
                                      confirm: () {});
                                  //controller.showMyDialog(context);
                                },
                                icon: Image(
                                    image: AssetImage(
                                        "assets/images/delete_icon.png"),
                                    height: 24.h,
                                    width: 24.w),
                                splashRadius: 1.0,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  /// #ShowAlertDialog
  void showAddAlertDialog(
      {required BuildContext context,
      required String title,
      required DirectorAllGroupsController controller,
      required Function() confirm}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          buttonPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          content: textFiled(controller.addGroupController, "Group name"),
          actions: [
            Column(
              children: [
                Container(
                  height: 60.h,
                  margin: EdgeInsets.only(top: 1.h),
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5.h))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "cancel".tr,
                          style: TextStyle(fontSize: 19.sp, color: Colors.red),
                        ),
                      ),
                      SizedBox(
                          height: 65.h,
                          child: const VerticalDivider(
                            color: Colors.grey,
                            thickness: 0.5,
                            width: 1,
                            indent: 0,
                          )),
                      TextButton(
                        onPressed: confirm,
                        child: Text(
                          "confirm".tr,
                          style: TextStyle(fontSize: 19.sp, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
