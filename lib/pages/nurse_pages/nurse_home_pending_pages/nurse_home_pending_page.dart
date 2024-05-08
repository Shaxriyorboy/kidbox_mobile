import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_home_pending_pages/nurse_home_pending_controller.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_home_pending_pages/nurse_home_pending_view.dart';
import 'package:kidbox_mobile/views/calendar.dart';
import 'package:lottie/lottie.dart';

class NurseHomePageWithPending extends StatefulWidget {
  const NurseHomePageWithPending({Key? key}) : super(key: key);

  @override
  State<NurseHomePageWithPending> createState() => _NurseHomePageWithPendingState();
}

class _NurseHomePageWithPendingState extends State<NurseHomePageWithPending> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NurseHomePendingController>(
        init: NurseHomePendingController(),
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
