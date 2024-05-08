import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/login_page_parent/choose_page.dart';
import 'package:kidbox_mobile/pages/nurse_pages/change_kindergarten/change_kindergarten_page.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'package:kidbox_mobile/views/show_alert_dialog.dart';
import 'nurse_edit_controller.dart';
import 'nurse_edit_view.dart';


class NurseEditPage extends StatelessWidget {
  const NurseEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NurseEditController>(
        init: NurseEditController(),
        builder: (_controller) {
          return Scaffold(
            backgroundColor: const Color(0xFFF7F7F7),

            /// nurse ui
            body: SizedBox(
              height: 1.sh,
              child: Column(
                children: [
                  NurseEditImage(ctrl: _controller,),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child:  Column(
                        children: [
                          SizedBox(height: 30.h,),
                           NurseEditInfo(controller:_controller),

                          SizedBox(height: 30.h,),
                          Container(
                            alignment: Alignment.center,
                            height: 64.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.white
                            ),
                            child: InkWell(
                              onTap: (){
                                showAlertDialog(context: context, title: "change_kindergarten", body: "Do you really want to change kindergarten?", confirm: (){
                                  Get.to(ChangeKindergartenPage());
                                });
                              },
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                                title: Text("change_kindergarten",style: TextStyle(color: Colors.red,fontSize: 18.sp,fontWeight: FontWeight.w500),),
                                trailing: Icon(Icons.sync,color: Colors.red,size: 20.sp,),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          Container(
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.only(right: 15.w),
                            child: ElevatedButton(onPressed: () { Navigator.pop(context); }, style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r)), backgroundColor: AppColors.mainColorOrange,
                                elevation: 0,
                                fixedSize: Size(90.w, 38.h)),
                              child: Text("save".tr,style:TextStyle(color:AppColors.mainColorBlack,fontSize: 18.sp,fontWeight: FontWeight.w500 ) ,),
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

