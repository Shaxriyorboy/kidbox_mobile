import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/parent_pages/add_child_pages/add_child_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

import 'add_child_views.dart';

class AddChildPage extends StatefulWidget {
  const AddChildPage({Key? key}) : super(key: key);

  @override
  State<AddChildPage> createState() => _AddChildPageState();
}

class _AddChildPageState extends State<AddChildPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddChildController>(
        init: AddChildController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.mainBackgroundColor,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 1.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 65.h,
                        ),
                        CircleAvatar(
                          radius: 50.r,
                          backgroundColor: Colors.blue.withOpacity(0.4),
                          child: Image.asset(
                            "assets/images/add_user.png",
                            height: 50.h,
                            width: 50.w,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        ///textField
                        textFieldForChild("Child full name"),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.w),
                          height: 83.h,
                          width: 1.sw,
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: const Color(0xFFB3B3B3),
                                    width: 1.sp)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Child date of birth",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),

                              /// input center name place
                              GestureDetector(
                                onTap: ()=> controller.showDialog(
                                  CupertinoDatePicker(
                                    // initialDateTime: controller.date,
                                    mode: CupertinoDatePickerMode.date,
                                    use24hFormat: true,
                                    onDateTimeChanged: (DateTime newDate) {controller.changeDateTime(newDate);},
                                  ),
                                  context,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric( vertical: 5.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Brith Day",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.sp),),
                                      Text(
                                          "${controller.date.toString().substring(0, 10)}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.sp),)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.w),
                          height: 83.h,
                          width: 1.sw,
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: const Color(0xFFB3B3B3),
                                    width: 1.sp)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Gender",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              dropDownButton(
                                  ["Boy", "Girl"],
                                  controller,
                                  controller.gender,
                                  controller.changeGenderDropdown),

                              /// input center name place
                            ],
                          ),
                        ),
                        textFieldForChild("Enter city or town"),
                        textFieldForChild("Enter district"),
                        textFieldForChild("Name of kindergarten"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        onPressed: () {},
                        minWidth: 100.w,
                        child: Text("Cancel"),
                        color: AppColors.colorGrey,
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        onPressed: () {},
                        minWidth: 100.w,
                        child: Text("Save"),
                        color: AppColors.mainColorOrange,
                      ),
                      SizedBox(
                        width: 15.h,
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
