import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/styles/custom_colors.dart';
import '../core/styles/custom_dimensions.dart';
import '../core/styles/custom_text_styles.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? title;
  final bool isRequired;
  final bool isForgotPassword;
  final String? hint;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Function(String)? validator;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final AutovalidateMode? autoValidateMode;
  final Color? fillColor;
  final Color? hintColor;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final EdgeInsetsGeometry contentPadding;
  final bool activateFocus;
  final double borderRadius;
  final Color? borderColor;
  final bool readOnly;
  final bool formatInput;
  final Function()? onTap;
  final double borderWidth;
  final Function(String)? onChanged;
  final int? maxLength;
  final int? minLength;
  final String? labelText;
  final int minLine;
  final int maxLine;
  final int? maxTextLength;
  final List<TextInputFormatter>? formatters;
  final String? initialValue;
  final FloatingLabelBehavior? floatingLabelBehaviour;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final bool removeTitle;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final String? errorText;
  final bool showCounterText;

  const CustomTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.title,
    this.isRequired = false,
    this.isForgotPassword = false,
    this.hint,
    this.textAlign = TextAlign.left,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.validator,
    this.keyboardType,
    this.fillColor,
    this.formatInput = false,
    this.hintColor = CustomColors.blackColor,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.textCapitalization = TextCapitalization.none,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: 16.0,
      horizontal: 16.0,
    ),
    this.activateFocus = true,
    this.borderRadius = 8.0,
    this.borderColor,
    this.readOnly = false,
    this.onTap,
    this.borderWidth = 1.0,
    this.onChanged,
    this.maxLength,
    this.minLength,
    this.labelText,
    this.minLine = 1,
    this.maxLine = 1,
    this.maxTextLength,
    this.formatters,
    this.initialValue,
    this.floatingLabelBehaviour,
    this.labelStyle,
    this.hintStyle,
    this.removeTitle = false,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.errorText,
    this.showCounterText = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController get controller => widget.controller ?? TextEditingController();
  bool isObscure = true;

  void listenForMaxTextLength() {
    if (widget.maxTextLength != null) {
      if (controller.text.length > widget.maxTextLength!) {
        var text = controller.text;
        controller.text = text.substring(0, widget.maxTextLength!);
        controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscureText;
    controller.addListener(listenForMaxTextLength);
  }

  @override
  void dispose() {
    controller.removeListener(listenForMaxTextLength);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.removeTitle
            ? const SizedBox.shrink()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: widget.title ?? '',
                      style: CustomTextStyle.textStyleRegular.copyWith(
                        color: CustomColors.textFieldTitleColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: widget.isRequired ? '*' : '',
                          style: CustomTextStyle.textStyleRegular.copyWith(
                            color: CustomColors.redColor,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: widget.isForgotPassword
                        ? () {
                            //Navigator.pushNamed(context, ForgotPassword.id);
                          }
                        : null,
                    child: Text(
                      widget.isForgotPassword ? 'Forgot Password ?' : '',
                      style: CustomTextStyle.textStyleRegular.copyWith(
                        color: CustomColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            color: widget.validator != null || widget.showCounterText
                ? Colors.transparent
                : CustomColors.textFieldBackgroundColor,
          ),
          child: TextFormField(
            inputFormatters: widget.formatters,
            obscuringCharacter: "*",
            obscureText: widget.obscureText == false ? widget.obscureText : isObscure,
            textCapitalization: widget.textCapitalization,
            textInputAction: widget.textInputAction,
            autovalidateMode: widget.autoValidateMode,
            onChanged: widget.onChanged,
            textAlign: widget.textAlign,
            keyboardType: widget.keyboardType,
            controller: controller,
            focusNode: widget.focusNode,
            readOnly: widget.readOnly,
            maxLength: widget.maxLength,
            minLines: widget.minLine,
            maxLines: widget.maxLine,
            initialValue: widget.initialValue,
            validator: (value) {
              if (widget.validator != null) {
                return widget.validator!(value ?? "");
              }
            },
            onTap: widget.onTap,
            onFieldSubmitted: widget.onFieldSubmitted,
            onEditingComplete: widget.onEditingComplete,
            style: CustomTextStyle.textStyleRegular.copyWith(
              fontSize: 16,
              color: CustomColors.textFieldTitleColor,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              floatingLabelBehavior: widget.floatingLabelBehaviour,
              filled: true,
              errorMaxLines: 3,
              prefix: widget.prefix,
              prefixIcon: widget.prefixIcon,
              fillColor: CustomColors.whiteColor,
              //?? CustomColors.whiteColor,
              hintText: widget.hint,
              counterText: widget.showCounterText ? null : "",
              hintStyle: widget.hintStyle ??
                  CustomTextStyle.textStyleSubRegular.copyWith(
                    fontSize: CustomDimensions.smallTextSize,
                    color: widget.hintColor,
                  ),
              labelText: widget.labelText,
              labelStyle: widget.labelStyle ?? CustomTextStyle.textStyleSubRegular,
              errorStyle: CustomTextStyle.textStyleBody1.copyWith(
                color: CustomColors.errorTextColor,
                fontSize: 10,
              ),
              contentPadding: widget.contentPadding,
              // border: InputBorder.none,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: widget.activateFocus ? widget.borderWidth : 0,
                  color: widget.borderColor ?? CustomColors.textFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: widget.activateFocus ? widget.borderWidth : 0,
                  color: widget.borderColor ?? CustomColors.textFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: widget.activateFocus ? widget.borderWidth : 0,
                  color: CustomColors.textFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: widget.activateFocus ? widget.borderWidth : 0,
                  color: widget.activateFocus ? CustomColors.primaryColorAccent : CustomColors.textFieldBorderColor,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),

              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: widget.activateFocus ? widget.borderWidth : 0.0,
                  color: widget.activateFocus ? Colors.red : CustomColors.redColor,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: widget.activateFocus ? widget.borderWidth : 0.0,
                  color: widget.activateFocus ? Colors.red : CustomColors.redColor,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              errorText: widget.errorText,
              suffixIcon: widget.obscureText == false
                  ? widget.suffix != null
                      ? widget.suffix
                      : null
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 5.w, top: 10),
                        child: Text(
                          isObscure ? 'Show' : 'Hide',
                          style: CustomTextStyle.textStyleRegular.copyWith(
                            color: CustomColors.peer1Color,
                          ),
                        ),
                      )
                      /*: Text(
                              'Hide',
                              style:
                                  CustomTextStyle.textStyleRegular.copyWith(
                                color: CustomColors.peer2Color,
                              ),
                            ),*/
                      ),
            ),
          ),
        ),
      ],
    );
  }
}
