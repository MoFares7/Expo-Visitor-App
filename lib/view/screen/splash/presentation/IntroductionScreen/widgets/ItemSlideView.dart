// ignore_for_file: file_names, unrelated_type_equality_checks
import 'package:expo_visitor/config/theme.dart';
import 'package:expo_visitor/main.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemSlideView extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const ItemSlideView(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    lang = currentLocal.languageCode == 'en';
    return Column(
      children: [
        SizedBox(
          height: 0.1.sh,
        ),
        SvgPicture.asset(
          image,
          alignment: Alignment.center,
          fit: BoxFit.fitWidth,
          width: 0.75.sw,
          height: 0.40.sh,
        ),
        Padding(
          padding: EdgeInsets.only(right: 0.08.sw, left: 0.08.sw, top: 0.05.sh),
          child: Align(
            alignment: lang ? Alignment.topLeft : Alignment.topRight,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  color: AppColors.blue,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.08.sw, vertical: 0.01.sh),
          child: Align(
            alignment: lang ? Alignment.topLeft : Alignment.topRight,
            child: Text(
              description,
              textDirection:
                  lang == "en" ? ui.TextDirection.ltr : ui.TextDirection.rtl,
              style: TextStyle(fontSize: 16, color: AppColors.subtitle),
            ),
          ),
        )
      ],
    );
  }
}
