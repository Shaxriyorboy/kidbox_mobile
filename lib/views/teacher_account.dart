import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/director_management_views.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/teacher_management/teacher_manag_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

class TeacherAccount extends StatelessWidget {
  const TeacherAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.mainBackgroundColor,
        child: Column(
          children: [
            /// account image
            Container(
                padding: EdgeInsets.only(top: 80.h),
                child: Image.asset(
                  'assets/images/im_account_holder.png',
                  width: 100.w,
                  height: 100.w,
                )),
            SizedBox(height: 48.h),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  /// account details
                  Container(
                    width: 414.w,
                    height: 250.h,
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    decoration: BoxDecoration(
                      color: AppColors.mainWhiteColor,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AccountDetails(
                            title: 'Saydullayev Ergash Valiyev',
                            subtitle: "Full name"),
                        AccountDetails(
                            title: '+998 (99) 123-45-67',
                            subtitle: "Mobile number"),
                        AccountDetails(
                            title: 'Group: Minion',
                            subtitle: "Class Info",
                            isHasSizedBox: false),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),

                  /// Leaving
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                      color: AppColors.mainWhiteColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: GestureDetector(
                            onTap: () {
                              showGroupBottomSheet(context);
                            },
                            child: Container(
                              height: 62.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border(
                                      bottom: BorderSide(
                                          color: const Color(0xFFB3B3B3),
                                          width: 1.sp))),
                              child: Row(
                                children: [
                                  Text(
                                    "Change group".tr,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.sync,
                                    size: 26.r,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: GestureDetector(
                            onTap: () {
                              showGroupBottomSheet(context);
                            },
                            child: Container(
                              height: 62.h,
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Text(
                                    "Leaving",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: const Color(0xFFFF0000),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.logout,
                                    size: 26.r,
                                    color: const Color(0xFFFF0000),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

void showGroupBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return GetBuilder<DirTeacherManageController>(
          builder: (controller) {
            return WillPopScope(
              onWillPop: () async {
                controller.cancelChoosingGroup();
                return false;
              },
              child: Container(
                height: 0.6.sh,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.r))),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Choose class",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  controller.chooseGroup(index);
                                },
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: 0.08.sh,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ListTile(
                                          title: Text(
                                            "Banana",
                                            style: TextStyle(fontSize: 20.sp),
                                          ),
                                          trailing: controller.checkList[index]
                                              ? const Icon(
                                                  Icons.check_box,
                                                  color:
                                                      AppColors.mainColorOrange,
                                                )
                                              : const Icon(Icons
                                                  .check_box_outline_blank_sharp),
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                      ),
                                      if (index != 9)
                                        const Divider(
                                          thickness: 1,
                                        )
                                    ],
                                  ),
                                ),
                              );
                            })),
                    if (controller.isSelected)
                      FadeInUp(
                        duration: Duration(milliseconds: 200),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)),
                              onPressed: () {
                                controller.cancelChoosingGroup();
                              },
                              height: 45.h,
                              minWidth: 150.w,
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              color: AppColors.colorGrey,
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)),
                              onPressed: () {},
                              height: 45.h,
                              minWidth: 150.w,
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              color: AppColors.mainColorOrange,
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            );
          },
        );
      });
}
