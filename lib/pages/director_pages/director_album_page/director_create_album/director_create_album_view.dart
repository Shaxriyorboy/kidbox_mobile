
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'director_create_album_controller.dart';

    /// #CreateAlbum
    Widget createAlbum(DirectorCreateAlbumController ctrl,BuildContext context) {
      return Container(
        margin: EdgeInsets.only(top: 30.h,bottom: 30.h),
        height: 100.h,
        child: Row(
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.mainColorOrange, padding: EdgeInsets.zero,
                  fixedSize: Size(90.w, 90.w),
                  side: BorderSide(width: 1.r,color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),)
              ),
              onPressed: () => ctrl.pickerBottomSheet(context),
              child: Image.asset("assets/images/camera.png",fit: BoxFit.cover,height: 60.h,width: 60.w,),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: ctrl.imageFileList.length,
                  itemBuilder: (context,index){
                    return Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.w),
                          height: 90.w,width: 90.w,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Image.file(File(ctrl.imageFileList[index].path),fit: BoxFit.cover,),
                        ),
                        Positioned(
                          top: 0, right: 0,
                          child: IconButton(
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.only(top: 3.w,right: 3.w),
                            icon: const Icon(CupertinoIcons.xmark_circle,color: Colors.white,),
                            onPressed: () => ctrl.removeElement(index),
                          ),
                        ),
                      ],
                    );
                  }
              ),
            ),
          ],
        ),
      );
    }
    /// #AppBar
    Widget appBarAlbum(){
      return ButtonBar(
        buttonPadding: EdgeInsets.zero,
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent, backgroundColor: AppColors.mainBackgroundColor,
              padding: EdgeInsets.zero,
              elevation: 0,
            ),
            onPressed: (){ Get.back();
            },
            label: Text("album".tr,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600,color: Colors.black),),
            icon:  Icon(Icons.arrow_back_ios,size: 24.sp,color: Colors.black,),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)
              ), backgroundColor: AppColors.mainColorOrange,
              minimumSize: Size(90.w, 45.h),
              elevation: 0,
            ),
            onPressed: (){},
            child: Text("save".tr,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600,color: Colors.black),),
          ),
        ],
      );
    }
    /// #TextFild
    Widget textFiled(TextEditingController textController, String value) {
      return Container(
        height: 65.h,
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 10.h,top: 6.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11.r),
        ),
        child: TextField(
          controller: textController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10.w),
            border: InputBorder.none,
            hintText: value,
            hintStyle: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.w400,color: Colors.black),
          ),
        ),
      );
    }
    /// #ChoseClass
    Widget choseClass(DirectorCreateAlbumController ctrl,BuildContext context){
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white
    ),
    child: Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text("chose_class".tr,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600),),
        children: [1,2,3].map((e) => Column(
          children: [
            const Divider(color: Colors.grey,thickness: 0.5,height: 1,indent: 15,endIndent: 15,),
            ListTile(
              onTap: (){
                ctrl.showBottomSheet(context);
              },
              leading: Text("Group: Apelsin",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),),
              trailing: Icon(Icons.arrow_forward_ios_outlined,size: 22.sp,),
            ),
          ],
        )).toList(),
      ),
    ),
  );
}
