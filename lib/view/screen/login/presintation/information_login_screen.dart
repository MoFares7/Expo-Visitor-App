// ignore_for_file: deprecated_member_use, non_constant_identifier_names
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expo_visitor/config/theme.dart';
import 'package:expo_visitor/constants/size.dart';
import 'package:expo_visitor/main.dart';
import 'package:expo_visitor/view/screen/login/presintation/Journalist_information.dart';
import 'package:expo_visitor/view/screen/login/presintation/company_information.dart';
import 'package:expo_visitor/view/screen/login/presintation/employee_information.dart';
import 'package:expo_visitor/view/screen/login/presintation/free_jop_informations.dart';
import 'package:expo_visitor/view/screen/login/presintation/student_information.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/accept_button.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/main_appbar_bottom.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/poweredby.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../models/list_model_all.dart';
import 'widget/cutomer_text_filed.dart';
import 'widget/deffult_form_filed.dart';

class InformationLogin extends StatefulWidget {
  const InformationLogin({Key? key}) : super(key: key);

  @override
  State<InformationLogin> createState() => _InformationLoginState();
}

class _InformationLoginState extends State<InformationLogin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController l_nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var city = null, title = null, spechial = null;

  @override
  Widget build(BuildContext context) {
    lang = currentLocal.languageCode == 'en';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.scaffoldbackground,
      body: SafeArea(
        child: Align(
          alignment: lang ? Alignment.topLeft : Alignment.topRight,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 0.02.sh,
                        right: 0.04.sw,
                        left: 0.04.sw,
                      ),
                      child: Align(
                        alignment:
                            lang ? Alignment.topLeft : Alignment.topRight,
                        child: Text(
                          tr('login_info'),
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 0.01.sh,
                          right: 0.04.sw,
                          left: 0.04.sw,
                          bottom: 1.h),
                      child: Form(
                        key: formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tr('subtitle_login_info'),
                                style: medium_10_gray,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: double.maxFinite,
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.w, 0.033.sh, 0.sw, 0.02.sh),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButtonFormField2<String>(
                                          scrollbarAlwaysShow: true,
                                          validator: (value) => value == null
                                              ? tr('The field is required')
                                              : null,
                                          dropdownMaxHeight: 0.3.sh,
                                          isExpanded: true,
                                          style: medium_10_gray,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          decoration: InputDecoration(
                                            fillColor:
                                                AppColors.scaffoldbackground,
                                            filled: true,
                                            isDense: true,
                                            hintText: "title".tr(),
                                            hintStyle: medium_10_gray,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 0.04.sw,
                                              vertical: 0.016.sh,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                borderSide: const BorderSide(
                                                    color: AppColors.blue)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                borderSide: const BorderSide(
                                                    color: AppColors.blue,
                                                    width: 2)),
                                          ),
                                          value: title,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              title = newValue!;
                                            });
                                          },
                                          items: titleItems),
                                    )),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 0.01.sh),
                                child: CustomerFormEditing(
                                    hintText: tr('f_name'),
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText:
                                              tr('The field is required')),
                                    ]),
                                    controller: nameController,
                                    inputType: TextInputType.name),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 0.01.sh),
                                child: CustomerFormEditing(
                                    hintText: tr('l_name'),
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText:
                                              tr('The field is required')),
                                    ]),
                                    controller: l_nameController,
                                    inputType: TextInputType.name),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 0.01.sh),
                                child: DefaultFormEditing(
                                    hintText: tr('phone_number'),
                                    controller: phoneController,
                                    inputType: TextInputType.number),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 0.01.sh),
                                child: DefaultFormEditing(
                                    hintText: tr('email'),
                                    controller: emailController,
                                    inputType: TextInputType.emailAddress),
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
                                          dropdownMaxHeight: 0.3.sh,
                                          isExpanded: true,
                                          style: medium_10_gray,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          decoration: InputDecoration(
                                            fillColor:
                                                AppColors.scaffoldbackground,
                                            filled: true,
                                            isDense: true,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 0.04.sw,
                                              vertical: 0.016.sh,
                                            ),
                                            hintText: "city".tr(),
                                            hintStyle: medium_10_gray,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                borderSide: const BorderSide(
                                                    color: AppColors.blue)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                borderSide: const BorderSide(
                                                    color: AppColors.blue,
                                                    width: 2)),
                                          ),
                                          value: city,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              city = newValue!;
                                            });
                                          },
                                          items: cityItems),
                                    )),
                              ),
                              SizedBox(
                                width: double.maxFinite,
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.w, 0.0.sh, 0.sw, 0.04.sh),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButtonFormField2<String>(
                                          scrollbarAlwaysShow: true,
                                          validator: (value) => value == null
                                              ? tr('The field is required')
                                              : null,
                                          dropdownMaxHeight: 0.2.sh,
                                          isExpanded: true,
                                          style: medium_10_gray,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          decoration: InputDecoration(
                                            fillColor:
                                                AppColors.scaffoldbackground,
                                            filled: true,
                                            isDense: true,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 0.04.sw,
                                              vertical: 0.016.sh,
                                            ),
                                            hintText: "specialization".tr(),
                                            hintStyle: medium_10_gray,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                borderSide: const BorderSide(
                                                    color: AppColors.grey)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                borderSide: const BorderSide(
                                                    color: AppColors.blue,
                                                    width: 2)),
                                          ),
                                          value: spechial,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              spechial = newValue!;
                                            });
                                          },
                                          items: speItems),
                                    )),
                              ),
                              SizedBox(
                                height: 0.16.sh,
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
               Align(
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
                          if (spechial == "business owner") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CompanyInformation()));
                  } else if (spechial == "Student") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudentInforamation()));
                  } else if (spechial == "Employee") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmployeeInformationScreen()));
                  } else if (spechial == "Journalist") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const JournalistInformation()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FreeJopInformations()));
                  }
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
