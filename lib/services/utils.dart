import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'db_service.dart';
import 'log_service.dart';

class Utils {
  /// #GetPickedImages
  static Future<List<XFile>?> getPickedImages() async {
    try {
      final List<XFile>? selectedImages = await ImagePicker().pickMultiImage();
      if (selectedImages!.isNotEmpty) {
        return selectedImages;
      } else {
        LogService.i("Not selected Image");
      }
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    return null;
  }

  /// #OpenPicker
  static Future<XFile?> openPicker(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        return image;
      } else {
        LogService.i("Not selected Image");
      }
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    return null;
  }

  static Future<Map<String, String>> deviceParams() async {
    Map<String, String> params = {};
    var deviceInfo = DeviceInfoPlugin();
    String fcmToken = DBService.to.getFirebaseToken();

    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      params.addAll({
        'deviceId': iosDeviceInfo.identifierForVendor.toString(),
        'deviceType': "I",
        'firebaseToken': fcmToken,
      });
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      params.addAll({
        'deviceId': androidDeviceInfo.id.toString(),
        'deviceType': "A",
        'firebaseToken': fcmToken,
      });
    }
    return params;
  }
}
