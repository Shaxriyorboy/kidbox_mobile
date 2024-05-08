import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_medical_request/director_medical_request_controller.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_medical_request/add_medical_request_page.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_medical_request/parent_medical_request_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

class ParentMedicalRequestPage extends StatefulWidget {
  const ParentMedicalRequestPage({Key? key}) : super(key: key);

  @override
  State<ParentMedicalRequestPage> createState() =>
      _ParentMedicalRequestPageState();
}

class _ParentMedicalRequestPageState
    extends State<ParentMedicalRequestPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ParentMedicalRequestController>(
        init: ParentMedicalRequestController(),
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
                    trailing: ElevatedButton.icon(
                      onPressed: () {
                        Get.to(() => const AddMedicalRequestPage(),
                            transition: Transition.rightToLeftWithFade,
                            duration: const Duration(milliseconds: 300));
                      },
                      icon: Icon(
                        Icons.add,
                        size: 22.r,
                        color: AppColors.mainColorBlack,
                      ),
                      label: Text(
                        "add".tr,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.mainColorBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0, backgroundColor: AppColors.transparent,
                          padding: EdgeInsets.zero,
                          shadowColor: AppColors.transparent),
                    ),
                  ),
                  SizedBox(height: 17.h,),
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
                                "Sympthom",
                                "Medication used",
                                "Frequency",
                                "Statrt date",
                                "Finish date",
                                "Description"
                              ].map((label) => Column(
                                      children: [
                                        TextField(
                                          maxLines: null,
                                          textInputAction:
                                              TextInputAction.newline,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.sp),
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  left: 15.w,
                                                  right: 15.h,
                                                  bottom: 10.h,
                                                  top: 12.h),
                                              border: InputBorder.none,
                                              label: Text(label),
                                              labelStyle: TextStyle(
                                                  color: Color(0xFF7E7E7E),
                                                  fontSize: 16.sp)),
                                        ),
                                        label != "Description"
                                            ? Divider(
                                                height: 0,
                                                thickness: 1,
                                                color: Color(0xFFB3B3B3),
                                                indent: 15.w,
                                                endIndent: 15.w,
                                              )
                                            : SizedBox.shrink(),
                                      ],
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
}
