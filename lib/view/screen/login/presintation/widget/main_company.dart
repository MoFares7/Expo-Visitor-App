// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:expo_visitor/config/theme.dart';
import 'package:expo_visitor/constants/size.dart';
import 'package:expo_visitor/models/company_form_data.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/cutomer_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';

class MainCompany extends StatelessWidget {
  MainCompany(
      {Key? key,
      required this.is_click,
      required this.company_name_controller,
      required this.company_specialization_controller,
      required this.company_number_controller,
      required this.index,
      required this.companyFormData,
      required this.onPressed})
      : super(key: key);

  final ValueNotifier<bool> is_click;
  final TextEditingController company_name_controller;
  final TextEditingController company_specialization_controller;
  final TextEditingController company_number_controller;
  final int index;
  final CompanyFormData companyFormData;
  final Function onPressed;

  List<CompanyFormData> discountList = [];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: is_click,
        builder: (context, isYep, _) {
          return Column(
            key: UniqueKey(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tr('second_company'),
                    style: medium_14_blue,
                  ),
                  IconButton(
                    onPressed: () {
                      onPressed();
                      is_click.value = true;
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: AppColors.red,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 0.03.sh),
                child: CustomerFormEditing(
                    hintText: tr('name_company'),
                    validator: MultiValidator(
                      [
                        RequiredValidator(
                            errorText: tr('The field is required')),
                      ],
                    ),
                    controller: null,
                    inputType: TextInputType.text),
              ),
              CustomerFormEditing(
                  hintText: tr('specialization_company'),
                  validator: MultiValidator(
                    [
                      RequiredValidator(errorText: tr('The field is required')),
                    ],
                  ),
                  controller: null,
                  inputType: TextInputType.text),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.03.sh),
                child: CustomerFormEditing(
                    hintText: tr('number_company'),
                    validator: MultiValidator(
                      [
                        RequiredValidator(
                            errorText: tr('The field is required')),
                      ],
                    ),
                    controller: null,
                    inputType: TextInputType.phone),
              ),
            ],
          );
        });
  }
}
