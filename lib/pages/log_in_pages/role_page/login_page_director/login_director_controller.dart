import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginDirectorController extends GetxController {
  final fullNameController = TextEditingController();
  final kindergartenController = TextEditingController();
  final locationController = TextEditingController();
  String fullName = "full_name".tr;
  String chooseCityOrTown = "choose_city_or_town".tr;
  String chooseDistrict = "choose_district".tr;
  String nameOfKindergarten = "name_of_kindergarten".tr;
  String kindergartenLocation = "kindergarten_location".tr;
  String avatar = "";
  List<String> userAvatars =
      List.generate(12, (index) => "assets/images/user_avatar/user$index.png");

  void changeName(String? newValue) {
    fullName = newValue ?? fullName;
    update();
  }

  void changeCityOrTown(String? newValue) {
    chooseCityOrTown = newValue ?? chooseCityOrTown;
    update();
  }

  void changeDistrict(String? newValue) {
    chooseDistrict = newValue ?? chooseDistrict;
    update();
  }

  void setAvatar(String userAvatar) {
    avatar = userAvatar;
    update();
    Get.back();
  }
}
