
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/nurse_pages/nurse_account/nurse_account_page/nurse_account_controller.dart';

class NurseEditController extends GetxController{

  List<String> childAvatars=List.generate(12, (index) => "assets/images/user_avatar/user$index.png");
  String avatarPicture = '';

  var accountController = Get.find<NurseAccountController>();

  TextEditingController nameController =TextEditingController();
  TextEditingController phoneController =TextEditingController();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController = TextEditingController(text: accountController.name);
    phoneController = TextEditingController(text: accountController.phoneNumber);
  }

  void setAvatar(String role, int index) {
    avatarPicture = "assets/images/user_avatar/user$index.png";
    update();
  }
}