import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/home_pending_pages/home_pending_controller.dart';
import 'package:kidbox_mobile/views/calendar.dart';
import 'package:lottie/lottie.dart';

import 'home_pending_view.dart';

class HomePageWithPending extends StatefulWidget {
  const HomePageWithPending({Key? key}) : super(key: key);

  @override
  State<HomePageWithPending> createState() => _HomePageWithPendingState();
}

class _HomePageWithPendingState extends State<HomePageWithPending> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePendingController>(
        init: HomePendingController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: const Color(0xFFF7F7F7),
            body: Column(
              children: [
                ///#ListTile for name and Avatar
                const NameAndAvatar(),

                ///#Calendar
                Calendar(),

                ///#Lottie
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20.r),
                    child: Center(
                      child: Lottie.asset("assets/lottie_animations/pending_page_anim.json"),
                    ),
                  ),
                ),

                ///#Pending Text
                Center(
                  child: Text(
                    "pending_auth".tr,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.sp),
                  ),
                ),
                SizedBox(height: 182.h,),
              ],
            ),
          );
        });
  }
}
