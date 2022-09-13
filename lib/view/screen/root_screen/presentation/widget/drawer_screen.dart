// ignore_for_file: file_names, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:expo_visitor/config/theme.dart';
import 'package:expo_visitor/main.dart';
import 'package:expo_visitor/view/screen/root_screen/presentation/widget/sure_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import 'sure_dialog.dart';

class CustomDrawer extends StatelessWidget {
  final Function(int) onItemTapped;
  final int type;
  const CustomDrawer({Key? key, required this.onItemTapped, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String powered = "Powered By ";
    String technologies = "DBTechnologies";

    return SizedBox(
      width: 0.6.sw,
      child: Drawer(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                color: AppColors.blue,
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      DrawerHeader(
                        //margin: EdgeInsets.only(bottom: 5.h),
                        child: Container(
                          width: 20.h,
                          height: 12.h,
                          //  padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.transparent
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/BuildexLogo.svg',
                            alignment: Alignment.center,
                            width: 20.h,
                            height: 7.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 2.w),
                        minLeadingWidth: 10.w,
                        leading: Icon(
                          Icons.home,
                          color: AppColors.white,
                          size: 7.w,
                        ),
                        title: Text(
                          "homepage".tr(),
                          style: medium_14_white,
                        ),
                        onTap: () {
                          onItemTapped(0);
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 2.w),
                        minLeadingWidth: 10.w,
                        leading: Icon(
                          Icons.agriculture,
                          color: AppColors.white,
                          size: 7.w,
                        ),
                        title: Text(
                          "myappointments".tr(),
                          style: medium_14_white,
                        ),
                        onTap: () {
                          onItemTapped(1);
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 2.w),
                        minLeadingWidth: 10.w,
                        leading: Icon(
                          Icons.qr_code_scanner_outlined,
                          color: AppColors.white,
                          size: 7.w,
                        ),
                        title: Text(
                          "scanqr".tr(),
                          style: medium_14_white,
                        ),
                        onTap: () {
                          onItemTapped(3);
                        },
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 2.w),
                        minLeadingWidth: 10.w,
                        leading: Icon(
                          Icons.qr_code_2_outlined,
                          color: AppColors.white,
                          size: 7.w,
                        ),
                        title: Text(
                          "viewqr".tr(),
                          style: medium_14_white,
                        ),
                        onTap: () {
                          onItemTapped(4);
                          Navigator.pop(context);
                        },
                      ),
                      Visibility(
                        visible: type == 1,
                        child: ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 2.w),
                            minLeadingWidth: 10.w,
                            leading: Icon(
                              Icons.timelapse,
                              color: AppColors.white,
                              size: 7.w,
                            ),
                            title: Text(
                              "agendaedit".tr(),
                              style: medium_14_white,
                            ),
                            onTap: () {}),
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 2.w),
                        minLeadingWidth: 10.w,
                        leading: Icon(
                          Icons.person_outline,
                          color: AppColors.white,
                          size: 7.w,
                        ),
                        title: Text(
                          tr('myprofile'),
                          style: medium_14_white,
                        ),
                        onTap: () {},
                      ),
                      const Expanded(child: SizedBox()),
                      Container(
                        height: 11.h,
                        margin: EdgeInsets.only(left: 2.w, right: 2.w),
                        child: const Divider(
                          color: AppColors.openblue,
                        ),
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 2.w),
                        minLeadingWidth: 10.w,
                        leading: Icon(
                          Icons.language,
                          color: AppColors.white,
                          size: 7.w,
                        ),
                        title: Text(
                          tr('Language'),
                          style: medium_14_white,
                        ),
                        onTap: () async {
                          if (lang) {
                            context.setLocale(const Locale('ar', 'AR'));
                            MyApp.of(context)
                                .setLocale(const Locale('ar', 'AR'));
                          } else {
                            context.setLocale(const Locale('en', 'US'));
                            MyApp.of(context)
                                .setLocale(const Locale('en', 'US'));
                          }
                        },
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 2.w),
                        minLeadingWidth: 10.w,
                        leading: Icon(
                          Icons.info_outline,
                          color: AppColors.white,
                          size: 7.w,
                        ),
                        title: Text(
                          "aboutapp".tr(),
                          style: medium_14_white,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 2.w),
                        minLeadingWidth: 10.w,
                        leading: Icon(
                          Icons.logout,
                          color: AppColors.white,
                          size: 7.w,
                        ),
                        title: Text(
                          "logout".tr(),
                          style: medium_14_white,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          showDialog(
                            barrierColor: AppColors.grey.withOpacity(0.4),
                            context: context,
                            builder: (context) {
                              return SureDialog(
                                okordelete: 1,
                                message: "areyousure".tr(),
                                ok: () {
                                  // logout(context);
                                },
                              );
                            },
                          );
                        },
                      ),
                      const Expanded(child: SizedBox()),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text.rich(
                              TextSpan(text: powered, children: <TextSpan>[
                                TextSpan(
                                  text: technologies,
                                  style: technologiesstylewhite,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launch('https://dbtglobal.com/home/');
                                    },
                                ),
                              ]),
                              style: pweredbystylewhite,
                            ),
                            Text(
                              "Version 1.0.2",
                              style: medium_14_white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
