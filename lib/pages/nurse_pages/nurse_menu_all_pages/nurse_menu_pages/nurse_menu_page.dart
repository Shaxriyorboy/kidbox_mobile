import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_home_pending_pages/nurse_home_pending_view.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_menu_all_pages/nurse_edit_menu_pages/nurse_edit_menu_page.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_menu_all_pages/nurse_menu_pages/nurse_menu_controller.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_menu_all_pages/nurse_menu_pages/nurse_menu_view.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/calendar.dart';

class NurseMealMenuPage extends StatefulWidget {
  const NurseMealMenuPage({Key? key}) : super(key: key);

  @override
  State<NurseMealMenuPage> createState() => _NurseMealMenuPageState();
}

class _NurseMealMenuPageState extends State<NurseMealMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainBackgroundColor,
      body: GetBuilder<NurseMealMenuController>(
        init: NurseMealMenuController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                dense: true,
                contentPadding:
                    EdgeInsets.only(top: 55.h, left: 15.w, right: 15.w),
                title: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "menu".tr,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20.sp),
                    ),
                  ],
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
              Calendar(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      const NurseEditMenuPage(),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(milliseconds: 300),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.edit),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        "Edit menu",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18.sp),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.r),
                      topRight: Radius.circular(25.r),
                    ),
                    color: AppColors.mainColorOrange,
                  ),
                  child: Stack(
                    children: [
                      PageView(
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: (index) {
                          controller.selectIndex = index;
                          controller.update();
                        },
                        children: [
                          MealMenu(
                              mealType: "Breakfast",
                              mealTime: "09:00 — 09:30",
                              image: "assets/images/breakfast.png",
                              description:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
                          MealMenu(
                              mealType: "Lunch",
                              mealTime: "13:00 — 13:30",
                              image: "assets/images/lunch_meal.png",
                              description:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
                          MealMenu(
                              mealType: "Afternoon tea",
                              mealTime: "16:00 — 16:30",
                              image: "assets/images/afternoon_tea.png",
                              description:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque amet eleifend morbi quam et convallis. Potenti ipsum aliquam non sit. Convallis quis "),
                        ],
                      ),
                      Align(
                        alignment: const Alignment(0,0.9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 3.w),
                            height: 11.h,width: 11.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.selectIndex == index ? Colors.white :Colors.white.withOpacity(0.5),
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
