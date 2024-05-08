
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_notice_page/nurse_notice_controller.dart';

 /// #StaggeredViewPage
 class MasonryViewpage extends StatelessWidget {
   const MasonryViewpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GetBuilder<NurseNoticeController>(
        builder: (ctrl) {
          return Stack(
            fit: StackFit.expand,
            children: [
              /// #Image
              InteractiveViewer(
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/creation.png"),
                      )
                  ),
                ),
              ),

              /// #Button
              Column(
                children: [
                  SizedBox(height: 40.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      ElevatedButton(
                        onPressed: () => ctrl.startDownLoad(),
                        style: ElevatedButton.styleFrom(
                          elevation: 0, backgroundColor: Colors.black.withOpacity(0.25),
                          fixedSize: Size(45.w,45.w),
                          shape: const CircleBorder(),
                        ),
                        child: Icon(Icons.save_alt,size: 28.sp,color: Colors.white,),
                      ),
                    ],
                  ),
                ],
              ),
             if(ctrl.percent > 0) AnimatedOpacity(
               duration: const Duration(seconds: 5),
               opacity: ctrl.percent.round() == 100 ? 0: 1,
               child: Column(
                 children: [
                   SizedBox(height: 30.h,),
                   LinearProgressIndicator(
                     value: ctrl.percent,
                     backgroundColor: Colors.grey,color: Colors.amber,),
                   Text("${ctrl.percent.floor()} %",
                        style: TextStyle(color: Colors.black,fontSize: 28.sp,fontWeight: FontWeight.w500),),
                 ],
               ),
             ),
            ],
          );
        }
      ),
    );
  }
}



