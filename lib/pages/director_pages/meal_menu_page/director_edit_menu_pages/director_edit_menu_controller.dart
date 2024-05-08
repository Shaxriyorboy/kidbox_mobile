import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DirectorEditMenuController extends GetxController{
  List list = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
  final pageController = PageController();
  int selectedIndex = 0;
}