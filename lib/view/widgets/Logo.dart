import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  final double paddingTop;
  const Logo({Key? key, this.paddingTop = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
          margin: EdgeInsets.only(top: paddingTop),
          height: 0.4.sh,
          width: 0.7.sw,
          child: Center(
            child: Image.asset(
              'assets/images/AGE.png',
              fit: BoxFit.contain,
            ),
          )),
    );
  }
}
