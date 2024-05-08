import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_album_page/director_create_album/director_create_album_page.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/no_data.dart';
import '../../../views/no_data.dart';
import 'director_album_controller.dart';
import 'director_album_page_view.dart';

class DirectorAlbumPage extends StatefulWidget {
  const DirectorAlbumPage({Key? key}) : super(key: key);

  @override
  State<DirectorAlbumPage> createState() => _DirectorAlbumPageState();
}

class _DirectorAlbumPageState extends State<DirectorAlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: GetBuilder<DirectorAlbumController>(
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
                  /// #Create Album
                   TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {Get.to(DirectorCreateAlbumPage());},
                    child: Text("create_album".tr, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  /// #View all classes
                   Container(
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(15.r),
                         color: Colors.white
                     ),
                     child: Theme(
                       data: ThemeData().copyWith(dividerColor: Colors.transparent),
                       child: ExpansionTile(
                         title: Text("view_all_classes".tr,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500),),
                         children: [1,2,3].map((e) => Column(
                           children: const [
                             Divider(color: Colors.grey,thickness: 0.5,height: 1,indent: 15,endIndent: 15,),
                             ListTile(title: Text("Group Apelsin"),),
                           ],
                         )).toList(),
                       ),
                     ),
                   ),
                  /// #Not Found
                  (!true)? addItem(goToPage: const DirectorCreateAlbumPage()):
                  /// #GridView
                  Expanded(
                     child: FadeInUp(
                       duration: const Duration(milliseconds: 500),
                       child: buildGridView(ctrl),
                     ),
                   )
                ],
              ),
            );
          }),
    );
  }
}
