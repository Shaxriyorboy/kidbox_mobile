import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/role_controller.dart';
import 'package:kidbox_mobile/pages/log_in_pages/role_page/role_view.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';
import 'director_edit_page_controller.dart';

/// directorImage ui
class DirectorEditImage extends StatelessWidget {
  DirectorEditController ctrl;
  DirectorEditImage({Key? key,required this.ctrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.h,
      color: AppColors.mainWhiteColor,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(top: 4.h, bottom: 20.h),
      child: Hero(
        tag: "director",
        child: GestureDetector(
          onTap: (){
            showMaterialDialog(context, ctrl.childAvatars, Get.find<RoleController>(),);
          },
          child: Container(
            height: 109.h,
            width: 109.h,
            decoration: BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.circular(109.h),
              //image:
            ),
            child: Image.asset(
              (ctrl.avatarPicture.isEmpty)
                  ? "assets/images/user_avatar/user2.png"
                  :ctrl.avatarPicture,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

/// director info ui
class DirectorEditInfo extends StatelessWidget {
  DirectorEditController controller;
   DirectorEditInfo({

    Key? key, required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 157.h,
      width: 1.sw,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        children: [
          Container(
            height: 83.h,
            width: 1.sw,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: const Color(0xFFB3B3B3), width: 1.sp))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "name".tr,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 6.h,
                ),

                /// input  name of director
                TextField(
                 controller:controller.nameController ,
                  scrollPadding: EdgeInsets.zero,
                  textInputAction: TextInputAction.next,
                  style:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  decoration: const InputDecoration(
                    filled: true,

                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 1.sw,
            height: 74.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "phone_number".tr,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 6.h,
                ),
                /// input  phone number of director
                TextField(
                  controller: controller.phoneController,
                  scrollPadding: EdgeInsets.zero,
                  textInputAction: TextInputAction.next,
                  style:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  decoration: const InputDecoration(
                    filled: true,

                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// KindergartenInfo ui
class KindergartenEditInfo extends StatelessWidget {
  DirectorEditController controller;
   KindergartenEditInfo({
    Key? key,required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        children: [
          Container(
            height: 83.h,
            width: 1.sw,
            decoration: BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: const Color(0xFFB3B3B3), width: 1.sp)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "center_name".tr,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 6.h,
                ),
                /// input center name place
                TextField(
                  controller:controller.centerNameController ,
                  scrollPadding: EdgeInsets.zero,
                  textInputAction: TextInputAction.next,
                  style:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  decoration: const InputDecoration(
                    filled: true,

                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 83.h,
            width: 1.sw,
            decoration: BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: const Color(0xFFB3B3B3), width: 1.sp)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "city/region".tr,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
                /// input center name place
                dropDownButton(
                    controller.citys, controller, controller.chooseCityOrTown, controller.changeCityOrTown),
              ],
            ),
          ),
          Container(
            height: 83.h,
            width: 1.sw,
            decoration: BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: const Color(0xFFB3B3B3), width: 1.sp)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "district".tr,
                  style:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
                /// #Choose district
                dropDownButton(
                    controller.district, controller, controller.chooseDistrict, controller.changeDistrict),
              ],
            ),
          ),



          Container(
            width: 1.sw,
            height: 81.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "location".tr,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 6.h,
                ),
                /// input location name place
                TextField(
                  controller: controller.locationController,
                  scrollPadding: EdgeInsets.zero,
                  textInputAction: TextInputAction.next,
                  style:
                  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  decoration: const InputDecoration(
                    filled: true,

                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
Widget dropDownButton(List<String> list, var controller, String value, void Function(String?) function) {
  return Container(
    height: 40.h,
    alignment: Alignment.center,
    child: DropdownButtonHideUnderline(

      child: DropdownButton<String>(

        alignment: Alignment.center,
        borderRadius: BorderRadius.circular(10.r),
        isExpanded: true,
        hint: Text(value,style:  TextStyle(fontSize: 18.sp,color: Colors.black, fontWeight: FontWeight.w600),),
        style: TextStyle(fontSize: 16.sp, color: Colors.black, fontFamily: "Poppins"),
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        onChanged: function,
        items: list.map((String tag) {
          return DropdownMenuItem<String>(
            value: tag,
            child: Text(
              tag,
            ),
          );
        }).toList(),
      ),
    ),
  );
}
