import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'parent_album_controller.dart';
import 'parent_album_page_view.dart';

class ParentAlbumPage extends StatefulWidget {
  const ParentAlbumPage({Key? key}) : super(key: key);

  @override
  State<ParentAlbumPage> createState() => _ParentAlbumPageState();
}

class _ParentAlbumPageState extends State<ParentAlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: GetBuilder<ParentAlbumController>(
        init: ParentAlbumController(),
          builder: (ctrl) {
            return Container(
              height: 1.sh,
              width: 1.sw,
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 55.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  /// #AppBar
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: Text("album".tr, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
                    ),
                    title: Text(""),
                    subtitle: Text(""),
                    trailing: Container(
                      height: 58.w,
                      width: 58.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: AppColors.mainColorOrange, width: 2.r),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/image.png"),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 500),
                      child: buildGridView(ctrl),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}