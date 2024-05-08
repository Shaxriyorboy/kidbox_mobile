import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_report_pages/parent_add_report_pages/parent_add_report_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

Widget createAlbum(ParentAddReportController ctrl, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 8.h, bottom: 30.h),
    padding: EdgeInsets.only(left: 10.h),
    height: 110.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.r),
      color: Colors.white,
    ),
    child: Row(
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.mainColorOrange, padding: EdgeInsets.zero,
              fixedSize: Size(90.w, 90.w),
              side: BorderSide(width: 1.r, color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              )),
          onPressed: () {
            ctrl.pickerBottomSheet(context);
          },
          child: Image.asset(
            "assets/images/camera.png",
            fit: BoxFit.cover,
            height: 60.h,
            width: 60.w,
          ),
        ),
        Expanded(
          child: ctrl.imageFileList.length != 0
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: ctrl.imageFileList.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 10.w, top: 10.h, bottom: 10.h),
                          height: 90.h,
                          width: 90.w,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Image.file(
                            File(ctrl.imageFileList[index].path),
                            fit: BoxFit.cover,
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 10.w, top: 10.h, bottom: 10.h),
                            child: Icon(
                              Icons.highlight_remove,
                              color: Colors.black,
                              size: 20,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.r),
                              color: Colors.white,
                            ),
                            height: 22.w,
                            width: 22.w,
                            alignment: Alignment.center,
                          ),
                          onTap: () {
                            ctrl.deleteImage(index);
                          },
                        ),
                      ],
                    );
                  })
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Add at least one image",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
        ),
      ],
    ),
  );
}
