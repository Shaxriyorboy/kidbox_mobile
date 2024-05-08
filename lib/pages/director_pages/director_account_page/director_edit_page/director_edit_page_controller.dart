
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/director_pages/director_account_page/director_account_controller.dart';

class DirectorEditController extends GetxController {
  List<String> childAvatars = List.generate(12, (index) => "assets/images/user_avatar/user$index.png");
  String avatarPicture = '';

var accountController = Get.find<DirectorAccountController>();

TextEditingController nameController =TextEditingController();
TextEditingController phoneController =TextEditingController();
TextEditingController centerNameController =TextEditingController();
TextEditingController locationController =TextEditingController();

String chooseCityOrTown = "choose_city_or_town".tr;
String chooseDistrict = "choose_district".tr;
List<String>citys=["Shahrisabz","Toshkent"];
List<String>district=["Shahrisabz","Do'stlik"];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController = TextEditingController(text: accountController.name);
    phoneController = TextEditingController(text: accountController.phoneNumber);
    centerNameController = TextEditingController(text:accountController.centerName);
    locationController = TextEditingController(text:accountController.location);

  }

void changeCityOrTown(String? newValue) {
  chooseCityOrTown = newValue ?? chooseCityOrTown;
  update();
}

void changeDistrict(String? newValue) {
  chooseDistrict = newValue ?? chooseDistrict;
  update();
}

  int role = 0;

  void setAvatar(String role, int index) {
    avatarPicture = "assets/images/user_avatar/user$index.png";
    update();
  }
}