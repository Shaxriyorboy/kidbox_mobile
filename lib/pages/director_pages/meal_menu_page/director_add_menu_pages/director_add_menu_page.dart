import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/views/calendar.dart';
import 'package:kidbox_mobile/pages/director_pages/meal_menu_page/director_add_menu_pages/director_add_menu_controller.dart';
import 'package:kidbox_mobile/pages/director_pages/meal_menu_page/director_edit_menu_pages/director_edit_menu_page.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:lottie/lottie.dart';

class AddMenuPage extends StatefulWidget {
  const AddMenuPage({Key? key}) : super(key: key);

  @override
  State<AddMenuPage> createState() => _AddMenuPageState();
}

class _AddMenuPageState extends State<AddMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: GetBuilder<AddMenuController>(
        init: AddMenuController(),
        builder: (controller) {
          return Column(
            children: [
              ListTile(
                dense: true,
                contentPadding:
                    EdgeInsets.only(top: 55.h, left: 15.w, right: 15.w),
                title: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
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

              ///#Lottie
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Center(
                    child: GestureDetector(
                      onTap: (){
                        Get.to(()=>const DirectorEditMenuPage(),transition:
                        Transition.rightToLeftWithFade,
                            duration:
                            const Duration(milliseconds: 300));
                      },
                      child: Lottie.asset("assets/lottie_animations/plus_lottie2.json"),
                    ),
                  ),
                ),
              ),

              ///#Pending Text
              Center(
                child: Text(
                  "add_menu".tr,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 22.sp),
                ),
              ),
              SizedBox(
                height: 228.h,
              ),
            ],
          );
        },
      ),
    );
  }
}
