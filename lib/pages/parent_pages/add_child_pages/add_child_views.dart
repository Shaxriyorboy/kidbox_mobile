import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// #DropDownButton
Widget dropDownButton(List<String> list, var controller, String value, void Function(String?) function) {
  return Container(
    height: 35.h,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        alignment: Alignment.center,
        borderRadius: BorderRadius.circular(10.r),
        isExpanded: true,
        hint: Text(value),
        style: TextStyle(fontSize: 18.sp, color: Colors.black, fontFamily: "Poppins",fontWeight: FontWeight.w500),
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        onChanged: function,
        items: list.map((String tag) {
          return DropdownMenuItem<String>(
            value: tag,
            child: Text(
              tag,
              style: TextStyle(fontSize: 18.sp, color: Colors.black, fontFamily: "Poppins",fontWeight: FontWeight.w500),
            ),
          );
        }).toList(),
      ),
    ),
  );
}

Container textFieldForChild(String title) {
  return Container(
    margin:
    EdgeInsets.symmetric(horizontal: 15.w),
    height: 83.h,
    width: 1.sw,
    decoration: BoxDecoration(
      border: title!="Name of kindergarten"?Border(
          bottom: BorderSide(
              color: const Color(0xFFB3B3B3),
              width: 1.sp)):null,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 6.h,
        ),

        /// input center name place
        TextField(
          scrollPadding: EdgeInsets.zero,
          textInputAction:
          TextInputAction.next,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            isDense: true,
            contentPadding: EdgeInsets.zero,
            border: InputBorder.none,
          ),
        )
      ],
    ),
  );
}