import 'package:easy_localization/easy_localization.dart';
import 'package:expo_visitor/config/theme.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/accept_button.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/poweredby.dart';
import 'package:expo_visitor/view/screen/root_screen/presentation/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home_screen/presintation/home_screen.dart';

class MainAppBarBottom extends StatelessWidget {
  MainAppBarBottom({
    Key? key,
    required this.formKey,
    required this.onPressed,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(color: AppColors.scaffoldbackground),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    right: 0.03.sw,
                    top: 0.01.sh,
                    bottom: 0.04.sh,
                    left: 0.03.sw),
                child: AcceptButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        onPressed();
                      }
                    },
                    title: tr('Follow')),
              ),
              PowerdBy(),
            ],
          ),
        ),
      ),
    );
  }
}
