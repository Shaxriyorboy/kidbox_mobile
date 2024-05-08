import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

  /// #NoticeViewPage
 class NoticeViewPage extends StatelessWidget {
  const NoticeViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset("assets/images/creation.png",height: 310.h,width: 1.sw,fit: BoxFit.cover,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h,),
              ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  elevation: 0, backgroundColor: Colors.black.withOpacity(0.25),
                  padding: EdgeInsets.only(left: 6.w),
                  fixedSize: Size(45.w,45.w),
                  shape: const CircleBorder(),
                ),
                child: Icon(Icons.arrow_back_ios,size: 25.sp,color: Colors.white,),
              ),
              SizedBox(height: 190.h,),
              Container(
                width: 1.sw,
                padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 30.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your child Approved",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),),
                    SizedBox(height: 20.h,),
                    Text("Dear Madam, You have been randomly selected for further processing in the Diversity Immigrant Visa Program for the fiscal year 2023Dear Madam, You have been randomly selected for further processing in the Diversity he fiscal year 2023 Dear Madam, You have been randomly Immigrant Visa Program for the fiscal year 2023(October 1, 2022 to September 30, 2023)",
                      style: TextStyle(fontSize: 15.sp),),
                    SizedBox(height: 20.h,),
                    Align(
                      alignment: Alignment.bottomRight,
                        child: Text("2022-05-16 | 10:31",style: TextStyle(fontSize: 14.sp),)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}