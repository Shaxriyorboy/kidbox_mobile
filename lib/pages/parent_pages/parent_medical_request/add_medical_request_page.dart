import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/parent_pages/parent_medical_request/parent_medical_request_view.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

import 'parent_medical_request_controller.dart';

class AddMedicalRequestPage extends StatefulWidget {
  const AddMedicalRequestPage({Key? key}) : super(key: key);

  @override
  State<AddMedicalRequestPage> createState() =>
      _AddMedicalRequestPageState();
}

class _AddMedicalRequestPageState extends State<AddMedicalRequestPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ParentMedicalRequestController>(
        init: ParentMedicalRequestController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.mainBackgroundColor,
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 55.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      height: 25.h,
                    ),
                    ChildAccountInfoForAppBar(),
                    SizedBox(height: 25.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("Diagnostic"),
                        SizedBox(height: 5.h,),
                        // syptom field
                        TextFieldForMedicalRequest(hintText: "diagnos_eg".tr),
                        SizedBox(height: 20.h,),
                        Text("Medication used"),
                        SizedBox(height: 5.h,),
                        // for medication used field
                        TextFieldForMedicalRequest(hintText: "med_used".tr),
                        SizedBox(height: 20.h,),
                        Text("Description"),
                        SizedBox(height: 6.h),
                        // for discreption field
                        TextFieldForMedicalRequest(hintText: "description_eg".tr),
                        SizedBox(height: 20.h,),
                        Text("Frequncy"),
                        SizedBox(height: 6.h,),
                        // for choose frequency  // necha mahal berishni tanlash uchun

                        dropDownButton([], controller, controller.frequency, controller.changeFrequency),
                        SizedBox(height: 20.h,),
                        Text("Choose date"),
                        // for start date
                        SizedBox(height: 6.h,),
                        chosenDateForMedicalRequest(context,controller, 'Start'),
                        Divider(
                          thickness: 1,
                        ),
                        chosenDateForMedicalRequest(context,controller, 'Finish'),











                        SizedBox(height: 20.h,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ButtonForSave(buttonText: "Save"),
                          ],
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
