import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NurseHomePendingController extends GetxController {

  PageController? pageController;

  DateTime currentDate = DateTime.now();

  set date(DateTime dateTime){
    currentDate = dateTime;
    update();
  }

  DateTime get date => currentDate;

  @override
  void onInit() {
    super.onInit();
  }

}
