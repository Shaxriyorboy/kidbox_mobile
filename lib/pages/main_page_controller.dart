import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/home_page/director_home_page.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_account/nurse_account_page/nurse_account_page.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_album_page/nurse_album_page.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_home_page/nurse_home_page.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_notice_page/nurse_notice_page.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_account_all_pages/parent_account_pages/parent_account_page.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_album_page/parent_album_page.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_home_page/parent_home_page.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_notice_pages/parent_notice_page.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'director_pages/director_account_page/director_account_page.dart';
import 'director_pages/director_album_page/director_album_page.dart';
import 'director_pages/director_notice_page/director_notice_page.dart';
import 'director_pages/home_pending_pages/home_pending_page.dart';

class MainPageController extends GetxController {
  List<Widget> parents = const[
    ParentHomePage(),
    ParentAlbumPage(),
    ParentNoticePage(),
    ParentAccountPage(),
  ];
  List<Widget> nurse = const[
    NurseHomePage(),
    NurseAlbumPage(),
    NurseNoticePage(),
    NurseAccountPage(),
  ];
  List<Widget> director = const[
    (!true)? HomePageWithPending(): DirectorHomePage(),
    DirectorAlbumPage(),
    DirectorNoticePage(),
    DirectorAccountPage(),
  ];

  final pageController = PageController();
  int bottomIndex = 0;


 /// #Button
  ElevatedButton button(int index) {
    return ElevatedButton(
        onPressed: () {
          bottomIndex = index;
          update();
          pageController.jumpToPage(bottomIndex);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(50.w, 50.h), backgroundColor: bottomIndex == index ? AppColors.mainColorOrange : Colors.white,
          maximumSize: Size(50.w, 50.h),
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
        ),
        child: Image.asset(
          index == 0
              ? "assets/images/home.png"
              : index == 1
                  ? "assets/images/album.png"
                  : index == 2
                      ? "assets/images/news.png"
                      : "assets/images/user.png",
          height: index == 2? 29.w:27.w,
          width: index == 2? 29.w:27.w,
          color: bottomIndex == index ? Colors.white : Colors.grey,
        ));
  }
}
