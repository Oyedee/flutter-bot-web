import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/styles/custom_colors.dart';
import '../core/styles/custom_dimensions.dart';
import '../core/styles/custom_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.text = '',
    this.onPressed,
    this.color = CustomColors.secondaryColor,
    this.radius = 10.0,
    this.width = double.infinity,
    this.height = 48.0,
    this.textColor = CustomColors.whiteColor,
    this.titleColor = CustomColors.blackColor,
    this.titleBold = false,
    this.titleSize = CustomDimensions.buttonTextSize,
    this.font = 16,
    this.isLoading = false,
    this.childWidget = const SizedBox(),
    this.elevation = 0,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
  }) : super(key: key);

  final String text;
  final Function()? onPressed;
  final Color? color;
  final double radius;
  final double width;
  final double height;
  final Color textColor;
  final double font;
  final bool isLoading;
  final double elevation;
  final Color titleColor;
  final bool titleBold;
  final double titleSize;
  final Widget? childWidget;
  final double borderWidth;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: width,
      height: height,
      child: MaterialButton(
        elevation: elevation,
        color: color,
        onPressed: onPressed,
        disabledTextColor: CustomColors.whiteColor,
        disabledColor: CustomColors.secondaryColor.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 30.0.h,
                width: 30.0.w,
                child: const CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(CustomColors.primaryColor),
                  backgroundColor: CustomColors.whiteColor,
                  strokeWidth: 3,
                ))
            : text.isNotEmpty
                ? Text(
                    text,
                    style: CustomTextStyle.textStyleButton.copyWith(
                      fontWeight: titleBold ? FontWeight.w700 : FontWeight.w600,
                      fontSize: titleSize,
                      color: titleColor,
                    ),
                  )
                : childWidget,
      ),
    );
  }
}
