// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expo_visitor/config/theme.dart';
import 'package:expo_visitor/main.dart';
import 'package:expo_visitor/models/list_model_all.dart';

import 'package:expo_visitor/view/screen/login/presintation/widget/deffult_form_filed.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/main_appbar.dart';
import 'package:expo_visitor/view/screen/login/presintation/widget/main_appbar_bottom.dart';
import 'package:expo_visitor/view/screen/root_screen/presentation/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home_screen/presintation/home_screen.dart';

class FreeJopInformations extends StatefulWidget {
  const FreeJopInformations({Key? key}) : super(key: key);

  @override
  State<FreeJopInformations> createState() => _FreeJopInformationsState();
}

class _FreeJopInformationsState extends State<FreeJopInformations> {
  var special = null;
  TextEditingController sub_specialty_controller = TextEditingController();
  final ValueNotifier<bool> is_click = ValueNotifier(false);
  final ValueNotifier<bool> is_other = ValueNotifier(false);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    lang = currentLocal.languageCode == 'en';
    return Scaffold(
      backgroundColor: AppColors.scaffoldbackground,
      body: SafeArea(
        child: Align(
          alignment: lang ? Alignment.topLeft : Alignment.topRight,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.04.sw, vertical: 0.02.sh),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainAppBar(
                          title: tr('Record Your Data Work'),
                        ),
                        SizedBox(
                          height: 0.003.sh,
                        ),
                        Text(
                          tr('subtitle_company'),
                          style: medium_10_gray,
                          //  textAlign: TextAlign.center,
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
                                      fillColor: AppColors.scaffoldbackground,
                                      filled: true,
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0.04.sw,
                                        vertical: 0.016.sh,
                                      ),
                                      hintText: "Basic competence".tr(),
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
                                    value: special,
                                    onChanged: (String? newValue) {
                                      is_click.value = true;
                                      setState(() {
                                        special = newValue!;
                                      });
                                    },
                                    items: workItems),
                              )),
                        ),
                        ValueListenableBuilder<bool>(
                            valueListenable: is_click,
                            builder: (context, isYep, _) {
                              if (!isYep) {
                                return const SizedBox.shrink();
                              }
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        tr('Subspecialties'),
                                        style: medium_14_blue,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          is_click.value = !isYep;
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: AppColors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    tr('Can Select one or more'),
                                    style: medium_10_gray,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        //  horizontal: deffultPadding / 2,
                                        vertical: 0.02.sh),
                                    child: MultiSelectContainer(
                                        itemsDecoration: MultiSelectDecorations(
                                          decoration: BoxDecoration(
                                              color: Color(0xffEFF1F4),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          selectedDecoration: BoxDecoration(
                                              color: AppColors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          disabledDecoration: BoxDecoration(
                                              color: Colors.grey,
                                              border: Border.all(
                                                  color: Colors.grey[500]!),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                        ),
                                        items: [
                                          MultiSelectCard(
                                              value: 'mokaoulat',
                                              label: 'مقاولات',
                                              child: CardSpecilaize(
                                                title: 'مقاولات',
                                              )),
                                          MultiSelectCard(
                                              value: 'wall',
                                              label: 'دهان وغزل',
                                              child: CardSpecilaize(
                                                  title: 'دهان وغزل')),
                                          MultiSelectCard(
                                              value: 'JavaScript',
                                              label: 'بلاط',
                                              child: CardSpecilaize(
                                                title: 'بلاط',
                                              )),
                                          MultiSelectCard(
                                              value: 'electical',
                                              label: 'كهرباء',
                                              child: CardSpecilaize(
                                                title: 'كهرباء',
                                              )),
                                          MultiSelectCard(
                                              value: 'build',
                                              label: 'مواد بناء',
                                              child: CardSpecilaize(
                                                title: 'مواد بناء',
                                              )),
                                          MultiSelectCard(
                                              value: 'isteshar',
                                              label: 'استشارات',
                                              child: CardSpecilaize(
                                                title: 'استشارات',
                                              )),
                                          MultiSelectCard(
                                              value: 'home',
                                              label: 'تطوير عقاري',
                                              child: CardSpecilaize(
                                                title: 'تطوير عقاري',
                                              )),
                                          MultiSelectCard(
                                              value: 'trade',
                                              label: 'تجارة وتوزيع',
                                              child: CardSpecilaize(
                                                title: 'تجارة وتوزيع',
                                              )),
                                          MultiSelectCard(
                                            value: 'other',
                                            label: 'أخرى',
                                            child: CardSpecilaize(
                                              title: 'أخرى',
                                            ),
                                          ),
                                        ],
                                        onChange:
                                            (allSelectedItems, selectedItem) {
                                          if (selectedItem == "other") {
                                            print('dddddddddddddddddddd');
                                            is_other.value = true;

                                            //   print('ssssssssssssssss');
                                          }
                                        }),
                                  ),
                                ],
                              );
                            }),
                        ValueListenableBuilder<bool>(
                          valueListenable: is_other,
                          builder: (context, isYep, _) {
                            if (!isYep) {
                              print('1111111111111');
                              return const SizedBox.shrink();
                            }
                            print('22222222222222222');
                            return Column(
                              children: [
                                DefaultFormEditing(
                                    hintText: tr('Subspecialtie'),
                                    controller: sub_specialty_controller,
                                    inputType: TextInputType.text),
                              ],
                            );
                          },
                        )
                      ],
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardSpecilaize extends StatelessWidget {
  CardSpecilaize({
    Key? key,
    required this.title,
  }) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.06.sh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.07.sw),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              //  color: AppColors.subtitle,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
