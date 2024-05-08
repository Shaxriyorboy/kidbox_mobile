import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kidbox_mobile/pages/director_pages/home_pending_pages/home_pending_controller.dart';
import 'package:kidbox_mobile/services/constants/app_colors.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainBackgroundColor,
      height: 165.h,
      child: CalendarWeek(
        marginDayOfWeek: const EdgeInsets.all(0),
        marginMonth: const EdgeInsets.all(0),
        monthViewBuilder: (date) {
          return ListTile(
            contentPadding: EdgeInsets.only(left: 15.w, right: 15.w),
            title: Text(
              DateFormat.MMMMEEEEd().format(DateTime.now()),
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(Icons.calendar_today_outlined),
          );
        },
        monthAlignment: FractionalOffset.centerLeft,
        minDate: DateTime.now().add(
          Duration(days: 1 - DateTime.now().weekday),
        ),
        maxDate: DateTime.now().add(
          DateTime.now().weekday != 5
              ? Duration(days: DateTime.now().weekday - 1)
              : Duration(days: DateTime.now().weekday + 6),
        ),
        onDatePressed: (DateTime datetime) {
          Get.find<HomePendingController>().date = datetime;
        },
        showMonth: true,
        dayOfWeekStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        dateStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        todayDateStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        todayBackgroundColor: AppColors.mainColorOrange,
        pressedDateBackgroundColor: Colors.blueAccent,
        pressedDateStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        weekendsStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        dateBackgroundColor: Colors.transparent,
        backgroundColor: AppColors.mainBackgroundColor,
        dayOfWeek: const ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
        // dayShapeBorder: ,
      ),
    );
  }
}
