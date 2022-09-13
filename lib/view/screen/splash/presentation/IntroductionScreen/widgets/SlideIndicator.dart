// ignore_for_file: file_names

import 'package:dots_indicator/dots_indicator.dart';
import 'package:expo_visitor/main.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../config/theme.dart';

class SlideIndicator extends StatelessWidget {
  final double dotIndex;
  const SlideIndicator({Key? key, required this.dotIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: lang == "en" ? TextDirection.rtl : TextDirection.ltr,
      child: DotsIndicator(
        dotsCount: 4,
        position: dotIndex,
        decorator: DotsDecorator(
          size: Size(0.05.sw, 0.01.sh),
          activeSize: Size(0.15.sw, 0.01.sh),
          color: AppColors.grey,
          activeColor: AppColors.red,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}
