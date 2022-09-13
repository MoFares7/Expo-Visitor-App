import 'package:easy_localization/easy_localization.dart';
import 'package:expo_visitor/constants/size.dart';
import 'package:expo_visitor/view/screen/login/presintation/otp_validate_screen.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/accept_button.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/text_filed_phone_number.dart';
import 'package:expo_visitor/view/widgets/Logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

import '../../../../config/helper.dart';
import '../../../../config/theme.dart';
import '../../../../main.dart';

class MainLoginScreen extends StatelessWidget {
  MainLoginScreen({Key? key}) : super(key: key);

  @override
  final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    lang = currentLocal.languageCode == 'en';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.scaffoldbackground,
      body: Padding(
        padding: EdgeInsets.only(
          right: 0.06.sw,
          left: 0.06.sw,
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Align(
              alignment: lang ? Alignment.topLeft : Alignment.topRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Logo(paddingTop: 10),
                  Text(tr('Enter You Mobile'),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: AppColors.blue)),
                  SizedBox(
                    height: 0.3.h,
                  ),
                  Text(tr('subtitle_login'), style: medium_10_gray),
                  SizedBox(
                    height: 0.05.sh,
                  ),
                  PhoneNumberFormEditing(
                    hintText: '*** *** ***',
                    inputType: TextInputType.phone,
                    controller: phoneNumberController,
                  ),
                  SizedBox(
                    height: 0.06.sh,
                  ),
                  AcceptButton(
                    title: tr('accept'),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpValidateScreen()));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
