import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/main_page.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'login_page_parent/parent_login_controller.dart';
import 'role_controller.dart';

/// #BuildRole
Widget buildRole(RoleController ctr) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(50.r),
    ),
    width: 1.sw,
    margin: EdgeInsets.only(top: 20.h, right: 15.w, left: 15.w),
    padding: EdgeInsets.all(6.r),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        0,
        2,
        3,
      ]
          .map((e) => InkWell(
                onTap: () {
                  ctr.role = e;
                  ctr.update();
                  ctr.pageController.jumpToPage(ctr.role);
                },
                child: Container(
                    width: 1.sw / 3.5,
                    padding: EdgeInsets.only(
                        left: 24.w, right: 24.w, top: 7.h, bottom: 3.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: ctr.role == e
                          ? const Color(0xFFF1F1F1)
                          : Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          e == 0
                              ? "assets/images/parent.png"
                              : e == 2
                                  ? "assets/images/nurse.png"
                                  : "assets/images/director.png",
                          height: 25,
                          width: 25,
                        ),
                        Text(e == 0
                            ? "parents".tr
                            : e == 2
                                ? "nurse".tr
                                : "director".tr),
                      ],
                    )),
              ))
          .toList(),
    ),
  );
}

/// #Button
Widget elevatedButton({int? role, String? mainRole}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        elevation: 0, backgroundColor: AppColors.mainColorOrange,
        fixedSize: Size(200.w, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        )),
    onPressed: () {
      (role == null)
          ? Get.to(MainPage(
              role: mainRole,
            ))
          : Get.find<RoleController>().pageController.jumpToPage(role);
    },
    child: Text(
      "next".tr,
      style: TextStyle(
          fontSize: 17.sp, color: Colors.black, fontWeight: FontWeight.w600),
    ),
  );
}

/// #DropDownButton
Widget dropDownButton(List<String> list, var controller, String value,
    void Function(String?) function) {
  return Container(
    height: 60.h,
    alignment: Alignment.center,
    margin: EdgeInsets.only(bottom: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(10.r)),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        alignment: Alignment.center,
        borderRadius: BorderRadius.circular(10.r),
        isExpanded: true,
        hint: Text(value),
        style: TextStyle(
            fontSize: 16.sp, color: Colors.black, fontFamily: "Poppins"),
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        onChanged: function,
        items: list.map((String tag) {
          return DropdownMenuItem<String>(
            value: tag,
            child: Text(
              tag,
            ),
          );
        }).toList(),
      ),
    ),
  );
}

/// #TextFild
Widget textFiled(TextEditingController textController, String value) {
  return Container(
    height: 60.h,
    alignment: Alignment.center,
    margin: EdgeInsets.only(bottom: 10.h),
    decoration: BoxDecoration(
      color: const Color(0xFFF1F1F1),
      borderRadius: BorderRadius.circular(11.r),
    ),
    child: TextField(
      controller: textController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 10.w),
        border: InputBorder.none,
        hintText: value,
        hintStyle: TextStyle(fontSize: 16.sp),
      ),
    ),
  );
}

/// #Date picker
Widget datePicker(BuildContext context, ParentLoginController controller) {
  return GestureDetector(
    onTap: () => controller.showDialog(
      CupertinoDatePicker(
        // initialDateTime: controller.date,
        mode: CupertinoDatePickerMode.date,
        use24hFormat: true,
        onDateTimeChanged: (DateTime newDate) {
          controller.changeDateTime(newDate);
        },
      ),
      context,
    ),
    child: Container(
      alignment: Alignment.centerLeft,
      height: 60.h,
      padding: EdgeInsets.only(left: 10.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      width: 1.sw,
      child: !controller.isChooseDate
          ? Text(
              "child_date_of_birth".tr,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black87.withOpacity(0.65),
              ),
            )
          : Text(
              '${controller.date.toString().substring(0, 10)}',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black87.withOpacity(0.65),
              ),
            ),
    ),
  );
}

void showMaterialDialog(
  BuildContext context,
  List listAvatars,
  var controller,
) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceAround,
          backgroundColor: AppColors.mainWhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          content: Container(
            height: 300.w,
            width: 350.w,
            child: GridView.builder(
                itemCount: listAvatars.length,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemBuilder: (context, index) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        shape: const CircleBorder(),
                        //fixedSize: Size(85.w, 85.h),
                      ),
                      onPressed: () {
                        controller.setAvatar(listAvatars[index]);
                      },
                      child: Image.asset(
                        listAvatars[index],
                        height: 85.w,
                        width: 85.w,
                      ));
                }),
          ),
        );
      });
}
