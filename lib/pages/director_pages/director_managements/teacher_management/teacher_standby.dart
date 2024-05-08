import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/teacher_management/teacher_manag_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

class TeacherStandBy extends StatefulWidget {
  const TeacherStandBy({Key? key}) : super(key: key);

  @override
  State<TeacherStandBy> createState() => _TeacherStandByState();
}

class _TeacherStandByState extends State<TeacherStandBy> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DirTeacherManageController>(builder: (controller) {
      return Container(
        padding: EdgeInsets.only(left: 20.w, right: 15.w),
        decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: ListView.builder(
            itemCount: 20,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 20.h),
            itemBuilder: (ctx, index) {
              return Container(
                height: 62.h,
                margin: EdgeInsets.only(bottom: 16.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// avatar image
                    Container(
                      height: 62.r,
                      width: 62.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(44.r),
                      ),
                      child: Image.asset(
                          'assets/images/child_avatar${index % 2}.png'),
                    ),
                    SizedBox(width: 16.w),

                    /// child name and group
                    SizedBox(
                      width: 160.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// child name
                          Text(
                            "Hojiboyeva T.B.",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),

                          /// group name
                          Text(
                            "Leaders",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color:
                                    AppColors.mainColorBlack.withOpacity(0.6),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),

                    /// cancel button
                    SizedBox(
                        width: 36.w,
                        height: 36.h,
                        child: Image.asset('assets/images/ic_cancel.png')),
                    SizedBox(
                      width: 18.w,
                    ),

                    /// approve button
                    SizedBox(
                      width: 36.w,
                      height: 36.h,
                      child: IconButton(
                        onPressed: () {
                          showGroupBottomSheet(
                            context,
                          );
                        },
                        icon: Image.asset('assets/images/ic_check.png'),
                        padding: EdgeInsets.zero,
                      ),
                    )
                  ],
                ),
              );
            }),
      );
    });
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
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
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
                                            trailing: controller
                                                    .checkList[index]
                                                ? const Icon(
                                                    Icons.check_box,
                                                    color: AppColors
                                                        .mainColorOrange,
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
}
