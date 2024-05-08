import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/show_alert_dialog.dart';

import 'nurse_device_controller.dart';

class NurseCurrentSession extends StatelessWidget {
  NurseDeviceController controller;
  NurseCurrentSession({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 130.h,
      width: 1.sw,
      padding: EdgeInsets.only(left: 13.w, right: 13.w),
      decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// last phone information
          Container(
              height: 65.h,
              width: 1.sw,
              child: Row(
                children: [
                  /// phone icon
                  Image(
                    image: AssetImage("assets/images/phone_icon.png"),
                    width: 25.w,
                    height: 25.h,
                  ),
                  SizedBox(width: 19.w,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "iPhone XS",
                        style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                      ),


                      /// phone location
                      Text("Edison, Unit States online",style: TextStyle(fontSize: 12.sp,color: Color(0xFF969696),fontWeight: FontWeight.w400 ),)
                    ],
                  ),
                ],
              )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w),
            child: SizedBox(height: 1.h,child: Divider(thickness: 1,color: Colors.grey,)),
          ),
          /// end other sessions
          InkWell(
            onTap: (){
              showAlertDialog(context: context, title: "end_other_session".tr, body: "dou_you_section_other".tr, confirm: (){});
            },
            child: SizedBox(
                height: 63.h,
                width: 1.sw,
                child: Row(
                  children: [
                    /// phone icon
                    Image(
                      image: AssetImage("assets/images/hand_icon.png"),
                      width: 25.w,
                      height: 25.h,
                    ),
                    SizedBox(width: 19.w,),
                    Text("end_other_session".tr,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500,color:Color(0xFFFF0000), ),)
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}

class NurseActiveSession extends StatelessWidget {
  const NurseActiveSession({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(

        width: 1.sw,
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        decoration: BoxDecoration(
            color: AppColors.mainWhiteColor,
            borderRadius: BorderRadius.circular(16.r)),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context,index){

              return  Column(
                children: [
                  Container(
                      height: 65.h,
                      width: 1.sw,
                     child: Row(
                        children: [
                          /// phone icon
                          Image(
                            image: const AssetImage("assets/images/phone_icon.png"),
                            width: 25.w,
                            height: 25.h,
                          ),
                          SizedBox(width: 19.w,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "iPhone XS",
                                style:
                                TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                              ),


                              /// phone location
                              Text("Edison, Unit States online",style: TextStyle(fontSize: 12.sp,color: Color(0xFF969696) ),)
                            ],
                          ),
                        ],
                      )
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 13.w),child: const Divider(color: Colors.grey,thickness: 1),)
                ],
              );
            })
    );
  }
}



