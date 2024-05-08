import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RoleController extends GetxController {
  var pageController = PageController();
  String avatar = "";
  int role = 0;

  // void setAvatar(String role, int index) {
  //   if (role == 'Parent') {
  //     Get.find<ParentLoginController>().avatarPicture ="assets/images/child_avatar/child$index.png" ;
  //     Get.find<ParentLoginController>().update();
  //   } else if (role == 'Nurse') {
  //     Get.find<LoginNurseController>().avatarPicture = "assets/images/user_avatar/user$index.png";
  //     Get.find<LoginNurseController>().update();
  //   } else if (role == 'Director') {
  //     Get.find<LoginDirectorController>().avatarPicture = "assets/images/user_avatar/user$index.png";
  //     Get.find<LoginDirectorController>().update();
  //   }
  //   Get.back();
  // }
  void setAvatar(String userAvatar){
    avatar = userAvatar;
    update();
    Get.back();
  }



}
