// ignore_for_file: file_names
import 'package:expo_visitor/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NextSlideButton extends StatelessWidget {
  final void Function() onClickNext;
  const NextSlideButton({Key? key, required this.onClickNext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.16.sw,
      height: 0.09.sh,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              // padding: EdgeInsets.symmetric(horizontal: 2.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              primary: AppColors.blue),
          onPressed: () {
            onClickNext();
          },
          child: Center(
            child: Icon(
              Icons.arrow_back_outlined,
              color: AppColors.white,
              size: 26.sp,
            ),
          )),
    );
  }
}
