import 'package:easy_localization/easy_localization.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/accept_button.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/cutomer_text_filed.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/main_appbar.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/main_appbar_bottom.dart';
import 'package:expo_visitor/view/screen/root_screen/presentation/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme.dart';
import '../../../../constants/size.dart';
import '../../../../main.dart';
import '../../home_screen/presintation/home_screen.dart';
import 'widget/poweredby.dart';

class EmployeeInformationScreen extends StatelessWidget {
  EmployeeInformationScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  TextEditingController company_name_controller = TextEditingController();
  TextEditingController company_specialization_controller =
      TextEditingController();
  TextEditingController company_number_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    lang = currentLocal.languageCode == 'en';
    return Scaffold(
      backgroundColor: AppColors.scaffoldbackground,
      body: SafeArea(
          child: Align(
        alignment: lang ? Alignment.topLeft : Alignment.topRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 0.02.sh,
                right: 0.04.sw,
                left: 0.04.sw,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          children: [
                            MainAppBar(
                              title: tr('Employee_register'),
                            ),
                            SizedBox(
                              height: 0.003.sh,
                            ),
                            Text(
                              tr('subtitle_company'),
                              style: medium_10_gray,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 0.02.sh),
                              child: CustomerFormEditing(
                                  hintText: tr('name_company/destination'),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: tr('The field is required')),
                                  ]),
                                  controller: company_name_controller,
                                  inputType: TextInputType.text),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 0.02.sh),
                              child: CustomerFormEditing(
                                  hintText:
                                      tr('specialization_company/destination'),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: tr('The field is required')),
                                  ]),
                                  controller: company_specialization_controller,
                                  inputType: TextInputType.text),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: deffultPadding / 2),
                              child: CustomerFormEditing(
                                  hintText: tr('Job title'),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: tr('The field is required')),
                                  ]),
                                  controller: company_number_controller,
                                  inputType: TextInputType.phone),
                            ),
                            SizedBox(
                              height: deffultPadding * 1.5,
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            MainAppBarBottom(
                formKey: formKey,
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MainRootScreen(isactive: isactive)));
                })
          ],
        ),
      )),
    );
  }
}
