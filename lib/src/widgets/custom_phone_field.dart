import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../core/styles/custom_colors.dart';
import '../core/styles/custom_text_styles.dart';

class CustomPhoneField extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final String initialCountryCode;
  final Function(Country)? onCountryChange;
  final String? initialValue;
  final bool isRequired;
  final bool? obscureText;
  const CustomPhoneField({
    Key? key,
    required this.controller,
    required this.title,
    required this.initialCountryCode,
    this.onCountryChange,
    this.initialValue,
    this.isRequired = false,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: CustomTextStyle.textStyleRegular.copyWith(
              color: CustomColors.textFieldTitleColor,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            children: [
              TextSpan(
                text: isRequired ? '*' : '',
                style: CustomTextStyle.textStyleRegular.copyWith(
                  color: CustomColors.redColor,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            //color: CustomColors.textFieldBackgroundColor,
          ),
          child: IntlPhoneField(
            initialValue: initialValue,
            textAlignVertical: TextAlignVertical.center,
            style: CustomTextStyle.textStyleRegular.copyWith(
              fontSize: 14,
              color: CustomColors.textFieldTitleColor,
            ),
            disableLengthCheck: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 15,
              ),
              labelStyle: CustomTextStyle.textStyleSubRegular,
              errorStyle: CustomTextStyle.textStyleBody1.copyWith(
                color: CustomColors.primaryColor,
              ),
              fillColor: CustomColors.textFieldBackgroundColor,
              filled: true,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.0,
                  color: CustomColors.textFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.0,
                  color: CustomColors.textFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.0,
                  color: CustomColors.textFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.0,
                  color: CustomColors.primaryColorAccent,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.0,
                  color: CustomColors.redColor,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1.0,
                  color: CustomColors.redColor,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            initialCountryCode: initialCountryCode,
            controller: controller,
            dropdownIcon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: CustomColors.primaryColor,
              size: 20,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            onChanged: (phone) {
              print(phone.completeNumber);
            },
            obscureText: obscureText ?? false,
            onCountryChanged: onCountryChange,
            dropdownTextStyle: CustomTextStyle.textStyleRegular.copyWith(
              fontSize: 14,
              color: CustomColors.textFieldTitleColor,
            ),
          ),
        ),
      ],
    );
  }
}
