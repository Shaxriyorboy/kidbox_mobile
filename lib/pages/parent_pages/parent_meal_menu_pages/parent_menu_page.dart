import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/home_pending_pages/home_pending_view.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/calendar.dart';
import 'parent_meal_menu_controller.dart';
import 'parent_meal_menu_view.dart';



class ParentMealMenuPage extends StatefulWidget {
  const ParentMealMenuPage({Key? key}) : super(key: key);

  @override
  State<ParentMealMenuPage> createState() => _ParentMealMenuPageState();
}

class _ParentMealMenuPageState extends State<ParentMealMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainBackgroundColor,
      body: GetBuilder<ParentMealMenuController>(
        init: ParentMealMenuController(),
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
                      onTap: (){
                        Get.back();
                      },
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
              Padding(
                padding: EdgeInsets.only(left: 15.w,right: 15.w),
                child: Calendar(),
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
                        alignment: Alignment.bottomCenter,
                        child: ThreeDots(controller: controller),
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