import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/language_page/language_controller.dart';
import 'package:kidbox_mobile/pages/language_page/language_views.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

class LanguagePage extends StatefulWidget {
  static const String id = '/lang_page';

  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GetBuilder<LanguageController>(
              init: LanguageController(),
              builder: (controller) {
                /// Language Ticker Widget
                return buildCustomPicker(controller);
              },
            ),
          ),
        ],
      ),
    );
  }
}
