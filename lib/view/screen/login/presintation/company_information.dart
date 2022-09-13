// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:expo_visitor/config/theme.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/accept_button.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/cutomer_text_filed.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/main_appbar.dart';

import 'package:expo_visitor/view/screen/login/presintation/widget/main_company.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/poweredby.dart';
import 'package:expo_visitor/view/screen/root_screen/presentation/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/size.dart';
import '../../../../main.dart';
import '../../../../models/company_form_data.dart';
import '../../home_screen/presintation/home_screen.dart';

class CompanyInformation extends StatefulWidget {
  const CompanyInformation({Key? key}) : super(key: key);

  @override
  State<CompanyInformation> createState() => _CompanyInformationState();
}

class _CompanyInformationState extends State<CompanyInformation> {
  List<CompanyFormData> discountList = [];
  final ValueNotifier<bool> is_click = ValueNotifier(false);
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
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 0.02.sh, horizontal: 0.04.sw),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainAppBar(
                          title: tr('company_register'),
                        ),
                        SizedBox(
                          height: 0.003.sh,
                        ),
                        Text(
                          tr('subtitle_company'),
                          style: medium_10_gray,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 0.03.sh),
                          child: CustomerFormEditing(
                              hintText: tr('name_company'),
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: tr('The field is required')),
                              ]),
                              controller: company_name_controller,
                              inputType: TextInputType.text),
                        ),
                        CustomerFormEditing(
                            hintText: tr('specialization_company'),
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: tr('The field is required')),
                            ]),
                            controller: company_specialization_controller,
                            inputType: TextInputType.text),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 0.03.sh),
                          child: CustomerFormEditing(
                              hintText: tr('number_company'),
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: tr('The field is required')),
                              ]),
                              controller: company_number_controller,
                              inputType: TextInputType.phone),
                        ),
                        SizedBox(
                          height: deffultPadding,
                        ),
                        Column(
                          children: List.generate(
                            discountList.length,
                            (index) => MainCompany(
                              index: index,
                              companyFormData: discountList[index],
                              is_click: is_click,
                              company_name_controller: company_name_controller,
                              company_specialization_controller:
                                  company_specialization_controller,
                              company_number_controller:
                                  company_number_controller,
                              onPressed: () {
                                setState(() {
                                  discountList.removeAt(index);
                                });
                              },
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              tr('another_company'),
                              style: medium_10_gray,
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    discountList.add(CompanyFormData());
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    bottom:
                                        2, // Space between underline and text
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                    color: AppColors.blue,
                                    width: 1.5, // Underline thickness
                                  ))),
                                  child: Text(
                                    tr('add_comapny'),
                                    style: technologies_withoun_underLine,
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 0.16.sh,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration:
                      BoxDecoration(color: AppColors.scaffoldbackground),
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
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainRootScreen(
                                            isactive: isactive)));
                              }
                            },
                            title: tr('Follow')),
                      ),
                      PowerdBy(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
