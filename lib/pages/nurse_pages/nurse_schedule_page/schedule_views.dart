import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_schedule_page/nur_schedule_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/services/log_service.dart';

class WeekdayPageView extends StatelessWidget {
  NurseScheduleController controller;
  int fieldIndex;
  String weekday;

  WeekdayPageView(
      {required this.controller,
      required this.weekday,
      required this.fieldIndex,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),

        /// Weekdays
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (weekday != 'Monday')
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () async {
                    await controller.mergeToMap(weekday);
                    controller.cleanUpController().then((value) => {
                          controller.pageController.previousPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn)
                        });
                  },
                  icon: Image.asset('assets/images/ic_arrow_left.png')),
            GestureDetector(
              onTap: () {
                LogService.w(controller.titles[weekday].toString());
              },
              child: Text(
                weekday,
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainColorBlack),
              ),
            ),
            if (weekday != 'Friday')
              IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () async {
                    await controller.mergeToMap(weekday);
                    controller.cleanUpController().then((value) => {
                          controller.pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn)
                        });
                  },
                  icon: Image.asset('assets/images/ic_arrow_right.png'))
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 20.h),
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.fieldNumbers[fieldIndex],
                    padding: EdgeInsets.only(top: 20.h),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          /// Time
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'time'.tr,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.colorTextLightGrey),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          GestureDetector(
                            onTap: ()=> controller.showDialog(
                              CupertinoDatePicker(
                                // initialDateTime: controller.date,
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: true,
                                onDateTimeChanged: (DateTime newDate) {controller.changeDateTime(newDate,index);},
                              ),
                              context,
                            ),
                            child: Container(
                              height: 55.h,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              decoration: BoxDecoration(
                                color: AppColors.mainWhiteColor,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: controller.dateList[index] == null? Text('Time'):Text("${controller.dateList[index].toString().substring(11,16)}"),
                            ),
                          ),
                          SizedBox(height: 15.h),

                          /// Title
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'title'.tr,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.colorTextLightGrey),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            height: 55.h,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            decoration: BoxDecoration(
                              color: AppColors.mainWhiteColor,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: TextField(
                              controller: controller.titleControllers[index],
                              cursorColor: AppColors.colorTextLightGrey,
                              maxLines: 100,
                              textInputAction: TextInputAction.newline,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Music lesson",
                              ),
                            ),
                          ),
                          Divider(height: 40.h),
                        ],
                      );
                    }),

                /// #TextButton
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (controller.fieldNumbers[fieldIndex] < 5)
                      TextButton(
                        onPressed: () {
                          controller.fieldNumbers[fieldIndex]++;
                          controller.update();
                        },
                        child: const Text("+ Add Field"),
                      ),
                    if (controller.fieldNumbers[fieldIndex] > 1)
                      TextButton(
                        onPressed: () {
                          controller.fieldNumbers[fieldIndex]--;
                          controller.update();
                        },
                        child: const Text("Remove field"),
                      ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
