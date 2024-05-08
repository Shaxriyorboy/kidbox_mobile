import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_account_page/director_account_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

import 'director_account_view.dart';

class DirectorAccountPage extends StatefulWidget {
  const DirectorAccountPage({Key? key}) : super(key: key);

  @override
  State<DirectorAccountPage> createState() => _DirectorAccountPageState();
}

class _DirectorAccountPageState extends State<DirectorAccountPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DirectorAccountController>(
        init: DirectorAccountController(),
        builder: (_controller) {
          return FadeInUp(
            duration: const Duration(milliseconds: 300),
            child: Scaffold(
              backgroundColor: AppColors.mainBackgroundColor,
              body: Column(
                children: [
                   DirectorInfo(controller:_controller),
                  Expanded(child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                         KindergartenInfo(controller: _controller,),
                        SizedBox(
                          height: 30.h,
                        ),
                        const DirectorFunction(),
                        SizedBox(height: 132.h,)
                      ],
                    ),
                  )),

                ],
              ),
            ),
          );
        });
  }
}
