import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/director_management_views.dart';
import 'package:kidbox_mobile/pages/director_pages/director_schedule_page/add_schedule_page.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/calendar.dart';

class DirectorSchedulePage extends StatefulWidget {
  const DirectorSchedulePage({Key? key}) : super(key: key);

  @override
  State<DirectorSchedulePage> createState() => _DirectorSchedulePageState();
}

class _DirectorSchedulePageState extends State<DirectorSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 55.h),
        color: AppColors.mainBackgroundColor,
        child: Column(
          children: [
            /// profile name and avatar
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
                    border:
                        Border.all(color: AppColors.mainColorOrange, width: 2.r),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/image.png"),
                    ),
                  ),
                ),
              ),
            ),

            /// Calendar
            Calendar(),

            /// Edit menu button
            Container(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              alignment: Alignment.centerRight,
              child:  ElevatedButton.icon(
                onPressed: () {
                  Get.to(() => const DirAddingSchedule(),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(milliseconds: 300));
                },
                icon: Icon(
                  Icons.add,
                  size: 24.r,
                  color: AppColors.mainColorBlack,
                ),
                label: Text(
                  "add_schedule".tr,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.mainColorBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0, backgroundColor: AppColors.transparent,
                    padding: EdgeInsets.zero,
                    shadowColor: AppColors.transparent),
              ),
            ),
            SizedBox(height: 17.h),

            /// Expansion
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.mainWhiteColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: ExpansionCustom(title: 'Banana'),
                ),
              ),
            ),

            SizedBox(height: 15.h),

            /// Schedule List
            Expanded(
                child: FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    child: ListView.builder(
                        padding:  EdgeInsets.symmetric(horizontal: 15.w),
                        itemCount: 15,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return CustomTileSchedule(
                              title: 'Music lesson',
                              subTitle: 'Morning work-out',
                              trailingIcon: 'im_activity',
                              onTap: () {});
                        })))
          ],
        ),
      ),
    );
  }
}
