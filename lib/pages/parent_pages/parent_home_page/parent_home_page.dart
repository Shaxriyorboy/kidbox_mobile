import 'package:animate_do/animate_do.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/all_brithday_pages/all_brithday_page.dart';
import 'package:kidbox_mobile/pages/director_pages/home_page/views_home.dart';
import 'package:kidbox_mobile/pages/parent_pages/add_child_pages/add_child_page.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_home_page/parent_home_controller.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_meal_menu_pages/parent_menu_page.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_medical_request/parent_medical_request_page.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_schedule_page/parent_schedule_page.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/album_view_page.dart';
import 'package:kidbox_mobile/views/calendar.dart';

class ParentHomePage extends StatefulWidget {
  const ParentHomePage({Key? key}) : super(key: key);

  @override
  State<ParentHomePage> createState() => _ParentHomePageState();
}

class _ParentHomePageState extends State<ParentHomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ParentHomeController>(
        init: ParentHomeController(),
        builder: (context) {
          return Container(
            padding: EdgeInsets.only( top: 55.h),
            color: AppColors.mainBackgroundColor,
            child: Column(
              children: [
                /// profile name and avatar
                ListTile(
                  contentPadding: EdgeInsets.only(left: 15.w, right: 15.w,),
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
                  trailing: InkWell(
                    onTap: (){

                    },
                    child: SpeedDial(
                      // childPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      childrenButtonSize: Size(58,58),
                      child: Container(
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
                      direction: SpeedDialDirection.down,
                      animatedIconTheme: IconThemeData(size: 30.0),
                      elevation: 0,
                      overlayColor: Colors.black,
                      overlayOpacity: 0.5,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: CircleBorder(),
                      children: [
                        SpeedDialChild(
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage("assets/images/child_avatar0.png"),
                            ),
                            onTap: (){

                            }
                        ),
                        SpeedDialChild(
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage("assets/images/child_avatar1.png"),
                            ),
                            onTap: (){

                            }
                        ),
                        SpeedDialChild(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              child: Icon(Icons.add,color: AppColors.mainColorOrange,),
                            ),
                            onTap: () => Get.to(const AddChildPage()),

                        ),
                      ],

                    )

                  ),
                ),
                SizedBox(height: 14.h),
                /// Calendar
                Calendar(),


                Expanded(
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(left: 15.w, right: 15.w,bottom: 100.h),
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          /// All schedules
                          GestureDetector(
                            onTap: (){
                              Get.to(() => const ParentSchedulePage(),
                                  transition: Transition.rightToLeftWithFade,
                                  duration: const Duration(milliseconds: 300));

                            },
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "full_schedule".tr,
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.colorTextLightGrey,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          CustomListTile(
                            subTitle: 'Origami lesson',
                            onTap: () {
                            },
                          ),
                          SizedBox(height: 18.h),
                          CustomListTile(
                            subTitle: 'Origami lesson',
                            onTap: () {
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
                                onTap: () {
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
                            },
                          ),
                          SizedBox(height: 20.h),

                          /// Medical Request

                          Container(
                            alignment: Alignment.centerLeft,
                            child:Text(
                              "medical_req".tr,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.mainColorBlack,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          CustomListTile(
                            title: 'symptom'.tr,
                            subTitle: 'Influenza',
                            trailingIcon: 'im_medical',
                            onTap: () {
                              Get.to(() => const ParentMedicalRequestPage(),
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
                                title: "photo_gal".tr,
                                subTitle: "83 " + "photos".tr,
                                image: "im_gallery.png",
                                width: 187,
                                onTap: () {
                                  Get.to(() => const AlbumViewPage(),
                                      transition:
                                      Transition.native,
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
                                  Get.to(() => const ParentMealMenuPage(),
                                      transition:
                                      Transition.cupertino,
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
