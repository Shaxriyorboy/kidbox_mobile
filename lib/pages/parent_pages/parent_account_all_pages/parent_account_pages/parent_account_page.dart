import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/parent_pages/add_child_pages/add_child_page.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_account_all_pages/parent_account_pages/parent_account_controller.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_account_all_pages/parent_account_pages/parent_account_view.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/show_alert_dialog.dart';

class ParentAccountPage extends StatefulWidget {
  const ParentAccountPage({Key? key}) : super(key: key);

  @override
  State<ParentAccountPage> createState() => _ParentAccountPageState();
}

class _ParentAccountPageState extends State<ParentAccountPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ParentAccountController>(
        init: ParentAccountController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.mainBackgroundColor,
            body: FadeInUp(
              duration: const Duration(milliseconds: 300),
              child: Column(
                children: [
                  const ParentInfo(),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 64.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(left: 15.w),
                            height: 64.w,
                            width: 64.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                    color: AppColors.mainColorOrange,
                                    width: 3.w)),
                            child: index != 0
                                ? GestureDetector(
                                    child: Image(
                                      image: AssetImage("assets/images/child_avatar/child0.png"),
                                      height: 64.w,
                                      width: 64.w,
                                      fit: BoxFit.fitHeight,
                                    ),
                              onTap: (){

                              },
                                  )
                                : IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      color: AppColors.mainColorOrange,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      Get.to(AddChildPage());
                                    },
                                  ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      children: [
                        const KindergartenInfo(),
                        SizedBox(
                          height: 30.h,
                        ),
                        ParentFunction(controller: controller),

                        SizedBox(height: 40.h,),
                        Container(
                          alignment: Alignment.center,
                          height: 64.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.white
                          ),
                          child: InkWell(
                            onTap: (){
                              showAlertDialog(context: context, title: "Delete account", body: "Do you really want to delete the account?", confirm: controller.onDelete);
                             // controller.showLogOutDialog(context,"Delete account","Do you really want to delete the account?");
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                              title: Text("Delete Account",style: TextStyle(color: Colors.red,fontSize: 18.sp,fontWeight: FontWeight.w500),),
                              trailing: Icon(Icons.delete_outline,color: Colors.red,size: 30,),
                            ),
                          ),
                        ),
                        SizedBox(height: 132.h,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
