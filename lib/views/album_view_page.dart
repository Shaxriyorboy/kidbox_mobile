import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/staggered_view_page.dart';

 /// #AlbumViewPage
 class AlbumViewPage extends StatelessWidget {
  const AlbumViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// #Button
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent, backgroundColor: AppColors.mainBackgroundColor,
              padding: EdgeInsets.only(left: 20.w,top: 55.h),
              elevation: 0,
            ),
            onPressed: () => Get.back(),
            label: Text("album".tr, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.black),),
            icon: Icon(Icons.arrow_back_ios, size: 24.sp, color: Colors.black,),
          ),

          /// #MasonryGridView
          Expanded(
              child: FadeInUp(
                duration: const Duration(milliseconds: 500),
                child: MasonryGridView.count(
                  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 6,
                  crossAxisCount: 2,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () =>Get.to( const MasonryViewpage()),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                        child: Image.asset("assets/images/creation.png"),
                      ),
                    );
                  },
                ),
              ),
          ),
        ],
      ),
    );
  }
}
