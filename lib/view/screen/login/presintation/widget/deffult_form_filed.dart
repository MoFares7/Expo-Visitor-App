import 'package:expo_visitor/config/theme.dart';
import 'package:expo_visitor/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultFormEditing extends StatelessWidget {
  const DefaultFormEditing(
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
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 0.044.sw,
          vertical: 0.01.sh,
        ),
        hintText: hintText,
        hintStyle: medium_10_gray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColors.blue),
        ),
      ),
    );
  }
}
