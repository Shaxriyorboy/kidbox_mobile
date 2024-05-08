import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kidbox_mobile/views/child_account.dart';
import 'package:kidbox_mobile/pages/director_pages/director_managements/director_views_controller.dart';
import 'package:kidbox_mobile/views/teacher_account.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

class TabBarCustom extends StatelessWidget {
  const TabBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DirViewsController>(
        init: DirViewsController(),
        builder: (controller) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: TabBar(
                controller: controller.tabController,
                onTap: (index) {
                  controller.tabController.animateTo(index);
                },
                indicatorWeight: 0.1,
                labelPadding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                indicatorColor: AppColors.transparent,
                physics: const BouncingScrollPhysics(),
                tabs: [
                  Container(
                    height: 52.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: (controller.tabController.index == 0)
                          ? AppColors.mainWhiteColor
                          : AppColors.transparent,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      "approved".tr,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.mainColorBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    height: 52.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: (controller.tabController.index == 1)
                          ? AppColors.mainWhiteColor
                          : AppColors.transparent,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      'standby'.tr,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.mainColorBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    height: 52.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: (controller.tabController.index == 2)
                          ? AppColors.mainWhiteColor
                          : AppColors.transparent,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      "invite".tr,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.mainColorBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ]),
          );
        });
  }
}

class ExpansionCustom extends StatelessWidget {
  String title;

  ExpansionCustom({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DirViewsController>(builder: (controller) {
      return ExpansionPanelList(
        elevation: 0,
        dividerColor: AppColors.transparent,
        expansionCallback: (index, isOpen) {
          if (title == 'Group') {
            controller.isExpandedInvite = !controller.isExpandInvite;
          } else {
            controller.isExpandedApproved = !controller.isExpandApproved;
          }
        },
        expandedHeaderPadding: EdgeInsets.zero,
        children: [
          ExpansionPanel(
            backgroundColor: AppColors.transparent,
            isExpanded: (title == 'Group')
                ? controller.isExpandInvite
                : controller.isExpandApproved,
            canTapOnHeader: true,
            headerBuilder: (ctx, isOpen) {
              return Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.mainColorBlack,
                      fontWeight: FontWeight.w500),
                ),
              );
            },
            body: Container(
              height: 186.h,
              color: AppColors.mainWhiteColor,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.separated(
                itemCount: 10,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) => Divider(
                  height: 0.h,
                  color: AppColors.mainColorBlack.withOpacity(0.3),
                ),
                itemBuilder: (ctx, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    onTap: () {
                      if (title == 'Group') {
                        controller.isExpandedInvite = false;
                      } else {
                        controller.isExpandedApproved = false;
                      }
                    },
                    title: Text(
                      'Banana Group',
                      style: TextStyle(
                          color: AppColors.mainColorBlack,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}

class CustomProfileTile extends StatelessWidget {
  bool isChild;

  CustomProfileTile({required this.isChild, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          if (isChild) {
            Get.to(() => const ChildAccount(),
                transition: Transition.rightToLeftWithFade,
                duration: const Duration(milliseconds: 300));
          } else {
            Get.to(() => const TeacherAccount(),
                transition: Transition.rightToLeftWithFade,
                duration: const Duration(milliseconds: 300));
          }
        },
        child: Container(
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
                child: Image.asset('assets/images/child_avatar0.png'),
              ),
              SizedBox(width: 16.w),

              /// child name and group
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// child name
                  Text(
                    "Hojiboyeva T.B.",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),

                  /// group name
                  Text(
                    "Leaders",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.mainColorBlack.withOpacity(0.6),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountDetails extends StatelessWidget {
  String title;
  String subtitle;
  bool? isHasSizedBox;

  AccountDetails(
      {required this.title,
      required this.subtitle,
      this.isHasSizedBox,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 18.h),
        Text(
          subtitle,
          style: TextStyle(
            color: AppColors.colorTextLightGrey,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: AppColors.mainColorBlack,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (isHasSizedBox ?? true) SizedBox(height: 18.h),
        if (isHasSizedBox ?? true)
          Divider(
            height: 0.h,
            color: const Color(0xFFB3B3B3),
          ),
      ],
    );
  }
}

class CustomTileSchedule extends StatelessWidget {
  String title;
  String subTitle;
  String trailingIcon;
  Function() onTap;

  CustomTileSchedule(
      {required this.title,
      required this.subTitle,
      required this.trailingIcon,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70.h,
        margin: EdgeInsets.only(bottom: 15.h),
        decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            /// date and place
            Container(
              width: 86.w,
              height: 70.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(8.r)),
              ),
              child: Text(
                "08:30",
                style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.colorTextLightGrey,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(width: 12.w),

            /// group name and icons
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.mainColorBlack,
                    fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
            SizedBox(width: 10.w),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 22.r,
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}
