import 'package:get/get.dart';

class DirChildManageController extends GetxController {
  bool isSelected = false;
  List<bool> checkList = List.generate(10, (index) => false);

  void chooseGroup(int index) {
    for (int i = 0; i < checkList.length; i++) {
      if (i == index) {
        checkList[i] = true;
      } else {
        checkList[i] = false;
      }
    }
    isSelected = true;
    update();
  }

  void cancelChoosingGroup() {
    for (int i = 0; i < checkList.length; i++) {
      checkList[i] = false;
    }
    isSelected = false;
    update();
    Get.back();
  }
}
