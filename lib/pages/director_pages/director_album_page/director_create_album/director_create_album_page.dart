import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_album_page/director_create_album/director_create_album_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'director_create_album_view.dart';

class DirectorCreateAlbumPage extends StatefulWidget {
  const DirectorCreateAlbumPage({Key? key}) : super(key: key);

  @override
  State<DirectorCreateAlbumPage> createState() => _DirectorCreateAlbumPageState();
}

class _DirectorCreateAlbumPageState extends State<DirectorCreateAlbumPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DirectorCreateAlbumController>(
        builder: (ctrl) {
          return Scaffold(
            backgroundColor: AppColors.mainBackgroundColor,
            body: ListView(
              padding: EdgeInsets.only(top: 45.h,right: 15.w,left: 15.w),
              physics: const BouncingScrollPhysics(),
              children: [
                /// #AppBar
                appBarAlbum(),

                /// #Add Notice
                createAlbum(ctrl,context),
                /// #Title
                Text("title".tr,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),

                textFiled(ctrl.titleController, ctrl.title),
                SizedBox(height: 20.h,),

                /// #Groups
                choseClass(ctrl,context),
              ],
            ),
          );
        }
      );
  }
}

