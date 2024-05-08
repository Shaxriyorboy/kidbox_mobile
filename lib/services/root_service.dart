import 'package:firebase_core/firebase_core.dart';

import 'db_service.dart';

class RootService {
  static Future<void> init() async {
    await DBService.init(); // GetStorage Database
  }
}
