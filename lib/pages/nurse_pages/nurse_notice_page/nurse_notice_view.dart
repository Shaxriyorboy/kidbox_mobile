
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/views/notice_view_page.dart';

import '../../../views/notice_view_page.dart';

  /// #ListTile
   Widget buildListTile() {
  return Expanded(
    child: FadeInUp(
      duration: const Duration(milliseconds: 500),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Get.to(const NoticeViewPage()),
              child: Container(
                margin: EdgeInsets.only(bottom: 15.h,),
                padding: EdgeInsets.all(10.r),
                width: 1.sw,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Your child Approved", style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),),
                            SizedBox(height: 5.h,),
                            Text("Dear Madam, You have been randomly selected for further processing in the Diversity Immigrant Visa Program for the fiscal year 2023 (October 1, 2022 to September 30, 2023).",
                              style: TextStyle(fontSize: 13.sp,),
                            ),
                          ],
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 70.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(10.r),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/creation.png"),
                              )),
                        ),
                        SizedBox(height: 20.h,),
                        Text(
                          "2022-05-16 | 10:31",
                          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    ),
  );
}