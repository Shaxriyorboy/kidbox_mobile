import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:kidbox_mobile/services/db_service.dart';
import 'package:kidbox_mobile/services/log_service.dart';

class FCMService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static initNotification() async {
    await _firebaseMessaging.requestPermission(
        sound: true, badge: true, alert: true);
    _firebaseMessaging.getToken().then((String? token) {
      assert(token != null);
      DBService.to.setFirebaseToken(token.toString());
      LogService.i(token.toString());
    });
  }
}
