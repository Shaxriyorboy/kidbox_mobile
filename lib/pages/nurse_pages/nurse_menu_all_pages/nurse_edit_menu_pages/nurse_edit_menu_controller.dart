import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NurseEditMenuController extends GetxController{
  List list = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
  final pageController = PageController();
  int selectedIndex = 0;
}