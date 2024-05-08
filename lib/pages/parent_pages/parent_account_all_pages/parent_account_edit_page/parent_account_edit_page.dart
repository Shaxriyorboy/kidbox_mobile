import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/nurse_pages/change_kindergarten/change_kindergarten_page.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_account_all_pages/parent_account_edit_page/parent_account_edit_page_controller.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_account_all_pages/parent_account_edit_page/parent_account_edit_page_view.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/show_alert_dialog.dart';

class ParentEditPage extends StatelessWidget {
  const ParentEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ParentEditController>(
        init: ParentEditController(),
        builder: (ctrl) {
          return Scaffold(
            backgroundColor: const Color(0xFFF7F7F7),

            /// director ui
            body: SizedBox(
              height: 1.sh,
              child: Column(
                children: [
                  ParentEditImage(
                    ctrl: ctrl,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          const ParentEditInfo(),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 64.h,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 15.w),
                                    height: 64.h,
                                    width: 64.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(32.r),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: AppColors.mainColorOrange,
                                            width: 3.w)),
                                    child: GestureDetector(
                                      child: Image(
                                        image: AssetImage(
                                          "assets/images/child_avatar/child0.png",
                                        ),
                                        height: 64.h,
                                        width: 64.w,
                                        fit: BoxFit.fill,
                                      ),
                                      onTap: () {},
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const KindergartenEditInfo(),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 64.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white),
                            child: InkWell(
                              onTap: () {
                                Get.to(() => ChangeKindergartenPage());
                              },
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15.w),
                                title: Text(
                                  "Change Kindergarten",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: Icon(
                                  Icons.sync,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.only(right: 15.w),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r)), backgroundColor: AppColors.mainColorOrange,
                                  elevation: 0,
                                  fixedSize: Size(90.w, 38.h)),
                              child: Text(
                                "save".tr,
                                style: TextStyle(
                                    color: AppColors.mainColorBlack,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            resizeToAvoidBottomInset: true,
          );
        });
  }
}
