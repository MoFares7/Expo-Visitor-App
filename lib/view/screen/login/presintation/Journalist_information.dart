// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expo_visitor/models/list_model_all.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/accept_button.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/main_appbar.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/main_appbar_bottom.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/poweredby.dart';
import 'package:expo_visitor/view/screen/root_screen/presentation/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/theme.dart';
import '../../../../constants/size.dart';
import '../../../../main.dart';
import '../../home_screen/presintation/home_screen.dart';
import 'widget/cutomer_text_filed.dart';

class JournalistInformation extends StatefulWidget {
  const JournalistInformation({Key? key}) : super(key: key);

  @override
  State<JournalistInformation> createState() => _JournalistInformationState();
}

class _JournalistInformationState extends State<JournalistInformation> {
  String imageName = tr('Photo Card Journalist');
  final formKey = GlobalKey<FormState>();

  TextEditingController journalist_name_controller = TextEditingController();
  File? image;
  Future pickImage() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemporary = File(image.path);
      ;
      setState(() {
        this.image = imageTemporary;
        imageName = image.name;
      });
    } on PlatformException catch (e) {
      print(e.toString());
    }
  }

  var jurnalist = null;

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
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 0.04.sw, vertical: 0.02.sh),
                  child: Form(
                    key: formKey,
                    child: Column(
                        //  mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainAppBar(
                            title: tr('journalist_register'),
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
                                hintText:
                                    tr('The name of the media organization'),
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: tr('The field is required')),
                                ]),
                                controller: journalist_name_controller,
                                inputType: TextInputType.text),
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0.w, 0.002.sh, 0.sw, 0.02.sh),
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
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 0.04.sw,
                                          vertical: 0.016.sh,
                                        ),
                                        hintText:
                                            "The name of the media organization"
                                                .tr(),
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
                                                color: AppColors.blue)),
                                      ),
                                      value: jurnalist,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          jurnalist = newValue!;
                                        });
                                      },
                                      items: jurnalistItems),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 0.002.sh),
                            child: GestureDetector(
                              onTap: () async {
                                pickImage();
                              },
                              child: Container(
                                height: 0.063.sh,
                                width: double.infinity,
                                decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.0, style: BorderStyle.solid),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0.038.sw),
                                        child: Text(
                                          imageName,
                                          style: imageName ==
                                                  tr('Photo Card Journalist')
                                              ? medium_10_gray
                                              : medium_10_blue,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        height: 0.063.sh,
                                        width: 0.13.sw,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              topLeft: Radius.circular(5),
                                            ),
                                            color: AppColors.blue),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/icon_gallary.svg',
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ),
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
