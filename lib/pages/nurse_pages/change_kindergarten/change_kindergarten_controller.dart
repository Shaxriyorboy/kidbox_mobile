import 'package:get/get.dart';

class ChangeKindergartenController extends GetxController{
  String chooseCityOrTown = "choose_city_or_town".tr;
  String chooseDistrict = "choose_district".tr;
  String nameOfKindergarten = "name_of_kindergarten".tr;


  void changeChooseCityOrTown(String? value){
    chooseCityOrTown = value ?? chooseCityOrTown;
    update();
  }

  void changeChooseDistrict(String? value){
    chooseDistrict = value ?? chooseDistrict;
    update();
  }

  void changeNameOfKindergarten(String? value){
    nameOfKindergarten = value ?? nameOfKindergarten;
    update();
  }
}