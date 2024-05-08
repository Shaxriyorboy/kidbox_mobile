import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_medical_request/director_medical_request_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

class DirectorMedicalRequestPage extends StatefulWidget {
  const DirectorMedicalRequestPage({Key? key}) : super(key: key);

  @override
  State<DirectorMedicalRequestPage> createState() =>
      _DirectorMedicalRequestPageState();
}

class _DirectorMedicalRequestPageState
    extends State<DirectorMedicalRequestPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DirectorMedicalRequestController>(
        init: DirectorMedicalRequestController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.mainBackgroundColor,
            body: Container(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 55.h),
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    title: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_sharp,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "medical_request".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: BouncingScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 20.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: Colors.white),
                          child: Theme(
                            data: ThemeData()
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              iconColor: Colors.black,
                              textColor: Colors.black,
                              leading: Container(
                                height: 58.w,
                                width: 58.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppColors.colorGrey, width: 2.r),
                                  image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/image.png"),
                                  ),
                                ),
                              ),
                              title: Text(
                                "Kimsanboy",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                "banana",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFADB5BD)),
                              ),
                              children: [
                                {"Sympthom":"Shamollash"},
                                {"Medication used":"Antigripin"},
                                {"Frequency":"2 times"},
                                {"Statrt date":"15.05.2022"},
                                {"Finish date":"17.05.2022"},
                                {"Description":"After the lunch"}
                              ].map((label) => Padding(
                              padding: EdgeInsets.symmetric(horizontal:15.r),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(label.keys.elementAt(0),style: TextStyle(color: Colors.grey,fontSize: 12.sp,fontWeight: FontWeight.w400),),
                                  Text(label.values.elementAt(0),style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),),
                                  label!="Description"?Divider(color: Colors.black,):Divider(color: Colors.white,),
                                ],
                              ),
                            ),
                                  )
                                  .toList(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Padding medicalItem(String label,String body) {
    return Padding(
                              padding: EdgeInsets.symmetric(horizontal:15.r),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(label,style: TextStyle(color: Colors.grey,fontSize: 12.sp,fontWeight: FontWeight.w400),),
                                  Text(body,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),),
                                  label!="Description"?Divider(color: Colors.black,):Divider(color: Colors.white,),
                                ],
                              ),
                            );
  }
}
