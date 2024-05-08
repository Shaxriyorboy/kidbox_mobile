import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ParentLoginController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController childNameController = TextEditingController();
  List<String> ganderList = <String>["Boy", "Girl"];
  DateTime date = DateTime(2016, 10, 26);
  bool isChooseDate = false;
  String gender = "gender".tr;
  String fullName = "full_name".tr;
  String childName = "enter_child_name".tr;
  String avatar = "";
  List<String> childAvatars = List.generate(
      12, (index) => "assets/images/child_avatar/child$index.png");

  void changeGenderDropdown(String? newValue) {
    gender = newValue ?? gender;
    update();
  }

  void changeDateTime(DateTime newDate) {
    date = newDate;
    isChooseDate = true;
    update();
  }

  /// #Dialog for date picker
  void showDialog(Widget child, BuildContext context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216.h,
              padding: EdgeInsets.only(top: 6.h),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: child,
            ));
  }

  void setAvatar(String userAvatar) {
    avatar = userAvatar;
    update();
    Get.back();
  }
}
