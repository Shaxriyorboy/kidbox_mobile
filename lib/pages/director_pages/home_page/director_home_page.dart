import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/all_brithday_pages/all_brithday_page.dart';
import 'package:kidbox_mobile/pages/director_pages/director_all_groups_pages/director_all_groups_page.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/child_management/child_manag_page.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/teacher_management/teacher_manag_page.dart';
import 'package:kidbox_mobile/pages/director_pages/director_medical_request/director_medical_request_page.dart';
import 'package:kidbox_mobile/pages/director_pages/director_schedule_page/director_schedule_page.dart';
import 'package:kidbox_mobile/pages/director_pages/home_page/director_home_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/home_page/views_home.dart';
import 'package:kidbox_mobile/pages/director_pages/meal_menu_page/director_menu_pages/derictor_menu_page.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/child_account.dart';
import 'director_home_controller.dart';


class DirectorHomePage extends StatelessWidget {
  const DirectorHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DirectorHomeController>(
        init: DirectorHomeController(),
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 55.h),
            color: AppColors.mainBackgroundColor,
            child: Column(
              children: [
                /// profile name and avatar
                ListTile(
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
                      border: Border.all(
                          color: AppColors.mainColorOrange, width: 2.r),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/image.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 14.h),
                Expanded(
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 100.h),
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          /// teacher and child management
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Teacher manag
                              CustomGridTile(
                                title: "teach_manag".tr,
                                subTitle: "19 " + "teacher".tr,
                                image: 'im_teacher_manag.png',
                                width: 187,
                                onTap: () {
                                  Get.to(() => const DirTeacherManagePage(),
                                      transition:
                                          Transition.rightToLeftWithFade,
                                      duration:
                                          const Duration(milliseconds: 300));
                                },
                              ),
                              SizedBox(
                                width: 9.w,
                              ),

                              /// Child manag
                              CustomGridTile(
                                title: "child_manag".tr,
                                subTitle: "100 " + "children".tr,
                                image: 'im_child_manag.png',
                                width: 187,
                                onTap: () {
                                  Get.to(() => const DirChildManagePage(),
                                      transition:
                                          Transition.rightToLeftWithFade,
                                      duration:
                                          const Duration(milliseconds: 300));
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 22.h),

                          /// All schedules
                          Container(
                            alignment: Alignment.centerLeft,
                            child:Text(
                              "schedules".tr,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.mainColorBlack,
                                  fontWeight: FontWeight.w500),
                            ),

                          ),
                          SizedBox(height: 9.h),
                          CustomListTile(
                            title: 'friday'.tr,
                            subTitle: 'Banana ' + 'group'.tr,
                            trailingIcon: 'im_notepad',
                            onTap: () {
                              Get.to(() => const DirectorSchedulePage(),
                                  transition: Transition.rightToLeftWithFade,
                                  duration: const Duration(milliseconds: 300));
                            },
                          ),
                          SizedBox(height: 18.h),

                          /// All Birthdays
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "next_birth".tr,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.mainColorBlack,
                                    fontWeight: FontWeight.w500),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Get.to(() =>  const DirectorAllBrithdayPage(),
                                      transition:
                                      Transition.rightToLeftWithFade,
                                      duration:
                                      const Duration(milliseconds: 300));

                                },
                                child: Text(
                                  "all_birth".tr,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.colorTextLightGrey,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          CustomListTile(
                            title: 'friday'.tr,
                            subTitle: 'Mukhammad Abdullayev',
                            trailingIcon: 'im_birthday',
                            onTap: () {
                              Get.to(() => const ChildAccount(),
                                  transition: Transition.rightToLeftWithFade,
                                  duration: const Duration(milliseconds: 300));
                            },
                          ),
                          SizedBox(height: 20.h),

                          /// Medical Request
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "medical_req".tr,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.mainColorBlack,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "all_req".tr,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.colorTextLightGrey,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          CustomListTile(
                            title: 'symptom'.tr,
                            subTitle: 'Influenza',
                            trailingIcon: 'im_medical',
                            onTap: () {
                              Get.to(() => const DirectorMedicalRequestPage(),
                                  transition: Transition.rightToLeftWithFade,
                                  duration: const Duration(milliseconds: 300));
                            },
                          ),
                          SizedBox(height: 22.h),

                          /// gallery and meal menu

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Photo Gallery
                              CustomGridTile(
                                title: "group_manag".tr,
                                subTitle: "3 " + "group".tr,
                                image: "im_gallery.png",
                                width: 187,
                                onTap: () {
                                  Get.to(() => const DirectorAllGroupsPage(),
                                      transition:
                                          Transition.rightToLeftWithFade,
                                      duration:
                                          const Duration(milliseconds: 300));
                                },
                              ),
                              SizedBox(width: 9.w),

                              /// Meal Menu
                              CustomGridTile(
                                title: "meal_menu".tr,
                                subTitle: "today".tr,
                                image: "im_menumeal.png",
                                width: 187,
                                onTap: () {
                                  Get.to(() => const DirectorMenuPage(),
                                      transition:
                                          Transition.rightToLeftWithFade,
                                      duration:
                                          const Duration(milliseconds: 300));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
