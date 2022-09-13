// ignore_for_file: file_names
import 'package:expo_visitor/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FillButton extends StatefulWidget {
  final String text;
  final bool isbig;
  final bool isfill;
  final void Function() ontap;
  final Color background;
  final double height;
  final double width;
  final bool haveborder;
  final Icon? icon;

  const FillButton(
      {Key? key,
      required this.text,
      required this.ontap,
      required this.isbig,
      required this.isfill,
      this.background = AppColors.blue,
      this.height = 10,
      this.haveborder = true,
      this.width = 10,
      this.icon})
      : super(key: key);

  @override
  FillButtonState createState() {
    return FillButtonState();
  }
}

class FillButtonState extends State<FillButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height.h,
        width: widget.isbig ? double.maxFinite : widget.width.w,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 0.2.sw),
            shadowColor: Colors.transparent,
            side: BorderSide(
              width: 2.0,
              color: widget.haveborder
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            primary: widget.isfill ? widget.background : Colors.transparent,
          ),
          onPressed: () {
            widget.ontap();
          },
          child: widget.icon == null
              ? Text(
                  widget.text,
                  style: widget.isfill
                      ? widget.background == AppColors.white
                          ? medium_12_blue
                          : medium_14_white
                      : medium_12_blue,
                  overflow: TextOverflow.visible,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.icon!,
                    SizedBox(
                      width: 1.sw,
                    ),
                    Text(
                      widget.text,
                      style: widget.isfill
                          ? widget.background == AppColors.white
                              ? medium_12_blue
                              : medium_14_white
                          : medium_12_blue,
                      overflow: TextOverflow.visible,
                    )
                  ],
                ),
        ));
  }
}
