import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kidbox_mobile/pages/language_page/language_page.dart';
import 'package:kidbox_mobile/services/di_service.dart';
import 'package:kidbox_mobile/services/lang_service.dart';
import 'package:kidbox_mobile/services/root_service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await RootService.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KidBox mobile',
        theme: ThemeData(fontFamily: "Poppins"),
        initialBinding: DIService(),
        home: const LanguagePage(),
        //home: const ParentLogin(),
        translations: LangService(),
        locale: LangService.fallbackLocale,
        fallbackLocale: LangService.fallbackLocale,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
      ),
    );
  }
}
