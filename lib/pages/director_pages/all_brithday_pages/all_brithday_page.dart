import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/all_brithday_pages/all_brithday_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

class DirectorAllBrithdayPage extends StatefulWidget {
  const DirectorAllBrithdayPage({Key? key}) : super(key: key);

  @override
  State<DirectorAllBrithdayPage> createState() => _DirectorAllBrithdayPageState();
}

class _DirectorAllBrithdayPageState extends State<DirectorAllBrithdayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: GetBuilder<DirectorAllBrithdayController>(
        init: DirectorAllBrithdayController(),
        builder: (controller){
          return Container(
            height: 1.sh,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.only(top: 55.h,bottom: 5.h),
                  title: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                          child: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
                      Text(
                        "all_brithday".tr,
                        style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
                      ),
                    ],
                  ),
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
                
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 18.h),
                    itemCount: 10,
                      itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.only(top: 18.h),
                      padding: EdgeInsets.only(left: 15.w,right: 15.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      width: 1.sw,
                      height: 90.h,
                      child: Row(
                        children: [
                          Container(
                            child: const Image(
                              image: AssetImage("assets/images/image.png"),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            height: 60.h,
                            width: 60.h,
                          ),
                          SizedBox(width: 15.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Asadullo Shonazarov",
                                style:
                                TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                              ),
                              Text(
                                "Banana",
                                style:
                                TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
                              ),
                              Text(
                                "12.04.2018",
                                style:
                                TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
