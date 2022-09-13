import 'package:easy_localization/easy_localization.dart';
import 'package:expo_visitor/config/theme.dart';
import 'package:expo_visitor/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerFormEditing extends StatelessWidget {
  const CustomerFormEditing({
    Key? key,
    required this.hintText,
    required this.validator,
    required this.inputType,
    this.controller,
    this.onContentChanged,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final FieldValidator validator;
  final TextInputType inputType;
  final Function(String?)? onContentChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onContentChanged,
      validator: validator,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 0.044.sw,
          vertical: 0.01.sh,
        ),
        hintStyle: medium_10_gray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          //  borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColors.blue),
        ),
      ),
    );
  }
}
