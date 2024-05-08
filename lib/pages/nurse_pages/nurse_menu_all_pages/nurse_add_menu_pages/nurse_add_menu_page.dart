import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_home_pending_pages/nurse_home_pending_view.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_menu_all_pages/nurse_add_menu_pages/nurse_add_menu_controller.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_menu_all_pages/nurse_edit_menu_pages/nurse_edit_menu_page.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/calendar.dart';
import 'package:lottie/lottie.dart';

class NurseAddMenuPage extends StatefulWidget {
  const NurseAddMenuPage({Key? key}) : super(key: key);

  @override
  State<NurseAddMenuPage> createState() => _NurseAddMenuPageState();
}

class _NurseAddMenuPageState extends State<NurseAddMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: GetBuilder<NurseAddMenuController>(
        init: NurseAddMenuController(),
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

              ///Calendar
              Calendar(),

              ///#Lottie
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Center(
                    child: GestureDetector(
                      onTap: (){
                        Get.to(()=>const NurseEditMenuPage());
                      },
                      child: Lottie.asset(
                          "assets/lottie_animations/plus_lottie2.json"),
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
