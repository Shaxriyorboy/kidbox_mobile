import 'package:get/get.dart';
import 'package:kidbox_mobile/services/fcm_service.dart';

class LanguageController extends GetxController
    with GetTickerProviderStateMixin {
  int selectLang = 1;

  set chooseLang(int index) {
    selectLang = index;
    update();
  }

  List<String> languages = ["Русский", "English", "O'zbek"];

}
