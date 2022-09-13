// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:expo_visitor/view/screen/splash/presentation/IntroductionScreen/widgets/ItemSlideView.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../../../../../../main.dart';

class SlideView extends StatelessWidget {
  final PageController controller;
  const SlideView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: lang == "en" ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: [
          ItemSlideView(
              image: "assets/icons/slide1.svg",
              title: tr('page1title'),
              description: "slide1desc".tr()),
          ItemSlideView(
              image: "assets/icons/slide2.svg",
              title: tr('page2title'),
              description: "slide2desc".tr()),
          ItemSlideView(
              image: "assets/icons/slide3.svg",
              title: tr('page3title'),
              description: "slide3desc".tr()),
          ItemSlideView(
              image: "assets/icons/slide4.svg",
              title: tr('page4title'),
              description: "slide4desc".tr()),
        ],
      ),
    );
  }
}
