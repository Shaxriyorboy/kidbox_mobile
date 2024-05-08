import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/views/album_view_page.dart';
import 'director_album_controller.dart';
  /// #GridView
  Widget buildGridView(DirectorAlbumController ctrl) {
  return GridView.builder(
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 15.h,
      crossAxisSpacing: 9.w,
    ),
    itemCount: ctrl.photos.length,
    itemBuilder: (BuildContext context, int index) {
      return InkWell(
        onTap: ()=> Get.to(const AlbumViewPage(),),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: GridTile(
              footer: Container(
                height: 58.h,
                color: Colors.white,
                padding: EdgeInsets.all(10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(ctrl.photos.keys.elementAt(index), style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),),
                    Expanded(
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text("45 Photos", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "12.09.2021",
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              child: Container(
                height: 139.h,
                margin: EdgeInsets.only(bottom: 58.h),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          ctrl.photos.values.elementAt(index)),
                    )),
              )),
        ),
      );
    },
  );
}