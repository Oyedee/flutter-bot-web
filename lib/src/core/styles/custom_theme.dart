import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_colors.dart';
import 'custom_text_styles.dart';

class AppTheme {
  static final defaultAppTheme = ThemeData(
    primaryColor: CustomColors.primaryColor,
    scaffoldBackgroundColor: CustomColors.whiteColor,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: CustomColors.primaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: CustomColors.primaryColor,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: CustomColors.whiteColor,
        fontFamily: 'Inter',
      ),
      iconTheme: const IconThemeData(
        color: CustomColors.whiteColor,
      ),
      actionsIconTheme: const IconThemeData(
        color: CustomColors.whiteColor,
      ),
    ),
    toggleableActiveColor: CustomColors.primaryColor,
    dividerTheme: const DividerThemeData(
      color: CustomColors.peer2Color,
      thickness: 0.5,
      space: 0.5,
      indent: 10,
      endIndent: 10,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: CustomColors.primaryColor,
      foregroundColor: CustomColors.whiteColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    textTheme: TextTheme(
      button: CustomTextStyle.textStyleButton,
      bodyText1: CustomTextStyle.textStyleBody1,
      bodyText2: CustomTextStyle.textStyleBody2,
    ),
    canvasColor: Colors.transparent,
    iconTheme: const IconThemeData(
      color: CustomColors.primaryColor,
    ),
    fontFamily: 'Inter',
    // pageTransitionsTheme: const PageTransitionsTheme(
    //   builders: {
    //     TargetPlatform.android: ZoomPageTransitionsBuilder(),
    //     TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    //   },
    // ),
  );
}
