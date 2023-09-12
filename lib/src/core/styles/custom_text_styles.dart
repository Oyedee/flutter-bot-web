import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_colors.dart';
import 'custom_dimensions.dart';

class CustomTextStyle {
  static const defaultFont = 'Inter';

  static final textStyleHeader = TextStyle(
    fontFamily: defaultFont,
    fontSize: CustomDimensions.headerText,
    fontWeight: FontWeight.w700,
    color: CustomColors.primaryColor,
  );

  static final textStyleSubHeader = TextStyle(
    fontFamily: defaultFont,
    fontSize: CustomDimensions.subHeaderText,
    fontWeight: FontWeight.w700,
    color: CustomColors.peer1ColorAccent,
  );

  static final textStyleRegular = TextStyle(
    fontFamily: defaultFont,
    fontSize: CustomDimensions.normalText,
    fontWeight: FontWeight.w500,
    color: CustomColors.peer1Color,
  );

  static final textStyleSubRegular = TextStyle(
    fontFamily: defaultFont,
    fontSize: CustomDimensions.smallText,
    fontWeight: FontWeight.w500,
    color: CustomColors.peer1ColorLight,
  );

  static final textStyleBody1 = TextStyle(
    fontFamily: defaultFont,
    fontSize: CustomDimensions.mediumTextSize,
    fontWeight: FontWeight.w400,
    color: CustomColors.primaryColorAccent,
  );

  static final textStyleBody2 = TextStyle(
    fontFamily: defaultFont,
    fontSize: CustomDimensions.bigTextSize,
    fontWeight: FontWeight.w600,
    color: CustomColors.primaryColorAccent,
  );

  static final textStyleButton = TextStyle(
    fontFamily: defaultFont,
    fontSize: CustomDimensions.buttonTextSize,
    fontWeight: FontWeight.w500,
    color: CustomColors.primaryColorAccent,
  );
}
