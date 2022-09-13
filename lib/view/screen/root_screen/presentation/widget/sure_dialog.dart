// ignore_for_file: file_names, library_private_types_in_public_api

import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:expo_visitor/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/fill_button.dart';

class SureDialog extends StatefulWidget {
  final int okordelete;
  final String message;
  final Function()? delete;
  final Function()? ok;
  const SureDialog(
      {Key? key,
      required this.okordelete,
      required this.message,
      this.delete,
      this.ok})
      : super(key: key);

  @override
  _SureDialogDialogState createState() => _SureDialogDialogState();
}

class _SureDialogDialogState extends State<SureDialog> {
  late FillButton delete, back, ok;

  _back() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    delete = FillButton(
      text: "delete".tr(),
      ontap: () {
        widget.delete!();
      },
      isbig: false,
      isfill: true,
      background: AppColors.red,
      height: 0.6.h,
      width: 3.h,
      haveborder: false,
    );
    ok = FillButton(
      text: "ok".tr(),
      ontap: () {
        widget.ok!();
      },
      isbig: false,
      isfill: true,
      background: AppColors.white,
      height: 0.6.h,
      width: 3.h,
      haveborder: false,
    );
    back = FillButton(
      text: "undo".tr(),
      ontap: () => _back(),
      isbig: false,
      isfill: true,
      background: AppColors.white,
      height: 0.6.h,
      width: 3.h,
      haveborder: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        elevation: 2,
        backgroundColor: AppColors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.message,
                style: medium_14_white,
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [widget.okordelete == 2 ? delete : ok, back],
              )
            ],
          ),
        ),
      ),
    );
  }
}
