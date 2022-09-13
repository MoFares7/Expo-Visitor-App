import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BackGround extends StatelessWidget {
  const BackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1.sw,
        height: 1.sh,
        alignment: Alignment.bottomCenter,
        child: SvgPicture.asset(
          'assets/icons/background.svg',
          alignment: Alignment.bottomCenter,
          width: double.maxFinite,
          fit: BoxFit.fitWidth,
        ));
  }
}
