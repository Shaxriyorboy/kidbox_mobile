import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/login_page_director/director_add_group_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/login_page_director/director_add_group_page.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/login_page_director/login_director_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/login_page_nurse/nurse_login_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/login_page_parent/choose_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/login_page_parent/parent_login_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'login_page_director/login_director_page.dart';
import 'login_page_nurse/nurse_login_page.dart';
import 'login_page_parent/choose_page.dart';
import 'login_page_parent/parent_login_page.dart';
import 'role_view.dart';
import 'role_controller.dart';

class RolePage extends StatefulWidget {
  const RolePage({Key? key}) : super(key: key);

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  @override
  void initState() {
    super.initState();
    Get.find<ParentLoginController>();
    Get.find<LoginDirectorController>();
    Get.find<LoginNurseController>();
    Get.find<ChooseController>();
    Get.find<DirectorAddGroupController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainColorOrange,
      body: GetBuilder<RoleController>(
          init: RoleController(),
          builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Text(
                  "choose_your_role".tr,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),

                /// #Role
                buildRole(controller),

                Expanded(
                  child: SizedBox(
                    width: 1.sw,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller.pageController,
                      children: const [
                        ParentLogin(),
                        ChoosePage(),
                        LoginNursePage(),
                        LoginDirectorPage(),
                        DirectorAddGroupPage(),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
