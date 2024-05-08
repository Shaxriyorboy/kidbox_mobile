import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class IsLoadingPage extends StatelessWidget {
  final Color? backgroundColor;

  const IsLoadingPage({this.backgroundColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.black.withOpacity(0.1),
      body: Center(
        child: Lottie.asset('assets/lottie_animations/loading.json',
            height: 100.w, width: 100.w),
      ),
    );
  }
}
