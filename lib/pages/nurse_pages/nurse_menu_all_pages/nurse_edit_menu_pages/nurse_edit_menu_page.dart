import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_menu_all_pages/nurse_edit_menu_pages/nurse_edit_menu_controller.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_menu_all_pages/nurse_edit_menu_pages/nurse_edit_menu_view.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

class NurseEditMenuPage extends StatefulWidget {
  const NurseEditMenuPage({Key? key}) : super(key: key);

  @override
  State<NurseEditMenuPage> createState() => _NurseEditMenuPageState();
}

class _NurseEditMenuPageState extends State<NurseEditMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainBackgroundColor,
      body: GetBuilder<NurseEditMenuController>(
        init: NurseEditMenuController(),
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
                    SizedBox(height: 52.h,),

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
                                controller.pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                              icon: Icon(Icons.arrow_back_ios_outlined,
                                         color: controller.selectedIndex == 0?
                                         AppColors.mainBackgroundColor : Colors.black,)),
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
                                controller.selectedIndex != 4?controller.pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn):null;
                              },
                              icon: Icon(Icons.arrow_forward_ios_outlined,
                                color: controller.selectedIndex == 4?
                                AppColors.mainBackgroundColor : Colors.black,)),
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
