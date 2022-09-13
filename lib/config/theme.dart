// ignore_for_file: file_names,, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppColors {
  static const white = Color(0xffFEFEFE);
  static const blue = Color(0xff002961);
  static const textblue = Color(0xff245291);
  static const grey = Color(0xffBFBFBF);
  static const grey2 = Color(0xff707070);
  static const grey3 = Color(0xffA7A7A7);
  static const red = Color(0xffB81420);
  static const orange = Color(0xffE94828);
  static const silver = Color(0xffE8EBF1);
  static const scaffoldbackground = Color(0xffF9F9F9);
  static const openblue = Color(0xff6888B3);
  static const opacitycolor = Color(0xff97867D);
  static const yellow = Color(0xffE7AD0E);
  static const bluegray = Color(0xffEFF1F4);
  static const subtitle = Color(0xffA6A6A6);
  static const item_drpoDownList = Color(0xff707070);
  static const black = Color.fromARGB(255, 11, 12, 13);
}

abstract class _LightColors {
  static const background = Colors.white;
}

/// Reference to the application theme.
abstract class AppTheme {
  static const accentColor = Color.fromARGB(255, 71, 182, 135);
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  /// Light theme and its settings.
  static ThemeData light() => ThemeData(
        primaryColor: Colors.white,
        dividerColor: Colors.black,
        // bottomAppBarColor: AppColors.primary1,
        brightness: Brightness.light,
        visualDensity: visualDensity,
        textTheme: GoogleFonts.cairoTextTheme()
            .apply(bodyColor: Color.fromARGB(255, 30, 29, 29)),
        backgroundColor: _LightColors.background,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.blue,
        ),
        scaffoldBackgroundColor: const Color(0xFFF1F1F1),
        cardColor: const Color.fromARGB(255, 253, 254, 255),
        appBarTheme: const AppBarTheme(
            foregroundColor: Color(0x003a3b3c),
            backgroundColor: AppColors.white),

        iconTheme: const IconThemeData(color: AppColors.white),
        colorScheme: const ColorScheme.light().copyWith(secondary: accentColor),
      );
}

//Cairo_Medium
final medium_8_blue = TextStyle(
    fontSize: 8.sp, color: AppColors.blue, fontWeight: FontWeight.w100);

final medium_8_gray = TextStyle(
    fontSize: 8.sp, color: AppColors.subtitle, overflow: TextOverflow.ellipsis);

final medium_10_gray = TextStyle(
  fontSize: 12.sp,
  color: AppColors.subtitle,
);

final medium_10_blue = TextStyle(
    fontSize: 10.sp, color: AppColors.blue, fontWeight: FontWeight.w100);

final medium_14_white = TextStyle(
    fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.w100);

final medium_12_blue = TextStyle(fontSize: 12.sp, color: AppColors.blue);
final medium_14_blue = TextStyle(fontSize: 14.sp, color: AppColors.blue);

//Cairo_SemiBold

final bold_14_blue = TextStyle(
    fontSize: 14.sp, color: AppColors.blue, fontWeight: FontWeight.bold);

final semibold_14_blue = TextStyle(fontSize: 14, color: AppColors.blue);

final semibold_14_white = TextStyle(fontSize: 14, color: AppColors.white);

final semibold_14_grey = TextStyle(fontSize: 14, color: AppColors.grey);

final semibold_20_red = TextStyle(fontSize: 20, color: AppColors.red);

final semibold_12_red = TextStyle(fontSize: 12, color: AppColors.red);

final TextStyle pweredbystyle = TextStyle(
  fontSize: 12,
  color: AppColors.blue,
);

final TextStyle pweredbystylewhite = TextStyle(
  fontFamily: 'Cairo_SemiBold',
  fontSize: 12,
  color: AppColors.white,
);

final TextStyle technologiesstyle = TextStyle(
  fontSize: 16,
  color: AppColors.blue,
  decoration: TextDecoration.underline,
);
final TextStyle technologies_withoun_underLine = TextStyle(
  fontSize: 12.sp,
  color: AppColors.blue,
);

final TextStyle technologiesstylewhite = TextStyle(
  fontSize: 12,
  color: AppColors.white,
  decoration: TextDecoration.underline,
);

final TextStyle item_dropDownList_style = TextStyle(
  fontSize: 10.sp,
  color: AppColors.item_drpoDownList,
);
