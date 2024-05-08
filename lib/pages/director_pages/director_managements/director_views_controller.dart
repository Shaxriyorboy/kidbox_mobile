import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DirViewsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  int indexTab = 0;

  bool isExpandInvite = false;
  bool isExpandApproved = false;

  set isExpandedInvite(bool value) {
    isExpandInvite = value;
    update();
  }

  set isExpandedApproved(bool value) {
    isExpandApproved = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 3);
    tabController.addListener(() {
      indexTab = tabController.index;
      update();
    });
  }

  @override
  dispose() {
    super.dispose();
    tabController.dispose();
  }
}
