import 'package:easy_localization/easy_localization.dart';
import 'package:expo_visitor/config/theme.dart';
import 'package:expo_visitor/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

class PhoneNumberFormEditing extends StatelessWidget {
  const PhoneNumberFormEditing(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.inputType})
      : super(key: key);

  final TextEditingController controller;

  final String hintText;
  final TextInputType inputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.blue,
      textAlign: TextAlign.left,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return tr('The field is required');
        }
        /** 
       *   if (!RegExp(
                '^[\\+]?[(]?[0-9]{3}[)]?[-\\s\\.]?[0-9]{3}[-\\s\\.]?[0-9]{4,6}\$')
            .hasMatch(value)) {
          return tr('Enter the correct value');
        }
        */
        if (!RegExp('^9[0-9]{8}\$').hasMatch(value)) {
          return tr('Enter the correct value');
        } else {
          return null;
        }
      },
      keyboardType: inputType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.subtitle, // <-- Change this
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "963+",
            style: TextStyle(color: AppColors.blue),
          ),
        ),
        hintTextDirection: ui.TextDirection.ltr,
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 9.w,
          vertical: 7.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          //  borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColors.blue),
        ),
      ),
    );
  }
}
