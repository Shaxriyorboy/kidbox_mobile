import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/meal_menu_page/director_edit_menu_pages/director_edit_menu_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/meal_menu_page/director_edit_menu_pages/director_edit_menu_views.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

class DirectorEditMenuPage extends StatefulWidget {
  const DirectorEditMenuPage({Key? key}) : super(key: key);

  @override
  State<DirectorEditMenuPage> createState() => _DirectorEditMenuPageState();
}

class _DirectorEditMenuPageState extends State<DirectorEditMenuPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainBackgroundColor,
      body: GetBuilder<DirectorEditMenuController>(
        init: DirectorEditMenuController(),
        builder: (controller) {
          return Stack(
            children: [
              ///# background images
              BackgroundImages(),

              Container(
                width: 1.sw,
                height: 1.sh,
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    SizedBox(
                      height: 52.h,
                    ),

                    /// # Icons
                    BackAndCheckIcons(),
                    Spacer(),

                    ///#edit and add menu
                    Container(
                      padding:
                          EdgeInsets.only(left: 15.w, right: 15.h, top: 15.h),
                      height: 520.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: AppColors.mainBackgroundColor,
                      ),

                      /// PageView
                      child: PageView(
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: (index){
                          controller.selectedIndex = index;
                          controller.update();
                        },
                        controller: controller.pageController,
                        children: controller.list.map((e) => AddMenuForDay(weekDays: e)).toList(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                controller.pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                              }, icon: Image(image: AssetImage("assets/images/ic_arrow_left.png"),color: controller.selectedIndex==0?AppColors.mainBackgroundColor:Colors.black,)),
                          Row(
                            children: List.generate(
                                controller.list.length, (index) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 3.w),
                              height: 11.h,width: 11.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.selectedIndex == index ? Colors.grey :Colors.grey.shade300,
                              ),
                            )),
                          ),
                          IconButton(
                              onPressed: () {
                                controller.selectedIndex!=4?controller.pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn):null;
                              }, icon: Image(image: AssetImage("assets/images/ic_arrow_right.png"),color: controller.selectedIndex==4?AppColors.mainBackgroundColor:Colors.black,)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
