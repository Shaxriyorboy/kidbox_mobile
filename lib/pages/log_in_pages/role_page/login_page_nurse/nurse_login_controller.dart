import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginNurseController extends GetxController {
  final textController = TextEditingController();
  String fullName = "full_name".tr;
  String chooseCityOrTown = "choose_city_or_town".tr;
  String chooseDistrict = "choose_district".tr;
  String nameOfKindergarten = "name_of_kindergarten".tr;
  String avatar = "";
  List<String> userAvatars = List.generate(12, (index) => "assets/images/user_avatar/user$index.png");

  void changeCityOrTown(String? newValue) {
    chooseCityOrTown = newValue ?? chooseCityOrTown;
    update();
  }

  void changeDistrict(String? newValue) {
    chooseDistrict = newValue ?? chooseDistrict;
    update();
  }

  void changeNameOfKindergarten(String? newValue) {
    nameOfKindergarten = newValue ?? nameOfKindergarten;
    update();
  }

  void setAvatar(String userAvatar){
    avatar = userAvatar;
    update();
    Get.back();
  }

}
