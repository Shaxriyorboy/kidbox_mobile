import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../role_view.dart';

class DirectorAddGroupController extends GetxController{
  int groupNumber = 1;
  String groupName = "GroupName";
  final groupController0 = TextEditingController();
  final groupController1 = TextEditingController();
  final groupController2 = TextEditingController();
  final groupController3 = TextEditingController();
  final groupController4 = TextEditingController();
  final groupController5 = TextEditingController();
  final groupController6 = TextEditingController();
  final groupController7 = TextEditingController();
  final groupController8 = TextEditingController();
  final groupController9 = TextEditingController();

  late List<TextEditingController> txtController = [
    groupController0, groupController1, groupController2,
    groupController3, groupController4, groupController5,
    groupController6, groupController7, groupController8,
    groupController9,
  ];

}