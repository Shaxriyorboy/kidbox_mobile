import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/director_management_views.dart';
import 'package:kidbox_mobile/pages/director_pages/home_pending_pages/home_pending_view.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/calendar.dart';

class ParentSchedulePage extends StatelessWidget {
  const ParentSchedulePage({Key? key}) : super(key: key);

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
            SizedBox(height: 17.h),
            
            /// Schedule List
            Expanded(
                child: FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    child: ListView.builder(
                        padding:  EdgeInsets.symmetric(horizontal: 15.w),
                        itemCount: 10,
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
