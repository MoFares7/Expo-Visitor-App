import 'package:expo_visitor/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AcceptButton extends StatelessWidget {
  const AcceptButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  final Function onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.4.sw,
      height: 0.07.sh,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              primary: AppColors.blue),
          onPressed: () {
            onPressed();
          },
          child: Text(
            title,
            style: medium_14_white,
          )),
    );
  }
}
