import 'package:easy_localization/easy_localization.dart';
import 'package:expo_visitor/constants/size.dart';
import 'package:expo_visitor/view/screen/login/presintation/information_login_screen.dart';
import 'package:expo_visitor/view/screen/login/presintation/main_login.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/accept_button.dart';
import 'package:expo_visitor/view/widgets/Logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

import '../../../../config/helper.dart';
import '../../../../config/theme.dart';
import '../../../../main.dart';

class OtpValidateScreen extends StatefulWidget {
  OtpValidateScreen({Key? key}) : super(key: key);

  @override
  State<OtpValidateScreen> createState() => _OtpValidateScreenState();
}

class _OtpValidateScreenState extends State<OtpValidateScreen> {
  final String requiredNumber = '1234';
  TextEditingController controller = TextEditingController();
  bool invalidCode = false;
  @override
  Widget build(BuildContext context) {
    lang = currentLocal.languageCode == 'en';
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          right: 0.06.sw,
          left: 0.06.sw,
        ),
        child: Align(
          alignment: lang ? Alignment.topLeft : Alignment.topRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Logo(paddingTop: 5.h / 7),
              SizedBox(
                height: 0.01.sh,
              ),
              Text(tr('Enter the verification code'),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: AppColors.blue)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    tr(
                      'subtitle_OTP',
                    ),
                    style: medium_10_gray,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      phoneNumberController.text.toString(),
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blue),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      size: 16.sp,
                      color: AppColors.blue,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainLoginScreen()));
                    },
                  )
                ],
              ),
              SizedBox(
                height: 0.05.sh,
              ),
              Directionality(
                textDirection: ui.TextDirection.ltr,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.06.sh),
                  child: Column(
                    children: [
                      PinCodeTextField(
                        controller: controller,
                        appContext: context,
                        validator: (value) =>
                            value == null ? tr('The field is required') : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        animationCurve: Curves.linear,
                        animationDuration: Duration(milliseconds: 0),
                        length: 4,
                        keyboardType: TextInputType.number,
                        onChanged: (String value) {
                          if (value.length < 4) {
                            setState(() {
                              invalidCode = false;
                            });
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 0.09.sh,
                          fieldWidth: 0.13.sw,
                          inactiveColor: AppColors.blue,
                          activeColor:
                              invalidCode ? AppColors.red : AppColors.blue,
                          selectedColor: AppColors.blue,
                        ),
                        onCompleted: (value) {
                          if (value == requiredNumber) {
                            print('yyyyyyyyyyyyyyyyyy');
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InformationLogin()));
                          } else {
                            setState(() {
                              invalidCode = true;
                            });
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: deffultPadding,
              ),
              TextButton(
                  onPressed: () {},
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: 1, // Space between underline and text
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: AppColors.blue,
                      width: 1.0, // Underline thickness
                    ))),
                    child: Text(
                      tr('reSend'),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.blue,
                        //decoration: TextDecoration.underline
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
