import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

import 'parent_all_report_controller.dart';

class CustomPanel extends StatelessWidget {
  ParentReportController controller;
  int index;
   CustomPanel({Key? key,required this.controller,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          key: PageStorageKey(index.toString()),
          tilePadding: EdgeInsets.symmetric(horizontal: 20.w),
          leading:   CircleAvatar(
            radius: 27.5.r,
            backgroundColor: Colors.blue,
          ),
          title:Text("Sherzod Muhammadov", style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.mainColorBlack),),
          subtitle: Text("Group", style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.colorTextLightGrey),),
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 6.h,),
                  Container(
                    height: 314.h,
                    width: 314.h,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20.r),
                      // put image here
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text("Hello, and welcome to the WMF integration environment known as Beta Cluster. The software running this wiki is automatically updated whenever there is a change .Bulletin board, projects, resources and activities covering a wide range."
                    ,
                    style: TextStyle(fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: AppColors.colorTextLightGrey,
                      fontSize: 15.sp,),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("2022-05-16 | 10:31"),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}







