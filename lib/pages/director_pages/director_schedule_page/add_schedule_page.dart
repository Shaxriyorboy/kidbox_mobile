import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/director_management_views.dart';
import 'package:kidbox_mobile/pages/director_pages/director_schedule_page/dir_schedule_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/director_schedule_page/schedule_views.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

class DirAddingSchedule extends StatelessWidget {
  const DirAddingSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<DirectorScheduleController>(
            init: DirectorScheduleController(),
            builder: (controller) {
              return Container(
                padding: EdgeInsets.only(top: 55.h,left: 15.w,right: 15.w),
                color: AppColors.mainBackgroundColor,
                child: Column(
                  children: [
                    /// ListTile and Expansion
                    Container(
                      padding: EdgeInsets.only(top: 55.h),
                      color: AppColors.mainBackgroundColor,
                      child: Column(
                        children: [
                          /// profile name and avatar
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            dense: true,
                            title: Text(
                              "name".tr + " : Farida",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainColorBlack),
                            ),
                            subtitle: Text(
                              "Kindergarten".tr + " : Delfinchik",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.colorTextLightGrey),
                            ),
                            trailing: Container(
                              height: 58.w,
                              width: 58.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.mainColorOrange,
                                    width: 2.r),
                                image: const DecorationImage(
                                  image: AssetImage("assets/images/image.png"),
                                ),
                              ),
                            ),
                          ),

                          /// Choose class
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "choose_class".tr,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 17.h),

                          /// Expansion
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.mainWhiteColor,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: ExpansionCustom(title: 'View all classes'),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// textFields
                    Expanded(
                        child: PageView(
                      controller: controller.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        WeekdayPageView(
                          controller: controller,
                          weekday: "Monday",
                          fieldIndex: 0,
                        ),
                        WeekdayPageView(
                          controller: controller,
                          weekday: "Tuesday",
                          fieldIndex: 1,
                        ),
                        WeekdayPageView(
                          controller: controller,
                          weekday: "Wednesday",
                          fieldIndex: 2,
                        ),
                        WeekdayPageView(
                          controller: controller,
                          weekday: "Thursday",
                          fieldIndex: 3,
                        ),
                        WeekdayPageView(
                          controller: controller,
                          weekday: "Friday",
                          fieldIndex: 4,
                        ),
                      ],
                    ))
                  ],
                ),
              );
            }));
  }
}
