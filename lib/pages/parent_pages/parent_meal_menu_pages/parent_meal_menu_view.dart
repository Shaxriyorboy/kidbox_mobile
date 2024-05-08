import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'parent_meal_menu_controller.dart';

class ThreeDots extends StatelessWidget {
  late ParentMealMenuController controller;

  ThreeDots({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 59.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 9.w,
            width: 9.w,
            decoration: BoxDecoration(
                color: controller.selectIndex == 0
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            width: 9.w,
          ),
          Container(
            height: 9.w,
            width: 9.w,
            decoration: BoxDecoration(
                color: controller.selectIndex == 1
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            width: 9.w,
          ),
          Container(
            height: 9.w,
            width: 9.w,
            decoration: BoxDecoration(
                color: controller.selectIndex == 2
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }
}

class MealMenu extends StatelessWidget {
  String mealType = "";
  String mealTime = "";
  String image;
  String description = "";

  MealMenu(
      {Key? key,
        required this.mealType,
        required this.mealTime,
        required this.image,
        required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.r),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Text(
                  mealType,
                  style:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
                ),
                Spacer(),
                Text(
                  mealTime,
                  style:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                ),
              ],
            ),
            SizedBox(
              height: 43.h,
            ),
            Image(
              image: AssetImage(image),
              height: 200.w,
              width: 200.w,
            ),
            SizedBox(
              height: 11.h,
            ),
            Image(
              image: AssetImage("assets/images/ellipse_for_meal.png"),
              height: 16.h,
              width: 190.w,
            ),
            Text("Description",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp)),
            SizedBox(
              height: 12.h,
            ),
            Text(
              description,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h,),
          ],
        ),
      ),
    );
  }
}