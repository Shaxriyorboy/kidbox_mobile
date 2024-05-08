import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../services/constants/app_colors.dart';

class CustomGridTile extends StatelessWidget {
  String title;
  String subTitle;
  String image;
  int width;
  Function() onTap;

  CustomGridTile(
      {required this.title,
      required this.subTitle,
      required this.image,
      required this.onTap,
      required this.width,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // image should be wrapped by container if there is overflow
            /// teacher image
            Image.asset('assets/images/$image'),

            /// teacher management statistics
            SizedBox(
              height: 53.h,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10.r)),
                child: GridTileBar(
                  backgroundColor: AppColors.mainWhiteColor,
                  title: Text(
                    title,
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        color: AppColors.mainColorBlack),
                  ),
                  subtitle: Text(
                    subTitle,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: AppColors.colorTextLightGrey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  String? title;
  String subTitle;
  String? trailingIcon;
  String? leading;
  Function() onTap;

  CustomListTile(
      {this.title,
      required this.subTitle,
      this.trailingIcon,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color: AppColors.mainWhiteColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            /// date
            Container(
              width: 86.w,
              height: 70.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.colorLightBlue,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(8.r)),
              ),
              child: Text.rich(
                TextSpan(
                    text: (trailingIcon == null)?"11:30\n":"16\n",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.mainColorBlack,
                        fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: (trailingIcon == null)?"Time":"November",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.mainColorBlack,
                            fontWeight: FontWeight.w500),
                      )
                    ]),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 12.w,
            ),

            /// group name and icons
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: AppColors.colorTextLightGrey,
                          fontWeight: FontWeight.w400),
                    ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Flexible(
                      child: Text(
                    subTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.mainColorBlack,
                        fontWeight: FontWeight.w500),
                  ))
                ],
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            if (trailingIcon != null)
              SizedBox(
                width: 49.w,
                height: 49.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.asset(
                    'assets/images/$trailingIcon.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            /// icon arrow
            SizedBox(
              width: 15.w,
            ),
            // if (trailingIcon != null)
            const Icon(
              Icons.keyboard_arrow_right,
              color: AppColors.mainColorBlack,
            ),
            SizedBox(
              width: 19.w,
            )
          ],
        ),
      ),
    );
  }
}
