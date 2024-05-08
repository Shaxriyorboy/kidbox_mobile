
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/log_in_pages/log_in_page.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'language_controller.dart';

/// Language Ticker Widget
Widget buildCustomPicker(LanguageController controller) => GestureDetector(
      onTap: () {
        Get.to(()=>const LogInPage());
      },
      child: SizedBox(
        height: 300.h,
        child: CupertinoPicker(
          scrollController: FixedExtentScrollController(initialItem: 1),
          itemExtent: 100.h,
          onSelectedItemChanged: (index) {
            controller.chooseLang = index;
          },
          children: [
            for (String i in controller.languages)
              Center(
                child: Text(i,
                    style: TextStyle(
                        fontSize:
                            (controller.languages[controller.selectLang] == i)
                                ? 24.sp
                                : 20.sp,
                        color: AppColors.mainColorBlack,
                        fontFamily: "Poppins",
                        fontWeight:
                            (controller.languages[controller.selectLang] == i)
                                ? FontWeight.bold
                                : null)),
              ),
          ],
          selectionOverlay: Container(
            margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 70.w),
            decoration: BoxDecoration(
              color: AppColors.transparent,
              border: Border.symmetric(
                  horizontal: BorderSide(
                      color: AppColors.mainColorBlack.withOpacity(0.3),
                      width: 0.5.w)),
            ),
          ),
          looping: false,
          diameterRatio: 1.5,
        ),
      ),
    );
