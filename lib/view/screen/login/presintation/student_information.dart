// ignore_for_file: deprecated_member_use

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expo_visitor/view/screen/login/presintation/employee_information.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/accept_button.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/main_appbar.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/main_appbar_bottom.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/poweredby.dart';
import 'package:expo_visitor/view/screen/root_screen/presentation/root_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../config/theme.dart';
import '../../../../constants/size.dart';
import '../../../../main.dart';
import '../../../../models/list_model_all.dart';
import '../../home_screen/presintation/home_screen.dart';
import 'widget/cutomer_text_filed.dart';

class StudentInforamation extends StatefulWidget {
  const StudentInforamation({Key? key}) : super(key: key);

  @override
  State<StudentInforamation> createState() => _StudentInforamationState();
}

class _StudentInforamationState extends State<StudentInforamation> {
  var student = null;
  final formKey = GlobalKey<FormState>();
  TextEditingController basic_speclize_Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    lang = currentLocal.languageCode == 'en';
    return Scaffold(
        backgroundColor: AppColors.scaffoldbackground,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 0.04.sw, vertical: 0.02.sh),
                  child: Form(
                    key: formKey,
                    child: Align(
                      alignment: lang ? Alignment.topLeft : Alignment.topRight,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainAppBar(
                            title: tr('student_register'),
                          ),
                          SizedBox(
                            height: 0.003.sh,
                          ),
                          Text(
                            tr('subtitle_company'),
                            style: medium_10_gray,
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0.w, 0.02.sh, 0.sw, 0.02.sh),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField2<String>(
                                      scrollbarAlwaysShow: true,
                                      validator: (value) => value == null
                                          ? tr('The field is required')
                                          : null,
                                      dropdownMaxHeight: 0.4.sh,
                                      isExpanded: true,
                                      style: medium_10_gray,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: "Basic competence".tr(),
                                        hintStyle: medium_10_gray,
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 0.04.sw,
                                          vertical: 0.016.sh,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: AppColors.grey)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            borderSide: const BorderSide(
                                                color: AppColors.blue)),
                                      ),
                                      value: student,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          student = newValue!;
                                        });
                                      },
                                      items: studentItems),
                                )),
                          ),
                          SizedBox(
                            height: deffultPadding,
                          ),
                          CustomerFormEditing(
                              hintText: tr('Detailed competence'),
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: tr('The field is required')),
                              ]),
                              controller: basic_speclize_Controller,
                              inputType: TextInputType.text),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              MainAppBarBottom(formKey: formKey,  onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MainRootScreen(isactive: isactive)));
                },),
            ],
          ),
        ));
  }
}
