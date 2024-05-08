import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/services/api_service.dart';
import 'package:kidbox_mobile/services/fcm_service.dart';
import 'package:kidbox_mobile/services/log_service.dart';
import 'package:kidbox_mobile/services/network_service.dart';
import 'package:kidbox_mobile/services/utils.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'login_sms_page/login_sms_page.dart';

class LogInController extends GetxController {
  var device;
  String phoneNumber = '+998';
  int lengthNumber = 0;
  bool isButtonActive = false;
  bool isLoading = false;
  TextEditingController textEditingController = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
  }

  @override
  onInit() {
    super.onInit();
    FCMService.initNotification();
    deviceInfo();
  }

  void deviceInfo() async {
    device = await Utils.deviceParams();
  }

  void apiSmsCode() async {
    if (lengthNumber != 11) {
      return;
    } else {
      lengthNumber = 0;
      isLoading = true;
      update();
      try {
        var response = await NetworkService.POST(ApiService.API_SMS,
            NetworkService.paramsSignIn(phoneNumber, device));
        LogService.d(response.toString());
        isLoading = false;
        update();
        if (response != null) {
          var result = NetworkService.parseResult(response);
          if (result) {
            textEditingController.clear();
            Get.to(() => const LoginSmsPage());
          } else {}
        }
      } on SocketException catch (e) {
        LogService.d(e.toString());
      } catch (e) {
        LogService.d(e.toString());
      }
      textEditingController.clear();
      isLoading = false;
      update();
    }
  }

  var numberMaskFormat = MaskTextInputFormatter(
      mask: '## ### ####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
}
