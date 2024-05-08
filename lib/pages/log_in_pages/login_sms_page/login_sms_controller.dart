import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSmsController extends GetxController {
  Timer? _timer;
  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 60;
  var currentSeconds = 60;
  String errorText = '';

  String get timerText =>
      '${((currentSeconds) ~/ 60).toString().padLeft(2, '0')} : ${((currentSeconds) % 60).toString().padLeft(2, '0')}';

  @override
  void onInit() {
    super.onInit();
    startTimeout();
  }

  void startTimeout() {
    var duration = interval;
    _timer = Timer.periodic(duration, (timer) {
      debugPrint(timer.tick.toString());
      currentSeconds = timerMaxSeconds - timer.tick;
      update();
      if (timer.tick >= timerMaxSeconds) {
        timer.cancel();
        update();
      }
    });
  }

  void stopTimeout() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
  }
}
