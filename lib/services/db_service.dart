import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'lang_service.dart';

class DBService {
  final GetStorage _box = GetStorage();

  static DBService get to => Get.find<DBService>();

  static Future<void> init() async {
    await Get.putAsync<DBService>(() async {
      final storageService = DBService();
      await GetStorage.init();
      return storageService;
    }, permanent: true);
  }

  // Firebase Token
  Future<void> setFirebaseToken(String value) async {
    await _box.write(_StorageKeys.FIREBASE_TOKEN, value);
  }

  String getFirebaseToken() {
    return _box.read(_StorageKeys.FIREBASE_TOKEN);
  }

  Future<void> delFirebaseToken() async {
    await _box.remove(_StorageKeys.FIREBASE_TOKEN);
  }

  // Language
  String getLanguage() {
    var lang = _box.read(_StorageKeys.LANGUAGE);
    if (lang == null || lang.isEmpty) return LangService.langs[0];
    return lang;
  }

  Future<void> setLanguage(String code) async {
    await _box.write(_StorageKeys.LANGUAGE, code);
  }
}

class _StorageKeys {
  static const ACCESS_TOKEN = 'access_token';
  static const FIREBASE_TOKEN = 'firebase_token';
  static const LANGUAGE = 'language';
  static const MY_INFO = 'user';
  static const INVITER_NUMBER = "inviter_number";
}
