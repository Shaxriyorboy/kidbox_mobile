import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

import 'director_edit_page_controller.dart';
import 'director_edit_page_view.dart';


class DirectorEditPage extends StatelessWidget {
   DirectorEditPage({Key? key,}) : super(key: key);
// String name;
// String phone;
// String centerName;
// String location;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DirectorEditController>(
        init: DirectorEditController(),
        builder: (_controller) {
          return Scaffold(
            backgroundColor: const Color(0xFFF7F7F7),

            /// director ui
            body: SizedBox(
              height: 1.sh,
              child: Column(
                children: [
                  DirectorEditImage(ctrl: _controller,),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child:  Column(
                        children: [
                          SizedBox(height: 30.h,),
                           DirectorEditInfo(controller:_controller),

                          SizedBox(height: 30.h,),

                           KindergartenEditInfo(controller:_controller),
                          SizedBox(height: 20.h,),
                          Container(
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.only(right: 15.w),
                            child: ElevatedButton(onPressed: () { Navigator.pop(context); }, style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r)), backgroundColor: AppColors.mainColorOrange,
                                elevation: 0,
                                fixedSize: Size(90.w, 38.h)),
                              child: Text("save".tr,style:TextStyle(color:AppColors.mainColorBlack,fontSize: 18.sp,fontWeight: FontWeight.w500 ) ,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                ],
              ),
            ),
            resizeToAvoidBottomInset: true,
          );
        });

  }
}

